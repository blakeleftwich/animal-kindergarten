--Percival The Puppy:
return {
	game1 = {
			gameType = "question",
			nextWaypoint = false,
			grayBGY = 118,
			question = { spacing = 30, scale = .8, offsetY = -67 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "apples" },
			
			questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
	},
	game2 = {
			gameType = "question",
			nextWaypoint = false,
			grayBGY = 116,
			question = { spacing = 30, scale = .8, offsetY = -72 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 3, answerRange = 2, category = "apples" },
			questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
	},
	game3 = {
			gameType = "question",
			nextWaypoint = false,
			grayBGY = 118,
			question = { spacing = 30, scale = .8, offsetY = -67 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 4, endRange = 5, answerRange = 2, category = "apples" },
			
			questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
	},
	game4 = {
			gameType = "question",
			nextWaypoint = false,
			grayBGY = 118,
			question = { spacing = 30, scale = .8, offsetY = -67 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "apples" },
			
			questions = { questionType1 = "How many apples", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
	},
	game5 = {
			gameType = "question",
			grayBGY = 116,
			question = { spacing = 30, scale = .8, offsetY = -72 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 3, answerRange = 2, category = "apples" },
			questions = { questionType1 = "How many apples", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
	},
	game6 = {
			gameType = "question",
			nextWaypoint = false,
			grayBGY = 118,
			question = { spacing = 30, scale = .8, offsetY = -67 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 4, endRange = 5, answerRange = 2, category = "apples" },
			
			questions = { questionType1 = "How many apples", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
	},
	game7 = {
			gameType = "question",
			nextWaypoint = false,
			grayBGY = 116,
			question = { spacing = 30, scale = .8, offsetY = -72 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
			questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
	},
	game8 = {
			gameType = "question",
			nextWaypoint = false,				
			question = { offsetY = -65 },
			cards = { scale = .95, offsetX = 0, offsetY = -50, startRange = 3, endRange = 5, answerRange = 2, category = "numbersDots" },
			
			questions = { questionType1 = "Which 2 numbers add up to", questionType2 = "random", numAnswers = 2, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }	
			
	},
	game9 = {
			gameType = "question",
			nextWaypoint = false,				
			question = { offsetY = -65 },
			cards = { scale = .95, offsetX = 0, offsetY = -50, startRange = 3, endRange = 5, answerRange = 2, category = "numbersDots" },
			
			questions = { questionType1 = "Which 2 numbers add up to", questionType2 = "random", numAnswers = 2, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }	
			
	},
	game10 = {
			gameType = "equation",
			grayBGY = 110,
			question = { line1 = "Solve the equation.", offsetY = -65 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbersDots" },
			equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
	},
	game11 = {
			gameType = "equation",
			nextWaypoint = false,
			grayBGY = 110,
			question = { line1 = "Solve the equation.", offsetY = -65 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 3, answerRange = 2, category = "numbersDots" },
			equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
	},
	game12 = {
			gameType = "equation",
			nextWaypoint = false,
			grayBGY = 110,
			question = { line1 = "Solve the equation.", offsetY = -65 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
			
			equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
	},
	
	game13 = {
			gameType = "equation",
			nextWaypoint = false,
			grayBGY = 110,
			question = { line1 = "Solve the equation.", offsetY = -65 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbersDots" },
			
			equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
	},
	game14 = {
			gameType = "equation",
			nextWaypoint = false,
			grayBGY = 110,
			question = { line1 = "Solve the equation.", offsetY = -65 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbersDots" },
			
			equations = { sign = "random", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
	},
	
	game15 = {
			gameType = "equation",
			grayBGY = 110,
			question = { line1 = "Solve the equation.", offsetY = -65 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbersDots" },
			
			equations = { sign = "random", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
	},
	game16 = {
			gameType = "equation",
			nextWaypoint = false,
			grayBGY = 110,
			question = { line1 = "Solve the equation.", offsetY = -65 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
			
			equations = { sign = "random", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
	},
	game17 = {
			gameType = "question",
			nextWaypoint = false,
			grayBGY = 118,
			question = { spacing = 30, scale = .8, offsetY = -72 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
	},
	game18 = {
			gameType = "question",
			nextWaypoint = false,
			grayBGY = 116,
			question = { spacing = 30, scale = .8, offsetY = -72 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
	},
	game19 = {
			gameType = "question",
			nextWaypoint = false,
			grayBGY = 116,
			question = { spacing = 30, scale = .8, offsetY = -72 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many apples", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
	},
	game20 = {
			gameType = "question",
			grayBGY = 118,
			question = { spacing = 30, scale = .8, offsetY = -72 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many apples", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
	},
	game21 = {
			gameType = "equation",
			nextWaypoint = false,
			grayBGY = 110,
			question = { line1 = "Solve the equation.", offsetY = -65 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbers" },
			
			equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
	},
	game22 = {
			gameType = "equation",
			nextWaypoint = false,
			grayBGY = 110,
			question = { line1 = "Solve the equation.", offsetY = -65 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbers" },
			
			equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
	},
	
	
	
	
	
	
	game23 = {
			gameType = "equation",
			nextWaypoint = false,
			grayBGY = 110,
			question = { line1 = "Solve the equation.", offsetY = -65 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 2, endRange = 5, answerRange = 2, category = "numbers" },
			
			equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
	},
	game24 = {
			gameType = "equation",
			nextWaypoint = false,
			grayBGY = 110,
			question = { line1 = "Solve the equation.", offsetY = -65 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbers" },
			
			equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
	},
	game25 = {
			gameType = "equation",
			grayBGY = 110,
			question = { line1 = "Solve the equation.", offsetY = -65 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbers" },
			
			equations = { sign = "random", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
	},
	
	game26 = {
			gameType = "equation",
			nextWaypoint = false,
			grayBGY = 110,
			question = { line1 = "Solve the equation.", offsetY = -65 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbers" },
			
			equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
	},
	game27 = {
			gameType = "equation",
			nextWaypoint = false,
			grayBGY = 110,
			question = { line1 = "Solve the equation.", offsetY = -65 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbers" },
			
			equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
	},
	
	
	
	
	
	
	game28 = {
			gameType = "equation",
			nextWaypoint = false,
			grayBGY = 110,
			question = { line1 = "Solve the equation.", offsetY = -65 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 2, endRange = 5, answerRange = 2, category = "numbers" },
			
			equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
	},
	game29 = {
			gameType = "equation",
			nextWaypoint = false,
			grayBGY = 110,
			question = { line1 = "Solve the equation.", offsetY = -65 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbers" },
			
			equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
	},
	game30 = {
			gameType = "equation",
			grayBGY = 110,
			question = { line1 = "Solve the equation.", offsetY = -65 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbers" },
			
			equations = { sign = "random", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
	},
	
}
