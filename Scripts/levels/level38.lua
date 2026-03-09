-- Webster What's Missing 2s 5s 10s
return {
	
	game1 = {
			
			gameType = "sequence",
			grayBGY = 110,
			question = { line1 = "What's missing?", offsetY = -67 },
			cards = { spacing = 38.5, scale = .95, offsetX = 0, offsetY = 33, startRange = 10, endRange = 70, answerRange = 4, category = "numbers" },
			
			sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 80, blankLocation = "random", placeMatch = "random", skip = 1, startNum = "random", patternLength = 1, order = "ascending", numChoices = 3 }
	},
	game2 = {
			gameType = "puzzleSlots",
			question = { scale = .9 },
			cards = { scale = 1.25, offsetX = 0, offsetY = 60, startRange = 10, endRange = 70, answerRange = 4, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 3, scattered = true, imageCount = "random", skip = "random", skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
			puzzle = { imageSet = "CardsClassic", number = "random", minRand = 1, maxRand = 70, incorrectChoices = 2, minSlotNum = 2, maxSlotNum = 3, turnOffEndVO = true, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
	},
	game3 = {
			gameType = "sequence",
			nextWaypoint = false,
			grayBGY = 110,
			question = { line1 = "What's missing?", offsetY = -67 },
			cards = { spacing = 38.5, scale = .95, offsetX = 0, offsetY = 33, startRange = 10, endRange = 70, answerRange = 4, category = "numbers" },
			
			sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 80, blankLocation = "random", placeMatch = "random", skip = 1, startNum = "random", patternLength = 1, order = "ascending", numChoices = 3 }
	},
	-- game4 = {
			-- gameType = "puzzleSlots",
			-- nextWaypoint = true, --false,
			-- grayBGY = 140,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = 1.25, offsetX = 0, offsetY = 60, startRange = 10, endRange = 70, answerRange = 4, category = "numbers" },
			
			-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 5, numChoices = 3, scattered = true, imageCount = "random", skip = "random", skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
			-- puzzle = { imageSet = "CardsClassic", number = "random", minRand = 10, maxRand = 70, incorrectChoices = 2, minSlotNum = 3, maxSlotNum = 4, turnOffEndVO = true, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
	-- },
	game4 = {
			gameType = "puzzleSlots",
			question = { scale = .9 },
			cards = { scale = 1.25, offsetX = 0, offsetY = 60, startRange = 10, endRange = 70, answerRange = 4, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 3, scattered = true, imageCount = "random", skip = "random", skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
			puzzle = { imageSet = "CardsClassic", number = "random", minRand = 10, maxRand = 70, incorrectChoices = 2, minSlotNum = 2, maxSlotNum = 3, turnOffEndVO = true, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
	},
	game5 = {
			gameType = "puzzleSlots",
			question = { scale = .9 },
			cards = { scale = 1.25, offsetX = 0, offsetY = 60, startRange = 10, endRange = 80, answerRange = 4, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 3, scattered = true, imageCount = "random", skip = "random", skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
			puzzle = { imageSet = "CardsClassic", number = "random", minRand = 10, maxRand = 70, incorrectChoices = 2, minSlotNum = 2, maxSlotNum = 3, turnOffEndVO = true, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
	},
	game6 = {
			gameType = "sequence",
			nextWaypoint = false,
			grayBGY = 110,
			question = { line1 = "What's missing?", offsetY = -67 },
			equation = { scale = .8 },
			cards = { spacing = 38.5, scale = .95, offsetX = 0, offsetY = 33, startRange = 20, endRange = 70, answerRange = 4, category = "numbers" },
			
			sequence = { numItems = 5, itemsScale = .9, itemsSpacing = 80, blankLocation = "random", placeMatch = "random", skip = 1, startNum = "random", patternLength = 1, order = "ascending", numChoices = 3 }
	},
	-- game7 = {
			-- gameType = "puzzleSlots",
			-- nextWaypoint = true, --false,
			-- grayBGY = 140,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = 1.25, offsetX = 0, offsetY = 60, startRange = 20, endRange = 80, answerRange = 4, category = "numbers" },
			
			-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 5, numChoices = 3, scattered = true, imageCount = "random", skip = "random", skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
			-- puzzle = { imageSet = "CardsClassic", number = "random", minRand = 10, maxRand = 80, incorrectChoices = 2, minSlotNum = 3, maxSlotNum = 4, turnOffEndVO = true, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
	-- },
	game7 = {
			gameType = "puzzleSlots",
			question = { scale = .9 },
			cards = { scale = 1.25, offsetX = 0, offsetY = 60, startRange = 20, endRange = 80, answerRange = 4, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 3, scattered = true, imageCount = "random", skip = "random", skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
			puzzle = { imageSet = "CardsClassic", number = "random", minRand = 10, maxRand = 80, incorrectChoices = 2, minSlotNum = 2, maxSlotNum = 3, turnOffEndVO = true, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
	},
	game8 = {
			gameType = "puzzleSlots",
			question = { scale = .9 },
			cards = { scale = 1.25, offsetX = 0, offsetY = 60, startRange = 30, endRange = 80, answerRange = 4, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 3, scattered = true, imageCount = "random", skip = "random", skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
			puzzle = { imageSet = "CardsClassic", number = "random", minRand = 1, maxRand = 70, incorrectChoices = 2, minSlotNum = 2, maxSlotNum = 3, turnOffEndVO = true, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
	},
}
