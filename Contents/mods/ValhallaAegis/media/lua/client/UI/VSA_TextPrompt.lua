function Valhalla:showTextPrompt(text, defaultValue, btnFn)
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
				if btnFn
				then
					btnFn(button.parent.entry:getText());
				end
			end
		end,
		nil
	);

	modal:initialise();
	modal:addToUIManager();

	return modal;
end