-- CHARACTER_NAME: Level Title
--
-- How to add a new level:
--   1. Copy this file to levelNN.lua (e.g., level77.lua)
--   2. Fill in the game definitions below
--   3. Add this line to Scripts/gameDetails.lua:
--        levelNN = require("Scripts.levels.levelNN"),  -- Character: Title
--
-- Fields with defaults (can be omitted if you want the default value):
--   grayBGY      = 140
--   nextWaypoint  = true
--   question      = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 }
--   equation      = { scale = 1, offsetX = 0, offsetY = 0 }
--
-- Required fields (must be specified for each game):
--   gameType  — "matching", "equation", "question", "sequence", "puzzleSlots",
--               "puzzle", "basket", "touchTheNumber", "bubbleCounting",
--               "counting", "cardSlots"
--   cards     — card layout/category settings (varies by game type)
--
-- Game-type-specific fields:
--   matching:  matching = { mode, classic, layout, numRandom, showMeMode }
--   equation:  equations = { sign, numBlanks, choiceOneBlank, ... }
--   question:  questions = { questionType1, questionType2, numAnswers, numChoices, ... }
--   sequence:  sequence = { ... }
--   puzzle:    puzzle = { imageSet, number, minRand, maxRand, ... }

return {
	game1 = {
			gameType = "",
			cards = {},
	},
}
