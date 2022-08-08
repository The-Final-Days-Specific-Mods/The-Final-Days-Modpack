-- checks


function Valhalla.ItemTransferProtection:allowItemTransfer(item, player)
	if Valhalla:userIsRestricted()
	then
		if Valhalla:getSandboxVar("EnableItemTransferProtection")
		then
			local forbiddenItems = Valhalla:splitArrayString(Valhalla:getSandboxVar("BlockedItemsForTransfer"), ",") or {};

			for i, fType in ipairs(forbiddenItems)
			do
				if item:getFullType() == fType
				then
					return false;
				end
			end
		end

		if Valhalla.ItemTransferProtection:policeStealingFromVehicles() and player
		then
			local container = item:getContainer();

			if container
			then
				local vehiclePart = container:getVehiclePart();

				if vehiclePart and not Valhalla.VehicleClaims:playerCanTakeItems(player, vehiclePart:getVehicle())
				then
					return false;
				end
			end
		end
	end

	return true;
end

function Valhalla.ItemTransferProtection:policeStealingFromVehicles()
	return Valhalla:getSandboxVar("EnableVehicleOwnership") and not Valhalla:getSandboxVar("AllowStealingFromVehicleContainers");
end


-- item list management


function Valhalla.ItemTransferProtection:removeForbiddenTypeFromItemList(items)
	for i = #items, 1, -1
	do
		if not Valhalla.ItemTransferProtection:allowItemTransfer(items[i])
		then
			table.remove(items, i);
		end
	end

	return items;
end


-- events


Events.OnGameStart.Add(function()
	if Valhalla:getSandboxVar("EnableItemTransferProtection") or Valhalla.ItemTransferProtection:policeStealingFromVehicles()
	then
		-- block transfers of certain items

		local vanillaTransferFn = ISInventoryPane["transferItemsByWeight"];

		ISInventoryPane["transferItemsByWeight"] = function(self, items, container)
			Valhalla.ItemTransferProtection:removeForbiddenTypeFromItemList(items);

			return vanillaTransferFn(self, items, container);
		end

		local vanillaGrabItemFn = ISGrabItemAction["isValid"];

		ISGrabItemAction["isValid"] = function(self)
			if not Valhalla.ItemTransferProtection:allowItemTransfer(self.item:getItem(), self.character)
			then
				Valhalla:sayIfDifferentObject(self.item:getItem(), getText("IGUI_VTP_cantTransfer"), self.character);

				return false;
			end

			return vanillaGrabItemFn(self);
		end

		local vanillaTransferItemFn = ISInventoryTransferAction["isValid"];

		ISInventoryTransferAction["isValid"] = function(self)
			if not Valhalla.ItemTransferProtection:allowItemTransfer(self.item, self.character)
			then
				Valhalla:sayIfDifferentObject(self.item, getText("IGUI_VTP_cantTransfer"), self.character);

				return false;
			end

			return vanillaTransferItemFn(self);
		end
	end
end);