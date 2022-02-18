function Init(abilityData)
	plugin.registerEvent(abilityData, "함정 설치", "PlayerInteractEvent", 300)
	plugin.registerEvent(abilityData, "EX033-activateTrap", "PlayerMoveEvent", 0)
end

function onEvent(funcTable)
	if funcTable[1] == "함정 설치" then addTrap(funcTable[3], funcTable[2], funcTable[4], funcTable[1]) end
	if funcTable[1] == "EX033-activateTrap" then activateTrap(funcTable[3], funcTable[2], funcTable[4], funcTable[1]) end
end

function onTimer(player, ability)
	if player:getVariable("EX033-trapLoc") == nil then 
		player:setVariable("EX033-trapLoc", { }) 
	end
	
	local loc = player:getVariable("EX033-trapLoc")
	game.sendActionBarMessage(player:getPlayer(), "§a설치된 트랩 수 §6: §b" .. #loc .. "개")
	for i = 1, #loc do
		player:getPlayer():spawnParticle(import("$.Particle").SMOKE_NORMAL, loc[i], 10, 0.1, 0.2, 0.1, 0.01)
	end
end


function addTrap(LAPlayer, event, ability, id)
	if event:getAction():toString() == "LEFT_CLICK_BLOCK" then
		if event:getItem() ~= nil then
			if game.isAbilityItem(event:getItem(), "IRON_INGOT") then
				if game.checkCooldown(LAPlayer, game.getPlayer(event:getPlayer()), ability, id) then
					local loc = LAPlayer:getVariable("EX033-trapLoc")
					table.insert(loc, event:getClickedBlock():getLocation():add(0.5, 1, 0.5))
					LAPlayer:setVariable("EX033-trapLoc", loc) 
					
					local itemStack = { newInstance("$.inventory.ItemStack", {event:getMaterial(), 1}) }
					event:getPlayer():getInventory():removeItem(itemStack)
				end
			end
		end
	end
end

function activateTrap(LAPlayer, event, ability, id)
	local loc = LAPlayer:getVariable("EX033-trapLoc")
	for i = 1, #loc do
		if event:getPlayer():getWorld():getEnvironment() == loc[i]:getWorld():getEnvironment() and
		loc[i]:distance(event:getPlayer():getLocation()) <= 1.5 then
			if game.checkCooldown(LAPlayer, LAPlayer, ability, id) then
				loc[i]:getWorld():createExplosion(loc[i], 1.5)
				game.sendMessage(event:getPlayer(), "§c트랩이 작동 되었습니다!")
				
				table.remove(loc, i)
				LAPlayer:setVariable("EX033-trapLoc", loc) 
				return 0
			end
		end
	end
end