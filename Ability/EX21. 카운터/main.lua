local types = import("$.entity.EntityType")

function Init(abilityData)
	plugin.registerEvent(abilityData, "카운터 모드", "PlayerInteractEvent", 300)
	plugin.registerEvent(abilityData, "EX021-checkCounterMode", "EntityDamageEvent", 0)
end

function onEvent(funcTable)
	if funcTable[1] == "카운터 모드" then startCounter(funcTable[3], funcTable[2], funcTable[4], funcTable[1]) end
	if funcTable[1] == "EX021-checkCounterMode" and funcTable[2]:getEventName() == "EntityDamageByEntityEvent" then checkCounterMode(funcTable[3], funcTable[2], funcTable[4], funcTable[1]) end
end

function onTimer(player, ability)
	if player:getVariable("EX021-counterTime") == nil then player:setVariable("EX021-counterTime", 0) end
	local count = player:getVariable("EX021-counterTime")
	if count > 0 then 
		count = count - 1 
		game.sendActionBarMessage(player:getPlayer(), "§a카운터 모드")
		if count <= 0 then game.sendActionBarMessage(player:getPlayer(), "§c카운터 모드 종료!") end
	end
	player:setVariable("EX021-counterTime", count)
end

function startCounter(LAPlayer, event, ability, id)
	if event:getAction():toString() == "RIGHT_CLICK_AIR" or event:getAction():toString() == "RIGHT_CLICK_BLOCK" then
		if game.checkCooldown(LAPlayer, game.getPlayer(event:getPlayer()), ability, id) then
			LAPlayer:setVariable("EX021-counterTime", 20)
		end
	end
end

function checkCounterMode(LAPlayer, event, ability, id)
	if event:getDamager():getType():toString() == "PLAYER" and event:getEntity():getType():toString() == "PLAYER" then
		if LAPlayer:getVariable("EX021-counterTime") > 0 then
			if game.checkCooldown(LAPlayer, game.getPlayer(event:getEntity()), ability, id) then
				LAPlayer:setVariable("EX021-counterTime", -10)
				game.sendActionBarMessage(event:getEntity(), "§c카운터 모드 종료!")
				event:getEntity():getWorld():spawnParticle(import("$.Particle").SMOKE_NORMAL, event:getEntity():getLocation():add(0,1,0), 500, 0.5, 1, 0.5, 0.9)
				event:getEntity():getWorld():playSound(event:getEntity():getLocation(), import("$.Sound").ENTITY_WITHER_SHOOT, 0.2, 1)
				event:getDamager():damage(event:getDamage(), event:getEntity())
				event:setCancelled(true)
			end
		end
	end
end