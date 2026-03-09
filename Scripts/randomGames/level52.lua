--Percival The Puppy: Counting to 10
return {
	game1 = {
			gameType = "matching",
			question = { line1 = "Touch a number, then a card", line2 = "with the same number of items.", scale = .8, offsetY = -34 },
			cards = { scale = .9, offsetX = 0, offsetY = -12, startRange = 5, endRange = 10, category = "numbersToGroups" },
			matching = { mode = "showme", layout = 5, numRandom = true }
	},
	game2 = {
			gameType = "question",
			nextWaypoint = false,
			question = { offsetY = -30 },
			cards = { scale = .9, offsetX = 0, offsetY = -28, startRange = 10, endRange = 14, answerRange = 3, category = "numbers" },
			questions = { questionType1 = "Which number is", questionType2 = "last", numAnswers = 1, numChoices = 3, scattered = false, imageCount = 12, skip = 1 }
	},
	
	game3 = {
			gameType = "counting",
			question = { offsetY = -33 },
			cards = { scale = .85, offsetX = 0, offsetY = -20, startRange = 8, endRange = 15, category = "numbers" },
			counting = { rowNum = 2, columnNum = 2, spacing = 11, startNum = "random", skip = 1 }
	},
	game4 = {
			gameType = "question",
			nextWaypoint = false,
			question = { offsetY = -30 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 11, endRange = 15, answerRange = 3, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = false, imageCount = "random", skip = 1 }
	},
	game5 = {
			gameType = "counting",
			question = { offsetY = -30 },
			cards = { scale = .85, offsetX = 0, offsetY = -20, startRange = 8, endRange = 19, category = "numbers" },
			
			counting = { rowNum = 4, columnNum = 2, spacing = 11, startNum = "random", skip = 1 }
	},
	
	game6 = {
			gameType = "question",
			nextWaypoint = false,
			question = { offsetY = -30 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 14, endRange = 18, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = false, imageCount = "random", skip = 1 }
	},
	game7 = {
			gameType = "question",
			question = { offsetY = -30 },
			cards = { scale = .9, offsetX = 0, offsetY = -28, startRange = 16, endRange = 19, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "Which number is", questionType2 = "FirstLast", numAnswers = 1, numChoices = 3, scattered = false, imageCount = 12, skip = 1 }
	},
	
	
	game8 = {
			gameType = "question",
			nextWaypoint = false,
			question = { offsetY = -30 },
			cards = { scale = .9, offsetX = 0, offsetY = -28, startRange = 14, endRange = 20, answerRange = 3, category = "numbers" },
			
			questions = { questionType1 = "Which number is", questionType2 = "FirstLast", numAnswers = 1, numChoices = 4, scattered = false, imageCount = 12, skip = 1 }
	},
	game9 = {
			gameType = "counting",
			question = { offsetY = -30 },
			cards = { scale = .85, offsetX = 0, offsetY = -20, startRange = 10, endRange = 20, category = "numbers" },
			
			counting = { rowNum = 5, columnNum = 2, spacing = 11, startNum = "random", skip = 1 }
	},
	game10 = {
	
			gameType = "question",
			nextWaypoint = false,
			question = { offsetY = -30 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 14, endRange = 19, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = false, imageCount = "random", skip = 1 }
			
			
	},		
	game11 = {
			gameType = "question",
			question = { offsetY = -30 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 16, endRange = 20, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = false, imageCount = "random", skip = 1 }
	},
	
}
