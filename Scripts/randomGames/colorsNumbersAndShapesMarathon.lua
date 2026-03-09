return {
	{
		gameType = "counting",
		nextWaypoint = false,
		question = { offsetY = -67 },
		cards = { scale = .95, offsetX = 0, offsetY = -35, startRange = 50, endRange = 100, category = "numbers" },
		
		counting = { rowNum = 4, columnNum = 2, spacing = 10, startNum = "random", skip = 1 }
	},
	{
		gameType = "question",
		question = { offsetY = -30 },
		cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 11, endRange = 20, answerRange = 2, category = "numbers" },
		
		questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = false, imageCount = "random", skip = 1 }
	},
	{
		gameType = "basket",
		question = { scale = .85, offsetY = -65 },
		cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 5, endRange = 10, answerRange = 2, category = "numbers" },
		
		questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, numExtraMin = 0, numExtraMax = 0, imageCount = "random", skip = 1 }
			
	},
	{
		gameType = "matching",
		nextWaypoint = false,
		question = { line1 = "Touch a color, then another", line2 = "card with the same color.", scale = .8, offsetY = -67 },
		cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 4, endRange = 8, category = "colorToColorItem" },
		matching = { mode = "showme", layout = 9, numRandom = true }
			
	},
	{
		gameType = "question",
		nextWaypoint = false,
		question = { offsetY = -65 },
		cards = { scale = 1, offsetX = 0, offsetY = -50, startRange = 5, endRange = 10, answerRange = 5, category = "shape" },
		questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 5, scattered = true, imageCount = 9, skip = 1 }
	},
	{
		gameType = "puzzleSlots",
		nextWaypoint = false, --false,
		question = { offsetY = -65 },
		cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 9, answerRange = 2, category = "numbers" },
		
		questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 },
		puzzle = { imageSet = "Num", number = "random", minRand = 12, maxRand = 20, incorrectChoices = 1, maskSet = 3, otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "slotAlpha", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
			
	},
	{
		gameType = "sequence",
		nextWaypoint = false,
		question = { line1 = "What comes next?", offsetY = -30 },
		cards = { scale = .85, offsetX = 0, offsetY = 60, startRange = 50, endRange = 100, answerRange = 2, category = "numbers" },
		
		sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 80, blankLocation = 4, skip = 1, startNum = "random", patternLength = 3, numChoices = 3 }
	},
	{
		gameType = "matching",
		question = { line1 = "Touch a number, then a card", line2 = "with the same number of items.", scale = .8, offsetY = -67 },
		cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 3, endRange = 10, category = "numbersToGroups" },
		matching = { mode = "showme", layout = 5, numRandom = true }
	},
	{
		gameType = "touchCounting",
		nextWaypoint = false,
		question = { scale = .9, offsetY = -65 },
		cards = { scale = 1, offsetX = 0, offsetY = 50, startRange = 6, endRange = 10, answerRange = 2, category = "numbers" },
		
		questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
	},
	{
		gameType = "question",
		nextWaypoint = false,
		grayBGY = 118,
		question = { spacing = 30, scale = .8, offsetY = -67 },
		cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 5, answerRange = 2, category = "apples" },
		
		questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
	},
}
