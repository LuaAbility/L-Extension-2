local material = import("$.Material")

function Init(abilityData)
	plugin.registerEvent(abilityData, "모래 생성", "PlayerInteractEvent", 240)
	plugin.registerEvent(abilityData, "EX030-removeDamage", "EntityDamageEvent", 0)
end

function onEvent(funcTable)
	if funcTable[1] == "모래 생성" then sand(funcTable[3], funcTable[2], funcTable[4], funcTable[1]) end
	if funcTable[1] == "EX030-removeDamage" then removeDamage(funcTable[3], funcTable[2], funcTable[4], funcTable[1]) end
end

function removeDamage(LAPlayer, event, ability, id)
	if event:getCause():toString() == "SUFFOCATION" and event:getEntity():getType():toString() == "PLAYER" then
		if game.checkCooldown(LAPlayer, game.getPlayer(event:getEntity()), ability, id) then
			event:setCancelled(true)
		end
	end
end

function sand(LAPlayer, event, ability, id)
	if event:getItem() ~= nil then
		if game.isAbilityItem(event:getItem(), "IRON_INGOT") then
			if event:getAction():toString() == "RIGHT_CLICK_AIR" or event:getAction():toString() == "RIGHT_CLICK_BLOCK" then
				if game.checkCooldown(LAPlayer, game.getPlayer(event:getPlayer()), ability, id) then 
					summonSand(event:getPlayer():getLocation()) 
				end
			elseif event:getAction():toString() == "LEFT_CLICK_AIR" or event:getAction():toString() == "LEFT_CLICK_BLOCK" then
				local players = util.getTableFromList(game.getPlayers())
				for i = 1, #players do
					if getLookingAt(event:getPlayer(), players[i]:getPlayer(), 0.98) then
						if game.checkCooldown(LAPlayer, game.getPlayer(event:getPlayer()), ability, id) then 
							if game.targetPlayer(LAPlayer, players[i]) then
								summonSand(players[i]:getPlayer():getLocation()) 
							else 
								ability:resetCooldown(id)
							end
						end
						return 0
					end
				end
			end
		end
	end
end

