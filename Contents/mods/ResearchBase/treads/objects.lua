----------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------- Tread's Military Vehicles Zone definitions -------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------ Code by Tread (Trealak on Steam) ------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------

---Code below has simple idea - "what if I use zone definition code, just like in map mods ... but without making any map"
---It turns out that everything works as expected and new vehicle spawn zones get defined on Native map 
---(well, on any map - if you replace some map cells, those definitions will probably work there as well)
---(it can cause some incompatibilites. If it is your case I suggest commenting out/deleting such lines)

----------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------- Available "Military Zones" ---------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------

-- army      				-- default, NATIVE zone used for army vehicles -- Some instances are placed on NATIVE map (as of v. 41.65) but not used yet (no vehicle spawns defined)
-- military					-- default military zone used by many mods and on many custom maps
-- military_light_veh		-- custom zone for Light Vehicles (everything except trailers, BIG trucks, APCs, Tanks etc.), all "unsorted" vehicles from "military" also count here
-- military_light_trailers	-- custom zone for Light Military Trailers (reasonable in size)
-- military_heavy_veh		-- custom zone for Heavy Military Vehicles (BIG Trucks, APCs, Tanks etc.)
-- military_heavy_trailers	-- custom zone for Heavy Military Trailers (semi-trailers, BIG trailers etc.)
-- military_burnt			-- custom zone for Destroyed Military Vehicles
-- military_light			-- custom zone = military_light_veh + military_light_trailers
-- military_heavy			-- custom zone = military_heavy_veh + military_heavy_trailers
-- military_vehicles		-- custom zone = military_light_veh + military_heavy_veh (all Military Vehicles, NO Trailers)
-- military_trailers		-- custom zone = military_light_trailers + military_heavy_trailers (all Military Trailers, NO Vehicles)
-- military_chaos			-- custom zone = All Army & Military Vehicles & Trailers - random angle, higher damage chance

