function Init(abilityData) end

function onTimer(player, ability)
	setSaturation(player:getPlayer())
end

function Reset(player, ability)
	player:getPlayer():setSaturatedRegenRate(10)
end

function setSaturation(player)
	player:setSaturation(1)
	player:setFoodLevel(20)
	player:setSaturatedRegenRate(3)
end