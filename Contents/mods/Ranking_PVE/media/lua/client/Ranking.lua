if isServer() then return end

zombierank_clientsucc=nil

RankingWindow = {};
RankingWindow.textureOff = getTexture("media/textures/Icon_Ranking_off.png");
RankingWindow.textureOn = getTexture("media/textures/Icon_Ranking_on.png");

RankingWindow.hideWindow = function(self)

	ISCollapsableWindow.close(self);
	RankingWindow.toolbarButton:setImage(RankingWindow.textureOff);
	
end

RankingWindow.showWindow = function(player)

	if RankingWindow.window then
		RankingWindow.window:setVisible(true);
		RankingWindow.toolbarButton:setImage(RankingWindow.textureOn);
		return;
	end
	
	RankingWindow.scoreboard = ISRichTextPanel:new(getCore():getScreenWidth()-160, getCore():getScreenHeight()-650, 160, 300);
	RankingWindow.scoreboard:initialise();
	RankingWindow.scoreboard.marginTop = 4;
	RankingWindow.scoreboard.marginLeft = 4;
	RankingWindow.scoreboard.marginBottom = 4;
	RankingWindow.scoreboard.marginRight = 4;
	
	RankingWindow.window = RankingWindow.scoreboard:wrapInCollapsableWindow(getText("IGUI_ranktitle"));
	RankingWindow.window.close = RankingWindow.hideWindow;
	RankingWindow.window.closeButton.onmousedown = RankingWindow.hideWindow;
	RankingWindow.window:setResizable(true);
	RankingWindow.window:addToUIManager();
	
	RankingWindow.toolbarButton:setImage(RankingWindow.textureOn);
	
end

RankingWindow.showWindowToolbar = function()
	if RankingWindow.window and RankingWindow.window:getIsVisible() then
		RankingWindow.window:close();
	else
		RankingWindow.showWindow(getPlayer():getPlayerNum(), nil);
	end
end

RankingWindow.addToolbarButton = function()

	if RankingWindow.toolbarButton then return end;
	RankingWindow.toolbarButton = ISButton:new(0, ISEquippedItem.instance.movableBtn:getY() + ISEquippedItem.instance.movableBtn:getHeight() + 300, 50, 50, "", nil, RankingWindow.showWindowToolbar);
	RankingWindow.toolbarButton:setImage(RankingWindow.textureOff);
	RankingWindow.toolbarButton:setDisplayBackground(false);
	RankingWindow.toolbarButton.borderColor = {r=1, g=1, b=1, a=0.1};
	
	ISEquippedItem.instance:addChild(RankingWindow.toolbarButton);
	ISEquippedItem.instance:setHeight(math.max(ISEquippedItem.instance:getHeight(), RankingWindow.toolbarButton:getY() + 400));
	
end


-- function getKeysSortedByValue(tbl, sortFunction)

--   local keys = {}
--   for key in pairs(tbl) do
--     table.insert(keys, key)
--   end
--   table.sort(keys, function(a, b)
--     return sortFunction(tbl[a], tbl[b])
--   end)
--   return keys
  
-- end

-- RankingWindow.updatePlayers = function()

-- 	local pKill = {}
-- 	if (getOnlinePlayers()) then
-- 		for i=0, getOnlinePlayers():size()-1 do
-- 			local player = getOnlinePlayers():get(i);
-- 			pKill[i] = player:getZombieKills();
-- 		end
-- 	else
-- 		local player = getSpecificPlayer(0);
-- 		pKill[0] = player:getZombieKills();
-- 	end
-- 	local pSort = getKeysSortedByValue(pKill, function(a, b) return b < a end)
-- 	return pSort;
	
	
-- end

-- RankingWindow.updatePlayers2 = function()

-- 	local pKill = {}
-- 	if (getOnlinePlayers()) then
-- 		for i=0, getOnlinePlayers():size()-1 do
-- 			local player = getOnlinePlayers():get(i);
-- 			pKill[i] = player:getSurvivorKills();
-- 		end
-- 	else
-- 		local player = getSpecificPlayer(0);
-- 		pKill[0] = player:getSurvivorKills();
-- 	end
-- 	local pSort = getKeysSortedByValue(pKill, function(a, b) return b < a end)
-- 	return pSort;
	
	
-- end






