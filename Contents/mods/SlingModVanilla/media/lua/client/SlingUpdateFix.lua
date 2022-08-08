
local function slingUpdate(player)

	local plsHotbar = getPlayerHotbar(player:getPlayerNum());
	local inv = player:getInventory():getItems()
	
	if plsHotbar == nil then return  end 
	plsHotbar.needsRefresh = true

end

Events.OnPlayerUpdate.Add(slingUpdate);
