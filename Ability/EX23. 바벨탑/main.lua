function Init(abilityData) end

function onTimer(player, ability)
	if player:getVariable("EX023-minY") == nil then 
		player:setVariable("EX023-minY", 100)
		player:setVariable("EX023-maxY", 100)
		player:setVariable("EX023-passiveCount", 18000)
	end
	if player:getVariable("EX023-minY") > player:getPlayer():getLocation():getY() then player:setVariable("EX023-minY", player:getPlayer():getLocation():getY()) end
	if player:getVariable("EX023-maxY") < player:getPlayer():getLocation():getY() then player:setVariable("EX023-maxY", player:getPlayer():getLocation():getY()) end
	
	local targetMin = 2
	local targetMax = 256
	if string.find(plugin.getServer():getBukkitVersion(), "1.18") then 
		targetMin = -63
		targetMax = 319		
	end
	
	player:setVariable("EX023-passiveCount", player:getVariable("EX023-passiveCount") - 2)
	
	if player:getVariable("EX023-minY") <= targetMin and player:getVariable("EX023-maxY") >= targetMax and player:getVariable("EX023-passiveCount") <= 0 then babel(player) end
end

function babel(player)
	player:setVariable("EX023-minY", 100)
	player:setVariable("EX023-maxY", 100)
	player:setVariable("EX023-passiveCount", 18000)
	local players = util.getTableFromList(game.getPlayers())

	for i = 1, #players do
		if players[i]:getPlayer():getName() ~= player:getPlayer():getName() then
			players[i]:getPlayer():setHealth(0)
		end
	end
end