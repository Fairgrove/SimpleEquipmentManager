local SimpleEquipManager, NS = ...

sets = {}
buttons = {}

function deleteSet(setID)
    local tempSets = {}

    for i,v in ipairs(SETS) do
        if not i == setID then
            table.insert(tempSets, v)
        end
    end
end

function getEquipped()
    local eq = {} --equipped items

    for ii=1,19 do
        local item,_ = GetInventoryItemID("player",ii)

        if not item then
            table.insert(eq, 0)
        else
            table.insert(eq, item)
        end
    end

    return eq
end

function listToStr(list)
    str = ""

    for i,v in ipairs(list) do
        if v == 0 then
            str = str .. i .. " 0\n"
        else
            str = str .. i .. " " .. GetItemInfo(v) .. "\n"
        end
    end
    return str
end

local SavedVariables = CreateFrame("Frame")
SavedVariables:RegisterEvent("PLAYER_LOGOUT")
SavedVariables:RegisterEvent("ADDON_LOADED")
SavedVariables:SetScript("OnEvent", function(self, event, arg1)
    if event == "ADDON_LOADED" and arg1 == "SimpleEquipManager" then
        if CHARSETS == nil then
            CHARSETS = {}
        else
            sets = CHARSETS
        end

        for i, v in pairs(sets) do
            tinsert(buttons, NS.CreateSubFrame(PaperDollItemsFrame, v, i))
        end

        print("|c00000000" .. arg1 .. " Loaded|r")
    end

    if event == "PLAYER_LOGOUT" then
        CHARSETS = {}

        for i, v in pairs(sets) do
            CHARSETS[i] = sets[i]
        end
    end
end)
