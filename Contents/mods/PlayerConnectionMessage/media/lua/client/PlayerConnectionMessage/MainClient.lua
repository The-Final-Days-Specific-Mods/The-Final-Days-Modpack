local ChatSystem = require("PlayerConnectionMessage/ChatSystem");

local PlayerConnectionMessage = {};
local onlinePlayersList = ArrayList.new();

function PlayerConnectionMessage.getOnlineUsernames()
    return onlinePlayersList;
end

--- Add events
LuaEventManager.AddEvent("OnPlayerConnecting");
LuaEventManager.AddEvent("OnPlayerConnected");
LuaEventManager.AddEvent("OnPlayerDisconnected");

--- OnScoreboardUpdate
local function onScoreboardUpdate(usernames, displayNames, steamIDs)
    local lastConnected = ArrayList.new(onlinePlayersList);
    local connected = ArrayList.new();

    -- Get all connected player
    for i = 0, usernames:size() - 1 do
        local username = usernames:get(i);
        if username then
            connected:add(username);
        end
    end

    -- Update online list now
    onlinePlayersList = connected;

    -- Trigger new connected
    for i = 0, usernames:size() - 1 do
        local username = usernames:get(i);
        if username then
            if not lastConnected:contains(username) then
                triggerEvent("OnPlayerConnecting", username);
            end
        end
    end

    -- Trigger new disconnected
    for i = 0, lastConnected:size() - 1 do
        local username = lastConnected:get(i);
        if not connected:contains(username) then
            triggerEvent("OnPlayerDisconnected", username);
        end
    end
end
Events.OnScoreboardUpdate.Add(onScoreboardUpdate);

--- OnPlayerConnecting
local function onPlayerConnecting(username)
    ---ChatSystem.addLineToChat("[Server] " .. username .. " is connecting...", "<RGB:0,0.7,1>");
end
Events["OnPlayerConnecting"].Add(onPlayerConnecting);

--- OnPlayerConnected
local function onPlayerConnected(username)
    local color = SandboxVars.PlayerConnectionMessage.connectedMessageColorRed .. "," .. SandboxVars.PlayerConnectionMessage.connectedMessageColorGreen .. "," .. SandboxVars.PlayerConnectionMessage.connectedMessageColorBlue
    ChatSystem.addLineToChat(getText("IGUI_PlayerConnectionMessage_Connected", username), "<RGB:" .. color .. ">");
end
Events["OnPlayerConnected"].Add(onPlayerConnected);

--- OnPlayerDisconnected
local function onPlayerDisconnected(username)
    local color = SandboxVars.PlayerConnectionMessage.disconnectedMessageColorRed .. "," .. SandboxVars.PlayerConnectionMessage.disconnectedMessageColorGreen .. "," .. SandboxVars.PlayerConnectionMessage.disconnectedMessageColorBlue
    ChatSystem.addLineToChat(getText("IGUI_PlayerConnectionMessage_Disconnected", username), "<RGB:" .. color .. ">");
end
Events["OnPlayerDisconnected"].Add(onPlayerDisconnected);

--- init
local function init()
    Events.OnTick.Remove(init);
    sendClientCommand("PlayerConnectionMessage", "PlayerConnected", {});
end
Events.OnTick.Add(init);

--- onServerCommand
local function onServerCommand(module, command, args)
    if module ~= "PlayerConnectionMessage" then return; end

    if command == "PlayerConnected" then
        triggerEvent("OnPlayerConnected", args.username);
    end
end
Events.OnServerCommand.Add(onServerCommand);

--- onTick
if isClient() then
    local ticks = 0;
    local function onTick()
        ticks = ticks + 1;
        if ticks > 400 then
            ticks = 0;
            scoreboardUpdate();
        end
    end
    Events.OnTick.Add(onTick);

    local function init()
        scoreboardUpdate();
        Events.OnTick.Remove(init);
    end
    Events.OnTick.Add(init);
end

return PlayerConnectionMessage;
