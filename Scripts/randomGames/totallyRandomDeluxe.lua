return {
	{
			gameType = "matching",
			question = { line1 = "Touch an equation, then", line2 = "the card with the answer.", scale = .8, offsetY = -69 },
			cards = { spacing = 76, vSpacing = 93, scale = .8, offsetX = 0, offsetY = -23, startRange = 1, endRange = 5, category = "numbersToEquations" },	
			matching = { mode = "showme", classic = true, layout = 6, symbol = "random", numRandom = true, showMeMode = 2 }
	},	
	{
			gameType = "sequence",
			grayBGY = 110,
			question = { line1 = "What comes next?", offsetY = -67 },
			cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 1, endRange = 60, answerRange = 2, category = "numbers" },
			
			sequence = { numItems = 5, itemsScale = .875, itemsSpacing = 80, blankLocation = "random", placeMatch = "random", skip = 3, startNum = "random", patternLength = 1, order = "ascending", numChoices = 3 }
	},
	{
			gameType = "puzzleSlots",
			question = { scale = .9 },
			cards = { scale = 1.2, offsetX = 0, offsetY = 50, startRange = 1, endRange = 60, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 5, numChoices = 3, scattered = true, imageCount = "random", skip = 3, skipPattern = "", startNum = "", order = "ascending" },
			puzzle = { imageSet = "CardsClassic", number = "random", minRand = 1, maxRand = 70, incorrectChoices = 2, minSlotNum = 3, maxSlotNum = 5, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
	},
	{
			gameType = "question",
			nextWaypoint = false,				
			question = { offsetY = -65 },
			cards = { scale = .95, offsetX = 0, offsetY = -50, startRange = 6, endRange = 15, answerRange = 4, category = "numbers" },
			
			questions = { questionType1 = "Which 2 numbers add up to", questionType2 = "random", numAnswers = 3, numChoices = 5, scattered = true, imageCount = 9, skip = 1 }	
			
	},
	{
			gameType = "complex equation",
			grayBGY = 110,
			question = { line1 = "What's missing?" },
			cards = { scale = .93, offsetX = 0, offsetY = 40, startRange = 1, endRange = 10, category = "numbers" },
			
			equations = { sign = "random", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, choiceThreeBlank = false, answerBlank = true, numChoices = 4, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
	},
	{
			
			gameType = "question",
			cards = { scale = 1.04, offsetX = 0, offsetY = -58, startRange = 50, endRange = 99, answerRange = 4, category = "numbers" },
			questions = { questionType1 = "Which number is", questionType2 = "GreaterLess", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 1 }
	
			
	},
	{
			gameType = "basketGreaterLessThan",
			question = { scale = .9, offsetY = -65 },
			cards = { scale = .8, offsetX = 0, offsetY = 0, startRange = 5, endRange = 5, numStartRange = 50, numEndRange = 97, numCorrectMin = 1, numCorrectMax = 3, answerRange = 2, category = "numbers" },
			questions = { questionType1 = "basketGreaterLessThan", questionType2 = "random", numAnswers = 1, numChoices = 5, scattered = true, numExtraMin = 1, numExtraMax = 2, imageCount = 4, skip = 1 }
	},
	{
			gameType = "question",
			question = { scale = .9, offsetY = -70 },
			cards = { scale = 1, offsetX = 0, offsetY = -20, startRange = 50, endRange = 99, category = "numbers" },
			questions = { questionType1 = "AllGreaterLessThan", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 1, skip = 1 },
			counting = { rowNum = 2, columnNum = 2, spacing = 13, startNum = "random", skip = 1 }
	},
	{
			gameType = "question",
			grayBGY = 110,
			question = { line1 = "Solve the word problem.", scale = .9 },
			equation = { scale = 0.8 },
			cards = { scale = .9, offsetX = 0, offsetY = 40, startRange = 3, endRange = 10, category = "numbers" },
			questions = { questionType1 = "Word problem", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 6, skip = 1 }	
	},
	{
			gameType = "question",
			grayBGY = 120,
			question = { spacing = 30, scale = .8, offsetY = -67 },
			cards = { scale = .8, offsetX = 0, offsetY = 30, startRange = 2, endRange = 5, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many apples", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
	},
	{
			gameType = "question",
			cards = { scale = 1, offsetX = 0, offsetY = -42, startRange = 20, endRange = 90, answerRange = 3, category = "numbers" },
			questions = { questionType1 = "Which is", questionType2 = "more than", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = 10, skipMin = 10, skipMax = 10 }
	},	
	{
			
			gameType = "puzzleSlots",
			question = { offsetY = -36 },
			cards = { scale = 1.4, offsetX = 0, offsetY = 50, startRange = 0, endRange = 1, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 3, scattered = true, imageCount = "random", skip = 1, skipPattern = "", startNum = "", order = "ascending" },
			puzzle = { imageSet = "CardsNumDifficult", number = "random", minRand = 50, maxRand = 99, incorrectChoices = 2, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
	
	},
	{
			gameType = "question",
			grayBGY = 120,
			question = { spacing = 30, scale = .8, offsetY = -67 },
			cards = { scale = .8, offsetX = 0, offsetY = 30, startRange = 2, endRange = 5, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many apples", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
	},
}
