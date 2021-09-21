local SimpleEquipManager, NS = ...

local newSetButton = CreateFrame("Button", "asdf", PaperDollFrame, "UIMenuButtonStretchTemplate")
newSetButton:SetText('New Set')
--newSetButton:SetSize(1100, 900) --x, y
newSetButton:SetPoint("TOP", PaperDollItemsFrame, "TOP")

newSetButton:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT", 0, 0)
    GameTooltip:SetText( listToStr(getEquipped()) )
    GameTooltip:Show()
end)

newSetButton:SetScript("OnLeave", function()
    GameTooltip:Hide()
end)

newSetButton:SetScript("OnClick", function(self, button)
    print('click worked ' .. button)
    table.insert(sets, getEquipped())
    print('saved')
end)
