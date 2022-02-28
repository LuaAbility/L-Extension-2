function Init(abilityData)
	plugin.registerEvent(abilityData, "EX029-fishing", "PlayerFishEvent", 0)
end

function onEvent(funcTable)
	if funcTable[1] == "EX029-fishing" then fishing(funcTable[3], funcTable[2], funcTable[4], funcTable[1]) end
end

function fishing(LAPlayer, event, ability, id)
	local state = import("$.event.player.PlayerFishEvent$State")

	if event:getState() == state.CAUGHT_FISH then
		if game.checkCooldown(LAPlayer, game.getPlayer(event:getPlayer()), ability, id) then
			local players = util.getTableFromList(game.getPlayers())
			local targetPlayer = players[util.random(1, #players)]
			while targetPlayer:getPlayer():getName() == event:getPlayer():getName() do targetPlayer = players[util.random(1, #players)] end
			
			if game.targetPlayer(LAPlayer, targetPlayer) then
				targetPlayer:getPlayer():teleport(event:getHook():getLocation())
				local velocity = event:getPlayer():getLocation():toVector():subtract(targetPlayer:getPlayer():getLocation():toVector()):multiply(0.175)
				targetPlayer:getPlayer():setVelocity(velocity)
			end
		end
	end
end