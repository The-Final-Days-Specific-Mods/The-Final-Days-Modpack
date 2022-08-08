-- main init


Valhalla = Valhalla or {
	speechR = 4 / 255,
	speechG = 131 / 255,
	speechB = 186 / 255,

	stringArrayDivider = "||",

	lastErrorObj = nil,
	lastUsedVehicle = nil,
	lastExecObj = nil,
	currentPlayer = nil,
};


-- other namespaces

Valhalla.SandboxDefaults = {
	SanitizeFilenamesForWindows = false,
    EnableItemTransferProtection = true,
	BlockedItemsForTransfer = "Base.ATMReceiver",
    EnableEventCoordinationTools = false,
    EnableTrapSetLogging = false,
    EnableTrapSetKicking = false,

    EnableContainerProtection = true,
    BlockAllDisassembly = false,
    BlockAllPickups = false,
    AllowContainerPickup = true,
    EnableSHClaimThrottling = true,
    SHDestructionTimerMin = 180,
    EnableSHOwnerCheck = false,
    EnableMovPickupLogging = true,

    EnableVehicleOwnership = true,
    VehicleOwnershipClaimNo = 5,
    AllowVehicleManageFromCell = false,
    AllowPastOwnerReclaim = false,
    AllowVehicleReleaseAfterDays = 6,
    AllowVehicleWindowSmashing = false,
    AllowVehicleTowing = true,
	AllowStealingFromVehicleContainers = true,
	AllowDoorAndTrunkAccess = true,
	AllowSiphonGas = true,
};

Valhalla.ContainerProtection = Valhalla.ContainerProtection or {};

Valhalla.VehicleClaims = Valhalla.VehicleClaims or {
	muleParts = {
		"GloveBox",
		"TruckBed",
		"TrailerTrunk",
		"TruckBedOpen",
		"M101A3Trunk",
		"Engine",
	},
	initialLoadDone = false,
	vehiclesByUser = {},
    lastOnlinePollingMins = 1,
};

Valhalla.ItemTransferProtection = Valhalla.ItemTransferProtection or {};

Valhalla.Commands = Valhalla.Commands or {};

Valhalla.AdminTools = Valhalla.AdminTools or {};

Valhalla.Narc = Valhalla.Narc or {
    pickupLogFile = "aegis_narc/container_pickup.log",
    trapLogFile = "aegis_narc/traps.log",
    playerActivityLogFolder = "aegis_narc/player_activity",
};