function summonSand(target)
	local floor1Block2 = target:getWorld():getBlockAt(target:clone():add(-2,2,-1))
	floor1Block2:setType(material.SAND)
	
	local floor1Block3 = target:getWorld():getBlockAt(target:clone():add(-2,2,0))
	floor1Block3:setType(material.SAND)
	
	local floor1Block4 = target:getWorld():getBlockAt(target:clone():add(-2,2,1))
	floor1Block4:setType(material.SAND)
	
	local floor1Block6 = target:getWorld():getBlockAt(target:clone():add(-1,2,-2))
	floor1Block6:setType(material.SAND)
	
	local floor1Block7 = target:getWorld():getBlockAt(target:clone():add(-1,2,-1))
	floor1Block7:setType(material.SAND)
	
	local floor1Block8 = target:getWorld():getBlockAt(target:clone():add(-1,2,0))
	floor1Block8:setType(material.SAND)
	
	local floor1Block9 = target:getWorld():getBlockAt(target:clone():add(-1,2,1))
	floor1Block9:setType(material.SAND)
	
	local floor1Block10 = target:getWorld():getBlockAt(target:clone():add(-1,2,2))
	floor1Block10:setType(material.SAND)
	
	local floor1Block11 = target:getWorld():getBlockAt(target:clone():add(0,2,-2))
	floor1Block11:setType(material.SAND)
	
	local floor1Block12 = target:getWorld():getBlockAt(target:clone():add(0,2,-1))
	floor1Block12:setType(material.SAND)
	
	local floor1Block13 = target:getWorld():getBlockAt(target:clone():add(0,2,0))
	floor1Block13:setType(material.SAND)
	
	local floor1Block14 = target:getWorld():getBlockAt(target:clone():add(0,2,1))
	floor1Block14:setType(material.SAND)
	
	local floor1Block15 = target:getWorld():getBlockAt(target:clone():add(0,2,2))
	floor1Block15:setType(material.SAND)
	
	local floor1Block16 = target:getWorld():getBlockAt(target:clone():add(1,2,-2))
	floor1Block16:setType(material.SAND)
	
	local floor1Block17 = target:getWorld():getBlockAt(target:clone():add(1,2,-1))
	floor1Block17:setType(material.SAND)
	
	local floor1Block18 = target:getWorld():getBlockAt(target:clone():add(1,2,0))
	floor1Block18:setType(material.SAND)
	
	local floor1Block19 = target:getWorld():getBlockAt(target:clone():add(1,2,1))
	floor1Block19:setType(material.SAND)
	
	local floor1Block20 = target:getWorld():getBlockAt(target:clone():add(1,2,2))
	floor1Block20:setType(material.SAND)
	
	local floor1Block22 = target:getWorld():getBlockAt(target:clone():add(2,2,-1))
	floor1Block22:setType(material.SAND)
	
	local floor1Block23 = target:getWorld():getBlockAt(target:clone():add(2,2,0))
	floor1Block23:setType(material.SAND)
	
	local floor1Block24 = target:getWorld():getBlockAt(target:clone():add(2,2,1))
	floor1Block24:setType(material.SAND)
	
	local floor2Block2 = target:getWorld():getBlockAt(target:clone():add(-2,3,-1))
	floor2Block2:setType(material.SAND)
	
	local floor2Block3 = target:getWorld():getBlockAt(target:clone():add(-2,3,0))
	floor2Block3:setType(material.SAND)
	
	local floor2Block4 = target:getWorld():getBlockAt(target:clone():add(-2,3,1))
	floor2Block4:setType(material.SAND)
	
	local floor2Block6 = target:getWorld():getBlockAt(target:clone():add(-1,3,-2))
	floor2Block6:setType(material.SAND)
	
	local floor2Block7 = target:getWorld():getBlockAt(target:clone():add(-1,3,-1))
	floor2Block7:setType(material.SAND)
	
	local floor2Block8 = target:getWorld():getBlockAt(target:clone():add(-1,3,0))
	floor2Block8:setType(material.SAND)
	
	local floor2Block9 = target:getWorld():getBlockAt(target:clone():add(-1,3,1))
	floor2Block9:setType(material.SAND)
	
	local floor2Block10 = target:getWorld():getBlockAt(target:clone():add(-1,3,2))
	floor2Block10:setType(material.SAND)
	
	local floor2Block11 = target:getWorld():getBlockAt(target:clone():add(0,3,-2))
	floor2Block11:setType(material.SAND)
	
	local floor2Block12 = target:getWorld():getBlockAt(target:clone():add(0,3,-1))
	floor2Block12:setType(material.SAND)
	
	local floor2Block13 = target:getWorld():getBlockAt(target:clone():add(0,3,0))
	floor2Block13:setType(material.SAND)
	
	local floor2Block14 = target:getWorld():getBlockAt(target:clone():add(0,3,1))
	floor2Block14:setType(material.SAND)
	
	local floor2Block15 = target:getWorld():getBlockAt(target:clone():add(0,3,2))
	floor2Block15:setType(material.SAND)
	
	local floor2Block16 = target:getWorld():getBlockAt(target:clone():add(1,3,-2))
	floor2Block16:setType(material.SAND)
	
	local floor2Block17 = target:getWorld():getBlockAt(target:clone():add(1,3,-1))
	floor2Block17:setType(material.SAND)
	
	local floor2Block18 = target:getWorld():getBlockAt(target:clone():add(1,3,0))
	floor2Block18:setType(material.SAND)
	
	local floor2Block19 = target:getWorld():getBlockAt(target:clone():add(1,3,1))
	floor2Block19:setType(material.SAND)
	
	local floor2Block20 = target:getWorld():getBlockAt(target:clone():add(1,3,2))
	floor2Block20:setType(material.SAND)
	
	local floor2Block22 = target:getWorld():getBlockAt(target:clone():add(2,3,-1))
	floor2Block22:setType(material.SAND)
	
	local floor2Block23 = target:getWorld():getBlockAt(target:clone():add(2,3,0))
	floor2Block23:setType(material.SAND)
	
	local floor2Block24 = target:getWorld():getBlockAt(target:clone():add(2,3,1))
	floor2Block24:setType(material.SAND)
	
	
	local floor3Block1 = target:getWorld():getBlockAt(target:clone():add(-1,4,-1))
	floor3Block1:setType(material.SAND)
	
	local floor3Block2 = target:getWorld():getBlockAt(target:clone():add(-1,4,0))
	floor3Block2:setType(material.SAND)
	
	local floor3Block3 = target:getWorld():getBlockAt(target:clone():add(-1,4,1))
	floor3Block3:setType(material.SAND)
	
	local floor3Block4 = target:getWorld():getBlockAt(target:clone():add(0,4,-1))
	floor3Block4:setType(material.SAND)
	
	local floor3Block5 = target:getWorld():getBlockAt(target:clone():add(0,4,0))
	floor3Block5:setType(material.SAND)
	
	local floor3Block6 = target:getWorld():getBlockAt(target:clone():add(0,4,1))
	floor3Block6:setType(material.SAND)
	
	local floor3Block7 = target:getWorld():getBlockAt(target:clone():add(1,4,-1))
	floor3Block7:setType(material.SAND)
	
	local floor3Block8 = target:getWorld():getBlockAt(target:clone():add(1,4,0))
	floor3Block8:setType(material.SAND)
	
	local floor3Block9 = target:getWorld():getBlockAt(target:clone():add(1,4,1))
	floor3Block9:setType(material.SAND)
	
	local floor4Block = target:getWorld():getBlockAt(target:clone():add(0,5,0))
	floor4Block:setType(material.SAND)
end

function getLookingAt(player, player1, checkDouble)
	local eye = player:getEyeLocation()
	local toEntity = player1:getEyeLocation():toVector():subtract(eye:toVector())
	local dot = toEntity:normalize():dot(eye:getDirection())
	
	if player:getWorld():getEnvironment() ~= player1:getWorld():getEnvironment() then dot = 0
	elseif player:getPlayer():getLocation():distance(player1:getLocation()) > 40 then dot = 0 end

	if not player:hasLineOfSight(player1) then dot = 0 end
	
	return dot > checkDouble
end