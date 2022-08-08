-- debug stuff, disabled in actual mod.
function CS_DebugCheck(keynum)
	if keynum == Keyboard.KEY_O then
		CS_PlaySound();
	end
end

-- Every hour check if it's the time to play creepy sounds. 
function CS_CheckStart()
	if getGameTime():getHour() >= SandboxVars.CreepySounds.HourStart 
	and getGameTime():getHour() <= SandboxVars.CreepySounds.HourEnd
	and ZombRand(100) < SandboxVars.CreepySounds.Chance * 100 then
		CS_PlaySound();
	end
end

-- Play sound
function CS_PlaySound()
	local aPlayer = getPlayer();
	if aPlayer == nil then
		return
	end
	local rAlarmSound = "creepy"..tostring(ZombRand(13));
	local aZed = getSoundManager():PlaySound(rAlarmSound,false,0);
	getSoundManager():PlayAsMusic(rAlarmSound,aZed,false,0);
end

Events.EveryHours.Add(CS_CheckStart);
--Events.OnKeyPressed.Add(CS_DebugCheck);