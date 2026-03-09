return {
	{
			gameType = "question",
			grayBGY = 120,
			question = { spacing = 30, scale = .8, offsetY = -67 },
			cards = { scale = .8, offsetX = 0, offsetY = 30, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
			
			questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
	},
	{
			gameType = "sequence",
			grayBGY = 110,
			question = { line1 = "What comes next?", offsetY = -67 },
			cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 10, endRange = 70, answerRange = 2, category = "numbers" },
			
			sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 80, blankLocation = "random", placeMatch = "random", skip = 1, startNum = "random", patternLength = 1, order = "ascending", numChoices = 3 }
	},
	-- {
			-- gameType = "puzzleSlots",
			-- nextWaypoint = true, --false,
			-- grayBGY = 140,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = 1.2, offsetX = 0, offsetY = 50, startRange = 10, endRange = 20, answerRange = 2, category = "numbers" },
			
			-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 5, numChoices = 3, scattered = true, imageCount = "random", skip = 1, skipPattern = "", startNum = "", order = "descending" },
			-- puzzle = { imageSet = "CardsClassic", number = "random", minRand = 10, maxRand = 20, incorrectChoices = 2, minSlotNum = 5, maxSlotNum = 5, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
	-- },
	{
			gameType = "puzzleSlots",
			question = { scale = .9 },
			cards = { scale = 1.25, offsetX = 0, offsetY = 60, startRange = 10, endRange = 20, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 3, scattered = true, imageCount = "random", skip = 1, skipPattern = "", startNum = "", placeMatch = 0, order = "descending" },
			puzzle = { imageSet = "CardsClassic", number = "random", minRand = 10, maxRand = 20, incorrectChoices = 2, minSlotNum = 4, maxSlotNum = 4, turnOffEndVO = true, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
	},
	{
			gameType = "equation",
			grayBGY = 110,
			question = { line1 = "Solve the equation.", offsetY = -65 },
			equation = { scale = 0.85, offsetY = 9 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 3, answerRange = 2, category = "numbersDots" },
			
			equations = { sign = "random", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 2, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
	},
	-- {
			-- gameType = "puzzleSlots",
			-- nextWaypoint = true, --false,
			-- grayBGY = 140,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = 1.2, offsetX = 0, offsetY = 50, startRange = 10, endRange = 60, answerRange = 2, category = "numbers" },
			
			-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 5, numChoices = 3, scattered = true, imageCount = "random", skip = "random", skipPattern = "", startNum = "", order = "ascending" },
			-- puzzle = { imageSet = "CardsClassic", number = "random", minRand = 10, maxRand = 20, incorrectChoices = 2, minSlotNum = 5, maxSlotNum = 5, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
	-- },
	{
			gameType = "puzzleSlots",
			question = { scale = .9 },
			cards = { scale = 1.25, offsetX = 0, offsetY = 60, startRange = 10, endRange = 60, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 3, scattered = true, imageCount = "random", skip = "random", skipPattern = "", startNum = "", placeMatch = 0, order = "descending" },
			puzzle = { imageSet = "CardsClassic", number = "random", minRand = 10, maxRand = 20, incorrectChoices = 2, minSlotNum = 4, maxSlotNum = 4, turnOffEndVO = true, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
	},
	{
			gameType = "equation",
			grayBGY = 110,
			question = { line1 = "Solve the equation.", offsetY = -65 },
			equation = { scale = .85, offsetY = 3 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 5, answerRange = 2, category = "numbers" },
			equations = { sign = "random", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
	},
	{
			gameType = "question",
			grayBGY = 120,
			question = { spacing = 30, scale = .8, offsetY = -67 },
			cards = { scale = .8, offsetX = 0, offsetY = 30, startRange = 2, endRange = 5, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
	},
	{
			gameType = "equation",
			grayBGY = 110,
			question = { line1 = "Solve the equation.", offsetY = -65 },
			equation = { scale = .85, offsetY = 3 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 5, answerRange = 2, category = "numbers" },
			equations = { sign = "random", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
	},
	-- {
			-- gameType = "puzzleSlots",
			-- nextWaypoint = true, --false,
			-- grayBGY = 140,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = 1.2, offsetX = 0, offsetY = 50, startRange = 10, endRange = 20, answerRange = 2, category = "numbers" },
			
			-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 5, numChoices = 3, scattered = true, imageCount = "random", skip = 1, skipPattern = "", startNum = "", order = "descending" },
			-- puzzle = { imageSet = "CardsClassic", number = "random", minRand = 10, maxRand = 20, incorrectChoices = 2, minSlotNum = 5, maxSlotNum = 5, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
	-- },
	{
			gameType = "puzzleSlots",
			question = { scale = .9 },
			cards = { scale = 1.25, offsetX = 0, offsetY = 60, startRange = 10, endRange = 20, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 3, scattered = true, imageCount = "random", skip = 1, skipPattern = "", startNum = "", placeMatch = 0, order = "descending" },
			puzzle = { imageSet = "CardsClassic", number = "random", minRand = 10, maxRand = 20, incorrectChoices = 2, minSlotNum = 4, maxSlotNum = 4, turnOffEndVO = true, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
	},
	{
			gameType = "equation",
			grayBGY = 110,
			question = { line1 = "Solve the equation.", offsetY = -65 },
			equation = { scale = .85, offsetY = 3 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 5, answerRange = 2, category = "numbers" },
			equations = { sign = "random", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
	},
	{
			gameType = "equation",
			grayBGY = 110,
			question = { line1 = "Solve the equation.", offsetY = -65 },
			equation = { scale = .85, offsetY = 3 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 5, answerRange = 2, category = "numbers" },
			equations = { sign = "random", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
	},
	
	
	{
			gameType = "question",
			grayBGY = 120,
			question = { spacing = 30, scale = .8, offsetY = -67 },
			cards = { scale = .8, offsetX = 0, offsetY = 30, startRange = 2, endRange = 5, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
	},
}
