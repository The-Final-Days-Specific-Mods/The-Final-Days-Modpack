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

-----------------------------------------------------
--CORE-----------------------------------------------
-----------------------------------------------------

local function attractZombies(player, mod)
   if player:isSneaking() then
      player:setSneaking(false)
      player:DoFootstepSound(mod)
	  player:DoFootstepSound(mod)
	  player:DoFootstepSound(mod)
      player:setSneaking(true)
   else
      player:DoFootstepSound(mod)
	  player:DoFootstepSound(mod)
	  player:DoFootstepSound(mod)
	end
end

local function calculateInjuries(player)
	local result = {
	["scratched"] = 0,
	["sbleeding"] = 0,
	["cut"] = 0,
	["cbleeding"] = 0,
	["bitten"] = 0,
	["bbleeding"] = 0,
	["deepwound"] = 0,
	["dbleeding"] = 0,
	["dirtybandage"] = 0,
	}
	
	local bodyDamage = player:getBodyDamage()
	for i = 0, bodyDamage:getBodyParts():size() - 1 do
		local bodyPart = bodyDamage:getBodyParts():get(i)
		---SCRATCHES
		if bodyPart:getScratchTime() > 0 then
			if bodyPart:bleeding() and not bodyPart:bandaged() then
				result.scratched = result.scratched + 1
				result.sbleeding = result.sbleeding + 1
			elseif not bodyPart:bandaged() then
				result.scratched = result.scratched + 1
			elseif bodyPart:bandaged() and bodyPart:isBandageDirty() then
				result.dirtybandage = result.dirtybandage + 1
			end
		end
		--LACERATIONS
		if bodyPart:getCutTime() > 0 then
			if bodyPart:bleeding() and not bodyPart:bandaged() then
				result.cut = result.cut + 1
				result.cbleeding = result.cbleeding + 1
			elseif not bodyPart:bandaged() then
				result.cut = result.cut + 1
			elseif bodyPart:bandaged() and bodyPart:isBandageDirty() then
				result.dirtybandage = result.dirtybandage + 1
			end
		end
		--BITES
		if bodyPart:getBiteTime() > 0 then
			if bodyPart:bleeding() and not bodyPart:bandaged() then
				result.bitten = result.bitten + 1
				result.bbleeding = result.bbleeding + 1
			elseif not bodyPart:bandaged() then
				result.bitten = result.bitten + 1
			elseif bodyPart:bandaged() and bodyPart:isBandageDirty() then
				result.dirtybandage = result.dirtybandage + 1
			end
		end
		--DEEP WOUNDS
		if bodyPart:getDeepWoundTime() > 0 then
			if bodyPart:bleeding() and not bodyPart:bandaged() and not bodyPart:stitched() then
				result.deepwound = result.deepwound + 1
				result.dbleeding = result.dbleeding + 1
			elseif bodyPart:bandaged() and bodyPart:isBandageDirty() and not bodyPart:stitched() then
				result.dirtybandage = result.dirtybandage + 1
				result.deepwound = result.deepwound + 1 -- patch 
			elseif not bodyPart:stitched() or not bodyPart:bandaged() then
				result.deepwound = result.deepwound + 1
			end
		end
	end
	return result;
end

local function onEveryOneMinute()
    for playerIndex = 0, getNumActivePlayers()-1 do
		local player = getSpecificPlayer(playerIndex)
		local totalInjuries = calculateInjuries(player)
		-- SANDBOX VALUES --
		local scratchModifier = SandboxVars.ScentOfBlood.scratchModifier
		local sbleedModifier = SandboxVars.ScentOfBlood.sbleedModifier
		local cutModifier = SandboxVars.ScentOfBlood.cutModifier
		local cbleedModifier = SandboxVars.ScentOfBlood.cbleedModifier
		local biteModifier = SandboxVars.ScentOfBlood.biteModifier
		local bbleedModifier = SandboxVars.ScentOfBlood.bbleedModifier
		local deepWoundModifier = SandboxVars.ScentOfBlood.dwoundModifier
		local dbleedModifier = SandboxVars.ScentOfBlood.dbleedModifier
		local dbandageModifier = SandboxVars.ScentOfBlood.dbandageModifier

		---
		
		local totalAttraction = 0
		-- Calculate LOUDNESS based on all injuries 
		if totalInjuries.scratched > 0 then
			totalAttraction = totalAttraction + (totalInjuries.scratched * scratchModifier)
			print(indent(1).."scratched calling: "..tostring(totalInjuries.scratched * scratchModifier))
		end
		if totalInjuries.sbleeding > 0 then
			totalAttraction = totalAttraction + (totalInjuries.sbleeding * sbleedModifier)
			print(indent(1).."scratch bleeding calling: "..tostring(totalInjuries.sbleeding * sbleedModifier))
		end
		if totalInjuries.cut > 0 then
			totalAttraction = totalAttraction + (totalInjuries.cut * cutModifier)
			print(indent(1).."cut calling: "..tostring(totalInjuries.cut * cutModifier))
		end
		if totalInjuries.cbleeding > 0 then
			totalAttraction = totalAttraction + (totalInjuries.cbleeding * cbleedModifier)
			print(indent(1).."cut bleeding calling: "..tostring(totalInjuries.cbleeding * cbleedModifier))
		end
		if totalInjuries.bitten > 0 then
			totalAttraction = totalAttraction + (totalInjuries.bitten * biteModifier)
			print(indent(1).."bite calling: "..tostring(totalInjuries.bitten * biteModifier))
		end
		if totalInjuries.bbleeding > 0 then
			totalAttraction = totalAttraction + (totalInjuries.bbleeding * bbleedModifier)
			print(indent(1).."bite bleeding calling: "..tostring(totalInjuries.bbleeding * bbleedModifier))
		end
		if totalInjuries.deepwound > 0 then
			totalAttraction = totalAttraction + (totalInjuries.deepwound * deepWoundModifier)
			print(indent(1).."deep wound calling: "..tostring(totalInjuries.deepwound * deepWoundModifier))
		end
		if totalInjuries.dbleeding > 0 then
			totalAttraction = totalAttraction + (totalInjuries.dbleeding * dbleedModifier)
			print(indent(1).."deep wound bleeding calling: "..tostring(totalInjuries.dbleeding * dbleedModifier))
		end
		if totalInjuries.dirtybandage > 0 then --patch
			totalAttraction = totalAttraction + (totalInjuries.dirtybandage * dbandageModifier) --patch
			print(indent(1).."dirty bandage calling: "..tostring(totalInjuries.dirtybandage * dbandageModifier)) --patch
		end
		attractZombies(player, totalAttraction)
		print(indent(2).."final attraction call: "..tostring(totalAttraction))
		
	end
end

Events.EveryOneMinute.Add(onEveryOneMinute)
