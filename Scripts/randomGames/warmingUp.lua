return {
	{
			gameType = "question",
			grayBGY = 120,
			question = { spacing = 30, scale = .8, offsetY = -67 },
			cards = { scale = .8, offsetX = 0, offsetY = 30, startRange = 1, endRange = 5, answerRange = 2, category = "numbersDots" },
			
			questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
	},
	{
			gameType = "basketGreaterLessThan",
			question = { scale = .9, offsetY = -65 },
			cards = { scale = .8, offsetX = 0, offsetY = 0, startRange = 5, endRange = 5, numStartRange = 5, numEndRange = 50, numCorrectMin = 1, numCorrectMax = 3, answerRange = 4, category = "numbers" },
			questions = { questionType1 = "basketGreaterLessThan", questionType2 = "greater than", numAnswers = 1, numChoices = 5, scattered = true, numExtraMin = 1, numExtraMax = 2, imageCount = 4, skip = 1 }
	},
	{
			gameType = "equation",
			grayBGY = 110,
			question = { line1 = "Solve the equation.", offsetY = -65 },
			equation = { scale = 0.85, offsetY = 9 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 5, answerRange = 2, category = "numbersDots" },
			
			equations = { sign = "random", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
	},
	{
			
							
			gameType = "matching",
			question = { line1 = "Match the cards with the", line2 = "same number of items.", scale = .8, offsetY = -69 },
			cards = { spacing = 76, vSpacing = 93, scale = 1.1, offsetX = 0, offsetY = -23, startRange = 6, endRange = 10, category = "groupsToGroups" },
			matching = { mode = "showme", classic = true, layout = 1, numRandom = true, showMeMode = 2 }
	},
	{
			gameType = "question",
			grayBGY = 120,
			question = { spacing = 30, scale = .8, offsetY = -67 },
			cards = { scale = .8, offsetX = 0, offsetY = 30, startRange = 1, endRange = 5, answerRange = 2, category = "numbersDots" },
			
			questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
	},
	{
			gameType = "equation",
			grayBGY = 110,
			question = { line1 = "Solve the equation.", offsetY = -65 },
			equation = { scale = 0.85, offsetY = 9 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 5, answerRange = 2, category = "numbersDots" },
			
			equations = { sign = "random", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
	},
	{
			gameType = "equation",
			grayBGY = 110,
			question = { line1 = "Solve the equation.", offsetY = -65 },
			equation = { scale = 0.85, offsetY = 9 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 5, answerRange = 2, category = "numbersDots" },
			
			equations = { sign = "random", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
	},
}
