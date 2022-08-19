local trelaidistributionTable = {
--roomdef
    vault = {
--containertype
            gold = {
            procedural = true,
--itemlist
            procList = {
                {name="vaultgoldstack", min=5, max=50, forceForZones="trelaibank"},
                {name="vaultgoldstack", min=2, max=50, forceForZones="trelaibank"},
				{name="vaultgoldstack", min=1, max=50},
                {name="vaultgoldstack", min=1, max=10},
                {name="vaultgoldstack", min=3, max=10},
                    }
            },
    },
    all = {
            gold = {
            procedural = true,
            procList = {
                {name="vaultgoldstack", min=1, max=5},
                {name="vaultgoldstack", min=2, max=5},
                {name="vaultgoldstack", min=2, max=5},
				}
            },
    }
}

 table.insert(Distributions, 2, trelaidistributionTable);