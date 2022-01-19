local material = import("$.Material")
local key = import("$.NamespacedKey")

function Init(abilityData)
	plugin.registerEvent(abilityData, "EX034-cancelBreak", "BlockBreakEvent", 0)
	plugin.registerEvent(abilityData, "EX034-respawn", "PlayerRespawnEvent", 0)
end

function onEvent(funcTable)
	if funcTable[1] == "EX034-cancelBreak" then cancelBreak(funcTable[3], funcTable[2], funcTable[4], funcTable[1]) end
	if funcTable[1] == "EX034-respawn" then giveKey(funcTable[3]:getPlayer()) end
end

function onTimer(player, ability)
	if player:getVariable("EX034-chestKey") == nil then 
		player:setVariable("EX034-chestKey", player:getPlayer():getUniqueId():toString()) 
		player:setVariable("EX034-passiveCount", 0) 
		giveKey(player:getPlayer())
	end
	
	local count = player:getVariable("EX034-passiveCount")
	if count >= 3600 then 
		count = 0
		giveChest(player:getPlayer())
	end
	count = count + 2
	player:setVariable("EX034-passiveCount", count)
end

function giveKey(player)
	local itemStack = newInstance("$.inventory.ItemStack", {material.AMETHYST_SHARD, 1})
	local itemMeta = itemStack:getItemMeta()
	itemMeta:setDisplayName(game.getPlayer(player):getVariable("EX034-chestKey"))
	itemStack:setItemMeta(itemMeta)
	
	player:getWorld():dropItemNaturally(player:getLocation(), itemStack)
end

function giveChest(player)
	for i = 1, 3 do
		local loc = newInstance("$.Location", {player:getWorld(), player:getLocation():getX() + util.random(-20, 20), 0, player:getLocation():getZ() + util.random(-20, 20)})
		loc:setY(loc:getWorld():getHighestBlockAt(loc:getX(), loc:getZ()):getLocation():getY() + 1)
		
		local chest = loc:getWorld():getBlockAt(loc)
		chest:setType(material.CHEST)
		
		local chestData = chest:getState()
		chestData:setLock(game.getPlayer(player):getVariable("EX034-chestKey"))
		
		local randomNumber = util.random(1, 19)
		if randomNumber == 1 then chestData:setLootTable(plugin.getServer():getLootTable(key:minecraft("chests/abandoned_mineshaft")))
		elseif randomNumber == 2 then chestData:setLootTable(plugin.getServer():getLootTable(key:minecraft("chests/bastion_bridge")))
		elseif randomNumber == 3 then chestData:setLootTable(plugin.getServer():getLootTable(key:minecraft("chests/bastion_hoglin_stable")))
		elseif randomNumber == 4 then chestData:setLootTable(plugin.getServer():getLootTable(key:minecraft("chests/bastion_other")))
		elseif randomNumber == 5 then chestData:setLootTable(plugin.getServer():getLootTable(key:minecraft("chests/bastion_treasure")))
		elseif randomNumber == 6 then chestData:setLootTable(plugin.getServer():getLootTable(key:minecraft("chests/buried_treasure")))
		elseif randomNumber == 7 then chestData:setLootTable(plugin.getServer():getLootTable(key:minecraft("chests/desert_pyramid")))
		elseif randomNumber == 8 then chestData:setLootTable(plugin.getServer():getLootTable(key:minecraft("chests/end_city_treasure")))
		elseif randomNumber == 9 then chestData:setLootTable(plugin.getServer():getLootTable(key:minecraft("chests/igloo_chest")))
		elseif randomNumber == 10 then chestData:setLootTable(plugin.getServer():getLootTable(key:minecraft("chests/jungle_temple")))
		elseif randomNumber == 11 then chestData:setLootTable(plugin.getServer():getLootTable(key:minecraft("chests/nether_bridge")))
		elseif randomNumber == 12 then chestData:setLootTable(plugin.getServer():getLootTable(key:minecraft("chests/pillager_outpost")))
		elseif randomNumber == 13 then chestData:setLootTable(plugin.getServer():getLootTable(key:minecraft("chests/ruined_portal")))
		elseif randomNumber == 14 then chestData:setLootTable(plugin.getServer():getLootTable(key:minecraft("chests/simple_dungeon")))
		elseif randomNumber == 15 then chestData:setLootTable(plugin.getServer():getLootTable(key:minecraft("chests/spawn_bonus_chest")))
		elseif randomNumber == 16 then chestData:setLootTable(plugin.getServer():getLootTable(key:minecraft("chests/stronghold_corridor")))
		elseif randomNumber == 17 then chestData:setLootTable(plugin.getServer():getLootTable(key:minecraft("chests/stronghold_crossing")))
		elseif randomNumber == 18 then chestData:setLootTable(plugin.getServer():getLootTable(key:minecraft("chests/stronghold_library")))
		elseif randomNumber == 19 then chestData:setLootTable(plugin.getServer():getLootTable(key:minecraft("chests/woodland_mansion"))) end
		
		chestData:update()
		loc:getWorld():playSound(loc, import("$.Sound").BLOCK_ANVIL_LAND, 1, 1)
	end
	
	game.sendMessage(player, "§2[§a보급 지원§2] §a보급 상자가 생성되었습니다!")
end

function cancelBreak(LAPlayer, event, ability, id)
	if event:getBlock():getType() == material.CHEST then
		if event:getBlock():getState():getLock() == LAPlayer:getVariable("EX034-chestKey") then
			if event:getPlayer() == nil then
				if game.checkCooldown(LAPlayer, LAPlayer, ability, id) then
					event:setCancelled(true)
				end
			elseif event:getPlayer() ~= LAPlayer:getPlayer() then
				if game.checkCooldown(LAPlayer, LAPlayer, ability, id) then
					event:setCancelled(true)
					game.sendMessage(event:getPlayer(), "§c잠긴 상자는 부술 수 없습니다!")
				end
			end
		end
	end
end