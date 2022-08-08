if isClient() then return end
-- playerzombiekillrank = {}
local function OnClientCommand_rank(module, command, player, args)
    if module=="zombiekillrank"then
        if getGameTime():getModData().zombieranking == nil then
            getGameTime():getModData().zombieranking={}
            
        end

        getGameTime():getModData().zombieranking[args[1]]=args[2]
    end
end

Events.OnClientCommand.Add(OnClientCommand_rank)



local function EveryHoursupdatezombie_server()
    if getGameTime():getModData().zombieranking~={} and getGameTime():getModData().zombieranking~=nil then
        sendServerCommand("rank_fromserver","true",getGameTime():getModData().zombieranking)
    end
end


-- Events.EveryHours.Add(EveryHoursupdatezombie_server)
Events.EveryTenMinutes.Add(EveryHoursupdatezombie_server)
-- Events.OnGameStart.Add(EveryHoursupdatezombie_server)