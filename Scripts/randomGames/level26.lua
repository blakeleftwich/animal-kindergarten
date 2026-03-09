--Chauncey The Mouse: Comprehensive
return {
	game1 = {
			gameType = "question",
			nextWaypoint = false,
			grayBGY = 110,
			question = { offsetY = -67 },
			cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 10, endRange = 13, answerRange = 3, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = false, imageCount = "random", skip = 1 }
	},
	game2 = {
			gameType = "matching",
			question = { line1 = "Touch a number, then a card", line2 = "with the same number of items.", scale = .8, offsetY = -67 },
			cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 4, endRange = 8, category = "numbersToGroups" },
			matching = { mode = "showme", layout = 5, numRandom = true }
	},
	
	
	
	game3 = {
			gameType = "question",
			nextWaypoint = false,
			grayBGY = 110,
			question = { offsetY = -67 },
			cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 4, endRange = 8, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 10, skip = 1 }
	},
	game4 = {
			gameType = "question",
			grayBGY = 110,
			question = { offsetY = -67 },
			cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 5, endRange = 9, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 10, skip = 1 }
	},
	game5 = {
			gameType = "sequence",
			nextWaypoint = false,
			grayBGY = 110,
			question = { line1 = "What's missing?", offsetY = -67 },
			cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 6, endRange = 11, answerRange = 2, category = "numbers" },
			sequence = { numItems = 5, itemsScale = .875, itemsSpacing = 90, blankLocation = "random", skip = 1, startNum = 8, patternLength = 4, numChoices = 3 }
	},
	game6 = {
			gameType = "question",
			question = { offsetY = -65 },
			cards = { scale = 1, offsetX = 0, offsetY = -50, startRange = 8, endRange = 20, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "Which number is", questionType2 = "FirstLast", numAnswers = 1, numChoices = 4, scattered = false, imageCount = 12, skip = 1 }
	},	
	game7 = {
			gameType = "sequence",
			nextWaypoint = false,
			grayBGY = 110,
			question = { line1 = "What's missing?", offsetY = -67 },
			cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 9, endRange = 15, answerRange = 3, category = "numbers" },
			sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 90, blankLocation = "random", skip = 1, startNum = 10, patternLength = 4, numChoices = 3 }
	},
		
	game8 = {
			gameType = "matching",
			question = { line1 = "Touch a number, then a card", line2 = "with the same number of items.", scale = .8, offsetY = -67 },
			cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 6, endRange = 10, category = "numbersToGroups" },
			matching = { mode = "showme", layout = 5, numRandom = true }
	},
	game9 = {
			gameType = "question",
			nextWaypoint = false,
			grayBGY = 110,
			question = { offsetY = -67 },
			cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 6, endRange = 10, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = false, imageCount = 18, skip = 1 }
	},
	game10 = {
			gameType = "question",
			grayBGY = 110,
			question = { offsetY = -67 },
			cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 5, endRange = 10, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = false, imageCount = 18, skip = 1 }
	},
	game11 = {
			gameType = "question",
			nextWaypoint = false,
			question = { offsetY = -65 },
			cards = { scale = 1, offsetX = 0, offsetY = -50, startRange = 9, endRange = 20, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "Which number is", questionType2 = "FirstLast", numAnswers = 1, numChoices = 4, scattered = false, imageCount = 12, skip = 1 }
	},
	game12 = {
			gameType = "matching",
			nextWaypoint = false,
			question = { line1 = "Touch a number, then a card", line2 = "with the same number of items.", scale = .8, offsetY = -67 },
			cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 7, endRange = 10, category = "numbersToGroups" },
			matching = { mode = "showme", layout = 5, numRandom = true }
	},
	game13 = {
			gameType = "sequence",
			grayBGY = 110,
			question = { line1 = "What's missing?", offsetY = -67 },
			cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 15, endRange = 20, answerRange = 2, category = "numbers" },
			sequence = { numItems = 5, itemsScale = .875, itemsSpacing = 90, blankLocation = "random", skip = 1, startNum = 15, patternLength = 4, numChoices = 4 }
	},
	
	
}
