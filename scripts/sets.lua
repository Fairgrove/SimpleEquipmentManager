local SimpleEquipManager, NS = ...

NS.deleteSet = function(setID)
    local tempSets = {}

    for i,v in ipairs(sets) do
        if i == setID then
        else
            table.insert(tempSets, v)
        end
    end

    sets = tempSets
end
