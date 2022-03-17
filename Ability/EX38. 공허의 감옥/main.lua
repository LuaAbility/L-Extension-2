function Init(abilityData)
	plugin.registerEvent(abilityData, "감옥 생성", "PlayerInteractEvent", 2000)
	plugin.registerEvent(abilityData, "EX038-cancelDamage", "EntityDamageEvent", 0)
	plugin.registerEvent(abilityData, "EX038-cancelAttack", "EntityDamageEvent", 0)
	plugin.registerEvent(abilityData, "EX038-stopMove", "PlayerMoveEvent", 0)
end

function onEvent(funcTable)
	if funcTable[1] == "감옥 생성" then useAbility(funcTable[3], funcTable[2], funcTable[4], funcTable[1]) end
	if funcTable[1] == "EX038-cancelDamage" and funcTable[2]:getEventName() == "EntityDamageEvent" then cancelDamage(funcTable[3], funcTable[2], funcTable[4], funcTable[1]) end
	if funcTable[1] == "EX038-cancelAttack" and funcTable[2]:getEventName() == "EntityDamageByEntityEvent" then cancelAttack(funcTable[3], funcTable[2], funcTable[4], funcTable[1]) end
	if funcTable[1] == "EX038-stopMove" then stopMove(funcTable[3], funcTable[2], funcTable[4], funcTable[1]) end
end

function onTimer(player, ability)
	if player:getVariable("EX038-abilityTime") == nil then player:setVariable("EX038-abilityTime", 0) end
	local count = player:getVariable("EX038-abilityTime")
	if count > 0 then 
		count = count - 1 
		if count <= 0 then endOfAbility(player)
		else cancelData(player) end
	end
	player:setVariable("EX038-abilityTime", count)
end

function useAbility(LAPlayer, event, ability, id)
	if game.getPlayer(event:getPlayer()) ~= nil and game.getPlayer(event:getPlayer()):getVariable("EX038-gameMode") ~= nil then
		event:setCancelled(true)
	elseif event:getAction():toString() == "RIGHT_CLICK_AIR" or event:getAction():toString() == "RIGHT_CLICK_BLOCK" then
		if event:getItem() ~= nil then
			if game.isAbilityItem(event:getItem(), "IRON_INGOT") then
				if game.checkCooldown(LAPlayer, game.getPlayer(event:getPlayer()), ability, id) then
					LAPlayer:setVariable("EX038-abilityTime", 100)
				end
			end
		end
	end
end

function endOfAbility(player)
	local players = util.getTableFromList(game.getPlayers())
	for i = 1, #players do
		if players[i]:getVariable("EX038-abilityLock") ~= nil then
			players[i]:setVariable("abilityLock", players[i]:getVariable("EX038-abilityLock"))
		end
		
		if players[i]:getVariable("EX038-gameMode") ~= nil then
			players[i]:getPlayer():setGameMode(players[i]:getVariable("EX038-gameMode")) 
			players[i]:removeVariable("EX038-gameMode")
		end
	end
	
	game.sendMessage(player:getPlayer(), "§2[§a공허의 감옥§2] §a능력 시전 시간이 종료되었습니다. (감옥 생성)") 
end

function cancelData(player)
	local players = util.getTableFromList(game.getPlayers())
	for i = 1, #players do
		if player:getPlayer():getWorld():getEnvironment() == players[i]:getPlayer():getWorld():getEnvironment() and
		players[i]:getPlayer():getLocation():distance(player:getPlayer():getLocation()) <= 7.5 and game.targetPlayer(player, players[i], false) then 
			if player:getPlayer() ~= players[i]:getPlayer() then
				if players[i]:getVariable("EX038-abilityLock") == nil then 
					if players[i]:getVariable("abilityLock") == nil then players[i]:setVariable("EX038-abilityLock", false) 
					else players[i]:setVariable("EX038-abilityLock", players[i]:getVariable("abilityLock")) end
				end
				players[i]:setVariable("abilityLock", true)
			end
			
			if players[i]:getVariable("EX038-gameMode") == nil then players[i]:setVariable("EX038-gameMode", players[i]:getPlayer():getGameMode()) end
			players[i]:getPlayer():setGameMode(import("$.GameMode").ADVENTURE)
		else 
			if players[i]:getVariable("EX038-abilityLock") ~= nil then
				players[i]:setVariable("abilityLock", players[i]:getVariable("EX038-abilityLock"))
				players[i]:removeVariable("EX038-abilityLock")
			end
			
			if players[i]:getVariable("EX038-gameMode") ~= nil then
				players[i]:getPlayer():setGameMode(players[i]:getVariable("EX038-gameMode")) 
				players[i]:removeVariable("EX038-gameMode")
			end
		end
	end
	player:getPlayer():getWorld():spawnParticle(import("$.Particle").SMOKE_LARGE, player:getPlayer():getLocation(), 50, 3, 0, 3, 0.01)
end

function cancelDamage(LAPlayer, event, ability, id)
	if event:getEntity():getType():toString() == "PLAYER" then
		if game.getPlayer(event:getEntity()) ~= nil and game.getPlayer(event:getEntity()):getVariable("EX038-gameMode") ~= nil then
			event:setCancelled(true)
		end
	end
end

function cancelAttack(LAPlayer, event, ability, id)
	if event:getEntity():getType():toString() == "PLAYER" and event:getDamager():getType():toString() == "PLAYER" then
		if game.getPlayer(event:getDamager()) ~= nil and game.getPlayer(event:getDamager()):getVariable("EX038-gameMode") ~= nil then
			event:setCancelled(true)
		end
	end
	
	if event:getDamager():getType():toString() == "PLAYER" and event:getEntity():getType():toString() == "PLAYER" then
		if game.getPlayer(event:getEntity()) ~= nil and game.getPlayer(event:getEntity()):getVariable("EX038-gameMode") ~= nil then
			event:setCancelled(true)
		end
	end
end

function stopMove(player, event, ability, id)
	if game.getPlayer(event:getPlayer()) ~= nil and game.getPlayer(event:getPlayer()):getVariable("EX038-gameMode") ~= nil then
		event:setCancelled(true)
	end
end

