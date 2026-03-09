--Pinkie The Pig:
return {
	game1 = {
			gameType = "matching",
			nextWaypoint = false,
			question = { line1 = "Touch a color, then another", line2 = "card with the same color.", scale = .8, offsetY = -67 },
			cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 1, endRange = 8, category = "colorToColor" },
			matching = { mode = "showme", layout = 9, numRandom = true }  
	},
	
	game2 = {
			gameType = "puzzle",
			question = { offsetY = -65 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 3, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 },
			puzzle = { imageSet = "Objects", typeSet = "Color", number = "random", minRand = 5, maxRand = 5, maskSet = 3, otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "slotAlpha", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
			
	},
	game3 = {
			gameType = "question",
			nextWaypoint = false,
			question = { offsetY = -65 },
			cards = { scale = 1, offsetX = 0, offsetY = -50, startRange = 1, endRange = 8, answerRange = 5, category = "colorItem" },
			questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, skip = 1 }
	},
	game4 = {
			gameType = "matching",
			question = { line1 = "Find the matching colors.", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -67 },equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = 1, offsetX = 0, offsetY = -35, startRange = 1, endRange = 8, category = "colorToColor" },
			matching = { mode = "memory", layout = 9, numRandom = true }  		
	},
	
	
	game5 = {
			gameType = "question",
			nextWaypoint = false,
			question = { offsetY = -65 },
			cards = { scale = 1, offsetX = 0, offsetY = -50, startRange = 2, endRange = 8, answerRange = 5, category = "colorItem" },
			questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }
	},
	game6 = {
			gameType = "puzzle",
			question = { offsetY = -65 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 3, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 },
			puzzle = { imageSet = "Objects", typeSet = "Color", number = "random", minRand = 5, maxRand = 5, maskSet = 3, otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "slotAlpha", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
			
	},
	game7 = {
			gameType = "matching",
			nextWaypoint = false,
			question = { line1 = "Touch a color, then another", line2 = "card with the same color.", scale = .8, offsetY = -67 },
			cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 4, endRange = 8, category = "colorToColorItem" },
			matching = { mode = "showme", layout = 9, numRandom = true }
			
	},
	
	game8 = {
			gameType = "question",
			question = { offsetY = -65 },
			cards = { scale = 1, offsetX = 0, offsetY = -50, startRange = 3, endRange = 8, answerRange = 5, category = "colorItem" },
			questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 5, scattered = true, imageCount = 9, skip = 1 }
	},
	
	game9 = {
			gameType = "puzzle",
			nextWaypoint = false, --false,
			question = { offsetY = -65 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 3, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 },
			puzzle = { imageSet = "Objects", typeSet = "Color", number = "random", minRand = 5, maxRand = 5, maskSet = 3, otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "slotAlpha", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
			
	},
	game10 = {
			gameType = "question",
			question = { offsetY = -65 },
			cards = { scale = 1, offsetX = 0, offsetY = -50, startRange = 4, endRange = 8, answerRange = 5, category = "colorItem" },
			questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 5, scattered = true, imageCount = 9, skip = 1 }
	},
	game11 = {
			gameType = "matching",
			nextWaypoint = false,
			question = { line1 = "Find the matching colors.", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -67 },equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { scale = 1, offsetX = 0, offsetY = -35, startRange = 4, endRange = 8, category = "colorItemToColorItem" },
			matching = { mode = "memory", layout = 9, numRandom = true }  		
	},
	game12 = {
			gameType = "question",
			question = { offsetY = -65 },
			cards = { scale = 1, offsetX = 0, offsetY = -50, startRange = 4, endRange = 8, answerRange = 5, category = "colorItem" },
			questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 5, scattered = true, imageCount = 9, skip = 1 }
	},
	
	
}
