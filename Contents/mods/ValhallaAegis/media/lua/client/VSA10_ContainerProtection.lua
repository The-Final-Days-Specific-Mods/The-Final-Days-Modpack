-- checks


function Valhalla.ContainerProtection:allowObjectDestruction(object, player, mode)
	if Valhalla:userIsRestricted()
	then
        local isSafehouse = Valhalla:squareIsInSafehouse(object:getSquare());
        local isContainer = Valhalla:objectIsContainer(object);
        local allowContainerPickup = Valhalla:getSandboxVar("AllowContainerPickup");

		if Valhalla:getSandboxVar("EnableSHClaimThrottling")
		then
			local lastClaim = player:getModData()["lastSafehouseClaim"];

			if lastClaim and isSafehouse
			then
				local minutesSinceClaim = (Calendar.getInstance():getTimeInMillis() - tonumber(lastClaim)) / 1000 / 60;
				local minClaimTime = Valhalla:getSandboxVar("SHDestructionTimerMin");

				if minutesSinceClaim < minClaimTime
				then
					Valhalla:sayIfDifferentObject(object,
						getText("IGUI_VCP_waitNMinutes", math.floor(minClaimTime - minutesSinceClaim)),
						self.character
					);

					return false;
				end
			end
		end

		if Valhalla:getSandboxVar("EnableSHOwnerCheck")
		then
			local safehouse = Valhalla:getSafehouseToSquare(object:getSquare());

			if isSafehouse and not safehouse:getPlayers():contains(player:getUsername())
			then
				Valhalla:sayIfDifferentObject(object, getText("IGUI_VCP_notMySafehouse"), self.character);

				return false;
			end
		end

		if isSafehouse
		then
			return true;
		elseif isContainer and mode == "pickup"
		then
			return allowContainerPickup;
		elseif isContainer
        then
			return false;
		end

		--return isSafehouse or (not isSafehouse and not isContainer) or (isContainer and allowContainerPickup);
	end

    return true;
end


-- events


Events.OnGameStart.Add(function()
    if Valhalla:getSandboxVar("BlockAllPickups") or Valhalla:getSandboxVar("BlockAllDisassembly")
    then
        -- scrap / pickup action control has precedence

		local vanillaScrapFn = ISMoveablesAction["isValid"];

		ISMoveablesAction["isValid"] = function(self)
            if Valhalla:userIsRestricted() and self.mode == "pickup" or self.mode == "scrap"
			then
				local object = self.moveProps.object or self.moveCursor.cacheObject;

				if object and object.getSquare and not Valhalla:squareIsInSafehouse(object:getSquare())
				then
					if self.mode == "pickup" and Valhalla:getSandboxVar("BlockAllPickups")
					then
						Valhalla:sayIfDifferentObject(object, getText("IGUI_VCP_cantPickup"));

						return false;
					end

					if self.mode == "scrap" and Valhalla:getSandboxVar("BlockAllDisassembly")
					then
						Valhalla:sayIfDifferentObject(object, getText("IGUI_VCP_cantScrap"));

						return false;
					end
				end
			end

            return vanillaScrapFn(self);
        end
    end

	if Valhalla:getSandboxVar("EnableContainerProtection")
	then
		-- sledge action

		local vanillaDestroyFn = ISDestroyStuffAction["isValid"];

		ISDestroyStuffAction["isValid"] = function(self)
			if Valhalla.ContainerProtection:allowObjectDestruction(self.item, self.character)
			then
				return vanillaDestroyFn(self);
			else
				Valhalla:sayIfDifferentObject(self.item, getText("IGUI_VCP_cantDestroy"), self.character);

				return false;
			end
		end

		-- scrap / pickup action

		local vanillaScrapFn = ISMoveablesAction["isValid"];

		ISMoveablesAction["isValid"] = function(self)
			local object = self.moveProps.object or self.moveCursor.cacheObject;

			if (self.mode == "scrap" or self.mode == "pickup") and Valhalla:objectIsContainer(object)
			then
				if object and not Valhalla.ContainerProtection:allowObjectDestruction(object, self.character, self.mode)
				then
					Valhalla:sayIfDifferentObject(object, getText(self.mode == "scrap"
						and "IGUI_VCP_cantScrap"
						or "IGUI_VCP_cantPickup"
					), self.character);

					return false;
				end
			end

			return vanillaScrapFn(self);
		end

		-- remember last claim time

		if Valhalla:getSandboxVar("EnableSHClaimThrottling")
		then
			local vanillaSafehouseClaim = ISWorldObjectContextMenu["onTakeSafeHouse"];

			ISWorldObjectContextMenu["onTakeSafeHouse"] = function(worldobjects, square, player)
				local playerObj = getSpecificPlayer(player);

				playerObj:getModData()["lastSafehouseClaim"] = tostring(Calendar.getInstance():getTimeInMillis());

				Valhalla:saveModData(playerObj);

				return vanillaSafehouseClaim(worldobjects, square, player);
			end
		end
	end
end);


Events.OnFillInventoryObjectContextMenu.Add(function(player, contextMenu, items)
	if Valhalla:getSandboxVar("EnableContainerProtection")
	then
		Valhalla:disableContextMenuItem(contextMenu, getText("ContextMenu_Disassemble"));
	end
end);