local worldInfo = import("$.World$Environment")

function Init(abilityData)
	plugin.registerEvent(abilityData, "능력 확인", "PlayerInteractEvent", 0)
end

function onEvent(funcTable)
	if funcTable[1] == "능력 확인" then useAbility(funcTable[3], funcTable[2], funcTable[4], funcTable[1]) end
end

function onTimer(player, ability)
	if player:getVariable("EX040-toggle") == nil then player:setVariable("EX040-toggle", true) end
	
	if player:getVariable("EX040-toggle") then
		local entities = util.getTableFromList(game.getTeamManager():getOpponentTeam(player, false))
		for i = 1, #entities do
			if entities[i]:getPlayer() ~= player:getPlayer() and entities[i]:getPlayer():getLocation():distance(player:getPlayer():getLocation()) < 30.0f then
				local pitch = (30.0f - entities[i]:getPlayer():getLocation():distance(player:getPlayer():getLocation())) / 30.0f
				player:getPlayer():playSound(entities[i]:getPlayer(), import("$.Sound").ENTITY_EXPERIENCE_ORB_PICKUP, 1.8 - (pitch / 2f), 0.5 + pitch)
			end
		end
		
		local myTeam = game.getTeamManager():getMyTeam(player, false)
		local projs = util.getTableFromList(player:getPlayer():getWorld():getEntitiesByClass(util.getClass("org.bukkit.entity.Projectile")))
		for i = 1, #projs do
			if util.hasClass(projs[i]:getShooter(), "$.entity.Player") then
				local shooter = game.getPlayer(projs[i]:getShooter())
				if shooter and not myTeam:contains(shooter) and projs[i]:getLocation():distance(player:getPlayer():getLocation()) < 30.0f and projs[i]:getVelocity():length() > 0 then
					if not (util.hasClass(projs[i], "$.entity.AbstractArrow") and projs[i]:getAttachedBlock() ~= nil) then
						local pitch = (30.0f - projs[i]:getLocation():distance(player:getPlayer():getLocation())) / 30.0f
						player:getPlayer():playSound(projs[i], import("$.Sound").ENTITY_EXPERIENCE_ORB_PICKUP, 1.8 - (pitch / 2f), 0.5 + pitch)
					end
				end
			end
		end
	end
end

function useAbility(LAPlayer, event, ability, id)
	if event:getItem() ~= nil then
		if game.isAbilityItem(event:getItem(), "IRON_INGOT") then
			if event:getAction():toString() == "RIGHT_CLICK_AIR" or event:getAction():toString() == "RIGHT_CLICK_BLOCK" then
				if game.checkCooldown(LAPlayer, game.getPlayer(event:getPlayer()), ability, id, false) then
					checkAbility(event:getPlayer())
				end
			end
			
			if event:getAction():toString() == "LEFT_CLICK_AIR" or event:getAction():toString() == "LEFT_CLICK_AIR" then
				if game.checkCooldown(LAPlayer, game.getPlayer(event:getPlayer()), ability, id, false) then
					if LAPlayer:getVariable("EX040-toggle") then 
						game.sendMessage(event:getPlayer(), "§2[§a식스센스§2] §a주변 엔티티 감지가 비활성화 되었습니다.")
						LAPlayer:setVariable("EX040-toggle", false)
					else 
						game.sendMessage(event:getPlayer(), "§2[§a식스센스§2] §a주변 엔티티 감지가 활성화 되었습니다.") 
						LAPlayer:setVariable("EX040-toggle", true)
					end
				end
			end
		end
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
