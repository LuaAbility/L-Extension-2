local material = import("$.Material")

function Init(abilityData)
	plugin.registerEvent(abilityData, "감옥 생성", "PlayerInteractEvent", 1600)
end

function onEvent(funcTable)
	if funcTable[1] == "감옥 생성" then seeCheck(funcTable[3], funcTable[2], funcTable[4], funcTable[1]) end
end

function seeCheck(LAPlayer, event, ability, id)
	if event:getAction():toString() == "RIGHT_CLICK_AIR" or event:getAction():toString() == "RIGHT_CLICK_BLOCK" then
		if event:getItem() ~= nil then
			if game.isAbilityItem(event:getItem(), "IRON_INGOT") then
				local players = util.getTableFromList(game.getTeamManager():getOpponentTeam(LAPlayer, false))
				for i = 1, #players do
					if getLookingAt(event:getPlayer(), players[i]:getPlayer(), 0.95) then
						if game.checkCooldown(LAPlayer, game.getPlayer(event:getPlayer()), ability, id) then 
							if game.targetPlayer(LAPlayer, players[i]) then
								players[i]:getPlayer():getWorld():spawnParticle(import("$.Particle").SMOKE_NORMAL, players[i]:getPlayer():getLocation():add(0,1,0), 200, 0.5, 1, 0.5, 0.1)
								players[i]:getPlayer():getWorld():playSound(players[i]:getPlayer():getLocation(), import("$.Sound").ITEM_CHORUS_FRUIT_TELEPORT, 0.5, 1.2)
								summonJail(players[i]:getPlayer())
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

