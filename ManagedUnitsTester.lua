unitTypeData = {[0] = {[0] = false, 0},                 --managed, unitType
                {[0] = true, 1, -1, -1, "", -1},        --managed, unitType, mainType, subType, name, nameLength
                {[0] = true, 1, -1, false, 0, 0, 0},    --managed, unitType, targetNumber, targetActive, targetX, targetY, targetZ
            }

managedUnits = {}

managedUnits[1] = unitTypeData[0]
managedUnits[1] = unitTypeData[1]

print("End")