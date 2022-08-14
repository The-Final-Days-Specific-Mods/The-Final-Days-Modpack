---------------------------------------------------------------------------------------------------------------
---------------------------------- Tread's Military Vehicle Zone definitions ----------------------------------
---------------------------------------------------------------------------------------------------------------
-------------------------------------- Code by Tread (Trealak on Steam) - redist as allowed -------------------
---------------------------------------------------------------------------------------------------------------
-- INDEX
-- 1.	Custom Util Functions
-- 2.	Vehicles to be moved to custom categories
-- 3.	Zone definitions
-- 4.	Splitter function
-- 5.	Merged Groups (for more "parking place" options)
-- 6.	Debug 100% Spawns (decomment for debugging)
---------------------------------------------------------------------------------------------------------------
--1.---------------------------------------- Custom Util Functions --------------------------------------------
---------------------------------------------------------------------------------------------------------------

local function setContains(set, key) -- function for checking if value is in the table
    return set[key] ~= nil
end

local function tableConcat(...) -- function for merging multiple tables
local counter = 1
local result = {}
  for _, t in ipairs({...}) do
    for i, v in pairs(t) do
      result[i] = v
	  counter = counter + 1
    end
  end
  return result;
end

---------------------------------------------------------------------------------------------------------------
--2.---------------------------- Vehicles to be moved to custom categories ------------------------------------
---------------------------------------------------------------------------------------------------------------
-- Add IDs to custom category assignement tables - Everything NOT in tables below stays in Military Light category --
local MilLightTrailers = {}
	MilLightTrailers["Base.TrailerM1082"] = true		-- KI5 '86 Oshkosh
	MilLightTrailers["Base.TrailerM1082tarp"] = true
	MilLightTrailers["Base.TrailerM1095"] = true
	MilLightTrailers["Base.TrailerM1095tarp"] = true
	MilLightTrailers["Rotators.TrailerWaterSmall"] = true -- Lexx "Water Trailer" mod
	MilLightTrailers["Base.TrailerM101A3cargo"] = true -- KI5 '92 AM General M998 + M101A3 Cargo trailer (Trailer)

local MilHeavyVehicles = {}
	MilHeavyVehicles["Base.82oshkoshM911"] = true	-- KI5 '82 Oshkosh
	MilHeavyVehicles["Base.82oshkoshM911B"] = true
	MilHeavyVehicles["Base.86oshkoshUSMC"] = true	-- KI5 '86 Oshkosh
	MilHeavyVehicles["Base.86oshkoshFRTR55"] = true 
	MilHeavyVehicles["Base.M113_APC"] = true 		-- PapaChad's M113
	MilHeavyVehicles["Base.m113a1"] = true 			-- Vilespring's M113A1
	MilHeavyVehicles["Base.WZ531_APC"] = true 		-- HansKaffee  WZ531(Type 63) 
	MilHeavyVehicles["Base.67commando"] = true		-- KI5 '67 Cadillac Gage Commando 
	MilHeavyVehicles["Base.67commandoT50"] = true 

local MilHeavyTrailers = {}
	MilHeavyTrailers["Base.TrailerM967Water"] = true	-- Tread's Water Tank Trucks & KI5 '82 Oshkosh
	MilHeavyTrailers["Base.TrailerM127stake"] = true	-- KI5 '82 Oshkosh
	MilHeavyTrailers["Base.TrailerM128van"] = true
	MilHeavyTrailers["Base.TrailerM129van"] = true
	MilHeavyTrailers["Base.TrailerM747lowbed"] = true
	MilHeavyTrailers["Base.TrailerM967tanker"] = true	
	MilHeavyTrailers["Rotators.TrailerWaterBig"] = true	-- Lexx "Water Trailer" mod
	MilHeavyTrailers["Rotators.TrailerM967tankerWater"] = true
	
local MilBurnt = {}
	MilBurnt["Base.82oshkoshM911Burnt"] = true	-- KI5 '82 Oshkosh
	MilBurnt["Base.86oshkoshP19ABurnt"] = true	-- KI5 '86 Oshkosh
	MilBurnt["Base.M113_APC_Burnt"] = true 		-- PapaChad's M113
	MilBurnt["Base.67commandoBurnt"] = true		-- KI5 '67 Cadillac Gage Commando 
	MilBurnt["Base.92amgeneralM998Burnt"] = true-- KI5 '92 AM General M998 + M101A3 Cargo trailer (HMMV)
	
