--Chip the Cardinal: Basic Shapes
return {
	game1 = {
			gameType = "question",
			nextWaypoint = false,
			question = { offsetY = -30 },
			cards = { scale = .96, offsetX = 0, offsetY = -28, startRange = 1, endRange = 3, answerRange = 5, category = "shape" },
			questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, skip = 1 }
	},
	game2 = {
			gameType = "question",
			question = { offsetY = -30 },
			cards = { scale = .96, offsetX = 0, offsetY = -28, startRange = 1, endRange = 3, answerRange = 5, category = "shapeItem" },
			questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, skip = 1 }
	},
	game3 = {
			gameType = "matching",
			question = { line1 = "Find the matching shapes!", scale = .8, offsetY = -34 },
			cards = { scale = .9, offsetX = 0, offsetY = -12, startRange = 1, endRange = 5, category = "shapeToShape" },
			
			matching = { mode = "memory", layout = 5, numRandom = true }
	},
	game4 = {
			gameType = "question",
			nextWaypoint = false,
			question = { offsetY = -30 },
			cards = { scale = .96, offsetX = 0, offsetY = -28, startRange = 2, endRange = 6, answerRange = 5, category = "shape" },
			questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, skip = 1 }
	},
	game5 = {
			gameType = "question",
			question = { offsetY = -30 },
			cards = { scale = .96, offsetX = 0, offsetY = -28, startRange = 2, endRange = 6, answerRange = 5, category = "shapeItem" },
			questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, skip = 1 }
	},
	game6 = {
			gameType = "matching",
			question = { line1 = "Touch a shape, then another", line2 = "card with the same shape.", scale = .8, offsetY = -34 },
			cards = { scale = .9, offsetX = 0, offsetY = -12, startRange = 5, endRange = 10, category = "shapeToShapeItem" },
			matching = { mode = "showme", layout = 9, numRandom = true }  
	},
	game7 = {
			gameType = "question",
			nextWaypoint = false,
			question = { offsetY = -30 },
			cards = { scale = .96, offsetX = 0, offsetY = -28, startRange = 1, endRange = 8, answerRange = 5, category = "shape" },
			questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }
	},
	game8 = {
			gameType = "question",
			question = { offsetY = -30 },
			cards = { scale = .96, offsetX = 0, offsetY = -28, startRange = 1, endRange = 8, answerRange = 5, category = "shapeItem" },
			questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 5, scattered = true, imageCount = 9, skip = 1 }
	},
	game9 = {
			gameType = "matching",
			question = { line1 = "Find the matching shapes!", scale = .8, offsetY = -34 },
			cards = { scale = .9, offsetX = 0, offsetY = -12, startRange = 1, endRange = 10, category = "shapeToShapeItem" },
			matching = { mode = "memory", layout = 9, numRandom = true }  
	},


	
	
}
