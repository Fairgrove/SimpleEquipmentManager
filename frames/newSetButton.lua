local SimpleEquipManager, NS = ...

local newSetButton = CreateFrame("Button", "newSetButton", CharacterFrameCloseButton, "OptionsFrameTabButtonTemplate")
newSetButton:SetText('New Set')
--newSetButton:SetSize(1100, 900) --x, y
newSetButton:SetPoint("CENTER", PaperDollItemsFrame, "TOP", 0, 0)

newSetButton:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT", 0, 0)
    GameTooltip:SetText("Click here to save currently equipped gear as a set.\nctrl+alt+shift right-click on a set to delete it \nctrl+shit left-click a set to update it to what is currently equipped (NYI)")
    GameTooltip:Show()
end)

newSetButton:SetScript("OnLeave", function()
    GameTooltip:Hide()
end)

newSetButton:SetScript("OnClick", function(self, button)
    print('click worked ' .. button)
    local newSet = getEquipped()
    table.insert(sets, newSet)
    NS.setButton(newSet , #buttons+1)
    print('saved')
end)
