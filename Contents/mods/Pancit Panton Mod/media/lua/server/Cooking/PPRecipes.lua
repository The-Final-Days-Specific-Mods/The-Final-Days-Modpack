function PP_Make4Bowls(items, result, player)
    for i=0,items:size() - 1 do
        if items:get(i):getType() == "PancitPot" then

            result:setBaseHunger(items:get(i):getBaseHunger() / 4);
            result:setHungChange(items:get(i):getBaseHunger() / 4);

            result:setThirstChange(items:get(i):getThirstChange() / 4);
            result:setBoredomChange(items:get(i):getBoredomChange() / 4);
            result:setUnhappyChange(items:get(i):getUnhappyChange() / 4);

            result:setCarbohydrates(items:get(i):getCarbohydrates() / 4);
            result:setLipids(items:get(i):getLipids() / 4);
            result:setProteins(items:get(i):getProteins() / 4);
            result:setCalories(items:get(i):getCalories() / 4);

            result:setTaintedWater(items:get(i):isTaintedWater())

        end

        if items:get(i):getType() == "PancitPot" then
            player:getInventory():AddItem("Base.Pot");
        elseif items:get(i):getType() == "PancitPan" then
            player:getInventory():AddItem("Base.Saucepan");
        end

    end
    
end

function PP_Make2Bowls(items, result, player)
    for i=0,items:size() - 1 do
        if items:get(i):getType() == "PancitPot" then

            result:setBaseHunger(items:get(i):getBaseHunger() / 2);
            result:setHungChange(items:get(i):getBaseHunger() / 2);

            result:setThirstChange(items:get(i):getThirstChange() / 2);
            result:setBoredomChange(items:get(i):getBoredomChange() / 2);
            result:setUnhappyChange(items:get(i):getUnhappyChange() / 2);

            result:setCarbohydrates(items:get(i):getCarbohydrates() / 2);
            result:setLipids(items:get(i):getLipids() / 2);
            result:setProteins(items:get(i):getProteins() / 2);
            result:setCalories(items:get(i):getCalories() / 2);

            result:setTaintedWater(items:get(i):isTaintedWater())

            if items:get(i):getType() == "PancitPot" then
                player:getInventory():AddItem("Base.Pot");
            elseif items:get(i):getType() == "PancitPan" then
                player:getInventory():AddItem("Base.Saucepan");
            end

        end
    end
end


function PP_OpenNoodlePack(items, result, player)
    for i=0, items:size() - 1 do
        local a = string.match(items:get(i):getType(), "[^P]*") --! lol jank but ok @FIXTHIS

        if a then --! why test for this? idk for safety from errors lol
            player:getInventory():AddItem("pancit." .. a .. "Flavoring")
        end

    end
end
