require 'Items/SuburbsDistributions'
require "Items/ProceduralDistributions"
require "Vehicles/VehicleDistributions"

table.insert(ProceduralDistributions.list["GigamartDryGoods"].items, "pancit.OriginalPack");
table.insert(ProceduralDistributions.list["GigamartDryGoods"].items, 3);
table.insert(ProceduralDistributions.list["GigamartDryGoods"].items, "pancit.SpicyPack");
table.insert(ProceduralDistributions.list["GigamartDryGoods"].items, 2);
table.insert(ProceduralDistributions.list["GigamartDryGoods"].items, "pancit.CalamansiPack");
table.insert(ProceduralDistributions.list["GigamartDryGoods"].items, 4);
table.insert(ProceduralDistributions.list["GigamartDryGoods"].items, "pancit.ChilimansiPack");
table.insert(ProceduralDistributions.list["GigamartDryGoods"].items, 3);
table.insert(ProceduralDistributions.list["GigamartDryGoods"].items, "pancit.SweetSpicyPack");
table.insert(ProceduralDistributions.list["GigamartDryGoods"].items, 4);

table.insert(ProceduralDistributions.list["KitchenDryFood"].items, "pancit.OriginalPack");
table.insert(ProceduralDistributions.list["KitchenDryFood"].items, 3);
table.insert(ProceduralDistributions.list["KitchenDryFood"].items, "pancit.SpicyPack");
table.insert(ProceduralDistributions.list["KitchenDryFood"].items, 2);
table.insert(ProceduralDistributions.list["KitchenDryFood"].items, "pancit.CalamansiPack");
table.insert(ProceduralDistributions.list["KitchenDryFood"].items, 4);
table.insert(ProceduralDistributions.list["KitchenDryFood"].items, "pancit.ChilimansiPack");
table.insert(ProceduralDistributions.list["KitchenDryFood"].items, 3);
table.insert(ProceduralDistributions.list["KitchenDryFood"].items, "pancit.SweetSpicyPack");
table.insert(ProceduralDistributions.list["KitchenDryFood"].items, 4);

-- hehe spicy noodles in glovebox
table.insert(VehicleDistributions["GloveBox"].items, "pancit.SpicyPack")
table.insert(VehicleDistributions["GloveBox"].items, 0.5)