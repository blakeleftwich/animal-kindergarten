--Chloe: Skip Counting by 2s
return {

	game1 = {
			
			gameType = "counting",
			question = { offsetY = -67 },
			cards = { scale = .95, offsetX = 0, offsetY = -35, startRange = 2, endRange = 10, category = "numbers" },
			
			counting = { rowNum = 3, columnNum = 2, spacing = 10, startNum = "random", skip = 2, placeMatch = 2 }
	},
	game2 = {
			gameType = "question",
			grayBGY = 100,
			question = { scale = 0.95 },
			cards = { scale = .95, offsetX = 0, offsetY = 20, startRange = 4, endRange = 12, answerRange = 3, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 2, placeMatch = 2 }
			
	},
	game3 = {
			gameType = "puzzleSlots",
			question = { scale = .9 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 8, endRange = 12, answerRange = 4, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 4, scattered = true, imageCount = "random", skip = 2, skipPattern = "", startNum = "", placeMatch = 2, order = "ascending" },
			puzzle = { imageSet = "Cards", number = "random", minRand = 8, maxRand = 12, incorrectChoices = 2, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
	

			
	},
	game4 = {
			
			gameType = "counting",
			question = { offsetY = -67 },
			cards = { scale = .95, offsetX = 0, offsetY = -35, startRange = 22, endRange = 33, category = "numbers" },
			
			counting = { rowNum = 3, columnNum = 2, spacing = 10, startNum = "random", skip = 2, placeMatch = 2 }
	},
	game5 = {
			gameType = "question",
			grayBGY = 100,
			question = { scale = 0.95 },
			cards = { scale = .95, offsetX = 0, offsetY = 20, startRange = 12, endRange = 16, answerRange = 3, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 2, placeMatch = 2 }
			
	},
	game6 = {
			gameType = "puzzleSlots",
			question = { scale = .9 },
			cards = { scale = 1.25, offsetX = 0, offsetY = 60, startRange = 40, endRange = 90, answerRange = 3, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 4, scattered = true, imageCount = "random", skip = 2, skipPattern = "", startNum = "", placeMatch = 2, order = "ascending" },
			puzzle = { imageSet = "CardsClassic", number = "random", minRand = 40, maxRand = 90, incorrectChoices = 3, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
	},
	
	



	-- game1 = {
			
			-- gameType = "counting",
			-- nextWaypoint = true,
			-- grayBGY = 140,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = .95, offsetX = 0, offsetY = -35, startRange = 2, endRange = 10, category = "numbers" },
			
			-- counting = { rowNum = 2, columnNum = 2, spacing = 10, startNum = "random", skip = 2, placeMatch = 2 }
	-- },
	-- game2 = {
			
			-- gameType = "sequence",
			-- nextWaypoint = true,
			-- grayBGY = 110,
			-- question = { line1 = "What comes next?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { spacing = 38.5, scale = .95, offsetX = 0, offsetY = 33, startRange = 20, endRange = 30, answerRange = 2, category = "numbers" },
			
			-- sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 80, blankLocation = 4, placeMatch = 2, skip = 2, startNum = "random", patternLength = 1, order = "ascending", numChoices = 3 }
			
			
	-- },
	-- game3 = {
			
			-- gameType = "counting",
			-- nextWaypoint = true,
			-- grayBGY = 140,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = .95, offsetX = 0, offsetY = -35, startRange = 4, endRange = 16, category = "numbers" },
			
			-- counting = { rowNum = 3, columnNum = 2, spacing = 10, startNum = "random", skip = 2, placeMatch = 2 }
	-- },
	-- game4 = {
			-- gameType = "sequence",
			-- nextWaypoint = true,
			-- grayBGY = 110,
			-- question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
			-- equation = { scale = .9, offsetX = 0, offsetY = 0 },
			-- cards = { spacing = 42, scale = .95, offsetX = 0, offsetY = 33, startRange = 8, endRange = 12, answerRange = 2, category = "numbers" },
			
			-- sequence = { numItems = 5, itemsScale = .9, itemsSpacing = 80, blankLocation = 4, placeMatch = 2, skip = 2, startNum = "random", patternLength = 1, order = "ascending", numChoices = 3 }
		-- },
	-- game5 = {
			
			-- gameType = "counting",
			-- nextWaypoint = true,
			-- grayBGY = 140,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = .95, offsetX = 0, offsetY = -35, startRange = 8, endRange = 20, category = "numbers" },
			
			-- counting = { rowNum = 3, columnNum = 2, spacing = 10, startNum = "random", skip = 2, placeMatch = 2 }
	-- },
	-- game6 = {
			-- gameType = "sequence",
			-- nextWaypoint = true,
			-- grayBGY = 110,
			-- question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
			-- equation = { scale = .9, offsetX = 0, offsetY = 0 },
			-- cards = { spacing = 42, scale = .95, offsetX = 0, offsetY = 33, startRange = 10, endRange = 18, answerRange = 2, category = "numbers" },
			
			-- sequence = { numItems = 5, itemsScale = .9, itemsSpacing = 80, blankLocation = 3, placeMatch = 2, skip = 2, startNum = "random", patternLength = 1, order = "ascending", numChoices = 3 }
		-- },
	
}
