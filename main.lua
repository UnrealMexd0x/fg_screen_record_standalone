local FiveGuard = nil
local AntiCheat = nil

-- Your Commands
RecordC = "record1"
ScreenC = "screenshot1"

-- Your ACE 'add_ace group.admin test allow'
RecordACE = "test"
ScreenACE = "test"

RegisterCommand(RecordC, function(source, args)
    while FiveGuard == nil do Wait(1000) end
    local playerSource, recordTime = nil

    _source = source

    if _source ~= 0 then
        if IsPlayerAceAllowed(_source, RecordACE) then
            playerSource = tonumber(args[1])
            recordTime = tonumber(args[2]) * 1000
            if recordTime > 10000 then
                recordTime = 10000
            end
        else
            return
        end
    elseif _source == 0 then
        if args[2] == nil or (args[1] and args[2] == nil) then
            Console("No player or wrong command:^3 " .. RecordC .. " ^0[ID] [Time in Sec]")
            return
        else
            playerSource = tonumber(args[1])
            recordTime = tonumber(args[2]) * 1000
            if recordTime > 10000 then
                recordTime = 10000
            end
        end
    end

    local function screenRecordHandler(url)
        if url then
            Console("Screen recording successful!", url)
        else
            Console("Script Error!")
        end
    end

    if playerSource and recordTime then
        exports[FiveGuard]:recordPlayerScreen(playerSource, recordTime, screenRecordHandler)
    end
end, false)

RegisterCommand(ScreenC, function(source, args)
    while FiveGuard == nil do Wait(1000) end
    local playerSource = nil

    _source = source

    if _source ~= 0 then
        if IsPlayerAceAllowed(_source, ScreenACE) then
            playerSource = tonumber(args[1])
        else
            return
        end
    elseif _source == 0 then
        if args[1] == nil then
            Console("No player or wrong command:^3 " .. ScreenC .. " ^0[ID]")
            return
        else
            playerSource = tonumber(args[1])
        end
    end

    local function screenshotHandler(url)
        if url then
            Console("Screenshot successfully created!", url)
        else
            Console("Script Error!")
        end
    end

    if playerSource then
        exports[FiveGuard]:screenshotPlayer(playerSource, screenshotHandler)
    end
end, false)

function Console(msg, url)
    if url == nil then
        print("^5[FG_ADDON]^1 " .. msg .. "^0")
    elseif msg == nil and url == nil then
        print("^5[FG_ADDON]^1 ERROR^0")
    else
        print("^5[FG_ADDON]^0 " .. msg .. "^3[" .. url .. "]^0")
    end
end

AddEventHandler("fg:ExportsLoaded", function(fiveguard_res, res)
    if res == "*" or res == GetCurrentResourceName() then
        FiveGuard = fiveguard_res
    end
end)
