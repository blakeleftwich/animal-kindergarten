--Ralphie the Cat Remember your colors
return {

	game1 = {
			
							
			gameType = "matching",
			question = { line1 = "Find the matching colors!", scale = .8 },
			cards = { spacing = 176, vSpacing = 93, scale = 1.25, offsetX = 0, offsetY = -33, startRange = 5, endRange = 6, category = "colorToColor" },
			matching = { mode = "showme", classic = false, layout = 1, numRandom = true, showMeMode = 2 }
	},
	game2 = {
			gameType = "question", --touch the red items
			nextWaypoint = false,--false
			question = { scale = .8 },
			cards = { spacing = 54, vSpacing = 118, scale = 1.25, offsetX = 0, offsetY = -57, startRange = 1, endRange = 4, answerRange = 3, category = "colorItem" },
			questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }
	},
	game3 = {
			
							
			gameType = "matching",
			question = { line1 = "Find the matching colors!", scale = .8 },
			cards = { spacing = 76, vSpacing = 93, scale = 1.25, offsetX = 0, offsetY = -33, startRange = 7, endRange = 8, category = "colorToColor" },
			matching = { mode = "memory", classic = true, layout = 1, numRandom = true, showMeMode = 2 }
	},
	game4 = {
			gameType = "question", --touch the red items
			question = { scale = .8 },
			cards = { spacing = 54, vSpacing = 118, scale = 1.25, offsetX = 0, offsetY = -57, startRange = 5, endRange = 8, answerRange = 3, category = "colorItem" },
			questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }
	},
	
	-- game5 = {
			-- gameType = "question", --touch the red items
			-- nextWaypoint = true,--false
			-- grayBGY = 140,				
			-- question = { line1 = "", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -66 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { spacing = 49, vSpacing = 118, scale = 1.15, offsetX = 0, offsetY = -61, startRange = 5, endRange = 8, answerRange = 5, category = "colorItem" },
			-- questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 2, numChoices = 5, scattered = true, imageCount = 9, skip = 1 }
	-- },
	game5 = {
			
							
			gameType = "matching",
			question = { line1 = "Find the matching colors!", scale = .8 },
			cards = { spacing = 176, vSpacing = 93, scale = 1.25, offsetX = 0, offsetY = -33, startRange = 3, endRange = 4, category = "colorItemToColorItem" },
			matching = { mode = "showme", classic = false, layout = 1, numRandom = true, showMeMode = 2 }
	},
	game6 = {
	
			gameType = "question", --touch the red items
			question = { scale = .8 },
			cards = { spacing = 54, vSpacing = 118, scale = 1.25, offsetX = 0, offsetY = -57, startRange = 5, endRange = 8, answerRange = 3, category = "colorItem" },
			questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }
	
			-- gameType = "question", --touch the red items
			-- nextWaypoint = true,--false
			-- grayBGY = 140,				
			-- question = { line1 = "", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -66 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { spacing = 54, vSpacing = 118, scale = 1.25, offsetX = 0, offsetY = -57, startRange = 3, endRange = 6 , answerRange = 5, category = "colorItem" },
			-- questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 2, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }
	},
	game7 = {
			
							
			gameType = "matching",
			question = { line1 = "Find the matching colors!", scale = .8 },
			cards = { spacing = 76, vSpacing = 93, scale = 1.25, offsetX = 0, offsetY = -33, startRange = 1, endRange = 8, category = "colorToColor" },
			matching = { mode = "memory", classic = true, layout = 5, numRandom = true, showMeMode = 2 }
	},
}
