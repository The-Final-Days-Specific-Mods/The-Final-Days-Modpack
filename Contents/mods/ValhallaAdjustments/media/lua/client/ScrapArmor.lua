Events.OnGameStart.Add(function()
	if ArmorTA
	then
		ArmorTA["createMenus"] = function(self)
			return true;
		end
	end
end);