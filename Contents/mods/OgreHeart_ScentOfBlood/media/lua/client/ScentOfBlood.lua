-----------------------------------------------------
--CORE-----------------------------------------------
-----------------------------------------------------

local function attractZombies(player, mod)
	local playerLocation = player:getCurrentSquare()
	getWorldSoundManager():addSound(player,
			playerLocation:getX(),
			playerLocation:getY(),
			playerLocation:getZ(),
			mod,
			100);
end

local function calculateInjuries(player)
	local result = {
	["hasInjury"] = false,
	["scratched"] = 0,
	["dirtyScratched"] = 0,
	["sbleeding"] = 0,
	["cut"] = 0,
	["dirtyCut"] = 0,
	["cbleeding"] = 0,
	["bitten"] = 0,
	["dirtyBite"] = 0,
	["bbleeding"] = 0,
	["deepwound"] = 0,
	["dirtyWound"] = 0,
	["dbleeding"] = 0,
	}
	local bodyDamage = player:getBodyDamage()
	for i = 0, bodyDamage:getBodyParts():size() - 1 do
		local bodyPart = bodyDamage:getBodyParts():get(i)
		if bodyPart and bodyPart:getHealth() < 100 then
			---SCRATCHES
			if bodyPart:getScratchTime() > 0 then
				if bodyPart:bleeding() and not bodyPart:bandaged() then
					result.scratched = result.scratched + 1
					result.sbleeding = result.sbleeding + 1
					result.hasInjury = true
				elseif not bodyPart:bandaged() then
					result.scratched = result.scratched + 1
					result.hasInjury = true
				elseif bodyPart:bandaged() and bodyPart:isBandageDirty() then
					result.dirtyScratched = result.dirtyScratched + 1
					result.hasInjury = true
				end
			end
			--LACERATIONS
			if bodyPart:getCutTime() > 0 then
				if bodyPart:bleeding() and not bodyPart:bandaged() then
					result.cut = result.cut + 1
					result.cbleeding = result.cbleeding + 1
					result.hasInjury = true
				elseif not bodyPart:bandaged() then
					result.cut = result.cut + 1
					result.hasInjury = true
				elseif bodyPart:bandaged() and bodyPart:isBandageDirty() then
					result.dirtyCut = result.dirtyCut + 1
					result.hasInjury = true
				end
			end
			--BITES
			if bodyPart:getBiteTime() > 0 then
				if bodyPart:bleeding() and not bodyPart:bandaged() then
					result.bitten = result.bitten + 1
					result.bbleeding = result.bbleeding + 1
					result.hasInjury = true
				elseif not bodyPart:bandaged() then
					result.bitten = result.bitten + 1
					result.hasInjury = true
				elseif bodyPart:bandaged() and bodyPart:isBandageDirty() then
					result.dirtyBite = result.dirtyBite + 1
					result.hasInjury = true
				end
			end
			--DEEP WOUNDS
			if bodyPart:getDeepWoundTime() > 0 then
				if bodyPart:bleeding() and (not bodyPart:bandaged() or not bodyPart:stitched()) then
					result.deepwound = result.deepwound + 1
					result.dbleeding = result.dbleeding + 1
					result.hasInjury = true
				elseif not bodyPart:stitched() and not bodyPart:bandaged() then
					result.deepwound = result.deepwound + 1
					result.hasInjury = true
				elseif bodyPart:bandaged() and bodyPart:isBandageDirty() and not bodyPart:stitched() then
					result.dirtyWound = result.dirtyWound + 1
					result.hasInjury = true
				end
			end
		end
	end
	return result;
end

