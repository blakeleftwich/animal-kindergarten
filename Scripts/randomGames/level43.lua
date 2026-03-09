--Percival The Puppy:
return {

	{
			gameType = "touchCounting",
			nextWaypoint = false,
			question = { scale = .9, offsetY = -65 },
			cards = { scale = 1, offsetX = 0, offsetY = 50, startRange = 3, endRange = 5, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
			
	
	},
	{
			gameType = "question",
			nextWaypoint = false,
			grayBGY = 110,
			question = { offsetY = -67 },
			cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 11, endRange = 19, answerRange = 3, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = false, imageCount = "random", skip = 1 }
	},
	{
			gameType = "basket",
			nextWaypoint = false,
			question = { scale = .85, offsetY = -65 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 6, endRange = 10, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, numExtraMin = 0, numExtraMax = 0, imageCount = "random", skip = 1 }
				
	},
	{
			
			gameType = "counting",
			nextWaypoint = false,
			question = { offsetY = -67 },
			cards = { scale = .95, offsetX = 0, offsetY = -35, startRange = 30, endRange = 70, category = "numbers" },
			
			counting = { rowNum = 4, columnNum = 2, spacing = 10, startNum = "random", skip = 1 }
	},
	{
			gameType = "touchCounting",
			nextWaypoint = false,
			question = { scale = .9, offsetY = -65 },
			cards = { scale = 1, offsetX = 0, offsetY = 50, startRange = 8, endRange = 10, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
	},
	{
			gameType = "matching",
			question = { line1 = "Touch a number, then a card", line2 = "with the same number of items.", scale = .8, offsetY = -67 },
			cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 1, endRange = 5, category = "numbersToGroups" },
			matching = { mode = "showme", layout = 5, numRandom = true }
	},
	{
			
			gameType = "counting",
			nextWaypoint = false,
			question = { offsetY = -67 },
			cards = { scale = 1, offsetX = 0, offsetY = -50, startRange = 7, endRange = 80, category = "numbers" },
			
			counting = { rowNum = 5, columnNum = 1, spacing = 10, startNum = "random", skip = 1 }
	},
	
	{
			gameType = "touchCounting",
			nextWaypoint = false,
			question = { scale = .9, offsetY = -65 },
			cards = { scale = 1, offsetX = 0, offsetY = 50, startRange = 3, endRange = 10, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
	},
	{
			gameType = "matching",
			question = { line1 = "Touch a number, then a card", line2 = "with the same number of items.", scale = .8, offsetY = -67 },
			cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 1, endRange = 10, category = "numbersToGroups" },
			matching = { mode = "showme", layout = 5, numRandom = true }
	},
	{
			
			gameType = "counting",
			nextWaypoint = false,
			question = { offsetY = -67 },
			cards = { scale = .95, offsetX = 0, offsetY = -35, startRange = 60, endRange = 99, category = "numbers" },
			
			counting = { rowNum = 4, columnNum = 2, spacing = 10, startNum = "random", skip = 1 }
	},
	{
			gameType = "touchCounting",
			question = { scale = .9, offsetY = -65 },
			cards = { scale = 1, offsetX = 0, offsetY = 50, startRange = 4, endRange = 10, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
	},
	-- {
			-- gameType = "puzzle",
			-- nextWaypoint = false, --false,
			-- grayBGY = 140,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 10, answerRange = 2, category = "numbers" },
			
			-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 },
			-- puzzle = { imageSet = "Num", typeSet = "Color", number = "random", minRand = 9, maxRand = 10, maskSet = 3, otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "slotAlpha", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
	-- },		
	{
			gameType = "touchCounting",
			nextWaypoint = false,
			question = { scale = .9, offsetY = -65 },
			cards = { scale = 1, offsetX = 0, offsetY = 50, startRange = 5, endRange = 10, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
	},			
	{
			
			gameType = "counting",
			question = { offsetY = -67 },
			cards = { scale = .95, offsetX = 0, offsetY = -35, startRange = 10, endRange = 99, category = "numbers" },
			
			counting = { rowNum = 4, columnNum = 2, spacing = 10, startNum = "random", skip = 1 }
	},
	{
			gameType = "matching",
			nextWaypoint = false,
			question = { line1 = "Touch a number, then a card", line2 = "with the same number of items.", scale = .8, offsetY = -67 },
			cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 1, endRange = 10, category = "numbersToGroups" },
			matching = { mode = "showme", layout = 5, numRandom = true }
	},
	{
			
			gameType = "counting",
			nextWaypoint = false,
			question = { offsetY = -67 },
			cards = { scale = .95, offsetX = 0, offsetY = -35, startRange = 12, endRange = 99, category = "numbers" },
			
			counting = { rowNum = 4, columnNum = 2, spacing = 10, startNum = "random", skip = 1 }
	},
	{
			gameType = "touchCounting",
			question = { scale = .9, offsetY = -65 },
			cards = { scale = 1, offsetX = 0, offsetY = 50, startRange = 4, endRange = 10, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
	},
	
	
}
