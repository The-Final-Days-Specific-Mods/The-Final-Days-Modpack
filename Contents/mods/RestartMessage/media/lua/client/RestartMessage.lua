function RestartServer()
    local HeureLocale = os.date('%H:%M')
    -- put your restart, remember to take two hours off the desired time
    if (HeureLocale >= "21:57" and HeureLocale <= "22:02")
            or (HeureLocale >= "09:55" and HeureLocale <= "09:59")
            or (HeureLocale >= "15:55" and HeureLocale <= "15:59")
            or (HeureLocale >= "21:55" and HeureLocale <= "21:59")
            -- use "--" to comment line
            or (HeureLocale >= "03:55" and HeureLocale <= "03:59")
    then
        processGeneralMessage("Warning, Server Restart in few minutes. Please stop your vehicle")
    end
end
Events.EveryTenMinutes.Add(RestartServer);