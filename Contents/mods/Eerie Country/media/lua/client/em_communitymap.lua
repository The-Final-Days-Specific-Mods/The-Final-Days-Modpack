----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
--
-- em_communitymap - em_map plugin
--
--
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

print("[ Loading Eerie Country ]"); --add map name here

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

if not em_map then em_map = {}; end;

if not em_map.communityMapReplacesVanilla then
	em_map.communityMapReplacesVanilla = false; --if this map replaces the entire base map set = true;
end

---------------------------------------------------------------------------------------------------- do not edit below
---------------------------------------------------------------------------------------------------- V---------------V

if em_map.callback_chain_load_community_minimapTile ~= nil then
	callback_chain_load_community_minimapTile = em_map.callback_chain_load_community_minimapTile;
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

function em_map:callback_chain_load_community_minimapTile(_index)
	self.mapTiles[_index] = getTexture("media/textures/mapTiles/cell_" .. _index .. ".png");
	if not self.mapTiles[_index] and callback_chain_load_community_minimapTile ~= nil then
		callback_chain_load_community_minimapTile(self, _index);
	end;
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------