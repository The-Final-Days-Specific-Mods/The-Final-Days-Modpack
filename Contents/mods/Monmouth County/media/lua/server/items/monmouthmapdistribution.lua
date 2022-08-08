local function preDistributionMerge()
    table.insert(ProceduralDistributions.list.MagazineRackMaps.items, "monmouthcountymap");
    table.insert(ProceduralDistributions.list.MagazineRackMaps.items, 50);
end
Events.OnPreDistributionMerge.Add(preDistributionMerge);