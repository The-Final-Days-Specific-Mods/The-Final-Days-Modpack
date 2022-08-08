-- stuff from debug carried here for convenience

Events.OnFillWorldObjectContextMenu.Add(function(player, context, worldobjects, test)
	if (not Valhalla:userIsRestricted() or getDebug()) and Valhalla:getSandboxVar("EnableEventCoordinationTools")
	then
		local eventMenu = Valhalla:addContextMenuSubMenu(context, getText("IGUI_VAT_eventTools"));
		local square = Valhalla:getFirstObjectSquare(worldobjects);

		player = Valhalla:getPlayer();

		if ISBuildMenu.cheat == nil
		then
			ISBuildMenu.cheat = false;
		end

		-- C:\Program Files (x86)\Steam\steamapps\common\ProjectZomboid\media\lua\client\DebugUIs\DebugContextMenu.lua
		Valhalla:addContextMenuItem(eventMenu, getText("IGUI_VAT_hordeManager"), DebugContextMenu.onHordeManager, {
			square, player
		});

		-- C:\Program Files (x86)\Steam\steamapps\common\ProjectZomboid\media\lua\client\ISUI\AdminPanel\ISAdminPanelUI.lua
		Valhalla:addContextMenuItem(eventMenu, getText("IGUI_VAT_spawnItems"), function(player)
			if ISItemsListViewer.instance
			then
				ISItemsListViewer.instance:close()
			end

			local modal = ISItemsListViewer:new(50, 200, 850, 650, player);

			modal:initialise();
			modal:addToUIManager();
		end, {
			player
		});

		-- C:\Program Files (x86)\Steam\steamapps\common\ProjectZomboid\media\lua\client\ISUI\AdminPanel\ISAdminPanelUI.lua
		Valhalla:addContextMenuItem(eventMenu, getText("IGUI_VAT_creativeMode", (ISBuildMenu.cheat and getText("IGUI_VAT_on") or getText("IGUI_VAT_off"))), function()
			ISBuildMenu.cheat = not ISBuildMenu.cheat;
		end);

		-- C:\Program Files (x86)\Steam\steamapps\common\ProjectZomboid\media\lua\client\ISUI\AdminPanel\ISAdminPanelUI.lua
		Valhalla:addContextMenuItem(eventMenu, getText("IGUI_VAT_weatherControls"), function()
			local ui = ISAdminWeather.OnOpenPanel();

			ui:onMadeActive();
		end);

		local onlinePlayers = Valhalla:getOnlinePlayers();

		if #onlinePlayers > 0
		then
			local teleportMenu = Valhalla:addContextMenuSubMenu(eventMenu, getText("IGUI_VAT_teleport"));

			for i, oPlayer in ipairs(onlinePlayers)
			do
				local oPlayerName = oPlayer:getUsername();

                if oPlayerName ~= player:getUsername()
                then
                    local pMenu = Valhalla:addContextMenuSubMenu(teleportMenu, oPlayerName);

                    -- C:\Program Files (x86)\Steam\steamapps\common\ProjectZomboid\media\lua\client\OptionScreens\ISScoreboard.lua
                    Valhalla:addContextMenuItem(pMenu, getText("IGUI_VAT_teleportYouToP"), function()
                        SendCommandToServer("/teleport " .. oPlayerName);
                    end);

                    -- C:\Program Files (x86)\Steam\steamapps\common\ProjectZomboid\media\lua\client\OptionScreens\ISScoreboard.lua
                    Valhalla:addContextMenuItem(pMenu, getText("IGUI_VAT_teleportPToYou"), function()
                        SendCommandToServer("/teleport \"" .. oPlayerName .. "\" \"" .. player:getDisplayName() .. "\"");
                    end);
                end
			end
		end
	end
end);