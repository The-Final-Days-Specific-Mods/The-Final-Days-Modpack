local SETTINGS = { 
	options = {
		dropdown1 = 2,
	},
	names= {
		dropdown1 = "Reading Speed",
	},
	mod_id = "CCFastRead",
	mod_shortname = "CCs Faster Reading"
}

if ModOptions and ModOptions.getInstance then
  local settings = ModOptions:getInstance(SETTINGS)
  local drop1 = settings:getData("dropdown1")
  drop1[1] = "2x Reading Speed"
  drop1[2] = "5x Reading Speed"
end

CCFastRead_global = {}
CCFastRead_global.SETTINGS = SETTINGS