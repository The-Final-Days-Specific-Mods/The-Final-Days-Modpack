require("recipecode");

function Recipe.OnGiveXP.Tailoring5(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Tailoring, 5);
end

function Recipe.OnGiveXP.Tailoring10(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Tailoring, 10);
end

function Recipe.OnGiveXP.Tailoring20(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Tailoring, 20);
end

function Recipe.OnGiveXP.Mechanics5(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Mechanics, 5);
end

function Recipe.OnGiveXP.Mechanics10(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Mechanics, 10);
end

function Recipe.OnGiveXP.Mechanics20(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Mechanics, 20);
end


function Recipe.OnCreate.SalvageModuleReturnsSmall(items, result, player)

    local success = 50 + (player:getPerkLevel(Perks.Mechanics) + (player:getPerkLevel(Perks.MetalWelding)*2));
    local inventory = player:getInventory()

    for i=1,ZombRand(1,3) do
        local r = ZombRand(1,4);
        if r==1 and ZombRand(1,100)<success then
            inventory:AddItem("Base.Screws");
        elseif r==2 and ZombRand(1,100)<success then
            inventory:AddItem("Base.SmallSheetMetal");
        elseif r==3 and ZombRand(1,100)<success then
            inventory:AddItem("Base.ScrapMetal");
        elseif r==4 and ZombRand(1,100)<success then
            inventory:AddItem("Base.SmallSheetMetal");
        end
    end

end

function Recipe.OnCreate.SalvageModuleReturnsFabrics(items, result, player)

    local success = 50 + (player:getPerkLevel(Perks.Mechanics) + (player:getPerkLevel(Perks.Tailoring)*2));
    local inventory = player:getInventory()

    for i=1,ZombRand(1,3) do
        local r = ZombRand(1,5);
        if r==1 and ZombRand(1,100)<success then
            inventory:AddItem("Base.RippedSheetsDirty");
        elseif r==2 and ZombRand(1,100)<success then
            inventory:AddItem("Base.RippedSheetsDirty");
        elseif r==3 and ZombRand(1,100)<success then
            inventory:AddItem("Base.DenimStripsDirty");
        elseif r==4 and ZombRand(1,100)<success then
            inventory:AddItem("Base.LeatherStripsDirty");
        elseif r==5 and ZombRand(1,100)<success then
            inventory:AddItem("Base.Thread");
        end
    end

end

function Recipe.OnCreate.SalvageModuleReturnsSmallElectrics(items, result, player)

    local success = 50 + (player:getPerkLevel(Perks.Mechanics)*5);
    local inventory = player:getInventory()

    for i=1,ZombRand(1,3) do
        local r = ZombRand(1,4);
        if r==1 and ZombRand(1,100)<success then
            inventory:AddItem("Base.SmallSheetMetal");
        elseif r==2 and ZombRand(1,100)<success then
            inventory:AddItem("Base.ScrapMetal");
        elseif r==3 and ZombRand(1,100)<success then
            inventory:AddItem("Base.ElectronicsScrap");
        elseif r==4 and ZombRand(1,100)<success then
            inventory:AddItem("Base.Wire");
        end
    end

end

function Recipe.OnCreate.SalvageModuleReturnsLargeMetals(items, result, player)

    local success = 50 + (player:getPerkLevel(Perks.Mechanics) + (player:getPerkLevel(Perks.MetalWelding)*2));
    local inventory = player:getInventory()

    for i=1,ZombRand(1,3) do
        local r = ZombRand(1,7);
        if r==1 and ZombRand(1,100)<success then
            inventory:AddItem("Base.SheetMetal");
        elseif r==2 and ZombRand(1,100)<success then
            inventory:AddItem("Base.SmallSheetMetal");
        elseif r==3 and ZombRand(1,100)<success then
            inventory:AddItem("Base.ElectronicsScrap");
        elseif r==4 and ZombRand(1,100)<success then
            inventory:AddItem("Base.Screws");
        elseif r==5 and ZombRand(1,100)<success then
            inventory:AddItem("Base.SheetMetal");
        elseif r==6 and ZombRand(1,100)<success then
            inventory:AddItem("Base.SmallSheetMetal");
        elseif r==7 and ZombRand(1,100)<success then
            inventory:AddItem("Base.SheetMetal");
        end
    end

end

