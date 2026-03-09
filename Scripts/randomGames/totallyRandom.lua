return {
	{
			gameType = "matching",
			question = { line1 = "Touch an equation, then", line2 = "the card with the answer.", scale = .8, offsetY = -69 },
			cards = { spacing = 76, vSpacing = 93, scale = 1.1, offsetX = 0, offsetY = -23, startRange = 1, endRange = 5, category = "numbersToEquations" },	
			matching = { mode = "showme", classic = true, layout = 5, symbol = "random", numRandom = true, showMeMode = 2 }
	},	
	{
			gameType = "sequence",
			grayBGY = 100,
			question = { line1 = "What comes next?" },
			cards = { scale = 1, offsetX = 0, offsetY = 20, startRange = 1, endRange = 10, answerRange = 2, category = "items" },
			sequence = { numItems = 5, itemsScale = .875, itemsSpacing = 80, blankLocation = "random", placeMatch = 0, skip = 2, skipPattern = "", startNum = "random", patternLength = 2, order = "ascending", numChoices = 3 }
	},
	{
			gameType = "puzzleSlots",
			question = { scale = .9 },
			cards = { scale = 1.2, offsetX = 0, offsetY = 50, startRange = 10, endRange = 100, answerRange = 4, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 5, numChoices = 3, scattered = true, imageCount = "random", skip = 1, skipPattern = "", startNum = "", order = "descending" },
			puzzle = { imageSet = "CardsClassic", number = "random", minRand = 20, maxRand = 70, incorrectChoices = 2, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
	},
	{
			gameType = "question",
			nextWaypoint = false,				
			question = { offsetY = -65 },
			cards = { scale = .95, offsetX = 0, offsetY = -50, startRange = 5, endRange = 10, answerRange = 4, category = "numbers" },
			
			questions = { questionType1 = "Which 2 numbers add up to", questionType2 = "random", numAnswers = 3, numChoices = 5, scattered = true, imageCount = 9, skip = 1 }	
			
	},
	{
			gameType = "complex equation",
			grayBGY = 110,
			question = { line1 = "What's missing?" },
			cards = { scale = .93, offsetX = 0, offsetY = 40, startRange = 1, endRange = 10, category = "numbers" },
			
			equations = { sign = "random", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, choiceThreeBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
	},
	{
			gameType = "basketGreaterLessThan",
			question = { scale = .9, offsetY = -65 },
			cards = { scale = .8, offsetX = 0, offsetY = 0, startRange = 5, endRange = 5, numStartRange = 5, numEndRange = 50, numCorrectMin = 1, numCorrectMax = 3, answerRange = 4, category = "numbers" },
			questions = { questionType1 = "basketGreaterLessThan", questionType2 = "greater than", numAnswers = 1, numChoices = 5, scattered = true, numExtraMin = 1, numExtraMax = 2, imageCount = 4, skip = 1 }
	},
	{
			gameType = "question",
			nextWaypoint = false,				
			question = { offsetY = -65 },
			cards = { scale = .95, offsetX = 0, offsetY = -50, startRange = 5, endRange = 10, answerRange = 4, category = "numbers" },
			
			questions = { questionType1 = "Which 2 numbers add up to", questionType2 = "random", numAnswers = 3, numChoices = 5, scattered = true, imageCount = 9, skip = 1 }	
			
	},
}
