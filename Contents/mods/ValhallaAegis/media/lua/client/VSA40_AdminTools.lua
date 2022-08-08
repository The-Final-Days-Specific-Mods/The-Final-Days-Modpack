-- gas station


function Valhalla.AdminTools.refuelGasStation(fuelStationObject)
	local square = fuelStationObject:getSquare();

	fuelStationObject:setPipedFuelAmount(25000);

	sendClientCommand(Valhalla:getPlayer(), "valhallaaux", "refuelGasStation", {
		x = square:getX(),
		y = square:getY(),
		z = square:getZ(),
		amount = 25000
	});
end


-- safehouse zone


function Valhalla.AdminTools.createCustomSafehouse(player)
	local sizeX = 1;
	local sizeY = 1;

	Valhalla:showNumberPrompt(getText("IGUI_VAT_shDimensionsX"), 5, function(number)
		sizeX = number;

		Valhalla:showNumberPrompt(getText("IGUI_VAT_shDimensionsY"), 5, function(number)
			sizeY = number;

			Valhalla:showConfirmationDialog(getText("IGUI_VAT_confirmSHSize", sizeX, sizeY), function()
				Valhalla:showTextPrompt(getText("IGUI_VAT_shOwnerName"), player:getUsername(), function(name)
					local owner = getPlayerFromUsername(name);

					if owner
					then
						local safehouse = SafeHouse.hasSafehouse(owner);
						local square = player:getSquare();

						if safehouse
						then
							safehouse:removeSafeHouse(owner);
						end

						if sizeX > 0 and sizeY > 0
						then
							SafeHouse.addSafeHouse(square:getX() - (sizeX / 2), square:getY() - (sizeY / 2), sizeX, sizeY, name, true);
						else
							Valhalla:say(getText("IGUI_VAT_invalidSHSize"));
						end
					else
						Valhalla:say(getText("IGUI_VAT_playerNEOrNO"));
					end
				end);
			end);
		end, 1, 50);
	end, 1, 50);
end


-- events


Events.OnFillWorldObjectContextMenu.Add(function(player, context, worldobjects, test)
	if Valhalla:playerIsAdmin() or getDebug()
	then
		player = Valhalla:getPlayer();

		local adminMenu = Valhalla:addContextMenuSubMenu(context, getText("IGUI_VAT_adminTools"));
		local square = player:getSquare();

		-- refuel

		local fuelStationObject = Valhalla.AdminTools:findFuelStationObject(worldobjects);

		if fuelStationObject
		then
			Valhalla:addContextMenuItem(adminMenu,
				getText("IGUI_VAT_refuel_25k") .. " (" .. tostring(fuelStationObject:getPipedFuelAmount()) .. ")",
				Valhalla.AdminTools.refuelGasStation, {
					fuelStationObject
				}
			);
		end

        -- vehicle management

        Valhalla.VehicleClaims:addAdminContextMenu(adminMenu, player);

		-- safehouse declaration

        local shTooltip = nil;
        local version = getCore():getGameVersion();
        local olderVersion = version:getMajor() == 41 and version:getMinor() < 66;

        if not olderVersion
        then
            shTooltip = getText("IGUI_VAT_shClaimDeprecated");
        end

        Valhalla:addContextMenuItem(adminMenu, getText("IGUI_VAT_shZoneCreate"), Valhalla.AdminTools.createCustomSafehouse, {
            player
        }, {
            disabled =  Valhalla:squareIsInSafehouse(square) or SafeHouse.getSafeHouse(square) or not olderVersion,
            tip = shTooltip
        });

        -- check location for pickups

		if Valhalla:getSandboxVar("EnableMovPickupLogging")
		then
			Valhalla:addContextMenuItem(adminMenu, getText("IGUI_VAT_findPickupsOnSquare"), function(player, square)
				sendClientCommand(Valhalla:getPlayer(), "valhallaaux", "checkSquareForMoveablePickup", {
					x = square:getX(),
					y = square:getY(),
					z = square:getZ()
				});
			end, {
				player, square
			});
		end
	end
end);