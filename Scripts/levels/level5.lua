--Pinkie: Identify Numbers
return {
	
	game1 = {
			gameType = "touchTheNumber",
			question = { scale = .9 },
			cards = { spacing = 60, vSpacing = 118, scale = 1.3, startRange = 20, endRange = 20, offsetX = 0, offsetY = -26, answerRange = 3, category = "numbers" },
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 1 }
			},
			
			
			-- gameType = "touchTheNumber",
			-- nextWaypoint = true,
			-- grayBGY = 140,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = 1, offsetX = 0, offsetY = 50, startRange = 21, endRange = 21, answerRange = 2, category = "numbers" },
			-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
	game2 = {
			
			
				-- gameType = "matching",
			-- nextWaypoint = true,
			-- grayBGY = 140,
			-- question = { line1 = "Find the matching shapes!", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -66 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { spacing = 76, vSpacing = 93, scale = 1.25, offsetX = 0, offsetY = -33, startRange = 7, endRange = 10, category = "shapeToShape" },
			-- matching = { mode = "showme", classic = false, layout = 1, numRandom = true, showMeMode = 2 }

			
			gameType = "matching",
			question = { line1 = "Find the matching colors!", scale = .8 },
			cards = { spacing = 76, vSpacing = 93, scale = 1.25, offsetX = 0, offsetY = -33, startRange = 8, endRange = 12, category = "numbersToNumbers" },
			matching = { mode = "showme", classic = false, layout = 1, numRandom = true, showMeMode = 2 }
	},
	game3 = {
			gameType = "touchTheNumber",
			question = { scale = .9 },
			cards = { scale = 1, offsetX = 0, offsetY = 50, startRange = 21, endRange = 21, answerRange = 2, category = "numbers" },
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
	},
	game4 = {
			
							
			gameType = "matching",
			question = { line1 = "Find the matching colors!", scale = .8 },
			cards = { spacing = 76, vSpacing = 93, scale = 1.25, offsetX = 0, offsetY = -33, startRange = 13, endRange = 20, category = "numbersToNumbers" },
			matching = { mode = "showme", classic = false, layout = 1, numRandom = true, showMeMode = 2 }
	},
	game5 = {
			gameType = "touchTheNumber",
			question = { scale = .9 },
			cards = { scale = 1, offsetX = 0, offsetY = 50, startRange = 22, endRange = 22, answerRange = 3, category = "numbers" },
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 1 }
	},
	game6 = {
			
							
			gameType = "matching",
			question = { line1 = "Find the matching colors!", scale = .8 },
			cards = { spacing = 76, vSpacing = 93, scale = 1.25, offsetX = 0, offsetY = -33, startRange = 16, endRange = 20, category = "numbersToNumbers" },
			matching = { mode = "showme", classic = false, layout = 5, numRandom = true, showMeMode = 2 }
	},
	
}
