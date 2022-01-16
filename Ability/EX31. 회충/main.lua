local entityType = import("$.entity.EntityType")

function Init(abilityData)
	plugin.registerEvent(abilityData, "EX031-giveHunger", "EntityDamageEvent", 0)
	plugin.registerEvent(abilityData, "EX031-giveArrow", "PlayerInteractEvent", 0)
end

function onEvent(funcTable)
	if funcTable[1] == "EX031-giveHunger" and funcTable[2]:getEventName() == "EntityDamageByEntityEvent" then giveHunger(funcTable[3], funcTable[2], funcTable[4], funcTable[1]) end
	if funcTable[1] == "EX031-giveArrow" then giveArrow(funcTable[3], funcTable[2], funcTable[4], funcTable[1]) end
end

function giveHunger(LAPlayer, event, ability, id)
	if event:getDamager():getType() == entityType.ARROW and event:getEntity():getType() == entityType.PLAYER and event:getDamager():getShooter():getType() == entityType.PLAYER then
		if game.checkCooldown(LAPlayer, game.getPlayer(event:getDamager():getShooter()), ability, id) then
			local foodLevel = event:getEntity():getFoodLevel()
			foodLevel = foodLevel - 2
			if foodLevel < 0 then foodLevel = 0 end
			event:getEntity():setFoodLevel(foodLevel)
		end
	end
end

function giveArrow(LAPlayer, event, ability, id)
	if event:getAction():toString() == "RIGHT_CLICK_AIR" or event:getAction():toString() == "RIGHT_CLICK_BLOCK" then
		local arrow = {newInstance("$.inventory.ItemStack", { import("$.Material").ARROW, 1 }) }
		if event:getItem() ~= nil and event:getPlayer():getFoodLevel() >= 2 then
			if event:getItem():getType():toString() == "BOW" and event:getPlayer():getInventory():containsAtLeast(arrow[1], 1) == false then
				if game.checkCooldown(LAPlayer, game.getPlayer(event:getPlayer()), ability, id) then
					event:getPlayer():getInventory():addItem(arrow)
					event:getPlayer():setFoodLevel(event:getPlayer():getFoodLevel() - 2)
					event:getPlayer():getWorld():spawnParticle(import("$.Particle").SMOKE_NORMAL, event:getPlayer():getLocation():add(0,1,0), 100, 0.5, 1, 0.5)
				end
			end
		end
	end
end