RankingWindow.updateRanking = function()

	-- RankingWindow.window:setVisible(true)

	if RankingWindow.scoreboard  then
		
		local scoreText = getText("IGUI_dingshishuaxin")
		-- print(scoreText)
		-- local players = RankingWindow.updatePlayers();

		if zombierank_clientsucc then
			scoreText = getText("IGUI_jiangshijishapaihangbang").. "\n"
			-- for pos,index in pairs(players) do


				
	
			-- 	if getOnlinePlayers() then
			-- 		local player = getOnlinePlayers():get(index);
			-- 		scoreText = scoreText.."(" .. pos .. ") " .. player:getUsername() .. " - " .. player:getZombieKills() .. " \n ";
			-- 	else 
			-- 		local player = getSpecificPlayer(0);
			-- 		scoreText = scoreText .."(".. pos .. ") " .. player:getDescriptor():getForename() .. " "..  player:getDescriptor():getSurname() .. " - " .. player:getZombieKills() .. " \n ";
			-- 	end
			-- end
			-- print("success!")

			

			for i=1,#zombierank_clientsucc do
				scoreText=scoreText.."(" .. tostring(i) .. ") " .. zombierank_clientsucc[i][1].." - "..tostring(zombierank_clientsucc[i][2]) .." \n "
				-- print(scoreText)
			end
			
		end

		

		-- local playerkill = RankingWindow.updatePlayers2()
		-- scoreText = scoreText .. "\n"
		-- scoreText = scoreText..getText("IGUI_wanjiajishapaihangbang").. "\n"
		-- for pos,index in pairs(playerkill) do
			

		-- 	if getOnlinePlayers() then
		-- 		local player = getOnlinePlayers():get(index);
		-- 		if index == 0 and player:getSurvivorKills() >0 then
		-- 			scoreText = scoreText.."(" .. pos .. ") " .. player:getUsername() .. " - "  ..player:getSurvivorKills() .. getText("IGUI_sharenzuobiao") .. tostring(player:getX())..","..tostring(player:getY()).."  \n ";
		-- 		else
		-- 			scoreText = scoreText.."(" .. pos .. ") " .. player:getUsername() .. " - " ..player:getSurvivorKills() ..  " \n ";
		-- 		end
					

				
		-- 	else 
		-- 		local player = getSpecificPlayer(0);
		-- 		scoreText = scoreText .."(".. pos .. ") " .. player:getDescriptor():getForename() .. " "..  player:getDescriptor():getSurname() .. " - "  .. player:getSurvivorKills() .. " \n ";
		-- 	end
		-- end

		RankingWindow.scoreboard.text = scoreText;
		RankingWindow.scoreboard:paginate();

	end
	
end

local function OnGameStartrank()
	
	RankingWindow.showWindowToolbar()
	RankingWindow.updateRanking()

end



-- Events.OnGameBoot.Add(RankingWindow.updateRanking);
Events.OnCreatePlayer.Add(RankingWindow.addToolbarButton);
-- Events.OnCreatePlayer.Add(RankingWindow.updateRanking);
-- Events.OnPlayerUpdate.Add(RankingWindow.updateRanking);





local function EveryHoursupdatezombie()

    local _player=getPlayer()
    local _a = _player:getUsername()
    local _b = _player:getZombieKills()
    local _c ={_a,_b}
    sendClientCommand("zombiekillrank","true",_c)
end

-- Events.EveryHours.Add(EveryHoursupdatezombie)
Events.OnGameStart.Add(EveryHoursupdatezombie)
Events.EveryTenMinutes.Add(EveryHoursupdatezombie)




local function rankclient(module, command, arguments)


	

	if module=="rank_fromserver"then
        zombierank_clientsucc={}
		zombierank_client=arguments
	

		-- print(zombierank_client)
		for v,k in pairs(zombierank_client) do

			
			-- tablelenth=tablelenth+1
			if #zombierank_clientsucc >0 then
				-- local numbertable = #zombierank_clientsucc
				
				for i=1,#zombierank_clientsucc do
					if k <= zombierank_clientsucc[#zombierank_clientsucc -i+1][2] then
						table.insert(zombierank_clientsucc,#zombierank_clientsucc-i+2,{v,k})
						-- print(zombierank_clientsucc[i+1][1],zombierank_clientsucc[i+1][2])
						break
					end
					if i==#zombierank_clientsucc then
						table.insert(zombierank_clientsucc,1,{v,k})
						
					end
					

					-- print("ranking")
				end
				
			else
				zombierank_clientsucc[1]={v,k}
			end
			-- print(v,k)
		end

		RankingWindow.updateRanking()



	
	
	
	end

	

	
end

Events.OnServerCommand.Add(rankclient)
Events.OnGameStart.Add(OnGameStartrank)

