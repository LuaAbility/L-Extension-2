function Init(abilityData)
	plugin.registerEvent(abilityData, "집단 광기", "PlayerInteractEvent", 1200)
end

function onEvent(funcTable)
	if funcTable[1] == "집단 광기" then useAbility(funcTable[3], funcTable[2], funcTable[4], funcTable[1]) end
end

function onTimer(player, ability)
	if player:getVariable("EX039-abilityTime") == nil then player:setVariable("EX039-abilityTime", 0) end
	local count = player:getVariable("EX039-abilityTime")
	if count > 0 then 
		if count % 10 == 0 then randomDir(player) end
		count = count - 1 
		if count <= 0 then game.sendMessage(player:getPlayer(), "§2[§a집단 광기§2] §a능력 시전 시간이 종료되었습니다. (집단 광기)") end
	end
	player:setVariable("EX039-abilityTime", count)
end

function useAbility(LAPlayer, event, ability, id)
	if event:getAction():toString() == "RIGHT_CLICK_AIR" or event:getAction():toString() == "RIGHT_CLICK_BLOCK" then
		if event:getItem() ~= nil then
			if game.isAbilityItem(event:getItem(), "IRON_INGOT") then
				if game.checkCooldown(LAPlayer, game.getPlayer(event:getPlayer()), ability, id) then
					LAPlayer:setVariable("EX039-abilityTime", 100)
				end
			end 
		end
	end
end

function randomDir(player)
	local players = util.getTableFromList(game.getPlayers())
	for i = 1, #players do
		if game.targetPlayer(player, players[i], false) then
			local loc = players[i]:getPlayer():getLocation()
			loc:setPitch(util.random(-90, 90))
			loc:setYaw(util.random(0, 360))
			players[i]:getPlayer():teleport(loc)
			players[i]:getPlayer():getWorld():spawnParticle(import("$.Particle").SMOKE_NORMAL, players[i]:getPlayer():getLocation():add(0,1,0), 100, 0.5, 1, 0.5, 0.05)
			players[i]:getPlayer():getWorld():playSound(players[i]:getPlayer():getLocation(), import("$.Sound").ENTITY_ITEM_PICKUP, 0.25, 1)
		end
	end
end
