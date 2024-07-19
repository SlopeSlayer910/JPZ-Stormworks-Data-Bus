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
	simulator:setProperty("Main Type", 1)
	simulator:setProperty("Sub Type", 1)

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
unit.unitType = 1
unit.address = -1
unit.manager = -1
unit.weapon = {}
unit.weapon.mainType = property.getNumber("Main Type")
unit.weapon.subType = property.getNumber("Sub Type")
unit.timeSinceManReq = 0

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
	if incoming[2] == 0 then
		if incoming[3] == 0 then --idReq/idProv
			if incoming[1] == 0 then --idReq
				--pass on the idReq
				setBusPassthrough()
			elseif incoming[1] == 1 then --idProv
				--check the incoming idProv to see if it is able to be used by this unit, if it is take it off the bus and assign this unit the provided number. if not then pass it on.
				if (incoming[6] >> 7) == unit.unitType and unit.address == -1 and (incoming[6] & 2^7-1) > 0  then --if the two greatest data bits which indicate the type match the unit's needed type and the address is valid then take it off the bus and assign this unit the provided number. if not then pass it on.
					unit.address = incoming[6] & (2^7-1) --set the unit address to the address provided by the idProv
					setBusInactive()
				else --else pass it on
					setBusPassthrough()
				end
			end
		elseif incoming[3] == 1 then --clearAddr
			unit.address = -1
			setBusPassthrough()
		elseif incoming[3] == 2 then --manReq/manProv
			if incoming[1] == 0 then --manReq
				--pass on the manReq
				setBusPassthrough()
			elseif incoming[1] == 1 then --manProv
				--check the incoming manProv to see if it is addresssed to this unit, if it is take it off the bus and assign this unit the provided number. if not then pass it on.
				if incoming[5] == unit.address then --if the targetAddress is the unit's then take it off the bus and assign this unit the provided number. if not then pass it on.
					if incoming[4] == 127 then --if the manProv has a broadcast address assume the there is no man unit available and set manager to -1
						unit.manager = -1
					else --else use the provided manager
						unit.manager = incoming[4] --set the manager address to the sender address provided by the manProv
					end
					setBusInactive()
				else
					setBusPassthrough()
				end
			end
		else
			setBusPassthrough()
		end
	else
		setBusInactive()
	end
	
	--add own instructions if the outgoing bus is Inactive
	if outgoing[2] == 1 then --if the outgoing bus is inactive then
		if unit.address == -1 then --if the unit doesnt have an address request one
			outgoing[1] = 0
			outgoing[2] = 0
			outgoing[3] = 0
			outgoing[4] = 127
			outgoing[5] = 0
			outgoing[6] = unit.unitType
		elseif unit.manager == -1 and unit.timeSinceManReq > 60 then --else if the unit doesn't have a manager and hasnt requested one recently request one.
			unit.timeSinceManReq = 0
			outgoing[1] = 0
			outgoing[2] = 0
			outgoing[3] = 2
			outgoing[4] = unit.address
			outgoing[5] = 127
			outgoing[6] = (unit.weapon.mainType & (2^3-1) << 4) | (unit.weapon.subType & (2^4-1))
		elseif false then 
		end
	end

	--outbound packet
	outgoing.int = (outgoing[1] << 31 | outgoing[2] << 30 | outgoing[3] << 23 | outgoing[4] << 16 | outgoing[5] << 9 | outgoing[6])
	output.setNumber(1, outgoing.int)
	outgoing.packedData = string.pack("I4", outgoing.int)
	outgoing.floatValue = string.unpack("f", outgoing.packedData)
	output.setNumber(busChannel, outgoing.floatValue)

	--update timers
	unit.timeSinceManReq = unit.timeSinceManReq + 1

	--telemetry
	output.setNumber(2, unit.unitType)
	output.setNumber(3, unit.address)
	output.setNumber(4, unit.manager)
end

function onDraw()
	screen.setColor(20, 20, 20)
	screen.drawClear()
	screen.setColor(0, 255, 0)
	local i = 0
	for key, value in pairs(key) do
		i = i + 1
		screen.drawText(2, 6*i-4, string.sub(value, 1, 3) .. " = " .. incoming[value])
	end

	screen.setColor(255, 0, 0)

	for key, value in pairs(key) do
		i = i + 1
		screen.drawText(2, 6*i-2, string.sub(value, 1, 3) .. " = " .. outgoing[value])
	end

	screen.setColor(0,0,0)

	i = i + 1
	screen.drawText(2, 6*i, "Weapon")
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