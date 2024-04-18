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

busChannel = 10
id = -1
roundTripTicks = 0
passOn = false


function onTick()
    --#region house keeping

    --#endregion

    --#region reads the value of the incoming bus and disassembles it into its parts
    busInput = string.unpack("i8", string.pack("f", input.getNumber(busChannel)))
    returnFlag = readBits(busInput, 32, 1)
    busActive = readBits(busInput, 31, 1)
    busInstruction = readBits(busInput, 30, 7)
    busSender = readBits(busInput, 23, 7)
    busTarget = readBits(busInput, 16, 7)
    busData = readBits(busInput, 9, 9)
    --#endregion

    --#region handle incoming instruction
    if busActive == 0 then                      --if there is data on the bus service it
        if busInstruction == 0 then             --if the bus has an id opCode on it
            if returnFlag == 0 then           --if another unit is sending an idRequest then pass it on
                --forward the instruction
                returnFlagOut = returnFlag
                busActiveOut = busActive
                busInstructionOut = busInstruction
                busSenderOut = busSender
                busTargetOut = busTarget
                busDataOut = busData
            else                                --if it is the master sending out an id op then service it
                id = busData + 1                --set id to busData plus 1
                --forward the instruction but incriment the busData by 1
                returnFlagOut = returnFlag
                busActiveOut = busActive
                busInstructionOut = busInstruction
                busSenderOut = busSender
                busTargetOut = busTarget
                busDataOut = busData + 1
            end
        elseif busTarget == id then             --if the bus has an instruction for this unit
            if busInstruction == 0 then
                --error
            elseif busInstruction == 1 then
                --error
            end
        elseif busTarget == 127 then            --if the bus has a broadcast on it
            if busInstruction == 1 then
                if returnFlag == 0 then
                    --error
                else
                    roundTripTicks = busData
                end
            end
        end
--#endregion
    else                                            --if there is no data on the bus
    --#region send out own instructions
        if id == -1 then                            --if this unit does not yet have an id, send out an idRequest op
            returnFlagOut = 0
            busActiveOut = 0
            busInstructionOut = 0
            busSenderOut = 1                        --assumes it is the first unit in the ring
            busTargetOut = 0
            busDataOut = 0
        else
            returnFlag = 0
            busActiveOut = 1
            busInstructionOut = 127
            busSenderOut = id
            busTargetOut = 0
            busDataOut = 0
        end
    end
    --#endregion
    
    --#region takes the data set by this unit and outputs it on the bus
    busOutput = 0
    busOutput = writeBits(busOutput, 32, 32, returnFlagOut)
    busOutput = writeBits(busOutput, 31, 31, busActiveOut)
    busOutput = writeBits(busOutput, 30, 24, busInstructionOut)
    busOutput = writeBits(busOutput, 23, 17, busSenderOut)
    busOutput = writeBits(busOutput, 16, 10, busTargetOut)
    busOutput = writeBits(busOutput, 9, 1, busDataOut)
    output.setNumber(busChannel, string.unpack("f", string.pack("i8", busOutput)))
    --#endregion

    --#region passes everything that isnt the bus through
    for i = 1, 32, 1 do
        if i ~= busChannel then
            output.setNumber(i,input.getNumber(i))
        end
        output.setBool(i,input.getBool(i))
    end
    --#endregion
    output.setNumber(1, busActive)
    output.setNumber(2, busActiveOut)
    output.setNumber(3, id)
end
