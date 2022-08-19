local function preDistributionMerge()
    ProceduralDistributions.list.vaultgoldstack = {
        rolls = 50,
        items = {
            "trelaigoldbar", 5,
            "trelaigoldbar", 5,
            "trelaigoldbar", 5,
            "trelaigoldbar", 5,
            "trelaigoldbar", 5,
            "trelaigoldbar", 5,
            "trelaigoldbar", 5,
        },
    }
end
Events.OnPreDistributionMerge.Add(preDistributionMerge);