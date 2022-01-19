local effect = import("$.potion.PotionEffectType")

function Init(abilityData) end

function onTimer(player, ability)
	addEffect(player:getPlayer())
end

function addEffect(player)
	local players = util.getTableFromList(game.getPlayers())
	local allPlayers = util.getTableFromList(game.getAllPlayers())
	
	if #players <= 2 or (#allPlayers / #players) >= 4.0 then player:addPotionEffect(newInstance("$.potion.PotionEffect", {effect.INCREASE_DAMAGE, 20, 2})) 
	else player:addPotionEffect(newInstance("$.potion.PotionEffect", {effect.WEAKNESS, 20, 1}))end
end