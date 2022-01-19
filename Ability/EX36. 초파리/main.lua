local material = import("$.Material")

function Init(abilityData)
	plugin.registerEvent(abilityData, "EX036-respawn", "PlayerRespawnEvent", 0)
	plugin.registerEvent(abilityData, "EX036-giveFirework", "PlayerInteractEvent", 10)
end

function onEvent(funcTable)
	if funcTable[1] == "EX036-respawn" then giveElytra(funcTable[3]:getPlayer()) end
	if funcTable[1] == "EX036-giveFirework" then giveFirework(funcTable[3], funcTable[2], funcTable[4], funcTable[1]) end
end

function onTimer(player, ability)
	if player:getVariable("EX036-isActive") == nil then 
		player:setVariable("EX036-isActive", true) 
		giveElytra(player:getPlayer())
	end
end

function giveElytra(player)
	local itemStack = newInstance("$.inventory.ItemStack", {material.ELYTRA, 1})
	local itemMeta = itemStack:getItemMeta()
	itemMeta:setUnbreakable(true)
	itemMeta:addEnchant(import("$.enchantments.Enchantment").VANISHING_CURSE, 1, true)
	itemMeta:addEnchant(import("$.enchantments.Enchantment").BINDING_CURSE, 1, true)
	itemStack:setItemMeta(itemMeta)
	
	player:getInventory():setChestplate(itemStack)
end

function giveFirework(LAPlayer, event, ability, id)
	if event:getAction():toString() == "RIGHT_CLICK_AIR" or event:getAction():toString() == "RIGHT_CLICK_BLOCK" then
		if event:getItem() ~= nil then
			if game.isAbilityItem(event:getItem(), "IRON_INGOT") then
				if game.checkCooldown(LAPlayer, game.getPlayer(event:getPlayer()), ability, id, false) then
					local itemStack = { newInstance("$.inventory.ItemStack", {event:getMaterial(), 1}) }
					event:getPlayer():getInventory():removeItem(itemStack)
					
					local addItemStack = newInstance("$.inventory.ItemStack", {material.FIREWORK_ROCKET, 1})
					event:getPlayer():getWorld():dropItemNaturally(event:getPlayer():getLocation(), addItemStack)
				end
			end
		end
	end
end