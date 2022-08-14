ChunkList = ChunkList or {};
ChunkList.Commands = ChunkList.Commands or {};

-- handlers

function ChunkList.Commands.dumpList(playerObj, args)
    ChunkList:saveItemListInFile("chunk_lists/" .. tostring(args["fileName"]) .. ".txt", args["chunks"]);
end

-- events

Events.OnClientCommand.Add(function(moduleName, command, playerObj, args)
	if moduleName == "chunk_list" and ChunkList.Commands[command]
	then
		ChunkList.Commands[command](playerObj, args);
	end
end);