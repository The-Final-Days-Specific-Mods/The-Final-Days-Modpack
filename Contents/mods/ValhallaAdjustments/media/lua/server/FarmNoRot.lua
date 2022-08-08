-- possibly fixes error from "Farming never rot" https://steamcommunity.com/sharedfiles/filedetails/?id=1415491388

if isClient()
then
	return
end

require "Farming/SFarmingSystem"

--Events.OnGameStart.Add(function()
	local oldGrowFn = SFarmingSystem["growPlant"];

	SFarmingSystem["growPlant"] = function(self, luaObject, nextGrowing, updateNbOfGrow)
		if luaObject.state == "seeded" and luaObject.nbOfGrow > 6
		then
			luaObject.nbOfGrow = 6;
		end

		return oldGrowFn(self, luaObject, nextGrowing, updateNbOfGrow);
	end
--end);