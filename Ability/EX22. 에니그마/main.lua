function Init(abilityData)
	plugin.registerEvent(abilityData, "EX022-enigma", "EntityDamageEvent", 400)
end

function onEvent(funcTable)
	if funcTable[1] == "EX022-enigma" and funcTable[2]:getEventName() == "EntityDamageByEntityEvent" then enigma(funcTable[3], funcTable[2], funcTable[4], funcTable[1]) end
end

function enigma(LAPlayer, event, ability, id)
	if event:getDamager():getType() == import("$.entity.EntityType").PLAYER and event:getEntity():getType() == import("$.entity.EntityType").PLAYER then
		local item = event:getDamager():getInventory():getItemInMainHand()
		if game.isAbilityItem(item, "IRON_INGOT") then
			if game.checkCooldown(LAPlayer, game.getPlayer(event:getDamager()), ability, id) then
				local targetInv = event:getEntity():getInventory()
				game.sendMessage(event:getEntity(), "§c에니그마 능력에 의해 인벤토리가 뒤섞입니다!")	
				for i = 1, 100 do
					local randomIndex = util.random(0, 35)
					local item = targetInv:getItem(0)
					if item == nil then newInstance("$.inventory.ItemStack", {import("$.Material").AIR, 1}) 
					else item = targetInv:getItem(0):clone() end
					targetInv:setItem(0, targetInv:getItem(randomIndex))
					targetInv:setItem(randomIndex, item)
				end
			end
		end
	end
end