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
unit.type = 1
unit.address = -1

function onTick() --input
	incoming.floatValue = input.getNumber(busChannel)
	incoming.packedData = string.pack("f", incoming.floatValue)
	incoming.int = string.unpack("I4", incoming.packedData)
	--incoming data
	incoming[key[1]] = (incoming.int >> 31 & 1)
	incoming[key[2]] = (incoming.int >> 30 & 1)
	incoming[key[3]] = (incoming.int >> 23 & (2^7-1))
	incoming[key[4]] = (incoming.int >> 16 & (2^7-1))
	incoming[key[5]] = (incoming.int >> 9 & (2^7-1))
	incoming[key[6]] = (incoming.int & (2^9-1))

	--default bus to setBusPassthrough
	setBusPassthrough()

	--handle incoming data

	if incoming[key[2]] == 0 then
		if incoming[key[3]] == 0 then --idReq/idProv
			if incoming[key[1]] == 0 then --idReq
				--pass on the idReq
				setBusPassthrough()
			elseif incoming[key[1]] == 1 then --idProv
				--check the incoming idProv to see if it is able to be used by this unit, if it is take it off the bus and assign this unit the provided number. if not then pass it on.
				if (incoming[key[6]] >> 7) == unit.type and unit.address == -1 then --if the two greatest data bits which indicate the type match the unit's needed type then take it off the bus and assign this unit the provided number. if not then pass it on.
					unit.address = incoming[key[6]] & (2^7-1) --set the unit address to the address provided by the idProv
					setBusInactive()
				else
					setBusPassthrough()
				end
			end
		elseif incoming[key[3]] == 1 then --clearAddr
			unit.address = -1
			setBusPassthrough()
		else
			setBusPassthrough()
		end
	else
		setBusInactive()
	end
	
	--add own instructions if the outgoing bus is Inactive
	if outgoing[key[2]] == 1 then --if the outgoing bus is inactive then
		if unit.address == -1 then
			outgoing[key[1]] = 0
			outgoing[key[2]] = 0
			outgoing[key[3]] = 0
			outgoing[key[4]] = 127
			outgoing[key[5]] = 0
			outgoing[key[6]] = unit.type
		end
	end

	--outbound packet
	outgoing.int = (outgoing[key[1]] << 31 | outgoing[key[2]] << 30 | outgoing[key[3]] << 23 | outgoing[key[4]] << 16 | outgoing[key[5]] << 9 | outgoing[key[6]])
	output.setNumber(1, outgoing.int)
	outgoing.packedData = string.pack("I4", outgoing.int)
	outgoing.floatValue = string.unpack("f", outgoing.packedData)
	output.setNumber(busChannel, outgoing.floatValue)

	--telemetry
	output.setNumber(2, unit.type)
	output.setNumber(3, unit.address)
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
	screen.drawText(2, 6*i, "Unit")
end

function setBusInactive()
	outgoing[key[1]] = 0
	outgoing[key[2]] = 1
	outgoing[key[3]] = 0
	outgoing[key[4]] = 0
	outgoing[key[5]] = 0
	outgoing[key[6]] = 0
end

function setBusPassthrough()
	outgoing[key[1]] = incoming[key[1]]
	outgoing[key[2]] = incoming[key[2]]
	outgoing[key[3]] = incoming[key[3]]
	outgoing[key[4]] = incoming[key[4]]
	outgoing[key[5]] = incoming[key[5]]
	outgoing[key[6]] = incoming[key[6]]
end