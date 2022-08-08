if not getDebug() then return end

zx = zx or {}

function zx.printData(index)
	local lua = SPowerbankSystem.instance:getLuaObjectByIndex(index)
	for i,v in pairs(lua) do
		print(i,"/",v)
	end
	print("Panel Data:")
	for i,v in ipairs(lua.panels) do
		print(v.x,v.y,v.z)
	end
	if lua.conGenerator then print("con Generator is on: ",lua.conGenerator.ison) end
end

function zx.spawnSpriteNearMe(x,y,z,type)
	local player = getPlayer()
	zx.x = math.floor(player:getX())
	zx.y = math.floor(player:getY())
	zx.z = math.floor(player:getZ())
	print("Spawn Test",zx.x+x, zx.y+y, zx.z+z)
	local square = getSquare(zx.x+x, zx.y+y, zx.z+z)
	local sprite = "solarmod_tileset_01_"..type
	if square then ISAWorldSpawns.Place(square,sprite) else print("no square") end
end

zx.testthis = function()
	local player = getPlayer()
	local rooms = getPlayer():getSquare():getRoom():getBuilding():getDef():getRooms()
	for i=1,rooms:size() do
		local squares = rooms:get(i-1):getIsoRoom():getSquares()
		for v=1,squares:size() do
			local square = squares:get(v-1)
			if  IsoUtils.DistanceToSquared(square:getX(),square:getY(),player:getX(),player:getY()) > 5 and ZombRand(3) > 0 then
				IsoFireManager.StartFire(square:getCell(), square, false, 0, 0)
			end
		end
	end
end

zx.testthat = function()
	zx.item = InventoryItemFactory.CreateItem("Base.Plank")
	getPlayer():getSquare():getObjects():add(1,zx.item)
end

function zx.keyDebug(keynum)
	-- print(keynum)
	if keynum == 44 then
		print("test this!")
		return zx.testthis()
	elseif keynum == 45 then
		print("test that")
		return zx.testthat()
	end
end
-- Events.OnKeyPressed.Add(zx.keyDebug)
