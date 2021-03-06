function Init(abilityData)
	plugin.registerEvent(abilityData, "EX027-toVoid", "EntityDamageEvent", 2000)
end

function onEvent(funcTable)
	if funcTable[1] == "EX027-toVoid" and funcTable[2]:getEventName() == "EntityDamageByEntityEvent" then toVoid(funcTable[3], funcTable[2], funcTable[4], funcTable[1]) end
end

function toVoid(LAPlayer, event, ability, id)
	if event:getDamager():getType() == import("$.entity.EntityType").PLAYER and event:getEntity():getType() == import("$.entity.EntityType").PLAYER then
		local item = event:getDamager():getInventory():getItemInMainHand()
		if game.isAbilityItem(item, "IRON_INGOT") then
			if game.checkCooldown(LAPlayer, game.getPlayer(event:getDamager()), ability, id) then
				local beforeLoc = event:getEntity():getLocation()
				local afterLoc = beforeLoc:clone()
				afterLoc:setY(-256)
				
				event:getEntity():getWorld():spawnParticle(import("$.Particle").SMOKE_NORMAL, event:getEntity():getLocation():add(0,1,0), 200, 0.5, 1, 0.5, 0.1)
				event:getEntity():getWorld():playSound(event:getEntity():getLocation(), import("$.Sound").ITEM_CHORUS_FRUIT_TELEPORT, 0.5, 1.2)
				event:getEntity():teleport(afterLoc)
				event:getEntity():getWorld():playSound(event:getEntity():getLocation(), import("$.Sound").ITEM_CHORUS_FRUIT_TELEPORT, 0.5, 1.2)
				
				util.runLater(function() 
					event:getEntity():setFallDistance(0)
					event:getEntity():teleport(beforeLoc)
					event:getEntity():getWorld():spawnParticle(import("$.Particle").SMOKE_NORMAL, event:getEntity():getLocation():add(0,1,0), 200, 0.5, 1, 0.5, 0.1)
					event:getEntity():getWorld():playSound(event:getEntity():getLocation(), import("$.Sound").ITEM_CHORUS_FRUIT_TELEPORT, 0.5, 1.2)
				end, 20)
			end
		end
	end
end