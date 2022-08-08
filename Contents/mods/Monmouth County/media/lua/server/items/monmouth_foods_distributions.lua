require "Items/ProceduralDistributions"

-- ty for junkfoods for base script <3

local i, j, d

local distTable = {
  "KitchenDryFood", 2,
  "KitchenRandom",1,
}

local distTable2 = { 
  "KitchenRandom",1,
}

local distGenericTable = {
  "ShelfGeneric",2, 
  "GigamartDryGoods",8,  
}



for i = 1, #distTable, 2 do 
  table.insert(ProceduralDistributions.list[distTable[i]].items, "MonmouthFoods.ZombieBombs")
  table.insert(ProceduralDistributions.list[distTable[i]].items, distTable[i+1])
end
