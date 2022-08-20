require "AutoMechanics"

-- Connecting the options to the menu, so user can change them.
if ModOptions and ModOptions.getInstance then
  local settings = ModOptions:getInstance(AutoMechanics.OPTIONS, "AutoMechanics", "AutoMechanics")

  ModOptions:loadFile();

  local optWaitTicks           = settings:getData("WaitTicks")
  local optFailThreshold       = settings:getData("FailThreshold")
  local optVerbose             = settings:getData("Verbose")

  if optWaitTicks then
      optWaitTicks.name        = "UI_AutoMechanics_WaitTicks";
      optFailThreshold.name    = "UI_AutoMechanics_FailThreshold";
      optVerbose.name          = "UI_Verbose";

      optWaitTicks.tooltip     = "UI_AutoMechanics_Tooltip_WaitTicks";
      optFailThreshold.tooltip = "UI_AutoMechanics_Tooltip_FailThreshold";
      optVerbose.tooltip       = "UI_Tooltip_Verbose";

      optWaitTicks[7] = getText("UI_AutoMechanics_WaitTicks_10")
      
      optFailThreshold[2] = getText("UI_AutoMechanics_FailThreshold_20")

  end
end

function AutoMechanics.getWaitCycle()
    if AutoMechanics.OPTIONS.WaitTicks == 1 then return 0 end
    if AutoMechanics.OPTIONS.WaitTicks == 2 then return 1 end
    if AutoMechanics.OPTIONS.WaitTicks == 3 then return 2 end
    if AutoMechanics.OPTIONS.WaitTicks == 4 then return 3 end
    if AutoMechanics.OPTIONS.WaitTicks == 5 then return 4 end
    if AutoMechanics.OPTIONS.WaitTicks == 6 then return 5 end
    if AutoMechanics.OPTIONS.WaitTicks == 7 then return 10 end
    if AutoMechanics.OPTIONS.WaitTicks == 8 then return 20 end
    return 2
end

function AutoMechanics.getConditionLossPercentageThreshold()
    if AutoMechanics.OPTIONS.FailThreshold == 1 then return 0 end
    if AutoMechanics.OPTIONS.FailThreshold == 2 then return 20 end
    if AutoMechanics.OPTIONS.FailThreshold == 3 then return 40 end
    if AutoMechanics.OPTIONS.FailThreshold == 4 then return 60 end
    if AutoMechanics.OPTIONS.FailThreshold == 5 then return 80 end
    return 100
end
