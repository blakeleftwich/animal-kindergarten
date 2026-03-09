--Chauncey The Mouse: Skip Counting
return {
	game1 = {
			gameType = "question",
			question = { offsetY = -30 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 4, endRange = 10, answerRange = 2, category = "numbers" },
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 2 }
			
	},
	game2 = {
			gameType = "counting",
			nextWaypoint = false,
			question = { offsetY = -30 },
			cards = { scale = .9, offsetX = 0, offsetY = -28, startRange = 1, endRange = 10, category = "numbers" },
			counting = { rowNum = 5, columnNum = 1, spacing = 10, startNum = 2, skip = 2 }
	},
	game3 = {
			gameType = "sequence",
			question = { line1 = "What comes next?", offsetY = -30 },
			cards = { scale = .85, offsetX = 0, offsetY = 60, startRange = 6, endRange = 10, answerRange = 2, category = "numbers" },
			sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 80, blankLocation = 4, skip = 2, startNum = 2, patternLength = 3, numChoices = 3 }
	},
	game4 = {
			gameType = "question",
			nextWaypoint = false,
			question = { offsetY = -30 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 10, endRange = 25, answerRange = 2, category = "numbers" },
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 5 }
	},
	game5 = {
			gameType = "counting",
			question = { offsetY = -30 },
			cards = { scale = .85, offsetX = 0, offsetY = -18, startRange = 10, endRange = 30, category = "numbers" },
			counting = { rowNum = 3, columnNum = 2, spacing = 11, startNum = 5, skip = 5 }
	},
	game6 = {
			gameType = "sequence",
			nextWaypoint = false,
			question = { line1 = "What comes next?", offsetY = -30 },
			cards = { scale = .85, offsetX = 0, offsetY = 60, startRange = 15, endRange = 25, answerRange = 2, category = "numbers" },
			sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 80, blankLocation = 4, skip = 5, startNum = 5, patternLength = 3, numChoices = 3 }
	},
	game7 = {
			gameType = "question",
			question = { offsetY = -30 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 30, endRange = 50, answerRange = 2, category = "numbers" },
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 10 }
	},
	game8 = {
			gameType = "sequence",
			question = { line1 = "What comes next?", offsetY = -30 },
			cards = { scale = .85, offsetX = 0, offsetY = 60, startRange = 35, endRange = 45, answerRange = 2, category = "numbers" },
			sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 100, blankLocation = 4, skip = 10, startNum = 10, patternLength = 3, numChoices = 3 }
	},
	game9 = {
			gameType = "counting",
			question = { offsetY = -30 },
			cards = { scale = .85, offsetX = 0, offsetY = -18, startRange = 20, endRange = 100, category = "numbers" },
			counting = { rowNum = 5, columnNum = 2, spacing = 11, startNum = 10, skip = 10 }
	},	
}
