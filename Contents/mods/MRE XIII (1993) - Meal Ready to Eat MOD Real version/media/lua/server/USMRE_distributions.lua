
-- MRE XIII (1993) - Meal Ready to Eat MOD Real version

-- 2022-01-04 Version 4.03

-- Log display processing

print("************************************************************");
print("*                                                          *");
print("*  MRE XIII (1993) - Meal Ready to Eat MOD Real version    *");
print("*  2022-01-04 Version 4.03 (Compatible with build 41)      *");
print("*  Mods have been added to the game system.                *");
print("*                                                          *");
print("************************************************************");

-- Add items processing

require"ProceduralDistributions"
require"VehicleDistributions"
require"SuburbsDistributions"

-- Procedural Lists

--USMRE.MREbox
--USMRE.MREmenu01
--USMRE.MREmenu02
--USMRE.MREmenu03
--USMRE.MREmenu04
--USMRE.MREmenu05
--USMRE.MREmenu06
--USMRE.MREmenu07
--USMRE.MREmenu08
--USMRE.MREmenu09
--USMRE.MREmenu10
--USMRE.MREmenu11
--USMRE.MREmenu12

-- ProceduralDistributions

--Army

table.insert(ProceduralDistributions.list["ArmySurplusBackpacks"].items, "USMRE.MREmenu01");
table.insert(ProceduralDistributions.list["ArmySurplusBackpacks"].items, 1);
table.insert(ProceduralDistributions.list["ArmySurplusBackpacks"].items, "USMRE.MREmenu02");
table.insert(ProceduralDistributions.list["ArmySurplusBackpacks"].items, 1);
table.insert(ProceduralDistributions.list["ArmySurplusBackpacks"].items, "USMRE.MREmenu03");
table.insert(ProceduralDistributions.list["ArmySurplusBackpacks"].items, 1);
table.insert(ProceduralDistributions.list["ArmySurplusBackpacks"].items, "USMRE.MREmenu04");
table.insert(ProceduralDistributions.list["ArmySurplusBackpacks"].items, 1);
table.insert(ProceduralDistributions.list["ArmySurplusBackpacks"].items, "USMRE.MREmenu05");
table.insert(ProceduralDistributions.list["ArmySurplusBackpacks"].items, 1);
table.insert(ProceduralDistributions.list["ArmySurplusBackpacks"].items, "USMRE.MREmenu06");
table.insert(ProceduralDistributions.list["ArmySurplusBackpacks"].items, 1);
table.insert(ProceduralDistributions.list["ArmySurplusBackpacks"].items, "USMRE.MREmenu07");
table.insert(ProceduralDistributions.list["ArmySurplusBackpacks"].items, 1);
table.insert(ProceduralDistributions.list["ArmySurplusBackpacks"].items, "USMRE.MREmenu08");
table.insert(ProceduralDistributions.list["ArmySurplusBackpacks"].items, 1);
table.insert(ProceduralDistributions.list["ArmySurplusBackpacks"].items, "USMRE.MREmenu09");
table.insert(ProceduralDistributions.list["ArmySurplusBackpacks"].items, 1);
table.insert(ProceduralDistributions.list["ArmySurplusBackpacks"].items, "USMRE.MREmenu10");
table.insert(ProceduralDistributions.list["ArmySurplusBackpacks"].items, 1);
table.insert(ProceduralDistributions.list["ArmySurplusBackpacks"].items, "USMRE.MREmenu11");
table.insert(ProceduralDistributions.list["ArmySurplusBackpacks"].items, 1);
table.insert(ProceduralDistributions.list["ArmySurplusBackpacks"].items, "USMRE.MREmenu12");
table.insert(ProceduralDistributions.list["ArmySurplusBackpacks"].items, 1);

table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items, "USMRE.MREbox");
table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items, 3);
table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items, "USMRE.MREmenu01");
table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items, 1);
table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items, "USMRE.MREmenu02");
table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items, 1);
table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items, "USMRE.MREmenu03");
table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items, 1);
table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items, "USMRE.MREmenu04");
table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items, 1);
table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items, "USMRE.MREmenu05");
table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items, 1);
table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items, "USMRE.MREmenu06");
table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items, 1);
table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items, "USMRE.MREmenu07");
table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items, 1);
table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items, "USMRE.MREmenu08");
table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items, 1);
table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items, "USMRE.MREmenu09");
table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items, 1);
table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items, "USMRE.MREmenu10");
table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items, 1);
table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items, "USMRE.MREmenu11");
table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items, 1);
table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items, "USMRE.MREmenu12");
table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items, 1);

