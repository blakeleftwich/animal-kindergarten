--Ralphie the Cat: Counting to 5
return {
	game1 = {
			gameType = "equation",
			grayBGY = 110,
			question = { line1 = "Solve the equation.", offsetY = -65 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbers" },
			
			equations = { sign = "random", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		
	}, 
	game2 = {
			gameType = "puzzleSlots",
			question = { offsetY = -65 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 9, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 },
			puzzle = { imageSet = "Num", number = "random", minRand = 11, maxRand = 20, incorrectChoices = 3, maskSet = 3, otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "slotAlpha", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
			
	},
	-- game1 = {
			-- gameType = "question",
			-- nextWaypoint = false,
			-- grayBGY = 140,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -70 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = 1, offsetX = 0, offsetY = -35, startRange = 3, endRange = 10, answerRange = 1, category = "groups" },
			
			-- questions = { questionType1 = "Which number is", questionType2 = "MostLeast", numAnswers = 1, numChoices = 2, scattered = true, imageCount = "random", skip = 1 }
	-- },
	game3 = {
			gameType = "question",
			nextWaypoint = false,
			question = { scale = .9, offsetY = -70 },
			cards = { scale = 1, offsetX = 0, offsetY = -35, startRange = 3, endRange = 10, answerRange = 1, category = "groups" },
			
			questions = { questionType1 = "Which number is", questionType2 = "MostLeast", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
	},
	game4 = {
			
			gameType = "matching",
			question = { line1 = "Touch a number, then a card", line2 = "with the same number of items.", scale = .8, offsetY = -67 },
			cards = { scale = 1, offsetX = 0, offsetY = -35, startRange = 3, endRange = 7, category = "numbersToGroups" },
			
			matching = { mode = "memory", layout = 3, numRandom = true }	
	},
	game5 = {
			gameType = "question",
			nextWaypoint = false,
			grayBGY = 116,
			question = { spacing = 30, scale = .8, offsetY = -72 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many apples", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
	},
	game6 = {
			gameType = "question",
			nextWaypoint = false,				
			question = { offsetY = -65 },
			cards = { scale = .95, offsetX = 0, offsetY = -50, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
			
			questions = { questionType1 = "Which 2 numbers add up to", questionType2 = "random", numAnswers = 2, numChoices = 3, scattered = true, imageCount = 9, skip = 1 }	
			
	},
	game7 = {
			gameType = "question",
			question = { offsetY = -65 },
			cards = { scale = .95, offsetX = 0, offsetY = -50, startRange = 3, endRange = 10, answerRange = 2, category = "numbersDots" },
			
			questions = { questionType1 = "Which 2 numbers add up to", questionType2 = "random", numAnswers = 2, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }	
			
	},
	game8 = {
			
			gameType = "matching",
			nextWaypoint = false,
			question = { line1 = "Touch a number, then a card", line2 = "with the same number of items.", scale = .8, offsetY = -67 },
			cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 3, endRange = 10, category = "numbersToGroups" },
			
			matching = { mode = "memory", layout = 1, numRandom = true }	
	},
	game9 = {
			gameType = "question",
			nextWaypoint = false,
			question = { offsetY = -65 },
			cards = { scale = 1, offsetX = 0, offsetY = -50, startRange = 10, endRange = 15, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "Which number is", questionType2 = "FirstLast", numAnswers = 1, numChoices = 3, scattered = false, imageCount = 12, skip = 1 }
	},
	game10 = {
			gameType = "question",
			question = { offsetY = -65 },
			cards = { scale = 1, offsetX = 0, offsetY = -50, startRange = 15, endRange = 20, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "Which number is", questionType2 = "FirstLast", numAnswers = 1, numChoices = 4, scattered = false, imageCount = 12, skip = 1 }
	},
	-- game3 = {
			-- gameType = "question",
			-- nextWaypoint = false,
			-- grayBGY = 140,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -70 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = 1, offsetX = 0, offsetY = -30, startRange = 3, endRange = 10, answerRange = 1, category = "groups" },
			
			-- questions = { questionType1 = "Which number is", questionType2 = "MostLeast", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
	-- },
	-- game3 = {
			-- gameType = "question",
			-- nextWaypoint = true,
			-- grayBGY = 140,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 2, endRange = 6, answerRange = 3, category = "numbers" },
			
			-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
	-- },
	-- game4 = {
			-- gameType = "counting",
			-- nextWaypoint = false,
			-- grayBGY = 140,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -33 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = .85, offsetX = 0, offsetY = -18, startRange = 1, endRange = 6, category = "numbers" },
			
			-- counting = { rowNum = 3, columnNum = 2, spacing = 11, startNum = "random", skip = 1 }
	-- },
	-- game5 = {
			-- gameType = "question",
			-- nextWaypoint = true,
			-- grayBGY = 140,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 2, endRange = 7, answerRange = 3, category = "numbers" },
			
			-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
	-- },
	-- game6 = {
			-- gameType = "sequence",
			-- nextWaypoint = false,
			-- grayBGY = 140,
			-- question = { line1 = "What comes next?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = .85, offsetX = 0, offsetY = 60, startRange = 1, endRange = 8, answerRange = 3, category = "numbers" },
			
			-- sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 80, blankLocation = 4, skip = 1, startNum = 4, patternLength = 3, numChoices = 3, skip = 1 }
	-- },
	-- game7 = {
			-- gameType = "matching",
			-- nextWaypoint = true,
			-- grayBGY = 140,
			-- question = { line1 = "Touch a number, then a card", line2 = "with the same number of items.", spacing = 20, scale = .8, offsetX = 0, offsetY = -34 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = .9, offsetX = 0, offsetY = -12, startRange = 4, endRange = 9, category = "numbersToGroups" },
			
			-- matching = { mode = "showme", layout = 9, numRandom = true }
	-- },
	-- game8 = {
			-- gameType = "question",
			-- nextWaypoint = false,
			-- grayBGY = 140,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 2, endRange = 9, answerRange = 2, category = "numbers" },
			
			-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
	-- },		
	-- game9 = {
			-- gameType = "question",
			-- nextWaypoint = true,
			-- grayBGY = 140,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = .96, offsetX = 0, offsetY = -28, startRange = 3, endRange = 10, answerRange = 2, category = "numbers" },
			
			-- questions = { questionType1 = "Which number is", questionType2 = "FirstLast", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
	-- },
	-- game10 = {
			-- gameType = "question",
			-- nextWaypoint = false,
			-- grayBGY = 140,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 5, endRange = 10, answerRange = 2, category = "numbers" },
			-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
	-- },
	game11 = {
			gameType = "question",
			nextWaypoint = false,
			question = { offsetY = -30 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 5, endRange = 10, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
	},
	game12 = {
			gameType = "question",
			question = { offsetY = -30 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 5, endRange = 10, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
	},
	
}
