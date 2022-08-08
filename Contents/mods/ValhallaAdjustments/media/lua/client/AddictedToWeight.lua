Events.OnGameStart.Add(function()
	if P4AddictedToWeight and not ModOptions and not ModOptions.getInstance
	then
		P4AddictedToWeight.options.weightChangeNotification = false;
	end
end);