----------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------- Zone Placement ---------------------------------------------------------------------
objects = {
  --------------------- Secret Base ----------------------
  { name = "military_vehicles", type = "ParkingStall", x = 5601, y = 12433, z = 0, width = 5, height = 30, properties = { Direction = "E", FaceDirection = true } },--secret base along fence 1 
  { name = "military_heavy_trailers", type = "ParkingStall", x = 5583, y = 12464, z = 0, width = 12, height = 5, properties = { Direction = "N", FaceDirection = true } },--secret base along fence 2
  { name = "military_light_veh", type = "ParkingStall", x = 5529, y = 12495, z = 0, width = 5, height = 3, properties = { Direction = "W", FaceDirection = false } },--secret base in front of garage 
  { name = "army", type = "ParkingStall", x = 5633, y = 12453, z = 0, width = 3, height = 5, properties = { Direction = "S", FaceDirection = true } },--secret base road 1
  { name = "army", type = "ParkingStall", x = 5813, y = 12478, z = 0, width = 5, height = 3, properties = { Direction = "W", FaceDirection = false } },--secret base road 2
  { name = "army", type = "ParkingStall", x = 6833, y = 12033, z = 0, width = 3, height = 5, properties = { Direction = "N", FaceDirection = true } },--secret base, approach
  ------------------------ Prison ------------------------
  { name = "military_vehicles", type = "ParkingStall", x = 7742, y = 11810, z = 0, width = 5, height = 9, properties = { Direction = "W", FaceDirection = false } },
  { name = "military_vehicles", type = "ParkingStall", x = 7742, y = 11795, z = 0, width = 5, height = 6, properties = { Direction = "W", FaceDirection = true } },
  --------------------- Barracks 1 -----------------------
  { name = "military_light_veh", type = "ParkingStall", x = 8118, y = 10236, z = 0, width = 3, height = 5, properties = { Direction = "N", FaceDirection = false } }, -- near building
  { name = "military_vehicles", type = "ParkingStall", x = 8149, y = 10250, z = 0, width = 5, height = 3, properties = { Direction = "E", FaceDirection = false } }, -- near tables 1
  { name = "military_light", type = "ParkingStall", x = 8149, y = 10253, z = 0, width = 5, height = 3, properties = { Direction = "W", FaceDirection = false } },  -- near tables 2
  { name = "army", type = "ParkingStall", x = 8149, y = 10257, z = 0, width = 5, height = 3, properties = { Direction = "E", FaceDirection = true } }, -- near tables 3
  { name = "military_light_veh", type = "ParkingStall", x = 8171, y = 10240, z = 0, width = 5, height = 3, properties = { Direction = "E", FaceDirection = true } }, -- near blue house
  { name = "army", type = "ParkingStall", x = 8092, y = 10602, z = 0, width = 3, height = 5, properties = { Direction = "N", FaceDirection = false } }, -- beside one of access roads
  { name = "military_heavy_trailers", type = "ParkingStall", x = 8132, y = 10259, z = 0, width = 5, height = 3, properties = { Direction = "E", FaceDirection = false } }, -- semi-trailer along "table road"
  --------------------- Barracks 2 -----------------------
  { name = "military_light", type = "ParkingStall", x = 6779, y = 9922, z = 0, width = 5, height = 6, properties = { Direction = "E", FaceDirection = true } },	-- near building
  { name = "military_light_veh", type = "ParkingStall", x = 6779, y = 9931, z = 0, width = 5, height = 3, properties = { Direction = "W", FaceDirection = false } }, -- near building
  { name = "army", type = "ParkingStall", x = 6790, y = 9982, z = 0, width = 15, height = 5, properties = { Direction = "S", FaceDirection = true } }, -- parking lot
  --------------------- Barracks 3 -----------------------
  { name = "military_light", type = "ParkingStall", x = 9106, y = 11807, z = 0, width = 5, height = 3, properties = { Direction = "E", FaceDirection = true } }, -- near building
  { name = "army", type = "ParkingStall", x = 9110, y = 11832, z = 0, width = 5, height = 15, properties = { Direction = "W", FaceDirection = true } }, -- main parking row
  { name = "military_light", type = "ParkingStall", x = 9103, y = 11834, z = 0, width = 3, height = 15, properties = { Direction = "N", FaceDirection = true } }, --parallel parking
  -------------- Military "Fence" locations --------------
  { name = "military_vehicles", type = "ParkingStall", x = 14538, y = 4021, z = 0, width = 5, height = 3, properties = { Direction = "W", FaceDirection = true } }, -- most E like outpost, near tent
  { name = "army", type = "ParkingStall", x = 14537, y = 3996, z = 0, width = 3, height = 5, properties = { Direction = "N", FaceDirection = true } }, -- most E like outpost, near gate
  { name = "military_vehicles", type = "ParkingStall", x = 13449, y = 4074, z = 0, width = 3, height = 5, properties = { Direction = "N", FaceDirection = true } }, -- bend outpost, near satellite
  { name = "military_light_trailers", type = "ParkingStall", x = 13427, y = 3958, z = 0, width = 5, height = 3, properties = { Direction = "W", FaceDirection = true } }, -- bend outpost, blockade nearby
  { name = "military_light_veh", type = "ParkingStall", x = 13412, y = 3955, z = 0, width = 3, height = 5, properties = { Direction = "N", FaceDirection = false } }, -- bend outpost, blockade nearby
  { name = "army", type = "ParkingStall", x = 13611, y = 4093, z = 0, width = 3, height = 5, properties = { Direction = "N", FaceDirection = true } }, -- near watchtower between outposts
  { name = "military_burnt", type = "ParkingStall", x = 13554, y = 4124, z = 0, width = 5, height = 3, properties = { Direction = "E", FaceDirection = true } },-- near burned houses, near military fence - damage if possible
  { name = "army", type = "ParkingStall", x = 12729, y = 3966, z = 0, width = 6, height = 5, properties = { Direction = "N", FaceDirection = true } }, -- "house" outpost, blind road
  { name = "military_vehicles", type = "ParkingStall", x = 12696, y = 3965, z = 0, width = 5, height = 3, properties = { Direction = "W", FaceDirection = true } }, -- "house" outpost by first house
  { name = "military_light_trailers", type = "ParkingStall", x = 12778, y = 3989, z = 0, width = 5, height = 3, properties = { Direction = "W", FaceDirection = true } }, -- "house" outpost by first house
  ------ Military "Fence" Base on way to Louisville ------
  { name = "military_light_veh", type = "ParkingStall", x = 12505, y = 4349, z = 0, width = 5, height = 3, properties = { Direction = "E", FaceDirection = true } }, -- S gate
  { name = "military_light_veh", type = "ParkingStall", x = 12533, y = 4345, z = 0, width = 3, height = 5, properties = { Direction = "N", FaceDirection = true } }, -- near S tower
  { name = "army", type = "ParkingStall", x = 12470, y = 4253, z = 0, width = 5, height = 3, properties = { Direction = "E", FaceDirection = true } }, -- W part of camp, near white trailer
  { name = "army", type = "ParkingStall", x = 12524, y = 4246, z = 0, width = 3, height = 5, properties = { Direction = "S", FaceDirection = true } }, -- E part of camp, near container
  { name = "military_light_veh", type = "ParkingStall", x = 12547, y = 4289, z = 0, width = 3, height = 5, properties = { Direction = "N", FaceDirection = false } }, -- E part of camp, between tents, road
  { name = "army", type = "ParkingStall", x = 12576, y = 4269, z = 0, width = 5, height = 3, properties = { Direction = "W", FaceDirection = true } }, -- E part of camp, between tents, parked
  { name = "army", type = "ParkingStall", x = 12499, y = 4238, z = 0, width = 3, height = 5, properties = { Direction = "N", FaceDirection = true } }, -- W part of camp, between fence and tent
  { name = "army", type = "ParkingStall", x = 12518, y = 4202, z = 0, width = 3, height = 5, properties = { Direction = "N", FaceDirection = false } }, -- N Gate 
  { name = "military_light_veh", type = "ParkingStall", x = 12526, y = 4214, z = 0, width = 5, height = 3, properties = { Direction = "W", FaceDirection = true } }, -- near N tower
  { name = "army", type = "ParkingStall", x = 12478, y = 4225, z = 0, width = 5, height = 3, properties = { Direction = "E", FaceDirection = false } }, -- W part of camp, between tents
  { name = "military_vehicles", type = "ParkingStall", x = 12565, y = 4343, z = 0, width = 6, height = 5, properties = { Direction = "N", FaceDirection = true } }, -- near "fence" gate
  { name = "military_vehicles", type = "ParkingStall", x = 12591, y = 4068, z = 0, width = 3, height = 5, properties = { Direction = "N", FaceDirection = true } }, -- fence blockade near refugee camp
  { name = "army", type = "ParkingStall", x = 12503, y = 4491, z = 0, width = 3, height = 5, properties = { Direction = "S", FaceDirection = true } }, -- near outer fence S
  { name = "military_burnt", type = "ParkingStall", x = 12531, y = 4360, z = 0, width = 5, height = 3, properties = { Direction = "E", FaceDirection = false } }, -- below S tower - in kill zone
  { name = "military_chaos", type = "ParkingStall", x = 12543, y = 4495, z = 0, width = 5, height = 3, properties = { Direction = "E", FaceDirection = false } }, -- near outer fence S
  ------------------ army Surplus Shop -------------------
  { name = "military_vehicles", type = "ParkingStall", x = 12236, y = 1303, z = 0, width = 6, height = 5, properties = { Direction = "N", FaceDirection = true } }, 
  ---------- Hospital on the way to Louisville -----------
  { name = "military_vehicles", type = "ParkingStall", x = 12478, y = 3639, z = 0, width = 3, height = 5, properties = { Direction = "N", FaceDirection = false } },
  { name = "army", type = "ParkingStall", x = 12476, y = 3708, z = 0, width = 3, height = 5, properties = { Direction = "N", FaceDirection = false } },
  { name = "military_light_veh", type = "ParkingStall", x = 12400, y = 3641, z = 0, width = 5, height = 6, properties = { Direction = "W", FaceDirection = true } },
  { name = "army", type = "ParkingStall", x = 12476, y = 3692, z = 0, width = 3, height = 5, properties = { Direction = "N", FaceDirection = false } },
  ---------- Ranger "forest base" near Riverside ---------
  { name = "army", type = "ParkingStall", x = 4673, y = 8620, z = 0, width = 3, height = 5, properties = { Direction = "N", FaceDirection = false } },
  ---------------- Hospital in Louisville ----------------
  { name = "military_light_veh", type = "ParkingStall", x = 12927, y = 2094, z = 0, width = 5, height = 3, properties = { Direction = "E", FaceDirection = false } },
  { name = "army", type = "ParkingStall", x = 12952, y = 2094, z = 0, width = 5, height = 3, properties = { Direction = "E", FaceDirection = false } },
  { name = "military_vehicles", type = "ParkingStall", x = 13014, y = 2002, z = 0, width = 3, height = 5, properties = { Direction = "N", FaceDirection = false } },
  --------- Bridge out of Louisville - map end -----------
  { name = "military_vehicles", type = "ParkingStall", x = 12594, y = 953, z = 0, width = 5, height = 3, properties = { Direction = "E", FaceDirection = false } },
  -------- East road out of Louisville - map end ---------
  { name = "military_vehicles", type = "ParkingStall", x = 14974, y = 3443, z = 0, width = 5, height = 3, properties = { Direction = "E", FaceDirection = false } },
  { name = "military_vehicles", type = "ParkingStall", x = 14981, y = 3453, z = 0, width = 5, height = 3, properties = { Direction = "E", FaceDirection = false } },
  --------------- Rail Station Louisville ----------------
  { name = "military_vehicles", type = "ParkingStall", x = 12683, y = 2355, z = 0, width = 5, height = 3, properties = { Direction = "E", FaceDirection = false } },
  { name = "military_light_veh", type = "ParkingStall", x = 12702, y = 2353, z = 0, width = 3, height = 5, properties = { Direction = "S", FaceDirection = true } },
  -------------- Police Station Louisville ---------------
  { name = "military_light_veh", type = "ParkingStall", x = 12494, y = 1607, z = 0, width = 3, height = 5, properties = { Direction = "N", FaceDirection = true } },
  ---------------- Refinery  Louisville ------------------
  { name = "army", type = "ParkingStall", x = 12065, y = 1393, z = 0, width = 3, height = 5, properties = { Direction = "N", FaceDirection = false } },
  --------------- "Barracks"  Louisville -----------------
  { name = "military_vehicles", type = "ParkingStall", x = 12442, y = 1421, z = 0, width = 5, height = 6, properties = { Direction = "W", FaceDirection = true } },
  ------------- March Ridge - Military town --------------
  { name = "military_vehicles", type = "ParkingStall", x = 10079, y = 12641, z = 0, width = 5, height = 3, properties = { Direction = "E", FaceDirection = false } },
  { name = "military_vehicles", type = "ParkingStall", x = 10141, y = 12815, z = 0, width = 5, height = 3, properties = { Direction = "E", FaceDirection = false } },
  { name = "military_vehicles", type = "ParkingStall", x = 9810, y = 12654, z = 0, width = 5, height = 3, properties = { Direction = "E", FaceDirection = false } },
  { name = "military_vehicles", type = "ParkingStall", x = 9934, y = 13015, z = 0, width = 5, height = 3, properties = { Direction = "E", FaceDirection = false } },
  { name = "military_vehicles", type = "ParkingStall", x = 9645, y = 12781, z = 0, width = 5, height = 3, properties = { Direction = "E", FaceDirection = false } }, 
  { name = "military_heavy_trailers", type = "ParkingStall", x = 10046, y = 12758, z = 0, width = 5, height = 3, properties = { Direction = "E", FaceDirection = true } }, -- near community center
  { name = "military_heavy_trailers", type = "ParkingStall", x = 10058, y = 12758, z = 0, width = 5, height = 3, properties = { Direction = "E", FaceDirection = true } }, -- near community center
  { name = "military_vehicles", type = "ParkingStall", x = 10018, y = 12710, z = 0, width = 3, height = 5, properties = { Direction = "N", FaceDirection = true } }, -- near community center
  { name = "military_light_veh", type = "ParkingStall", x = 10008, y = 12677, z = 0, width = 5, height = 3, properties = { Direction = "E", FaceDirection = false } }, -- near school
  { name = "military_light_veh", type = "ParkingStall", x = 9857, y = 12993, z = 0, width = 5, height = 3, properties = { Direction = "W", FaceDirection = true } }, -- near house
  { name = "military_vehicles", type = "ParkingStall", x = 9984, y = 13018, z = 0, width = 3, height = 5, properties = { Direction = "N", FaceDirection = true } }, -- near house
  { name = "military_burnt", type = "ParkingStall", x = 10352, y = 12417, z = 0, width = 3, height = 5, properties = { Direction = "N", FaceDirection = false } }, -- near entry gate
  { name = "military_light_veh", type = "ParkingStall", x = 10354, y = 12404, z = 0, width = 3, height = 5, properties = { Direction = "N", FaceDirection = true } }, -- near entry gate
  { name = "military_light_veh", type = "ParkingStall", x = 9858, y = 12616, z = 0, width = 5, height = 3, properties = { Direction = "W", FaceDirection = true } }, -- near house
  { name = "military_burnt", type = "ParkingStall", x = 9933, y = 12824, z = 0, width = 5, height = 3, properties = { Direction = "W", FaceDirection = true } }, -- near house
  { name = "military_chaos", type = "ParkingStall", x = 9783, y = 12882, z = 0, width = 5, height = 3, properties = { Direction = "W", FaceDirection = false } }, -- near house/fence hole
  { name = "military_heavy_veh", type = "ParkingStall", x = 10353, y = 12761, z = 0, width = 3, height = 5, properties = { Direction = "N", FaceDirection = false } }, -- near house/church
  { name = "military_chaos", type = "ParkingStall", x = 10374, y = 12517, z = 0, width = 3, height = 5, properties = { Direction = "N", FaceDirection = false } }, -- beside road
  { name = "military_light_veh", type = "ParkingStall", x = 10227, y = 12751, z = 0, width = 5, height = 3, properties = { Direction = "W", FaceDirection = false } }, -- near house
  { name = "military_light", type = "ParkingStall", x = 10293, y = 12819, z = 0, width = 3, height = 5, properties = { Direction = "S", FaceDirection = true } }, -- near house
  { name = "military_heavy", type = "ParkingStall", x = 10116, y = 12724, z = 0, width = 5, height = 3, properties = { Direction = "E", FaceDirection = true } }, -- near shopping area garage
  --------------------------------------------------------
  ------------------- Random locations -------------------
  { name = "army", type = "ParkingStall", x = 11271, y = 6598, z = 0, width = 5, height = 3, properties = { Direction = "W", FaceDirection = false } },	-- West Point Pier
  { name = "military_light_veh", type = "ParkingStall", x = 11914, y = 6940, z = 0, width = 3, height = 5, properties = { Direction = "N", FaceDirection = true } },	-- West Point Police Station
  { name = "military_light_veh", type = "ParkingStall", x = 11626, y = 8310, z = 0, width = 5, height = 3, properties = { Direction = "W", FaceDirection = true } },	-- West Point -> Muldraught on intersection
  { name = "military_light_veh", type = "ParkingStall", x = 13244, y = 5471, z = 0, width = 9, height = 5, properties = { Direction = "N", FaceDirection = false } },	-- Shooting range west of West Point
  { name = "military_light_veh", type = "ParkingStall", x = 13114, y = 5313, z = 0, width = 3, height = 5, properties = { Direction = "N", FaceDirection = false } },	-- Hunting Lodge near shooting range
  { name = "army", type = "ParkingStall", x = 3801, y = 8500, z = 0, width = 5, height = 3, properties = { Direction = "W", FaceDirection = true } },	-- Hunting Shop, S of Riverside
  { name = "military_vehicles", type = "ParkingStall", x = 6418, y = 5336, z = 0, width = 5, height = 6, properties = { Direction = "W", FaceDirection = true } },	-- Shopping zone of Riverside
  { name = "military_vehicles", type = "ParkingStall", x = 7248, y = 8190, z = 0, width = 3, height = 5, properties = { Direction = "N", FaceDirection = false } },	-- Burgers on Dixie outskirts
  { name = "army", type = "ParkingStall", x = 10648, y = 10417, z = 0, width = 3, height = 5, properties = { Direction = "N", FaceDirection = false } },	-- Muldraught Police Station
  { name = "military_chaos", type = "ParkingStall", x = 11610, y = 10184, z = 0, width = 3, height = 5, properties = { Direction = "S", FaceDirection = false } },	-- Train yard E of Muldraught,
  { name = "military_light", type = "ParkingStall", x = 10898, y = 10131, z = 0, width = 5, height = 3, properties = { Direction = "E", FaceDirection = false } }, -- "Doctors" House in Muldraught
  { name = "military_vehicles", type = "ParkingStall", x = 8502, y = 8553, z = 0, width = 5, height = 3, properties = { Direction = "E", FaceDirection = false } }, -- Vegetables stall near Ponies
  { name = "military_light", type = "ParkingStall", x = 5152, y = 5524, z = 0, width = 3, height = 5, properties = { Direction = "N", FaceDirection = false } },	-- House above riverside, by river
  { name = "army", type = "ParkingStall", x = 8407, y = 7494, z = 0, width = 5, height = 3, properties = { Direction = "E", FaceDirection = false } }, -- road by the river, between west point and riverside
  { name = "military_light_veh", type = "ParkingStall", x = 9821, y = 7631, z = 0, width = 3, height = 5, properties = { Direction = "N", FaceDirection = true } },	-- Farm, W of West Point, S of river
  { name = "military_light", type = "ParkingStall", x = 11591, y = 9291, z = 0, width = 3, height = 5, properties = { Direction = "S", FaceDirection = true } },	-- Isolated forest house (muldraught)
  { name = "military_light_veh", type = "ParkingStall", x = 12106, y = 9612, z = 0, width = 5, height = 3, properties = { Direction = "E", FaceDirection = true } }, -- road below Muldraught
  { name = "military_light_veh", type = "ParkingStall", x = 13674, y = 2144, z = 0, width = 5, height = 3, properties = { Direction = "E", FaceDirection = false } }, -- random house Louisville
  { name = "military_burnt", type = "ParkingStall", x = 13418, y = 4126, z = 0, width = 3, height = 5, properties = { Direction = "S", FaceDirection = false } }, -- S of military fence - near blockade
  { name = "military_burnt", type = "ParkingStall", x = 3839, y = 6173, z = 0, width = 3, height = 5, properties = { Direction = "S", FaceDirection = false } }, -- abandoned warehouse near Riverside
  { name = "military_chaos", type = "ParkingStall", x = 9501, y = 8759, z = 0, width = 3, height = 5, properties = { Direction = "S", FaceDirection = false } },	-- forest "cut-out" near forest cabin
  { name = "military_burnt", type = "ParkingStall", x = 11044, y = 9056, z = 0, width = 5, height = 3, properties = { Direction = "E", FaceDirection = false } }, -- abandoned warehouse near Riverside
  
  -- !! Keep this one last, or pay attention to commas !! --
  { name = "army", type = "ParkingStall", x = 8307, y = 12205, z = 0, width = 5, height = 3, properties = { Direction = "W", FaceDirection = false } }	-- Gas Station below Rosewood
  
  
}
