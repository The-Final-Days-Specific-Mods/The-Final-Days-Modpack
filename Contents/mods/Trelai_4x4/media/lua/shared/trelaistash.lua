require "StashDescriptions/StashUtil";
-- guns
local stashMap1 = StashUtil.newStash("TrelaiStashMap1", "Map", "Base.trelaimap", "Stash_AnnotedMap");
stashMap1.spawnOnlyOnZed = true;
stashMap1.daysToSpawn = "10";
stashMap1.zombies = 5
stashMap1.traps = "5";
stashMap1.barricades = 50;
stashMap1.buildingX = 7139;
stashMap1.buildingY = 7045;
stashMap1.spawnTable = "GunCache2";
stashMap1:addContainer("GunBox","floors_interior_tilesandwood_01_62",nil,"bedroom",nil,nil,nil);
stashMap1:addStamp("media/ui/LootableMaps/map_x.png",nil,343,281,0,0,0);
stashMap1:addStamp("media/ui/LootableMaps/BedfordText1.png",nil,366,278,0,0,0);
stashMap1:addStamp("media/ui/LootableMaps/map_x.png",nil,705,474,0,0,0);
stashMap1:addStamp("media/ui/LootableMaps/BedfordText2.png",nil,650,496,0,0,0);
stashMap1:addStamp("media/ui/LootableMaps/map_arrowwest.png",nil,552,282,1,0,0);
stashMap1:addStamp("media/ui/LootableMaps/BedfordText3.png",nil,575,279,1,0,0);

 

local stashMap1 = StashUtil.newStash("TrelaiStashMap2", "Map", "Base.trelaimap", "Stash_AnnotedMap");
stashMap1.daysToSpawn = "0";
stashMap1.buildingX = 7117;
stashMap1.buildingY = 6780;
stashMap1.zombies = 2;
stashMap1.barricades = 50;
stashMap1.spawnTable = "GunCache2";
stashMap1:addContainer("GunBox","floors_interior_tilesandwood_01_62",nil,"bedroom",nil,nil,nil);
stashMap1:addContainer("GunBox","carpentry_01_16",nil,nil,nil,nil,nil);
stashMap1:addStamp("media/ui/LootableMaps/map_x.png",nil,343,281,0,0,0);
stashMap1:addStamp("media/ui/LootableMaps/map_x.png",nil,705,474,0,0,0);
stashMap1:addStamp("media/ui/LootableMaps/map_x.png",nil,552,282,1,0,0);

 

-- shotgun
local stashMap1 = StashUtil.newStash("TrelaiStashMap3", "Map", "Base.trelaimap", "Stash_AnnotedMap");
stashMap1.daysToSpawn = "0";
stashMap1.buildingX = 7688;
stashMap1.buildingY = 7618;
stashMap1.zombies = 2;
stashMap1.barricades = 50;
stashMap1.spawnTable = "ShotgunCache2";
stashMap1:addStamp("media/ui/LootableMaps/map_target.png",nil,480,374,0,0,0);
stashMap1:addStamp("media/ui/LootableMaps/map_x.png",nil,620,507,0,0,0);
stashMap1:addStamp("media/ui/LootableMaps/map_question.png",nil,973,335,1,0,0);

 

local stashMap1 = StashUtil.newStash("TrelaiStashMap4", "Map", "Base.trelaimap", "Stash_AnnotedMap");
stashMap1.daysToSpawn = "0";
stashMap1.buildingX = 6781;
stashMap1.buildingY = 6810;
stashMap1.zombies = 2;
stashMap1.barricades = 50;
stashMap1.spawnTable = "ShotgunCache2";
stashMap1:addContainer("ShotgunBox",nil,"Base.Bag_DuffelBag",nil,nil,nil,nil);
stashMap1:addContainer("ShotgunBox","carpentry_01_16",nil,nil,nil,nil,nil);
stashMap1:addStamp("media/ui/LootableMaps/map_target.png",nil,480,374,0,0,0);
stashMap1:addStamp("media/ui/LootableMaps/map_target.png",nil,620,507,0,0,0);
stashMap1:addStamp("media/ui/LootableMaps/map_target.png",nil,973,335,1,0,0);

 

-- tools
local stashMap1 = StashUtil.newStash("TrelaiStashMap5", "Map", "Base.trelaimap", "Stash_AnnotedMap");
stashMap1.daysToSpawn = "0";
stashMap1.buildingX = 6811;
stashMap1.buildingY = 6670;
stashMap1.zombies = 2;
stashMap1.barricades = 50;
stashMap1.spawnTable = "ToolsCache1";
stashMap1:addStamp("media/ui/LootableMaps/map_o.png",nil,472,466,0,0,0);
stashMap1:addStamp("media/ui/LootableMaps/map_exclamation.png",nil,750,425,0,0,0);

 

local stashMap1 = StashUtil.newStash("TrelaiStashMap6", "Map", "Base.trelaimap", "Stash_AnnotedMap");
stashMap1.daysToSpawn = "0";
stashMap1.buildingX = 7294;
stashMap1.buildingY = 6827;
stashMap1.zombies = 2;
stashMap1.barricades = 50;
stashMap1.spawnTable = "ToolsCache1";
stashMap1:addContainer("ToolsBox",nil,"Base.Bag_DuffelBag",nil,nil,nil,nil);
stashMap1:addContainer("ToolsBox","carpentry_01_16",nil,nil,nil,nil,nil);
stashMap1:addStamp("media/ui/LootableMaps/map_exclamation.png",nil,472,466,0,0,0);
stashMap1:addStamp("media/ui/LootableMaps/map_exclamation.png",nil,750,425,0,0,0);

 

-- survivor houses
local stashMap1 = StashUtil.newStash("TrelaiStashMap7", "Map", "Base.trelaimap", "Stash_AnnotedMap");
stashMap1.daysToSpawn = "0";
stashMap1.buildingX = 7294;
stashMap1.buildingY = 6827;
stashMap1.zombies = 2;
stashMap1.barricades = 50;
stashMap1.spawnTable = "SurvivorCache1";
stashMap1:addContainer("GunBox","carpentry_01_16",nil,nil,nil,nil,nil);
stashMap1:addContainer("ShotgunBox",nil,"Base.Bag_DuffelBag",nil,nil,nil,nil);
stashMap1:addStamp("media/ui/LootableMaps/map_house.png",nil,348,518,0,0,0);
stashMap1:addStamp("media/ui/LootableMaps/map_arrowsouth.png",nil,318,459,0,0,0);

 

local stashMap1 = StashUtil.newStash("TrelaiStashMap8", "Map", "Base.trelaimap", "Stash_AnnotedMap");
stashMap1.daysToSpawn = "0";
stashMap1.buildingX = 7656;
stashMap1.buildingY = 7604;
stashMap1.zombies = 5;
stashMap1.barricades = 50;
stashMap1.spawnTable = "SurvivorCache1";
stashMap1:addContainer("ToolsBox",nil,"Base.Bag_DuffelBag",nil,nil,nil,nil);
stashMap1:addContainer("ToolsBox","carpentry_01_16",nil,nil,nil,nil,nil);
stashMap1:addContainer("GunBox","carpentry_01_16",nil,nil,nil,nil,nil);
stashMap1:addContainer("ShotgunBox",nil,"Base.Bag_DuffelBag",nil,nil,nil,nil);
stashMap1:addStamp("media/ui/LootableMaps/map_house.png",nil,348,518,0,0,0);
stashMap1:addStamp("media/ui/LootableMaps/map_house.png",nil,318,459,0,0,0);