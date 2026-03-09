-- Ralphie Review 3
return {
	game1 = {
			gameType = "counting",
			question = { offsetY = -67 },
			cards = { scale = .95, offsetX = 0, offsetY = -35, startRange = 9, endRange = 35, category = "numbers" },
			
			counting = { rowNum = 3, columnNum = 2, spacing = 11, startNum = "random", skip = 1, placeMatch = 0 }
	},
	-- game2 = {
			-- gameType = "puzzleSlots",
			-- nextWaypoint = false, --false,
			-- grayBGY = 140,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = 1.25, offsetX = 0, offsetY = 60, startRange = 40, endRange = 60 , answerRange = 3, category = "numbers" },
			
			-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 4, scattered = true, imageCount = "random", skip = 1, skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
			-- puzzle = { imageSet = "CardsClassic", number = "random", minRand = 9, maxRand = 99, incorrectChoices = 2, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
	-- },
	game2 = {
			gameType = "puzzleSlots",
			nextWaypoint = false, --false,
			question = { scale = .9 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 10, endRange = 14, answerRange = 1, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 4, scattered = true, imageCount = "random", skip = 1, skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
			puzzle = { imageSet = "Cards", number = "random", minRand = 10, maxRand = 14, incorrectChoices = 3, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
	

			
	},
	game3 = {
			gameType = "puzzleSlots",
			question = { offsetY = -36 },
			cards = { scale = 1.4, offsetX = 0, offsetY = 50, startRange = 70, endRange = 99, answerRange = 1, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1, skipPattern = "", startNum = "", order = "ascending" },
			puzzle = { imageSet = "CardsNumDifficult", number = "random", minRand = 9, maxRand = 45, incorrectChoices = 2, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
			
	},
	game4 = {
			gameType = "counting",
			question = { offsetY = -67 },
			cards = { scale = .95, offsetX = 0, offsetY = -35, startRange = 9, endRange = 45, category = "numbers" },
			
			counting = { rowNum = 3, columnNum = 2, spacing = 11, startNum = "random", skip = 1, placeMatch = 0 }
	},
	game5 = {
			gameType = "question",
			nextWaypoint = false,
			question = { offsetY = -65 },
			cards = { spacing = 60, scale = 1.4, offsetX = 0, offsetY = -50, startRange = 50, endRange = 70, answerRange = 3, category = "numbers" },
			
			questions = { questionType1 = "Which number is", questionType2 = "FirstLast", numAnswers = 1, numChoices = 4, scattered = false, imageCount = 12, skip = 1 }
	},
	game6 = {
			gameType = "question",
			question = { offsetY = -65 },
			cards = { spacing = 60, scale = 1.4, offsetX = 0, offsetY = -50, startRange = 80, endRange = 99, answerRange = 3, category = "numbers" },
			
			questions = { questionType1 = "Which number is", questionType2 = "FirstLast", numAnswers = 1, numChoices = 4, scattered = false, imageCount = 12, skip = 1 }
	},
	game7 = {
			gameType = "puzzleSlots",
			nextWaypoint = false, --false,
			question = { scale = .9 },
			cards = { scale = 1.25, offsetX = 0, offsetY = 60, startRange = 50, endRange = 60 , answerRange = 3, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 3, scattered = true, imageCount = "random", skip = 1, skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
			puzzle = { imageSet = "CardsClassic", number = "random", minRand = 50, maxRand = 60, incorrectChoices = 2, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
	},
	game8 = {
			gameType = "counting",
			question = { offsetY = -67 },
			cards = { scale = .95, offsetX = 0, offsetY = -35, startRange = 9, endRange = 45, category = "numbers" },
			
			counting = { rowNum = 4, columnNum = 2, spacing = 11, startNum = "random", skip = 1, placeMatch = 0 }
	},
	game9 = {
			gameType = "puzzleSlots",
			question = { offsetY = -36 },
			cards = { scale = 1.4, offsetX = 0, offsetY = 50, startRange = 60, endRange = 75, answerRange = 1, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 3, scattered = true, imageCount = "random", skip = 1, skipPattern = "", startNum = "", order = "ascending" },
			puzzle = { imageSet = "CardsNumDifficult", number = "random", minRand = 60, maxRand = 75, incorrectChoices = 3, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
			
	},
	-- game10 = {
			-- gameType = "puzzleSlots",
			-- nextWaypoint = false, --false,
			-- grayBGY = 140,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = 1.25, offsetX = 0, offsetY = 60, startRange = 25, endRange = 45 , answerRange = 3, category = "numbers" },
			
			-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 4, scattered = true, imageCount = "random", skip = 1, skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
			-- puzzle = { imageSet = "CardsClassic", number = "random", minRand = 25, maxRand = 45, incorrectChoices = 2, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
	-- },
	-- game10 = {
			-- gameType = "counting",
			-- nextWaypoint = true,
			-- grayBGY = 140,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = .95, offsetX = 0, offsetY = -35, startRange = 80, endRange = 99, category = "numbers" },
			
			-- counting = { rowNum = 4, columnNum = 2, spacing = 11, startNum = "random", skip = 1, placeMatch = 0 }
	-- },

	-- game1 = {
			-- gameType = "touchTheNumber",
			-- nextWaypoint = false,
			-- grayBGY = 140,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = 1, offsetX = 0, offsetY = 50, startRange = 23, endRange = 23, answerRange = 2, category = "numbers" },
			-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 1 }
			-- },
	-- game2 = {
			-- gameType = "puzzle",
			-- nextWaypoint = true, --false,
			-- grayBGY = 140,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 6, endRange = 10, answerRange = 2, category = "numbers" },
			
			-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 },
			-- puzzle = { imageSet = "Num", typeSet = "Color", number = "random", minRand = 6, maxRand = 10, maskSet = 3, otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "slotAlpha", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
			
	-- },
	-- game3 = {
			-- gameType = "question",
			-- nextWaypoint = false,
			-- grayBGY = 110,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 12, endRange = 20, answerRange = 2, category = "numbers" },
			
			-- questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = false, imageCount = 18, skip = 1, showGreen = true, showYellow = false }
	-- },
	-- game4 = {
			-- gameType = "question",
			-- nextWaypoint = true,
			-- grayBGY = 110,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 12, endRange = 20, answerRange = 2, category = "numbers" },
			
			-- questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = false, imageCount = 18, skip = 1, showGreen = true, showYellow = false }
	-- },
	-- game5 = {
			-- gameType = "question",
			-- nextWaypoint = false,
			-- grayBGY = 140,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { spacing = 62, scale = .74, offsetX = 0, offsetY = -34, startRange = 1, endRange = 2, category = "item" },				
			-- questions = { questionType1 = "Which item is", questionType2 = "BiggerSmaller", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 1 }
	-- },
	-- game6 = {
			-- gameType = "counting",
			-- nextWaypoint = true,
			-- grayBGY = 140,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = .95, offsetX = 0, offsetY = -35, startRange = 5, endRange = 20, category = "numbers" },
			
			-- counting = { rowNum = 3, columnNum = 2, spacing = 11, startNum = "random", skip = 1, placeMatch = 0 }
	-- },
	-- game7 = {
			
							
			-- gameType = "matching",
			-- nextWaypoint = false,
			-- grayBGY = 140,
			-- question = { line1 = "Find the matching colors!", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -66 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { spacing = 76, vSpacing = 93, scale = 1.25, offsetX = 0, offsetY = -33, startRange = 5, endRange = 20, category = "numbersToNumbers" },
			-- matching = { mode = "showme", classic = false, layout = 9, numRandom = true, showMeMode = 2 }
	-- },
	-- game8 = {
			-- gameType = "basket",
			-- nextWaypoint = false,
			-- grayBGY = 140,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = .85, offsetX = 0, offsetY = -65 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 2, endRange = 6, answerRange = 2, category = "numbers" },
			
			-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, numExtraMin = -1, numExtraMax = 0, imageCount = "random", skip = 1 }
				
	-- },
	-- game9 = {
			
			-- gameType = "puzzleSlots",
			-- nextWaypoint = true, --false,
			-- grayBGY = 140,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -36 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = 1.4, offsetX = 0, offsetY = 50, startRange = 0, endRange = 1, answerRange = 2, category = "numbers" },
			
			-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 3, scattered = true, imageCount = "random", skip = 1, skipPattern = "", startNum = "", order = "ascending" },
			-- puzzle = { imageSet = "CardsNumDifficult", number = "random", minRand = 12, maxRand = 20, incorrectChoices = 2, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
	
	-- },
	-- game10 = {
			-- gameType = "question", --touch the red items
			-- nextWaypoint = false,--false
			-- grayBGY = 140,				
			-- question = { line1 = "", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -66 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { spacing = 49, vSpacing = 118, scale = 1.15, offsetX = 0, offsetY = -61, startRange = 6, endRange = 10, answerRange = 5, category = "shape" },
			-- questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 5, scattered = true, imageCount = 9, skip = 1 }
	-- },
	-- game11 = {
			-- gameType = "touchCounting",
			-- nextWaypoint = false,
			-- grayBGY = 140,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -65 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = 1, offsetX = 0, offsetY = 50, startRange = 5, endRange = 9, answerRange = 2, category = "numbers" },
			
			-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
					
	-- },
	-- game12 = {
			-- gameType = "puzzleSlots",
			-- nextWaypoint = false, --false,
			-- grayBGY = 140,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 8, endRange = 17, answerRange = 2, category = "numbers" },
			
			-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 3, scattered = true, imageCount = "random", skip = 1, skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
			-- puzzle = { imageSet = "Cards", number = "random", minRand = 8, maxRand = 20, incorrectChoices = 2, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
	

			
	-- },
	-- game13 = {
			-- gameType = "question",
			-- nextWaypoint = true,
			-- grayBGY = 100,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = 0.95, offsetX = 0, offsetY = -66 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = .95, offsetX = 0, offsetY = 20, startRange = 15, endRange = 20, answerRange = 2, category = "numbers" },
			
			-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = false, imageCount = "random", skip = 1 }
			
	-- },
	-- game14 = {
			-- gameType = "question",
			-- nextWaypoint = false,
			-- grayBGY = 140,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { spacing = 60, scale = 1.4, offsetX = 0, offsetY = -50, startRange = 6, endRange = 20, answerRange = 2, category = "numbers" },
			
			-- questions = { questionType1 = "Which number is", questionType2 = "FirstLast", numAnswers = 1, numChoices = 4, scattered = false, imageCount = 12, skip = 1 }
	-- },
	-- game15 = {
			
							
			-- gameType = "matching",
			-- nextWaypoint = false,
			-- grayBGY = 140,
			-- question = { line1 = "Find the matching shapes!", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -66 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { spacing = 76, vSpacing = 93, scale = 1.25, offsetX = 0, offsetY = -33, startRange = 5, endRange = 10, category = "shapeToShape" },
			-- matching = { mode = "showme", classic = false, layout = 5, numRandom = true, showMeMode = 2 }
	-- },
	-- game16 = {
			-- gameType = "puzzleSlots",
			-- nextWaypoint = true, --false,
			-- grayBGY = 140,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = 1.25, offsetX = 0, offsetY = 60, startRange = 60, endRange = 94 , answerRange = 3, category = "numbers" },
			
			-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 4, scattered = true, imageCount = "random", skip = 1, skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
			-- puzzle = { imageSet = "CardsClassic", number = "random", minRand = 60, maxRand = 94, incorrectChoices = 3, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
	-- },
}
