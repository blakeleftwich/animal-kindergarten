--Cordelia Review 5 Going Up
return {
	
	game1 = {
			gameType = "puzzleSlots",
			question = { scale = .9, offsetY = -36 },
			cards = { scale = 1.55, offsetX = 0, offsetY = 50, startRange = 1, endRange = 99, answerRange = 10, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 4, scattered = true, imageCount = 4, skip = "none", skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
			puzzle = { imageSet = "CardsPutInOrderClassicDifficult", number = "random", minRand = 1, maxRand = 99, incorrectChoices = 0, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
	

			
	},
	game2 = {
			gameType = "basketGreaterLessThan",
			question = { scale = .7, offsetY = -65 },
			cards = { scale = .8, offsetX = 0, offsetY = 0, startRange = 3, endRange = 5, numStartRange = 5, numEndRange = 99, numCorrectMin = 2, numCorrectMax = 4, answerRange = 10, category = "numbers" },
			questions = { questionType1 = "basketGreaterLessThan", questionType2 = "greater than", numAnswers = 1, numChoices = 5, scattered = true, numExtraMin = 1, numExtraMax = 2, imageCount = 4, skip = 1 }
	},
	
	
	
	game3 = {
			gameType = "question",
			nextWaypoint = false,
			cards = { spacing = 60, scale = 1.4, offsetX = 0, offsetY = -42, startRange = 20, endRange = 99, answerRange = 3, category = "numbers" },
			questions = { questionType1 = "Which is", questionType2 = "more than", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = 1, skipMin = 1, skipMax = 5 }
	},	
	
	game4 = {
			gameType = "question",
			grayBGY = 115,
			question = { spacing = 30, scale = .78, offsetY = -69 },
			cards = { scale = .98, offsetX = 0, offsetY = 35, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
			
			questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
	},
	
	game5 = {
			
			gameType = "counting",
			question = { offsetY = -67 },
			cards = { scale = .95, offsetX = 0, offsetY = -35, startRange = 10, endRange = 40, category = "numbers" },
			
			counting = { rowNum = 3, columnNum = 2, spacing = 10, startNum = "random", skip = 10, placeMatch = 10 }
	},
	
	
	game6 = {
			gameType = "basketGreaterLessThan",
			nextWaypoint = false,
			question = { scale = .7, offsetY = -65 },
			cards = { scale = .8, offsetX = 0, offsetY = 0, startRange = 3, endRange = 5, numStartRange = 5, numEndRange = 50, numCorrectMin = 2, numCorrectMax = 4, answerRange = 4, category = "numbers" },
			questions = { questionType1 = "basketGreaterLessThan", questionType2 = "greater than", numAnswers = 1, numChoices = 5, scattered = true, numExtraMin = 1, numExtraMax = 2, imageCount = 4, skip = 1 }
	},
	game7 = {
			gameType = "question",
			cards = { spacing = 60, scale = 1.4, offsetX = 0, offsetY = -42, startRange = 30, endRange = 99, answerRange = 3, category = "numbers" },
			questions = { questionType1 = "Which is", questionType2 = "more than", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = 1, skipMin = 1, skipMax = 5 }
	},	
	
	game8 = {
			gameType = "question",
			grayBGY = 115,
			question = { spacing = 30, scale = .78, offsetY = -69 },
			cards = { scale = .96, offsetX = 0, offsetY = 35, startRange = 2, endRange = 5, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
			
	},
	
	

		

	
	

	
	
	
	
	
}
