--Oleg Review 4 Nimble Numbers
return {
	
	game1 = {
			gameType = "counting",
			question = { offsetY = -67 },
			cards = { scale = .95, offsetX = 0, offsetY = -35, startRange = 8, endRange = 20, category = "numbers" },
			
			counting = { rowNum = 3, columnNum = 2, spacing = 11, startNum = "random", skip = 2, placeMatch = 2 }
	},
	game2 = {
			gameType = "sequence",
			nextWaypoint = false,
			grayBGY = 110,
			question = { line1 = "What's missing?", offsetY = -67 },
			equation = { scale = .975 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 5, endRange = 8, answerRange = 2, category = "items" },
			sequence = { numItems = 6, itemsScale = 1, itemsSpacing = 2, blankLocation = 5, placeMatch = 0, skip = 1, skipPattern = "", startNum = "random", patternLength = 2, order = "ascending", numChoices = 3 }
	},
	
	game3 = {
			gameType = "puzzleSlots",
			question = { scale = .9 },
			cards = { scale = 1.25, offsetX = 0, offsetY = 60, startRange = 40, endRange = 60, answerRange = 3, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 4, scattered = true, imageCount = "random", skip = 5, skipPattern = "", startNum = "", placeMatch = 5, order = "ascending" },
			puzzle = { imageSet = "CardsClassic", number = "random", minRand = 40, maxRand = 60, incorrectChoices = 3, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
	},
	
	
	game4 = {
			gameType = "sequence",
			nextWaypoint = false,
			grayBGY = 110,
			question = { line1 = "What's missing?", offsetY = -67 },
			equation = { scale = .9 },
			cards = { spacing = 42, scale = .95, offsetX = 0, offsetY = 33, startRange = 11, endRange = 20, answerRange = 2, category = "numbers" },
			
			sequence = { numItems = 5, itemsScale = .9, itemsSpacing = 80, blankLocation = 4, placeMatch = 0, skip = 3, startNum = "random", patternLength = 1, order = "ascending", numChoices = 3 }
	},
	game5 = {
			
			gameType = "puzzleSlots",
			question = { offsetY = -36 },
			cards = { scale = 1.4, offsetX = 0, offsetY = 50, startRange = 0, endRange = 1, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 3, scattered = true, imageCount = "random", skip = 1, skipPattern = "", startNum = "", order = "ascending" },
			puzzle = { imageSet = "CardsNumDifficult", number = "random", minRand = 300, maxRand = 999, incorrectChoices = 3, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
	
	},
	
	game6 = {
			gameType = "question",
			grayBGY = 100,
			question = { scale = 0.95 },
			cards = { scale = .95, offsetX = 0, offsetY = 20, startRange = 10, endRange = 30, answerRange = 3, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 5 }
	
	},
	
	
	game7 = {
			gameType = "sequence",
			nextWaypoint = false,
			grayBGY = 110,
			question = { line1 = "What's missing?", offsetY = -67 },
			equation = { scale = .975 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 9, endRange = 12, answerRange = 2, category = "items" },
			sequence = { numItems = 6, itemsScale = 1, itemsSpacing = 2, blankLocation = 5, placeMatch = 0, skip = 1, skipPattern = "", startNum = "random", patternLength = 3, order = "ascending", numChoices = 3 }
	},
	
	
	game8 = {
			
			gameType = "puzzleSlots",
			question = { offsetY = -36 },
			cards = { scale = 1.4, offsetX = 0, offsetY = 50, startRange = 0, endRange = 1, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 3, scattered = true, imageCount = "random", skip = 1, skipPattern = "", startNum = "", order = "ascending" },
			puzzle = { imageSet = "CardsNumDifficult", number = "random", minRand = 500, maxRand = 999, incorrectChoices = 3, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
	
	
			
	},
	game9 = {
			
			gameType = "counting",
			question = { offsetY = -67 },
			cards = { scale = .95, offsetX = 0, offsetY = -35, startRange = 20, endRange = 35, category = "numbers" },
			
			counting = { rowNum = 3, columnNum = 2, spacing = 10, startNum = "random", skip = 5, placeMatch = 5 }
	},
	
	
}
