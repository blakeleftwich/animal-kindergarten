local gameDefaults = {}

-- Default values for game definitions.
-- These are applied to any game entry that omits a field.
-- Existing explicit values are never overwritten.
gameDefaults.defaults = {
	grayBGY = 140,
	nextWaypoint = true,
	question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
	equation = { scale = 1, offsetX = 0, offsetY = 0 },
}

-- Deep-merge defaults into a single game definition.
-- Only fills in fields that are nil; never overwrites existing values.
local function applyGameDefaults(gameDef, defaults)
	for key, defaultVal in pairs(defaults) do
		if gameDef[key] == nil then
			-- Field is missing entirely: copy the default
			if type(defaultVal) == "table" then
				local copy = {}
				for k, v in pairs(defaultVal) do
					copy[k] = v
				end
				gameDef[key] = copy
			else
				gameDef[key] = defaultVal
			end
		elseif type(defaultVal) == "table" and type(gameDef[key]) == "table" then
			-- Field exists as a table: fill in any missing sub-fields
			for k, v in pairs(defaultVal) do
				if gameDef[key][k] == nil then
					gameDef[key][k] = v
				end
			end
		end
	end
end

-- Apply defaults to all game definitions in a collection.
-- Works with both structures:
--   gameDetails:       { level1 = { game1 = {...}, game2 = {...} }, ... }
--   randomGameDetails: { review6 = { {...}, {...} }, category = { game1 = {...} }, ... }
function gameDefaults.applyDefaults(collection)
	for _groupKey, group in pairs(collection) do
		if type(group) == "table" then
			for _gameKey, gameDef in pairs(group) do
				if type(gameDef) == "table" and gameDef.gameType then
					applyGameDefaults(gameDef, gameDefaults.defaults)
				end
			end
		end
	end
	return collection
end

return gameDefaults
