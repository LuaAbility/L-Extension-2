local attribute = import("$.attribute.Attribute")
local effect = import("$.potion.PotionEffectType")

function Init(abilityData)
	plugin.registerEvent(abilityData, "기생", "EntityDamageEvent", 660)
end

function onEvent(funcTable)
	if funcTable[1] == "기생" and funcTable[2]:getEventName() == "EntityDamageByEntityEvent" then useAbility(funcTable[3], funcTable[2], funcTable[4], funcTable[1]) end
end

function onTimer(player, ability)
	if player:getVariable("EX031-isInvisible") == nil then 
		player:setVariable("EX031-isInvisible", 0)
	end
	local count = player:getVariable("EX031-isInvisible")
	if count > 0 then 
		teleport(player)
		if count % 40 == 0 then takeHealth(player) end
		count = count - 2 
		if count <= 0 then stopHiding(player) end
	end
	player:setVariable("EX031-isInvisible", count)
end

function useAbility(LAPlayer, event, ability, id)
	if event:getDamager():getType():toString() == "PLAYER" and event:getEntity():getType():toString() == "PLAYER" then
		local item = { event:getDamager():getInventory():getItemInMainHand() }
		if game.isAbilityItem(item[1], "IRON_INGOT") then
			if game.checkCooldown(LAPlayer, game.getPlayer(event:getDamager()), ability, id) then
				LAPlayer:setVariable("EX031-isInvisible", 200)
				LAPlayer:setVariable("EX031-player", game.getPlayer(event:getEntity()))
				LAPlayer:setVariable("EX031-gamemode", event:getDamager():getGameMode())
			end
		end
	end
end

function takeHealth(player)
	local targetPlayer = player:getVariable("EX031-player")
	if targetPlayer ~= nil then
		targetPlayer:getPlayer():damage(1)
		
		local finalHealth = player:getPlayer():getHealth() + 1
		if player:getPlayer():getAttribute(attribute.GENERIC_MAX_HEALTH):getValue() < finalHealth then 
			finalHealth = player:getPlayer():getAttribute(attribute.GENERIC_MAX_HEALTH):getValue()
		end
		player:getPlayer():setHealth(finalHealth)
	end
end

function teleport(player)
	local targetPlayer = player:getVariable("EX031-player")
	if targetPlayer ~= nil then
		if targetPlayer:getPlayer():isDead() then 
			stopHiding(player)
		else
			player:getPlayer():setGameMode(import("$.GameMode").SPECTATOR)
			player:getPlayer():setSpectatorTarget(targetPlayer:getPlayer())
		end
	end
end

function stopHiding(player)
	game.sendMessage(player:getPlayer(), "§1[§b기생충§1] §b능력 시전 시간이 종료되었습니다. (기생)")	
	player:setVariable("EX031-isInvisible", 0)
	player:removeVariable("EX031-player")
	player:getPlayer():setGameMode(player:getVariable("EX031-gamemode"))
	
	player:getPlayer():addPotionEffect(newInstance("$.potion.PotionEffect", {effect.SLOW, 100, 9}))
end