local MilHelicopter = {}
	MilHelicopter["Base.BHelicopter"] = true	-- Better Helicopter
	MilHelicopter["Base.Black_Hawk"] = true	-- Black Hawk Mod	
	
---------------------------------------------------------------------------------------------------------------
--3.------------------------------------------ Zone definitions -----------------------------------------------
---------------------------------------------------------------------------------------------------------------
if VehicleZoneDistribution then -- check if the table exists for backwards compatibility
-- Parking Stall, common parking stall with random cars, the most used one (shop parking lots, houses etc.)

-- Trailer Parks, have a chance to spawn burnt cars, some on top of each others, it's like a pile of junk cars

-- bad vehicles, moslty used in poor area, sometimes around pub etc.

-- medium vehicles, used in some of the good looking area, or in suburbs

-- good vehicles, used in good looking area, they're meant to spawn only good cars, so they're on every good looking house.

-- sports vehicles, sometimes on good looking area.

-- junkyard, spawn damaged & burnt vehicles, less chance of finding keys but more cars.
-- also used for the random car crash.

-- traffic jam, mostly burnt car & damaged ones.
-- Used either for hard coded big traffic jam or smaller random ones.

-- ****************************** --
--          SPECIAL VEHICLES      --
-- ****************************** --

-- police

-- fire

-- ranger

-- mccoy

-- Fossoil

-- scarlet dist

-- ambulance

-- military Helicopters
VehicleZoneDistribution.military_helicopters = VehicleZoneDistribution.military_helicopters or {}
VehicleZoneDistribution.military_helicopters.vehicles = VehicleZoneDistribution.military_helicopters.vehicles or {}
if not VehicleZoneDistribution.military_helicopters.spawnRate then VehicleZoneDistribution.military_helicopters.spawnRate = 75 end -- higher spawn, since those places are few
VehicleZoneDistribution.military_helicopters.chanceToPartDamage = 0;
VehicleZoneDistribution.military_helicopters.baseVehicleQuality = 0.99;
VehicleZoneDistribution.military_helicopters.chanceToSpawnSpecial = 0;

-- military (default military zone used in mods - Most modders add ALL their military vehicles here)
VehicleZoneDistribution.military = VehicleZoneDistribution.military or {}
VehicleZoneDistribution.military.vehicles = VehicleZoneDistribution.military.vehicles or {}
if VehicleZoneDistribution.military.spawnRate == nil then -- spawn rate as mods set it, or as native army or 20%	
	if VehicleZoneDistribution.army ~= nil and VehicleZoneDistribution.army.spawnRate ~= nil then 
		VehicleZoneDistribution.military.spawnRate = VehicleZoneDistribution.army.spawnRate   
	else VehicleZoneDistribution.military.spawnRate = 20 end
end

-- military Light Vehicles (light & regular vehicles, NO trailers, NO Heavy vehicles)
VehicleZoneDistribution.military_light_veh = VehicleZoneDistribution.military_light_veh or {}
VehicleZoneDistribution.military_light_veh.vehicles = VehicleZoneDistribution.military_light_veh.vehicles or {}
if VehicleZoneDistribution.military_light_veh.spawnRate == nil then -- spawn rate as it was, as military or 20%
	if VehicleZoneDistribution.military.spawnRate ~= nil then 
		VehicleZoneDistribution.military_light_veh.spawnRate = VehicleZoneDistribution.military.spawnRate 
	else VehicleZoneDistribution.military_light_veh.spawnRate = 20 end
end
VehicleZoneDistribution.military_light_veh.chanceToPartDamage = 25;
VehicleZoneDistribution.military_light_veh.baseVehicleQuality = 0.8;
--VehicleZoneDistribution.military_light_veh.chanceToSpawnSpecial = 0;
VehicleZoneDistribution.military_light_veh.chanceToSpawnNormal = 0;
VehicleZoneDistribution.military_light_veh.specialCar = true;

