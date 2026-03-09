--Pinkie Skip Counting by 5s
return {

	game1 = {
			
			gameType = "counting",
			question = { offsetY = -67 },
			cards = { scale = .95, offsetX = 0, offsetY = -35, startRange = 2, endRange = 10, category = "numbers" },
			
			counting = { rowNum = 3, columnNum = 2, spacing = 10, startNum = "random", skip = 5, placeMatch = 5 }
	},
	game2 = {
			gameType = "question",
			grayBGY = 100,
			question = { scale = 0.95 },
			cards = { scale = .95, offsetX = 0, offsetY = 20, startRange = 10, endRange = 30, answerRange = 3, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 5 }
			
	},
	-- game3 = {
			-- gameType = "puzzleSlots",
			-- nextWaypoint = true, --false,
			-- grayBGY = 140,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 5, endRange = 5, answerRange = 4, category = "numbers" },
			
			-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 4, scattered = true, imageCount = "random", skip = 5, skipPattern = "", startNum = "", placeMatch = 5, order = "ascending" },
			-- puzzle = { imageSet = "Cards", number = "random", minRand = 5, maxRand = 5, incorrectChoices = 2, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
	

			
	-- },
	game3 = {
			gameType = "puzzleSlots",
			question = { scale = .9 },
			cards = { scale = 1.25, offsetX = 0, offsetY = 60, startRange = 50, endRange = 60, answerRange = 3, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 4, scattered = true, imageCount = "random", skip = 5, skipPattern = "", startNum = "", placeMatch = 5, order = "ascending" },
			puzzle = { imageSet = "CardsClassic", number = "random", minRand = 50, maxRand = 60, incorrectChoices = 3, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
	},
	game4 = {
			gameType = "question",
			nextWaypoint = false,
			grayBGY = 100,
			question = { scale = 0.95 },
			cards = { scale = .95, offsetX = 0, offsetY = 20, startRange = 5, endRange = 30, answerRange = 3, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 5 }
			
	},
	game5 = {
			
			gameType = "counting",
			question = { offsetY = -67 },
			cards = { scale = .95, offsetX = 0, offsetY = -35, startRange = 20, endRange = 35, category = "numbers" },
			
			counting = { rowNum = 3, columnNum = 2, spacing = 10, startNum = "random", skip = 5, placeMatch = 5 }
	},
	
	game6 = {
			gameType = "puzzleSlots",
			question = { scale = .9 },
			cards = { scale = 1.25, offsetX = 0, offsetY = 60, startRange = 40, endRange = 60, answerRange = 3, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 4, scattered = true, imageCount = "random", skip = 5, skipPattern = "", startNum = "", placeMatch = 5, order = "ascending" },
			puzzle = { imageSet = "CardsClassic", number = "random", minRand = 40, maxRand = 60, incorrectChoices = 3, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
	},
	game7 = {
			gameType = "question",
			grayBGY = 100,
			question = { scale = 0.95 },
			cards = { scale = .95, offsetX = 0, offsetY = 20, startRange = 10, endRange = 30, answerRange = 3, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 5 }
			
	},


	-- game1 = {
			-- gameType = "counting",
			-- nextWaypoint = true,
			-- grayBGY = 140,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = 1.1, offsetX = 0, offsetY = -25, startRange = 5, endRange = 20, category = "numbers" },
			
			-- counting = { rowNum = 2, columnNum = 2, spacing = 11, startNum = "random", skip = 5, placeMatch = 5 }
	-- },
	-- game2 = {
			-- gameType = "sequence",
			-- nextWaypoint = true,
			-- grayBGY = 110,
			-- question = { line1 = "What comes next?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { spacing = 42, scale = .95, offsetX = 0, offsetY = 33, startRange = 15, endRange = 35, answerRange = 2, category = "numbers" },
			
			-- sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 80, blankLocation = 4, placeMatch = 5, skip = 5, startNum = "random", patternLength = 1, order = "ascending", numChoices = 3 }
	-- },
	-- game3 = {
			-- gameType = "counting",
			-- nextWaypoint = true,
			-- grayBGY = 140,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = 1.1, offsetX = 0, offsetY = -25, startRange = 20, endRange = 60, category = "numbers" },
			
			-- counting = { rowNum = 3, columnNum = 2, spacing = 11, startNum = "random", skip = 5, placeMatch = 5 }
	-- },
	-- game4 = {
			-- gameType = "sequence",
			-- nextWaypoint = true,
			-- grayBGY = 110,
			-- question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
			-- equation = { scale = .8, offsetX = 0, offsetY = 0 },
			-- cards = { spacing = 42, scale = .95, offsetX = 0, offsetY = 33, startRange = 30, endRange = 75, answerRange = 2, category = "numbers" },
			
			-- sequence = { numItems = 5, itemsScale = .9, itemsSpacing = 80, blankLocation = 4, placeMatch = 5, skip = 5, startNum = "random", patternLength = 1, order = "ascending", numChoices = 3 }

	-- },
	-- game5 = {
			-- gameType = "counting",
			-- nextWaypoint = true,
			-- grayBGY = 140,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = 1.1, offsetX = 0, offsetY = -25, startRange = 45, endRange = 90, category = "numbers" },
			
			-- counting = { rowNum = 3, columnNum = 2, spacing = 11, startNum = "random", skip = 5, placeMatch = 5 }
	-- },
	-- game6 = {
			-- gameType = "sequence",
			-- nextWaypoint = true,
			-- grayBGY = 110,
			-- question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
			-- equation = { scale = .8, offsetX = 0, offsetY = 0 },
			-- cards = { spacing = 42, scale = .95, offsetX = 0, offsetY = 33, startRange = 60, endRange = 85, answerRange = 2, category = "numbers" },
			
			-- sequence = { numItems = 5, itemsScale = .9, itemsSpacing = 80, blankLocation = 3, placeMatch = 5, skip = 5, startNum = "random", patternLength = 1, order = "ascending", numChoices = 3 }
-- },
	
}
