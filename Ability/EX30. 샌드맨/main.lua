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
		if game.checkCooldown(LAPlayer, game.getPlayer(event:getEntity()), ability, id) and event:getEntity():getWorld():getWorldBorder():isInside(event:getEntity():getLocation()) then
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
				local players = util.getTableFromList(game.getTeamManager():getOpponentTeam(LAPlayer, false))
				for i = 1, #players do
					if getLookingAt(event:getPlayer(), players[i]:getPlayer(), 0.95) then
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
	util.setBlockType(floor1Block2, material.SAND)
	
	local floor1Block3 = target:getWorld():getBlockAt(target:clone():add(-2,2,0))
	util.setBlockType(floor1Block3, material.SAND)
	
	local floor1Block4 = target:getWorld():getBlockAt(target:clone():add(-2,2,1))
	util.setBlockType(floor1Block4, material.SAND)
	
	local floor1Block6 = target:getWorld():getBlockAt(target:clone():add(-1,2,-2))
	util.setBlockType(floor1Block6, material.SAND)
	
	local floor1Block7 = target:getWorld():getBlockAt(target:clone():add(-1,2,-1))
	util.setBlockType(floor1Block7, material.SAND)
	
	local floor1Block8 = target:getWorld():getBlockAt(target:clone():add(-1,2,0))
	util.setBlockType(floor1Block8, material.SAND)
	
	local floor1Block9 = target:getWorld():getBlockAt(target:clone():add(-1,2,1))
	util.setBlockType(floor1Block9, material.SAND)
	
	local floor1Block10 = target:getWorld():getBlockAt(target:clone():add(-1,2,2))
	util.setBlockType(floor1Block10, material.SAND)
	
	local floor1Block11 = target:getWorld():getBlockAt(target:clone():add(0,2,-2))
	util.setBlockType(floor1Block11, material.SAND)
	
	local floor1Block12 = target:getWorld():getBlockAt(target:clone():add(0,2,-1))
	util.setBlockType(floor1Block12, material.SAND)
	
	local floor1Block13 = target:getWorld():getBlockAt(target:clone():add(0,2,0))
	util.setBlockType(floor1Block13, material.SAND)
	
	local floor1Block14 = target:getWorld():getBlockAt(target:clone():add(0,2,1))
	util.setBlockType(floor1Block14, material.SAND)
	
	local floor1Block15 = target:getWorld():getBlockAt(target:clone():add(0,2,2))
	util.setBlockType(floor1Block15, material.SAND)
	
	local floor1Block16 = target:getWorld():getBlockAt(target:clone():add(1,2,-2))
	util.setBlockType(floor1Block16, material.SAND)
	
	local floor1Block17 = target:getWorld():getBlockAt(target:clone():add(1,2,-1))
	util.setBlockType(floor1Block17, material.SAND)
	
	local floor1Block18 = target:getWorld():getBlockAt(target:clone():add(1,2,0))
	util.setBlockType(floor1Block18, material.SAND)
	
	local floor1Block19 = target:getWorld():getBlockAt(target:clone():add(1,2,1))
	util.setBlockType(floor1Block19, material.SAND)
	
	local floor1Block20 = target:getWorld():getBlockAt(target:clone():add(1,2,2))
	util.setBlockType(floor1Block20, material.SAND)
	
	local floor1Block22 = target:getWorld():getBlockAt(target:clone():add(2,2,-1))
	util.setBlockType(floor1Block22, material.SAND)
	
	local floor1Block23 = target:getWorld():getBlockAt(target:clone():add(2,2,0))
	util.setBlockType(floor1Block23, material.SAND)
	
	local floor1Block24 = target:getWorld():getBlockAt(target:clone():add(2,2,1))
	util.setBlockType(floor1Block24, material.SAND)
	
	local floor2Block2 = target:getWorld():getBlockAt(target:clone():add(-2,3,-1))
	util.setBlockType(floor2Block2, material.SAND)
	
	local floor2Block3 = target:getWorld():getBlockAt(target:clone():add(-2,3,0))
	util.setBlockType(floor2Block3, material.SAND)
	
	local floor2Block4 = target:getWorld():getBlockAt(target:clone():add(-2,3,1))
	util.setBlockType(floor2Block4, material.SAND)
	
	local floor2Block6 = target:getWorld():getBlockAt(target:clone():add(-1,3,-2))
	util.setBlockType(floor2Block6, material.SAND)
	
	local floor2Block7 = target:getWorld():getBlockAt(target:clone():add(-1,3,-1))
	util.setBlockType(floor2Block7, material.SAND)
	
	local floor2Block8 = target:getWorld():getBlockAt(target:clone():add(-1,3,0))
	util.setBlockType(floor2Block8, material.SAND)
	
	local floor2Block9 = target:getWorld():getBlockAt(target:clone():add(-1,3,1))
	util.setBlockType(floor2Block9, material.SAND)
	
	local floor2Block10 = target:getWorld():getBlockAt(target:clone():add(-1,3,2))
	util.setBlockType(floor2Block10, material.SAND)
	
	local floor2Block11 = target:getWorld():getBlockAt(target:clone():add(0,3,-2))
	util.setBlockType(floor2Block11, material.SAND)
	
	local floor2Block12 = target:getWorld():getBlockAt(target:clone():add(0,3,-1))
	util.setBlockType(floor2Block12, material.SAND)
	
	local floor2Block13 = target:getWorld():getBlockAt(target:clone():add(0,3,0))
	util.setBlockType(floor2Block13, material.SAND)
	
	local floor2Block14 = target:getWorld():getBlockAt(target:clone():add(0,3,1))
	util.setBlockType(floor2Block14, material.SAND)
	
	local floor2Block15 = target:getWorld():getBlockAt(target:clone():add(0,3,2))
	util.setBlockType(floor2Block15, material.SAND)
	
	local floor2Block16 = target:getWorld():getBlockAt(target:clone():add(1,3,-2))
	util.setBlockType(floor2Block16, material.SAND)
	
	local floor2Block17 = target:getWorld():getBlockAt(target:clone():add(1,3,-1))
	util.setBlockType(floor2Block17, material.SAND)
	
	local floor2Block18 = target:getWorld():getBlockAt(target:clone():add(1,3,0))
	util.setBlockType(floor2Block18, material.SAND)
	
	local floor2Block19 = target:getWorld():getBlockAt(target:clone():add(1,3,1))
	util.setBlockType(floor2Block19, material.SAND)
	
	local floor2Block20 = target:getWorld():getBlockAt(target:clone():add(1,3,2))
	util.setBlockType(floor2Block20, material.SAND)
	
	local floor2Block22 = target:getWorld():getBlockAt(target:clone():add(2,3,-1))
	util.setBlockType(floor2Block22, material.SAND)
	
	local floor2Block23 = target:getWorld():getBlockAt(target:clone():add(2,3,0))
	util.setBlockType(floor2Block23, material.SAND)
	
	local floor2Block24 = target:getWorld():getBlockAt(target:clone():add(2,3,1))
	util.setBlockType(floor2Block24, material.SAND)
	
	
	local floor3Block1 = target:getWorld():getBlockAt(target:clone():add(-1,4,-1))
	util.setBlockType(floor3Block1, material.SAND)
	
	local floor3Block2 = target:getWorld():getBlockAt(target:clone():add(-1,4,0))
	util.setBlockType(floor3Block2, material.SAND)
	
	local floor3Block3 = target:getWorld():getBlockAt(target:clone():add(-1,4,1))
	util.setBlockType(floor3Block3, material.SAND)
	
	local floor3Block4 = target:getWorld():getBlockAt(target:clone():add(0,4,-1))
	util.setBlockType(floor3Block4, material.SAND)
	
	local floor3Block5 = target:getWorld():getBlockAt(target:clone():add(0,4,0))
	util.setBlockType(floor3Block5, material.SAND)
	
	local floor3Block6 = target:getWorld():getBlockAt(target:clone():add(0,4,1))
	util.setBlockType(floor3Block6, material.SAND)
	
	local floor3Block7 = target:getWorld():getBlockAt(target:clone():add(1,4,-1))
	util.setBlockType(floor3Block7, material.SAND)
	
	local floor3Block8 = target:getWorld():getBlockAt(target:clone():add(1,4,0))
	util.setBlockType(floor3Block8, material.SAND)
	
	local floor3Block9 = target:getWorld():getBlockAt(target:clone():add(1,4,1))
	util.setBlockType(floor3Block9, material.SAND)
	
	local floor4Block = target:getWorld():getBlockAt(target:clone():add(0,5,0))
	util.setBlockType(floor4Block, material.SAND)
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