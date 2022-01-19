local worldInfo = import("$.World$Environment")

function Init(abilityData)
	plugin.registerEvent(abilityData, "EX040-useAbility", "PlayerInteractEvent", 60)
end

function onEvent(funcTable)
	if funcTable[1] == "EX040-useAbility" then useAbility(funcTable[3], funcTable[2], funcTable[4], funcTable[1]) end
end

function useAbility(LAPlayer, event, ability, id)
	if event:getItem() ~= nil then
		if game.isAbilityItem(event:getItem(), "IRON_INGOT") then
			if event:getAction():toString() == "RIGHT_CLICK_AIR" or event:getAction():toString() == "RIGHT_CLICK_BLOCK" then
				if game.checkCooldown(LAPlayer, game.getPlayer(event:getPlayer()), ability, id, false) then
					checkAbility(event:getPlayer())
				end
			elseif event:getAction():toString() == "LEFT_CLICK_AIR" or event:getAction():toString() == "LEFT_CLICK_BLOCK" then
				if game.checkCooldown(LAPlayer, game.getPlayer(event:getPlayer()), ability, id, false) then
					checkLocation(event:getPlayer())
				end
			end
		end
	end
end

function checkLocation(player)
	local players = util.getTableFromList(game.getPlayers())
	game.sendMessage(player, "§6----------§a[위치 리스트]§6----------")
	for i = 1, #players do
		local loc = players[i]:getPlayer():getLocation()
		local str = "§e" .. players[i]:getPlayer():getName() .. " §f- §b월드 §6: §a"
		
		if loc:getWorld():getEnvironment() == worldInfo.NORMAL then str = str .. "§a일반 §f/ §bX §6: §a" 
		elseif loc:getWorld():getEnvironment() == worldInfo.NETHER then str = str .. "§c지옥 §f/ §bX §6: §a" 
		elseif loc:getWorld():getEnvironment() == worldInfo.THE_END then str = str .. "§7엔드 §f/ §bX §6: §a" 
		else str = str .. "??? / " end
		
		str = str .. math.floor(loc:getX() + 0.5) .. " §f/ §bY §6: §a" .. math.floor(loc:getY() + 0.5) .. " §f/ §bZ §6: §a" .. math.floor(loc:getZ() + 0.5)
		
		game.sendMessage(player, str)
	end
end

function checkAbility(player)
	local players = util.getTableFromList(game.getPlayers())
	game.sendMessage(player, "§6----------§a[능력 리스트]§6----------")
	for i = 1, #players do
		local str = "§e" .. players[i]:getPlayer():getName() .. " §6: §a"
		local abilities = util.getTableFromList(players[i]:getAbility())
		if #abilities < 1 then str = str .. "§c없음"
		else
			for j = 1, #abilities do
				str = str .. abilities[j].abilityName
				if j < #abilities then str = str .. ", " end
			end
		end
		
		game.sendMessage(player, str)
	end
end