function Recipe.OnCreate.SalvageModuleReturnsArmourLargeMetals(items, result, player)

    local success = 50 + (player:getPerkLevel(Perks.Mechanics) + (player:getPerkLevel(Perks.MetalWelding)*2));
    local inventory = player:getInventory()

    for i=1,ZombRand(1,3) do
        local r = ZombRand(1,4);
        if r==1 and ZombRand(1,100)<success then
            inventory:AddItem("Base.SheetMetal");
        elseif r==2 and ZombRand(1,100)<success then
            inventory:AddItem("Base.SmallSheetMetal");
        elseif r==3 and ZombRand(1,100)<success then
            inventory:AddItem("Base.ScrapMetal");
        elseif r==4 and ZombRand(1,100)<success then
            inventory:AddItem("Base.SheetMetal");
        end
    end

end

function Recipe.OnCreate.SalvageModuleReturnsSuspension(items, result, player)

    local success = 50 + (player:getPerkLevel(Perks.Mechanics) + (player:getPerkLevel(Perks.MetalWelding)*2));
    local inventory = player:getInventory()

    for i=1,ZombRand(1,3) do
        local r = ZombRand(1,6);
        if r==1 and ZombRand(1,100)<success then
            inventory:AddItem("Base.MetalBar");
        elseif r==2 and ZombRand(1,100)<success then
            inventory:AddItem("Base.SmallSheetMetal");
        elseif r==3 and ZombRand(1,100)<success then
            inventory:AddItem("Base.ScrapMetal");
        elseif r==4 and ZombRand(1,100)<success then
            inventory:AddItem("Base.ScrapMetal");
        elseif r==5 and ZombRand(1,100)<success then
            inventory:AddItem("Base.ScrapMetal");
        elseif r==6 and ZombRand(1,100)<success then
            inventory:AddItem("Base.Screws");
            end
    end

end

function Recipe.OnCreate.SalvageModuleReturnsTires(items, result, player)

    local success = 50 + (player:getPerkLevel(Perks.Mechanics) + (player:getPerkLevel(Perks.MetalWelding)*2));
    local inventory = player:getInventory()

    for i=1,ZombRand(1,3) do
        local r = ZombRand(1,5);
        if r==1 and ZombRand(1,100)<success then
            inventory:AddItem("Base.ScrapMetal");
        elseif r==2 and ZombRand(1,100)<success then
            inventory:AddItem("Base.ScrapMetal");
        elseif r==3 and ZombRand(1,100)<success then
            inventory:AddItem("Base.LeatherStripsDirty");
        elseif r==4 and ZombRand(1,100)<success then
            inventory:AddItem("Base.LeatherStripsDirty");
        elseif r==5 and ZombRand(1,100)<success then
            inventory:AddItem("Base.Screws");
        end
    end

end

function Recipe.OnCreate.SalvageModuleReturnsLeathers(items, result, player)

    local success = 50 + (player:getPerkLevel(Perks.Mechanics) + (player:getPerkLevel(Perks.Tailoring)*2));
    local inventory = player:getInventory()

    for i=1,ZombRand(1,3) do
        local r = ZombRand(1,4);
        if r==1 and ZombRand(1,100)<success then
            inventory:AddItem("Base.LeatherStrips");
        elseif r==2 and ZombRand(1,100)<success then
            inventory:AddItem("Base.LeatherStripsDirty");
        elseif r==3 and ZombRand(1,100)<success then
            inventory:AddItem("Base.Thread");
        elseif r==4 and ZombRand(1,100)<success then
            inventory:AddItem("Base.Thread");
        end
    end

end

function Recipe.OnCreate.SalvageModuleReturnsSoftTops(items, result, player)

        local success = 50 + (player:getPerkLevel(Perks.Mechanics) + (player:getPerkLevel(Perks.Tailoring)*2));
        local inventory = player:getInventory()

        for i=1,ZombRand(1,3) do
            local r = ZombRand(1,5);
            if r==1 and ZombRand(1,100)<success then
                inventory:AddItem("Base.LeatherStrips");
            elseif r==2 and ZombRand(1,100)<success then
                inventory:AddItem("Base.LeatherStripsDirty");
            elseif r==3 and ZombRand(1,100)<success then
                inventory:AddItem("Base.Thread");
            elseif r==4 and ZombRand(1,100)<success then
                inventory:AddItem("Base.Tarp");
            elseif r==5 and ZombRand(1,100)<success then
                inventory:AddItem("Base.ScrapMetal");
            end
        end
end