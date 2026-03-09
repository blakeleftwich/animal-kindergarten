--Webster: Size and Shape
return {
	
	game1 = {
			gameType = "puzzleSlots",
			question = { scale = .72 },
			cards = { scale = .75, offsetX = 0, offsetY = 50, startRange = 1, endRange = 2, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 3, numChoices = 3, scattered = true, imageCount = "random", skip = 1 },
			puzzle = { imageSet = "ShapesDifficult", number = "random", minRand = 1, maxRand = 3, incorrectChoices = 0, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
	},
	

	game2 = {
			gameType = "question", --touch the red items
			question = { scale = .8 },
			cards = { spacing = 60, vSpacing = 118, scale = 1.4, offsetX = 0, offsetY = -57, startRange = 4, endRange = 7, answerRange = 5, category = "shape" },
			questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }
			
	}, 
	
	game3 = {
			gameType = "puzzle",
			question = { offsetY = -65 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 8, endRange = 8, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 },
			puzzle = { imageSet = "Objects", typeSet = "Shapes", number = 9, minRand = 4, maxRand = 9, maskSet = 3, otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "slotAlpha", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
	},
	
	game4 = {
			gameType = "puzzleSlots",
			question = { scale = .72 },
			cards = { scale = .75, offsetX = 0, offsetY = 50, startRange = 6, endRange = 10, answerRange = 1, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 3, numChoices = 3, scattered = true, imageCount = "random", skip = 1 },
			puzzle = { imageSet = "ShapesDifficult", number = "random", minRand = 6, maxRand = 8, incorrectChoices = 1, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
	},
	
		
	game5 = {
			gameType = "question", --touch the red items
			nextWaypoint = false,--false
			question = { scale = .8 },
			cards = { spacing = 60, vSpacing = 118, scale = 1.4, offsetX = 0, offsetY = -57, startRange = 4, endRange = 7, answerRange = 5, category = "shape" },
			questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }
			
	}, 
	-- game3 = {
			-- gameType = "puzzleSlots",
			-- nextWaypoint = true, --false,
			-- grayBGY = 140,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = .72, offsetX = 0, offsetY = -66 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = .75, offsetX = 0, offsetY = 50, startRange = 3, endRange = 5, answerRange = 2, category = "numbers" },
			
			-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 3, numChoices = 3, scattered = true, imageCount = "random", skip = 1 },
			-- puzzle = { imageSet = "ShapesDifficult", number = "random", minRand = 6, maxRand = 8, incorrectChoices = 1, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
	-- },
	
	
	
	-- game3 = {
			-- gameType = "puzzleSlots",
			-- nextWaypoint = true, --false,
			-- grayBGY = 140,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = .72, offsetX = 0, offsetY = -66 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = .75, offsetX = 0, offsetY = 50, startRange = 1, endRange = 6, answerRange = 2, category = "numbers" },
			
			-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 3, numChoices = 3, scattered = true, imageCount = "random", skip = 1 },
			-- puzzle = { imageSet = "ShapesDifficult", number = "random", minRand = 4, maxRand = 6, incorrectChoices = 1, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
	-- },
	
	-- game4 = {
			-- gameType = "puzzleSlots",
			-- nextWaypoint = true, --false,
			-- grayBGY = 140,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = .72, offsetX = 0, offsetY = -66 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = .75, offsetX = 0, offsetY = 50, startRange = 1, endRange = 3, answerRange = 2, category = "numbers" },
			
			-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 4, scattered = true, imageCount = "random", skip = 1 },
			-- puzzle = { imageSet = "ShapesDifficult", number = "random", minRand = 1, maxRand = 5, incorrectChoices = 1, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
	-- },
	game6 = {
			gameType = "puzzleSlots",
			question = { scale = .72 },
			cards = { scale = .75, offsetX = 0, offsetY = 50, startRange = 1, endRange = 10, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 3, numChoices = 3, scattered = true, imageCount = "random", skip = 1 },
			puzzle = { imageSet = "ShapesDifficult", number = { 10, 7, 5 }, minRand = 1, maxRand = 10, incorrectChoices = 2, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
	},
	
	game7 = {
			gameType = "question", --touch the red items
			nextWaypoint = false,--false
			question = { scale = .8 },
			cards = { spacing = 60, vSpacing = 118, scale = 1.4, offsetX = 0, offsetY = -57, startRange = 6, endRange = 10, answerRange = 5, category = "shape" },
			questions = { questionType1 = "Which one is a", questionType2 = "triangle", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }
			
	}, 
	
	game8 = {
			gameType = "puzzleSlots",
			question = { scale = .72 },
			cards = { scale = .8, offsetX = 0, offsetY = 40, startRange = 1, endRange = 10, answerRange = 1, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 4, scattered = true, imageCount = "random", skip = 1 },
			puzzle = { imageSet = "ShapesDifficult", number = { 10, 9, 8, 6 }, minRand = 1, maxRand = 10, incorrectChoices = 1, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
	},
}
