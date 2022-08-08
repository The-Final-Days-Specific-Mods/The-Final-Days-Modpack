require 'NPCs/ZombiesZoneDefinition'


monmouth_ZombiesZoneDefinition = ZombiesZoneDefinition or {};

-- name of the zone for the zone type ZombiesType (in worldzed)
ZombiesZoneDefinition.DeadApesClub = {
	DeadApesBiker = {
		name="MonmouthDeadApeBiker",
		gender="male",
		chance=100,
	},
}
ZombiesZoneDefinition.Moobys = {
	MoobysEmployee = {
		name="MoobysOutfit",
		chance=100,
	},
}
ZombiesZoneDefinition.LobsterZeds = {
	LobsterZombies = {
		name="LobsterZed",
		chance=100,
	},
}
ZombiesZoneDefinition.FlappyFraz = {
	FlappyFraz = {
		name="FlappyFraz",
		toSpawn=1,
		gender="male",
		mandatory="true",
	},
}
ZombiesZoneDefinition.SilentBob = {
	SilentBob = {
		name="SilentBob",
		toSpawn=1,
		gender="male",
		mandatory="true",
	},
}
ZombiesZoneDefinition.KevinSmithJay = {
	KevinSmithJay = {
		name="KevinSmithJay",
		toSpawn=1,
		gender="male",
		mandatory="true",
	},
}