local function onEveryOneMinute()
	local activePlayers = getNumActivePlayers()-1
	if activePlayers >= 0 then
		for playerIndex = 0, activePlayers do
			local player = getSpecificPlayer(playerIndex)
			if player and not player:isDead() then
				local totalInjuries = calculateInjuries(player)
				if totalInjuries.hasInjury then
					-- SANDBOX VALUES --
					local scratchModifier = SandboxVars.ScentOfBlood.scratchModifier
					local sbleedModifier = SandboxVars.ScentOfBlood.sbleedModifier
					local cutModifier = SandboxVars.ScentOfBlood.cutModifier
					local cbleedModifier = SandboxVars.ScentOfBlood.cbleedModifier
					local biteModifier = SandboxVars.ScentOfBlood.biteModifier
					local bbleedModifier = SandboxVars.ScentOfBlood.bbleedModifier
					local deepWoundModifier = SandboxVars.ScentOfBlood.dwoundModifier
					local dbleedModifier = SandboxVars.ScentOfBlood.dbleedModifier
					local dirtModifier = SandboxVars.ScentOfBlood.dirtModifier / 100
					---
					
					local totalAttraction = 0
					-- Calculate LOUDNESS based on all injuries 
					if totalInjuries.scratched > 0 then
						totalAttraction = totalAttraction + (totalInjuries.scratched * scratchModifier)
						--print(indent(1).."scratched calling: "..tostring(totalInjuries.scratched * scratchModifier))
					end
					if totalInjuries.dirtyScratched > 0 then
						totalAttraction = totalAttraction + (totalInjuries.dirtyScratched * (scratchModifier * dirtModifier))
					end
					if totalInjuries.sbleeding > 0 then
						totalAttraction = totalAttraction + (totalInjuries.sbleeding * sbleedModifier)
						--print(indent(1).."scratch bleeding calling: "..tostring(totalInjuries.sbleeding * sbleedModifier))
					end
					if totalInjuries.cut > 0 then
						totalAttraction = totalAttraction + (totalInjuries.cut * cutModifier)
						--print(indent(1).."cut calling: "..tostring(totalInjuries.cut * cutModifier))
					end
					if totalInjuries.dirtyCut > 0 then
						totalAttraction = totalAttraction + (totalInjuries.dirtyCut * (cutModifier * dirtModifier))
					end
					if totalInjuries.cbleeding > 0 then
						totalAttraction = totalAttraction + (totalInjuries.cbleeding * cbleedModifier)
						--print(indent(1).."cut bleeding calling: "..tostring(totalInjuries.cbleeding * cbleedModifier))
					end
					if totalInjuries.bitten > 0 then
						totalAttraction = totalAttraction + (totalInjuries.bitten * biteModifier)
						--print(indent(1).."bite calling: "..tostring(totalInjuries.bitten * biteModifier))
					end
					if totalInjuries.dirtyBite > 0 then
						totalAttraction = totalAttraction + (totalInjuries.dirtyBite * (biteModifier * dirtModifier))
					end
					if totalInjuries.bbleeding > 0 then
						totalAttraction = totalAttraction + (totalInjuries.bbleeding * bbleedModifier)
						--print(indent(1).."bite bleeding calling: "..tostring(totalInjuries.bbleeding * bbleedModifier))
					end
					if totalInjuries.deepwound > 0 then
						totalAttraction = totalAttraction + (totalInjuries.deepwound * deepWoundModifier)
						--print(indent(1).."deep wound calling: "..tostring(totalInjuries.deepwound * deepWoundModifier))
					end
					if totalInjuries.dirtyWound > 0 then
						totalAttraction = totalAttraction + (totalInjuries.dirtyWound * (deepWoundModifier * dirtModifier))
					end
					if totalInjuries.dbleeding > 0 then
						totalAttraction = totalAttraction + (totalInjuries.dbleeding * dbleedModifier)
						--print(indent(1).."deep wound bleeding calling: "..tostring(totalInjuries.dbleeding * dbleedModifier))
					end
					attractZombies(player, totalAttraction)
					--print(indent(1).."final attraction call: "..tostring(totalAttraction))
				end
			end
		end
	end
end

-----------------------------------------------------
--DEBUG----------------------------------------------
-----------------------------------------------------
local function indent(num)
  local s = ""
  for i = 0, num - 1 do
    s = s.."    "
  end
  return s
end

Events.EveryOneMinute.Add(onEveryOneMinute)