return {
	{
		gameType = "puzzle",
		question = { offsetY = -65 },
		cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 3, answerRange = 2, category = "numbers" },
		
		questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 },
		puzzle = { imageSet = "Num", typeSet = "Color", number = "random", minRand = 5, maxRand = 10, maskSet = 3, otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "slotAlpha", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
			
	},
	{
		gameType = "puzzleSlots",
		nextWaypoint = false, --false,
		question = { offsetY = -65 },
		cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 9, answerRange = 2, category = "numbers" },
		
		questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 },
		puzzle = { imageSet = "NumDifficult", number = "random", minRand = 11, maxRand = 20, incorrectChoices = 2, maskSet = 3, otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "slotAlpha", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
			
	},
	{
		gameType = "puzzleSlots",
		nextWaypoint = false, --false,
		question = { offsetY = -65 },
		cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 10, answerRange = 2, category = "numbers" },
		
		questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 5, numChoices = 3, scattered = true, imageCount = "random", skip = 1 },
		puzzle = { imageSet = "", number = "random", minRand = 1, maxRand = 10, incorrectChoices = 0, maskSet = 3, otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "slotAlpha", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
			
	},
	{
		gameType = "puzzle",
		question = { offsetY = -65 },
		cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 3, answerRange = 2, category = "numbers" },
		
		questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 },
		puzzle = { imageSet = "Objects", typeSet = "Shapes", number = "random", minRand = 5, maxRand = 5, maskSet = 3, otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "slotAlpha", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
			
	},
	{
		gameType = "puzzle",
		question = { offsetY = -65 },
		cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 3, answerRange = 2, category = "numbers" },
		
		questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 },
		puzzle = { imageSet = "Objects", typeSet = "Color", number = "random", minRand = 5, maxRand = 5, maskSet = 3, otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "slotAlpha", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
			
	},
}
