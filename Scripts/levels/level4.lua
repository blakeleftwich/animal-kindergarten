--Chip: Shape Up!
return {
	game1 = {
			gameType = "question", --touch the red items
			question = { scale = .8 },
			cards = { spacing = 60, vSpacing = 118, scale = 1.4, offsetX = 0, offsetY = -57, startRange = 4, endRange = 7, answerRange = 5, category = "shape" },
			questions = { questionType1 = "Which one is a", questionType2 = "rectangle", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }
	},
	game2 = {
			gameType = "question", --touch the red items
			nextWaypoint = false,--false
			question = { scale = .8 },
			cards = { spacing = 60, vSpacing = 118, scale = 1.4, offsetX = 0, offsetY = -57, startRange = 1, endRange = 3, answerRange = 5, category = "shapeItem" },
			questions = { questionType1 = "Which one is a", questionType2 = "triangle", numAnswers = 2, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }
			
	},
	game3 = {
			
							
			gameType = "matching",
			question = { line1 = "Find the matching shapes!", scale = .8 },
			cards = { 
				spacing = 10, vSpacing = 18, scale = 1.3, offsetX = 0, offsetY = -26, startRange = 5, endRange = 10, category = "shapeToShape" },
			matching = { mode = "showme", classic = false, layout = 1, numRandom = true, showMeMode = 2 }
	},
	game4 = {
			gameType = "question", --touch the red items
			question = { scale = .8 },
			cards = { spacing = 48.75, vSpacing = 118, scale = 1.125, offsetX = 0, offsetY = -55, startRange = 5, endRange = 8, answerRange = 5, category = "shapeItem" },
			questions = { questionType1 = "Which one is a", questionType2 = "oval", numAnswers = 2, numChoices = 5, scattered = true, imageCount = 9, skip = 1 }	
				
		
	},
	game5 = {
			gameType = "question", --touch the red items
			nextWaypoint = false,--false
			question = { scale = .8 },
			cards = { spacing = 60, vSpacing = 118, scale = 1.4, offsetX = 0, offsetY = -57, startRange = 6, endRange = 10, answerRange = 5, category = "shapeItem" },
			questions = { questionType1 = "Which one is a", questionType2 = "octagon", numAnswers = 2, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }
	},
	game6 = {
			
							
			gameType = "matching",
			question = { line1 = "Find the matching shapes!", scale = .8 },
			cards = { spacing = 60, vSpacing = 118, scale = 1.3, offsetX = 0, offsetY = -26, startRange = 3, endRange = 6, category = "shapeToShape" },
			matching = { mode = "showme", classic = false, layout = 5, numRandom = true, showMeMode = 2 }
	},
	
	game7 = {
			gameType = "question", --touch the red items
			nextWaypoint = false,--false
			question = { scale = .8 },
			cards = { spacing = 48.75, vSpacing = 118, scale = 1.125, offsetX = 0, offsetY = -55, startRange = 1, endRange = 10, answerRange = 5, category = "shapeItem" },
			questions = { questionType1 = "Which one is a", questionType2 = "rhombus", numAnswers = 2, numChoices = 5, scattered = true, imageCount = 9, skip = 1 }
	},
	game8 = {
			gameType = "question", --touch the red items
			question = { scale = .8 },
			cards = { spacing = 60, vSpacing = 118, scale = 1.4, offsetX = 0, offsetY = -57, startRange = 6, endRange = 10, answerRange = 5, category = "shapeItem" },
			questions = { questionType1 = "Which one is a", questionType2 = "pentagon", numAnswers = 2, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }
	},
	game9 = {
			
							
			gameType = "matching",
			question = { line1 = "Find the matching shapes!", scale = .8 },
			cards = { spacing = 60, vSpacing = 118, scale = 1.3, offsetX = 0, offsetY = -26, startRange = 1, endRange = 10, category = "shapeToShape" },
			matching = { mode = "memory", classic = true, layout = 9, numRandom = true, showMeMode = 2 }
	},
	
	
}
