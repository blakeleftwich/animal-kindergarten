local randomGameDetails = {



	review6 = {
		
		{
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 115,
				question = { line1 = "", line2 = "", spacing = 30, scale = .78, offsetX = 0, offsetY = -69},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
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
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 9},
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
				question = { line1 = "", line2 = "", spacing = 30, scale = .78, offsetX = 0, offsetY = -69},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .98, offsetX = 0, offsetY = 35, startRange = 4, endRange = 10, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		{
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 9},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 10, answerRange = 2, category = "numbersDots" },
				
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		
		{
				gameType = "sequence",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = .8, offsetX = 0, offsetY = 0 },
				cards = { spacing = 41.5, scale = .95, offsetX = 0, offsetY = 33, startRange = 76, endRange = 99, answerRange = 10, category = "numbers" },
				
				sequence = { numItems = 5, itemsScale = .9, itemsSpacing = 80, blankLocation = "random", placeMatch = "random", skip = 1, startNum = "random", patternLength = 1, order = "ascending", numChoices = 3 }
		},
		{
				gameType = "sequence",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = .8, offsetX = 0, offsetY = 0 },
				cards = { spacing = 41.5, scale = .95, offsetX = 0, offsetY = 33, startRange = 50, endRange = 99, answerRange = 10, category = "numbers" },
				
				sequence = { numItems = 5, itemsScale = .9, itemsSpacing = 80, blankLocation = "random", placeMatch = "random", skip = 1, startNum = "random", patternLength = 1, order = "ascending", numChoices = 3 }
		},
		
		
	
	
	},

	backwardsPatterns = {
	
		{
				gameType = "puzzleSlots",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.25, offsetX = 0, offsetY = 60, startRange = 44, endRange = 99, answerRange = 10, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 3, scattered = true, imageCount = "random", skip = "random", skipPattern = "", startNum = "", placeMatch = 0, order = "descending" },
				puzzle = { imageSet = "CardsClassic", number = "random", minRand = 44, maxRand = 99, incorrectChoices = 2, minSlotNum = 3, maxSlotNum = 4, turnOffEndVO = true, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		},
	
		{
				gameType = "puzzleSlots",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.25, offsetX = 0, offsetY = 60, startRange = 77, endRange = 99, answerRange = 10, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 3, scattered = true, imageCount = "random", skip = "random", skipPattern = "", startNum = "", placeMatch = 0, order = "descending" },
				puzzle = { imageSet = "CardsClassic", number = "random", minRand = 77, maxRand = 99, incorrectChoices = 2, minSlotNum = 3, maxSlotNum = 4, turnOffEndVO = true, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		},
		
		{
				gameType = "puzzleSlots",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.25, offsetX = 0, offsetY = 60, startRange = 44, endRange = 99, answerRange = 10, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 3, scattered = true, imageCount = "random", skip = "random", skipPattern = "", startNum = "", placeMatch = 0, order = "descending" },
				puzzle = { imageSet = "CardsClassic", number = "random", minRand = 44, maxRand = 99, incorrectChoices = 2, minSlotNum = 3, maxSlotNum = 4, turnOffEndVO = true, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		},
	
		{
				gameType = "puzzleSlots",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.25, offsetX = 0, offsetY = 60, startRange = 5, endRange = 99, answerRange = 10, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 3, scattered = true, imageCount = "random", skip = "random", skipPattern = "", startNum = "", placeMatch = 0, order = "descending" },
				puzzle = { imageSet = "CardsClassic", number = "random", minRand = 77, maxRand = 99, incorrectChoices = 2, minSlotNum = 3, maxSlotNum = 4, turnOffEndVO = true, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		},
		{
				gameType = "puzzleSlots",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.25, offsetX = 0, offsetY = 60, startRange = 33, endRange = 55, answerRange = 10, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 3, scattered = true, imageCount = "random", skip = "random", skipPattern = "", startNum = "", placeMatch = 0, order = "descending" },
				puzzle = { imageSet = "CardsClassic", number = "random", minRand = 33, maxRand = 55, incorrectChoices = 2, minSlotNum = 3, maxSlotNum = 4, turnOffEndVO = true, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		},
	
		{
				gameType = "puzzleSlots",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.25, offsetX = 0, offsetY = 60, startRange = 22, endRange = 44, answerRange = 10, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 3, scattered = true, imageCount = "random", skip = "random", skipPattern = "", startNum = "", placeMatch = 0, order = "descending" },
				puzzle = { imageSet = "CardsClassic", number = "random", minRand = 22, maxRand = 44, incorrectChoices = 2, minSlotNum = 3, maxSlotNum = 4, turnOffEndVO = true, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		},
		
		{
				gameType = "puzzleSlots",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.25, offsetX = 0, offsetY = 60, startRange = 22, endRange = 99, answerRange = 10, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 3, scattered = true, imageCount = "random", skip = "random", skipPattern = "", startNum = "", placeMatch = 0, order = "descending" },
				puzzle = { imageSet = "CardsClassic", number = "random", minRand = 22, maxRand = 99, incorrectChoices = 2, minSlotNum = 3, maxSlotNum = 4, turnOffEndVO = true, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		},
	
		{
				gameType = "puzzleSlots",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.25, offsetX = 0, offsetY = 60, startRange = 22, endRange = 99, answerRange = 10, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 3, scattered = true, imageCount = "random", skip = "random", skipPattern = "", startNum = "", placeMatch = 0, order = "descending" },
				puzzle = { imageSet = "CardsClassic", number = "random", minRand = 22, maxRand = 99, incorrectChoices = 2, minSlotNum = 3, maxSlotNum = 4, turnOffEndVO = true, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		},
		
	
	},

	flashCardMatch = {
		{
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Touch an equation, then", line2 = "the card with the answer.", spacing = 20, scale = .8, offsetX = 0, offsetY = -69 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 76, vSpacing = 93, scale = 1.1, offsetX = 0, offsetY = -23, startRange = 1, endRange = 5, category = "numbersToEquations" },	
				matching = { mode = "showme", classic = true, layout = 1, symbol = "random", numRandom = true, showMeMode = 2 }
		},	
		{
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Touch an equation, then", line2 = "the card with the answer.", spacing = 20, scale = .8, offsetX = 0, offsetY = -69 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 76, vSpacing = 93, scale = 1.1, offsetX = 0, offsetY = -23, startRange = 1, endRange = 5, category = "numbersToEquations" },	
				matching = { mode = "showme", classic = true, layout = 5, symbol = "random", numRandom = true, showMeMode = 2 }
		},	
		{
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Touch an equation, then", line2 = "the card with the answer.", spacing = 20, scale = .8, offsetX = 0, offsetY = -69 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 76, vSpacing = 93, scale = .8, offsetX = 0, offsetY = -23, startRange = 1, endRange = 5, category = "numbersToEquations" },	
				matching = { mode = "showme", classic = true, layout = 6, symbol = "random", numRandom = true, showMeMode = 2 }
		},	
		{
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Touch an equation, then", line2 = "the card with the answer.", spacing = 20, scale = .8, offsetX = 0, offsetY = -69 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 76, vSpacing = 93, scale = 1.1, offsetX = 0, offsetY = -23, startRange = 1, endRange = 5, category = "numbersToEquations" },	
				matching = { mode = "memory", classic = true, layout = 1, symbol = "random", numRandom = true, showMeMode = 2 }
		},	
		{
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Touch an equation, then", line2 = "the card with the answer.", spacing = 20, scale = .8, offsetX = 0, offsetY = -69 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 76, vSpacing = 93, scale = 1.2, offsetX = 0, offsetY = -33, startRange = 1, endRange = 5, category = "numbersToEquations" },	
				matching = { mode = "memory", classic = true, layout = 3, symbol = "random", numRandom = true, showMeMode = 2 }
		},	
		{
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Touch an equation, then", line2 = "the card with the answer.", spacing = 20, scale = .8, offsetX = 0, offsetY = -69 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 76, vSpacing = 93, scale = .8, offsetX = 0, offsetY = -23, startRange = 1, endRange = 5, category = "numbersToEquations" },	
				matching = { mode = "memory", classic = true, layout = 6, symbol = "random", numRandom = true, showMeMode = 2 }
		},	
	
	},

	pickEmOutExpert = {
		{
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 7, endRange = 20, answerRange = 3, category = "numbers" },
				
				questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = false, imageCount = 9, skip = 1, showGreen = true, showYellow = true }
		},
		{
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 5, endRange = 20, answerRange = 3, category = "numbers" },
				
				questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = false, imageCount = 12, skip = 1, showGreen = true, showYellow = true }
		},
		{
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 8, endRange = 20, answerRange = 3, category = "numbers" },
				
				questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 7, skip = 1, showGreen = true, showYellow = true }
		},
		{
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 5, endRange = 20, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 8, skip = 1, showGreen = true, showYellow = true }
		},
			{
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 8, endRange = 20, answerRange = 3, category = "numbers" },
				
				questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 7, skip = 1, showGreen = true, showYellow = true }
		},
		{
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 5, endRange = 20, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 8, skip = 1, showGreen = true, showYellow = true }
		},
			{
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 8, endRange = 20, answerRange = 3, category = "numbers" },
				
				questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 7, skip = 1, showGreen = true, showYellow = true }
		},
		{
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 5, endRange = 20, answerRange = 3, category = "numbers" },
				
				questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = false, imageCount = 13, skip = 1, showGreen = true, showYellow = true }
		},
		{
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 5, endRange = 20, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = false, imageCount = 14, skip = 1, showGreen = true, showYellow = true }
		},
		{
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 5, endRange = 20, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = false, imageCount = 15, skip = 1, showGreen = true, showYellow = true }
		},
	},
	
	whatsMissingDetective = {
		{
				gameType = "sequence",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 42, scale = .95, offsetX = 0, offsetY = 33, startRange = 40, endRange = 66, answerRange = 2, category = "numbers" },
				
				sequence = { numItems = 5, itemsScale = .95, itemsSpacing = 80, blankLocation = 4, placeMatch = 0, skip = 1, startNum = "random", patternLength = 1, order = "ascending", numChoices = 3 }
		},
		{
				gameType = "sequence",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 42, scale = .95, offsetX = 0, offsetY = 33, startRange = 14, endRange = 20, answerRange = 3, category = "numbers" },
				
				sequence = { numItems = 4, itemsScale = .95, itemsSpacing = 80, blankLocation = 4, placeMatch = 0, skip = 2, startNum = "random", patternLength = 1, order = "ascending", numChoices = 4 }
		},
		{
				gameType = "sequence",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 42, scale = .95, offsetX = 0, offsetY = 33, startRange = 67, endRange = 96, answerRange = 3, category = "numbers" },
				
				sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 80, blankLocation = 3, placeMatch = 0, skip = 1, startNum = "random", patternLength = 1, order = "ascending", numChoices = 4 }
		},
		{
				gameType = "sequence",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 42, scale = .95, offsetX = 0, offsetY = 33, startRange = 21, endRange = 39, answerRange = 3, category = "numbers" },
				
				sequence = { numItems = 5, itemsScale = .875, itemsSpacing = 80, blankLocation = 3, placeMatch = 0, skip = 2, startNum = "random", patternLength = 1, order = "ascending", numChoices = 4 }
		},
		{
				gameType = "sequence",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = .9, offsetX = 0, offsetY = 0 },
				cards = { spacing = 42, scale = .95, offsetX = 0, offsetY = 33, startRange = 11, endRange = 20, answerRange = 2, category = "numbers" },
				
				sequence = { numItems = 5, itemsScale = .9, itemsSpacing = 80, blankLocation = 4, placeMatch = 0, skip = 3, startNum = "random", patternLength = 1, order = "ascending", numChoices = 3 }
		},
		{
				gameType = "sequence",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = .8, offsetX = 0, offsetY = 0 },
				cards = { spacing = 42, scale = .95, offsetX = 0, offsetY = 33, startRange = 30, endRange = 46, answerRange = 2, category = "numbers" },
				
				sequence = { numItems = 5, itemsScale = .9, itemsSpacing = 80, blankLocation = 4, placeMatch = 4, skip = 4, startNum = "random", patternLength = 1, order = "ascending", numChoices = 3 }
		},
		{
				gameType = "sequence",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = .8, offsetX = 0, offsetY = 0 },
				cards = { spacing = 42, scale = .95, offsetX = 0, offsetY = 33, startRange = 67, endRange = 96, answerRange = 3, category = "numbers" },
				
				sequence = { numItems = 4, itemsScale = .9, itemsSpacing = 80, blankLocation = 3, placeMatch = 0, skip = 3, startNum = "random", patternLength = 1, order = "ascending", numChoices = 4 }
		},
		{
				gameType = "sequence",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = .8, offsetX = 0, offsetY = 0 },
				cards = { spacing = 42, scale = .95, offsetX = 0, offsetY = 33, startRange = 10, endRange = 30, answerRange = 2, category = "numbers" },
				
				sequence = { numItems = 5, itemsScale = .9, itemsSpacing = 80, blankLocation = 4, placeMatch = 0, skip = 3, startNum = "random", patternLength = 1, order = "ascending", numChoices = 3 }
		},
		{
				gameType = "sequence",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = .8, offsetX = 0, offsetY = 0 },
				cards = { spacing = 42, scale = .95, offsetX = 0, offsetY = 33, startRange = 67, endRange = 96, answerRange = 3, category = "numbers" },
				
				sequence = { numItems = 4, itemsScale = .9, itemsSpacing = 80, blankLocation = 3, placeMatch = 1, skip = 4, startNum = "random", patternLength = 1, order = "ascending", numChoices = 4 }
		},
		{
				gameType = "sequence",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 42, scale = .95, offsetX = 0, offsetY = 33, startRange = 30, endRange = 60, answerRange = 2, category = "numbers" },
				
				sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 80, blankLocation = 4, placeMatch = 10, skip = 10, startNum = "random", patternLength = 4, order = "ascending", numChoices = 3 }
		},
		{
				gameType = "sequence",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 42, scale = .95, offsetX = 0, offsetY = 33, startRange = 30, endRange = 60, answerRange = 2, category = "numbers" },
				
				sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 80, blankLocation = 4, placeMatch = 10, skip = 10, startNum = "random", patternLength = 4, order = "ascending", numChoices = 3 }
		},
		{
				gameType = "puzzleSlots",
				nextWaypoint = false, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.25, offsetX = 0, offsetY = 60, startRange = 40, endRange = 60, answerRange = 3, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 4, scattered = true, imageCount = "random", skip = 5, skipPattern = "", startNum = "", placeMatch = 5, order = "ascending" },
				puzzle = { imageSet = "CardsClassic", number = "random", minRand = 40, maxRand = 60, incorrectChoices = 3, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		},
				
		
		-- {
				-- gameType = "puzzleSlots",
				-- nextWaypoint = false, --false,
				-- grayBGY = 140,
				-- question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -36 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { scale = 1.55, offsetX = 0, offsetY = 50, startRange = 1, endRange = 99, answerRange = 10, category = "numbers" },
				
				-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 5, numChoices = 5, scattered = true, imageCount = 5, skip = 2, skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
				-- puzzle = { imageSet = "CardsPutInOrderClassicDifficult", number = "random", minRand = 1, maxRand = 99, incorrectChoices = 0, minSlotNum = 5, maxSlotNum = 5, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		

				
		-- },
		{
				gameType = "puzzleSlots",
				nextWaypoint = false, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -36 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.55, offsetX = 0, offsetY = 50, startRange = 1, endRange = 99, answerRange = 10, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 4, scattered = true, imageCount = 4, skip = 2, skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
				puzzle = { imageSet = "CardsPutInOrderClassicDifficult", number = "random", minRand = 1, maxRand = 99, incorrectChoices = 0, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		

				
		},
		-- {
				-- gameType = "puzzleSlots",
				-- nextWaypoint = false, --false,
				-- grayBGY = 140,
				-- question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -36 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { scale = 1.55, offsetX = 0, offsetY = 50, startRange = 1, endRange = 99, answerRange = 10, category = "numbers" },
				
				-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 5, numChoices = 5, scattered = true, imageCount = 5, skip = 2, skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
				-- puzzle = { imageSet = "CardsPutInOrderClassicDifficult", number = "random", minRand = 1, maxRand = 99, incorrectChoices = 0, minSlotNum = 5, maxSlotNum = 5, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		

				
		-- },
		{
				gameType = "puzzleSlots",
				nextWaypoint = false, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -36 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.55, offsetX = 0, offsetY = 50, startRange = 1, endRange = 99, answerRange = 10, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 4, scattered = true, imageCount = 4, skip = 2, skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
				puzzle = { imageSet = "CardsPutInOrderClassicDifficult", number = "random", minRand = 1, maxRand = 99, incorrectChoices = 0, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		

				
		},
		-- {
				-- gameType = "puzzleSlots",
				-- nextWaypoint = false, --false,
				-- grayBGY = 140,
				-- question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -36 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { scale = 1.55, offsetX = 0, offsetY = 50, startRange = 1, endRange = 99, answerRange = 10, category = "numbers" },
				
				-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 5, numChoices = 5, scattered = true, imageCount = 5, skip = 2, skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
				-- puzzle = { imageSet = "CardsPutInOrderClassicDifficult", number = "random", minRand = 1, maxRand = 99, incorrectChoices = 0, minSlotNum = 5, maxSlotNum = 5, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		

				
		-- },
		{
				gameType = "puzzleSlots",
				nextWaypoint = false, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -36 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.55, offsetX = 0, offsetY = 50, startRange = 1, endRange = 99, answerRange = 10, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 4, scattered = true, imageCount = 4, skip = 2, skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
				puzzle = { imageSet = "CardsPutInOrderClassicDifficult", number = "random", minRand = 1, maxRand = 99, incorrectChoices = 0, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		

				
		},
		
	
	},
	
	whichThree = {
		-- {
				-- gameType = "question",
				-- nextWaypoint = true,				
				-- grayBGY = 140,
				-- question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65},
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { spacing = 60, scale = 1.4, offsetX = 0, offsetY = -42, startRange = 1, endRange = 5, answerRange = 2, category = "numbers" },
				
				-- questions = { questionType1 = "Which 2 numbers add up to", questionType2 = "random", numAnswers = 2, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }	
				
		-- },
		-- {
				-- gameType = "question",
				-- nextWaypoint = false,				
				-- grayBGY = 140,
				-- question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65},
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { spacing = 49, scale = 1.15, offsetX = 0, offsetY = -42, startRange = 3, endRange = 7, answerRange = 2, category = "numbers" },
				
				-- questions = { questionType1 = "Which 2 numbers add up to", questionType2 = "random", numAnswers = 2, numChoices = 5, scattered = true, imageCount = 9, skip = 1 }	
				
		-- },
		{
				gameType = "question",
				nextWaypoint = false,				
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -65},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 60, scale = 1.4, offsetX = 0, offsetY = -42, startRange = 5, endRange = 20, answerRange = 15, category = "numbers" },
				
				questions = { questionType1 = "Which 2 numbers add up to", questionType2 = "random", numAnswers = 3, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }	
				
		},
		{
				gameType = "question",
				nextWaypoint = false,				
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -65},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 49, scale = 1.15, offsetX = 0, offsetY = -42, startRange = 5, endRange = 20, answerRange = 15, category = "numbers" },
				
				questions = { questionType1 = "Which 2 numbers add up to", questionType2 = "random", numAnswers = 3, numChoices = 5, scattered = true, imageCount = 9, skip = 1 }	
				
		},
		{
				gameType = "question",
				nextWaypoint = false,				
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -65},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 60, scale = 1.4, offsetX = 0, offsetY = -42, startRange = 8, endRange = 20, answerRange = 12, category = "numbers" },
				
				questions = { questionType1 = "Which 2 numbers add up to", questionType2 = "random", numAnswers = 3, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }	
				
		},
		{
				gameType = "question",
				nextWaypoint = false,				
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -65},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 49, scale = 1.15, offsetX = 0, offsetY = -42, startRange = 3, endRange = 20, answerRange = 16, category = "numbers" },
				
				questions = { questionType1 = "Which 2 numbers add up to", questionType2 = "random", numAnswers = 3, numChoices = 5, scattered = true, imageCount = 9, skip = 1 }	
				
		},
		{
				gameType = "question",
				nextWaypoint = false,				
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -65},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 60, scale = 1.4, offsetX = 0, offsetY = -42, startRange = 8, endRange = 20, answerRange = 12, category = "numbers" },
				
				questions = { questionType1 = "Which 2 numbers add up to", questionType2 = "random", numAnswers = 3, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }	
				
		},
		{
				gameType = "question",
				nextWaypoint = false,				
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -65},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 49, scale = 1.15, offsetX = 0, offsetY = -42, startRange = 3, endRange = 14, answerRange = 12, category = "numbers" },
				
				questions = { questionType1 = "Which 2 numbers add up to", questionType2 = "random", numAnswers = 3, numChoices = 5, scattered = true, imageCount = 9, skip = 1 }	
				
		},
		{
				gameType = "question",
				nextWaypoint = false,				
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -65},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 49, scale = 1.15, offsetX = 0, offsetY = -42, startRange = 5, endRange = 15, answerRange = 12, category = "numbers" },
				
				questions = { questionType1 = "Which 2 numbers add up to", questionType2 = "random", numAnswers = 3, numChoices = 5, scattered = true, imageCount = 9, skip = 1 }	
				
		},
		
	},
	
	whereDoesItBelong = {
		{
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 42, scale = .95, offsetX = 0, offsetY = 33, startRange = 50, endRange = 97, answerRange = 3, category = "numbers" },
				
				sequence = { numItems = 4, itemsScale = .95, itemsSpacing = 80, blankLocation = "random", placeMatch = 0, skip = 1, startNum = "random", patternLength = 1, order = "ascending", numChoices = 4 }
		},
		{
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 42, scale = .95, offsetX = 0, offsetY = 33, startRange = 50, endRange = 93, answerRange = 3, category = "numbers" },
				
				sequence = { numItems = 4, itemsScale = .95, itemsSpacing = 80, blankLocation = "random", placeMatch = 2, skip = 2, startNum = "random", patternLength = 1, order = "ascending", numChoices = 4 }
		},
		{
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 42, scale = .95, offsetX = 0, offsetY = 33, startRange = 50, endRange = 93, answerRange = 3, category = "numbers" },
				
				sequence = { numItems = 4, itemsScale = .95, itemsSpacing = 80, blankLocation = "random", placeMatch = 2, skip = 2, startNum = "random", patternLength = 1, order = "ascending", numChoices = 4 }
		},
		{
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 42, scale = .95, offsetX = 0, offsetY = 33, startRange = 50, endRange = 81, answerRange = 3, category = "numbers" },
				
				sequence = { numItems = 4, itemsScale = .95, itemsSpacing = 80, blankLocation = "random", placeMatch = 5, skip = 5, startNum = "random", patternLength = 1, order = "ascending", numChoices = 4 }
		},
		{
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 42, scale = .95, offsetX = 0, offsetY = 33, startRange = 50, endRange = 61, answerRange = 3, category = "numbers" },
				
				sequence = { numItems = 4, itemsScale = .95, itemsSpacing = 80, blankLocation = "random", placeMatch = 10, skip = 10, startNum = "random", patternLength = 1, order = "ascending", numChoices = 4 }
		},
		{
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 42, scale = .95, offsetX = 0, offsetY = 33, startRange = 50, endRange = 97, answerRange = 3, category = "numbers" },
				
				sequence = { numItems = 4, itemsScale = .95, itemsSpacing = 80, blankLocation = "random", placeMatch = 0, skip = 1, startNum = "random", patternLength = 1, order = "ascending", numChoices = 4 }
		},
		{
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 42, scale = .95, offsetX = 0, offsetY = 33, startRange = 50, endRange = 93, answerRange = 3, category = "numbers" },
				
				sequence = { numItems = 4, itemsScale = .95, itemsSpacing = 80, blankLocation = "random", placeMatch = 0, skip = 2, startNum = "random", patternLength = 1, order = "ascending", numChoices = 4 }
		},
		{
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 42, scale = .95, offsetX = 0, offsetY = 33, startRange = 50, endRange = 89, answerRange = 3, category = "numbers" },
				
				sequence = { numItems = 4, itemsScale = .95, itemsSpacing = 80, blankLocation = "random", placeMatch = 0, skip = 3, startNum = "random", patternLength = 1, order = "ascending", numChoices = 4 }
		},
		{
				gameType = "puzzleSlots",
				nextWaypoint = false, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -36 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.55, offsetX = 0, offsetY = 50, startRange = 11, endRange = 96, answerRange = 30, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 4, scattered = true, imageCount = 3, skip = "none", skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
				puzzle = { imageSet = "CardsPutInOrderClassicDifficult", number = "random", minRand = 11, maxRand = 99, incorrectChoices = 0, minSlotNum = 3, maxSlotNum = 3, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		},
		{
				gameType = "puzzleSlots",
				nextWaypoint = false, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -36 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.55, offsetX = 0, offsetY = 50, startRange = 11, endRange = 96, answerRange = 30, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 4, scattered = true, imageCount = 3, skip = "none", skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
				puzzle = { imageSet = "CardsPutInOrderClassicDifficult", number = "random", minRand = 11, maxRand = 99, incorrectChoices = 0, minSlotNum = 3, maxSlotNum = 3, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		},
		{
				gameType = "puzzleSlots",
				nextWaypoint = false, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -36 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.55, offsetX = 0, offsetY = 50, startRange = 11, endRange = 96, answerRange = 30, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 4, scattered = true, imageCount = 3, skip = "none", skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
				puzzle = { imageSet = "CardsPutInOrderClassicDifficult", number = "random", minRand = 11, maxRand = 99, incorrectChoices = 0, minSlotNum = 3, maxSlotNum = 3, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		},
		{
				gameType = "puzzleSlots",
				nextWaypoint = false, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -36 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.55, offsetX = 0, offsetY = 50, startRange = 11, endRange = 96, answerRange = 30, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 4, scattered = true, imageCount = 3, skip = "none", skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
				puzzle = { imageSet = "CardsPutInOrderClassicDifficult", number = "random", minRand = 11, maxRand = 99, incorrectChoices = 0, minSlotNum = 3, maxSlotNum = 3, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		},
		
	},
	
	equationChallenge = {
		{
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = .85, offsetX = 0, offsetY = 3},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 10, answerRange = 2, category = "numbers" },
				equations = { sign = "random", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		{
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = .85, offsetX = 0, offsetY = 3},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 10, answerRange = 3, category = "numbers" },
				equations = { sign = "random", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 4, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		{
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = .85, offsetX = 0, offsetY = 3},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 10, answerRange = 3, category = "numbers" },
				equations = { sign = "random", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 4, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		
	},
	
	complexEquations = {
		{
				gameType = "complex equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0},
				cards = { scale = 1.1, offsetX = 0, offsetY = 33, startRange = 5, endRange = 12, category = "numbers" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, choiceThreeBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		{
				gameType = "complex equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0},
				cards = { scale = 1.1, offsetX = 0, offsetY = 33, startRange = 4, endRange = 10, category = "numbers" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, choiceThreeBlank = false, answerBlank = true, numChoices = 4, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		{
				gameType = "complex equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0},
				cards = { scale = 1.1, offsetX = 0, offsetY = 33, startRange = 3, endRange = 10, category = "numbers" },
				
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, choiceThreeBlank = false, answerBlank = true, numChoices = 4, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		
	},
	
	
	additionMixUp5To10 = {
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 120,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -67},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .98, offsetX = 0, offsetY = 37, startRange = 5, endRange = 10, answerRange = 2, category = "apples" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		
		{
				gameType = "complex equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0},
				cards = { scale = 1.1, offsetX = 0, offsetY = 33, startRange = 5, endRange = 10, category = "numbers" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, choiceThreeBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		{
				gameType = "complex equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0},
				cards = { scale = 1.1, offsetX = 0, offsetY = 33, startRange = 5, endRange = 10, category = "numbers" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, choiceThreeBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 120,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -67},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 30, startRange = 5, endRange = 10, answerRange = 2, category = "numbersDots" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 120,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -67},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .98, offsetX = 0, offsetY = 37, startRange = 5, endRange = 10, answerRange = 3, category = "numbersDots" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 1 }	
		},
		{
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 9},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 5, endRange = 10, answerRange = 3, category = "numbersDots" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 4, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		{
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 9},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 5, endRange = 10, answerRange = 2, category = "numbersDots" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		{
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = .85, offsetX = 0, offsetY = 3},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 5, endRange = 10, answerRange = 2, category = "numbers" },
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 120,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -67},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .98, offsetX = 0, offsetY = 37, startRange = 5, endRange = 10, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		{
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = .85, offsetX = 0, offsetY = 3},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 5, endRange = 10, answerRange = 3, category = "numbers" },
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 4, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		{
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = .85, offsetX = 0, offsetY = 3},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 5, endRange = 10, answerRange = 3, category = "numbers" },
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 4, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
	
	},
	
	subtractionMixUp5To10 = {
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 120,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -67},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .98, offsetX = 0, offsetY = 37, startRange = 5, endRange = 10, answerRange = 2, category = "apples" },
				
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		
		{
				gameType = "complex equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0},
				cards = { scale = 1.1, offsetX = 0, offsetY = 33, startRange = 5, endRange = 10, category = "numbers" },
				
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, choiceThreeBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		{
				gameType = "complex equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0},
				cards = { scale = 1.1, offsetX = 0, offsetY = 33, startRange = 5, endRange = 10, category = "numbers" },
				
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, choiceThreeBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 120,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -67},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 30, startRange = 5, endRange = 10, answerRange = 2, category = "numbersDots" },
				
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 120,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -67},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .98, offsetX = 0, offsetY = 37, startRange = 5, endRange = 10, answerRange = 3, category = "numbersDots" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 1 }	
		},
		{
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 9},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 5, endRange = 10, answerRange = 3, category = "numbersDots" },
				
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 4, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		{
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 9},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 5, endRange = 10, answerRange = 2, category = "numbersDots" },
				
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		{
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = .85, offsetX = 0, offsetY = 3},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 5, endRange = 10, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 120,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -67},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .98, offsetX = 0, offsetY = 37, startRange = 5, endRange = 10, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		{
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = .85, offsetX = 0, offsetY = 3},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 5, endRange = 10, answerRange = 3, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 4, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		{
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = .85, offsetX = 0, offsetY = 3},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 5, endRange = 10, answerRange = 3, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 4, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
	
	},
	
	greaterAndLessThanDeluxe = {
		{
				
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 68, scale = 1.6, offsetX = 0, offsetY = -32, startRange = 12, endRange = 99, answerRange = 3, category = "numbers" },
				questions = { questionType1 = "Which number is", questionType2 = "GreaterLess", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
		
				
		},
		{
				
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 60, scale = 1.375, offsetX = 0, offsetY = -40, startRange = 40, endRange = 99, answerRange = 4, category = "numbers" },
				questions = { questionType1 = "Which number is", questionType2 = "GreaterLess", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 1 }
		
				
		},
		{
				gameType = "basketGreaterLessThan",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 0, startRange = 5, endRange = 5, numStartRange = 99, numEndRange = 97, numCorrectMin = 1, numCorrectMax = 3, answerRange = 4, category = "numbers" },
				questions = { questionType1 = "basketGreaterLessThan", questionType2 = "greater than", numAnswers = 1, numChoices = 5, scattered = true, numExtraMin = 1, numExtraMax = 2, imageCount = 4, skip = 1 }
		},
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -70 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 68, scale = 1.6, offsetX = 0, offsetY = -32, startRange = 12, endRange = 99, answerRange = 3, category = "numbers" },
				questions = { questionType1 = "AllGreaterLessThan", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 1, skip = 1 },
				counting = { rowNum = 2, columnNum = 2, spacing = 13, startNum = "random", skip = 1 }
		},
		
		{
				gameType = "basketGreaterLessThan",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 0, startRange = 6, endRange = 6, numStartRange = 50, numEndRange = 97, numCorrectMin = 1, numCorrectMax = 3, answerRange = 4, category = "numbers" },
				questions = { questionType1 = "basketGreaterLessThan", questionType2 = "greater than", numAnswers = 1, numChoices = 5, scattered = true, numExtraMin = 1, numExtraMax = 2, imageCount = 4, skip = 1 }
		},
		{
				
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 48.5, scale = 1.1, offsetX = 0, offsetY = -40, startRange = 40, endRange = 99, answerRange = 4, category = "numbers" },
				questions = { questionType1 = "Which number is", questionType2 = "GreaterLess", numAnswers = 1, numChoices = 5, scattered = true, imageCount = "random", skip = 1 }
		
				
		},
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -70 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 68, scale = 1.6, offsetX = 0, offsetY = -32, startRange = 24, endRange = 99, answerRange = 2, category = "numbers" },
				questions = { questionType1 = "AllGreaterLessThan", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 1, skip = 1 },
				counting = { rowNum = 3, columnNum = 2, spacing = 13, startNum = "random", skip = 1 }
		},
		{
				gameType = "basketGreaterLessThan",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 0, startRange = 5, endRange = 5, numStartRange = 50, numEndRange = 97, numCorrectMin = 1, numCorrectMax = 3, answerRange = 4, category = "numbers" },
				questions = { questionType1 = "basketGreaterLessThan", questionType2 = "greater than", numAnswers = 1, numChoices = 5, scattered = true, numExtraMin = 1, numExtraMax = 2, imageCount = 4, skip = 1 }
		},
		{
				
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 60, scale = 1.375, offsetX = 0, offsetY = -40, startRange = 40, endRange = 99, answerRange = 4, category = "numbers" },
				questions = { questionType1 = "Which number is", questionType2 = "GreaterLess", numAnswers = 1, numChoices = 5, scattered = true, imageCount = "random", skip = 1 }
		
				
		},
		{
				gameType = "basketGreaterLessThan",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 0, startRange = 6, endRange = 6, numStartRange = 50, numEndRange = 97, numCorrectMin = 1, numCorrectMax = 3, answerRange = 4, category = "numbers" },
				questions = { questionType1 = "basketGreaterLessThan", questionType2 = "greater than", numAnswers = 1, numChoices = 5, scattered = true, numExtraMin = 1, numExtraMax = 2, imageCount = 4, skip = 1 }
		},
		
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -70 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 68, scale = 1.6, offsetX = 0, offsetY = -32, startRange = 24, endRange = 99, answerRange = 2, category = "numbers" },
				questions = { questionType1 = "AllGreaterLessThan", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 1, skip = 1 },
				counting = { rowNum = 4, columnNum = 2, spacing = 13, startNum = "random", skip = 1 }
		},
		
		{
				gameType = "basketGreaterLessThan",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 0, startRange = 6, endRange = 6, numStartRange = 50, numEndRange = 97, numCorrectMin = 1, numCorrectMax = 3, answerRange = 4, category = "numbers" },
				questions = { questionType1 = "basketGreaterLessThan", questionType2 = "greater than", numAnswers = 1, numChoices = 5, scattered = true, numExtraMin = 1, numExtraMax = 2, imageCount = 4, skip = 1 }
		},
		
	
	},
	
	equationsExpert1To10 = {
		{
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = .85, offsetX = 0, offsetY = 3},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 10, answerRange = 2, category = "numbers" },
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		{
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = .85, offsetX = 0, offsetY = 3},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 10, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		{
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = .85, offsetX = 0, offsetY = 3},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 10, answerRange = 2, category = "numbers" },
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		{
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = .85, offsetX = 0, offsetY = 3},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 10, answerRange = 3, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 4, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		{
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = .85, offsetX = 0, offsetY = 3},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 10, answerRange = 3, category = "numbers" },
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 4, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		{
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = .85, offsetX = 0, offsetY = 3},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 10, answerRange = 3, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 4, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		
	},
	
	complexEquations1To10 = {
		{
				gameType = "complex equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0},
				cards = { scale = .93, offsetX = 0, offsetY = 40, startRange = 1, endRange = 10, category = "numbers" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, choiceThreeBlank = false, answerBlank = true, numChoices = 2, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		{
				gameType = "complex equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0},
				cards = { scale = .93, offsetX = 0, offsetY = 40, startRange = 1, endRange = 10, category = "numbers" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, choiceThreeBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		{
				gameType = "complex equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0},
				cards = { scale = .93, offsetX = 0, offsetY = 40, startRange = 1, endRange = 10, category = "numbers" },
				
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, choiceThreeBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		{
				gameType = "complex equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0},
				cards = { scale = .93, offsetX = 0, offsetY = 40, startRange = 1, endRange = 10, category = "numbers" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, choiceThreeBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		{
				gameType = "complex equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0},
				cards = { scale = .93, offsetX = 0, offsetY = 40, startRange = 1, endRange = 10, category = "numbers" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, choiceThreeBlank = false, answerBlank = true, numChoices = 4, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		{
				gameType = "complex equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0},
				cards = { scale = .93, offsetX = 0, offsetY = 40, startRange = 1, endRange = 10, category = "numbers" },
				
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, choiceThreeBlank = false, answerBlank = true, numChoices = 4, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		{
				gameType = "complex equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0},
				cards = { scale = .93, offsetX = 0, offsetY = 40, startRange = 1, endRange = 10, category = "numbers" },
				
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, choiceThreeBlank = false, answerBlank = true, numChoices = 4, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		
	},
	
	flashCardMatchDeluxe1To10 = {
		{
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Touch an equation, then", line2 = "the card with the answer.", spacing = 20, scale = .8, offsetX = 0, offsetY = -69 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 76, vSpacing = 93, scale = 1.1, offsetX = 0, offsetY = -23, startRange = 1, endRange = 10, category = "numbersToEquations" },	
				matching = { mode = "showme", classic = true, layout = 1, symbol = "random", numRandom = true, showMeMode = 2 }
		},	
		{
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Touch an equation, then", line2 = "the card with the answer.", spacing = 20, scale = .8, offsetX = 0, offsetY = -69 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 76, vSpacing = 93, scale = 1.1, offsetX = 0, offsetY = -23, startRange = 1, endRange = 10, category = "numbersToEquations" },	
				matching = { mode = "showme", classic = true, layout = 5, symbol = "random", numRandom = true, showMeMode = 2 }
		},	
		{
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Touch an equation, then", line2 = "the card with the answer.", spacing = 20, scale = .8, offsetX = 0, offsetY = -69 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 76, vSpacing = 93, scale = .8, offsetX = 0, offsetY = -23, startRange = 1, endRange = 10, category = "numbersToEquations" },	
				matching = { mode = "showme", classic = true, layout = 6, symbol = "random", numRandom = true, showMeMode = 2 }
		},	
		{
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Touch an equation, then", line2 = "the card with the answer.", spacing = 20, scale = .8, offsetX = 0, offsetY = -69 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 76, vSpacing = 93, scale = 1.1, offsetX = 0, offsetY = -23, startRange = 1, endRange = 10, category = "numbersToEquations" },	
				matching = { mode = "memory", classic = true, layout = 1, symbol = "random", numRandom = true, showMeMode = 2 }
		},	
		{
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Touch an equation, then", line2 = "the card with the answer.", spacing = 20, scale = .8, offsetX = 0, offsetY = -69 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 76, vSpacing = 93, scale = 1.2, offsetX = 0, offsetY = -33, startRange = 1, endRange = 10, category = "numbersToEquations" },	
				matching = { mode = "memory", classic = true, layout = 3, symbol = "random", numRandom = true, showMeMode = 2 }
		},	
		{
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Touch an equation, then", line2 = "the card with the answer.", spacing = 20, scale = .8, offsetX = 0, offsetY = -69 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 76, vSpacing = 93, scale = .8, offsetX = 0, offsetY = -23, startRange = 1, endRange = 10, category = "numbersToEquations" },	
				matching = { mode = "memory", classic = true, layout = 6, symbol = "random", numRandom = true, showMeMode = 2 }
		},	
	},
	
	tenMoreOrLess = {
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -42, startRange = 20, endRange = 90, answerRange = 3, category = "numbers" },
				questions = { questionType1 = "Which is", questionType2 = "more than", numAnswers = 1, numChoices = 2, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = 10, skipMin = 10, skipMax = 10 }
		},	
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -42, startRange = 20, endRange = 90, answerRange = 3, category = "numbers" },
				questions = { questionType1 = "Which is", questionType2 = "more than", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = 10, skipMin = 10, skipMax = 10 }
		},	
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -42, startRange = 20, endRange = 90, answerRange = 3, category = "numbers" },
				questions = { questionType1 = "Which is", questionType2 = "more than", numAnswers = 1, numChoices = 2, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = 10, skipMin = 10, skipMax = 10 }
		},	
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -42, startRange = 20, endRange = 90, answerRange = 3, category = "numbers" },
				questions = { questionType1 = "Which is", questionType2 = "more than", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = 10, skipMin = 10, skipMax = 10 }
		},	
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -42, startRange = 20, endRange = 90, answerRange = 3, category = "numbers" },
				questions = { questionType1 = "Which is", questionType2 = "more than", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = 10, skipMin = 10, skipMax = 10 }
		},	
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -42, startRange = 20, endRange = 90, answerRange = 3, category = "numbers" },
				questions = { questionType1 = "Which is", questionType2 = "more than", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = 10, skipMin = 10, skipMax = 10 }
		},	
	
	},
	
	numberBrain = {
		{
				
				gameType = "puzzleSlots",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -36 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.4, offsetX = 0, offsetY = 50, startRange = 0, endRange = 1, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 3, scattered = true, imageCount = "random", skip = 1, skipPattern = "", startNum = "", order = "ascending" },
				puzzle = { imageSet = "CardsNumDifficult", number = "random", minRand = 50, maxRand = 99, incorrectChoices = 2, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		
		},
		{
				
				gameType = "counting",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = -35, startRange = 20, endRange = 70, category = "numbers" },
				
				counting = { rowNum = 3, columnNum = 2, spacing = 10, startNum = "random", skip = 10, placeMatch = 10 }
		},
		
		{
				
								
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Touch a number, then a card", line2 = "with the same number of items.", spacing = 20, scale = .8, offsetX = 0, offsetY = -69 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 76, vSpacing = 93, scale = 1.2, offsetX = 0, offsetY = -23, startRange = 4, endRange = 10, category = "numbersToGroups" },
				matching = { mode = "showme", classic = true, layout = 3, numRandom = true, showMeMode = 2 }
		},
		
		
		{
				gameType = "puzzleSlots",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -36 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.3, offsetX = 0, offsetY = 50, startRange = 1, endRange = 70, answerRange = 10, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 4, scattered = true, imageCount = "random", skip = "none", skipPattern = "", startNum = "", order = "ascending" },
				puzzle = { imageSet = "CardsPutInOrderClassicDifficult", number = "random", minRand = 1, maxRand = 30, incorrectChoices = 0, minSlotNum = 5, maxSlotNum = 5, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		

				
		},
		{
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What comes next?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 10, endRange = 70, answerRange = 2, category = "numbers" },
				
				sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 80, blankLocation = 4, placeMatch = 10, skip = 10, startNum = "random", patternLength = 1, order = "ascending", numChoices = 3 }
		},
		
		
		{
				
								
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Touch a number, then a card", line2 = "with the same number of items.", spacing = 20, scale = .8, offsetX = 0, offsetY = -69 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 76, vSpacing = 93, scale = 0.8, offsetX = 0, offsetY = -23, startRange = 1, endRange = 10, category = "numbersToGroups" },
				matching = { mode = "showme", classic = true, layout = 6, numRandom = true, showMeMode = 2 }
		},
		
		{
				
								
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Touch a number, then a card", line2 = "with the same number of items.", spacing = 20, scale = .8, offsetX = 0, offsetY = -69 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 76, vSpacing = 93, scale = 0.8, offsetX = 0, offsetY = -23, startRange = 1, endRange = 10, category = "numbersToGroups" },
				matching = { mode = "showme", classic = true, layout = 6, numRandom = true, showMeMode = 2 }
		},
	
	},
	
	warmingUp = {
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 120,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -67},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 30, startRange = 1, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		{
				gameType = "basketGreaterLessThan",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 0, startRange = 5, endRange = 5, numStartRange = 5, numEndRange = 50, numCorrectMin = 1, numCorrectMax = 3, answerRange = 4, category = "numbers" },
				questions = { questionType1 = "basketGreaterLessThan", questionType2 = "greater than", numAnswers = 1, numChoices = 5, scattered = true, numExtraMin = 1, numExtraMax = 2, imageCount = 4, skip = 1 }
		},
		{
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 9},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				equations = { sign = "random", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		{
				
								
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Match the cards with the", line2 = "same number of items.", spacing = 20, scale = .8, offsetX = 0, offsetY = -69 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 76, vSpacing = 93, scale = 1.1, offsetX = 0, offsetY = -23, startRange = 6, endRange = 10, category = "groupsToGroups" },
				matching = { mode = "showme", classic = true, layout = 1, numRandom = true, showMeMode = 2 }
		},
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 120,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -67},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 30, startRange = 1, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		{
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 9},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				equations = { sign = "random", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		{
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 9},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				equations = { sign = "random", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
	},
	
	testOfEndurance = {
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 120,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -67},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 30, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		{
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What comes next?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 10, endRange = 70, answerRange = 2, category = "numbers" },
				
				sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 80, blankLocation = "random", placeMatch = "random", skip = 1, startNum = "random", patternLength = 1, order = "ascending", numChoices = 3 }
		},
		-- {
				-- gameType = "puzzleSlots",
				-- nextWaypoint = true, --false,
				-- grayBGY = 140,
				-- question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { scale = 1.2, offsetX = 0, offsetY = 50, startRange = 10, endRange = 20, answerRange = 2, category = "numbers" },
				
				-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 5, numChoices = 3, scattered = true, imageCount = "random", skip = 1, skipPattern = "", startNum = "", order = "descending" },
				-- puzzle = { imageSet = "CardsClassic", number = "random", minRand = 10, maxRand = 20, incorrectChoices = 2, minSlotNum = 5, maxSlotNum = 5, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		-- },
		{
				gameType = "puzzleSlots",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.25, offsetX = 0, offsetY = 60, startRange = 10, endRange = 20, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 3, scattered = true, imageCount = "random", skip = 1, skipPattern = "", startNum = "", placeMatch = 0, order = "descending" },
				puzzle = { imageSet = "CardsClassic", number = "random", minRand = 10, maxRand = 20, incorrectChoices = 2, minSlotNum = 4, maxSlotNum = 4, turnOffEndVO = true, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		},
		{
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 9},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 3, answerRange = 2, category = "numbersDots" },
				
				equations = { sign = "random", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 2, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		-- {
				-- gameType = "puzzleSlots",
				-- nextWaypoint = true, --false,
				-- grayBGY = 140,
				-- question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { scale = 1.2, offsetX = 0, offsetY = 50, startRange = 10, endRange = 60, answerRange = 2, category = "numbers" },
				
				-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 5, numChoices = 3, scattered = true, imageCount = "random", skip = "random", skipPattern = "", startNum = "", order = "ascending" },
				-- puzzle = { imageSet = "CardsClassic", number = "random", minRand = 10, maxRand = 20, incorrectChoices = 2, minSlotNum = 5, maxSlotNum = 5, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		-- },
		{
				gameType = "puzzleSlots",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.25, offsetX = 0, offsetY = 60, startRange = 10, endRange = 60, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 3, scattered = true, imageCount = "random", skip = "random", skipPattern = "", startNum = "", placeMatch = 0, order = "descending" },
				puzzle = { imageSet = "CardsClassic", number = "random", minRand = 10, maxRand = 20, incorrectChoices = 2, minSlotNum = 4, maxSlotNum = 4, turnOffEndVO = true, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		},
		{
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = .85, offsetX = 0, offsetY = 3},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "random", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 120,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -67},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 30, startRange = 2, endRange = 5, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		{
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = .85, offsetX = 0, offsetY = 3},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "random", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		-- {
				-- gameType = "puzzleSlots",
				-- nextWaypoint = true, --false,
				-- grayBGY = 140,
				-- question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { scale = 1.2, offsetX = 0, offsetY = 50, startRange = 10, endRange = 20, answerRange = 2, category = "numbers" },
				
				-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 5, numChoices = 3, scattered = true, imageCount = "random", skip = 1, skipPattern = "", startNum = "", order = "descending" },
				-- puzzle = { imageSet = "CardsClassic", number = "random", minRand = 10, maxRand = 20, incorrectChoices = 2, minSlotNum = 5, maxSlotNum = 5, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		-- },
		{
				gameType = "puzzleSlots",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.25, offsetX = 0, offsetY = 60, startRange = 10, endRange = 20, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 3, scattered = true, imageCount = "random", skip = 1, skipPattern = "", startNum = "", placeMatch = 0, order = "descending" },
				puzzle = { imageSet = "CardsClassic", number = "random", minRand = 10, maxRand = 20, incorrectChoices = 2, minSlotNum = 4, maxSlotNum = 4, turnOffEndVO = true, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		},
		{
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = .85, offsetX = 0, offsetY = 3},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "random", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		{
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = .85, offsetX = 0, offsetY = 3},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "random", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		
		
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 120,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -67},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 30, startRange = 2, endRange = 5, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
	
	},
	
	subtractionReview1To5 = {
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -42, startRange = 1, endRange = 5, answerRange = 3, category = "numbers" },
				questions = { questionType1 = "Which is", questionType2 = "less than", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = "random", skipMin = 1, skipMax = 5 }
		},	
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 120,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -67},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 30, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 2, scattered = true, imageCount = "random", skip = 1 }	
		},
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 113,				
				question = { line1 = "True or false?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1.1, offsetX = 0, offsetY = 0 },
				cards = { rotation = 90, scale = .8, offsetX = 0, offsetY = 33, startRange = 1, endRange = 5, category = "random" },
				questions = { questionType1 = "TrueOrFalse", questionType2 = "oneEquation", symbol = "-", numAnswers = 1, numChoices = 2, scattered = true, imageCount = 1, skip = 1 }		
		},
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -42, startRange = 1, endRange = 5, answerRange = 3, category = "numbers" },
				questions = { questionType1 = "Which is", questionType2 = "less than", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = "random", skipMin = 1, skipMax = 5 }
		},	
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 120,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -67},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 30, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 2, scattered = true, imageCount = "random", skip = 1 }	
		},
		{
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = .85, offsetX = 0, offsetY = 3},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 113,				
				question = { line1 = "True or false?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1.1, offsetX = 0, offsetY = 0 },
				cards = { rotation = 90, scale = .8, offsetX = 0, offsetY = 33, startRange = 1, endRange = 5, category = "random" },
				questions = { questionType1 = "TrueOrFalse", questionType2 = "oneEquation", symbol = "-", numAnswers = 1, numChoices = 2, scattered = true, imageCount = 1, skip = 1 }		
		},
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -42, startRange = 1, endRange = 5, answerRange = 3, category = "numbers" },
				questions = { questionType1 = "Which is", questionType2 = "less than", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = "random", skipMin = 1, skipMax = 5 }
		},	
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the word problem.", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				equation = { scale = 0.8, offsetX = 0, offsetY = 0 },
				cards = { scale = .9, offsetX = 0, offsetY = 40, startRange = 1, endRange = 5, category = "numbers" },
				questions = { questionType1 = "Word problem", questionType2 = "subtraction", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 6, skip = 1 }	
		},
		{
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = .85, offsetX = 0, offsetY = 3},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 120,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -67},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 30, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 2, scattered = true, imageCount = "random", skip = 1 }	
		},
	
	},
	
	challenge1To10 = {
		
		{
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 9},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 5, endRange = 10, answerRange = 2, category = "numbersDots" },
				
				equations = { sign = "random", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -42, startRange = 1, endRange = 10, answerRange = 3, category = "numbers" },
				questions = { questionType1 = "Which is", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = "random", skipMin = 1, skipMax = 5 }
		},	
		{
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = .85, offsetX = 0, offsetY = 3},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 10, answerRange = 2, category = "numbers" },
				equations = { sign = "random", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the word problem.", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				equation = { scale = 0.8, offsetX = 0, offsetY = 0 },
				cards = { scale = .9, offsetX = 0, offsetY = 40, startRange = 3, endRange = 10, category = "numbers" },
				questions = { questionType1 = "Word problem", questionType2 = "subtraction", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 6, skip = 1 }	
		},
		{
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = .85, offsetX = 0, offsetY = 3},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 10, answerRange = 2, category = "numbers" },
				equations = { sign = "random", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -42, startRange = 1, endRange = 10, answerRange = 3, category = "numbers" },
				questions = { questionType1 = "Which is", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = "random", skipMin = 1, skipMax = 5 }
		},	
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the word problem.", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				equation = { scale = 0.8, offsetX = 0, offsetY = 0 },
				cards = { scale = .9, offsetX = 0, offsetY = 40, startRange = 5, endRange = 10, category = "numbers" },
				questions = { questionType1 = "Word problem", questionType2 = "addition", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 6, skip = 1 }	
		},
		{
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = .85, offsetX = 0, offsetY = 3},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 5, endRange = 10, answerRange = 2, category = "numbers" },
				equations = { sign = "random", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
	
	},
	
	additionReview1To5 = {
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -42, startRange = 1, endRange = 5, answerRange = 3, category = "numbers" },
				questions = { questionType1 = "Which is", questionType2 = "more than", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = "random", skipMin = 1, skipMax = 5 }
		},	
		{
				gameType = "question",
				nextWaypoint = false,				
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = -50, startRange = 1, endRange = 5, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "Which 2 numbers add up to", questionType2 = "random", numAnswers = 2, numChoices = 3, scattered = true, imageCount = 9, skip = 1 }	
				
		},
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 120,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -67},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 30, startRange = 2, endRange = 5, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		{
				gameType = "question",
				nextWaypoint = false,				
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = -50, startRange = 1, endRange = 5, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "Which 2 numbers add up to", questionType2 = "random", numAnswers = 2, numChoices = 3, scattered = true, imageCount = 9, skip = 1 }	
				
		},
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 113,				
				question = { line1 = "True or false?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1.1, offsetX = 0, offsetY = 0 },
				cards = { rotation = 90, scale = .8, offsetX = 0, offsetY = 33, startRange = 1, endRange = 5, category = "random" },
				questions = { questionType1 = "TrueOrFalse", questionType2 = "oneEquation", symbol = "+", numAnswers = 1, numChoices = 2, scattered = true, imageCount = 1, skip = 1 }		
		},
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -42, startRange = 1, endRange = 5, answerRange = 3, category = "numbers" },
				questions = { questionType1 = "Which is", questionType2 = "more than", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = "random", skipMin = 1, skipMax = 5 }
		},	
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 120,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -67},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 30, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -42, startRange = 1, endRange = 5, answerRange = 3, category = "numbers" },
				questions = { questionType1 = "Which is", questionType2 = "more than", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = "random", skipMin = 1, skipMax = 5 }
		},	
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 113,				
				question = { line1 = "True or false?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1.1, offsetX = 0, offsetY = 0 },
				cards = { rotation = 90, scale = .8, offsetX = 0, offsetY = 33, startRange = 1, endRange = 5, category = "random" },
				questions = { questionType1 = "TrueOrFalse", questionType2 = "oneEquation", symbol = "+", numAnswers = 1, numChoices = 2, scattered = true, imageCount = 1, skip = 1 }		
		},
		{
				gameType = "question",
				nextWaypoint = false,				
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = -50, startRange = 1, endRange = 5, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "Which 2 numbers add up to", questionType2 = "random", numAnswers = 2, numChoices = 3, scattered = true, imageCount = 9, skip = 1 }	
				
		},
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -42, startRange = 1, endRange = 5, answerRange = 3, category = "numbers" },
				questions = { questionType1 = "Which is", questionType2 = "more than", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = "random", skipMin = 1, skipMax = 5 }
		},	
	
	},
	
	totallyRandom = {
		{
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Touch an equation, then", line2 = "the card with the answer.", spacing = 20, scale = .8, offsetX = 0, offsetY = -69 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 76, vSpacing = 93, scale = 1.1, offsetX = 0, offsetY = -23, startRange = 1, endRange = 5, category = "numbersToEquations" },	
				matching = { mode = "showme", classic = true, layout = 5, symbol = "random", numRandom = true, showMeMode = 2 }
		},	
		{
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 100,
				question = { line1 = "What comes next?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = 20, startRange = 1, endRange = 10, answerRange = 2, category = "items" },
				sequence = { numItems = 5, itemsScale = .875, itemsSpacing = 80, blankLocation = "random", placeMatch = 0, skip = 2, skipPattern = "", startNum = "random", patternLength = 2, order = "ascending", numChoices = 3 }
		},
		{
				gameType = "puzzleSlots",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.2, offsetX = 0, offsetY = 50, startRange = 10, endRange = 100, answerRange = 4, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 5, numChoices = 3, scattered = true, imageCount = "random", skip = 1, skipPattern = "", startNum = "", order = "descending" },
				puzzle = { imageSet = "CardsClassic", number = "random", minRand = 20, maxRand = 70, incorrectChoices = 2, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		},
		{
				gameType = "question",
				nextWaypoint = false,				
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = -50, startRange = 5, endRange = 10, answerRange = 4, category = "numbers" },
				
				questions = { questionType1 = "Which 2 numbers add up to", questionType2 = "random", numAnswers = 3, numChoices = 5, scattered = true, imageCount = 9, skip = 1 }	
				
		},
		{
				gameType = "complex equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0},
				cards = { scale = .93, offsetX = 0, offsetY = 40, startRange = 1, endRange = 10, category = "numbers" },
				
				equations = { sign = "random", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, choiceThreeBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		{
				gameType = "basketGreaterLessThan",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 0, startRange = 5, endRange = 5, numStartRange = 5, numEndRange = 50, numCorrectMin = 1, numCorrectMax = 3, answerRange = 4, category = "numbers" },
				questions = { questionType1 = "basketGreaterLessThan", questionType2 = "greater than", numAnswers = 1, numChoices = 5, scattered = true, numExtraMin = 1, numExtraMax = 2, imageCount = 4, skip = 1 }
		},
		{
				gameType = "question",
				nextWaypoint = false,				
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = -50, startRange = 5, endRange = 10, answerRange = 4, category = "numbers" },
				
				questions = { questionType1 = "Which 2 numbers add up to", questionType2 = "random", numAnswers = 3, numChoices = 5, scattered = true, imageCount = 9, skip = 1 }	
				
		},
	
	},
	
	totallyRandomDeluxe = {
		{
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Touch an equation, then", line2 = "the card with the answer.", spacing = 20, scale = .8, offsetX = 0, offsetY = -69 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 76, vSpacing = 93, scale = .8, offsetX = 0, offsetY = -23, startRange = 1, endRange = 5, category = "numbersToEquations" },	
				matching = { mode = "showme", classic = true, layout = 6, symbol = "random", numRandom = true, showMeMode = 2 }
		},	
		{
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What comes next?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 1, endRange = 60, answerRange = 2, category = "numbers" },
				
				sequence = { numItems = 5, itemsScale = .875, itemsSpacing = 80, blankLocation = "random", placeMatch = "random", skip = 3, startNum = "random", patternLength = 1, order = "ascending", numChoices = 3 }
		},
		{
				gameType = "puzzleSlots",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.2, offsetX = 0, offsetY = 50, startRange = 1, endRange = 60, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 5, numChoices = 3, scattered = true, imageCount = "random", skip = 3, skipPattern = "", startNum = "", order = "ascending" },
				puzzle = { imageSet = "CardsClassic", number = "random", minRand = 1, maxRand = 70, incorrectChoices = 2, minSlotNum = 3, maxSlotNum = 5, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		},
		{
				gameType = "question",
				nextWaypoint = false,				
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = -50, startRange = 6, endRange = 15, answerRange = 4, category = "numbers" },
				
				questions = { questionType1 = "Which 2 numbers add up to", questionType2 = "random", numAnswers = 3, numChoices = 5, scattered = true, imageCount = 9, skip = 1 }	
				
		},
		{
				gameType = "complex equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0},
				cards = { scale = .93, offsetX = 0, offsetY = 40, startRange = 1, endRange = 10, category = "numbers" },
				
				equations = { sign = "random", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, choiceThreeBlank = false, answerBlank = true, numChoices = 4, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		{
				
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.04, offsetX = 0, offsetY = -58, startRange = 50, endRange = 99, answerRange = 4, category = "numbers" },
				questions = { questionType1 = "Which number is", questionType2 = "GreaterLess", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 1 }
		
				
		},
		{
				gameType = "basketGreaterLessThan",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 0, startRange = 5, endRange = 5, numStartRange = 50, numEndRange = 97, numCorrectMin = 1, numCorrectMax = 3, answerRange = 2, category = "numbers" },
				questions = { questionType1 = "basketGreaterLessThan", questionType2 = "random", numAnswers = 1, numChoices = 5, scattered = true, numExtraMin = 1, numExtraMax = 2, imageCount = 4, skip = 1 }
		},
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -70 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -20, startRange = 50, endRange = 99, category = "numbers" },
				questions = { questionType1 = "AllGreaterLessThan", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 1, skip = 1 },
				counting = { rowNum = 2, columnNum = 2, spacing = 13, startNum = "random", skip = 1 }
		},
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the word problem.", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				equation = { scale = 0.8, offsetX = 0, offsetY = 0 },
				cards = { scale = .9, offsetX = 0, offsetY = 40, startRange = 3, endRange = 10, category = "numbers" },
				questions = { questionType1 = "Word problem", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 6, skip = 1 }	
		},
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 120,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -67},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 30, startRange = 2, endRange = 5, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many apples", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -42, startRange = 20, endRange = 90, answerRange = 3, category = "numbers" },
				questions = { questionType1 = "Which is", questionType2 = "more than", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = 10, skipMin = 10, skipMax = 10 }
		},	
		{
				
				gameType = "puzzleSlots",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -36 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.4, offsetX = 0, offsetY = 50, startRange = 0, endRange = 1, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 3, scattered = true, imageCount = "random", skip = 1, skipPattern = "", startNum = "", order = "ascending" },
				puzzle = { imageSet = "CardsNumDifficult", number = "random", minRand = 50, maxRand = 99, incorrectChoices = 2, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		
		},
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 120,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -67},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 30, startRange = 2, endRange = 5, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many apples", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
	
	},



	matching = {
		{
			gameType = "matching",
			nextWaypoint = true,
			grayBGY = 140,
			question = { line1 = "Touch an equation, then", line2 = "the card with the answer.", spacing = 20, scale = .8, offsetX = 0, offsetY = -67 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 10, endRange = 20, category = "numbersToEquations" },	
			matching = { mode = "showme", layout = 1, symbol = "random", numRandom = true }
		},	
		{
			gameType = "matching",
			nextWaypoint = true,
			grayBGY = 140,
			question = { line1 = "Touch an equation, then", line2 = "the card with the answer.", spacing = 20, scale = .8, offsetX = 0, offsetY = -67 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 1, endRange = 10, category = "numbersToEquations" },	
			matching = { mode = "memory", layout = 1, symbol = "random", numRandom = true }
		},	
		{
			gameType = "matching",
			nextWaypoint = true,
			grayBGY = 140,
			question = { line1 = "Touch an equation, then", line2 = "the card with the answer.", spacing = 20, scale = .8, offsetX = 0, offsetY = -67 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 10, endRange = 20, category = "numbersToEquations" },	
			matching = { mode = "showme", layout = 3, symbol = "random", numRandom = true }
		},	
		{
			gameType = "matching",
			nextWaypoint = true,
			grayBGY = 140,
			question = { line1 = "Touch an equation, then", line2 = "the card with the answer.", spacing = 20, scale = .8, offsetX = 0, offsetY = -67 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 1, endRange = 10, category = "numbersToEquations" },	
			matching = { mode = "memory", layout = 3, symbol = "random", numRandom = true }
		},	
		{
			gameType = "matching",
			nextWaypoint = true,
			grayBGY = 140,
			question = { line1 = "Touch an equation, then", line2 = "the card with the answer.", spacing = 20, scale = .8, offsetX = 0, offsetY = -67 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 10, endRange = 20, category = "numbersToEquations" },	
			matching = { mode = "showme", layout = 5, symbol = "random", numRandom = true }
		},	
		{
			gameType = "matching",
			nextWaypoint = true,
			grayBGY = 140,
			question = { line1 = "Touch an equation, then", line2 = "the card with the answer.", spacing = 20, scale = .8, offsetX = 0, offsetY = -67 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 1, endRange = 10, category = "numbersToEquations" },	
			matching = { mode = "memory", layout = 5, symbol = "random", numRandom = true }
		},	
		{
			gameType = "matching",
			nextWaypoint = true,
			grayBGY = 140,
			question = { line1 = "Touch an equation, then", line2 = "the card with the answer.", spacing = 20, scale = .8, offsetX = 0, offsetY = -67 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 10, endRange = 20, category = "numbersToEquations" },	
			matching = { mode = "showme", layout = 9, symbol = "random", numRandom = true }
		},	
		{
			gameType = "matching",
			nextWaypoint = true,
			grayBGY = 140,
			question = { line1 = "Touch an equation, then", line2 = "the card with the answer.", spacing = 20, scale = .8, offsetX = 0, offsetY = -67 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 1, endRange = 10, category = "numbersToEquations" },	
			matching = { mode = "memory", layout = 9, symbol = "random", numRandom = true }
		},	
		{
			gameType = "matching",
			nextWaypoint = true,
			grayBGY = 140,
			question = { line1 = "Touch an equation, then", line2 = "the card with the answer.", spacing = 20, scale = .8, offsetX = 0, offsetY = -67 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 10, endRange = 20, category = "numbersToEquations" },	
			matching = { mode = "showme", layout = 14, symbol = "random", numRandom = true }
		},	
		{
			gameType = "matching",
			nextWaypoint = true,
			grayBGY = 140,
			question = { line1 = "Touch an equation, then", line2 = "the card with the answer.", spacing = 20, scale = .8, offsetX = 0, offsetY = -67 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 1, endRange = 10, category = "numbersToEquations" },	
			matching = { mode = "memory", layout = 14, symbol = "random", numRandom = true }
		},	
	},
	
	counting = {
		{
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 3, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 4, answerRange = 2, category = "numbersDots" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		{
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 9},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 1, endRange = 3, answerRange = 2, category = "numbersDots" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		{
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		{
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 9},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 0, endRange = 3, answerRange = 2, category = "numbersDots" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		{
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 2, endRange = 5, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "numbersDots" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		{
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 5},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		{
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "numbers" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		{
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 4},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 0, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		{
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 4},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 2, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		{
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 4},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 0, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
	},
	
	sequenceTest = {
		{
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 3, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		{
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 10, endRange = 100, answerRange = 2, category = "numbers" },
				sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 90, blankLocation = "random", skip = 1, startNum = "random", patternLength = 4, numChoices = 4 }
		},
		{				
				gameType = "counting",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
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
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -50, startRange = 3, endRange = 50, category = "numbers" },
				
				counting = { rowNum = 5, columnNum = 1, spacing = 10, startNum = "random", skip = 1 }
		},
		{
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 50, endRange = 100, answerRange = 2, category = "numbers" },
				sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 90, blankLocation = "random", skip = 1, startNum = 15, patternLength = 4, numChoices = 4 }
		},
		
		{
				
				gameType = "counting",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = -35, startRange = 3, endRange = 100, category = "numbers" },
				
				counting = { rowNum = 4, columnNum = 2, spacing = 10, startNum = "random", skip = 1 }
		},
		{
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 3, endRange = 100, answerRange = 2, category = "numbers" },
				sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 90, blankLocation = "random", skip = 1, startNum = 15, patternLength = 4, numChoices = 4 }
		},
		{
				
				gameType = "counting",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -50, startRange = 3, endRange = 100, category = "numbers" },
				
				counting = { rowNum = 5, columnNum = 1, spacing = 10, startNum = "random", skip = 1 }
		},
		
		
		
		
		{
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 10, endRange = 20, answerRange = 2, category = "numbers" },
				sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 90, blankLocation = "random", skip = 1, startNum = 15, patternLength = 4, numChoices = 4 }
		},
		{
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 10, endRange = 20, answerRange = 2, category = "numbers" },
				sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 90, blankLocation = "random", skip = 1, startNum = 15, patternLength = 4, numChoices = 4 }
		},
		{
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 10, endRange = 20, answerRange = 2, category = "numbers" },
				sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 90, blankLocation = "random", skip = 1, startNum = 15, patternLength = 4, numChoices = 4 }
		},
	},
	
	subtractionTest = {
		{
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 3, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		{
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 10, endRange = 100, answerRange = 2, category = "numbers" },
				sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 90, blankLocation = "random", skip = 1, startNum = "random", patternLength = 4, numChoices = 4 }
		},
		{				
				gameType = "counting",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
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
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -50, startRange = 3, endRange = 50, category = "numbers" },
				
				counting = { rowNum = 5, columnNum = 1, spacing = 10, startNum = "random", skip = 1 }
		},
		{
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 50, endRange = 100, answerRange = 2, category = "numbers" },
				sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 90, blankLocation = "random", skip = 1, startNum = 15, patternLength = 4, numChoices = 4 }
		},
		
		{
				
				gameType = "counting",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = -35, startRange = 3, endRange = 100, category = "numbers" },
				
				counting = { rowNum = 4, columnNum = 2, spacing = 10, startNum = "random", skip = 1 }
		},
		{
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 3, endRange = 100, answerRange = 2, category = "numbers" },
				sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 90, blankLocation = "random", skip = 1, startNum = 15, patternLength = 4, numChoices = 4 }
		},
		{
				
				gameType = "counting",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -50, startRange = 3, endRange = 100, category = "numbers" },
				
				counting = { rowNum = 5, columnNum = 1, spacing = 10, startNum = "random", skip = 1 }
		},
		
		
		
		
		{
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 10, endRange = 20, answerRange = 2, category = "numbers" },
				sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 90, blankLocation = "random", skip = 1, startNum = 15, patternLength = 4, numChoices = 4 }
		},
		{
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 10, endRange = 20, answerRange = 2, category = "numbers" },
				sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 90, blankLocation = "random", skip = 1, startNum = 15, patternLength = 4, numChoices = 4 }
		},
		{
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 10, endRange = 20, answerRange = 2, category = "numbers" },
				sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 90, blankLocation = "random", skip = 1, startNum = 15, patternLength = 4, numChoices = 4 }
		},
	},
	
	matchingTest = {
			{
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Touch a number, then a card", line2 = "with the same number of items.", spacing = 20, scale = .8, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 4, endRange = 10, category = "numbersToGroups" },
				matching = { mode = "showme", layout = 5, numRandom = true }
			},
			{
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Touch a number, then a card", line2 = "with the same number of items.", spacing = 20, scale = .8, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 6, endRange = 10, category = "numbersToGroups" },
				matching = { mode = "showme", layout = 9, numRandom = true }
			},
			{
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Find the matching shapes!", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -34 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .9, offsetX = 0, offsetY = -12, startRange = 1, endRange = 5, category = "shapeToShape" },
				
				matching = { mode = "memory", layout = 5, numRandom = true }
			},
			{
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Touch a shape, then another", line2 = "card with the same shape.", spacing = 20, scale = .8, offsetX = 0, offsetY = -34 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .9, offsetX = 0, offsetY = -12, startRange = 5, endRange = 10, category = "shapeToShapeItem" },
				matching = { mode = "showme", layout = 9, numRandom = true }  
			},
			{
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Match the number cards.", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 1, endRange = 10, category = "numberToNumber" },
				matching = { mode = "memory", layout = 5, numRandom = true }
				
			},
			{
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Match the number cards.", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 1, endRange = 10, category = "numberToNumber" },
				matching = { mode = "memory", layout = 9, numRandom = true }  		
			},
			{
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Touch an item, then another", line2 = "item with the same color.", spacing = 20, scale = .8, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 4, endRange = 9, category = "shapeToShapeItem" },
				matching = { mode = "memory", layout = 5, numRandom = true }  		
			},
			{
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Touch an item, then another", line2 = "item with the same color.", spacing = 20, scale = .8, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 4, endRange = 9, category = "shapeToShapeItem" },
				matching = { mode = "memory", layout = 9, numRandom = true }  		
			},
	
		},
	
	sequence = {
		{
			gameType = "sequence",
			nextWaypoint = false,
			grayBGY = 125,
			question = { line1 = "What comes next?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -40 },
		  	equation = { scale = .85, offsetX = 0, offsetY = 0 },
			cards = { scale = .825, offsetX = 0, offsetY = 35, startRange = 1, endRange = 20, answerRange = 3, category = "numbers" },
			sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 40, blankLocation = 4, skip = 1, skipPattern = "", startNum = "random", patternLength = 2, order = "ascending", numChoices = 3 }
		},
		{
			gameType = "sequence",
			nextWaypoint = false,
			grayBGY = 125,
			question = { line1 = "What comes next?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -40 },
		  	equation = { scale = .85, offsetX = 0, offsetY = 0 },
			cards = { scale = .825, offsetX = 0, offsetY = 35, startRange = 10, endRange = 30, answerRange = 3, category = "numbers" },
			sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 40, blankLocation = 4, skip = 1, skipPattern = "", startNum = "random", patternLength = 2, order = "ascending", numChoices = 3 }
		},
		{
			gameType = "sequence",
			nextWaypoint = false,
			grayBGY = 125,
			question = { line1 = "What comes next?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -40 },
		  	equation = { scale = .85, offsetX = 0, offsetY = 0 },
			cards = { scale = .825, offsetX = 0, offsetY = 35, startRange = 10, endRange = 30, answerRange = 3, category = "numbers" },
			sequence = { numItems = 5, itemsScale = .875, itemsSpacing = 40, blankLocation = 5, skip = 1, skipPattern = "", startNum = "random", patternLength = 2, order = "descending", numChoices = 5 }
		},
		{
			gameType = "sequence",
			nextWaypoint = false,
			grayBGY = 125,
			question = { line1 = "What comes next?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -40 },
		  	equation = { scale = .85, offsetX = 0, offsetY = 0 },
			cards = { scale = .825, offsetX = 0, offsetY = 35, startRange = 1, endRange = 30, answerRange = 3, category = "numbers" },
			sequence = { numItems = 5, itemsScale = .875, itemsSpacing = 40, blankLocation = 5, skip = 2, skipPattern = "", startNum = "random", patternLength = 2, order = "ascending", numChoices = 4 }
		},
		{
			gameType = "sequence",
			nextWaypoint = false,
			grayBGY = 125,
			question = { line1 = "What comes next?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -40 },
		  	equation = { scale = .85, offsetX = 0, offsetY = 0 },
			cards = { scale = .825, offsetX = 0, offsetY = 35, startRange = 40, endRange = 80, answerRange = 3, category = "numbers" },
			sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 40, blankLocation = 4, skip = 1, skipPattern = "", startNum = "random", patternLength = 2, order = "ascending", numChoices = 3 }
		},
		{
			gameType = "sequence",
			nextWaypoint = false,
			grayBGY = 125,
			question = { line1 = "What comes next?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -40 },
		  	equation = { scale = .85, offsetX = 0, offsetY = 0 },
			cards = { scale = .825, offsetX = 0, offsetY = 35, startRange = 30, endRange = 60, answerRange = 3, category = "numbers" },
			sequence = { numItems = 5, itemsScale = .875, itemsSpacing = 40, blankLocation = 5, skip = 2, skipPattern = "", startNum = "random", patternLength = 2, order = "ascending", numChoices = 3 }
		},
		{
			gameType = "sequence",
			nextWaypoint = false,
			grayBGY = 125,
			question = { line1 = "What comes next?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -40 },
		  	equation = { scale = .85, offsetX = 0, offsetY = 0 },
			cards = { scale = .825, offsetX = 0, offsetY = 35, startRange = 40, endRange = 80, answerRange = 3, category = "numbers" },
			sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 40, blankLocation = 4, skip = 2, skipPattern = "", startNum = "random", patternLength = 2, order = "ascending", numChoices = 4 }
		},
		{
			gameType = "sequence",
			nextWaypoint = false,
			grayBGY = 125,
			question = { line1 = "What comes next?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -40 },
		  	equation = { scale = .85, offsetX = 0, offsetY = 0 },
			cards = { scale = .825, offsetX = 0, offsetY = 35, startRange = 60, endRange = 95, answerRange = 3, category = "numbers" },
			sequence = { numItems = 5, itemsScale = .875, itemsSpacing = 40, blankLocation = 5, skip = 1, skipPattern = "", startNum = "random", patternLength = 2, order = "descending", numChoices = 3}
		},
		{
			gameType = "sequence",
			nextWaypoint = false,
			grayBGY = 125,
			question = { line1 = "What comes next?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -40 },
		  	equation = { scale = .85, offsetX = 0, offsetY = 0 },
			cards = { scale = .825, offsetX = 0, offsetY = 35, startRange = 30, endRange = 95, answerRange = 3, category = "numbers" },
			sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 40, blankLocation = 4, skip = 2, skipPattern = "", startNum = "random", patternLength = 2, order = "ascending", numChoices = 4 }
		},
		{
			gameType = "sequence",
			nextWaypoint = false,
			grayBGY = 125,
			question = { line1 = "What comes next?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -40 },
		  	equation = { scale = .85, offsetX = 0, offsetY = 0 },
			cards = { scale = .825, offsetX = 0, offsetY = 35, startRange = 10, endRange = 60, answerRange = 3, category = "numbers" },
			sequence = { numItems = 5, itemsScale = .875, itemsSpacing = 40, blankLocation = 5, skip = 3, skipPattern = "", startNum = "random", patternLength = 2, order = "ascending", numChoices = 4 }
		},
		{
			gameType = "sequence",
			nextWaypoint = false,
			grayBGY = 125,
			question = { line1 = "What comes next?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -40 },
		  	equation = { scale = .85, offsetX = 0, offsetY = 0 },
			cards = { scale = .825, offsetX = 0, offsetY = 35, startRange = 20, endRange = 60, answerRange = 3, category = "numbers" },
			sequence = { numItems = 5, itemsScale = .875, itemsSpacing = 40, blankLocation = 5, skip = 2, skipPattern = "", startNum = "random", patternLength = 2, order = "descending", numChoices = 3 }
		},
		{
			gameType = "sequence",
			nextWaypoint = false,
			grayBGY = 125,
			question = { line1 = "What comes next?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -40 },
		  	equation = { scale = .85, offsetX = 0, offsetY = 0 },
			cards = { scale = .825, offsetX = 0, offsetY = 35, startRange = 70, endRange = 95, answerRange = 3, category = "numbers" },
			sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 40, blankLocation = 4, skip = 2, skipPattern = "", startNum = "random", patternLength = 2, order = "ascending", numChoices = 4 }
		},
		{
			gameType = "sequence",
			nextWaypoint = false,
			grayBGY = 125,
			question = { line1 = "What comes next?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -40 },
		  	equation = { scale = .85, offsetX = 0, offsetY = 0 },
			cards = { scale = .825, offsetX = 0, offsetY = 35, startRange = 60, endRange = 95, answerRange = 3, category = "numbers" },
			sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 40, blankLocation = 4, skip = 3, skipPattern = "", startNum = "random", patternLength = 2, order = "descending", numChoices = 3 }
		},
		{
			gameType = "sequence",
			nextWaypoint = false,
			grayBGY = 125,
			question = { line1 = "What comes next?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -40 },
		  	equation = { scale = .85, offsetX = 0, offsetY = 0 },
			cards = { scale = .825, offsetX = 0, offsetY = 35, startRange = 80, endRange = 95, answerRange = 3, category = "numbers" },
			sequence = { numItems = 5, itemsScale = .875, itemsSpacing = 40, blankLocation = 5, skip = 2, skipPattern = "", startNum = "random", patternLength = 2, order = "ascending", numChoices = 4 }
		},
		{
			gameType = "sequence",
			nextWaypoint = false,
			grayBGY = 125,
			question = { line1 = "What comes next?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -40 },
		  	equation = { scale = .85, offsetX = 0, offsetY = 0 },
			cards = { scale = .825, offsetX = 0, offsetY = 35, startRange = 80, endRange = 95, answerRange = 3, category = "numbers" },
			sequence = { numItems = 5, itemsScale = .875, itemsSpacing = 40, blankLocation = 5, skip = 3, skipPattern = "", startNum = "random", patternLength = 2, order = "descending", numChoices = 4 }
		},
		
		
	},
	
	equation = {
		{
			gameType = "equation",
			nextWaypoint = false,
			grayBGY = 140,
			question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -27 },
			equation = { scale = 0.85, offsetX = 0, offsetY = 3},
			cards = { scale = .85, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "numbers" },
			equations = { sign = "random", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -32, dotsOffsetX = -2.75 }
		},
		{
			gameType = "equation",
			nextWaypoint = false,
			grayBGY = 140,
			question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -27 },
			equation = { scale = 0.85, offsetX = 0, offsetY = 3},
			cards = { scale = .85, offsetX = 0, offsetY = 50, startRange = 2, endRange = 9, answerRange = 2, category = "numbers" },
			equations = { sign = "random", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -32, dotsOffsetX = -2.75 }
		},
		{
			gameType = "equation",
			nextWaypoint = false,
			grayBGY = 140,
			question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -27 },
			equation = { scale = 0.85, offsetX = 0, offsetY = 3},
			cards = { scale = .85, offsetX = 0, offsetY = 50, startRange = 5, endRange = 10, answerRange = 2, category = "numbers" },
			equations = { sign = "random", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 4, choicesRandom = true, dotsOffsetY = -32, dotsOffsetX = -2.75 }
		},
		{
			gameType = "equation",
			nextWaypoint = false,
			grayBGY = 140,
			question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -27 },
			equation = { scale = 0.85, offsetX = 0, offsetY = 3},
			cards = { scale = .85, offsetX = 0, offsetY = 50, startRange = 3, endRange = 10, answerRange = 2, category = "numbers" },
			equations = { sign = "random", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 4, choicesRandom = true, dotsOffsetY = -32, dotsOffsetX = -2.75 }
		},
		{
			gameType = "equation",
			nextWaypoint = false,
			grayBGY = 140,
			question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -27 },
			equation = { scale = 0.85, offsetX = 0, offsetY = 3},
			cards = { scale = .85, offsetX = 0, offsetY = 50, startRange = 5, endRange = 13, answerRange = 2, category = "numbers" },
			equations = { sign = "random", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 4, choicesRandom = true, dotsOffsetY = -32, dotsOffsetX = -2.75 }
		},
		{
			gameType = "equation",
			nextWaypoint = false,
			grayBGY = 140,
			question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -27 },
			equation = { scale = 0.85, offsetX = 0, offsetY = 3},
			cards = { scale = .85, offsetX = 0, offsetY = 50, startRange = 7, endRange = 14, answerRange = 2, category = "numbers" },
			equations = { sign = "random", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -32, dotsOffsetX = -2.75 }
		},
		{
			gameType = "equation",
			nextWaypoint = false,
			grayBGY = 140,
			question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -27 },
			equation = { scale = 0.85, offsetX = 0, offsetY = 3},
			cards = { scale = .85, offsetX = 0, offsetY = 50, startRange = 9, endRange = 15, answerRange = 2, category = "numbers" },
			equations = { sign = "random", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 4, choicesRandom = true, dotsOffsetY = -32, dotsOffsetX = -2.75 }
		},
		{
			gameType = "equation",
			nextWaypoint = false,
			grayBGY = 140,
			question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -27 },
			equation = { scale = 0.85, offsetX = 0, offsetY = 3},
			cards = { scale = .85, offsetX = 0, offsetY = 50, startRange = 10, endRange = 19, answerRange = 2, category = "numbers" },
			equations = { sign = "random", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 4, choicesRandom = true, dotsOffsetY = -32, dotsOffsetX = -2.75 }
		},
		{
			gameType = "equation",
			nextWaypoint = false,
			grayBGY = 140,
			question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -27 },
			equation = { scale = 0.85, offsetX = 0, offsetY = 3},
			cards = { scale = .85, offsetX = 0, offsetY = 50, startRange = 15, endRange = 20, answerRange = 2, category = "numbers" },
			equations = { sign = "random", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -32, dotsOffsetX = -2.75 }
		},
		{
			gameType = "equation",
			nextWaypoint = false,
			grayBGY = 140,
			question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -27 },
			equation = { scale = 0.85, offsetX = 0, offsetY = 3},
			cards = { scale = .85, offsetX = 0, offsetY = 50, startRange = 15, endRange = 20, answerRange = 2, category = "numbers" },
			equations = { sign = "random", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 4, choicesRandom = true, dotsOffsetY = -32, dotsOffsetX = -2.75 }
		},
		
		
		{
			gameType = "equation",
			nextWaypoint = false,
			grayBGY = 140,
			question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -27 },
			equation = { scale = 0.85, offsetX = 0, offsetY = 3},
			cards = { scale = .85, offsetX = 0, offsetY = 50, startRange = 5, endRange = 13, answerRange = 2, category = "numbers" },
			equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 4, choicesRandom = true, dotsOffsetY = -32, dotsOffsetX = -2.75 }
		},
		{
			gameType = "equation",
			nextWaypoint = false,
			grayBGY = 140,
			question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -27 },
			equation = { scale = 0.85, offsetX = 0, offsetY = 3},
			cards = { scale = .85, offsetX = 0, offsetY = 50, startRange = 7, endRange = 14, answerRange = 2, category = "numbers" },
			equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -32, dotsOffsetX = -2.75 }
		},
		{
			gameType = "equation",
			nextWaypoint = false,
			grayBGY = 140,
			question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -27 },
			equation = { scale = 0.85, offsetX = 0, offsetY = 3},
			cards = { scale = .85, offsetX = 0, offsetY = 50, startRange = 9, endRange = 15, answerRange = 2, category = "numbers" },
			equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 4, choicesRandom = true, dotsOffsetY = -32, dotsOffsetX = -2.75 }
		},
		{
			gameType = "equation",
			nextWaypoint = false,
			grayBGY = 140,
			question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -27 },
			equation = { scale = 0.85, offsetX = 0, offsetY = 3},
			cards = { scale = .85, offsetX = 0, offsetY = 50, startRange = 10, endRange = 19, answerRange = 2, category = "numbers" },
			equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 4, choicesRandom = true, dotsOffsetY = -32, dotsOffsetX = -2.75 }
		},
		{
			gameType = "equation",
			nextWaypoint = false,
			grayBGY = 140,
			question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -27 },
			equation = { scale = 0.85, offsetX = 0, offsetY = 3},
			cards = { scale = .85, offsetX = 0, offsetY = 50, startRange = 15, endRange = 20, answerRange = 2, category = "numbers" },
			equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -32, dotsOffsetX = -2.75 }
		},
		{
			gameType = "equation",
			nextWaypoint = false,
			grayBGY = 140,
			question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -27 },
			equation = { scale = 0.85, offsetX = 0, offsetY = 3},
			cards = { scale = .85, offsetX = 0, offsetY = 50, startRange = 15, endRange = 20, answerRange = 2, category = "numbers" },
			equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 4, choicesRandom = true, dotsOffsetY = -32, dotsOffsetX = -2.75 }
		},
		
		
		
		
		
		{
			gameType = "equation",
			nextWaypoint = false,
			grayBGY = 140,
			question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -27 },
			equation = { scale = 0.85, offsetX = 0, offsetY = 3},
			cards = { scale = .85, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "numbers" },
			equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -32, dotsOffsetX = -2.75 }
		},
		{
			gameType = "equation",
			nextWaypoint = false,
			grayBGY = 140,
			question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -27 },
			equation = { scale = 0.85, offsetX = 0, offsetY = 3},
			cards = { scale = .85, offsetX = 0, offsetY = 50, startRange = 2, endRange = 9, answerRange = 2, category = "numbers" },
			equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -32, dotsOffsetX = -2.75 }
		},
		{
			gameType = "equation",
			nextWaypoint = false,
			grayBGY = 140,
			question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -27 },
			equation = { scale = 0.85, offsetX = 0, offsetY = 3},
			cards = { scale = .85, offsetX = 0, offsetY = 50, startRange = 5, endRange = 10, answerRange = 2, category = "numbers" },
			equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 4, choicesRandom = true, dotsOffsetY = -32, dotsOffsetX = -2.75 }
		},
		{
			gameType = "equation",
			nextWaypoint = false,
			grayBGY = 140,
			question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -27 },
			equation = { scale = 0.85, offsetX = 0, offsetY = 3},
			cards = { scale = .85, offsetX = 0, offsetY = 50, startRange = 3, endRange = 10, answerRange = 2, category = "numbers" },
			equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 4, choicesRandom = true, dotsOffsetY = -32, dotsOffsetX = -2.75 }
		},
		{
			gameType = "equation",
			nextWaypoint = false,
			grayBGY = 140,
			question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -27 },
			equation = { scale = 0.85, offsetX = 0, offsetY = 3},
			cards = { scale = .85, offsetX = 0, offsetY = 50, startRange = 5, endRange = 13, answerRange = 2, category = "numbers" },
			equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 4, choicesRandom = true, dotsOffsetY = -32, dotsOffsetX = -2.75 }
		},
		{
			gameType = "equation",
			nextWaypoint = false,
			grayBGY = 140,
			question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -27 },
			equation = { scale = 0.85, offsetX = 0, offsetY = 3},
			cards = { scale = .85, offsetX = 0, offsetY = 50, startRange = 7, endRange = 14, answerRange = 2, category = "numbers" },
			equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -32, dotsOffsetX = -2.75 }
		},
		{
			gameType = "equation",
			nextWaypoint = false,
			grayBGY = 140,
			question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -27 },
			equation = { scale = 0.85, offsetX = 0, offsetY = 3},
			cards = { scale = .85, offsetX = 0, offsetY = 50, startRange = 9, endRange = 15, answerRange = 2, category = "numbers" },
			equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 4, choicesRandom = true, dotsOffsetY = -32, dotsOffsetX = -2.75 }
		},
		{
			gameType = "equation",
			nextWaypoint = false,
			grayBGY = 140,
			question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -27 },
			equation = { scale = 0.85, offsetX = 0, offsetY = 3},
			cards = { scale = .85, offsetX = 0, offsetY = 50, startRange = 10, endRange = 19, answerRange = 2, category = "numbers" },
			equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 4, choicesRandom = true, dotsOffsetY = -32, dotsOffsetX = -2.75 }
		},
		{
			gameType = "equation",
			nextWaypoint = false,
			grayBGY = 140,
			question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -27 },
			equation = { scale = 0.85, offsetX = 0, offsetY = 3},
			cards = { scale = .85, offsetX = 0, offsetY = 50, startRange = 15, endRange = 20, answerRange = 2, category = "numbers" },
			equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -32, dotsOffsetX = -2.75 }
		},
		{
			gameType = "equation",
			nextWaypoint = false,
			grayBGY = 140,
			question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -27 },
			equation = { scale = 0.85, offsetX = 0, offsetY = 3},
			cards = { scale = .85, offsetX = 0, offsetY = 50, startRange = 15, endRange = 20, answerRange = 2, category = "numbers" },
			equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 4, choicesRandom = true, dotsOffsetY = -32, dotsOffsetX = -2.75 }
		},
		
		
		{
			gameType = "equation",
			nextWaypoint = false,
			grayBGY = 140,
			question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -27 },
			equation = { scale = 0.85, offsetX = 0, offsetY = 3},
			cards = { scale = .85, offsetX = 0, offsetY = 50, startRange = 5, endRange = 13, answerRange = 2, category = "numbers" },
			equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 4, choicesRandom = true, dotsOffsetY = -32, dotsOffsetX = -2.75 }
		},
		{
			gameType = "equation",
			nextWaypoint = false,
			grayBGY = 140,
			question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -27 },
			equation = { scale = 0.85, offsetX = 0, offsetY = 3},
			cards = { scale = .85, offsetX = 0, offsetY = 50, startRange = 7, endRange = 14, answerRange = 2, category = "numbers" },
			equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -32, dotsOffsetX = -2.75 }
		},
		{
			gameType = "equation",
			nextWaypoint = false,
			grayBGY = 140,
			question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -27 },
			equation = { scale = 0.85, offsetX = 0, offsetY = 3},
			cards = { scale = .85, offsetX = 0, offsetY = 50, startRange = 9, endRange = 15, answerRange = 2, category = "numbers" },
			equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 4, choicesRandom = true, dotsOffsetY = -32, dotsOffsetX = -2.75 }
		},
		{
			gameType = "equation",
			nextWaypoint = false,
			grayBGY = 140,
			question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -27 },
			equation = { scale = 0.85, offsetX = 0, offsetY = 3},
			cards = { scale = .85, offsetX = 0, offsetY = 50, startRange = 10, endRange = 19, answerRange = 2, category = "numbers" },
			equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 4, choicesRandom = true, dotsOffsetY = -32, dotsOffsetX = -2.75 }
		},
		{
			gameType = "equation",
			nextWaypoint = false,
			grayBGY = 140,
			question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -27 },
			equation = { scale = 0.85, offsetX = 0, offsetY = 3},
			cards = { scale = .85, offsetX = 0, offsetY = 50, startRange = 15, endRange = 20, answerRange = 2, category = "numbers" },
			equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -32, dotsOffsetX = -2.75 }
		},
		{
			gameType = "equation",
			nextWaypoint = false,
			grayBGY = 140,
			question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -27 },
			equation = { scale = 0.85, offsetX = 0, offsetY = 3},
			cards = { scale = .85, offsetX = 0, offsetY = 50, startRange = 15, endRange = 20, answerRange = 2, category = "numbers" },
			equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 4, choicesRandom = true, dotsOffsetY = -32, dotsOffsetX = -2.75 }
		},
		
	},
	
	howMany = {
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 140,
			question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 3, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
		},
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 140,
			question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 4, endRange = 8, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
		},
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 140,
			question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
			equation = { scale = .95, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 15, endRange = 20, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
		},
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 140,
			question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 3, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
		},
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 140,
			question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 4, endRange = 8, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
		},
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 140,
			question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
			equation = { scale = .95, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 15, endRange = 20, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
		},
	},
	
	greaterLessEqual = {
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 140,				
			question = { line1 = "Greater than,", line2 = "less than, or equal to?", spacing = 20, scale = .9, offsetX = 0, offsetY = -44 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 10, category = "numbers" },
			questions = { questionType1 = "Greater Less Equal", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, skip = 1 }
		},
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 140,				
			question = { line1 = "Greater than,", line2 = "less than, or equal to?", spacing = 20, scale = .9, offsetX = 0, offsetY = -44 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 10, endRange = 20, category = "numbers" },
			questions = { questionType1 = "Greater Less Equal", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, skip = 1 }
		},
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 140,				
			question = { line1 = "Greater than,", line2 = "less than, or equal to?", spacing = 20, scale = .9, offsetX = 0, offsetY = -44 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 20, endRange = 30, category = "numbers" },
			questions = { questionType1 = "Greater Less Equal", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, skip = 1 }
		},
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 140,				
			question = { line1 = "Greater than,", line2 = "less than, or equal to?", spacing = 20, scale = .9, offsetX = 0, offsetY = -44 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 30, endRange = 40, category = "numbers" },
			questions = { questionType1 = "Greater Less Equal", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, skip = 1 }
		},
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 140,				
			question = { line1 = "Greater than,", line2 = "less than, or equal to?", spacing = 20, scale = .9, offsetX = 0, offsetY = -44 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 40, endRange = 50, category = "numbers" },
			questions = { questionType1 = "Greater Less Equal", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, skip = 1 }
		},
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 140,				
			question = { line1 = "Greater than,", line2 = "less than, or equal to?", spacing = 20, scale = .9, offsetX = 0, offsetY = -44 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 50, endRange = 60, category = "numbers" },
			questions = { questionType1 = "Greater Less Equal", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, skip = 1 }
		},
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 140,				
			question = { line1 = "Greater than,", line2 = "less than, or equal to?", spacing = 20, scale = .9, offsetX = 0, offsetY = -44 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 60, endRange = 70, category = "numbers" },
			questions = { questionType1 = "Greater Less Equal", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, skip = 1 }
		},
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 140,				
			question = { line1 = "Greater than,", line2 = "less than, or equal to?", spacing = 20, scale = .9, offsetX = 0, offsetY = -44 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 70, endRange = 80, category = "numbers" },
			questions = { questionType1 = "Greater Less Equal", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, skip = 1 }
		},
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 140,				
			question = { line1 = "Greater than,", line2 = "less than, or equal to?", spacing = 20, scale = .9, offsetX = 0, offsetY = -44 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 80, endRange = 90, category = "numbers" },
			questions = { questionType1 = "Greater Less Equal", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, skip = 1 }
		},
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 140,				
			question = { line1 = "Greater than,", line2 = "less than, or equal to?", spacing = 20, scale = .9, offsetX = 0, offsetY = -44 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 90, endRange = 100, category = "numbers" },
			questions = { questionType1 = "Greater Less Equal", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, skip = 1 }
		},
	},
	
	whichOneIs = {
		{
			gameType = "question",
			nextWaypoint = false,
			grayBGY = 140,				
			question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .96, offsetX = 0, offsetY = -28, startRange = 1, endRange = 10, category = "numbers" },
			questions = { questionType1 = "Which one is", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 1, skip = 1 }
		},
		{
			gameType = "question",
			nextWaypoint = false,
			grayBGY = 140,				
			question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .96, offsetX = 0, offsetY = -28, startRange = 10, endRange = 20, category = "numbers" },
			questions = { questionType1 = "Which one is", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 1, skip = 1 }
		},
		{
			gameType = "question",
			nextWaypoint = false,
			grayBGY = 140,				
			question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .96, offsetX = 0, offsetY = -28, startRange = 20, endRange = 50, category = "numbers" },
			questions = { questionType1 = "Which one is", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 1, skip = 1 }
		},
		{
			gameType = "question",
			nextWaypoint = false,
			grayBGY = 140,				
			question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .96, offsetX = 0, offsetY = -28, startRange = 50, endRange = 100, category = "numbers" },
			questions = { questionType1 = "Which one is", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 1, skip = 1 }
		},
		{
			gameType = "question",
			nextWaypoint = false,
			grayBGY = 140,				
			question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .96, offsetX = 0, offsetY = -28, startRange = 30, endRange = 80, category = "numbers" },
			questions = { questionType1 = "Which one is", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 1, skip = 1 }
		},
		{
			gameType = "question",
			nextWaypoint = false,
			grayBGY = 140,				
			question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .96, offsetX = 0, offsetY = -28, startRange = 30, endRange = 80, category = "numbers" },
			questions = { questionType1 = "Which one is", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 1, skip = 1 }
		},
		
	},
	
	whichNumIsMissing = {
		{
			gameType = "question",
			nextWaypoint = false,
			grayBGY = 140,
			question = { line1 = "Which number is missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -35 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 65, startRange = 10, endRange = 30, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "Which number is missing", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 4, skip = 1 }
		},
		{
			gameType = "question",
			nextWaypoint = false,
			grayBGY = 140,
			question = { line1 = "Which number is missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -35 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 65, startRange = 5, endRange = 15, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "Which number is missing", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 6, skip = 1 }
		},
		{
			gameType = "question",
			nextWaypoint = false,
			grayBGY = 140,
			question = { line1 = "Which number is missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -35 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 65, startRange = 15, endRange = 25, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "Which number is missing", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 8, skip = 1 }
		},
		{
			gameType = "question",
			nextWaypoint = false,
			grayBGY = 140,
			question = { line1 = "Which number is missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -35 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 65, startRange = 10, endRange = 40, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "Which number is missing", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 10, skip = 1 }
		},
		{
			gameType = "question",
			nextWaypoint = false,
			grayBGY = 140,
			question = { line1 = "Which number is missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -35 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 65, startRange = 20, endRange = 50, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "Which number is missing", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 6, skip = 1 }
		},
		{
			gameType = "question",
			nextWaypoint = false,
			grayBGY = 140,
			question = { line1 = "Which number is missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -35 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 65, startRange = 5, endRange = 30, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "Which number is missing", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 12, skip = 1 }
		},
		{
			gameType = "question",
			nextWaypoint = false,
			grayBGY = 140,
			question = { line1 = "Which number is missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -35 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 65, startRange = 20, endRange = 70, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "Which number is missing", questionType2 = "random", numAnswers = 1, numChoices = 5, scattered = true, imageCount = 10, skip = 1 }
		},
		{
			gameType = "question",
			nextWaypoint = false,
			grayBGY = 140,
			question = { line1 = "Which number is missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -35 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 65, startRange = 21, endRange = 60, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "Which number is missing", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 12, skip = 1 }
		},
		{
			gameType = "question",
			nextWaypoint = false,
			grayBGY = 140,
			question = { line1 = "Which number is missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -35 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 65, startRange = 41, endRange = 80, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "Which number is missing", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 10, skip = 1 }
		},
		{
			gameType = "question",
			nextWaypoint = false,
			grayBGY = 140,
			question = { line1 = "Which number is missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -35 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 65, startRange = 61, endRange = 99, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "Which number is missing", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 8, skip = 1 }
		},
	},
	
	whichIsMoreThan = {
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 140,				
			question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .96, offsetX = 0, offsetY = -28, startRange = 1, endRange = 20, answerRange = 3, category = "numbers" },
			questions = { questionType1 = "Which is", questionType2 = "more than", numAnswers = 1, numChoices = 2, scattered = true, imageCount = 9, skip = 1 }
		},	
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 140,				
			question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .96, offsetX = 0, offsetY = -28, startRange = 8, endRange = 20, answerRange = 3, category = "numbers" },
			questions = { questionType1 = "Which is", questionType2 = "less than", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, skip = 1 }
		},	
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 140,				
			question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .96, offsetX = 0, offsetY = -28, startRange = 15, endRange = 30, answerRange = 3, category = "numbers" },
			questions = { questionType1 = "Which is", questionType2 = "more than", numAnswers = 1, numChoices = 2, scattered = true, imageCount = 9, skip = 10 }
		},	
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 140,				
			question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .96, offsetX = 0, offsetY = -28, startRange = 20, endRange = 40, answerRange = 3, category = "numbers" },
			questions = { questionType1 = "Which is", questionType2 = "less than", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, skip = 10 }
		},	
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 140,				
			question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .96, offsetX = 0, offsetY = -28, startRange = 30, endRange = 60, answerRange = 3, category = "numbers" },
			questions = { questionType1 = "Which is", questionType2 = "more than", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 9, skip = 10 }
		},	
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 140,				
			question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .96, offsetX = 0, offsetY = -28, startRange = 10, endRange = 70, answerRange = 3, category = "numbers" },
			questions = { questionType1 = "Which is", questionType2 = "less than", numAnswers = 1, numChoices = 5, scattered = true, imageCount = 9, skip = 10 }
		},	
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 140,				
			question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .96, offsetX = 0, offsetY = -28, startRange = 50, endRange = 80, answerRange = 3, category = "numbers" },
			questions = { questionType1 = "Which is", questionType2 = "more than", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, skip = 10 }
		},	
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 140,				
			question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .96, offsetX = 0, offsetY = -28, startRange = 60, endRange = 80, answerRange = 3, category = "numbers" },
			questions = { questionType1 = "Which is", questionType2 = "less than", numAnswers = 1, numChoices = 5, scattered = true, imageCount = 9, skip = 10 }
		},
{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 140,				
			question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .96, offsetX = 0, offsetY = -28, startRange = 70, endRange = 90, answerRange = 3, category = "numbers" },
			questions = { questionType1 = "Which is", questionType2 = "more than", numAnswers = 1, numChoices = 5, scattered = true, imageCount = 9, skip = 10 }
		},	
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 140,				
			question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .96, offsetX = 0, offsetY = -28, startRange = 85, endRange = 99, answerRange = 3, category = "numbers" },
			questions = { questionType1 = "Which is", questionType2 = "less than", numAnswers = 1, numChoices = 5, scattered = true, imageCount = 9, skip = 10 }
		},			
	},
	
	whichSentence = {
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 155,	
			question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -30},
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { rotation = 90, scale = .8, offsetX = 0, offsetY = 60, startRange = 2, endRange = 4, category = "random" },
			questions = { questionType1 = "Which sentence", questionType2 = "addition", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 1, skip = 1 }
		},	
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 155,	
			question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -30},
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { rotation = 90, scale = .8, offsetX = 0, offsetY = 60, startRange = 5, endRange = 10, category = "random" },
			questions = { questionType1 = "Which sentence", questionType2 = "addition", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 1, skip = 1 }
		},	
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 155,	
			question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -30},
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { rotation = 90, scale = .8, offsetX = 0, offsetY = 60, startRange = 8, endRange = 15, category = "random" },
			questions = { questionType1 = "Which sentence", questionType2 = "addition", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 1, skip = 1 }
		},	
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 155,	
			question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -30},
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { rotation = 90, scale = .8, offsetX = 0, offsetY = 60, startRange = 2, endRange = 4, category = "random" },
			questions = { questionType1 = "Which sentence", questionType2 = "addition", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 1, skip = 1 }
		},	
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 155,	
			question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -30},
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { rotation = 90, scale = .8, offsetX = 0, offsetY = 60, startRange = 5, endRange = 10, category = "random" },
			questions = { questionType1 = "Which sentence", questionType2 = "addition", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 1, skip = 1 }
		},	
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 155,	
			question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -30},
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { rotation = 90, scale = .8, offsetX = 0, offsetY = 60, startRange = 8, endRange = 15, category = "random" },
			questions = { questionType1 = "Which sentence", questionType2 = "addition", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 1, skip = 1 }
		},	
	},
	
	whichSignIsMissing = {
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 140,
			question = { line1 = "Which sign is missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, category = "numbers" },
			
			questions = { questionType1 = "Which sign is missing", questionType2 = "random", numAnswers = 1, numChoices = 2, scattered = true, imageCount = "random", skip = 1 }
		},
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 140,
			question = { line1 = "Which sign is missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 9, endRange = 15, category = "numbers" },
			
			questions = { questionType1 = "Which sign is missing", questionType2 = "random", numAnswers = 1, numChoices = 2, scattered = true, imageCount = "random", skip = 1 }
		},
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 140,
			question = { line1 = "Which sign is missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 10, endRange = 20, category = "numbers" },
			
			questions = { questionType1 = "Which sign is missing", questionType2 = "random", numAnswers = 1, numChoices = 2, scattered = true, imageCount = "random", skip = 1 }
		},
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 140,
			question = { line1 = "Which sign is missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 15, endRange = 20, category = "numbers" },
			
			questions = { questionType1 = "Which sign is missing", questionType2 = "random", numAnswers = 1, numChoices = 2, scattered = true, imageCount = "random", skip = 1 }
		},
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 140,
			question = { line1 = "Which sign is missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 20, endRange = 40, category = "numbers" },
			
			questions = { questionType1 = "Which sign is missing", questionType2 = "random", numAnswers = 1, numChoices = 2, scattered = true, imageCount = "random", skip = 1 }
		},
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 140,
			question = { line1 = "Which sign is missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 20, endRange = 40, category = "numbers" },
			
			questions = { questionType1 = "Which sign is missing", questionType2 = "random", numAnswers = 1, numChoices = 2, scattered = true, imageCount = "random", skip = 1 }
		},
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 140,
			question = { line1 = "Which sign is missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 10, endRange = 40, category = "numbers" },
			
			questions = { questionType1 = "Which sign is missing", questionType2 = "random", numAnswers = 1, numChoices = 2, scattered = true, imageCount = "random", skip = 1 }
		},
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 140,
			question = { line1 = "Which sign is missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 30, endRange = 60, category = "numbers" },
			
			questions = { questionType1 = "Which sign is missing", questionType2 = "random", numAnswers = 1, numChoices = 2, scattered = true, imageCount = "random", skip = 1 }
		},
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 140,
			question = { line1 = "Which sign is missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 50, endRange = 80, category = "numbers" },
			
			questions = { questionType1 = "Which sign is missing", questionType2 = "random", numAnswers = 1, numChoices = 2, scattered = true, imageCount = "random", skip = 1 }
		},
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 140,
			question = { line1 = "Which sign is missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 70, endRange = 99, category = "numbers" },
			
			questions = { questionType1 = "Which sign is missing", questionType2 = "random", numAnswers = 1, numChoices = 2, scattered = true, imageCount = "random", skip = 1 }
		},
		
		---addition only
		
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 140,
			question = { line1 = "Which sign is missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, category = "numbers" },
			
			questions = { questionType1 = "Which sign is missing", questionType2 = "+", numAnswers = 1, numChoices = 2, scattered = true, imageCount = "random", skip = 1 }
		},
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 140,
			question = { line1 = "Which sign is missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 9, endRange = 15, category = "numbers" },
			
			questions = { questionType1 = "Which sign is missing", questionType2 = "+", numAnswers = 1, numChoices = 2, scattered = true, imageCount = "random", skip = 1 }
		},
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 140,
			question = { line1 = "Which sign is missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 10, endRange = 20, category = "numbers" },
			
			questions = { questionType1 = "Which sign is missing", questionType2 = "+", numAnswers = 1, numChoices = 2, scattered = true, imageCount = "random", skip = 1 }
		},
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 140,
			question = { line1 = "Which sign is missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 15, endRange = 20, category = "numbers" },
			
			questions = { questionType1 = "Which sign is missing", questionType2 = "+", numAnswers = 1, numChoices = 2, scattered = true, imageCount = "random", skip = 1 }
		},
		
	},
	
	howManyApples = {
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 140,
			question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 4, endRange = 7, answerRange = 2, category = "apples" },
			questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 140,
			question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 8, endRange = 12, answerRange = 2, category = "apples" },
			questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 140,
			question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 9, endRange = 14, answerRange = 2, category = "apples" },
			questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 140,
			question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 10, endRange = 15, answerRange = 2, category = "apples" },
			questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 140,
			question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 13, endRange = 17, answerRange = 2, category = "apples" },
			questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 140,
			question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 15, endRange = 19, answerRange = 2, category = "apples" },
			questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		
		
		
		
		
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 140,
			question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 4, endRange = 7, answerRange = 2, category = "apples" },
			questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 140,
			question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 8, endRange = 12, answerRange = 2, category = "apples" },
			questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 140,
			question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 9, endRange = 14, answerRange = 2, category = "apples" },
			questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 140,
			question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 10, endRange = 15, answerRange = 2, category = "apples" },
			questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 140,
			question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 13, endRange = 17, answerRange = 2, category = "apples" },
			questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 140,
			question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 15, endRange = 19, answerRange = 2, category = "apples" },
			questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
	},
	
	which2NumAddUpTo = {
		{
			gameType = "question",
			nextWaypoint = true,				
			grayBGY = 140,
			question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30},
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .9, offsetX = 0, offsetY = -28, startRange = 1, endRange = 7, category = "numbers" },
			questions = { questionType1 = "Which 2 numbers add up to", questionType2 = "random", numAnswers = 2, numChoices = 3, scattered = true, imageCount = 9, skip = 1 }		
		},
		{
			gameType = "question",
			nextWaypoint = true,				
			grayBGY = 140,
			question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30},
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .9, offsetX = 0, offsetY = -28, startRange = 6, endRange = 12, category = "numbers" },
			questions = { questionType1 = "Which 2 numbers add up to", questionType2 = "random", numAnswers = 2, numChoices = 3, scattered = true, imageCount = 9, skip = 1 }		
		},
		{
			gameType = "question",
			nextWaypoint = true,				
			grayBGY = 140,
			question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30},
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .9, offsetX = 0, offsetY = -28, startRange = 10, endRange = 16, category = "numbers" },
			questions = { questionType1 = "Which 2 numbers add up to", questionType2 = "random", numAnswers = 2, numChoices = 3, scattered = true, imageCount = 9, skip = 1 }		
		},
		{
			gameType = "question",
			nextWaypoint = true,				
			grayBGY = 140,
			question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30},
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .9, offsetX = 0, offsetY = -28, startRange = 15, endRange = 20, category = "numbers" },
			questions = { questionType1 = "Which 2 numbers add up to", questionType2 = "random", numAnswers = 2, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }		
		},
		{
			gameType = "question",
			nextWaypoint = true,				
			grayBGY = 140,
			question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30},
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .9, offsetX = 0, offsetY = -28, startRange = 1, endRange = 20, category = "numbers" },
			questions = { questionType1 = "Which 2 numbers add up to", questionType2 = "random", numAnswers = 2, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }		
		},
		{
			gameType = "question",
			nextWaypoint = true,				
			grayBGY = 140,
			question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30},
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .9, offsetX = 0, offsetY = -28, startRange = 10, endRange = 20, category = "numbers" },
			questions = { questionType1 = "Which 2 numbers add up to", questionType2 = "random", numAnswers = 2, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }		
		},
		{
			gameType = "question",
			nextWaypoint = true,				
			grayBGY = 140,
			question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30},
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .9, offsetX = 0, offsetY = -28, startRange = 15, endRange = 20, category = "numbers" },
			questions = { questionType1 = "Which 2 numbers add up to", questionType2 = "random", numAnswers = 2, numChoices = 5, scattered = true, imageCount = 9, skip = 1 }		
		},
		{
			gameType = "question",
			nextWaypoint = true,				
			grayBGY = 140,
			question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30},
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .9, offsetX = 0, offsetY = -28, startRange = 1, endRange = 20, category = "numbers" },
			questions = { questionType1 = "Which 2 numbers add up to", questionType2 = "random", numAnswers = 2, numChoices = 5, scattered = true, imageCount = 9, skip = 1 }		
		},
		{
			gameType = "question",
			nextWaypoint = true,				
			grayBGY = 140,
			question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30},
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .9, offsetX = 0, offsetY = -28, startRange = 1, endRange = 20, category = "numbers" },
			questions = { questionType1 = "Which 2 numbers add up to", questionType2 = "random", numAnswers = 2, numChoices = 5, scattered = true, imageCount = 9, skip = 1 }		
		},
		{
			gameType = "question",
			nextWaypoint = true,				
			grayBGY = 140,
			question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30},
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .9, offsetX = 0, offsetY = -28, startRange = 1, endRange = 20, category = "numbers" },
			questions = { questionType1 = "Which 2 numbers add up to", questionType2 = "random", numAnswers = 2, numChoices = 5, scattered = true, imageCount = 9, skip = 1 }		
		},
	},
	
	trueOrFalse = {
		
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 155,				
			question = { line1 = "True or false?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -12 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { rotation = 90, scale = .8, offsetX = 0, offsetY = 60, startRange = 4, endRange = 9, category = "random" },
			questions = { questionType1 = "TrueOrFalse", questionType2 = "random", symbol = "+", numAnswers = 1, numChoices = 2, scattered = true, imageCount = 1, skip = 1 }		
		},
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 155,				
			question = { line1 = "True or false?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -12 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { rotation = 90, scale = .8, offsetX = 0, offsetY = 60, startRange = 9, endRange = 12, category = "random" },
			questions = { questionType1 = "TrueOrFalse", questionType2 = "random", symbol = "-", numAnswers = 1, numChoices = 2, scattered = true, imageCount = 1, skip = 1 }		
		},
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 155,				
			question = { line1 = "True or false?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -12 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { rotation = 90, scale = .8, offsetX = 0, offsetY = 60, startRange = 13, endRange = 20, category = "random" },
			questions = { questionType1 = "TrueOrFalse", questionType2 = "random", symbol = "-", numAnswers = 1, numChoices = 2, scattered = true, imageCount = 1, skip = 1 }		
		},
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 155,				
			question = { line1 = "True or false?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -12 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { rotation = 90, scale = .8, offsetX = 0, offsetY = 60, startRange = 4, endRange = 9, category = "random" },
			questions = { questionType1 = "TrueOrFalse", questionType2 = "random", symbol = "+", numAnswers = 1, numChoices = 2, scattered = true, imageCount = 1, skip = 1 }		
		},
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 155,				
			question = { line1 = "True or false?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -12 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { rotation = 90, scale = .8, offsetX = 0, offsetY = 60, startRange = 9, endRange = 12, category = "random" },
			questions = { questionType1 = "TrueOrFalse", questionType2 = "random", symbol = "-", numAnswers = 1, numChoices = 2, scattered = true, imageCount = 1, skip = 1 }		
		},
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 155,				
			question = { line1 = "True or false?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -12 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { rotation = 90, scale = .8, offsetX = 0, offsetY = 60, startRange = 13, endRange = 20, category = "random" },
			questions = { questionType1 = "TrueOrFalse", questionType2 = "random", symbol = "-", numAnswers = 1, numChoices = 2, scattered = true, imageCount = 1, skip = 1 }		
		},
	},
	
	howManyAre = {
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 140,
			question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 7, skip = 1 }
		},
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 140,
			question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 2, endRange = 6, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 7, skip = 1 }
		},
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 140,
			question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 3, endRange = 8, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }
		},
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 140,
			question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 4, endRange = 8, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, skip = 1 }
		},
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 140,
			question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 5, endRange = 10, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 1 }
		},
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 140,
			question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 5, endRange = 10, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 1 }
		},
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 140,
			question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 8, endRange = 15, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 5, scattered = true, imageCount = "random", skip = 1 }
		},
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 140,
			question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 8, endRange = 15, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 5, scattered = true, imageCount = "random", skip = 1 }
		},
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 140,
			question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 15, endRange = 20, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 1 }
		},
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 140,
			question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 14, endRange = 20, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 5, scattered = true, imageCount = "random", skip = 1 }
		},
	},
	
	
	colorsNumbersAndShapesMarathon = {
		{
			gameType = "counting",
			nextWaypoint = false,
			grayBGY = 140,
			question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .95, offsetX = 0, offsetY = -35, startRange = 50, endRange = 100, category = "numbers" },
			
			counting = { rowNum = 4, columnNum = 2, spacing = 10, startNum = "random", skip = 1 }
		},
		{
			gameType = "question",
			nextWaypoint = true,
			grayBGY = 140,
			question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 11, endRange = 20, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = false, imageCount = "random", skip = 1 }
		},
		{
			gameType = "basket",
			nextWaypoint = true,
			grayBGY = 140,
			question = { line1 = "", line2 = "", spacing = 20, scale = .85, offsetX = 0, offsetY = -65 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 5, endRange = 10, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, numExtraMin = 0, numExtraMax = 0, imageCount = "random", skip = 1 }
				
		},
		{
			gameType = "matching",
			nextWaypoint = false,
			grayBGY = 140,
			question = { line1 = "Touch a color, then another", line2 = "card with the same color.", spacing = 20, scale = .8, offsetX = 0, offsetY = -67 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 4, endRange = 8, category = "colorToColorItem" },
			matching = { mode = "showme", layout = 9, numRandom = true }
				
		},
		{
			gameType = "question",
			nextWaypoint = false,
			grayBGY = 140,				
			question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = 1, offsetX = 0, offsetY = -50, startRange = 5, endRange = 10, answerRange = 5, category = "shape" },
			questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 5, scattered = true, imageCount = 9, skip = 1 }
		},
		{
			gameType = "puzzleSlots",
			nextWaypoint = false, --false,
			grayBGY = 140,
			question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 9, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 },
			puzzle = { imageSet = "Num", number = "random", minRand = 12, maxRand = 20, incorrectChoices = 1, maskSet = 3, otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "slotAlpha", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
				
		},
		{
			gameType = "sequence",
			nextWaypoint = false,
			grayBGY = 140,
			question = { line1 = "What comes next?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .85, offsetX = 0, offsetY = 60, startRange = 50, endRange = 100, answerRange = 2, category = "numbers" },
			
			sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 80, blankLocation = 4, skip = 1, startNum = "random", patternLength = 3, numChoices = 3 }
		},
		{
			gameType = "matching",
			nextWaypoint = true,
			grayBGY = 140,
			question = { line1 = "Touch a number, then a card", line2 = "with the same number of items.", spacing = 20, scale = .8, offsetX = 0, offsetY = -67 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 3, endRange = 10, category = "numbersToGroups" },
			matching = { mode = "showme", layout = 5, numRandom = true }
		},
		{
			gameType = "touchCounting",
			nextWaypoint = false,
			grayBGY = 140,
			question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -65 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = 1, offsetX = 0, offsetY = 50, startRange = 6, endRange = 10, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
		},
		{
			gameType = "question",
			nextWaypoint = false,
			grayBGY = 118,
			question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -67},
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 5, answerRange = 2, category = "apples" },
			
			questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
	},
	
	whichTwoDeluxe = {
		{
			gameType = "question",
			nextWaypoint = true,				
			grayBGY = 140,
			question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30},
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .9, offsetX = 0, offsetY = -28, startRange = 2, endRange = 5, category = "numbers" },
			questions = { questionType1 = "Which 2 numbers add up to", questionType2 = "random", numAnswers = 2, numChoices = 3, scattered = true, imageCount = 9, skip = 1 }		
		},
		{
			gameType = "question",
			nextWaypoint = true,				
			grayBGY = 140,
			question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30},
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .9, offsetX = 0, offsetY = -28, startRange = 2, endRange = 5, category = "numbers" },
			questions = { questionType1 = "Which 2 numbers add up to", questionType2 = "random", numAnswers = 2, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }		
		},
		{
			gameType = "question",
			nextWaypoint = true,				
			grayBGY = 140,
			question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30},
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .9, offsetX = 0, offsetY = -28, startRange = 2, endRange = 5, category = "numbers" },
			questions = { questionType1 = "Which 2 numbers add up to", questionType2 = "random", numAnswers = 2, numChoices = 5, scattered = true, imageCount = 9, skip = 1 }		
		},
	},
	
	puzzleFrenzy = {
		{
			gameType = "puzzle",
			nextWaypoint = true, --false,
			grayBGY = 140,
			question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 3, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 },
			puzzle = { imageSet = "Num", typeSet = "Color", number = "random", minRand = 5, maxRand = 10, maskSet = 3, otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "slotAlpha", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
				
		},
		{
			gameType = "puzzleSlots",
			nextWaypoint = false, --false,
			grayBGY = 140,
			question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 9, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 },
			puzzle = { imageSet = "NumDifficult", number = "random", minRand = 11, maxRand = 20, incorrectChoices = 2, maskSet = 3, otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "slotAlpha", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
				
		},
		{
			gameType = "puzzleSlots",
			nextWaypoint = false, --false,
			grayBGY = 140,
			question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 10, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 5, numChoices = 3, scattered = true, imageCount = "random", skip = 1 },
			puzzle = { imageSet = "", number = "random", minRand = 1, maxRand = 10, incorrectChoices = 0, maskSet = 3, otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "slotAlpha", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
				
		},
		{
			gameType = "puzzle",
			nextWaypoint = true, --false,
			grayBGY = 140,
			question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 3, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 },
			puzzle = { imageSet = "Objects", typeSet = "Shapes", number = "random", minRand = 5, maxRand = 5, maskSet = 3, otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "slotAlpha", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
				
		},
		{
			gameType = "puzzle",
			nextWaypoint = true, --false,
			grayBGY = 140,
			question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 3, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 },
			puzzle = { imageSet = "Objects", typeSet = "Color", number = "random", minRand = 5, maxRand = 5, maskSet = 3, otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "slotAlpha", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
				
		},
	
	},
	
	
	
	PickEvenOdd = {
		{
			gameType = "question",
			nextWaypoint = false,
			grayBGY = 140,				
			question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -33 },
			equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = 0.8, offsetX = 0, offsetY = 0, startRange = 1, endRange = 10, category = "numbers" },
			questions = { questionType1 = "PickEvenOdd", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 1, skip = 1 },
			counting = { rowNum = 3, columnNum = 2, spacing = 13, startNum = "random", skip = 1 }
		},
	},	
		
	level23 = { --Webster the Duck: Sequences & Patterns
		{
				gameType = "sequence",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "What comes next?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 1, endRange = 10, answerRange = 2, category = "numbers" },
				
				sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 80, blankLocation = 4, skip = 1, startNum = 1, patternLength = 3, numChoices = 3 }
		},
		{
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 1, endRange = 10, answerRange = 2, category = "numbers" },
				
				sequence = { numItems = 5, itemsScale = .875, itemsSpacing = 80, blankLocation = 5, skip = 1, startNum = "random", patternLength = 4, numChoices = 3 }
		},
		{
				gameType = "sequence",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "What comes next?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 1, endRange = 14, answerRange = 2, category = "numbers" },
				
				sequence = { numItems = 5, itemsScale = .875, itemsSpacing = 80, blankLocation = 5, skip = 1, startNum = 8, patternLength = 2, numChoices = 4 }
		},
		{
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 6, endRange = 14, answerRange = 2, category = "numbers" },
				
				sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 80, blankLocation = "random", skip = 1, startNum = "random", patternLength = 2, numChoices = 3 }
		},
		{
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What comes next?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 1, endRange = 15, answerRange = 2, category = "numbers" },
				
				sequence = { numItems = 5, itemsScale = .875, itemsSpacing = 80, blankLocation = 5, skip = 1, startNum = 9, patternLength = 5, numChoices = 3 }
		},
		
		{
				gameType = "sequence",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "What comes next?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 8, endRange = 20, answerRange = 2, category = "numbers" },
				
				sequence = { numItems = 5, itemsScale = .875, itemsSpacing = 80, blankLocation = 5, skip = 1, startNum = "random", patternLength = 3, numChoices = 4 }
		},
		{
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 7, endRange = 20, answerRange = 2, category = "numbers" },
				
				sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 80, blankLocation = "random", skip = 1, startNum = 7, patternLength = 3, numChoices = 3 }
		},
		{
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What comes next?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 10, endRange = 20, answerRange = 2, category = "numbers" },
				
				sequence = { numItems = 5, itemsScale = .875, itemsSpacing = 90, blankLocation = 5, skip = 1, startNum = 14, patternLength = 3, numChoices = 4 }
		},
		{
				gameType = "sequence",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 12, endRange = 20, answerRange = 2, category = "numbers" },
				sequence = { numItems = 5, itemsScale = .875, itemsSpacing = 90, blankLocation = "random", skip = 1, startNum = 12, patternLength = 4, numChoices = 3 }
		},
		{
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 10, endRange = 20, answerRange = 2, category = "numbers" },
				sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 90, blankLocation = "random", skip = 1, startNum = 15, patternLength = 4, numChoices = 4 }
		},
		
	},
		
	level24 = { --Chloe the Fox:
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -50, startRange = 45, endRange = 99, answerRange = 20, category = "numbers" },
				
				questions = { questionType1 = "Which number is", questionType2 = "FirstLast", numAnswers = 1, numChoices = 3, scattered = false, imageCount = 12, skip = 1 }
		},
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -50, startRange = 23, endRange = 99, answerRange = 23, category = "numbers" },
				
				questions = { questionType1 = "Which number is", questionType2 = "FirstLast", numAnswers = 1, numChoices = 3, scattered = false, imageCount = 12, skip = 1 }
		},
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -50, startRange = 15, endRange = 99, answerRange = 13, category = "numbers" },
				
				questions = { questionType1 = "Which number is", questionType2 = "FirstLast", numAnswers = 1, numChoices = 4, scattered = false, imageCount = 12, skip = 1 }
		},
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -50, startRange = 9, endRange = 45, answerRange = 3, category = "numbers" },
				
				questions = { questionType1 = "Which number is", questionType2 = "FirstLast", numAnswers = 1, numChoices = 3, scattered = false, imageCount = 12, skip = 1 }
		},
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -50, startRange = 10, endRange = 99, answerRange = 20, category = "numbers" },
				
				questions = { questionType1 = "Which number is", questionType2 = "FirstLast", numAnswers = 1, numChoices = 4, scattered = false, imageCount = 12, skip = 1 }
		},
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -50, startRange = 7, endRange = 50, answerRange = 10, category = "numbers" },
				
				questions = { questionType1 = "Which number is", questionType2 = "FirstLast", numAnswers = 1, numChoices = 4, scattered = false, imageCount = 12, skip = 1 }
		},
		
		
	},
		
	level25 = { --Percival The Puppy: Counting to 10
		game1 = {
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Touch a number, then a card", line2 = "with the same number of items.", spacing = 20, scale = .8, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 1, endRange = 5, category = "numbersToGroups" },
				matching = { mode = "showme", layout = 5, numRandom = true }
		},
		game2 = {
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Touch a number, then a card", line2 = "with the same number of items.", spacing = 20, scale = .8, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 3, endRange = 7, category = "numbersToGroups" },
				matching = { mode = "showme", layout = 5, numRandom = true }
		},
		game3 = {
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Touch a number, then a card", line2 = "with the same number of items.", spacing = 20, scale = .8, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 2, endRange = 9, category = "numbersToGroups" },
				matching = { mode = "showme", layout = 5, numRandom = true }
		},
		game4 = {
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Touch a number, then a card", line2 = "with the same number of items.", spacing = 20, scale = .8, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 3, endRange = 10, category = "numbersToGroups" },
				matching = { mode = "showme", layout = 5, numRandom = true }
		},
		game5 = {
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Touch a number, then a card", line2 = "with the same number of items.", spacing = 20, scale = .8, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 4, endRange = 10, category = "numbersToGroups" },
				matching = { mode = "showme", layout = 5, numRandom = true }
		},
		game6 = {
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Touch a number, then a card", line2 = "with the same number of items.", spacing = 20, scale = .8, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 6, endRange = 10, category = "numbersToGroups" },
				matching = { mode = "showme", layout = 5, numRandom = true }
		},
		
	},
		
	level26 = { --Chauncey The Mouse: Comprehensive
		game1 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 10, endRange = 13, answerRange = 3, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = false, imageCount = "random", skip = 1 }
		},
		game2 = {
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Touch a number, then a card", line2 = "with the same number of items.", spacing = 20, scale = .8, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 4, endRange = 8, category = "numbersToGroups" },
				matching = { mode = "showme", layout = 5, numRandom = true }
		},
		
		
		
		game3 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 4, endRange = 8, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 10, skip = 1 }
		},
		game4 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 5, endRange = 9, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 10, skip = 1 }
		},
		game5 = {
				gameType = "sequence",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 6, endRange = 11, answerRange = 2, category = "numbers" },
				sequence = { numItems = 5, itemsScale = .875, itemsSpacing = 90, blankLocation = "random", skip = 1, startNum = 8, patternLength = 4, numChoices = 3 }
		},
		game6 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -50, startRange = 8, endRange = 20, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "Which number is", questionType2 = "FirstLast", numAnswers = 1, numChoices = 4, scattered = false, imageCount = 12, skip = 1 }
		},	
		game7 = {
				gameType = "sequence",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 9, endRange = 15, answerRange = 3, category = "numbers" },
				sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 90, blankLocation = "random", skip = 1, startNum = 10, patternLength = 4, numChoices = 3 }
		},
			
		game8 = {
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Touch a number, then a card", line2 = "with the same number of items.", spacing = 20, scale = .8, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 6, endRange = 10, category = "numbersToGroups" },
				matching = { mode = "showme", layout = 5, numRandom = true }
		},
		game9 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 6, endRange = 10, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = false, imageCount = 18, skip = 1 }
		},
		game10 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 5, endRange = 10, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = false, imageCount = 18, skip = 1 }
		},
		game11 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -50, startRange = 9, endRange = 20, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "Which number is", questionType2 = "FirstLast", numAnswers = 1, numChoices = 4, scattered = false, imageCount = 12, skip = 1 }
		},
		game12 = {
				gameType = "matching",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Touch a number, then a card", line2 = "with the same number of items.", spacing = 20, scale = .8, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 7, endRange = 10, category = "numbersToGroups" },
				matching = { mode = "showme", layout = 5, numRandom = true }
		},
		game13 = {
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 15, endRange = 20, answerRange = 2, category = "numbers" },
				sequence = { numItems = 5, itemsScale = .875, itemsSpacing = 90, blankLocation = "random", skip = 1, startNum = 15, patternLength = 4, numChoices = 4 }
		},
		
		
	},
	
	level27 = { --Cordelia The Chicken:
		game1 = {
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Touch a number, then a card", line2 = "with the same number of items.", spacing = 20, scale = .8, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 1, endRange = 6, category = "numbersToGroups" },
				matching = { mode = "memory", layout = 5, numRandom = true }
		},
		game2 = {
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Touch a number, then a card", line2 = "with the same number of items.", spacing = 20, scale = .8, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 2, endRange = 7, category = "numbersToGroups" },
				matching = { mode = "memory", layout = 9, numRandom = true }
		},
		game3 = {
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Touch a number, then a card", line2 = "with the same number of items.", spacing = 20, scale = .8, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 3, endRange = 8, category = "groupsToGroups" },
				matching = { mode = "memory", layout = 5, numRandom = true }
		},
		game4 = {
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Touch a number, then a card", line2 = "with the same number of items.", spacing = 20, scale = .8, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 4, endRange = 9, category = "numbersToGroups" },
				matching = { mode = "memory", layout = 5, numRandom = true }
		},
		game5 = {
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Touch a number, then a card", line2 = "with the same number of items.", spacing = 20, scale = .8, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 5, endRange = 10, category = "numbersToGroups" },
				matching = { mode = "memory", layout = 9, numRandom = true }
		},
		game6 = {
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Touch a number, then a card", line2 = "with the same number of items.", spacing = 20, scale = .8, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 5, endRange = 10, category = "groupsToGroups" },
				matching = { mode = "memory", layout = 9, numRandom = true }
		},
		
	},
	
	
	
	level28 = { --Chloe the Fox:
		game1 = {
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 1, endRange = 6, answerRange = 2, category = "numbers" },
				sequence = { numItems = 5, itemsScale = .875, itemsSpacing = 90, blankLocation = 5, skip = 2, startNum = 2, patternLength = 4, numChoices = 3 }
		},
		game2 = {
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 1, endRange = 10, answerRange = 2, category = "numbers" },
				sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 90, blankLocation = 4, skip = 2, startNum = 4, patternLength = 3, numChoices = 3 }
		},
		game3 = {
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 1, endRange = 6, answerRange = 2, category = "numbers" },
				sequence = { numItems = 5, itemsScale = .875, itemsSpacing = 90, blankLocation = 5, skip = 2, startNum = 1, patternLength = 4, numChoices = 3 }
		},
		game4 = {
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 2, endRange = 10, answerRange = 2, category = "numbers" },
				sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 90, blankLocation = 4, skip = 2, startNum = 6, patternLength = 4, numChoices = 4 }
		},
		game5 = {
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 2, endRange = 14, answerRange = 2, category = "numbers" },
				sequence = { numItems = 5, itemsScale = .875, itemsSpacing = 90, blankLocation = 5, skip = 2, startNum = 5, patternLength = 4, numChoices = 4 }
		},
		game6 = {
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 2, endRange = 16, answerRange = 2, category = "numbers" },
				sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 90, blankLocation = 4, skip = 5, startNum = 5, patternLength = 4, numChoices = 4 }
		},
		
	},
		
	level29 = { --Chauncey The Mouse: Skip Counting
		game1 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 30, startRange = 4, endRange = 12, answerRange = 2, category = "numbers" },
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 2 }
				
		},
		game2 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 30, startRange = 4, endRange = 14, answerRange = 2, category = "numbers" },
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 2 }
				
		},
		game3 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 30, startRange = 5, endRange = 20, answerRange = 2, category = "numbers" },
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 5 }
				
		},
		game4 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 30, startRange = 10, endRange = 25, answerRange = 2, category = "numbers" },
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 5 }
				
		},
		game5 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 30, startRange = 20, endRange = 50, answerRange = 2, category = "numbers" },
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 10 }
				
		},
		game6 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 30, startRange = 20, endRange = 60, answerRange = 2, category = "numbers" },
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 10 }
				
		},
	},
		
	level30 = { --Sunshine the Bee:
		game1 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 120,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -67},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 30, startRange = 1, endRange = 3, answerRange = 2, category = "apples" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 2, scattered = true, imageCount = "random", skip = 1 }	
		},
		game2 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 120,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -67},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 30, startRange = 1, endRange = 4, answerRange = 2, category = "apples" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game3 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 120,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -67},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 30, startRange = 1, endRange = 5, answerRange = 2, category = "apples" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 2, scattered = true, imageCount = "random", skip = 1 }	
		},
		game4 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 120,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -67},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 30, startRange = 2, endRange = 5, answerRange = 2, category = "apples" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game5 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 120,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -67},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 30, startRange = 3, endRange = 5, answerRange = 2, category = "apples" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game6 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 120,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -67},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 30, startRange = 4, endRange = 5, answerRange = 2, category = "apples" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		
	},	
		
	level31 = { --Percival The Puppy:
		game1 = {
				gameType = "question",
				nextWaypoint = true,				
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = -50, startRange = 1, endRange = 4, answerRange = 2, category = "numbersDots" },
				
				questions = { questionType1 = "Which 2 numbers add up to", questionType2 = 3, numAnswers = 2, numChoices = 3, scattered = true, imageCount = 9, skip = 1 }	
				
		},
		game2 = {
				gameType = "question",
				nextWaypoint = true,				
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = -50, startRange = 2, endRange = 4, answerRange = 2, category = "numbersDots" },
				
				questions = { questionType1 = "Which 2 numbers add up to", questionType2 = 4, numAnswers = 2, numChoices = 3, scattered = true, imageCount = 9, skip = 1 }	
				
		},
		game3 = {
				gameType = "question",
				nextWaypoint = true,				
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = -50, startRange = 3, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				questions = { questionType1 = "Which 2 numbers add up to", questionType2 = "random", numAnswers = 2, numChoices = 3, scattered = true, imageCount = 9, skip = 1 }	
				
		},
		game4 = {
				gameType = "question",
				nextWaypoint = true,				
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = -50, startRange = 1, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				questions = { questionType1 = "Which 2 numbers add up to", questionType2 = 5, numAnswers = 2, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }	
				
		},
		game5 = {
				gameType = "question",
				nextWaypoint = true,				
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = -50, startRange = 3, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				questions = { questionType1 = "Which 2 numbers add up to", questionType2 = "random", numAnswers = 2, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }	
				
		},
		game6 = {
				gameType = "question",
				nextWaypoint = true,				
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = -50, startRange = 3, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				questions = { questionType1 = "Which 2 numbers add up to", questionType2 = "random", numAnswers = 2, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }	
				
		},
		
		
	},
		
	level32 = { --Webster the Duck:
		game1 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 9},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 3, answerRange = 2, category = "numbersDots" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 2, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game2 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 9},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 3, answerRange = 2, category = "numbersDots" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game3 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 9},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 2, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game4 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 9},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game5 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 9},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game6 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 9},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		
		
	},
		
		
		
	level33 = { --Chauncey The Mouse:
		game1 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 116,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -72},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 3, answerRange = 2, category = "numbersDots" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 2, scattered = true, imageCount = "random", skip = 1 }	
		},
		game2 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 116,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -72},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 3, answerRange = 2, category = "numbersDots" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game3 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 116,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -72},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 2, scattered = true, imageCount = "random", skip = 1 }	
		},
		game4 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 116,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -72},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game5 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 116,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -72},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game6 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 116,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -72},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
	},
		
	level34 = { --Cordelia The Chicken:
		game1 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 9},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 3, answerRange = 2, category = "numbers" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 2, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game2 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 9},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 3, answerRange = 2, category = "numbers" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game3 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 9},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbers" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 2, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game4 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 9},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 5, answerRange = 2, category = "numbers" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game5 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 9},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbers" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game6 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 9},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbers" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		
	},
	
	level35 = { --Sunshine the Bee: Addition to 5
		game1 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 118,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -67},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "apples" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game2 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 118,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -67},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 4, endRange = 5, answerRange = 2, category = "apples" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game3 = {
				gameType = "question",
				nextWaypoint = false,				
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = -50, startRange = 3, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				questions = { questionType1 = "Which 2 numbers add up to", questionType2 = "random", numAnswers = 2, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }	
				
		},
		game4 = {
				gameType = "question",
				nextWaypoint = true,				
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = -50, startRange = 3, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				questions = { questionType1 = "Which 2 numbers add up to", questionType2 = "random", numAnswers = 2, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }	
				
		},
		game5 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 9},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game6 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 9},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game7 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 118,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -72},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game8 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 118,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -72},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game9 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 9},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbers" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game10 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 9},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbers" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		
	},
	
	level36 = { --Pete the Frog:
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 116,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -72},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 5, answerRange = 2, category = "apples" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 2, scattered = true, imageCount = "random", skip = 1 }	
		},
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 116,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -72},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 5, answerRange = 2, category = "apples" },
				
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 116,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -72},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "apples" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 2, scattered = true, imageCount = "random", skip = 1 }	
		},
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 116,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -72},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 5, answerRange = 2, category = "apples" },
				
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 116,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -72},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 2, endRange = 5, answerRange = 2, category = "apples" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 116,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -72},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "apples" },
				
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 116,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -72},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 5, answerRange = 2, category = "apples" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 116,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -72},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 5, answerRange = 2, category = "apples" },
				
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 2, scattered = true, imageCount = "random", skip = 1 }	
		},
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 116,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -72},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 5, answerRange = 2, category = "apples" },
				
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 116,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -72},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 2, endRange = 5, answerRange = 2, category = "apples" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 116,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -72},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "apples" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
	},
		
	level37 = { --Percival The Puppy:
		{
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 5, answerRange = 2, category = "numbers" },
				
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		{
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 5, answerRange = 2, category = "numbers" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		{
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbers" },
				
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 2, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		{
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		{
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		{
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		{
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 3, answerRange = 2, category = "numbersDots" },
				
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 2, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		{
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 3, answerRange = 2, category = "numbersDots" },
				
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		{
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 2, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		{
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
	},
		
		
		
	level38 = { --Cordelia The Chicken:
		game1 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 116,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -72},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 3, answerRange = 2, category = "numbersDots" },
				
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 2, scattered = true, imageCount = "random", skip = 1 }	
		},
		game2 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 116,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -72},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 3, answerRange = 2, category = "numbersDots" },
				
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game3 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 116,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -72},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 2, scattered = true, imageCount = "random", skip = 1 }	
		},
		game4 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 116,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -72},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game5 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 116,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -72},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game6 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 116,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -72},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		
		
	},	
		
	level39 = { --Chauncey The Mouse:
		 {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 5, answerRange = 2, category = "numbers" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		{
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 5, answerRange = 2, category = "numbers" },
				
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		{
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbers" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		{
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 5, answerRange = 2, category = "numbers" },
				
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		{
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 2, endRange = 5, answerRange = 2, category = "numbers" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		{
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbers" },
				
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		
	},
		
	level40 = { --Pete the Frog: Subtraction to 5
		{
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 116,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -72},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 5, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 116,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -72},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		{
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = .85, offsetX = 0, offsetY = 9},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbersDots" },
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		{
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = .85, offsetX = 0, offsetY = 9},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 5, answerRange = 2, category = "numbersDots" },
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		
		{
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 116,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -72},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 116,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -72},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		{
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		{
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		{
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		{
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 2, endRange = 5, answerRange = 2, category = "numbers" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		{
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbers" },
				
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		{
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbers" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
	},
		
	level41 = { --Pinkie The Pig:
		game1 = {
				gameType = "matching",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Touch a color, then another", line2 = "card with the same color.", spacing = 20, scale = .8, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 1, endRange = 8, category = "colorToColor" },
				matching = { mode = "showme", layout = 9, numRandom = true }  
		},
		
		game2 = {
				gameType = "puzzle",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 3, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 },
				puzzle = { imageSet = "Objects", typeSet = "Color", number = "random", minRand = 5, maxRand = 5, maskSet = 3, otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "slotAlpha", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
				
		},
		game3 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -50, startRange = 1, endRange = 8, answerRange = 5, category = "colorItem" },
				questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, skip = 1 }
		},
		game4 = {
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Find the matching colors.", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -67 },equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -35, startRange = 1, endRange = 8, category = "colorToColor" },
				matching = { mode = "memory", layout = 9, numRandom = true }  		
		},
		
		
		game5 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -50, startRange = 2, endRange = 8, answerRange = 5, category = "colorItem" },
				questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }
		},
		game6 = {
				gameType = "puzzle",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 3, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 },
				puzzle = { imageSet = "Objects", typeSet = "Color", number = "random", minRand = 5, maxRand = 5, maskSet = 3, otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "slotAlpha", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
				
		},
		game7 = {
				gameType = "matching",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Touch a color, then another", line2 = "card with the same color.", spacing = 20, scale = .8, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 4, endRange = 8, category = "colorToColorItem" },
				matching = { mode = "showme", layout = 9, numRandom = true }
				
		},
		
		game8 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -50, startRange = 3, endRange = 8, answerRange = 5, category = "colorItem" },
				questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 5, scattered = true, imageCount = 9, skip = 1 }
		},
		
		game9 = {
				gameType = "puzzle",
				nextWaypoint = false, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 3, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 },
				puzzle = { imageSet = "Objects", typeSet = "Color", number = "random", minRand = 5, maxRand = 5, maskSet = 3, otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "slotAlpha", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
				
		},
		game10 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -50, startRange = 4, endRange = 8, answerRange = 5, category = "colorItem" },
				questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 5, scattered = true, imageCount = 9, skip = 1 }
		},
		game11 = {
				gameType = "matching",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Find the matching colors.", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -67 },equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -35, startRange = 4, endRange = 8, category = "colorItemToColorItem" },
				matching = { mode = "memory", layout = 9, numRandom = true }  		
		},
		game12 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -50, startRange = 4, endRange = 8, answerRange = 5, category = "colorItem" },
				questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 5, scattered = true, imageCount = 9, skip = 1 }
		},
		
		
	},
		
	level42 = { --Chip the Cardinal:
		game1 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -50, startRange = 1, endRange = 9, answerRange = 5, category = "shapeItem" },
				questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }
		},
		game2 = {
				gameType = "puzzle",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 3, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 5, scattered = true, imageCount = "random", skip = 1 },
				puzzle = { imageSet = "Objects", typeSet = "Color", number = "random", minRand = 5, maxRand = 5, maskSet = 3, otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "slotAlpha", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
			},
		game3 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -50, startRange = 1, endRange = 9, answerRange = 5, category = "shapeItem" },
				questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }
		},
		game4 = {
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Touch an item, then another", line2 = "item with the same shape.", spacing = 20, scale = .8, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 1, endRange = 9, category = "shapeToShape" },
				matching = { mode = "showme", layout = 5, numRandom = true }  		
		},
		game5 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -50, startRange = 1, endRange = 9, answerRange = 5, category = "shapeItem" },
				questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }
		},
		
		
		game6 = {
				gameType = "puzzle",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 8, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 },
				puzzle = { imageSet = "Objects", typeSet = "Color", number = "random", minRand = 5, maxRand = 4, maskSet = 3, otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "slotAlpha", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
			},
		game7 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -50, startRange = 5, endRange = 9, answerRange = 5, category = "shape" },
				questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 5, scattered = true, imageCount = 9, skip = 1 }
		},
		
		
		
		game8 = {
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Touch an item, then another", line2 = "item with the same shape.", spacing = 20, scale = .8, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 4, endRange = 9, category = "shapeToShapeItem" },
				matching = { mode = "memory", layout = 9, numRandom = true }  		
		},
		game9 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -50, startRange = 5, endRange = 9, answerRange = 5, category = "shape" },
				questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 5, scattered = true, imageCount = 9, skip = 1 }
		},
		
	},
	
	
	
	level43 = { --Percival The Puppy:
	
		{
				gameType = "touchCounting",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = 50, startRange = 3, endRange = 5, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
				
		
		},
		{
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 11, endRange = 19, answerRange = 3, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = false, imageCount = "random", skip = 1 }
		},
		{
				gameType = "basket",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .85, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 6, endRange = 10, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, numExtraMin = 0, numExtraMax = 0, imageCount = "random", skip = 1 }
					
		},
		{
				
				gameType = "counting",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = -35, startRange = 30, endRange = 70, category = "numbers" },
				
				counting = { rowNum = 4, columnNum = 2, spacing = 10, startNum = "random", skip = 1 }
		},
		{
				gameType = "touchCounting",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = 50, startRange = 8, endRange = 10, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
		},
		{
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Touch a number, then a card", line2 = "with the same number of items.", spacing = 20, scale = .8, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 1, endRange = 5, category = "numbersToGroups" },
				matching = { mode = "showme", layout = 5, numRandom = true }
		},
		{
				
				gameType = "counting",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -50, startRange = 7, endRange = 80, category = "numbers" },
				
				counting = { rowNum = 5, columnNum = 1, spacing = 10, startNum = "random", skip = 1 }
		},
		
		{
				gameType = "touchCounting",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = 50, startRange = 3, endRange = 10, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
		},
		{
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Touch a number, then a card", line2 = "with the same number of items.", spacing = 20, scale = .8, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 1, endRange = 10, category = "numbersToGroups" },
				matching = { mode = "showme", layout = 5, numRandom = true }
		},
		{
				
				gameType = "counting",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = -35, startRange = 60, endRange = 99, category = "numbers" },
				
				counting = { rowNum = 4, columnNum = 2, spacing = 10, startNum = "random", skip = 1 }
		},
		{
				gameType = "touchCounting",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
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
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = 50, startRange = 5, endRange = 10, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
		},			
		{
				
				gameType = "counting",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = -35, startRange = 10, endRange = 99, category = "numbers" },
				
				counting = { rowNum = 4, columnNum = 2, spacing = 10, startNum = "random", skip = 1 }
		},
		{
				gameType = "matching",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Touch a number, then a card", line2 = "with the same number of items.", spacing = 20, scale = .8, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 1, endRange = 10, category = "numbersToGroups" },
				matching = { mode = "showme", layout = 5, numRandom = true }
		},
		{
				
				gameType = "counting",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = -35, startRange = 12, endRange = 99, category = "numbers" },
				
				counting = { rowNum = 4, columnNum = 2, spacing = 10, startNum = "random", skip = 1 }
		},
		{
				gameType = "touchCounting",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = 50, startRange = 4, endRange = 10, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
		},
		
		
	},
	
	level44 = { --Pete the Frog:
		{
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Touch a color, then another", line2 = "card with the same color.", spacing = 20, scale = .8, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 1, endRange = 8, category = "colorToColor" },
				matching = { mode = "memory", layout = 5, numRandom = true }  
		},
		{
				gameType = "matching",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Touch an item, then another", line2 = "item with the same shape.", spacing = 20, scale = .8, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 1, endRange = 8, category = "shapeToShape" },
				matching = { mode = "memory", layout = 9, numRandom = true }  		
		},
		{
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Touch a number, then a card", line2 = "with the same number of items.", spacing = 20, scale = .8, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 1, endRange = 10, category = "numbersToGroups" },
				matching = { mode = "memory", layout = 5, numRandom = true }
		},
		
		{
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Touch a color, then another", line2 = "card with the same color.", spacing = 20, scale = .8, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 1, endRange = 8, category = "colorToColorItem" },
				matching = { mode = "memory", layout = 9, numRandom = true }  
		},
		{
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Touch an item, then another", line2 = "item with the same shape.", spacing = 20, scale = .8, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 1, endRange = 8, category = "shapeToShapeItem" },
				matching = { mode = "memory", layout = 5, numRandom = true }  		
		},
		{
				gameType = "matching",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Touch a number, then a card", line2 = "with the same number of items.", spacing = 20, scale = .8, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 4, endRange = 10, category = "numbersToGroups" },
				matching = { mode = "memory", layout = 9, numRandom = true }
		},
		
		{
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Touch a color, then another", line2 = "card with the same color.", spacing = 20, scale = .8, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 4, endRange = 8, category = "colorItemToColorItem" },
				matching = { mode = "memory", layout = 5, numRandom = true }  
		},
		{
				gameType = "matching",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Touch an item, then another", line2 = "item with the same shape.", spacing = 20, scale = .8, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 4, endRange = 8, category = "shapeItemToShapeItem" },
				matching = { mode = "memory", layout = 9, numRandom = true }  		
		},
		{
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Touch a number, then a card", line2 = "with the same number of items.", spacing = 20, scale = .8, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 4, endRange = 10, category = "groupsToGroups" },
				matching = { mode = "memory", layout = 5, numRandom = true }
		},
		
		
	},
		
	level45 = { --Chauncey The Mouse:
		game1 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 2, endRange = 10, answerRange = 3, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
		},
		game2 = {
				gameType = "basket",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .85, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 3, endRange = 10, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, numExtraMin = 0, numExtraMax = 0, imageCount = "random", skip = 1 }
					
		},
		game3 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 5, endRange = 10, answerRange = 3, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
		},
		game4 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -50, startRange = 1, endRange = 10, answerRange = 1, category = "groups" },
				
				questions = { questionType1 = "Which number is", questionType2 = "MostLeast", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
		},
		game5 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 7, endRange = 10, answerRange = 3, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
		},
		game6 = {
				gameType = "puzzleSlots",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 5, endRange = 10, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 },
				puzzle = { imageSet = "NumDifficult", number = "random", minRand = 12, maxRand = 17, incorrectChoices = 1, maskSet = 3, otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "slotAlpha", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
				
		},
		game7 = {
				gameType = "basket",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .85, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 6, endRange = 10, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, numExtraMin = 0, numExtraMax = 0, imageCount = "random", skip = 1 }
					
		},
		game8 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 11, endRange = 15, answerRange = 3, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
		},
		game9 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -30 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .96, offsetX = 0, offsetY = -28, startRange = 1, endRange = 10, answerRange = 1, category = "groups" },
				
				questions = { questionType1 = "Which number is", questionType2 = "MostLeast", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
		},
		game10 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 15, endRange = 20, answerRange = 3, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
		},
		game11 = {
				gameType = "puzzleSlots",
				nextWaypoint = false, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 5, endRange = 10, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 },
				puzzle = { imageSet = "NumDifficult", number = "random", minRand = 18, maxRand = 20, incorrectChoices = 1, maskSet = 3, otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "slotAlpha", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
				
		},
		game12 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 17, endRange = 20, answerRange = 3, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
		},
	},
		
	level46 = { --Cordelia The Chicken:
		game1 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 30, startRange = 4, endRange = 12, answerRange = 2, category = "numbers" },
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 2 }
				
		},
		game2 = {
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 1, endRange = 6, answerRange = 2, category = "numbers" },
				sequence = { numItems = 5, itemsScale = .875, itemsSpacing = 90, blankLocation = 5, skip = 2, startNum = 2, patternLength = 4, numChoices = 3 }
		},
		game3 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 30, startRange = 4, endRange = 14, answerRange = 2, category = "numbers" },
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 2 }
				
		},
		
		game4 = {
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 1, endRange = 10, answerRange = 2, category = "numbers" },
				sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 90, blankLocation = 4, skip = 2, startNum = 4, patternLength = 3, numChoices = 3 }
		},
		game5 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 30, startRange = 5, endRange = 20, answerRange = 2, category = "numbers" },
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 5 }
				
		},
		game6 = {
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 1, endRange = 6, answerRange = 2, category = "numbers" },
				sequence = { numItems = 5, itemsScale = .875, itemsSpacing = 90, blankLocation = 5, skip = 2, startNum = 1, patternLength = 4, numChoices = 3 }
		},
		game7 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 30, startRange = 10, endRange = 25, answerRange = 2, category = "numbers" },
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 5 }
				
		},
		game8 = {
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 2, endRange = 10, answerRange = 2, category = "numbers" },
				sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 90, blankLocation = 4, skip = 2, startNum = 6, patternLength = 4, numChoices = 4 }
		},
		game9 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 30, startRange = 20, endRange = 50, answerRange = 2, category = "numbers" },
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 10 }
				
		},
		
		game10 = {
				gameType = "sequence",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 2, endRange = 14, answerRange = 2, category = "numbers" },
				sequence = { numItems = 5, itemsScale = .875, itemsSpacing = 90, blankLocation = 5, skip = 2, startNum = 5, patternLength = 4, numChoices = 4 }
		},
		game11 = {
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 2, endRange = 14, answerRange = 2, category = "numbers" },
				sequence = { numItems = 5, itemsScale = .875, itemsSpacing = 90, blankLocation = 5, skip = 2, startNum = 5, patternLength = 4, numChoices = 4 }
		},
		game12 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 30, startRange = 20, endRange = 60, answerRange = 2, category = "numbers" },
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 10 }
				
		},
		
		game13 = {
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 2, endRange = 16, answerRange = 2, category = "numbers" },
				sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 90, blankLocation = 4, skip = 5, startNum = 5, patternLength = 4, numChoices = 4 }
		},
		
	},	
		
	level47 = { --Sunshine the Bee:
		{
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 118,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -67},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 2, endRange = 5, answerRange = 2, category = "apples" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		{
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 9},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		{
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 118,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -67},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 4, endRange = 5, answerRange = 2, category = "apples" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		{
				gameType = "question",
				nextWaypoint = true,				
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = -50, startRange = 3, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				questions = { questionType1 = "Which 2 numbers add up to", questionType2 = "random", numAnswers = 2, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }	
				
		},
		
		
		{
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 9},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbers" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 4, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		{
				gameType = "question",
				nextWaypoint = true,				
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = -50, startRange = 3, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				questions = { questionType1 = "Which 2 numbers add up to", questionType2 = "random", numAnswers = 2, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }	
				
		},
		{
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 9},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		{
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 9},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 4, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		{
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 118,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -72},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 1 }	
		},
		{
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 118,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -72},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 1 }	
		},
		{
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 9},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbers" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		{
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 9},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 4, category = "numbers" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		
	},
		
		
		
	level48 = { --Pete the Frog:
		game1 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 116,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -72},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game2 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 116,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -72},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game3 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = .85, offsetX = 0, offsetY = 9},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbersDots" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 4, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game4 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = .85, offsetX = 0, offsetY = 9},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 2, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		
		game5 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 116,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -72},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game6 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 116,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -72},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 1 }	
		},
		game7 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game8 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game9 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game10 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 2, endRange = 5, answerRange = 2, category = "numbers" },
				
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game11 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbers" },
				
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 4, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game12 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbers" },
				
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 4, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		
	},
		
	level49 = { --Cordelia The Chicken:
		game1 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -50, startRange = 1, endRange = 5, answerRange = 5, category = "colorItem" },
				questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 5, scattered = true, imageCount = 9, skip = 1 }
		},
		
		game2 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -50, startRange = 1, endRange = 5, answerRange = 5, category = "shape" },
				questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 5, scattered = true, imageCount = 9, skip = 1 }
		},
			
		game3 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -50, startRange = 4, endRange = 8, answerRange = 5, category = "colorItem" },
				questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 5, scattered = true, imageCount = 9, skip = 1 }
		},
		
		
		game4 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -50, startRange = 5, endRange = 9, answerRange = 5, category = "shape" },
				questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 5, scattered = true, imageCount = 9, skip = 1 }
		},
		
		game5 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .94, offsetX = 0, offsetY = -34, startRange = 1, endRange = 2, category = "item" },				
				questions = { questionType1 = "Which item is", questionType2 = "BiggerSmaller", numAnswers = 1, numChoices = 2, scattered = true, imageCount = "random", skip = 1 }
		},
		
		game6 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .94, offsetX = 0, offsetY = -34, startRange = 1, endRange = 2, category = "item" },				
				questions = { questionType1 = "Which item is", questionType2 = "BiggerSmaller", numAnswers = 1, numChoices = 2, scattered = true, imageCount = "random", skip = 1 }
		},
		
		game7 = {
				gameType = "touchCounting",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = 50, startRange = 2, endRange = 8, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
		},			
		
		game8 = {
				gameType = "basket",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .85, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 3, endRange = 5, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, numExtraMin = 0, numExtraMax = 0, imageCount = "random", skip = 1 }
		},
		
		game9 = {
					
				gameType = "matching",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Touch a number, then a card", line2 = "with the same number of items.", spacing = 20, scale = .8, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 4, endRange = 9, category = "numbersToGroups" },
				matching = { mode = "showme", layout = 5, numRandom = true }
		},
		
		game10 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 2, endRange = 6, answerRange = 3, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
		},	
		
		game11 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 1, endRange = 10, answerRange = 3, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
		},
		
				
		
		
		game12 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 3, endRange = 10, answerRange = 3, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 1 }
		},
		game13 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 4, endRange = 8, answerRange = 3, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 1 }
		},
		
		game14 = {
				gameType = "puzzleSlots",
				nextWaypoint = false, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 9, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 },
				puzzle = { imageSet = "NumDifficult", number = "random", minRand = 10, maxRand = 15, incorrectChoices = 1, maskSet = 3, otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "slotAlpha", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
				
		},
			
			
		game15 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 5, endRange = 10, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = false, imageCount = 18, skip = 1 }
		},
		game16 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 3, endRange = 10, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = false, imageCount = 18, skip = 1 }
		},
			
		game17 = {
				gameType = "puzzleSlots",
				nextWaypoint = false, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 9, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 },
				puzzle = { imageSet = "NumDifficult", number = "random", minRand = 10, maxRand = 15, incorrectChoices = 1, maskSet = 3, otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "slotAlpha", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
				
		},
		
		game18 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -50, startRange = 1, endRange = 5, answerRange = 1, category = "groups" },
				
				questions = { questionType1 = "Which number is", questionType2 = "MostLeast", numAnswers = 1, numChoices = 2, scattered = true, imageCount = "random", skip = 1 }
		},
		game19 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -50, startRange = 3, endRange = 7, answerRange = 1, category = "groups" },
				
				questions = { questionType1 = "Which number is", questionType2 = "MostLeast", numAnswers = 1, numChoices = 2, scattered = true, imageCount = "random", skip = 1 }
		},
		
		game20 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -50, startRange = 5, endRange = 10, answerRange = 1, category = "groups" },
				
				questions = { questionType1 = "Which number is", questionType2 = "MostLeast", numAnswers = 1, numChoices = 2, scattered = true, imageCount = "random", skip = 1 }
		},
		
		game21 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -50, startRange = 6, endRange = 17, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "Which number is", questionType2 = "FirstLast", numAnswers = 1, numChoices = 3, scattered = false, imageCount = 12, skip = 1 }
		},
		game22 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -50, startRange = 10, endRange = 20, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "Which number is", questionType2 = "FirstLast", numAnswers = 1, numChoices = 3, scattered = false, imageCount = 12, skip = 1 }
		},
		game23 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 30, startRange = 4, endRange = 18, answerRange = 2, category = "numbers" },
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 2 }
				
		
				
				
				},
		game24 = {
				
				gameType = "counting",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = -35, startRange = 2, endRange = 20, category = "numbers" },
				
				counting = { rowNum = 4, columnNum = 2, spacing = 10, startNum = 2, skip = 2 }
		},
		game25 = {
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 4, endRange = 20, answerRange = 3, category = "numbers" },
				sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 90, blankLocation = "random", skip = 2, startNum = 4, patternLength = 4, numChoices = 3 }
	
				
				
				
				},
		game26 = {
				
				gameType = "counting",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = -35, startRange = 6, endRange = 20, category = "numbers" },
				
				counting = { rowNum = 4, columnNum = 2, spacing = 10, startNum = 6, skip = 2 }
		},
		
		
		game27 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 30, startRange = 10, endRange = 30, answerRange = 2, category = "numbers" },
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 5 }
		},
		
		
		game28 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 30, startRange = 10, endRange = 60, answerRange = 2, category = "numbers" },
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 5, scattered = true, imageCount = "random", skip = 10 }
				
		},
		
		
		
		game29 = {
				gameType = "sequence",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 5, endRange = 30, answerRange = 2, category = "numbers" },
				sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 90, blankLocation = 4, skip = 5, startNum = 5, patternLength = 4, numChoices = 4 }
		
					},
			
		game30 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 30, startRange = 10, endRange = 60, answerRange = 2, category = "numbers" },
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 5, scattered = true, imageCount = "random", skip = 10 }
				
		},
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
	},

	
	
	level50 = { --Percival The Puppy:
		game1 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 118,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -67},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "apples" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game2 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 116,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -72},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 3, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game3 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 118,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -67},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 4, endRange = 5, answerRange = 2, category = "apples" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game4 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 118,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -67},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "apples" },
				
				questions = { questionType1 = "How many apples", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game5 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 116,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -72},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 3, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game6 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 118,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -67},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 4, endRange = 5, answerRange = 2, category = "apples" },
				
				questions = { questionType1 = "How many apples", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game7 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 116,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -72},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game8 = {
				gameType = "question",
				nextWaypoint = false,				
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = -50, startRange = 3, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				questions = { questionType1 = "Which 2 numbers add up to", questionType2 = "random", numAnswers = 2, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }	
				
		},
		game9 = {
				gameType = "question",
				nextWaypoint = false,				
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = -50, startRange = 3, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				questions = { questionType1 = "Which 2 numbers add up to", questionType2 = "random", numAnswers = 2, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }	
				
		},
		game10 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbersDots" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game11 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 3, answerRange = 2, category = "numbersDots" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game12 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		
		game13 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game14 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				equations = { sign = "random", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		
		game15 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				equations = { sign = "random", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game16 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				equations = { sign = "random", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game17 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 118,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -72},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game18 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 116,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -72},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game19 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 116,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -72},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many apples", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game20 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 118,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -72},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many apples", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game21 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbers" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game22 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbers" },
				
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		
		
		
		
		
		
		game23 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 2, endRange = 5, answerRange = 2, category = "numbers" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game24 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbers" },
				
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game25 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbers" },
				
				equations = { sign = "random", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		
		game26 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbers" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game27 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbers" },
				
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		
		
		
		
		
		
		game28 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 2, endRange = 5, answerRange = 2, category = "numbers" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game29 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbers" },
				
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game30 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbers" },
				
				equations = { sign = "random", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		
	},
	
	
	
	-- REPEATED LEVELS -- 
	
	level51 = { --Ralphie the Cat: Counting to 5
		game1 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbers" },
				
				equations = { sign = "random", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
			
		}, 
		game2 = {
				gameType = "puzzleSlots",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
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
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -70 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -35, startRange = 3, endRange = 10, answerRange = 1, category = "groups" },
				
				questions = { questionType1 = "Which number is", questionType2 = "MostLeast", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
		},
		game4 = {
				
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Touch a number, then a card", line2 = "with the same number of items.", spacing = 20, scale = .8, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -35, startRange = 3, endRange = 7, category = "numbersToGroups" },
				
				matching = { mode = "memory", layout = 3, numRandom = true }	
		},
		game5 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 116,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -72},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many apples", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game6 = {
				gameType = "question",
				nextWaypoint = false,				
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = -50, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				questions = { questionType1 = "Which 2 numbers add up to", questionType2 = "random", numAnswers = 2, numChoices = 3, scattered = true, imageCount = 9, skip = 1 }	
				
		},
		game7 = {
				gameType = "question",
				nextWaypoint = true,				
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = -50, startRange = 3, endRange = 10, answerRange = 2, category = "numbersDots" },
				
				questions = { questionType1 = "Which 2 numbers add up to", questionType2 = "random", numAnswers = 2, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }	
				
		},
		game8 = {
				
				gameType = "matching",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Touch a number, then a card", line2 = "with the same number of items.", spacing = 20, scale = .8, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 3, endRange = 10, category = "numbersToGroups" },
				
				matching = { mode = "memory", layout = 1, numRandom = true }	
		},
		game9 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -50, startRange = 10, endRange = 15, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "Which number is", questionType2 = "FirstLast", numAnswers = 1, numChoices = 3, scattered = false, imageCount = 12, skip = 1 }
		},
		game10 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
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
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 5, endRange = 10, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
		},
		game12 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 5, endRange = 10, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
		},
		
	},
	
	
	level52 = { --Percival The Puppy: Counting to 10
		game1 = {
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Touch a number, then a card", line2 = "with the same number of items.", spacing = 20, scale = .8, offsetX = 0, offsetY = -34 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .9, offsetX = 0, offsetY = -12, startRange = 5, endRange = 10, category = "numbersToGroups" },
				matching = { mode = "showme", layout = 5, numRandom = true }
		},
		game2 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .9, offsetX = 0, offsetY = -28, startRange = 10, endRange = 14, answerRange = 3, category = "numbers" },
				questions = { questionType1 = "Which number is", questionType2 = "last", numAnswers = 1, numChoices = 3, scattered = false, imageCount = 12, skip = 1 }
		},
		
		game3 = {
				gameType = "counting",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -33 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = -20, startRange = 8, endRange = 15, category = "numbers" },
				counting = { rowNum = 2, columnNum = 2, spacing = 11, startNum = "random", skip = 1 }
		},
		game4 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 11, endRange = 15, answerRange = 3, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = false, imageCount = "random", skip = 1 }
		},
		game5 = {
				gameType = "counting",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = -20, startRange = 8, endRange = 19, category = "numbers" },
				
				counting = { rowNum = 4, columnNum = 2, spacing = 11, startNum = "random", skip = 1 }
		},
		
		game6 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 14, endRange = 18, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = false, imageCount = "random", skip = 1 }
		},
		game7 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .9, offsetX = 0, offsetY = -28, startRange = 16, endRange = 19, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "Which number is", questionType2 = "FirstLast", numAnswers = 1, numChoices = 3, scattered = false, imageCount = 12, skip = 1 }
		},
		
		
		game8 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .9, offsetX = 0, offsetY = -28, startRange = 14, endRange = 20, answerRange = 3, category = "numbers" },
				
				questions = { questionType1 = "Which number is", questionType2 = "FirstLast", numAnswers = 1, numChoices = 4, scattered = false, imageCount = 12, skip = 1 }
		},
		game9 = {
				gameType = "counting",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = -20, startRange = 10, endRange = 20, category = "numbers" },
				
				counting = { rowNum = 5, columnNum = 2, spacing = 11, startNum = "random", skip = 1 }
		},
		game10 = {
		
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 14, endRange = 19, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = false, imageCount = "random", skip = 1 }
				
				
		},		
		game11 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 16, endRange = 20, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = false, imageCount = "random", skip = 1 }
		},
		
	},
		
		
	level53 = { --Chauncey The Mouse: Skip Counting
		game1 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 4, endRange = 10, answerRange = 2, category = "numbers" },
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 2 }
				
		},
		game2 = {
				gameType = "counting",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .9, offsetX = 0, offsetY = -28, startRange = 1, endRange = 10, category = "numbers" },
				counting = { rowNum = 5, columnNum = 1, spacing = 10, startNum = 2, skip = 2 }
		},
		game3 = {
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "What comes next?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 60, startRange = 6, endRange = 10, answerRange = 2, category = "numbers" },
				sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 80, blankLocation = 4, skip = 2, startNum = 2, patternLength = 3, numChoices = 3 }
		},
		game4 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 10, endRange = 25, answerRange = 2, category = "numbers" },
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 5 }
		},
		game5 = {
				gameType = "counting",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = -18, startRange = 10, endRange = 30, category = "numbers" },
				counting = { rowNum = 3, columnNum = 2, spacing = 11, startNum = 5, skip = 5 }
		},
		game6 = {
				gameType = "sequence",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "What comes next?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 60, startRange = 15, endRange = 25, answerRange = 2, category = "numbers" },
				sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 80, blankLocation = 4, skip = 5, startNum = 5, patternLength = 3, numChoices = 3 }
		},
		game7 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 30, endRange = 50, answerRange = 2, category = "numbers" },
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 10 }
		},
		game8 = {
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "What comes next?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 60, startRange = 35, endRange = 45, answerRange = 2, category = "numbers" },
				sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 100, blankLocation = 4, skip = 10, startNum = 10, patternLength = 3, numChoices = 3 }
		},
		game9 = {
				gameType = "counting",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = -18, startRange = 20, endRange = 100, category = "numbers" },
				counting = { rowNum = 5, columnNum = 2, spacing = 11, startNum = 10, skip = 10 }
		},	
	},
		
		
	level54 = { --Webster the Duck: Sequences & Patterns
		game1 = {
				gameType = "sequence",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "What comes next?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 60, startRange = 1, endRange = 10, answerRange = 2, category = "numbers" },
				
				sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 80, blankLocation = 4, skip = 1, startNum = "random", patternLength = 3, numChoices = 3 }
		},
		game2 = {
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 60, startRange = 1, endRange = 10, answerRange = 2, category = "numbers" },
				
				sequence = { numItems = 5, itemsScale = .875, itemsSpacing = 80, blankLocation = "random", skip = 1, startNum = "random", patternLength = 4, numChoices = 3 }
		},
		game3 = {
				gameType = "sequence",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "What comes next?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 60, startRange = 1, endRange = 10, answerRange = 2, category = "items" },
				
				sequence = { numItems = 5, itemsScale = .875, itemsSpacing = 80, blankLocation = 5, skip = 1, startNum = 5, patternLength = 2, numChoices = 3 }
		},
		game4 = {
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 60, startRange = 1, endRange = 10, answerRange = 2, category = "items" },
				
				sequence = { numItems = 5, itemsScale = .875, itemsSpacing = 80, blankLocation = "random", skip = 1, startNum = 5, patternLength = 2, numChoices = 3 }
		},
		game5 = {
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "What comes next?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 60, startRange = 1, endRange = 12, answerRange = 2, category = "numbers" },
				
				sequence = { numItems = 5, itemsScale = .875, itemsSpacing = 80, blankLocation = 5, skip = 2, startNum = 2, patternLength = 5, numChoices = 3 }
		},
		
		game6 = {
				gameType = "sequence",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "What comes next?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 60, startRange = 1, endRange = 10, answerRange = 2, category = "items" },
				
				sequence = { numItems = 6, itemsScale = .875, itemsSpacing = 80, blankLocation = 6, skip = 1, startNum = "random", patternLength = 3, numChoices = 3 }
		},
		game7 = {
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 60, startRange = 1, endRange = 10, answerRange = 2, category = "items" },
				
				sequence = { numItems = 6, itemsScale = .875, itemsSpacing = 80, blankLocation = "random", skip = 1, startNum = 1, patternLength = 3, numChoices = 3 }
		},
		game8 = {
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "What comes next?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 60, startRange = 1, endRange = 12, answerRange = 2, category = "numbers" },
				
				sequence = { numItems = 5, itemsScale = .875, itemsSpacing = 80, blankLocation = 5, skip = 2, startNum = 6, patternLength = 3, numChoices = 3 }
		},
		game9 = {
				gameType = "sequence",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 60, startRange = 1, endRange = 20, answerRange = 2, category = "items" },
				sequence = { numItems = 7, itemsScale = .875, itemsSpacing = 70, blankLocation = 7, skip = 1, startNum = 1, patternLength = 4, numChoices = 3 }
		},
		game10 = {
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 60, startRange = 1, endRange = 20, answerRange = 2, category = "items" },
				sequence = { numItems = 7, itemsScale = .875, itemsSpacing = 70, blankLocation = "random", skip = 1, startNum = 1, patternLength = 4, numChoices = 3 }
		},
		
		
	},	
		
	level55 = { --Chip the Cardinal: Basic Shapes
		game1 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .96, offsetX = 0, offsetY = -28, startRange = 1, endRange = 3, answerRange = 5, category = "shape" },
				questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, skip = 1 }
		},
		game2 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .96, offsetX = 0, offsetY = -28, startRange = 1, endRange = 3, answerRange = 5, category = "shapeItem" },
				questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, skip = 1 }
		},
		game3 = {
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Find the matching shapes!", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -34 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .9, offsetX = 0, offsetY = -12, startRange = 1, endRange = 5, category = "shapeToShape" },
				
				matching = { mode = "memory", layout = 5, numRandom = true }
		},
		game4 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .96, offsetX = 0, offsetY = -28, startRange = 2, endRange = 6, answerRange = 5, category = "shape" },
				questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, skip = 1 }
		},
		game5 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .96, offsetX = 0, offsetY = -28, startRange = 2, endRange = 6, answerRange = 5, category = "shapeItem" },
				questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, skip = 1 }
		},
		game6 = {
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Touch a shape, then another", line2 = "card with the same shape.", spacing = 20, scale = .8, offsetX = 0, offsetY = -34 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .9, offsetX = 0, offsetY = -12, startRange = 5, endRange = 10, category = "shapeToShapeItem" },
				matching = { mode = "showme", layout = 9, numRandom = true }  
		},
		game7 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .96, offsetX = 0, offsetY = -28, startRange = 1, endRange = 8, answerRange = 5, category = "shape" },
				questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }
		},
		game8 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .96, offsetX = 0, offsetY = -28, startRange = 1, endRange = 8, answerRange = 5, category = "shapeItem" },
				questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 5, scattered = true, imageCount = 9, skip = 1 }
		},
		game9 = {
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Find the matching shapes!", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -34 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .9, offsetX = 0, offsetY = -12, startRange = 1, endRange = 10, category = "shapeToShapeItem" },
				matching = { mode = "memory", layout = 9, numRandom = true }  
		},
	
	
		
		
	},
		
		
		
	level56 = { --Oleg the Owl: Classification
		game1 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 55, startRange = 1, endRange = 5, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 6, skip = 1 }
		},
		game2 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 55, startRange = 1, endRange = 5, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 6, skip = 1 }
		},
		game3 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 55, startRange = 1, endRange = 7, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 8, skip = 1 }
		},
		game4 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 55, startRange = 1, endRange = 7, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 8, skip = 1 }
		},
		
		game5 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 55, startRange = 1, endRange = 10, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 10, skip = 1 }
		},
		game6 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 55, startRange = 1, endRange = 10, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 10, skip = 1 }
		},
		game7 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 55, startRange = 1, endRange = 10, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = false, imageCount = 12, skip = 1 }
		},
		game8 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 55, startRange = 1, endRange = 10, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = false, imageCount = 12, skip = 1 }
		},
		
		game9 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 55, startRange = 1, endRange = 10, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = false, imageCount = 14, skip = 1 }
		},
		game10 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 55, startRange = 1, endRange = 10, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = false, imageCount = 14, skip = 1 }
		},
		game11 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 55, startRange = 1, endRange = 10, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = false, imageCount = 18, skip = 1 }
		},
		game12 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .85, offsetX = 0, offsetY = 55, startRange = 1, endRange = 10, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = false, imageCount = 18, skip = 1 }
		},
		
		
		
		
	},
		
		
	level57 = { --Sunshine the Bee: Addition to 5
		game1 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 3, answerRange = 2, category = "apples" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game2 = {
				gameType = "question",
				nextWaypoint = true,				
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .9, offsetX = 0, offsetY = -28, startRange = 1, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				questions = { questionType1 = "Which 2 numbers add up to", questionType2 = "random", numAnswers = 2, numChoices = 3, scattered = true, imageCount = 9, skip = 1 }	
				
		},
		game3 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 2, endRange = 5, answerRange = 2, category = "apples" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game4 = {
				gameType = "question",
				nextWaypoint = true,				
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .9, offsetX = 0, offsetY = -28, startRange = 1, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				questions = { questionType1 = "Which 2 numbers add up to", questionType2 = "random", numAnswers = 2, numChoices = 3, scattered = true, imageCount = 9, skip = 1 }	
		},
		game5 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 9},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 1, endRange = 3, answerRange = 2, category = "numbersDots" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game6 = {
				gameType = "question",
				nextWaypoint = false,				
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .9, offsetX = 0, offsetY = -28, startRange = 1, endRange = 5, answerRange = 3, category = "numbersDots" },
				
				questions = { questionType1 = "Which 2 numbers add up to", questionType2 = "random", numAnswers = 2, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }			
		},
		game7 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 9},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game8 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 2, endRange = 5, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game9 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 9},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game10 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 9},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game11 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 5},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		game12 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 4},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 2, endRange = 5, answerRange = 2, category = "numbers" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game13 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 4},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 2, endRange = 5, answerRange = 2, category = "numbers" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		game14 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 4},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 2, endRange = 5, answerRange = 2, category = "numbers" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		
	},
		
		
		
	level58 = { --Pete the Frog: Subtraction to 5
		game1 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 3, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game2 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 4, answerRange = 2, category = "numbersDots" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game3 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 9},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 1, endRange = 3, answerRange = 2, category = "numbersDots" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game4 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game5 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game6 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 9},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 0, endRange = 3, answerRange = 2, category = "numbersDots" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game7 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 2, endRange = 5, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game8 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "numbersDots" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game9 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 5},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		game10 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game11 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "numbers" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game12 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 4},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 0, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game13 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 4},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 2, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		game14 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 4},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 0, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		
	},
	
}
return randomGameDetails