-- military Light Trailers (regular trailers, but of military kind)
VehicleZoneDistribution.military_light_trailers = VehicleZoneDistribution.military_light_trailers or {}
VehicleZoneDistribution.military_light_trailers.vehicles = VehicleZoneDistribution.military_light_trailers.vehicles or {}
if not VehicleZoneDistribution.military_light_trailers.spawnRate then VehicleZoneDistribution.military_light_trailers.spawnRate = 25 end -- higher spawn, since those places are few
VehicleZoneDistribution.military_light_trailers.chanceToPartDamage = 25;
VehicleZoneDistribution.military_light_trailers.baseVehicleQuality = 0.8;
VehicleZoneDistribution.military_light_trailers.chanceToSpawnKey = 0; -- we want no keys for trailers
VehicleZoneDistribution.military_light_trailers.chanceToSpawnSpecial = 0;

-- military Heavy Vehicles (APCs and heavy trucks)
VehicleZoneDistribution.military_heavy_veh = VehicleZoneDistribution.military_heavy_veh or {}
VehicleZoneDistribution.military_heavy_veh.vehicles = VehicleZoneDistribution.military_heavy_veh.vehicles or {}
if not VehicleZoneDistribution.military_heavy_veh.spawnRate then VehicleZoneDistribution.military_heavy_veh.spawnRate = 25 end -- higher spawn, since those places are few
VehicleZoneDistribution.military_heavy_veh.chanceToPartDamage = 25;
VehicleZoneDistribution.military_heavy_veh.baseVehicleQuality = 0.8;
VehicleZoneDistribution.military_heavy_veh.chanceToSpawnSpecial = 0;

-- military Heavy Trailers
VehicleZoneDistribution.military_heavy_trailers = VehicleZoneDistribution.military_heavy_trailers or {}
VehicleZoneDistribution.military_heavy_trailers.vehicles = VehicleZoneDistribution.military_heavy_trailers.vehicles or {}
if not VehicleZoneDistribution.military_heavy_trailers.spawnRate then VehicleZoneDistribution.military_heavy_trailers.spawnRate = 25 end -- higher spawn, since those places are few
VehicleZoneDistribution.military_heavy_trailers.chanceToPartDamage = 25;
VehicleZoneDistribution.military_heavy_trailers.baseVehicleQuality = 0.8;
VehicleZoneDistribution.military_heavy_trailers.chanceToSpawnKey = 0; -- we want no keys for trailers
VehicleZoneDistribution.military_heavy_trailers.chanceToSpawnSpecial = 0;

-- military Burnt Vehicles and Trailers
VehicleZoneDistribution.military_burnt = VehicleZoneDistribution.military_burnt or {}
VehicleZoneDistribution.military_burnt.vehicles = VehicleZoneDistribution.military_burnt.vehicles or {}
if not VehicleZoneDistribution.military_burnt.spawnRate then VehicleZoneDistribution.military_burnt.spawnRate = 45 end -- spawn rate as it was or 45%

-- ********************************************************************************************************* --
-- ********************************* NATIVE army tag - New in Zomboid 41.65 ******************************** --
-- ********************************************************************************************************* --
VehicleZoneDistribution.army = VehicleZoneDistribution.army or {}		-- parking places with this tag already exist in Native, however there were no spawn declarations for them (as of 41.65)
VehicleZoneDistribution.army.vehicles = VehicleZoneDistribution.army.vehicles or {} -- those 2 lines initiate spawn list for the "Army" tag, It probably will contain ALL NATIVE army vehicles
-- merge "Army" and "Military" spawn lists (future native and modded "military" vehicles) count in. This merge allows filter/splitter function to parse only one (Army) table.
VehicleZoneDistribution.army.vehicles = tableConcat(VehicleZoneDistribution.army.vehicles, VehicleZoneDistribution.military.vehicles);
if VehicleZoneDistribution.army.spawnRate == nil then --spawn rate as NATIVE "army", or as military mods, or 20%
	if VehicleZoneDistribution.military.spawnRate ~= nil then 
		VehicleZoneDistribution.army.spawnRate = VehicleZoneDistribution.military.spawnRate 
	else VehicleZoneDistribution.army.spawnRate = 20 end
end
VehicleZoneDistribution.army.chanceToPartDamage = 25;
VehicleZoneDistribution.army.baseVehicleQuality = 0.8;
VehicleZoneDistribution.army.chanceToSpawnSpecial = 0;

