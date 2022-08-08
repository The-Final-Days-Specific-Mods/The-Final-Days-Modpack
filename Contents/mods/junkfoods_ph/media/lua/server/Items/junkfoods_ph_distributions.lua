require "Items/ProceduralDistributions"


local i, j, d

local distTable = {
  "ShelfGeneric",2, 
  "GigamartCannedFood",8,
  "GigamartDryGoods",8,  
  "KitchenCannedFood",2,
  "KitchenDryFood", 2,
  "KitchenRandom",1,
  "CrateCannedFood",8, 
}

for i = 1, #distTable, 2 do 
  table.insert(ProceduralDistributions.list[distTable[i]].items, "JunkFoodsPH.ChippyRed")
  table.insert(ProceduralDistributions.list[distTable[i]].items, distTable[i+1])
end

for i = 1, #distTable, 2 do 
  table.insert(ProceduralDistributions.list[distTable[i]].items, "JunkFoodsPH.ChippyBlue")
  table.insert(ProceduralDistributions.list[distTable[i]].items, distTable[i+1])
end

for i = 1, #distTable, 2 do 
  table.insert(ProceduralDistributions.list[distTable[i]].items, "JunkFoodsPH.BoyBawang")
  table.insert(ProceduralDistributions.list[distTable[i]].items, distTable[i+1])
end

for i = 1, #distTable, 2 do 
  table.insert(ProceduralDistributions.list[distTable[i]].items, "JunkFoodsPH.Cracklings")
  table.insert(ProceduralDistributions.list[distTable[i]].items, distTable[i+1])
end

for i = 1, #distTable, 2 do 
  table.insert(ProceduralDistributions.list[distTable[i]].items, "JunkFoodsPH.CrispyPatata")
  table.insert(ProceduralDistributions.list[distTable[i]].items, distTable[i+1])
end

for i = 1, #distTable, 2 do 
  table.insert(ProceduralDistributions.list[distTable[i]].items, "JunkFoodsPH.MartysSpicy")
  table.insert(ProceduralDistributions.list[distTable[i]].items, distTable[i+1])
end

for i = 1, #distTable, 2 do 
  table.insert(ProceduralDistributions.list[distTable[i]].items, "JunkFoodsPH.Moby")
  table.insert(ProceduralDistributions.list[distTable[i]].items, distTable[i+1])
end

for i = 1, #distTable, 2 do 
  table.insert(ProceduralDistributions.list[distTable[i]].items, "JunkFoodsPH.NutriStar")
  table.insert(ProceduralDistributions.list[distTable[i]].items, distTable[i+1])
end

for i = 1, #distTable, 2 do 
  table.insert(ProceduralDistributions.list[distTable[i]].items, "JunkFoodsPH.Oishi")
  table.insert(ProceduralDistributions.list[distTable[i]].items, distTable[i+1])
end

for i = 1, #distTable, 2 do 
  table.insert(ProceduralDistributions.list[distTable[i]].items, "JunkFoodsPH.Richee")
  table.insert(ProceduralDistributions.list[distTable[i]].items, distTable[i+1])
end

for i = 1, #distTable, 2 do 
  table.insert(ProceduralDistributions.list[distTable[i]].items, "JunkFoodsPH.Snacku")
  table.insert(ProceduralDistributions.list[distTable[i]].items, distTable[i+1])
end

for i = 1, #distTable, 2 do 
  table.insert(ProceduralDistributions.list[distTable[i]].items, "JunkFoodsPH.Tomi")
  table.insert(ProceduralDistributions.list[distTable[i]].items, distTable[i+1])
end

for i = 1, #distTable, 2 do 
  table.insert(ProceduralDistributions.list[distTable[i]].items, "JunkFoodsPH.CloverChips")
  table.insert(ProceduralDistributions.list[distTable[i]].items, distTable[i+1])
end

for i = 1, #distTable, 2 do 
  table.insert(ProceduralDistributions.list[distTable[i]].items, "JunkFoodsPH.DingDongFood")
  table.insert(ProceduralDistributions.list[distTable[i]].items, distTable[i+1])
end

for i = 1, #distTable, 2 do 
  table.insert(ProceduralDistributions.list[distTable[i]].items, "JunkFoodsPH.Piattos")
  table.insert(ProceduralDistributions.list[distTable[i]].items, distTable[i+1])
end

for i = 1, #distTable, 2 do 
  table.insert(ProceduralDistributions.list[distTable[i]].items, "JunkFoodsPH.MrChips")
  table.insert(ProceduralDistributions.list[distTable[i]].items, distTable[i+1])
end