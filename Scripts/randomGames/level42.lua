--Chip the Cardinal:
return {
	game1 = {
			gameType = "question",
			nextWaypoint = false,
			question = { offsetY = -65 },
			cards = { scale = 1, offsetX = 0, offsetY = -50, startRange = 1, endRange = 9, answerRange = 5, category = "shapeItem" },
			questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }
	},
	game2 = {
			gameType = "puzzle",
			question = { offsetY = -65 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 3, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 5, scattered = true, imageCount = "random", skip = 1 },
			puzzle = { imageSet = "Objects", typeSet = "Color", number = "random", minRand = 5, maxRand = 5, maskSet = 3, otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "slotAlpha", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		},
	game3 = {
			gameType = "question",
			nextWaypoint = false,
			question = { offsetY = -65 },
			cards = { scale = 1, offsetX = 0, offsetY = -50, startRange = 1, endRange = 9, answerRange = 5, category = "shapeItem" },
			questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }
	},
	game4 = {
			gameType = "matching",
			question = { line1 = "Touch an item, then another", line2 = "item with the same shape.", scale = .8, offsetY = -67 },
			cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 1, endRange = 9, category = "shapeToShape" },
			matching = { mode = "showme", layout = 5, numRandom = true }  		
	},
	game5 = {
			gameType = "question",
			nextWaypoint = false,
			question = { offsetY = -65 },
			cards = { scale = 1, offsetX = 0, offsetY = -50, startRange = 1, endRange = 9, answerRange = 5, category = "shapeItem" },
			questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }
	},
	
	
	game6 = {
			gameType = "puzzle",
			question = { offsetY = -65 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 8, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 },
			puzzle = { imageSet = "Objects", typeSet = "Color", number = "random", minRand = 5, maxRand = 4, maskSet = 3, otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "slotAlpha", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		},
	game7 = {
			gameType = "question",
			question = { offsetY = -65 },
			cards = { scale = 1, offsetX = 0, offsetY = -50, startRange = 5, endRange = 9, answerRange = 5, category = "shape" },
			questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 5, scattered = true, imageCount = 9, skip = 1 }
	},
	
	
	
	game8 = {
			gameType = "matching",
			question = { line1 = "Touch an item, then another", line2 = "item with the same shape.", scale = .8, offsetY = -67 },
			cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 4, endRange = 9, category = "shapeToShapeItem" },
			matching = { mode = "memory", layout = 9, numRandom = true }  		
	},
	game9 = {
			gameType = "question",
			question = { offsetY = -65 },
			cards = { scale = 1, offsetX = 0, offsetY = -50, startRange = 5, endRange = 9, answerRange = 5, category = "shape" },
			questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 5, scattered = true, imageCount = 9, skip = 1 }
	},
	
}
