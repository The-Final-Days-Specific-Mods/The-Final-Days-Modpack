local function playerIsAdmin(playerObj)
    local accessLevel = playerObj:getAccessLevel();
    return accessLevel == "Admin" or accessLevel == "admin";
end

local function onClientCommand(module, command, playerObj, args)
    if module ~= "PlayerConnectionMessage" then return; end

    if command == "PlayerConnected" then
        local username = playerObj:getUsername();

        if SandboxVars.PlayerConnectionMessage.hideAdmin and playerIsAdmin(playerObj) then return end

        sendServerCommand("PlayerConnectionMessage", "PlayerConnected", {
            username = username
        });
    end
end
Events.OnClientCommand.Add(onClientCommand);
