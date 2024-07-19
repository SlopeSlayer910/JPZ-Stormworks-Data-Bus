--- Developed using LifeBoatAPI - Stormworks Lua plugin for VSCode - https://code.visualstudio.com/download (search "Stormworks Lua with LifeboatAPI" extension)
--- If you have any issues, please report them here: https://github.com/nameouschangey/STORMWORKS_VSCodeExtension/issues - by Nameous Changey


--[====[ HOTKEYS ]====]
-- Press F6 to simulate this file
-- Press F7 to build the project, copy the output from /_build/out/ into the game to use
-- Remember to set your Author name etc. in the settings: CTRL+COMMA


--[====[ EDITABLE SIMULATOR CONFIG - *automatically removed from the F7 build output ]====]
---@section __LB_SIMULATOR_ONLY__
do
	---@type Simulator -- Set properties and screen sizes here - will run once when the script is loaded
	simulator = simulator
	simulator:setScreen(1, "3x3")
	simulator:setProperty("ExampleNumberProperty", 123)

	-- Runs every tick just before onTick; allows you to simulate the inputs changing
	---@param simulator Simulator Use simulator:<function>() to set inputs etc.
	---@param ticks     number Number of ticks since simulator started
	function onLBSimulatorTick(simulator, ticks)

		-- touchscreen defaults
		local screenConnection = simulator:getTouchScreen(1)
		simulator:setInputBool(1, screenConnection.isTouched)
		simulator:setInputNumber(1, screenConnection.width)
		simulator:setInputNumber(2, screenConnection.height)
		simulator:setInputNumber(3, screenConnection.touchX)
		simulator:setInputNumber(4, screenConnection.touchY)

		-- NEW! button/slider options from the UI
		simulator:setInputBool(31, simulator:getIsClicked(1))       -- if button 1 is clicked, provide an ON pulse for input.getBool(31)
		simulator:setInputNumber(31, simulator:getSlider(1))        -- set input 31 to the value of slider 1

		simulator:setInputBool(32, simulator:getIsToggled(2))       -- make button 2 a toggle, for input.getBool(32)
		simulator:setInputNumber(32, simulator:getSlider(2) * 50)   -- set input 32 to the value from slider 2 * 50
	end;
end
---@endsection


--[====[ IN-GAME CODE ]====]

-- try require("Folder.Filename") to include code from another file in this, so you can store code in libraries
-- the "LifeBoatAPI" is included by default in /_build/libs/ - you can use require("LifeBoatAPI") to get this, and use all the LifeBoatAPI.<functions>!

key = {"returnFlag", "busFreeFlag", "instruction", "senderAddr", "recieverAddr","data"}
incoming = {}
outgoing = {}
busChannel = 1

--setup unit
unit = {}
unit.unitType = 2
unit.address = -1

--setup address space
managedUnits = {example = {managed = false, unitType = "none", none = {}}}
unitTypeData = {none = {}, weapon = {"mainType", "subType"}}

