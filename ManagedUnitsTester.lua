function refreshUnitType(unit)
    for key, value in pairs(unitTypeData) do
        if unit[key] ~= nil then
            unit[key] = nil
        end
    end

---@diagnostic disable-next-line: assign-type-mismatch
    unit[unit.unitType] = {}

    for i = 1, #unitTypeData[unit.unitType], 1 do
        unit[unit.unitType][unitTypeData[unit.unitType][i]] = ""
    end
end

managedUnits = {example = {managed = false, unitType = "none"}}
unitTypeData = {weapon = {"mainType", "subType"}, targetDesignator = {"targetNumber", "targetX", "targetY", "targetZ"}, none = {}}


for i = 1, 2, 1 do
    managedUnits[i] = {managed = false, unitType = "none"}
end

managedUnits[1].unitType = "weapon"
refreshUnitType(managedUnits[1])

managedUnits[1].unitType = "targetDesignator"
refreshUnitType(managedUnits[1])

managedUnits[1].unitType = "none"
refreshUnitType(managedUnits[1])

managedUnits[1].unitType = "weapon"
refreshUnitType(managedUnits[1])

print("end")