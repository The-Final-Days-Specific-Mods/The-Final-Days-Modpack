function Valhalla.Narc:logLineToFile(file, line, args)
    args = args or {};

    args["file"] = file;
    args["line"] = line;

    --print("Valhalla.Narc:logLineToFile(" .. tostring(file) .. ", " .. tostring(line) .. ", ...)");

    sendClientCommand(Valhalla:getPlayer(), "valhallaaux", "writeToLog", args);
end


function Valhalla.Narc:reportTrapPlacement(message)
    Valhalla.Narc:logLineToFile(Valhalla.Narc.trapLogFile, message);

    processGeneralMessage(message);
end


function Valhalla.Narc:reportMoveablePickup(message)
    Valhalla.Narc:logLineToFile(Valhalla.Narc.pickupLogFile, message);
end


function Valhalla.Narc:reportPlayerActivity()
    Valhalla.Narc:logLineToFile(Valhalla.Narc.playerActivityLogFolder .. "/" .. Valhalla:getPlayer():getUsername() .. ".txt", "", {
        logTime = true,
        useTimestamp = true,
        append = false
    });
end


Events.OnServerCommand.Add(function(moduleName, command, args)
    local player = Valhalla:getPlayer();

    if moduleName == "valhallaaux_client"
    then
        --print("SERVER SENT COMMAND: " .. moduleName .. " | " .. command);

        if args["username"] and args["username"] == player:getUsername()
        then
            if command == "showSquareMoveablePickups"
            then
				if #args["results"] > 0
				then
					Valhalla:sayInColor(getText("IGUI_VN_MoveablePickupResults", #args["results"]));

					for i, item in ipairs(args["results"])
					do
						Valhalla:sayInColor(item, #args["results"]);
					end
				else
					Valhalla:sayInColor(getText("IGUI_VN_NoMoveablePickupResults"), 255, 0, 0);
				end
            end
        end
    end
end);


Events.OnGameStart.Add(function()
    -- planetalgol traps

    if type(SetTrapDown) == "function"
    then
        local oldSetTrapDown = SetTrapDown;

        SetTrapDown = function(items, result, player)
            if Valhalla:gameIsMP() and (Valhalla:getSandboxVar("EnableTrapSetKicking") or Valhalla:getSandboxVar("EnableTrapSetLogging"))
            then
                local kickPlayer = Valhalla:getSandboxVar("EnableTrapSetKicking") and Valhalla:userIsRestricted();
                local square = player:getCurrentSquare();
                local message = getText(
                    "IGUI_VN_trapChatMessage",
                    player:getUsername(),
                    Valhalla:formatXYZString(square:getX(), square:getY(), square:getZ() or 0)
                );

                if kickPlayer
                then
                    message = message .. " [" .. getText("IGUI_VN_trapKickInfo") .. "]";
                end

                if Valhalla:getSandboxVar("EnableTrapSetLogging")
                then
                    Valhalla.Narc:reportTrapPlacement(message);
                end

                if kickPlayer
                then
                    getCore():quit();

                    return false;
                end
            end

            oldSetTrapDown(items, result, player);
        end
    end

    -- container pickup

    local vanillaPickupAction = ISMoveablesAction["perform"];

    ISMoveablesAction["perform"] = function(self)
        vanillaPickupAction(self);

        if Valhalla:getSandboxVar("EnableMovPickupLogging") and self.mode == "pickup" and self.origSpriteName
        then
            local message = getText(
                "IGUI_VN_PickupLogMessage",
                self.character:getUsername(),
                Translator.getMoveableDisplayName(self.moveProps.name) .. " <" .. tostring(self.origSpriteName) .. ">",
                Valhalla:formatXYZString(self.square:getX(), self.square:getY(), self.square:getZ() or 0)
            );

            Valhalla.Narc:reportMoveablePickup(message);
        end
    end
end);


Events.EveryTenMinutes.Add(function()
    -- log player activity for future spiciness

    Valhalla.Narc:reportPlayerActivity();
end);