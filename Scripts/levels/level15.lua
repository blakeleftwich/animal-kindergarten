--Percival Puppy Build the Number
return {

	game1 = {
			gameType = "puzzleSlots",
			question = { offsetY = -65 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 12, endRange = 20, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 1 },
			puzzle = { imageSet = "Num", number = "random", minRand = 12, maxRand = 20, incorrectChoices = 2, maskSet = 3, otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "slotAlpha", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
			
	},
	game2 = {
			gameType = "puzzleSlots",
			nextWaypoint = false, --false,
			question = { offsetY = -65 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 32, endRange = 60, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 1 },
			puzzle = { imageSet = "NumDifficult", number = "random", minRand = 32, maxRand = 60, incorrectChoices = 2, maskSet = 3, otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "slotAlpha", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
			
	},
	game3 = {
			gameType = "puzzleSlots",
			question = { offsetY = -36 },
			cards = { scale = 1.4, offsetX = 0, offsetY = 50, startRange = 22, endRange = 30, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 1, skipPattern = "", startNum = "", order = "ascending" },
			puzzle = { imageSet = "CardsNum", number = "random", minRand = 22, maxRand = 30, incorrectChoices = 2, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
			
	},
	game4 = {
			gameType = "puzzleSlots",
			question = { offsetY = -65 },
			cards = { scale = 1.4, offsetX = 0, offsetY = 50, startRange = 63, endRange = 99, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 1 },
			puzzle = { imageSet = "CardsNum", number = "random", minRand = 63, maxRand = 99, incorrectChoices = 2, maskSet = 3, otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "slotAlpha", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
			
	},
	game5 = {
			
			gameType = "puzzleSlots",
			question = { offsetY = -65 },
			cards = { scale = 1.4, offsetX = 0, offsetY = 50, startRange = 1, endRange = 9, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 },
			puzzle = { imageSet = "CardsNumDifficult", number = "random", minRand = 32, maxRand = 60, incorrectChoices = 1, maskSet = 3, otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "slotAlpha", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
	
	},
	game6 = {
			
			gameType = "puzzleSlots",
			question = { offsetY = -36 },
			cards = { scale = 1.4, offsetX = 0, offsetY = 50, startRange = 77, endRange = 99, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1, skipPattern = "", startNum = "", order = "ascending" },
			puzzle = { imageSet = "CardsNumDifficult", number = "random", minRand = 77, maxRand = 99, incorrectChoices = 2, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
	
	},
	game7 = {
			
			gameType = "puzzleSlots",
			question = { offsetY = -36 },
			cards = { scale = 1.4, offsetX = 0, offsetY = 50, startRange = 62, endRange = 75, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 1, skipPattern = "", startNum = "", order = "ascending" },
			puzzle = { imageSet = "CardsNumDifficult", number = "random", minRand = 62, maxRand = 75, incorrectChoices = 3, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
	
	},
	
	
}
