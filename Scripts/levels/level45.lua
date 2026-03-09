--Dudley Addition Mix Up
return {
	
	game1 = {
			gameType = "question",
			grayBGY = 115,
			question = { spacing = 30, scale = .78, offsetY = -69 },
			cards = { scale = .98, offsetX = 0, offsetY = 35, startRange = 3, endRange = 5, answerRange = 2, category = "apples" },
			
			questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
	},
	game2 = {
			gameType = "question",
			nextWaypoint = false,
			cards = { spacing = 60, scale = 1.4, offsetX = 0, offsetY = -42, startRange = 25, endRange = 39, answerRange = 3, category = "numbers" },
			questions = { questionType1 = "Which is", questionType2 = "more than", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = 10, skipMin = 10, skipMax = 10 }
	},	
	game3 = {
			gameType = "question",
			question = { offsetY = -65 },
			cards = { spacing = 60, scale = 1.4, offsetX = 0, offsetY = -42, startRange = 4, endRange = 7, answerRange = 3, category = "numbers" },
			
			questions = { questionType1 = "Which 2 numbers add up to", questionType2 = "random", numAnswers = 2, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }	
			
	},
	game4 = {
			gameType = "equation",
			grayBGY = 110,
			question = { line1 = "Solve the equation.", offsetY = -65 },
			equation = { scale = 0.85, offsetY = 9 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbersDots" },
			
			equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
	},
	game5 = {
			gameType = "question",
			grayBGY = 115,
			question = { spacing = 30, scale = .78, offsetY = -69 },
			cards = { scale = .98, offsetX = 0, offsetY = 35, startRange = 4, endRange = 5, answerRange = 2, category = "numbersDots" },
			
			questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
	},
	

	game6 = {
			gameType = "equation",
			nextWaypoint = false,
			grayBGY = 110,
			question = { line1 = "Solve the equation.", offsetY = -65 },
			equation = { scale = .85, offsetY = 3 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 3, answerRange = 2, category = "numbers" },
			equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
	},
	game7 = {
			gameType = "question",
			grayBGY = 115,
			question = { spacing = 30, scale = .78, offsetY = -69 },
			cards = { scale = .98, offsetX = 0, offsetY = 35, startRange = 4, endRange = 5, answerRange = 3, category = "numbers" },
			
			questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 1 }	
	},
	game8 = {
			gameType = "equation",
			nextWaypoint = false,
			grayBGY = 110,
			question = { line1 = "Solve the equation.", offsetY = -65 },
			equation = { scale = .85, offsetY = 3 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 2, endRange = 5, answerRange = 2, category = "numbers" },
			equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
	},
	game9 = {
			gameType = "equation",
			grayBGY = 110,
			question = { line1 = "Solve the equation.", offsetY = -65 },
			equation = { scale = .85, offsetY = 3 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 3, category = "numbers" },
			equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 4, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
	},
	
}
