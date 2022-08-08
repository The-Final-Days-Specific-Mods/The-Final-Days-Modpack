function Recipe.OnCreate.zhusheyaojiabcd(items, result, player)
    for i=1,items:size() do
        local item = items:get(i-1):getType()
        if item == "RewardMedic1" then
            player:getXp():AddXP(Perks.Fitness,3000)
        elseif item == "RewardMedic2" then
            player:getXp():AddXP(Perks.Strength,3000)
        elseif item == "RewardMedic3" then

            local skilllevel = PerkFactory.PerkList
            local randrand = ZombRand(skilllevel:size())
            for i = 1,skilllevel:size() do
                local skillindex = skilllevel:get(i-1)
                if i-1 == randrand then
                player:getXp():AddXP(skillindex,3000)
                break
                end
            end
        elseif item == "RewardMedic4" then
            local skilllevel = PerkFactory.PerkList
            for i = 1,skilllevel:size() do
                local skillindex = skilllevel:get(i-1)
                player:getXp():AddXP(skillindex,3000)
            end
        elseif item == "RewardMedic5" then
            player:getBodyDamage():RestoreToFullHealth()
        elseif item == "RewardMedic6" then
            player:setHealth(0)
        end
    end
end





