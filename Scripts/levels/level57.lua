--Oleg Action Subtraction
return {
	game1 = {
			gameType = "question",
			grayBGY = 115,
			question = { spacing = 30, scale = .78, offsetY = -69 },
			cards = { scale = .96, offsetX = 0, offsetY = 35, startRange = 2, endRange = 8, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
	},
	
	game2 = {
			gameType = "equation",
			nextWaypoint = false,
			grayBGY = 110,
			question = { line1 = "Solve the equation.", offsetY = -65 },
			equation = { scale = 0.85, offsetY = 9 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 8, answerRange = 2, category = "numbersDots" },
			
			equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
	},
	game3 = {
			gameType = "question",
			cards = { scale = 1.75, offsetX = 0, offsetY = -42, startRange = 5, endRange = 25, answerRange = 3, category = "numbers", spacing = 75 },
			questions = { questionType1 = "Which is", questionType2 = "less than", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = "randomRange", skipMin = 1, skipMax = 5 }
	},	
	-- game5 = {
			-- gameType = "puzzleSlots",
			-- nextWaypoint = false, --false,
			-- grayBGY = 140,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = 1.25, offsetX = 0, offsetY = 60, startRange = 10, endRange = 60, answerRange = 2, category = "numbers" },
			
			-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 5, numChoices = 3, scattered = true, imageCount = "random", skip = "random", skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
			-- puzzle = { imageSet = "CardsClassic", number = "random", minRand = 10, maxRand = 60, incorrectChoices = 2, minSlotNum = 5, maxSlotNum = 5, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
	-- },
	game4 = {
			gameType = "equation",
			nextWaypoint = false,
			grayBGY = 110,
			question = { line1 = "Solve the equation.", offsetY = -65 },
			equation = { scale = 0.85, offsetY = 9 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 6, answerRange = 2, category = "numbers" },
			
			equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
	},
	
	-- game5 = {
			-- gameType = "question",
			-- nextWaypoint = true,
			-- grayBGY = 115,
			-- question = { line1 = "", line2 = "", spacing = 30, scale = .78, offsetX = 0, offsetY = -69},
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = .96, offsetX = 0, offsetY = 35, startRange = 1, endRange = 8, answerRange = 2, category = "numbers" },
			
			-- questions = { questionType1 = "How many apples", questionType2 = "subtracct", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
	-- },
	game5 = {
			gameType = "question",
			grayBGY = 115,
			question = { spacing = 30, scale = .78, offsetY = -69 },
			cards = { scale = .96, offsetX = 0, offsetY = 35, startRange = 1, endRange = 8, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
	},
	game6 = {
			gameType = "equation",
			grayBGY = 110,
			question = { line1 = "Solve the equation.", offsetY = -65 },
			equation = { scale = .85, offsetY = 3 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 2, endRange = 9, answerRange = 2, category = "numbers" },
			equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
	},
	-- game9 = {
			-- gameType = "sequence",
			-- nextWaypoint = false,
			-- grayBGY = 110,
			-- question = { line1 = "What comes next?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
			-- equation = { scale = .8, offsetX = 0, offsetY = 0 },
			-- cards = { spacing = 38.5, scale = .95, offsetX = 0, offsetY = 33, startRange = 10, endRange = 70, answerRange = 2, category = "numbers" },
			
			-- sequence = { numItems = 5, itemsScale = .9, itemsSpacing = 80, blankLocation = 5, placeMatch = 0, skip = 1, startNum = "random", patternLength = 1, order = "descending", numChoices = 3 }
	-- },
	game7 = {
			gameType = "equation",
			nextWaypoint = false,
			grayBGY = 110,
			question = { line1 = "Solve the equation.", offsetY = -65 },
			equation = { scale = .85, offsetY = 3 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 9, answerRange = 2, category = "numbers" },
			equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
	},
	game8 = {
			gameType = "question",
			grayBGY = 106,				
			question = { line1 = "True or false?" },
			equation = { scale = 1.1 },
			cards = { spacing = 70, rotation = 90, scale = 1.30, offsetX = 0, offsetY = 33, startRange = 1, endRange = 9, category = "random" },
			questions = { questionType1 = "TrueOrFalse", questionType2 = "oneEquation", symbol = "-", numAnswers = 1, numChoices = 2, scattered = true, imageCount = 1, skip = 1 }		
	},
	game9 = {
			gameType = "equation",
			nextWaypoint = false,
			grayBGY = 110,
			question = { line1 = "Solve the equation.", offsetY = -65 },
			equation = { scale = .85, offsetY = 3 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 9, answerRange = 2, category = "numbers" },
			equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
	},
	game10 = {
			gameType = "question",
			grayBGY = 106,
			question = { line1 = "Solve the word problem.", scale = .9 },
			equation = { scale = 0.8 },
			cards = { spacing = 48, scale = 1.25, offsetX = 0, offsetY = 34, startRange = 3, endRange = 9, category = "numbers" },
			questions = { questionType1 = "Word problem", questionType2 = "subtraction", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 6, skip = 1 }	
	},
	
}
