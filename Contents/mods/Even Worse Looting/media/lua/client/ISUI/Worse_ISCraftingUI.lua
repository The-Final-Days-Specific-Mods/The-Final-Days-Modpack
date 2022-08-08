require "ISUI/ISCraftingUI"
require "ISUI/ISInventoryPaneContextMenu"
 --***********************************************************
--**                    ROBERT JOHNSON                     **
--***********************************************************
local function isMod(mod_Name)
    local mods = getActivatedMods();
    for i=0, mods:size()-1, 1 do
        if mods:get(i) == mod_Name then
            return true;
        end
    end
    return false;
end

function ISCraftingUI:getContainers()
    if not self.character then return end
    -- get all the surrounding inventory of the player, gonna check for the item in them too
    self.containerList = ArrayList.new();
    for i,v in ipairs(getPlayerInventory(self.playerNum).inventoryPane.inventoryPage.backpacks) do
        --        if v.inventory ~= self.character:getInventory() then -- owner inventory already check in RecipeManager
		local mData = nil		
		local searched = nil
		local locked = nil
		if not isMod("Worse Searching") then
			--print("No worse searching!")
			searched = true
		end
		local object = v.inventory:getVehiclePart() or v.inventory:getParent() or v.inventory:getContainingItem()
		if object  and object:getModData() then mData = object:getModData() end
		if mData and mData.locked then
			--print("Locked!")
			locked = true
		end
		if mData and mData.searched then
			--print("Searched!")
			searched = true
		end
		if instanceof(v.inventory:getContainingItem() , "IsoPlayer") then			
			searched = true
		end
		
		if v.inventory:getType() and v.inventory:getType() == "floor" then
			searched = true
		end
		if searched and not locked then 
			--print("Adding Searched " .. tostring(searched) .. ", Locked " .. tostring(locked) .. " - " .. tostring(object))
			self.containerList:add(v.inventory);
		end
        --        end
    end
    for i,v in ipairs(getPlayerLoot(self.playerNum).inventoryPane.inventoryPage.backpacks) do
		local mData = nil		
		local searched = nil
		local locked = nil
		if not isMod("Worse Searching") then
			--print("No worse searching!")
			searched = true
		end
		local object = v.inventory:getVehiclePart() or v.inventory:getParent() or v.inventory:getContainingItem()
		if object  and object:getModData() then mData = object:getModData() end
		if mData and mData.locked then
			--print("Locked!")
			locked = true
		end
		if mData and mData.searched then
			--print("Searched!")
			searched = true
		end
		if v.inventory:getVehiclePart() then 			
			local item = v.inventory:getVehiclePart()
			local type = item:getInventoryItem():getType()
			if type:contains("Seat") then searched = true end
		end		
		if v.inventory:getType() and v.inventory:getType() == "floor" then
			searched = true
		end
		if searched and not locked then 
			--print("Adding Searched " .. tostring(searched) .. ", Locked " .. tostring(locked) .. " - " .. tostring(object))
			self.containerList:add(v.inventory);
		end
    end
end

ISInventoryPaneContextMenu.getContainers = function(character)
    if not character then return end
    local playerNum = character and character:getPlayerNum() or -1;
    -- get all the surrounding inventory of the player, gonna check for the item in them too
    local containerList = ArrayList.new();
    for i,v in ipairs(getPlayerInventory(playerNum).inventoryPane.inventoryPage.backpacks) do
		local mData = nil		
		local searched = nil
		local locked = nil
		if not isMod("Worse Searching") then
			--print("No worse searching!")
			searched = true
		end
		local object = v.inventory:getVehiclePart() or v.inventory:getParent() or v.inventory:getContainingItem()
		if object  and object:getModData() then mData = object:getModData() end
		if mData and mData.locked then
			--print("Locked!")
			locked = true
		end
		if mData and mData.searched then
			--print("Searched!")
			searched = true
		end
		if instanceof(v.inventory:getContainingItem() , "IsoPlayer") then			
			searched = true
		end		
		if v.inventory:getType() and v.inventory:getType() == "floor" then
			searched = true
		end
		if searched and not locked then 
			--print("Adding Searched " .. tostring(searched) .. ", Locked " .. tostring(locked) .. " - " .. tostring(object))
			containerList:add(v.inventory);
		end
    end
    for i,v in ipairs(getPlayerLoot(playerNum).inventoryPane.inventoryPage.backpacks) do
		local mData = nil		
		local searched = nil
		local locked = nil
		if not isMod("Worse Searching") then
			--print("No worse searching!")
			searched = true
		end
		local object = v.inventory:getVehiclePart() or v.inventory:getParent() or v.inventory:getContainingItem()
		if object  and object:getModData() then mData = object:getModData() end
		if mData and mData.locked then
			--print("Locked!")
			locked = true
		end
		if mData and mData.searched then
			--print("Searched!")
			searched = true
		end
		
		if v.inventory:getType() and v.inventory:getType() == "floor" then
			searched = true
		end
	
		if v.inventory:getVehiclePart() then 			
			local item = v.inventory:getVehiclePart()
			local type = item:getInventoryItem():getType()
			if type:contains("Seat") then searched = true end
		end
		if searched and not locked then 
			--print("Adding Searched " .. tostring(searched) .. ", Locked " .. tostring(locked) .. " - " .. tostring(object))
			containerList:add(v.inventory);
		end
    end
    return containerList;
end