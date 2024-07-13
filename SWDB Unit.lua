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
--[[
function uint32ToBoolTable(uint32Value)
    local boolTable = {}
    local mask = 1

    for i = 32, 1, -1 do
        boolTable[i] = (uint32Value & mask) ~= 0
        mask = mask << 1
    end

    return boolTable
end

function onTick()
	float = input.getNumber(2)
	packedData = string.pack("f", float)
	int = string.unpack("I4", packedData)
	output.setNumber(1, int)
	output.setNumber(2, float)
	boolTable = uint32ToBoolTable(int)
	for i = 1, 32, 1 do
		output.setBool(i, boolTable[i])
	end
	returnFlag = (int >> 31 & 1)
	activeFlag = {int >> 30 & 1}
	instructions = (int >> 23 & (2^7-1))
	senderAddr = (int >> 16 & (2^7-1))
	reciverAddr = (int >> 9 & (2^7-1))
	data = (int & (2^9-1))
	output.setNumber(3, instructions)
	output.setNumber(4, senderAddr)
	output.setNumber(5, reciverAddr)
	output.setNumber(6, data)
end
--]]

keys = {"returnFlag", "active", "inst", "sender", "reciever","data"}
incoming = {}
outgoing = {}
function onTick() --input
    incoming.floatValue = input.getNumber(2)
    incoming.packedData = string.pack("f", incoming.floatValue)
	incoming.int = string.unpack("I4", incoming.packedData)
    --incoming data
    incoming[keys[1]] = (incoming.int >> 31 & 1)
	incoming[keys[2]] = (incoming.int >> 30 & 1)
	incoming[keys[3]] = (incoming.int >> 23 & (2^7-1))
	incoming[keys[4]] = (incoming.int >> 16 & (2^7-1))
	incoming[keys[5]] = (incoming.int >> 9 & (2^7-1))
	incoming[keys[6]] = (incoming.int & (2^9-1))

    --outgoing data
    outgoing[keys[1]] = 1
    outgoing[keys[2]] = 1
    outgoing[keys[3]] = 126
    outgoing[keys[4]] = 127
    outgoing[keys[5]] = 63
    outgoing[keys[6]] = incoming[keys[6]] + 1

    --outbound packet
    outgoing.int = (outgoing[keys[1]] << 31 | outgoing[keys[2]] << 30 | outgoing[keys[3]] << 23 | outgoing[keys[4]] << 16 | outgoing[keys[5]] << 9 | outgoing[keys[6]])
    output.setNumber(1, outgoing.int)
    outgoing.packedData = string.pack("I4", outgoing.int)
    outgoing.floatValue = string.unpack("f", outgoing.packedData)
    output.setNumber(2, outgoing.floatValue)
end

function onDraw()
    screen.setColor(20, 20, 20)
	screen.drawClear()
	screen.setColor(0, 255, 0)
    local i = 0
    for key, value in pairs(keys) do
        i = i + 1
        screen.drawText(2, 6*i-4, string.sub(value, 1, 3) .. " = " .. incoming[value])
    end

    screen.setColor(255, 0, 0)

    for key, value in pairs(keys) do
        i = i + 1
        screen.drawText(2, 6*i-2, string.sub(value, 1, 3) .. " = " .. outgoing[value])
    end
end