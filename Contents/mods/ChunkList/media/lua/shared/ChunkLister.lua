ChunkList = ChunkList or {};

-- helper crap

function ChunkList:saveItemListInFile(fileName, listItems, kvPairs)
    local file = ChunkList:getFileWriter(fileName, true, false);

    if not file
    then
        return;
    end

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
            file:write(tostring(item) .. "\n");
        end
    end

    file:close();
end

function ChunkList:getFileNameFallback(fileName)
	local fragments = ChunkList:splitString(fileName, "/");
	local newFile = table.remove(fragments);
	local badStuff = {
		"<", ">", ":", "'", "/", "\\", "|", "?", "*", "%", ".."
	};

	for i, chr in ipairs(badStuff)
	do
		newFile = string.gsub(newFile, ChunkList:escapeString(chr), chr == ".."
			and "."
			or "_"
		);
	end

	table.insert(fragments, newFile);

	return table.concat(fragments, "/");
end

function ChunkList:getFileWriter(fileName, param1, param2)
	fileName = string.gsub(fileName, "%.%.", ".");

	local file = getFileWriter(fileName, param1, param2);

	if not file or not file["write"]
    then
        file = getFileWriter(ChunkList:getFileNameFallback(fileName), param1, param2);
    end

	if not file or not file["write"]
    then
		return false;
	end

	return file;
end

function ChunkList:escapeString(srcString)
	return srcString:gsub("([^%w])", "%%%1");
end

function ChunkList:splitString(srcString, separator)
    local fragments = {};

    for fragment in srcString:gmatch("([^" .. separator .. "]+)")
    do
        table.insert(fragments, fragment);
    end

    return fragments;
end

function ChunkList:mergeArrays(array1, array2)
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

function ChunkList:getFieldValue(object, field)
	for i = 0, getNumClassFields(object) - 1
	do
		local fld = getClassField(object, i);

		if fld and ChunkList:getStringFromLastOccurenceOfChar(fld, ".") == field
		then
			return getClassFieldVal(object, fld);
		end
	end

	return nil;
end

function ChunkList:getStringFromLastOccurenceOfChar(str, chr)
	str = KahluaUtil.rawTostring2(str);

	if chr
	then
		return str:sub(1 - (str:reverse()):find("%" .. chr));
		--return str:match('[^' .. chr .. ']+$');
	end

	return nil;
end