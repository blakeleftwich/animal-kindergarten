return {
	{
			gameType = "question",
			nextWaypoint = false,
			question = { spacing = 30, scale = .8, offsetY = -41.5 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 3, answerRange = 2, category = "apples" },
			questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
	},
	{
			gameType = "sequence",
			grayBGY = 110,
			question = { line1 = "What's missing?", offsetY = -67 },
			cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 10, endRange = 100, answerRange = 2, category = "numbers" },
			sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 90, blankLocation = "random", skip = 1, startNum = "random", patternLength = 4, numChoices = 4 }
	},
	{				
			gameType = "counting",
			nextWaypoint = false,
			question = { offsetY = -67 },
			cards = { scale = 1, offsetX = 0, offsetY = -50, startRange = 40, endRange = 50, category = "numbers" },
			
			counting = { rowNum = 5, columnNum = 1, spacing = 10, startNum = "random", skip = 1 }
	},
	-- {
			-- gameType = "sequence",
			-- nextWaypoint = true,
			-- grayBGY = 110,
			-- question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 50, endRange = 100, answerRange = 2, category = "numbers" },
			-- sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 90, blankLocation = "random", skip = 1, startNum = "random", patternLength = 4, numChoices = 4 }
	-- },
	{
			
			gameType = "counting",
			nextWaypoint = false,
			question = { offsetY = -67 },
			cards = { scale = 1, offsetX = 0, offsetY = -50, startRange = 3, endRange = 50, category = "numbers" },
			
			counting = { rowNum = 5, columnNum = 1, spacing = 10, startNum = "random", skip = 1 }
	},
	{
			gameType = "sequence",
			grayBGY = 110,
			question = { line1 = "What's missing?", offsetY = -67 },
			cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 50, endRange = 100, answerRange = 2, category = "numbers" },
			sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 90, blankLocation = "random", skip = 1, startNum = 15, patternLength = 4, numChoices = 4 }
	},
	
	{
			
			gameType = "counting",
			question = { offsetY = -67 },
			cards = { scale = .95, offsetX = 0, offsetY = -35, startRange = 3, endRange = 100, category = "numbers" },
			
			counting = { rowNum = 4, columnNum = 2, spacing = 10, startNum = "random", skip = 1 }
	},
	{
			gameType = "sequence",
			grayBGY = 110,
			question = { line1 = "What's missing?", offsetY = -67 },
			cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 3, endRange = 100, answerRange = 2, category = "numbers" },
			sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 90, blankLocation = "random", skip = 1, startNum = 15, patternLength = 4, numChoices = 4 }
	},
	{
			
			gameType = "counting",
			question = { offsetY = -67 },
			cards = { scale = 1, offsetX = 0, offsetY = -50, startRange = 3, endRange = 100, category = "numbers" },
			
			counting = { rowNum = 5, columnNum = 1, spacing = 10, startNum = "random", skip = 1 }
	},
	
	
	
	
	{
			gameType = "sequence",
			grayBGY = 110,
			question = { line1 = "What's missing?", offsetY = -67 },
			cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 10, endRange = 20, answerRange = 2, category = "numbers" },
			sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 90, blankLocation = "random", skip = 1, startNum = 15, patternLength = 4, numChoices = 4 }
	},
	{
			gameType = "sequence",
			grayBGY = 110,
			question = { line1 = "What's missing?", offsetY = -67 },
			cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 10, endRange = 20, answerRange = 2, category = "numbers" },
			sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 90, blankLocation = "random", skip = 1, startNum = 15, patternLength = 4, numChoices = 4 }
	},
	{
			gameType = "sequence",
			grayBGY = 110,
			question = { line1 = "What's missing?", offsetY = -67 },
			cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 10, endRange = 20, answerRange = 2, category = "numbers" },
			sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 90, blankLocation = "random", skip = 1, startNum = 15, patternLength = 4, numChoices = 4 }
	},
}
