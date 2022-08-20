local stateNOW = 1;

local stateConfig = {
    font = UIFont.Small,
    offset = 21,
    opacity1 = 0.5,
    opacity2 = 0.25
};

local function ChangeState()
    local array = {
        {font = UIFont.Small, offset = 21, opacity1 = 0, opacity2 = 0},
        {font = UIFont.Small, offset = 21, opacity1 = 0.5, opacity2 = 0.25},
        {font = UIFont.Small, offset = 21, opacity1 = 0.5, opacity2 = 0},
        {font = UIFont.Small, offset = 21, opacity1 = 0.2, opacity2 = 0.1},
        {font = UIFont.Small, offset = 21, opacity1 = 0.75, opacity2 = 0.25},
        {font = UIFont.Medium, offset = 24, opacity1 = 0.5, opacity2 = 0.25},
        {font = UIFont.Medium, offset = 24, opacity1 = 0.25, opacity2 = 0},
        {font = UIFont.Large, offset = 28, opacity1 = 0.5, opacity2 = 0.25},
        {font = UIFont.Large, offset = 28, opacity1 = 0.25, opacity2 = 0}
    };

    stateConfig = array[stateNOW + 1];

    return 1;
end

local function PrintPosition()
    if stateNOW == 0 then return 1; end

    local plr = getSpecificPlayer(0);
    if not plr then return 1; end

    local posX = math.floor(plr:getX());
    local posY = math.floor(plr:getY());
    local txt1 = "x:" .. posX .. " y:" .. posY;

    posX = math.ceil(posX / 300) - 1;
    posY = math.ceil(posY / 300) - 1;
    local txt2 = "Cell: " .. posX .. "x" .. posY;

    getTextManager():DrawString(stateConfig.font, 65, 8, txt1, 13, 13, 13, stateConfig.opacity1);
    getTextManager():DrawString(UIFont.Small, 65, stateConfig.offset, txt2, 13, 13, 13, stateConfig.opacity2);
end

local function WriteSettingsFile()
    if isClient() then return; end
    local file = getFileWriter("positionXY.ini", true, false);
    if not file then return 1; end
    file:write("last_state=" .. stateNOW);
    file:close();
end

local function ReadSettingsFile()
    local file = getFileReader("positionXY.ini", true);
    if not file then return 1; end

    local line = file:readLine();
    if line == nil then
        stateNOW = 1;
        WriteSettingsFile();
        print('[positionXY] File created');
        file:close();
        return 1;
    end

    local delenka = string.split(line, "=");

    if (delenka[1] == 'last_state') then
        stateNOW = tonumber(delenka[2]);
        print('[positionXY] Option loaded with value:' .. delenka[2]);
        file:close();
        return 1;
    end
end

local function CheckButtons(key)
    if key == 67 then
        stateNOW = stateNOW + 1;
        if stateNOW > 8 then stateNOW = 0; end
        print('[positionXY] State changed to: ' .. stateNOW);
        WriteSettingsFile();
        ChangeState();
    end
end

Events.OnGameStart.Add(function()
    ReadSettingsFile();
    ChangeState();
    Events.OnKeyPressed.Add(CheckButtons);
    Events.OnPostUIDraw.Add(PrintPosition);
end);
