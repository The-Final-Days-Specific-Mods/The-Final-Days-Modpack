local function preDistributionMerge()
    table.insert(ProceduralDistributions.list.MagazineRackMaps.items, "trelaimap");
    table.insert(ProceduralDistributions.list.MagazineRackMaps.items, 50);
	table.insert(ProceduralDistributions.list.vaultgoldstack.items, "TrelaiGoldBar");
    table.insert(ProceduralDistributions.list.vaultgoldstack.items, 50);
end
Events.OnPreDistributionMerge.Add(preDistributionMerge);