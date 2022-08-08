-- player stuff


function Valhalla:getPlayer()
	if Valhalla.currentPlayer
	then
		return Valhalla.currentPlayer;
	end

	return getPlayer();
end


function Valhalla:savePlayerModData(player, skipSync)
	Valhalla:saveModData(player);

	if Valhalla.VehicleClaims.enabled and not skipSync
	then
		Valhalla.VehicleClaims.savePlayerVehicleList();
	end
end


function Valhalla:say(message, player)
	if not player
	then
		player = Valhalla:getPlayer();
	end

	--player:Say(message, Valhalla.speechR, Valhalla.speechG, Valhalla.speechB, UIFont.Small, 30.0, "radio");
    player:setHaloNote(message, Valhalla.speechR * 255, Valhalla.speechG * 255, Valhalla.speechB * 255, 300);

	if getDebug()
	then
		print(message);
	end
end


function Valhalla:sayInColor(message, r, g, b)
	message = string.format("*%s,%s,%s* %s",
		r or Valhalla.speechR * 255,
		g or Valhalla.speechG * 255,
		b or Valhalla.speechB * 255,
		message
	);

	processSayMessage(message);
end


function Valhalla:sayIfDifferentObject(object, message, player)
	--if object ~= Valhalla.lastErrorObj
	--then
		Valhalla:say(message, player);
	--end

	--Valhalla.lastErrorObj = object;
end


function Valhalla:userIsRestricted()
	return Valhalla:gameIsMP() and (not getAccessLevel() or getAccessLevel() == "" or getAccessLevel() == "None" or getAccessLevel() == "none");
end


function Valhalla:playerIsAdmin()
	if isAdmin() or (Valhalla:gameIsMP() and getAccessLevel() == "admin") -- or isCoopHost()
	then
		return true;
	else
		return false;
	end
end


function Valhalla:gameIsSP()
	return isClient() == false;
end


function Valhalla:gameIsMP()
	return not Valhalla:gameIsSP();
end


-- vehicle stuff


function Valhalla:getClosestVehicle(player)
	if not player
    then
        player = Valhalla:getPlayer();
    end

    local vehicle = player:getVehicle();

    if vehicle == nil
    then
        vehicle = Valhalla.lastVehicle;
    end

	if vehicle == nil
    then
        vehicle = ISVehicleMenu.getVehicleToInteractWith(player);
    end

    return vehicle;
end


function Valhalla:getVehicleName(vehicle)
	return ISVehicleMenu.getVehicleDisplayName(vehicle);
end


function Valhalla:saveVehicleModData(vehicle, data, printValues)
	Valhalla.VehicleClaims:sendClientCommand(vehicle, "setVehicleData", data);

    if printValues
    then
		for k, v in pairs(data or {})
		do
			print(tostring(k) .. " = " .. tostring(v));
		end
    end
end


-- shortcuts


function Valhalla:getSafehouseToSquare(square)
    return SafeHouse.getSafeHouse(square);
end


function Valhalla:executeOncePerObject(object, fn)
	if object ~= Valhalla.lastExecObj
	then
		fn();
	end

	Valhalla.lastExecObj = object;
end


function Valhalla:getFirstObjectSquare(objects)
	for i, obj in ipairs(objects)
	do
		if obj:getSquare()
		then
			return obj:getSquare();
		end
	end

	return nil;
end


function Valhalla:highlightSquare(square, state, r, g, b)
	if type(square) == "table"
	then
		square = getSquare(square.x, square.y, 0);
	end

    local objects = square:getObjects();

    for i = 0, objects:size() - 1
    do
        local object = objects:get(i);
        local sprite = object:getSprite();

        if sprite and sprite:getName()
        then
			local spriteName = string.sub(sprite:getName(), 0, 7);

			if not object:isHighlighted() and (spriteName == "floors_" or spriteName == "blends_")
			then
				object:setHighlighted(state);
				object:setHighlightColor(
					r or Valhalla.speechR,
					g or Valhalla.speechG,
					b or Valhalla.speechB,
				1);
			end
        end
    end
end


-- checks


function Valhalla:squareIsInSafehouse(square)
	return Valhalla:getSafehouseToSquare(square) ~= nil;
end


function Valhalla:objectIsContainer(object)
	return object and object.getContainerCount and object:getContainerCount() > 0;
end


-- context menus


function Valhalla:addContextMenuItem(context, text, handler, params, options)
    return Valhalla:createContextMenuOption(context, text, handler, params, Valhalla:mergeArrays({
        isSubMenu = false
    }, options));
end


function Valhalla:addContextMenuSubMenu(context, text, handler, params, options)
    return Valhalla:createContextMenuOption(context, text, handler, params, Valhalla:mergeArrays({
        isSubMenu = true
    }, options));
end


function Valhalla:createContextMenuOption(context, text, handler, params, options)
    -- C:\Program Files (x86)\Steam\steamapps\common\ProjectZomboid\media\lua\client\ISUI\ISContextMenu.lua
    -- ISContextMenu:addOption(name, target, onSelect, param1, param2, param3, param4, param5, param6, param7, param8, param9, param10)

    if not params
    then
        params = {};
    end

    local entry = context:addOption(
        text or nil,
        params[1] or nil,
        handler or nil,
        params[2] or nil,
        params[3] or nil,
        params[4] or nil,
        params[5] or nil,
        params[6] or nil
    );

    entry.notAvailable = options.disabled;

    if options.tip ~= nil and options.tip ~= "" and string.sub(options.tip, 0, 5) ~= "IGUI_"
    then
        entry.toolTip = ISWorldObjectContextMenu.addToolTip();
        entry.toolTip.description = options.tip;
    end

    if options.isSubMenu
    then
        local menu = ISContextMenu:getNew(context);
        context:addSubMenu(entry, menu);

        return menu;
    else
        return entry;
    end
end


function Valhalla:disableContextMenuItem(contextMenu, optionText)
	for i,option in ipairs(contextMenu.options)
	do
		if string.find(option.name, optionText)
		then
			contextMenu.options[i].notAvailable = true;

			return true;
		end
	end
end