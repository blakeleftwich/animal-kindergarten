return {
	
	{
			gameType = "question",
			nextWaypoint = false,
			grayBGY = 115,
			question = { spacing = 30, scale = .78, offsetY = -69 },
			cards = { scale = .98, offsetX = 0, offsetY = 35, startRange = 3, endRange = 10, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
	},
	-- game2 = {
			-- gameType = "basketGreaterLessThan",
			-- nextWaypoint = true,
			-- grayBGY = 140,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = .7, offsetX = 0, offsetY = -65 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = .8, offsetX = 0, offsetY = 0, startRange = 5, endRange = 5, numStartRange = 5, numEndRange = 50, numCorrectMin = 1, numCorrectMax = 3, answerRange = 2, category = "numbers" },
			-- questions = { questionType1 = "basketGreaterLessThan", questionType2 = "greater than", numAnswers = 1, numChoices = 5, scattered = true, numExtraMin = 0, numExtraMax = 0, imageCount = 4, skip = 1 }
	-- },
	
	{
			gameType = "equation",
			nextWaypoint = false,
			grayBGY = 110,
			question = { line1 = "Solve the equation.", offsetY = -65 },
			equation = { scale = 0.85, offsetY = 9 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 10, answerRange = 2, category = "numbers" },
			
			equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
	},
	
	
	-- game4 = {
			
							
			-- gameType = "matching",
			-- nextWaypoint = true,
			-- grayBGY = 140,
			-- question = { line1 = "Match picture cards that have", line2 = "the same number of items.", spacing = 20, scale = .8, offsetX = 0, offsetY = -69 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { spacing = 60, vSpacing = 93, scale = 1.25, offsetX = 0, offsetY = -13, startRange = 6, endRange = 10, category = "groupsToGroups" },
			-- matching = { mode = "showme", classic = true, layout = 1, numRandom = true, showMeMode = 2 }
	-- },
	{
			gameType = "question",
			nextWaypoint = false,
			grayBGY = 115,
			question = { spacing = 30, scale = .78, offsetY = -69 },
			cards = { scale = .98, offsetX = 0, offsetY = 35, startRange = 4, endRange = 10, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
	},
	{
			gameType = "equation",
			grayBGY = 110,
			question = { line1 = "Solve the equation.", offsetY = -65 },
			equation = { scale = 0.85, offsetY = 9 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 10, answerRange = 2, category = "numbersDots" },
			
			equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
	},
	
	{
			gameType = "sequence",
			nextWaypoint = false,
			grayBGY = 110,
			question = { line1 = "What's missing?", offsetY = -67 },
			equation = { scale = .8 },
			cards = { spacing = 41.5, scale = .95, offsetX = 0, offsetY = 33, startRange = 76, endRange = 99, answerRange = 10, category = "numbers" },
			
			sequence = { numItems = 5, itemsScale = .9, itemsSpacing = 80, blankLocation = "random", placeMatch = "random", skip = 1, startNum = "random", patternLength = 1, order = "ascending", numChoices = 3 }
	},
	{
			gameType = "sequence",
			nextWaypoint = false,
			grayBGY = 110,
			question = { line1 = "What's missing?", offsetY = -67 },
			equation = { scale = .8 },
			cards = { spacing = 41.5, scale = .95, offsetX = 0, offsetY = 33, startRange = 50, endRange = 99, answerRange = 10, category = "numbers" },
			
			sequence = { numItems = 5, itemsScale = .9, itemsSpacing = 80, blankLocation = "random", placeMatch = "random", skip = 1, startNum = "random", patternLength = 1, order = "ascending", numChoices = 3 }
	},
	
	
}
