local targetMax = 256

function Init(abilityData) end

function onTimer(player, ability)
	if player:getVariable("EX023-maxY") == nil then 
		player:setVariable("EX023-maxY", 100)
		player:setVariable("EX023-passiveCount", 0)
	end
	
	local count = player:getVariable("EX023-passiveCount")
	if count > 0 then
		count = count - 1
		
		if count == 0 then
            game.sendMessage(player:getPlayer(), "§1[§b바벨탑§1] §b재사용 대기시간이 종료되었습니다.")
            player:getPlayer():playSound(player:getPlayer(), import("$.Sound").ENTITY_PLAYER_LEVELUP, 0.5, 2)
        elseif count == 20 then
			game.sendMessage(player:getPlayer(), "§1[§b바벨탑§1] §b남은 시간 : 1초")
			player:getPlayer():playSound(player:getPlayer(), import("$.Sound").ENTITY_EXPERIENCE_ORB_PICKUP, 0.5, 2)
        elseif count == 40 then
			game.sendMessage(player:getPlayer(), "§1[§b바벨탑§1] §b남은 시간 : 2초")
			player:getPlayer():playSound(player:getPlayer(), import("$.Sound").ENTITY_EXPERIENCE_ORB_PICKUP, 0.5, 2)
        elseif count == 60 then
			game.sendMessage(player:getPlayer(), "§1[§b바벨탑§1] §b남은 시간 : 3초")
			player:getPlayer():playSound(player:getPlayer(), import("$.Sound").ENTITY_EXPERIENCE_ORB_PICKUP, 0.5, 2)
        elseif count == 80 then
			game.sendMessage(player:getPlayer(), "§1[§b바벨탑§1] §b남은 시간 : 4초")
			player:getPlayer():playSound(player:getPlayer(), import("$.Sound").ENTITY_EXPERIENCE_ORB_PICKUP, 0.5, 2)
        elseif count == 100 then
			game.sendMessage(player:getPlayer(), "§1[§b바벨탑§1] §b남은 시간 : 5초")
			player:getPlayer():playSound(player:getPlayer(), import("$.Sound").ENTITY_EXPERIENCE_ORB_PICKUP, 0.5, 2)
		end
        
		player:setVariable("EX023-passiveCount", count)
	else 
		if player:getVariable("EX023-maxY") < player:getPlayer():getLocation():getY() then player:setVariable("EX023-maxY", player:getPlayer():getLocation():getY()) end
		if player:getVariable("EX023-maxY") >= targetMax then babel(player) end
	end
end

function babel(player)
	player:setVariable("EX023-maxY", 100)
	player:setVariable("EX023-passiveCount", 6000)
	
	local players = util.getTableFromList(game.getPlayers())
	for i = 1, #players do
		if players[i]:getPlayer():getName() ~= player:getPlayer():getName() and game.targetPlayer(player, players[i]) then
			players[i]:getPlayer():setHealth(0)
		end
	end
end