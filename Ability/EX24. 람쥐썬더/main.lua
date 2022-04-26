function Init(abilityData)
	plugin.registerEvent(abilityData, "번개 생성", "PlayerInteractEvent", 1800)
	plugin.registerEvent(abilityData, "EX024-checkLightning", "EntityDamageEvent", 0)
end

function onEvent(funcTable)
	if funcTable[1] == "번개 생성" then shootLightning(funcTable[3], funcTable[2], funcTable[4], funcTable[1]) end
	if funcTable[1] == "EX024-checkLightning" and funcTable[2]:getEventName() == "EntityDamageByEntityEvent" then checkLightning(funcTable[3], funcTable[2], funcTable[4], funcTable[1]) end
end

function shootLightning(LAPlayer, event, ability, id)
	if event:getAction():toString() == "RIGHT_CLICK_AIR" or event:getAction():toString() == "RIGHT_CLICK_BLOCK" then
		if event:getItem() ~= nil then
			if game.isAbilityItem(event:getItem(), "IRON_INGOT") then
				if game.checkCooldown(LAPlayer, game.getPlayer(event:getPlayer()), ability, id) then
					lightning(event:getPlayer(), LAPlayer)
				end
			end
		end
	end
end

function checkLightning(LAPlayer, event, ability, id)
	local damager = util.getRealDamager(event:getDamager())
	if damager ~= nil and damager:getType():toString() == "LIGHTNING" and event:getEntity():getType():toString() == "PLAYER" then
		local tables = LAPlayer:getVariable("EX024-lightning")
		if tables then
			for i = 1, #tables do
				if tables[i] == damager then
					if event:getEntity():equals(LAPlayer:getPlayer()) then event:setCancelled(true) end
				end
			end
		end
	end
end


function lightning(player, LAPlayer)
	local firstLoc = newInstance("org.bukkit.util.Vector", {player:getLocation():getX(), player:getLocation():getY(), player:getLocation():getZ()})
	local dir = player:getLocation():getDirection()
	LAPlayer:setVariable("EX024-lightning", { })
	
	for i = 5, 25 do
		util.runLater(function()
			local defaultLoc = newInstance("org.bukkit.util.Vector", {firstLoc:getX() + (dir:getX() * util.random(5, 25)), firstLoc:getY(), firstLoc:getZ() + (dir:getZ() * util.random(5, 25))})
			local newloc = newInstance("org.bukkit.util.Vector", {defaultLoc:getX() + (dir:getZ() * util.random(-2, 2)), defaultLoc:getY(), defaultLoc:getZ() + (dir:getX() * util.random(-2, 2))})
			
			table.insert(LAPlayer:getVariable("EX024-lightning"), player:getWorld():spawnEntity(newInstance("org.bukkit.Location", {player:getWorld(), newloc:getX(), newloc:getY(), newloc:getZ()}), import("$.entity.EntityType").LIGHTNING))
		end, (i - 5) * 2)
	end
end


