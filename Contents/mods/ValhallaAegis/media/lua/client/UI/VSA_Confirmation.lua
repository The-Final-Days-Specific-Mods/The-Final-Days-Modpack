function Valhalla:showConfirmationDialog(btnText, onYesFn)
    local modal = ISModalDialog:new(
        (getCore():getScreenWidth() / 2) - 130,
        (getCore():getScreenHeight() / 2) - 60,
        260,
        120,
        btnText,
        true,
        self,
        function(self, button)
            if button.internal == "YES"
            then
                onYesFn(button);
            end
        end
    );

    modal:initialise();
    modal:addToUIManager();

    return modal;
end