local entityType = import("$.entity.EntityType")

function Init(abilityData)
	plugin.registerEvent(abilityData, "EX032-summonMob", "PlayerInteractEvent", 200)
end

function onEvent(funcTable)
	if funcTable[1] == "EX032-summonMob" then summonMob(funcTable[3], funcTable[2], funcTable[4], funcTable[1]) end
end

function summonMob(LAPlayer, event, ability, id)
	if event:getAction():toString() == "LEFT_CLICK_AIR" or event:getAction():toString() == "LEFT_CLICK_BLOCK" then
		if event:getItem() ~= nil then
			if game.isAbilityItem(event:getItem(), "IRON_INGOT") then
				if game.checkCooldown(LAPlayer, game.getPlayer(event:getPlayer()), ability, id) then
					if event:getItem():getAmount() >= 64 then
						local entity = event:getPlayer():getWorld():spawnEntity(event:getPlayer():getLocation(), entityType.IRON_GOLEM)
						util.runLater(function() if entity:isValid() then entity:remove() end end, 600)
						event:getPlayer():getWorld():playSound(event:getPlayer():getLocation(), import("$.Sound").ENTITY_ZOMBIE_VILLAGER_CURE, 0.5, 1)
						if util.random() <= 0.1 then event:getItem():setAmount(event:getItem():getAmount() - 1) end
					else
						local entity = event:getPlayer():getWorld():spawnEntity(event:getPlayer():getLocation(), entityType.SNOWMAN)
						util.runLater(function() if entity:isValid() then entity:remove() end end, 600)
						event:getPlayer():getWorld():playSound(event:getPlayer():getLocation(), import("$.Sound").ENTITY_ITEM_PICKUP, 0.5, 1)
					end
					event:getPlayer():getWorld():spawnParticle(import("$.Particle").SMOKE_NORMAL, event:getPlayer():getLocation():add(0,1,0), 500, 0.5, 1, 0.5)
				end
			end
		end
	end
end