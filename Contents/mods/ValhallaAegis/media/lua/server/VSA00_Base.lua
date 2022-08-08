-- file read and write

function Valhalla.Commands:getSafeFileWriter(fileName, p1, p2)
	if Valhalla:getSandboxVar("SanitizeFilenamesForWindows")
	then
		local fragments = Valhalla:splitString(fileName, "/");		
		local originalFile = table.remove(fragments);
		local newFile = originalFile;
		local badChars = {
			"<", ">", ":", "'", "/", "\\", "|", "?", "*", "%"
		};
		
		for i, chr in ipairs(badChars)
		do
			newFile = string.gsub(newFile, "%" .. chr, "_");
		end
		
		table.insert(fragments, newFile);
		
		fileName = table.concat(fragments, "/");
	end
	
	return getFileWriter(fileName, p1, p2);
end


function Valhalla.Commands:appendLineToFile(fileName, line)
	local file = Valhalla.Commands:getSafeFileWriter(fileName, true, true);
	
	if file
	then
		if type(line) ~= "function" and type(line) ~= "table"
		then
			--print(" -> " .. tostring(line));

			file:write(tostring(line) .. "\n");
		--else
			--print(" -> invalid data");
		end

		file:close();
	else
		print("WARNING! UNABLE TO WRITE FILE " .. fileName);
	end
end


function Valhalla.Commands:saveItemListInFile(fileName, listItems, kvPairs)
	local file = Valhalla.Commands:getSafeFileWriter(fileName, true, false);

	if file
	then
		if kvPairs
		then
			local tmpList = {};

			for k, v in pairs(listItems)
			do
				table.insert(tmpList, tostring(k) .. "=" .. tostring(v));
			end

			listItems = tmpList;
		end

		for i, item in ipairs(listItems)
		do
			if type(item) ~= "function" and type(item) ~= "table"
			then
				--print(" -> " .. tostring(item));

				file:write(tostring(item) .. "\n");
			--else
				--print(" -> invalid data");
			end
		end

		file:close();
	else
		print("WARNING! UNABLE TO WRITE FILE " .. fileName);
	end
end


function Valhalla.Commands:getItemListFromFile(fileName)
	local listItems = {};
	local file = getFileReader(fileName, false);

	if file
	then
		while true
		do
			local line = file:readLine();

			if line == nil
			then
				break;
			end

			if line ~= ""
			then
				table.insert(listItems, line);
			end
		end

		file:close();
	end

	return listItems;
end


-- sending server commands


function Valhalla.Commands:sendServerCommandToNamedPlayer(username, moduleName, args)
    local player = Valhalla:getOnlinePlayerByName(username);

    if player
    then
        sendServerCommand(player, "valhallaaux_client", moduleName, args);
    end
end


-- debug stuff


function Valhalla.Commands:printArgs(args)
    if args
    then
        for k, v in pairs(args)
        do
            print(" - " .. tostring(k) .. " = " .. tostring(v));

            if type(v) == "table"
            then
                for k2, v2 in pairs(v)
                do
                    print(" - - " .. tostring(k) .. " = " .. tostring(v));
                end
            end
        end
    end
end