table.insert(ProceduralDistributions.list["ArmyStorageOutfit"].items, "USMRE.MREbox");
table.insert(ProceduralDistributions.list["ArmyStorageOutfit"].items, 5);
table.insert(ProceduralDistributions.list["ArmyStorageOutfit"].items, "USMRE.MREmenu01");
table.insert(ProceduralDistributions.list["ArmyStorageOutfit"].items, 1);
table.insert(ProceduralDistributions.list["ArmyStorageOutfit"].items, "USMRE.MREmenu02");
table.insert(ProceduralDistributions.list["ArmyStorageOutfit"].items, 1);
table.insert(ProceduralDistributions.list["ArmyStorageOutfit"].items, "USMRE.MREmenu03");
table.insert(ProceduralDistributions.list["ArmyStorageOutfit"].items, 1);
table.insert(ProceduralDistributions.list["ArmyStorageOutfit"].items, "USMRE.MREmenu04");
table.insert(ProceduralDistributions.list["ArmyStorageOutfit"].items, 1);
table.insert(ProceduralDistributions.list["ArmyStorageOutfit"].items, "USMRE.MREmenu05");
table.insert(ProceduralDistributions.list["ArmyStorageOutfit"].items, 1);
table.insert(ProceduralDistributions.list["ArmyStorageOutfit"].items, "USMRE.MREmenu06");
table.insert(ProceduralDistributions.list["ArmyStorageOutfit"].items, 1);
table.insert(ProceduralDistributions.list["ArmyStorageOutfit"].items, "USMRE.MREmenu07");
table.insert(ProceduralDistributions.list["ArmyStorageOutfit"].items, 1);
table.insert(ProceduralDistributions.list["ArmyStorageOutfit"].items, "USMRE.MREmenu08");
table.insert(ProceduralDistributions.list["ArmyStorageOutfit"].items, 1);
table.insert(ProceduralDistributions.list["ArmyStorageOutfit"].items, "USMRE.MREmenu09");
table.insert(ProceduralDistributions.list["ArmyStorageOutfit"].items, 1);
table.insert(ProceduralDistributions.list["ArmyStorageOutfit"].items, "USMRE.MREmenu10");
table.insert(ProceduralDistributions.list["ArmyStorageOutfit"].items, 1);
table.insert(ProceduralDistributions.list["ArmyStorageOutfit"].items, "USMRE.MREmenu11");
table.insert(ProceduralDistributions.list["ArmyStorageOutfit"].items, 1);
table.insert(ProceduralDistributions.list["ArmyStorageOutfit"].items, "USMRE.MREmenu12");
table.insert(ProceduralDistributions.list["ArmyStorageOutfit"].items, 1);

-- Police

table.insert(ProceduralDistributions.list["PoliceLockers"].items, "USMRE.MREmenu01");
table.insert(ProceduralDistributions.list["PoliceLockers"].items, 0.5);
table.insert(ProceduralDistributions.list["PoliceLockers"].items, "USMRE.MREmenu02");
table.insert(ProceduralDistributions.list["PoliceLockers"].items, 0.5);
table.insert(ProceduralDistributions.list["PoliceLockers"].items, "USMRE.MREmenu03");
table.insert(ProceduralDistributions.list["PoliceLockers"].items, 0.5);
table.insert(ProceduralDistributions.list["PoliceLockers"].items, "USMRE.MREmenu04");
table.insert(ProceduralDistributions.list["PoliceLockers"].items, 0.5);
table.insert(ProceduralDistributions.list["PoliceLockers"].items, "USMRE.MREmenu05");
table.insert(ProceduralDistributions.list["PoliceLockers"].items, 0.5);
table.insert(ProceduralDistributions.list["PoliceLockers"].items, "USMRE.MREmenu06");
table.insert(ProceduralDistributions.list["PoliceLockers"].items, 0.5);
table.insert(ProceduralDistributions.list["PoliceLockers"].items, "USMRE.MREmenu07");
table.insert(ProceduralDistributions.list["PoliceLockers"].items, 0.5);
table.insert(ProceduralDistributions.list["PoliceLockers"].items, "USMRE.MREmenu08");
table.insert(ProceduralDistributions.list["PoliceLockers"].items, 0.5);
table.insert(ProceduralDistributions.list["PoliceLockers"].items, "USMRE.MREmenu09");
table.insert(ProceduralDistributions.list["PoliceLockers"].items, 0.5);
table.insert(ProceduralDistributions.list["PoliceLockers"].items, "USMRE.MREmenu10");
table.insert(ProceduralDistributions.list["PoliceLockers"].items, 0.5);
table.insert(ProceduralDistributions.list["PoliceLockers"].items, "USMRE.MREmenu11");
table.insert(ProceduralDistributions.list["PoliceLockers"].items, 0.5);
table.insert(ProceduralDistributions.list["PoliceLockers"].items, "USMRE.MREmenu12");
table.insert(ProceduralDistributions.list["PoliceLockers"].items, 0.5);