-- military Chaos - any vehicle, higher chance of damage, random angle
VehicleZoneDistribution.military_chaos = VehicleZoneDistribution.military_chaos or {}
VehicleZoneDistribution.military_chaos.vehicles = VehicleZoneDistribution.military_chaos.vehicles or {}
VehicleZoneDistribution.military_chaos.vehicles = tableConcat(VehicleZoneDistribution.military_chaos.vehicles, VehicleZoneDistribution.army.vehicles);	-- merge "Army" and "Military" spawn lists (future native and modded "military" vehicles)
if not VehicleZoneDistribution.military_chaos.spawnRate then VehicleZoneDistribution.military_chaos.spawnRate = 35 end
VehicleZoneDistribution.military_chaos.chanceToPartDamage = 60;
VehicleZoneDistribution.military_chaos.baseVehicleQuality = 0.43;
VehicleZoneDistribution.military_chaos.chanceToSpawnSpecial = 0;
VehicleZoneDistribution.military_chaos.randomAngle = true;

---------------------------------------------------------------------------------------------------------------
--4.------------------------------------------ Splitter function ----------------------------------------------
---------------------------------------------------------------------------------------------------------------

--!!!!-------------Temp code ------------- Workaround for Burnt vehicle NOT in military group ---------------
if getActivatedMods():contains("67commando") then -- only add if 67commando mod is active
	VehicleZoneDistribution.military_burnt.vehicles["Base.67commandoBurnt"] = {index = -1, spawnChance = 2}; -- KI5 commando Burnt - not in military group, so function below would miss it
end
--!!!!-------------Temp code -------------

--Read vehicle spawn chance from "army group" and add it into  "custom military group" with same parameters (index and chance)
	for i,v in pairs(VehicleZoneDistribution.army.vehicles) do -- parse whole "army" spawn list (once NATIVE army vehicles get added it will be parsed as well)
	
	-------Mil Trailers (regular and light)------------------------------------------------------------------------------------------
			if	setContains(MilLightTrailers, i) then -- check whether entry on army list is about vehicle listed in "MilLightTrailers" list
					VehicleZoneDistribution.military_light_trailers.vehicles[i] = v; -- add the same spawn entry in the custom group
	-------Mil Heavy Vehicles--------------------------------------------------------------------------------------------------------
		elseif 	setContains(MilHeavyVehicles, i) then
						VehicleZoneDistribution.military_heavy_veh.vehicles[i] = v; -- add the same spawn entry in the custom group
	-------Mil Heavy Trailers-------------------------------------------------------------------------------------------------------
		elseif 	setContains(MilHeavyTrailers, i) then
						VehicleZoneDistribution.military_heavy_trailers.vehicles[i] = v;
	-------Mil Burnt Vehicles-------------------------------------------------------------------------------------------------------
		elseif 	setContains(MilBurnt, i) then
						VehicleZoneDistribution.military_burnt.vehicles[i] = v;
						
		else 	-- All vehicles which were not assigned custom group yet go into Military Light Vehicle group.
						VehicleZoneDistribution.military_light_veh.vehicles[i] = v; 
		end
	end
	
---------------------------------------------------------------------------------------------------------------
--5.-------------------------- Merged Groups (for more "parking place" options) -------------------------------
---------------------------------------------------------------------------------------------------------------

-- military Vehicles (light, regular & heavy vehicles)
VehicleZoneDistribution.military_vehicles = VehicleZoneDistribution.military_vehicles or {} -- initiate list with all Military Vehicles (by merging existing custom lists)
VehicleZoneDistribution.military_vehicles.vehicles = VehicleZoneDistribution.military_vehicles.vehicles or {}
VehicleZoneDistribution.military_vehicles.vehicles = tableConcat(VehicleZoneDistribution.military_vehicles.vehicles, VehicleZoneDistribution.military_light_veh.vehicles, VehicleZoneDistribution.military_heavy_veh.vehicles);
if VehicleZoneDistribution.military_vehicles.spawnRate == nil then -- spawn rate as it was, as military or 20%
	if VehicleZoneDistribution.military.spawnRate ~= nil then 
		VehicleZoneDistribution.military_vehicles.spawnRate = VehicleZoneDistribution.military.spawnRate
	else VehicleZoneDistribution.military_vehicles.spawnRate = 20 end
end
VehicleZoneDistribution.military_vehicles.chanceToPartDamage = 25;
VehicleZoneDistribution.military_vehicles.baseVehicleQuality = 0.8;
VehicleZoneDistribution.military_vehicles.chanceToSpawnSpecial = 0;

