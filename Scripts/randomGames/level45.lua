--Chauncey The Mouse:
return {
	game1 = {
			gameType = "question",
			nextWaypoint = false,
			grayBGY = 110,
			question = { offsetY = -67 },
			cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 2, endRange = 10, answerRange = 3, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
	},
	game2 = {
			gameType = "basket",
			question = { scale = .85, offsetY = -65 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 3, endRange = 10, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, numExtraMin = 0, numExtraMax = 0, imageCount = "random", skip = 1 }
				
	},
	game3 = {
			gameType = "question",
			nextWaypoint = false,
			grayBGY = 110,
			question = { offsetY = -67 },
			cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 5, endRange = 10, answerRange = 3, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
	},
	game4 = {
			gameType = "question",
			question = { scale = .9, offsetY = -65 },
			cards = { scale = 1, offsetX = 0, offsetY = -50, startRange = 1, endRange = 10, answerRange = 1, category = "groups" },
			
			questions = { questionType1 = "Which number is", questionType2 = "MostLeast", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
	},
	game5 = {
			gameType = "question",
			nextWaypoint = false,
			grayBGY = 110,
			question = { offsetY = -67 },
			cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 7, endRange = 10, answerRange = 3, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
	},
	game6 = {
			gameType = "puzzleSlots",
			question = { offsetY = -65 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 5, endRange = 10, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 },
			puzzle = { imageSet = "NumDifficult", number = "random", minRand = 12, maxRand = 17, incorrectChoices = 1, maskSet = 3, otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "slotAlpha", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
			
	},
	game7 = {
			gameType = "basket",
			nextWaypoint = false,
			question = { scale = .85, offsetY = -65 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 6, endRange = 10, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, numExtraMin = 0, numExtraMax = 0, imageCount = "random", skip = 1 }
				
	},
	game8 = {
			gameType = "question",
			grayBGY = 110,
			question = { offsetY = -67 },
			cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 11, endRange = 15, answerRange = 3, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
	},
	game9 = {
			gameType = "question",
			nextWaypoint = false,
			question = { scale = .9, offsetY = -30 },
			cards = { scale = .96, offsetX = 0, offsetY = -28, startRange = 1, endRange = 10, answerRange = 1, category = "groups" },
			
			questions = { questionType1 = "Which number is", questionType2 = "MostLeast", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
	},
	game10 = {
			gameType = "question",
			grayBGY = 110,
			question = { offsetY = -67 },
			cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 15, endRange = 20, answerRange = 3, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
	},
	game11 = {
			gameType = "puzzleSlots",
			nextWaypoint = false, --false,
			question = { offsetY = -65 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 5, endRange = 10, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 },
			puzzle = { imageSet = "NumDifficult", number = "random", minRand = 18, maxRand = 20, incorrectChoices = 1, maskSet = 3, otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "slotAlpha", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
			
	},
	game12 = {
			gameType = "question",
			grayBGY = 110,
			question = { offsetY = -67 },
			cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 17, endRange = 20, answerRange = 3, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
	},
}
