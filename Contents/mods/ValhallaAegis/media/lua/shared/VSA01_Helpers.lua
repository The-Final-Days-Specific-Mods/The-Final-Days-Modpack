-- sandbox options with fallback


function Valhalla:getSandboxVar(name)
	local value = SandboxVars.ValhallaAegis[name];

	--print("Valhalla:getSandboxVar(" .. name .. ")");

	if value ~= nil
	then
		return value;
	end

    if Valhalla.SandboxDefaults[name] ~= nil
    then
        return Valhalla.SandboxDefaults[name];
    end

	return nil;
end


-- player stuff


function Valhalla:getOnlinePlayers()
	local onlinePlayers = getOnlinePlayers();
	local playerList = {};

	if onlinePlayers
	then
		for i = 1, onlinePlayers:size()
		do
			local onlinePlayer = onlinePlayers:get(i - 1);

			if onlinePlayer
			then
				table.insert(playerList, onlinePlayer);
			--else
				--print("player index " .. i .. " invalid");
			end
		end
	end

    table.sort(playerList, function(a, b)
        return Valhalla:getFirstLetter(a:getUsername()) < Valhalla:getFirstLetter(b:getUsername());
    end);

    --for i, p in ipairs(playerList)
    --do
        --print("#" .. tostring(i) .. " = " .. p:getUsername());
    --end

	return playerList;
end


function Valhalla:getOnlinePlayerByName(username)
    local onlinePlayers = getOnlinePlayers();

    if onlinePlayers
	then
        for i = 1, onlinePlayers:size()
		do
            local onlinePlayer = onlinePlayers:get(i - 1);

			if onlinePlayer and onlinePlayer:getUsername() == username
			then
				return onlinePlayer;
			end
		end
    end

    return nil;
end


-- moddata


function Valhalla:getVehicleModData(vehicle)
	local part = Valhalla:getMulePart(vehicle);

	if part
	then
		--Valhalla:say("getting data from mule part");

		return part:getModData();
	else
		--print("data mule part NOT found");

		return {};
	end
end


function Valhalla:saveModData(object, printValues)
	object:transmitModData();

	if printValues
	then
		Valhalla:printModData(object);
	end
end


function Valhalla:printModData(object)
	if object
	then
		for k, v in pairs(object:getModData() or {})
		do
			Valhalla:say(tostring(k) .. " = " .. tostring(v));
		end
	end
end


-- shortcuts


function Valhalla:formatXYZString(x, y, z)
    return string.format("%s, %s, %s", x, y, z);
end


function Valhalla:stringContains(srcString, needle)
	return string.find(srcString, needle, 1, true);
end


-- format helpers


function Valhalla:millisecToMinutes(timestamp)
    return timestamp / 1000 / 60;
end


function Valhalla:millisecToHours(timestamp)
    return Valhalla:millisecToMinutes(timestamp) / 60;
end


function Valhalla:millisecToDays(timestamp)
    return Valhalla:millisecToHours(timestamp) / 24;
end


-- data handling


function Valhalla:splitString(srcString, separator)
    local fragments = {};

    for fragment in srcString:gmatch("([^" .. separator .. "]+)")
    do
        table.insert(fragments, fragment);
    end

    return fragments;
end


function Valhalla:itemIsOnList(list, item, separator)
	if list and item
	then
		local index, fragments = Valhalla:findItemIndexInArrayString(list, item, separator);

		return index > -1;
	end

	return false;
end


function Valhalla:addItemToArrayString(str, item, separator)
	separator = separator or Valhalla.stringArrayDivider;

	local fragments = Valhalla:splitArrayString(str, separator);

	table.insert(fragments, item);

	return Valhalla:mergeIntoArrayString(fragments, separator);
end


function Valhalla:removeItemFromArrayString(str, item, separator)
	local index, fragments = Valhalla:findItemIndexInArrayString(str, item, separator);

	if index > -1
	then
		table.remove(fragments, index);

		return Valhalla:mergeIntoArrayString(fragments, separator);
	end

	return str;
end


function Valhalla:removeIndexFromArrayString(str, index, separator)
	local fragments = Valhalla:splitArrayString(str, separator);

	table.remove(fragments, index);

	return Valhalla:mergeIntoArrayString(fragments, separator);
end


function Valhalla:findItemIndexInArrayString(str, item, separator)
	if str
	then
		separator = separator or Valhalla.stringArrayDivider;

		local fragments = Valhalla:splitArrayString(str, separator);

		for i, fragment in ipairs(fragments)
		do
			if fragment == item
			then
				return i, fragments;
			end
		end

		return -1, fragments;
	end

	return -1, {};
end


function Valhalla:splitArrayString(str, separator)
	local fragments = {};

	if str and str ~= ""
	then
		separator = separator or Valhalla.stringArrayDivider;

		for fragment in str:gmatch("([^" .. separator .. "]+)")
		do
			table.insert(fragments, fragment);
		end
	end

    return fragments;
end


function Valhalla:replaceItemInArrayString(str, index, newItem, separator)
	if index > -1
	then
		separator = separator or Valhalla.stringArrayDivider;

		local fragments = Valhalla:splitArrayString(str, separator);

		fragments[index] = newItem;

		return Valhalla:mergeIntoArrayString(fragments, separator);
	end

	return str;
end


function Valhalla:mergeIntoArrayString(fragments, separator)
	separator = separator or Valhalla.stringArrayDivider;

	local str = "";

	for i, fragment in ipairs(fragments)
	do
		if i == 1
		then
			str = str .. fragment;
		else
			str = str .. separator .. fragment;
		end
	end

	return str;
end


function Valhalla:mergeArrays(array1, array2)
    if not array2
    then
        return array1;
    end

    for key, value in pairs(array2)
    do
        array1[key] = value;
    end

    return array1;
end


function Valhalla:sortArrayByValue(array)
    table.sort(array,
        function(a, b)
            return not string.sort(a, b);
        end
    );

    return array;
end


function Valhalla:sortArrayByKey(array)
    local keys = {};

    for key in pairs(array)
    do
        table.insert(keys, key);
    end

    table.sort(keys);

    local result = {};

    for i, key in ipairs(keys)
    do
        result[key] = array[key];
    end

    return result;
end


function Valhalla:getFirstLetter(srcString)
    local firstLetter = "?";

    for letter in string.gmatch(srcString, "%a")
    do
        firstLetter = letter;

        break;
    end

    if not firstLetter
    then
        firstLetter = srcString:match("[%z\1-\127\194-\244][\128-\191]*");
    end

    return firstLetter;
end


function Valhalla:getStringFromLastOccurenceOfChar(str, chr)
	str = KahluaUtil.rawTostring2(str);

	if chr
	then
		return str:sub(1 - (str:reverse()):find("%" .. chr));
		--return str:match('[^' .. chr .. ']+$');
	end

	return nil;
end