-- Gun Store

table.insert(ProceduralDistributions.list["GunStoreShelf"].items, "USMRE.MREbox");
table.insert(ProceduralDistributions.list["GunStoreShelf"].items, 5);

table.insert(ProceduralDistributions.list["GunStoreAmmunition"].items, "USMRE.MREbox");
table.insert(ProceduralDistributions.list["GunStoreAmmunition"].items, 3);

-- Kitchen

table.insert(ProceduralDistributions.list["KitchenRandom"].items, "USMRE.MREbox");
table.insert(ProceduralDistributions.list["KitchenRandom"].items, 0.001);
table.insert(ProceduralDistributions.list["KitchenRandom"].items, "USMRE.MREmenu01");
table.insert(ProceduralDistributions.list["KitchenRandom"].items, 0.001);
table.insert(ProceduralDistributions.list["KitchenRandom"].items, "USMRE.MREmenu02");
table.insert(ProceduralDistributions.list["KitchenRandom"].items, 0.001);
table.insert(ProceduralDistributions.list["KitchenRandom"].items, "USMRE.MREmenu03");
table.insert(ProceduralDistributions.list["KitchenRandom"].items, 0.001);
table.insert(ProceduralDistributions.list["KitchenRandom"].items, "USMRE.MREmenu04");
table.insert(ProceduralDistributions.list["KitchenRandom"].items, 0.001);
table.insert(ProceduralDistributions.list["KitchenRandom"].items, "USMRE.MREmenu05");
table.insert(ProceduralDistributions.list["KitchenRandom"].items, 0.001);
table.insert(ProceduralDistributions.list["KitchenRandom"].items, "USMRE.MREmenu06");
table.insert(ProceduralDistributions.list["KitchenRandom"].items, 0.001);
table.insert(ProceduralDistributions.list["KitchenRandom"].items, "USMRE.MREmenu07");
table.insert(ProceduralDistributions.list["KitchenRandom"].items, 0.001);
table.insert(ProceduralDistributions.list["KitchenRandom"].items, "USMRE.MREmenu08");
table.insert(ProceduralDistributions.list["KitchenRandom"].items, 0.001);
table.insert(ProceduralDistributions.list["KitchenRandom"].items, "USMRE.MREmenu09");
table.insert(ProceduralDistributions.list["KitchenRandom"].items, 0.001);
table.insert(ProceduralDistributions.list["KitchenRandom"].items, "USMRE.MREmenu10");
table.insert(ProceduralDistributions.list["KitchenRandom"].items, 0.001);
table.insert(ProceduralDistributions.list["KitchenRandom"].items, "USMRE.MREmenu11");
table.insert(ProceduralDistributions.list["KitchenRandom"].items, 0.001);
table.insert(ProceduralDistributions.list["KitchenRandom"].items, "USMRE.MREmenu12");
table.insert(ProceduralDistributions.list["KitchenRandom"].items, 0.001);

-- VehicleDistributions

-- Police Vehicle

