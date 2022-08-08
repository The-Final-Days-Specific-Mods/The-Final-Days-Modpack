require 'Definitions/HairOutfitDefinitions'

-- forbid some haircut for later in the apocalypse
-- also make some available only for certain outfit

local cat = {};
cat.name = "Guile";
cat.onlyFor = "test";
table.insert(HairOutfitDefinitions.haircutDefinition, cat);

local cat = {};
cat.name = "PowerParted";
cat.onlyFor = "test";
table.insert(HairOutfitDefinitions.haircutDefinition, cat);