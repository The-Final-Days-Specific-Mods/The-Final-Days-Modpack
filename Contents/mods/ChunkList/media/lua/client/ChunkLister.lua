ChunkList = ChunkList:mergeArrays(ChunkList, {
    speechR = 255 / 255,
	speechG = 87 / 255,
	speechB = 87 / 255,

    selectionActive = false,
    highlightTask = nil,
    highlightCoords = {},

    dumpList = {},
});

Events.OnFillWorldObjectContextMenu.Add(function(player, contextMenu, worldObjects)
    if ChunkList:playerIsAdmin()
    then
        local listerMenu = ChunkList:addContextMenuSubMenu(contextMenu, "Chunk list");
        local selectionActive = ChunkList["selectionActive"] ~= false;

        ChunkList:addContextMenuItem(listerMenu, getText("IGUI_CL_BeginList"), function()
            ChunkList:showTextPrompt(getText("IGUI_CL_ListName"), "mylist", function(text)
                if string.len(text) > 0
                then
                    ChunkList:startSelection(text);
                end
            end);
        end, nil, {
            disabled = selectionActive,
            tip = not selectionActive
                and getText("IGUI_CL_BeginListTip")
                or getText("IGUI_CL_NeedToDumpTip")
        });

        ChunkList:addContextMenuItem(listerMenu, getText("IGUI_CL_DumpList"), function()
            local fileName = ChunkList["selectionActive"];

            ChunkList:stopSelection();
            ChunkList:dumpSelection(fileName);
        end, nil, {
            disabled = not selectionActive,
            tip = selectionActive
                and getText("IGUI_CL_DumpListTip")
                or getText("IGUI_CL_NeedToStartTip")
        });
    end
end);

function ChunkList:startSelection(name)
    ChunkList["selectionActive"] = name;
    ChunkList["dumpList"] = {};
    ChunkList["highlightCoords"] = {};

    local player = getPlayer();

    ChunkList["highlightTask"] = function()
        local chunk = player:getSquare():getChunk();
        local wx = ChunkList:getFieldValue(chunk, "wx");
        local wy = ChunkList:getFieldValue(chunk, "wy");
        local key = tostring(wx) .. "_" .. tostring(wy);

        if not ChunkList["dumpList"][key]
        then
            ChunkList["dumpList"][key] = true;

            for i, coord in ipairs(ChunkList:getBoundarySquares(wx, wy))
            do
                ChunkList:addUniqueCoord(ChunkList["highlightCoords"], coord);
            end

            PARP:say("New chunk: " .. key);
        end

        ChunkList:highlightSquares(ChunkList["highlightCoords"]);
    end;

    Events.OnPlayerUpdate.Add(ChunkList["highlightTask"]);
end

function ChunkList:stopSelection()
    if ChunkList["highlightTask"]
    then
        Events.OnPlayerUpdate.Remove(ChunkList["highlightTask"]);
    end

    ChunkList["selectionActive"] = false;
end

function ChunkList:dumpSelection(fileName)
    local chunks = {};

    for chunkxy, garbage in pairs(ChunkList["dumpList"])
    do
        table.insert(chunks, chunkxy);
    end

    sendClientCommand(getPlayer(), "chunk_list", "dumpList", {
        fileName = fileName,
        chunks = chunks,
    });
end

-- helper crap

function ChunkList:getBoundarySquares(wx, wy)
    local tr = {
        wx * 10, wy * 10
    };
    local tl = {
        tr[1], tr[2] + 9
    };
    local br = {
        tr[1] + 9, tr[2]
    };
    local bl = {
        tr[1] + 9, tr[2] + 9
    };
    local squares = {
        tr, tl, br, bl
    };

    for i = 1, 8
    do
        if i < 3 or i > 6
        then
            ChunkList:addUniqueCoord(squares, { -- right line
                tr[1] + i,
                tr[2]
            });
            ChunkList:addUniqueCoord(squares, { -- top line
                tr[1],
                tr[2] + i
            });
            ChunkList:addUniqueCoord(squares, { -- bottom line
                br[1],
                br[2] + i
            });
            ChunkList:addUniqueCoord(squares, { -- left line
                tl[1] + i,
                tl[2]
            });
        end
    end

    return squares;
end

function ChunkList:addUniqueCoord(array, item)
    if not ChunkList:coordIsInArray(array, item)
    then
        print("adding item");
        table.insert(array, item);
    else
        print("item already exists");
    end

    return array;
end

function ChunkList:coordIsInArray(array, coord)
    for i, aCoord in ipairs(array)
    do
        if aCoord[1] == coord[1] and aCoord[2] == coord[2]
        then
			return true;
        end
    end

    return false;
end

function ChunkList:highlightSquare(square)
    if square
    then
        for i = 0, square:getObjects():size() - 1
        do
            local object = square:getObjects():get(i);

            object:setHighlighted(true);
            object:setHighlightColor(ChunkList.speechR, ChunkList.speechG, ChunkList.speechB, 1);
        end
    end
end

function ChunkList:highlightSquares(squares)
    for i, coords in ipairs(squares)
    do
        ChunkList:highlightSquare(getCell():getOrCreateGridSquare(coords[1], coords[2], 0));
    end
end

function ChunkList:showTextPrompt(text, defaultValue, btnFn)
	local modal = ISTextBox:new(
        (getCore():getScreenWidth() / 2) - 130, (getCore():getScreenHeight() / 2) - 60,
        260, 120,
		text,
		tostring(defaultValue),
		self,
		function(self, button)
			if button.internal == "OK"
			then
				if btnFn
				then
					btnFn(button.parent.entry:getText());
				end
			end
		end,
		nil
	);

	modal:initialise();
	modal:addToUIManager();

	return modal;
end

function ChunkList:addContextMenuItem(context, text, handler, params, options)
    return ChunkList:createContextMenuOption(context, text, handler, params, ChunkList:mergeArrays({
        isSubMenu = false
    }, options));
end

function ChunkList:addContextMenuSubMenu(context, text, handler, params, options)
    return ChunkList:createContextMenuOption(context, text, handler, params, ChunkList:mergeArrays({
        isSubMenu = true
    }, options));
end

function ChunkList:createContextMenuOption(context, text, handler, params, options)
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

function ChunkList:say(message, player, r, g, b, radius, sType)
	if not player
	then
		player = getPlayer();
	end

    player:setHaloNote(message, (r or ChunkList.speechR) * 255, (g or ChunkList.speechG) * 255, (b or ChunkList.speechB) * 255, 300);
end

function ChunkList:playerIsAdmin()
	return isClient() == false or isAdmin() or getAccessLevel() == "admin" or getAccessLevel() == "Admin";
end