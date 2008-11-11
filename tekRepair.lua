local f = CreateFrame("Frame")
f:RegisterEvent("MERCHANT_SHOW")
f:SetScript("OnEvent", function(frame, event, name)
    -- Buy the Wood Frog Box from Flik during the DMF
    if UnitName("target") == 'Flik' and GetMerchantItemInfo(2) == 'Wood Frog Box' then
        BuyMerchantItem(2, 1)
    end
    
	if IsShiftKeyDown() or not CanMerchantRepair() then return end

	local cost = GetRepairAllCost()
	if cost > 0 then
		local money = GetMoney()

		if IsInGuild() then
			local guildMoney = GetGuildBankWithdrawMoney()
			if guildMoney == -1 then
				guildMoney = GetGuildBankMoney()
			end
			if guildMoney > cost then
				RepairAllItems(1)
				return
			end
		end

		if money > cost then
			RepairAllItems()
		else
            -- Player is broke; irrelevant to me!
		end
	end
end)