-- military Trailers (light, regular & heavy Trailers)
VehicleZoneDistribution.military_trailers = VehicleZoneDistribution.military_trailers or {} -- initiate list with all Military Trailes (by merging existing custom lists)
VehicleZoneDistribution.military_trailers.vehicles = VehicleZoneDistribution.military_trailers.vehicles or  {}
VehicleZoneDistribution.military_trailers.vehicles = tableConcat(VehicleZoneDistribution.military_trailers.vehicles, VehicleZoneDistribution.military_light_trailers.vehicles, VehicleZoneDistribution.military_heavy_trailers.vehicles);
if not VehicleZoneDistribution.military_trailers.spawnRate then VehicleZoneDistribution.military_trailers.spawnRate = 25 end -- higher spawn, since those places are few
VehicleZoneDistribution.military_trailers.chanceToPartDamage = 25;
VehicleZoneDistribution.military_trailers.baseVehicleQuality = 0.8;
VehicleZoneDistribution.military_trailers.chanceToSpawnKey = 0;	-- we want no keys for trailers
VehicleZoneDistribution.military_trailers.chanceToSpawnSpecial = 0;

-- Military Light Vehicles and Trailers
VehicleZoneDistribution.military_light = VehicleZoneDistribution.military_light or {} -- initiate list with all Military Vehicles (by merging existing custom lists)
VehicleZoneDistribution.military_light.vehicles = VehicleZoneDistribution.military_light.vehicles or {}
VehicleZoneDistribution.military_light.vehicles = tableConcat(VehicleZoneDistribution.military_light.vehicles, VehicleZoneDistribution.military_light_veh.vehicles, VehicleZoneDistribution.military_light_trailers.vehicles);
if not  VehicleZoneDistribution.military_light.spawnRate then VehicleZoneDistribution.military_light.spawnRate = 25 end -- higher spawn, since those places are few
VehicleZoneDistribution.military_light.chanceToPartDamage = 25;
VehicleZoneDistribution.military_light.baseVehicleQuality = 0.8;
VehicleZoneDistribution.military_light.chanceToSpawnSpecial = 0;

-- Military Heavy Vehicles and Trailers
VehicleZoneDistribution.military_heavy = VehicleZoneDistribution.military_heavy or {} -- initiate list with all Military Trailes (by merging existing custom lists)
VehicleZoneDistribution.military_heavy.vehicles = VehicleZoneDistribution.military_heavy.vehicles or  {}
VehicleZoneDistribution.military_heavy.vehicles = tableConcat(VehicleZoneDistribution.military_heavy.vehicles, VehicleZoneDistribution.military_heavy_veh.vehicles, VehicleZoneDistribution.military_heavy_trailers.vehicles);
if not VehicleZoneDistribution.military_heavy.spawnRate then VehicleZoneDistribution.military_heavy.spawnRate = 25 end -- higher spawn, since those places are few
VehicleZoneDistribution.military_heavy.chanceToPartDamage = 25;
VehicleZoneDistribution.military_heavy.baseVehicleQuality = 0.8;
VehicleZoneDistribution.military_heavy.chanceToSpawnSpecial = 0;		




---------------------------------------------------------------------------------------------------------------
--6.----------------------------- Debug 100% Spawns (decomment for debugging) ---------------------------------
---------------------------------------------------------------------------------------------------------------

--[[
VehicleZoneDistribution.army.spawnRate = 100;					---Test line
VehicleZoneDistribution.military.spawnRate = 100;				---Test line
VehicleZoneDistribution.military_light_veh.spawnRate = 100;		---Test line
VehicleZoneDistribution.military_light_trailers.spawnRate = 100;---Test line
VehicleZoneDistribution.military_heavy_veh.spawnRate = 100;		---Test line
VehicleZoneDistribution.military_heavy_trailers.spawnRate = 100;---Test line
VehicleZoneDistribution.military_burnt.spawnRate = 100;			---Test line
VehicleZoneDistribution.military_vehicles.spawnRate = 100;		---Test line
VehicleZoneDistribution.military_trailers.spawnRate = 100;		---Test line
VehicleZoneDistribution.military_light.spawnRate = 100;			---Test line
VehicleZoneDistribution.military_heavy.spawnRate = 100;			---Test line
VehicleZoneDistribution.military_chaos.spawnRate = 100;			---Test line
]]--

end