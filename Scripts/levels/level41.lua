-- Bella Review 6
return {
	game1 = {
			gameType = "question",
			grayBGY = 115,
			question = { spacing = 30, scale = .78, offsetY = -69 },
			cards = { scale = .98, offsetX = 0, offsetY = 35, startRange = 2, endRange = 3, answerRange = 2, category = "numbersDots" },
			
			questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
	},
	-- game2 = {
			-- gameType = "basketGreaterLessThan",
			-- nextWaypoint = true,
			-- grayBGY = 140,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = .7, offsetX = 0, offsetY = -65 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = .8, offsetX = 0, offsetY = 0, startRange = 5, endRange = 5, numStartRange = 5, numEndRange = 50, numCorrectMin = 1, numCorrectMax = 3, answerRange = 2, category = "numbers" },
			-- questions = { questionType1 = "basketGreaterLessThan", questionType2 = "greater than", numAnswers = 1, numChoices = 5, scattered = true, numExtraMin = 0, numExtraMax = 0, imageCount = 4, skip = 1 }
	-- },
	game2 = {
			gameType = "question",
			cards = { spacing = 75, scale = 1.75, offsetX = 0, offsetY = -42, startRange = 40, endRange = 70, answerRange = 3, category = "numbers" },
			questions = { questionType1 = "Which is", questionType2 = "more than", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = 10, skipMin = 10, skipMax = 10 }
	},	
	game3 = {
			gameType = "equation",
			nextWaypoint = false,
			grayBGY = 110,
			question = { line1 = "Solve the equation.", offsetY = -65 },
			equation = { scale = 0.85, offsetY = 9 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 5, answerRange = 2, category = "numbersDots" },
			
			equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
	},
	
	game4 = {
			gameType = "question",
			cards = { spacing = 60, scale = 1.4, offsetX = 0, offsetY = -42, startRange = 10, endRange = 85, answerRange = 3, category = "numbers" },
			questions = { questionType1 = "Which is", questionType2 = "more than", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = 10, skipMin = 10, skipMax = 10 }
	},	
	-- game4 = {
			
							
			-- gameType = "matching",
			-- nextWaypoint = true,
			-- grayBGY = 140,
			-- question = { line1 = "Match picture cards that have", line2 = "the same number of items.", spacing = 20, scale = .8, offsetX = 0, offsetY = -69 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { spacing = 60, vSpacing = 93, scale = 1.25, offsetX = 0, offsetY = -13, startRange = 6, endRange = 10, category = "groupsToGroups" },
			-- matching = { mode = "showme", classic = true, layout = 1, numRandom = true, showMeMode = 2 }
	-- },
	game5 = {
			gameType = "question",
			nextWaypoint = false,
			grayBGY = 115,
			question = { spacing = 30, scale = .78, offsetY = -69 },
			cards = { scale = .98, offsetX = 0, offsetY = 35, startRange = 4, endRange = 5, answerRange = 2, category = "numbersDots" },
			
			questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
	},
	game6 = {
			gameType = "equation",
			grayBGY = 110,
			question = { line1 = "Solve the equation.", offsetY = -65 },
			equation = { scale = 0.85, offsetY = 9 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 5, answerRange = 2, category = "numbersDots" },
			
			equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
	},
	
	game7 = {
			gameType = "sequence",
			nextWaypoint = false,
			grayBGY = 110,
			question = { line1 = "What's missing?", offsetY = -67 },
			equation = { scale = .8 },
			cards = { spacing = 42, scale = .95, offsetX = 0, offsetY = 35, startRange = 20, endRange = 70, answerRange = 10, category = "numbers" },
			
			sequence = { numItems = 5, itemsScale = .9, itemsSpacing = 80, blankLocation = "random", placeMatch = "random", skip = 1, startNum = "random", patternLength = 1, order = "ascending", numChoices = 3 }
	},
	game8 = {
			gameType = "question",
			grayBGY = 115,
			question = { spacing = 30, scale = .78, offsetY = -69 },
			cards = { scale = .98, offsetX = 0, offsetY = 35, startRange = 1, endRange = 5, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
	},
	-- game10 = {
			-- gameType = "puzzleSlots",
			-- nextWaypoint = true, --false,
			-- grayBGY = 140,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = 1.25, offsetX = 0, offsetY = 60, startRange = 20, endRange = 80, answerRange = 10, category = "numbers" },
			
			-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 5, numChoices = 3, scattered = true, imageCount = "random", skip = "random", skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
			-- puzzle = { imageSet = "CardsClassic", number = "random", minRand = 10, maxRand = 80, incorrectChoices = 2, minSlotNum = 3, maxSlotNum = 4, turnOffEndVO = true, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
	-- },
	game9 = {
			gameType = "puzzleSlots",
			question = { scale = .9 },
			cards = { scale = 1.25, offsetX = 0, offsetY = 60, startRange = 20, endRange = 60, answerRange = 10, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 3, scattered = true, imageCount = "random", skip = "random", skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
			puzzle = { imageSet = "CardsClassic", number = "random", minRand = 20, maxRand = 60, incorrectChoices = 2, minSlotNum = 2, maxSlotNum = 3, turnOffEndVO = true, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
	},
	
}
