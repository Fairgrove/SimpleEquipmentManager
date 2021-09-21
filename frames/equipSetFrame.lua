local SimpleEquipManager, NS = ...

local function equipItems(set)
    for i,v in ipairs(set) do
        if v == 0 then
            PickupInventoryItem(i)
            PutItemInBackpack()
        else
            EquipItemByName(v,i)
        end
    end
end

NS.setButton = function(set, i)
    local f = CreateFrame("Button", "set"..i , PaperDollItemsFrame)
    f.set = set
    f.ID = i

    f:SetPoint("TOPRIGHT", 1, (-100) + 35*-(i-1))
    f:SetSize(32, 32)

    f.tex = f:CreateTexture()
    f.tex:SetAllPoints(f)
    f.tex:SetTexture("interface/icons/inv_mushroom_11")

    f:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT", 0, 0)
        GameTooltip:SetText(listToStr(f.set))
        GameTooltip:Show()
    end)

    f:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)

    f:SetScript("OnMouseDown", function(self, button)
        if button == 'LeftButton' then
            equipItems(f.set)
            NS.reorganiseSetButtons()
        elseif button == 'RightButton' and
        IsAltKeyDown() and
        IsShiftKeyDown() and
        IsControlKeyDown() then
            f:Hide()
            tremove(buttons, f.ID)
            tremove(sets, f.ID)
            for ii,set in ipairs(sets) do
                buttons[ii].ID = ii
                buttons[ii]:SetPoint("TOPRIGHT", 0, 1, 35*-(ii-1))
            end
        end
    end)

    tinsert(buttons, f)
end
