local targetMax = 256

function Init(abilityData) end

function onTimer(player, ability)
	if player:getVariable("EX023-maxY") == nil then 
		player:setVariable("EX023-maxY", 100)
		player:setVariable("EX023-passiveCount", 0)
	end
	
	if player:getVariable("EX023-maxY") < player:getPlayer():getLocation():getY() then player:setVariable("EX023-maxY", player:getPlayer():getLocation():getY()) end
	if player:getVariable("EX023-maxY") >= targetMax and player:getVariable("EX023-passiveCount") <= 0 then babel(player) end
	
	player:setVariable("EX023-passiveCount", player:getVariable("EX023-passiveCount") - 2)
end

function babel(player)
	player:setVariable("EX023-maxY", 20)
	player:setVariable("EX023-passiveCount", 6000)
	
	local players = util.getTableFromList(game.getPlayers())
	for i = 1, #players do
		if players[i]:getPlayer():getName() ~= player:getPlayer():getName() then
			players[i]:getPlayer():setHealth(0)
			players[i]:getPlayer():setVelocity(1, 0.5, 1)
		end
	end
end