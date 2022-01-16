local material = import("$.Material")

function Init(abilityData) end

function onTimer(player, ability)
	if player:getVariable("EX028-isEnable") ~= true then 
		player:setVariable("EX028-isEnable", true) 
		game.broadcastMessage("§4방패 싫어! §c능력에 의해 방패 사용이 불가능합니다.")
	end
	
	noShield()
end

function noShield()
	local players = util.getTableFromList(game.getPlayers())
	for i = 1, #players do
		players[i]:getPlayer():getInventory():remove(material.SHIELD)
	end
end