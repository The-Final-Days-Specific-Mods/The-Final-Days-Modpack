function Valhalla:showNumberPrompt(text, defaultValue, btnFn, minValue, maxValue)
	local modal = ISTextBox:new(
        (getCore():getScreenWidth() / 2) - 130,
        (getCore():getScreenHeight() / 2) - 60,
        260,
        120,
		text,
		tostring(defaultValue),
		self,
		function(self, button)
			if button.internal == "OK"
			then
				local number = tonumber(button.parent.entry:getText());

				if minValue and number < minValue
				then
					number = minValue;
				end

				if maxValue and number > maxValue
				then
					number = maxValue;
				end

				if btnFn
				then
					btnFn(number);
				end
			end
		end,
		nil
	);

	modal:initialise();
	modal:addToUIManager();
	modal:setOnlyNumbers(true);

	return modal;
end