table.insert(VehicleDistributions.Police["TruckBed"].items, "USMRE.MREbox");
table.insert(VehicleDistributions.Police["TruckBed"].items, 0.5);
table.insert(VehicleDistributions.Police["TruckBed"].items, "USMRE.MREmenu01");
table.insert(VehicleDistributions.Police["TruckBed"].items, 0.5);
table.insert(VehicleDistributions.Police["TruckBed"].items, "USMRE.MREmenu02");
table.insert(VehicleDistributions.Police["TruckBed"].items, 0.5);
table.insert(VehicleDistributions.Police["TruckBed"].items, "USMRE.MREmenu03");
table.insert(VehicleDistributions.Police["TruckBed"].items, 0.5);
table.insert(VehicleDistributions.Police["TruckBed"].items, "USMRE.MREmenu04");
table.insert(VehicleDistributions.Police["TruckBed"].items, 0.5);
table.insert(VehicleDistributions.Police["TruckBed"].items, "USMRE.MREmenu05");
table.insert(VehicleDistributions.Police["TruckBed"].items, 0.5);
table.insert(VehicleDistributions.Police["TruckBed"].items, "USMRE.MREmenu06");
table.insert(VehicleDistributions.Police["TruckBed"].items, 0.5);
table.insert(VehicleDistributions.Police["TruckBed"].items, "USMRE.MREmenu07");
table.insert(VehicleDistributions.Police["TruckBed"].items, 0.5);
table.insert(VehicleDistributions.Police["TruckBed"].items, "USMRE.MREmenu08");
table.insert(VehicleDistributions.Police["TruckBed"].items, 0.5);
table.insert(VehicleDistributions.Police["TruckBed"].items, "USMRE.MREmenu09");
table.insert(VehicleDistributions.Police["TruckBed"].items, 0.5);
table.insert(VehicleDistributions.Police["TruckBed"].items, "USMRE.MREmenu10");
table.insert(VehicleDistributions.Police["TruckBed"].items, 0.5);
table.insert(VehicleDistributions.Police["TruckBed"].items, "USMRE.MREmenu11");
table.insert(VehicleDistributions.Police["TruckBed"].items, 0.5);
table.insert(VehicleDistributions.Police["TruckBed"].items, "USMRE.MREmenu12");
table.insert(VehicleDistributions.Police["TruckBed"].items, 0.5);

--SuburbsDistributions

--Survivor

table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, "USMRE.MREmenu01");
table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, 1);
table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, "USMRE.MREmenu02");
table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, 1);
table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, "USMRE.MREmenu03");
table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, 1);
table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, "USMRE.MREmenu04");
table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, 1);
table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, "USMRE.MREmenu05");
table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, 1);
table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, "USMRE.MREmenu06");
table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, 1);
table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, "USMRE.MREmenu07");
table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, 1);
table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, "USMRE.MREmenu08");
table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, 1);
table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, "USMRE.MREmenu09");
table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, 1);
table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, "USMRE.MREmenu10");
table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, 1.0);
table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, "USMRE.MREmenu11");
table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, 1.0);
table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, "USMRE.MREmenu12");
table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, 1.0);

table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, "USMRE.MREbox");
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, 1);
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, "USMRE.MREmenu01");
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, 1);
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, "USMRE.MREmenu02");
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, 1);
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, "USMRE.MREmenu03");
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, 1);
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, "USMRE.MREmenu04");
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, 1);
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, "USMRE.MREmenu05");
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, 1);
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, "USMRE.MREmenu06");
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, 1);
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, "USMRE.MREmenu07");
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, 1);
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, "USMRE.MREmenu08");
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, 1);
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, "USMRE.MREmenu09");
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, 1);
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, "USMRE.MREmenu10");
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, 1);
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, "USMRE.MREmenu11");
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, 1);
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, "USMRE.MREmenu12");
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, 1);

table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, "USMRE.MREbox");
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, 1);
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, "USMRE.MREmenu01");
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, 1);
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, "USMRE.MREmenu02");
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, 1);
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, "USMRE.MREmenu03");
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, 1);
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, "USMRE.MREmenu04");
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, 1);
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, "USMRE.MREmenu05");
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, 1);
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, "USMRE.MREmenu06");
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, 1);
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, "USMRE.MREmenu07");
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, 1);
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, "USMRE.MREmenu08");
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, 1);
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, "USMRE.MREmenu09");
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, 1);
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, "USMRE.MREmenu10");
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, 1);
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, "USMRE.MREmenu11");
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, 1);
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, "USMRE.MREmenu12");
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, 1);