function onTick() --input
	incoming.floatValue = input.getNumber(busChannel)
	incoming.packedData = string.pack("f", incoming.floatValue)
	incoming.int = string.unpack("I4", incoming.packedData)
	--incoming data
	incoming[1] = (incoming.int >> 31 & 1)
	incoming[2] = (incoming.int >> 30 & 1)
	incoming[3] = (incoming.int >> 23 & (2^7-1))
	incoming[4] = (incoming.int >> 16 & (2^7-1))
	incoming[5] = (incoming.int >> 9 & (2^7-1))
	incoming[6] = (incoming.int & (2^9-1))

	--default bus to setBusPassthrough
	setBusPassthrough()

	--handle incoming data

	if incoming[2] == 0 then --if active incoming bus 
		if incoming[3] == 0 then --idReq/idProv
			if incoming[1] == 0 then --idReq (Pass on)
				--pass on the idReq
				setBusPassthrough()
			elseif incoming[1] == 1 then --idProv (Handle or Pass on)
				--check the incoming idProv to see if it is able to be used by this unit, if it is take it off the bus and assign this unit the provided number. if not then pass it on.
				if (incoming[6] >> 7) == unit.unitType and unit.address == -1 then --if the two greatest data bits which indicate the type match the unit's needed type then take it off the bus and assign this unit the provided number.
					unit.address = incoming[6] & (2^7-1) --set the unit address to the address provided by the idProv
					for i = 1, 62, 1 do
						managedUnits[unit.address-i] = {managed = false, unitType = "none"}
					end
					setBusInactive()
				else --else pass it on
					setBusPassthrough()
				end
			end
		elseif incoming[3] == 1 then --clearAddr
			unit.address = -1
			setBusPassthrough()
		elseif incoming[3] == 2 then --manReq/manProv
			if incoming[1] == 0 then --manReq (Handle)
				--handle the manReq
				--TODO Handle manReq for things other than weapon
				if unit.address == -1 then --if the unit doesnt have an address send back a not available answer
					outgoing[1] = 1
					outgoing[2] = 0
					outgoing[3] = 2
					outgoing[4] = 127
					outgoing[5] = incoming[4]
					outgoing[6] = 127
				else --if the manager is available then add the unit to its list of things to manage
					outgoing[1] = 1
					outgoing[2] = 0
					outgoing[3] = 2
					outgoing[4] = unit.address
					outgoing[5] = incoming[4]
					outgoing[6] = 0
					managedUnits[incoming[4]].managed = true --set to be a managed unit
					if (incoming[6]>>7 & 2^2-1) == 0 then --if the first 2 bits of the type are empty then the unit sending the request is a weapon.
						managedUnits[incoming[4]].unitType = "weapon"
						refreshUnitType(managedUnits[incoming[4]])
						managedUnits[incoming[4]].mainType = (incoming[6] >> 4 & 2^3-1)
						managedUnits[incoming[4]].subType = (incoming[6] & 2^4-1)
					end
				end
			elseif incoming[1] == 1 then --manProv (Handle or Pass on)
				if incoming[4] == unit.address then --if the request has looped back to the sending manager then pull it off and deasign the addr
					managedUnits[incoming[5]].managed = false
					managedUnits[incoming[5]].unitType = "none"
					refreshUnitType(managedUnits[incoming[5]])
					setBusInactive()
				else --else pass it on
					setBusPassthrough()
				end
			end
		else --pass on other non recognised instructions
			setBusPassthrough()
		end
	else --else set bus inactive
		setBusInactive()
	end
	
	--add own instructions if the outgoing bus is Inactive
	if outgoing[2] == 1 then --if the outgoing bus is inactive then
		if unit.address == -1 then --if the unit doesn't have a address request one.
			outgoing[1] = 0
			outgoing[2] = 0
			outgoing[3] = 0
			outgoing[4] = 127
			outgoing[5] = 0
			outgoing[6] = unit.unitType
		end
	end

	--outbound packet
	outgoing.int = (outgoing[1] << 31 | outgoing[2] << 30 | outgoing[3] << 23 | outgoing[4] << 16 | outgoing[5] << 9 | outgoing[6])
	output.setNumber(1, outgoing.int)
	outgoing.packedData = string.pack("I4", outgoing.int)
	outgoing.floatValue = string.unpack("f", outgoing.packedData)
	output.setNumber(busChannel, outgoing.floatValue)

	--telemetry
	output.setNumber(2, unit.unitType)
	output.setNumber(3, unit.address)
end

function onDraw()
	screen.setColor(20, 20, 20)
	screen.drawClear()
	screen.setColor(0, 255, 0)
	local i = 0
	for key, value in pairs(key) do
		i = i + 1
		screen.drawText(2, (6*i)-4, string.sub(value, 1, 3) .. " = " .. incoming[value])
	end

	screen.setColor(255, 0, 0)

	for key, value in pairs(key) do
		i = i + 1
		screen.drawText(2, (6*i)-2, string.sub(value, 1, 3) .. " = " .. outgoing[value])
	end

	screen.setColor(0,0,0)

	i = i + 1
	screen.drawText(2, (6*i), "Unit Manager")
end

function setBusInactive()
	outgoing[1] = 0
	outgoing[2] = 1
	outgoing[3] = 0
	outgoing[4] = 0
	outgoing[5] = 0
	outgoing[6] = 0
end

function setBusPassthrough()
	outgoing[1] = incoming[1]
	outgoing[2] = incoming[2]
	outgoing[3] = incoming[3]
	outgoing[4] = incoming[4]
	outgoing[5] = incoming[5]
	outgoing[6] = incoming[6]
end

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