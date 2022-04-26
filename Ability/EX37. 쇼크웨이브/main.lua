function Init(abilityData)
	plugin.registerEvent(abilityData, "충격파 발사", "PlayerInteractEvent", 1200)
end

function onEvent(funcTable)
	if funcTable[1] == "충격파 발사" then shootShockwave(funcTable[3], funcTable[2], funcTable[4], funcTable[1]) end
end

function shootShockwave(LAPlayer, event, ability, id)
	if event:getAction():toString() == "RIGHT_CLICK_AIR" or event:getAction():toString() == "RIGHT_CLICK_BLOCK" then
		if event:getItem() ~= nil then
			if game.isAbilityItem(event:getItem(), "IRON_INGOT") then
				if game.checkCooldown(LAPlayer, game.getPlayer(event:getPlayer()), ability, id) then
					shockwave(event:getPlayer())
				end
			end
		end
	end
end


function shockwave(player)
	local firstLoc = newInstance("$.util.Vector", {player:getLocation():getX(), player:getLocation():getY(), player:getLocation():getZ()})
	local dir = player:getLocation():getDirection()
	
	for i = 5, 30 do
		util.runLater(function()
			local defaultLoc = newInstance("$.Location", {player:getWorld(), firstLoc:getX() + (dir:getX() * i), firstLoc:getY() + (dir:getY() * i), firstLoc:getZ() + (dir:getZ() * i)})
			
			player:getWorld():createExplosion(defaultLoc, 2.5)
			player:getWorld():spawnParticle(import("$.Particle").EXPLOSION_HUGE, defaultLoc, 1, 0.5, 0.5, 0.5, 0.05)
		end, (i - 5))
	end
end


