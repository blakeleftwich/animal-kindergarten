--Cordelia Subtraction Mix Up
return {
	game1 = {
			gameType = "question",
			grayBGY = 115,
			question = { spacing = 30, scale = .78, offsetY = -69 },
			cards = { scale = .98, offsetX = 0, offsetY = 35, startRange = 1, endRange = 5, answerRange = 4, category = "apples" },
			
			questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
	},
	-- game1 = {
			-- gameType = "question",
			-- nextWaypoint = true,
			-- grayBGY = 115,
			-- question = { line1 = "", line2 = "", spacing = 30, scale = .78, offsetX = 0, offsetY = -69},
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = .98, offsetX = 0, offsetY = 35, startRange = 2, endRange = 5, answerRange = 2, category = "apples" },
			
			-- questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
	-- },
	game2 = {
			gameType = "question",
			nextWaypoint = false,
		cards = { spacing = 75, scale = 1.75, offsetX = 0, offsetY = -42, startRange = 1, endRange = 5, answerRange = 3, category = "numbers" },
			
			questions = { questionType1 = "Which is", questionType2 = "less than", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = "randomRange", skipMin = 1, skipMax = 5 }
	},	
	game3 = {
			gameType = "equation",
			grayBGY = 110,
			question = { line1 = "Solve the equation.", offsetY = -65 },
			equation = { scale = 0.85, offsetY = 9 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 6, answerRange = 2, category = "numbersDots" },
			
			equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
	},
	game4 = {
			gameType = "question",
			nextWaypoint = false,
			grayBGY = 115,
			question = { spacing = 30, scale = .78, offsetY = -69 },
			cards = { scale = .98, offsetX = 0, offsetY = 35, startRange = 1, endRange = 8, answerRange = 3, category = "numbers" },
			
			questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 1 }	
	},
	game5 = {
			gameType = "question",
			cards = { spacing = 75, scale = 1.75, offsetX = 0, offsetY = -42, startRange = 4, endRange = 50, answerRange = 3, category = "numbers" },
			
			questions = { questionType1 = "Which is", questionType2 = "less than", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = "randomRange", skipMin = 1, skipMax = 5 }
	},	
	game6 = {
			gameType = "equation",
			grayBGY = 110,
			question = { line1 = "Solve the equation.", offsetY = -65 },
			equation = { scale = 0.85, offsetY = 9 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 8, answerRange = 3, category = "numbersDots" },
			
			equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 4, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
	},
	game7 = {
			gameType = "equation",
			grayBGY = 110,
			question = { line1 = "Solve the equation.", offsetY = -65 },
			equation = { scale = .85, offsetY = 3 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 6, answerRange = 2, category = "numbers" },
			equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
	},
	game8 = {
			gameType = "equation",
			grayBGY = 110,
			question = { line1 = "Solve the equation.", offsetY = -65 },
			equation = { scale = .85, offsetY = 3 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 10, answerRange = 3, category = "numbers" },
			equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 4, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
	},
	
}
