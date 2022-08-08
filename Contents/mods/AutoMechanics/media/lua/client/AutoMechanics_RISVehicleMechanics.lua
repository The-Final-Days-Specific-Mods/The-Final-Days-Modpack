require "AutoMechanics"

--hook the menu to install our button
local genuine_ISVehicleMechanics_onListRightMouseUp = ISVehicleMechanics.onListRightMouseUp
function ISVehicleMechanics:onListRightMouseUp(x,y)
    genuine_ISVehicleMechanics_onListRightMouseUp(self,x,y);
    
    local trueself = self.parent;--PZ mixes ISVehicleMechanics uses between parent and children, onListRightMouseUp is called on children. but children are not initialized.
    if AutoMechanics.OPTIONS.Verbose then print ("AutoMechanics ISVehicleMechanics:onListRightMouseUp. playernum= "..trueself.playerNum); end
    if not trueself.context then trueself.context = ISContextMenu.get(trueself.playerNum, x + self:getX() + trueself:getAbsoluteX(), y + self:getY() + trueself:getAbsoluteY()) end--in cases doPart never created the menu, we do it
    local trainOption = trueself.context:addOption(getText("ContextMenu_AutoMechanics"), trueself, ISVehicleMechanics.onAutoMechanicsTrain, trueself.chr, trueself.vehicle)
    local description = getText("Tooltip_craft_Needs") .. " : <LINE>";
    local foundARecipe = false
    for i=0,trueself.vehicle:getPartCount()-1 do
        local part = trueself.vehicle:getPartByIndex(i)
        local keyvalues = part:getTable("uninstall");
        if keyvalues and keyvalues.recipes and keyvalues.recipes ~= "" then
            for _,recipe in ipairs(keyvalues.recipes:split(";")) do
                if not trueself.chr:isRecipeKnown(recipe) then
                    description = description .. " <RED> " .. getText("Tooltip_vehicle_requireRecipe", getRecipeDisplayName(recipe)) .. " <LINE>";
                else
                    description = description .. " <RGB:1,1,1> " .. getText("Tooltip_vehicle_requireRecipe", getRecipeDisplayName(recipe)) .. " <LINE>";
                end
                foundARecipe = true
            end
        end
        if foundARecipe then break end--Do only the first recipe found
    end
    description = description .. AutoMechanics.getTooltipLine(trueself.chr, "Screwdriver")
    description = description .. AutoMechanics.getTooltipLine(trueself.chr, "Wrench"     )
    description = description .. AutoMechanics.getTooltipLine(trueself.chr, "LugWrench" )
    description = description .. AutoMechanics.getTooltipLine(trueself.chr, "Jack")
    --description = description .. AutoMechanics.getTooltipLine(trueself.chr, "TirePump"   )--useless for mechanics training
    local tooltip = ISToolTip:new();
    tooltip:initialise();
    tooltip:setVisible(false);
    tooltip.description = description
    trainOption.toolTip = tooltip
    if AutoMechanics.OPTIONS.Verbose then print ("AutoMechanics "..trainOption.tooltip.description); end
    --weak attempt to get joypad working without being able to test it
    if JoypadState.players[trueself.playerNum+1] and trueself.context:getIsVisible() then
        trueself.context.mouseOver = 1
        trueself.context.origin = trueself
        JoypadState.players[trueself.playerNum+1].focus = trueself.context
        updateJoypadFocus(JoypadState.players[trueself.playerNum+1])
    end
end

--tool functions
function AutoMechanics.getTooltipLine(player, itemType)
    local item = InventoryItemFactory.CreateItem("Base."..itemType);--"Base."..itemType or just itemType ?
    if AutoMechanics.getPlayerFastestItemAnyInventory(player,itemType) then
        if AutoMechanics.OPTIONS.Verbose then print ("AutoMechanics AutoMechanics.getTooltipLine with "..itemType); end
        return " <RGB:1,1,1>" .. item:getDisplayName() .. " 1/1 <LINE>";
    else
        if AutoMechanics.OPTIONS.Verbose then print ("AutoMechanics AutoMechanics.getTooltipLine miss "..itemType); end
        return " <RED>" .. item:getDisplayName() .. " 0/1 <LINE>";
    end
end
