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

NS.CreateSubFrame = function(self, set, i)
    local f = CreateFrame("Button", "nil" , self)
    f.set = set

    f:SetPoint("TOPRIGHT", 0, -35*i)
    --f:SetPoint("CENTER", self, "TOPRIGHT", 0, 0)
    f:SetSize(30, 30)

    f.tex = f:CreateTexture()
    f.tex:SetAllPoints(f)
    f.tex:SetTexture("interface/icons/inv_mushroom_11")

    f:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT", 0, 0)
        GameTooltip:SetText( listToStr(f.set) )
        GameTooltip:Show()
    end)

    f:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)

    f:SetScript("OnMouseDown", function(self, button)
        print(button)

        if button == 'LeftButton' then
            equipItems(f.set)
        elseif button == 'RightButton' then
            print('open dropdown menu')
        end

    end)

    return f
end



--"$parent_NODE"..#self.buttons+1
