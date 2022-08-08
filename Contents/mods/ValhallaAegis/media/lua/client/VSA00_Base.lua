-- shortcuts


function Valhalla:onRespawn()
	Valhalla.currentPlayer = getPlayer();
end


-- events


Events.OnGameStart.Add(function()
	Valhalla:onRespawn();
end);


Events.OnCreatePlayer.Add(function()
	Valhalla:onRespawn();
end);