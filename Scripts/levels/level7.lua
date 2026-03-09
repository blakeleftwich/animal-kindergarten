--Sunshine Review 1
return {
	
	game1 = {
			gameType = "question",
			nextWaypoint = false,
			question = { offsetY = -65 },
			cards = { spacing = 75, scale = .88, offsetX = 0, offsetY = -40, startRange = 1, endRange = 2, category = "item" },			
			questions = { questionType1 = "Which item is", questionType2 = "BiggerSmaller", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
	},
	game2 = {
			gameType = "question", --touch the red items
			question = { scale = .8 },
			cards = { spacing = 54, vSpacing = 118, scale = 1.25, offsetX = 0, offsetY = -57, startRange = 5, endRange = 8, answerRange = 5, category = "colorItem" },
			questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 4,scattered = true, imageCount = 9, skip = 1 }
	},
	game3 = {
			gameType = "touchTheNumber",
			nextWaypoint = false,
			question = { scale = .9 },
			cards = { scale = 1, offsetX = 0, offsetY = 50, startRange = 37, endRange = 37, answerRange = 3, category = "numbers" },
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 1 }
			
	},
	game4 = {
			gameType = "question", --touch the red items
			question = { scale = .8 },
			cards = { spacing = 54, vSpacing = 118, scale = 1.25, offsetX = 0, offsetY = -57, startRange = 3, endRange = 6, answerRange = 5, category = "shapeItem" },
			questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }
	},
	game5 = {
			
							
			gameType = "matching",
			question = { line1 = "Find the matching colors!", scale = .8 },
			cards = { spacing = 76, vSpacing = 93, scale = 1.25, offsetX = 0, offsetY = -33, startRange = 1, endRange = 8, category = "colorToColor" },
			matching = { mode = "memory", classic = true, layout = 5, numRandom = true, showMeMode = 2 }
	},
	game6 = {
			gameType = "question", --touch the red items
			nextWaypoint = false,--false
			question = { scale = .8 },
			cards = { spacing = 54, vSpacing = 118, scale = 1.25, offsetX = 0, offsetY = -57, startRange = 7, endRange = 10, answerRange = 5, category = "shapeItem" },
			questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }
	},
	game7 = {
			gameType = "touchTheNumber",
			nextWaypoint = false,
			question = { scale = .9 },
			cards = { scale = 1, offsetX = 0, offsetY = 50, startRange = 38, endRange = 38, answerRange = 2, category = "numbers" },
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
			
	},
	game8 = {
			gameType = "question", --touch the red items
			nextWaypoint = false,--false
			question = { scale = .8 },
			cards = { spacing = 54, vSpacing = 118, scale = 1.25, offsetX = 0, offsetY = -57, startRange = 4, endRange = 8, answerRange = 5, category = "colorItem" },
			questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 4,scattered = true, imageCount = 9, skip = 1 }
	},
	game9 = {
			gameType = "question", --touch the red items
			question = { scale = .8 },
			cards = { spacing = 54, vSpacing = 118, scale = 1.25, offsetX = 0, offsetY = -57, startRange = 7, endRange = 10, answerRange = 5, category = "shapeItem" },
			questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }
	},
	game10 = {
			gameType = "touchTheNumber",
			question = { scale = .9 },
			cards = { scale = 1, offsetX = 0, offsetY = 50, startRange = 36, endRange = 36, answerRange = 2, category = "numbers" },
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
			
			
	},
	game11 = {
			
							
			gameType = "matching",
			question = { line1 = "Find the matching shapes!", scale = .8 },
			cards = { spacing = 76, vSpacing = 93, scale = 1.25, offsetX = 0, offsetY = -33, startRange = 1, endRange = 10, category = "shapeToShape" },
			matching = { mode = "memory", classic = true, layout = 9, numRandom = true, showMeMode = 2 }
	},
	
	
	
	-- game1 = {
			-- gameType = "question", --touch the red items
			-- nextWaypoint = false,--false
			-- grayBGY = 140,				
			-- question = { line1 = "", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -66 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { spacing = 54, vSpacing = 118, scale = 1.25, offsetX = 0, offsetY = -57, startRange = 1, endRange = 7, answerRange = 5, category = "shapeItem" },
			-- questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 4,scattered = true, imageCount = 9, skip = 1 }
	-- },
	-- game2 = {
			-- gameType = "question", --touch the red items
			-- nextWaypoint = true,--false
			-- grayBGY = 140,				
			-- question = { line1 = "", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -66 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { spacing = 54, vSpacing = 118, scale = 1.25, offsetX = 0, offsetY = -57, startRange = 1, endRange = 7, answerRange = 5, category = "colorItem" },
			-- questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 4,scattered = true, imageCount = 9, skip = 1 }
	-- },
	
	
	

	-- game5 = {
			-- gameType = "touchTheNumber",
			-- nextWaypoint = true,
			-- grayBGY = 140,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = 1, offsetX = 0, offsetY = 50, startRange = 21, endRange = 21, answerRange = 2, category = "numbers" },
			-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 1 }
	-- },
	
	-- game6 = {
			-- gameType = "question", --touch the red items
			-- nextWaypoint = false,--false
			-- grayBGY = 140,				
			-- question = { line1 = "", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -66 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { spacing = 54, vSpacing = 118, scale = 1.25, offsetX = 0, offsetY = -57, startRange = 1, endRange = 10, answerRange = 5, category = "shapeItem" },
			-- questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }
	-- },
	-- game7 = {
			
							
			-- gameType = "matching",
			-- nextWaypoint = true,
			-- grayBGY = 140,
			-- question = { line1 = "Find the matching colors!", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -66 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { spacing = 76, vSpacing = 93, scale = 1.25, offsetX = 0, offsetY = -33, startRange = 1, endRange = 8, category = "colorToColor" },
			-- matching = { mode = "memory", classic = true, layout = 5, numRandom = true, showMeMode = 2 }
	-- },
	
	-- game8 = {
			-- gameType = "puzzle",
			-- nextWaypoint = false, --false,
			-- grayBGY = 140,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 6, endRange = 8, answerRange = 2, category = "numbers" },
			
			-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 },
			-- puzzle = { imageSet = "Num", typeSet = "Color", number = "random", minRand = 6, maxRand = 8, maskSet = 3, otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "slotAlpha", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
			
	-- },
	
	-- game9 = {
			-- gameType = "touchTheNumber",
			-- nextWaypoint = true,
			-- grayBGY = 140,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = 1, offsetX = 0, offsetY = 50, startRange = 20, endRange = 20, answerRange = 2, category = "numbers" },
			-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 1 }
	-- },
	-- game10 = {
			-- gameType = "question",
			-- nextWaypoint = false,
			-- grayBGY = 140,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { spacing = 75, scale = .88, offsetX = 0, offsetY = -40, startRange = 1, endRange = 2, category = "item" },				
			-- questions = { questionType1 = "Which item is", questionType2 = "BiggerSmaller", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
	-- },
	
	-- game11 = {
				-- gameType = "puzzleSlots",
			-- nextWaypoint = false, --false,
			-- grayBGY = 140,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = .72, offsetX = 0, offsetY = -66 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = .75, offsetX = 0, offsetY = 50, startRange = 1, endRange = 6, answerRange = 2, category = "numbers" },
			
			-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 3, numChoices = 3, scattered = true, imageCount = "random", skip = 1 },
			-- puzzle = { imageSet = "Shapes", number = "random", minRand = 3, maxRand = 5, incorrectChoices = 2, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
	-- },
	
	-- game12 = {
			-- gameType = "question",
			-- nextWaypoint = false,
			-- grayBGY = 140,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { spacing = 75, scale = .88, offsetX = 0, offsetY = -40, startRange = 1, endRange = 2, category = "item" },				
			-- questions = { questionType1 = "Which item is", questionType2 = "BiggerSmaller", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
	-- },
	-- game13 = {
			-- gameType = "question", --touch the red items
			-- nextWaypoint = false,--false
			-- grayBGY = 140,				
			-- question = { line1 = "", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -66 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { spacing = 54, vSpacing = 118, scale = 1.25, offsetX = 0, offsetY = -57, startRange = 1, endRange = 8, answerRange = 5, category = "colorItem" },
			-- questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 4,scattered = true, imageCount = 9, skip = 1 }
	-- },
	-- game14 = {
			-- gameType = "touchTheNumber",
			-- nextWaypoint = true,
			-- grayBGY = 140,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = 1, offsetX = 0, offsetY = 50, startRange = 22, endRange = 22, answerRange = 2, category = "numbers" },
			-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 1 }
	-- },
	-- game15 = {
			-- gameType = "question", --touch the red items
			-- nextWaypoint = false,--false
			-- grayBGY = 140,				
			-- question = { line1 = "", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -66 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { spacing = 54, vSpacing = 118, scale = 1.25, offsetX = 0, offsetY = -57, startRange = 7, endRange = 10, answerRange = 5, category = "shapeItem" },
			-- questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 4,scattered = true, imageCount = 9, skip = 1 }
	-- },
	-- game16 = {
			-- gameType = "question", --touch the red items
			-- nextWaypoint = false,--false
			-- grayBGY = 140,				
			-- question = { line1 = "", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -66 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { spacing = 54, vSpacing = 118, scale = 1.25, offsetX = 0, offsetY = -57, startRange = 5, endRange = 8 , answerRange = 5, category = "colorItem" },
			-- questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }
	-- },
	
	-- game17 = {
			
							
			-- gameType = "matching",
			-- nextWaypoint = false,
			-- grayBGY = 140,
			-- question = { line1 = "Find the matching shapes!", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -66 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { spacing = 76, vSpacing = 93, scale = 1.25, offsetX = 0, offsetY = -33, startRange = 1, endRange = 10, category = "shapeToShape" },
			-- matching = { mode = "memory", classic = true, layout = 9, numRandom = true, showMeMode = 2 }
	-- },
	
	-- game18 = {
			-- gameType = "puzzleSlots",
			-- nextWaypoint = true, --false,
			-- grayBGY = 140,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = .72, offsetX = 0, offsetY = -66 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = .8, offsetX = 0, offsetY = 40, startRange = 2, endRange = 8, answerRange = 2, category = "numbers" },
			
			-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 4, scattered = true, imageCount = "random", skip = 1 },
			-- puzzle = { imageSet = "ShapesDifficult", number = "random", minRand = 2, maxRand = 8, incorrectChoices = 1, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
	-- },
	-- game9 = {
			
							
			-- gameType = "matching",
			-- nextWaypoint = false,
			-- grayBGY = 140,
			-- question = { line1 = "Find the matching colors!", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -66 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { spacing = 76, vSpacing = 93, scale = 1.25, offsetX = 0, offsetY = -33, startRange = 16, endRange = 20, category = "numbersToNumbers" },
			-- matching = { mode = "showme", classic = false, layout = 5, numRandom = true, showMeMode = 2 }
	-- },
	

	-- game10 = {
			-- gameType = "question",
			-- nextWaypoint = false,
			-- grayBGY = 110,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 1, endRange = 8, answerRange = 2, category = "numbers" },
			
			-- questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = false, imageCount = 8, skip = 1, showGreen = true, showYellow = false }
	-- },
	-- game11 = {
			-- gameType = "question",
			-- nextWaypoint = false,
			-- grayBGY = 110,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 1, endRange = 8, answerRange = 2, category = "numbers" },
			
			-- questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = false, imageCount = 8, skip = 1, showGreen = true, showYellow = false }
	-- },
	-- game9 = {
			-- gameType = "puzzleSlots",
			-- nextWaypoint = false, --false,
			-- grayBGY = 140,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = .72, offsetX = 0, offsetY = -66 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = .75, offsetX = 0, offsetY = 50, startRange = 1, endRange = 6, answerRange = 2, category = "numbers" },
			
			-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 3, numChoices = 3, scattered = true, imageCount = "random", skip = 1 },
			-- puzzle = { imageSet = "Shapes", number = "random", minRand = 3, maxRand = 5, incorrectChoices = 2, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
	-- },
	
	-- game10 = {
			-- gameType = "puzzleSlots",
			-- nextWaypoint = false, --false,
			-- grayBGY = 140,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = .72, offsetX = 0, offsetY = -66 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = .8, offsetX = 0, offsetY = 40, startRange = 2, endRange = 8, answerRange = 2, category = "numbers" },
			
			-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 4, scattered = true, imageCount = "random", skip = 1 },
			-- puzzle = { imageSet = "ShapesDifficult", number = "random", minRand = 2, maxRand = 8, incorrectChoices = 1, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
	-- },
	-- game11 = {
			-- gameType = "puzzleSlots",
			-- nextWaypoint = false, --false,
			-- grayBGY = 140,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = .72, offsetX = 0, offsetY = -66 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 7, endRange = 10, answerRange = 2, category = "numbers" },
			
			-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 3, scattered = false, imageCount = "random", skip = 1 },
			-- puzzle = { imageSet = "Shapes", number = "random", minRand = 7, maxRand = 10, incorrectChoices = 0, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
	-- },
	
	-- game9  = {
			-- gameType = "puzzle",
			-- nextWaypoint = true, --false,
			-- grayBGY = 140,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 6, endRange = 6, answerRange = 2, category = "numbers" },
			
			-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 },
			-- puzzle = { imageSet = "Objects", typeSet = "Shapes", number = "random", minRand = 6, maxRand = 6, maskSet = 3, otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "slotAlpha", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
			
	-- },
	
}
