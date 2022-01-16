function Init(abilityData)
	plugin.registerEvent(abilityData, "EX024-lightning", "PlayerInteractEvent", 1800)
end

function onEvent(funcTable)
	if funcTable[1] == "EX024-lightning" then shootLightning(funcTable[3], funcTable[2], funcTable[4], funcTable[1]) end
end

function shootLightning(LAPlayer, event, ability, id)
	if event:getAction():toString() == "RIGHT_CLICK_AIR" or event:getAction():toString() == "RIGHT_CLICK_BLOCK" then
		if event:getItem() ~= nil then
			if game.isAbilityItem(event:getItem(), "IRON_INGOT") then
				if game.checkCooldown(LAPlayer, game.getPlayer(event:getPlayer()), ability, id) then
					lightning(event:getPlayer())
				end
			end
		end
	end
end


function lightning(player)
	local firstLoc = newInstance("org.bukkit.util.Vector", {player:getLocation():getX(), player:getLocation():getY(), player:getLocation():getZ()})
	local dir = player:getLocation():getDirection()
	
	for i = 5, 25 do
		util.runLater(function()
			local defaultLoc = newInstance("org.bukkit.util.Vector", {firstLoc:getX() + (dir:getX() * util.random(5, 25)), firstLoc:getY(), firstLoc:getZ() + (dir:getZ() * util.random(5, 25))})
			local newloc = newInstance("org.bukkit.util.Vector", {defaultLoc:getX() + (dir:getZ() * util.random(-2, 2)), defaultLoc:getY(), defaultLoc:getZ() + (dir:getX() * util.random(-2, 2))})
			
			player:getWorld():spawnEntity(newInstance("org.bukkit.Location", {player:getWorld(), newloc:getX(), newloc:getY(), newloc:getZ()}), import("$.entity.EntityType").LIGHTNING)
		end, (i - 5) * 2)
	end
end