function summonJail(target)
	local blockList = {}
	local prevBlockType = {}
	local gamemode = target:getGameMode()
	
	target:setGameMode(import("$.GameMode").ADVENTURE)
	local botBlock1 = target:getWorld():getBlockAt(target:getLocation():add(-1,-1,-1))
	table.insert(prevBlockType, botBlock1:getType())
	util.setBlockType(botBlock1, material.OBSIDIAN)
	table.insert(blockList, botBlock1)
	
	local botBlock2 = target:getWorld():getBlockAt(target:getLocation():add(-1,-1,0))
	table.insert(prevBlockType, botBlock2:getType())
	util.setBlockType(botBlock2, material.OBSIDIAN)
	table.insert(blockList, botBlock2)
	
	local botBlock3 = target:getWorld():getBlockAt(target:getLocation():add(-1,-1,1))
	table.insert(prevBlockType, botBlock3:getType())
	util.setBlockType(botBlock3, material.OBSIDIAN)
	table.insert(blockList, botBlock3)
	
	local botBlock4 = target:getWorld():getBlockAt(target:getLocation():add(0,-1,-1))
	table.insert(prevBlockType, botBlock4:getType())
	util.setBlockType(botBlock4, material.OBSIDIAN)
	table.insert(blockList, botBlock4)
	
	local botBlock5 = target:getWorld():getBlockAt(target:getLocation():add(0,-1,0))
	table.insert(prevBlockType, botBlock5:getType())
	util.setBlockType(botBlock5, material.OBSIDIAN)
	table.insert(blockList, botBlock5)
	
	local botBlock6 = target:getWorld():getBlockAt(target:getLocation():add(0,-1,1))
	table.insert(prevBlockType, botBlock6:getType())
	util.setBlockType(botBlock6, material.OBSIDIAN)
	table.insert(blockList, botBlock6)
	
	local botBlock7 = target:getWorld():getBlockAt(target:getLocation():add(1,-1,-1))
	table.insert(prevBlockType, botBlock7:getType())
	util.setBlockType(botBlock7, material.OBSIDIAN)
	table.insert(blockList, botBlock7)
	
	local botBlock8 = target:getWorld():getBlockAt(target:getLocation():add(1,-1,0))
	table.insert(prevBlockType, botBlock8:getType())
	util.setBlockType(botBlock8, material.OBSIDIAN)
	table.insert(blockList, botBlock8)
	
	local botBlock9 = target:getWorld():getBlockAt(target:getLocation():add(1,-1,1))
	table.insert(prevBlockType, botBlock9:getType())
	util.setBlockType(botBlock9, material.OBSIDIAN)
	table.insert(blockList, botBlock9)
	
	
	local floor1Block2 = target:getWorld():getBlockAt(target:getLocation():add(-2,0,-1))
	table.insert(prevBlockType, floor1Block2:getType())
	util.setBlockType(floor1Block2, material.OBSIDIAN)
	table.insert(blockList, floor1Block2)
	
	local floor1Block3 = target:getWorld():getBlockAt(target:getLocation():add(-2,0,0))
	table.insert(prevBlockType, floor1Block3:getType())
	util.setBlockType(floor1Block3, material.OBSIDIAN)
	table.insert(blockList, floor1Block3)
	
	local floor1Block4 = target:getWorld():getBlockAt(target:getLocation():add(-2,0,1))
	table.insert(prevBlockType, floor1Block4:getType())
	util.setBlockType(floor1Block4, material.OBSIDIAN)
	table.insert(blockList, floor1Block4)
	
	local floor1Block6 = target:getWorld():getBlockAt(target:getLocation():add(-1,0,-2))
	table.insert(prevBlockType, floor1Block6:getType())
	util.setBlockType(floor1Block6, material.OBSIDIAN)
	table.insert(blockList, floor1Block6)
	
	local floor1Block7 = target:getWorld():getBlockAt(target:getLocation():add(-1,0,-1))
	table.insert(prevBlockType, floor1Block7:getType())
	util.setBlockType(floor1Block7, material.AIR)
	table.insert(blockList, floor1Block7)
	
	local floor1Block8 = target:getWorld():getBlockAt(target:getLocation():add(-1,0,0))
	table.insert(prevBlockType, floor1Block8:getType())
	util.setBlockType(floor1Block8, material.AIR)
	table.insert(blockList, floor1Block8)
	
	local floor1Block9 = target:getWorld():getBlockAt(target:getLocation():add(-1,0,1))
	table.insert(prevBlockType, floor1Block9:getType())
	util.setBlockType(floor1Block9, material.AIR)
	table.insert(blockList, floor1Block9)
	
	local floor1Block10 = target:getWorld():getBlockAt(target:getLocation():add(-1,0,2))
	table.insert(prevBlockType, floor1Block10:getType())
	util.setBlockType(floor1Block10, material.OBSIDIAN)
	table.insert(blockList, floor1Block10)
	
	local floor1Block11 = target:getWorld():getBlockAt(target:getLocation():add(0,0,-2))
	table.insert(prevBlockType, floor1Block11:getType())
	util.setBlockType(floor1Block11, material.OBSIDIAN)
	table.insert(blockList, floor1Block11)
	
	local floor1Block12 = target:getWorld():getBlockAt(target:getLocation():add(0,0,-1))
	table.insert(prevBlockType, floor1Block12:getType())
	util.setBlockType(floor1Block12, material.AIR)
	table.insert(blockList, floor1Block12)
	
	local floor1Block13 = target:getWorld():getBlockAt(target:getLocation():add(0,0,0))
	table.insert(prevBlockType, floor1Block13:getType())
	util.setBlockType(floor1Block13, material.AIR)
	table.insert(blockList, floor1Block13)
	
	local floor1Block14 = target:getWorld():getBlockAt(target:getLocation():add(0,0,1))
	table.insert(prevBlockType, floor1Block14:getType())
	util.setBlockType(floor1Block14, material.AIR)
	table.insert(blockList, floor1Block14)
	
	local floor1Block15 = target:getWorld():getBlockAt(target:getLocation():add(0,0,2))
	table.insert(prevBlockType, floor1Block15:getType())
	util.setBlockType(floor1Block15, material.OBSIDIAN)
	table.insert(blockList, floor1Block15)
	
	local floor1Block16 = target:getWorld():getBlockAt(target:getLocation():add(1,0,-2))
	table.insert(prevBlockType, floor1Block16:getType())
	util.setBlockType(floor1Block16, material.OBSIDIAN)
	table.insert(blockList, floor1Block16)
	
	local floor1Block17 = target:getWorld():getBlockAt(target:getLocation():add(1,0,-1))
	table.insert(prevBlockType, floor1Block17:getType())
	util.setBlockType(floor1Block17, material.AIR)
	table.insert(blockList, floor1Block17)
	
	local floor1Block18 = target:getWorld():getBlockAt(target:getLocation():add(1,0,0))
	table.insert(prevBlockType, floor1Block18:getType())
	util.setBlockType(floor1Block18, material.AIR)
	table.insert(blockList, floor1Block18)
	
	local floor1Block19 = target:getWorld():getBlockAt(target:getLocation():add(1,0,1))
	table.insert(prevBlockType, floor1Block19:getType())
	util.setBlockType(floor1Block19, material.AIR)
	table.insert(blockList, floor1Block19)
	
	local floor1Block20 = target:getWorld():getBlockAt(target:getLocation():add(1,0,2))
	table.insert(prevBlockType, floor1Block20:getType())
	util.setBlockType(floor1Block20, material.OBSIDIAN)
	table.insert(blockList, floor1Block20)
	
	local floor1Block22 = target:getWorld():getBlockAt(target:getLocation():add(2,0,-1))
	table.insert(prevBlockType, floor1Block22:getType())
	util.setBlockType(floor1Block22, material.OBSIDIAN)
	table.insert(blockList, floor1Block22)
	
	local floor1Block23 = target:getWorld():getBlockAt(target:getLocation():add(2,0,0))
	table.insert(prevBlockType, floor1Block23:getType())
	util.setBlockType(floor1Block23, material.OBSIDIAN)
	table.insert(blockList, floor1Block23)
	
	local floor1Block24 = target:getWorld():getBlockAt(target:getLocation():add(2,0,1))
	table.insert(prevBlockType, floor1Block24:getType())
	util.setBlockType(floor1Block24, material.OBSIDIAN)
	table.insert(blockList, floor1Block24)
	
	
	local floor2Block2 = target:getWorld():getBlockAt(target:getLocation():add(-2,1,-1))
	table.insert(prevBlockType, floor2Block2:getType())
	util.setBlockType(floor2Block2, material.OBSIDIAN)
	table.insert(blockList, floor2Block2)
	
	local floor2Block3 = target:getWorld():getBlockAt(target:getLocation():add(-2,1,0))
	table.insert(prevBlockType, floor2Block3:getType())
	util.setBlockType(floor2Block3, material.GLASS)
	table.insert(blockList, floor2Block3)
	
	local floor2Block4 = target:getWorld():getBlockAt(target:getLocation():add(-2,1,1))
	table.insert(prevBlockType, floor2Block4:getType())
	util.setBlockType(floor2Block4, material.OBSIDIAN)
	table.insert(blockList, floor2Block4)
	
	local floor2Block6 = target:getWorld():getBlockAt(target:getLocation():add(-1,1,-2))
	table.insert(prevBlockType, floor2Block6:getType())
	util.setBlockType(floor2Block6, material.OBSIDIAN)
	table.insert(blockList, floor2Block6)
	
	local floor2Block7 = target:getWorld():getBlockAt(target:getLocation():add(-1,1,-1))
	table.insert(prevBlockType, floor2Block7:getType())
	util.setBlockType(floor2Block7, material.AIR)
	table.insert(blockList, floor2Block7)
	
	local floor2Block8 = target:getWorld():getBlockAt(target:getLocation():add(-1,1,0))
	table.insert(prevBlockType, floor2Block8:getType())
	util.setBlockType(floor2Block8, material.AIR)
	table.insert(blockList, floor2Block8)
	
	local floor2Block9 = target:getWorld():getBlockAt(target:getLocation():add(-1,1,1))
	table.insert(prevBlockType, floor2Block9:getType())
	util.setBlockType(floor2Block9, material.AIR)
	table.insert(blockList, floor2Block9)
	
	local floor2Block11 = target:getWorld():getBlockAt(target:getLocation():add(0,1,-2))
	table.insert(prevBlockType, floor2Block11:getType())
	util.setBlockType(floor2Block11, material.GLASS)
	table.insert(blockList, floor2Block11)
	
	local floor2Block12 = target:getWorld():getBlockAt(target:getLocation():add(0,1,-1))
	table.insert(prevBlockType, floor2Block12:getType())
	util.setBlockType(floor2Block12, material.AIR)
	table.insert(blockList, floor2Block12)
	
	local floor2Block13 = target:getWorld():getBlockAt(target:getLocation():add(0,1,0))
	table.insert(prevBlockType, floor2Block13:getType())
	util.setBlockType(floor2Block13, material.AIR)
	table.insert(blockList, floor2Block13)
	
	local floor2Block14 = target:getWorld():getBlockAt(target:getLocation():add(0,1,1))
	table.insert(prevBlockType, floor2Block14:getType())
	util.setBlockType(floor2Block14, material.AIR)
	table.insert(blockList, floor2Block14)
	
	local floor2Block16 = target:getWorld():getBlockAt(target:getLocation():add(1,1,-2))
	table.insert(prevBlockType, floor2Block16:getType())
	util.setBlockType(floor2Block16, material.OBSIDIAN)
	table.insert(blockList, floor2Block16)
	
	local floor2Block17 = target:getWorld():getBlockAt(target:getLocation():add(1,1,-1))
	table.insert(prevBlockType, floor2Block17:getType())
	util.setBlockType(floor2Block17, material.AIR)
	table.insert(blockList, floor2Block17)
	
	local floor2Block18 = target:getWorld():getBlockAt(target:getLocation():add(1,1,0))
	table.insert(prevBlockType, floor2Block18:getType())
	util.setBlockType(floor2Block18, material.AIR)
	table.insert(blockList, floor2Block18)
	
	local floor2Block19 = target:getWorld():getBlockAt(target:getLocation():add(1,1,1))
	table.insert(prevBlockType, floor2Block19:getType())
	util.setBlockType(floor2Block19, material.AIR)
	table.insert(blockList, floor2Block19)
	
	local floor2Block22 = target:getWorld():getBlockAt(target:getLocation():add(2,1,-1))
	table.insert(prevBlockType, floor2Block22:getType())
	util.setBlockType(floor2Block22, material.OBSIDIAN)
	table.insert(blockList, floor2Block22)
	
	local floor2Block23 = target:getWorld():getBlockAt(target:getLocation():add(2,1,0))
	table.insert(prevBlockType, floor2Block23:getType())
	util.setBlockType(floor2Block23, material.GLASS)
	table.insert(blockList, floor2Block23)
	
	local floor2Block24 = target:getWorld():getBlockAt(target:getLocation():add(2,1,1))
	table.insert(prevBlockType, floor2Block24:getType())
	util.setBlockType(floor2Block24, material.OBSIDIAN)
	table.insert(blockList, floor2Block24)
	
	local floor2Block10 = target:getWorld():getBlockAt(target:getLocation():add(-1,1,2))
	table.insert(prevBlockType, floor2Block10:getType())
	util.setBlockType(floor2Block10, material.DISPENSER)
	table.insert(blockList, floor2Block10)
	
	local floor2Block20 = target:getWorld():getBlockAt(target:getLocation():add(1,1,2))
	table.insert(prevBlockType, floor2Block20:getType())
	util.setBlockType(floor2Block20, material.DISPENSER)
	table.insert(blockList, floor2Block20)
	
	local floor2Block15 = target:getWorld():getBlockAt(target:getLocation():add(0,1,2))
	table.insert(prevBlockType, floor2Block15:getType())
	util.setBlockType(floor2Block15, material.DISPENSER)
	table.insert(blockList, floor2Block15)
	
		
	local dispenser1 = floor2Block10:getState()
	local dispenser2 = floor2Block15:getState()
	local dispenser3 = floor2Block20:getState()
	
	local item = newInstance("$.inventory.ItemStack", {material.ARROW, 30})
	
	dispenser1:setLock("One_Minute_")
	dispenser1:update()
	dispenser1:getInventory():setItem(0, item:clone())
	
	dispenser2:setLock("One_Minute_")
	dispenser2:update()
	dispenser2:getInventory():setItem(0, item:clone())
	
	dispenser3:setLock("One_Minute_")
	dispenser3:update()
	dispenser3:getInventory():setItem(0, item:clone())
	
	for i = 1, 6 do
		util.runLater(function() 
			local redstone1 = floor2Block10:getWorld():getBlockAt(floor2Block10:getLocation():add(0, 0, 1))
			local redstone2 = floor2Block15:getWorld():getBlockAt(floor2Block15:getLocation():add(0, 0, 1))
			local redstone3 = floor2Block20:getWorld():getBlockAt(floor2Block20:getLocation():add(0, 0, 1))
			
			local redstoneType1 = redstone1:getType()
			local redstoneType2 = redstone2:getType()
			local redstoneType3 = redstone3:getType()
			
			util.setBlockType(redstone1, material.REDSTONE_BLOCK)
			util.setBlockType(redstone2, material.REDSTONE_BLOCK)
			util.setBlockType(redstone3, material.REDSTONE_BLOCK)

			util.setBlockType(redstone1, redstoneType1)
			util.setBlockType(redstone2, redstoneType2)
			util.setBlockType(redstone3, redstoneType3)
		end, (i - 1) * 10)
	end
	
	local floor3Block2 = target:getWorld():getBlockAt(target:getLocation():add(-2,2,-1))
	table.insert(prevBlockType, floor3Block2:getType())
	util.setBlockType(floor3Block2, material.OBSIDIAN)
	table.insert(blockList, floor3Block2)
	
	local floor3Block3 = target:getWorld():getBlockAt(target:getLocation():add(-2,2,0))
	table.insert(prevBlockType, floor3Block3:getType())
	util.setBlockType(floor3Block3, material.OBSIDIAN)
	table.insert(blockList, floor3Block3)
	
	local floor3Block4 = target:getWorld():getBlockAt(target:getLocation():add(-2,2,1))
	table.insert(prevBlockType, floor3Block4:getType())
	util.setBlockType(floor3Block4, material.OBSIDIAN)
	table.insert(blockList, floor3Block4)
	
	local floor3Block6 = target:getWorld():getBlockAt(target:getLocation():add(-1,2,-2))
	table.insert(prevBlockType, floor3Block6:getType())
	util.setBlockType(floor3Block6, material.OBSIDIAN)
	table.insert(blockList, floor3Block6)
	
	local floor3Block7 = target:getWorld():getBlockAt(target:getLocation():add(-1,2,-1))
	table.insert(prevBlockType, floor3Block7:getType())
	util.setBlockType(floor3Block7, material.AIR)
	table.insert(blockList, floor3Block7)
	
	local floor3Block8 = target:getWorld():getBlockAt(target:getLocation():add(-1,2,0))
	table.insert(prevBlockType, floor3Block8:getType())
	util.setBlockType(floor3Block8, material.AIR)
	table.insert(blockList, floor3Block8)
	
	local floor3Block9 = target:getWorld():getBlockAt(target:getLocation():add(-1,2,1))
	table.insert(prevBlockType, floor3Block9:getType())
	util.setBlockType(floor3Block9, material.AIR)
	table.insert(blockList, floor3Block9)
	
	local floor3Block10 = target:getWorld():getBlockAt(target:getLocation():add(-1,2,2))
	table.insert(prevBlockType, floor3Block10:getType())
	util.setBlockType(floor3Block10, material.OBSIDIAN)
	table.insert(blockList, floor3Block10)
	
	local floor3Block11 = target:getWorld():getBlockAt(target:getLocation():add(0,2,-2))
	table.insert(prevBlockType, floor3Block11:getType())
	util.setBlockType(floor3Block11, material.OBSIDIAN)
	table.insert(blockList, floor3Block11)
	
	local floor3Block12 = target:getWorld():getBlockAt(target:getLocation():add(0,2,-1))
	table.insert(prevBlockType, floor3Block12:getType())
	util.setBlockType(floor3Block12, material.AIR)
	table.insert(blockList, floor3Block12)
	
	local floor3Block13 = target:getWorld():getBlockAt(target:getLocation():add(0,2,0))
	table.insert(prevBlockType, floor3Block13:getType())
	util.setBlockType(floor3Block13, material.AIR)
	table.insert(blockList, floor3Block13)
	
	local floor3Block14 = target:getWorld():getBlockAt(target:getLocation():add(0,2,1))
	table.insert(prevBlockType, floor3Block14:getType())
	util.setBlockType(floor3Block14, material.AIR)
	table.insert(blockList, floor3Block14)
	
	local floor3Block15 = target:getWorld():getBlockAt(target:getLocation():add(0,2,2))
	table.insert(prevBlockType, floor3Block15:getType())
	util.setBlockType(floor3Block15, material.OBSIDIAN)
	table.insert(blockList, floor3Block15)
	
	local floor3Block16 = target:getWorld():getBlockAt(target:getLocation():add(1,2,-2))
	table.insert(prevBlockType, floor3Block16:getType())
	util.setBlockType(floor3Block16, material.OBSIDIAN)
	table.insert(blockList, floor3Block16)
	
	local floor3Block17 = target:getWorld():getBlockAt(target:getLocation():add(1,2,-1))
	table.insert(prevBlockType, floor3Block17:getType())
	util.setBlockType(floor3Block17, material.AIR)
	table.insert(blockList, floor3Block17)
	
	local floor3Block18 = target:getWorld():getBlockAt(target:getLocation():add(1,2,0))
	table.insert(prevBlockType, floor3Block18:getType())
	util.setBlockType(floor3Block18, material.AIR)
	table.insert(blockList, floor3Block18)
	
	local floor3Block19 = target:getWorld():getBlockAt(target:getLocation():add(1,2,1))
	table.insert(prevBlockType, floor3Block19:getType())
	util.setBlockType(floor3Block19, material.AIR)
	table.insert(blockList, floor3Block19)
	
	local floor3Block20 = target:getWorld():getBlockAt(target:getLocation():add(1,2,2))
	table.insert(prevBlockType, floor3Block20:getType())
	util.setBlockType(floor3Block20, material.OBSIDIAN)
	table.insert(blockList, floor3Block20)
	
	local floor3Block22 = target:getWorld():getBlockAt(target:getLocation():add(2,2,-1))
	table.insert(prevBlockType, floor3Block22:getType())
	util.setBlockType(floor3Block22, material.OBSIDIAN)
	table.insert(blockList, floor3Block22)
	
	local floor3Block23 = target:getWorld():getBlockAt(target:getLocation():add(2,2,0))
	table.insert(prevBlockType, floor3Block23:getType())
	util.setBlockType(floor3Block23, material.OBSIDIAN)
	table.insert(blockList, floor3Block23)
	
	local floor3Block24 = target:getWorld():getBlockAt(target:getLocation():add(2,2,1))
	table.insert(prevBlockType, floor3Block24:getType())
	util.setBlockType(floor3Block24, material.OBSIDIAN)
	table.insert(blockList, floor3Block24)
	
	
	local topBlock1 = target:getWorld():getBlockAt(target:getLocation():add(-1,3,-1))
	table.insert(prevBlockType, topBlock1:getType())
	util.setBlockType(topBlock1, material.OBSIDIAN)
	table.insert(blockList, topBlock1)
	
	local topBlock2 = target:getWorld():getBlockAt(target:getLocation():add(-1,3,0))
	table.insert(prevBlockType, topBlock2:getType())
	util.setBlockType(topBlock2, material.OBSIDIAN)
	table.insert(blockList, topBlock2)
	
	local topBlock3 = target:getWorld():getBlockAt(target:getLocation():add(-1,3,1))
	table.insert(prevBlockType, topBlock3:getType())
	util.setBlockType(topBlock3, material.OBSIDIAN)
	table.insert(blockList, topBlock3)
	
	local topBlock4 = target:getWorld():getBlockAt(target:getLocation():add(0,3,-1))
	table.insert(prevBlockType, topBlock4:getType())
	util.setBlockType(topBlock4, material.OBSIDIAN)
	table.insert(blockList, topBlock4)
	
	local topBlock5 = target:getWorld():getBlockAt(target:getLocation():add(0,3,0))
	table.insert(prevBlockType, topBlock5:getType())
	util.setBlockType(topBlock5, material.OBSIDIAN)
	table.insert(blockList, topBlock5)
	
	local topBlock6 = target:getWorld():getBlockAt(target:getLocation():add(0,3,1))
	table.insert(prevBlockType, topBlock6:getType())
	util.setBlockType(topBlock6, material.OBSIDIAN)
	table.insert(blockList, topBlock6)
	
	local topBlock7 = target:getWorld():getBlockAt(target:getLocation():add(1,3,-1))
	table.insert(prevBlockType, topBlock7:getType())
	util.setBlockType(topBlock7, material.OBSIDIAN)
	table.insert(blockList, topBlock7)
	
	local topBlock8 = target:getWorld():getBlockAt(target:getLocation():add(1,3,0))
	table.insert(prevBlockType, topBlock8:getType())
	util.setBlockType(topBlock8, material.OBSIDIAN)
	table.insert(blockList, topBlock8)
	
	local topBlock9 = target:getWorld():getBlockAt(target:getLocation():add(1,3,1))
	table.insert(prevBlockType, topBlock9:getType())
	util.setBlockType(topBlock9, material.OBSIDIAN)
	table.insert(blockList, topBlock9)
	
	util.runLater(function() 
		for i = 1, #blockList do
			blockList[i]:getWorld():spawnParticle(import("$.Particle").BLOCK_CRACK, blockList[i]:getLocation(), 50, 0.5, 0.5, 0.5, 0.05, blockList[i]:getBlockData())
			blockList[i]:getWorld():playSound(blockList[i]:getLocation(), import("$.Sound").BLOCK_STONE_BREAK, 0.25, 1)
			util.setBlockType(blockList[i], prevBlockType[i])
		end
		if game.getPlayer(target).isSurvive then target:setGameMode(gamemode) end
	end, 60)
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