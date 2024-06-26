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
idMaster = 0
roundTripTicks = 0

updatedRoundTripTicks = 0
numberOfUnitsConnected = 0
ticksSinceNumberOfUnitsWasUpdated = 0
waitingForID = false

returnFlag = 0
busActive = 1
busInstruction = 0
busSender = 0
busTarget = 0
busData = 0





function onTick()
    --#region house keeping
    ticksSinceNumberOfUnitsWasUpdated = ticksSinceNumberOfUnitsWasUpdated + 1   --ticks up the time since the number of units was last updated
    if waitingForID then                                                        --if the master is waiting for an id it will increment the 
        updatedRoundTripTicks = updatedRoundTripTicks + 1
    else
        updatedRoundTripTicks = 0
    end
    --#endregion

    --#region reads the value of the incoming bus and disassembles it into its parts
    busInput = string.unpack("i", string.pack("f", input.getNumber(busChannel)))
    returnFlag = readBits(busInput, 32, 1)
    busActive = readBits(busInput, 31, 1)
    busInstruction = readBits(busInput, 30, 7)
    busSender = readBits(busInput, 23, 7)
    busTarget = readBits(busInput, 16, 7)
    busData = readBits(busInput, 9, 9)
    --#endregion

    --#region handle incoming bus
    if busActive == 0 then                                      --if there is data on the bus
        if busInstruction == 0 then                             --if the bus has an id opCode on it
            if returnFlag == 0 and busSender ~= 0 then          --if another unit is requesting an id call
                if not waitingForID then                        --if there is not an id op on the ring then send one out.
                    --setup the instruction
                    returnFlagOut = 1
                    busActiveOut = 0
                    busInstructionOut = 0
                    busSenderOut = idMaster
                    busTargetOut = idMaster
                    busDataOut = 0
                    --other stuff
                    waitingForID = true
                end
            elseif returnFlag == 1 then
                if roundTripTicks ~= updatedRoundTripTicks then --if the round trip time has changed then send out a rt update with the new value
                    returnFlagOut = 1
                    busActiveOut = 0
                    busInstructionOut = 1
                    busSenderOut = idMaster
                    busTargetOut = 127
                    busDataOut = updatedRoundTripTicks
                end

                roundTripTicks = updatedRoundTripTicks
                numberOfUnitsConnected = busData
                waitingForID = false
                ticksSinceNumberOfUnitsWasUpdated = 0
            end
        elseif busTarget == idMaster then                       --if the bus has a packet for this unit
            if busInstruction == 1 then
                if returnFlag == 0 then
                    returnFlagOut = 1
                    busActiveOut = 0
                    busInstructionOut = busInstruction
                    busSenderOut = idMaster
                    busTargetOut = 127
                    busDataOut = roundTripTicks
                else
                    --error
                end
            end
        elseif busTarget == 127 then                            --if the bus has a broadcast on it
            if busSender == idMaster then                       --if the sender is this unit then the broadcast has done a full loop on the ring.
                busActiveOut = 1                                                
            end
            --broadcast
        end
    --#endregion
    elseif busActive ~= 0 or busActiveOut ~= 0 then             --if the bus was not active or there is nothing exiting this unit
    --#region Send out own instructions
        if ticksSinceNumberOfUnitsWasUpdated > 60 then          --if it has been more than x ticks since the number of units was updated send out an id op
            returnFlagOut = 1
            busActiveOut = 0
            busInstructionOut = 0
            busSenderOut = 0
            busTargetOut = 0
            busData = 0
        else                                                    --else set gracefully set the bus to inactive
            returnFlagOut = 0
            busActiveOut = 1
            busInstructionOut = 127
            busSenderOut = idMaster
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
    output.setNumber(1, busActive)
    output.setNumber(2, busActiveOut)
    output.setNumber(3, idMaster)
    --#endregion
end
