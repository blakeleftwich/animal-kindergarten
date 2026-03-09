--Pete What's Missing
return {

	-- game1 = {
			-- gameType = "sequence",
			-- nextWaypoint = true,
			-- grayBGY = 110,
			-- question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { spacing = 42, scale = .95, offsetX = 0, offsetY = 33, startRange = 40, endRange = 66, answerRange = 2, category = "numbers" },
			
			-- sequence = { numItems = 5, itemsScale = .95, itemsSpacing = 80, blankLocation = 4, placeMatch = 0, skip = 1, startNum = "random", patternLength = 1, order = "ascending", numChoices = 3 }
	-- },
	game1 = {
			gameType = "sequence",
			grayBGY = 110,
			question = { line1 = "What's missing?", offsetY = -67 },
			cards = { spacing = 42, scale = .95, offsetX = 0, offsetY = 33, startRange = 40, endRange = 66, answerRange = 2, category = "numbers" },
			
			sequence = { numItems = 4, itemsScale = .95, itemsSpacing = 80, blankLocation = 4, placeMatch = 0, skip = 1, startNum = "random", patternLength = 1, order = "ascending", numChoices = 3 }
	},
	game2 = {
			gameType = "sequence",
			grayBGY = 110,
			question = { line1 = "What's missing?", offsetY = -67 },
			cards = { spacing = 42, scale = .95, offsetX = 0, offsetY = 33, startRange = 14, endRange = 20, answerRange = 3, category = "numbers" },
			
			sequence = { numItems = 4, itemsScale = .95, itemsSpacing = 80, blankLocation = 4, placeMatch = 0, skip = 2, startNum = "random", patternLength = 1, order = "ascending", numChoices = 4 }
	},
	game3 = {
			gameType = "sequence",
			grayBGY = 110,
			question = { line1 = "What's missing?", offsetY = -67 },
			cards = { spacing = 42, scale = .95, offsetX = 0, offsetY = 33, startRange = 67, endRange = 96, answerRange = 3, category = "numbers" },
			
			sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 80, blankLocation = 3, placeMatch = 0, skip = 1, startNum = "random", patternLength = 1, order = "ascending", numChoices = 4 }
	},
	-- game4 = {
			-- gameType = "sequence",
			-- nextWaypoint = false,
			-- grayBGY = 110,
			-- question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { spacing = 42, scale = .95, offsetX = 0, offsetY = 33, startRange = 21, endRange = 39, answerRange = 2, category = "numbers" },
			
			-- sequence = { numItems = 5, itemsScale = .875, itemsSpacing = 80, blankLocation = 3, placeMatch = 0, skip = 2, startNum = "random", patternLength = 1, order = "ascending", numChoices = 4 }
	-- },
	game4 = {
			gameType = "sequence",
			nextWaypoint = false,
			grayBGY = 110,
			question = { line1 = "What's missing?", offsetY = -67 },
			cards = { spacing = 42, scale = .95, offsetX = 0, offsetY = 33, startRange = 21, endRange = 39, answerRange = 3, category = "numbers" },
			
			sequence = { numItems = 4, itemsScale = .95, itemsSpacing = 80, blankLocation = 3, placeMatch = 0, skip = 2, startNum = "random", patternLength = 1, order = "ascending", numChoices = 4 }
	},
	game5 = {
			gameType = "sequence",
			grayBGY = 110,
			question = { line1 = "What's missing?", offsetY = -67 },
			equation = { scale = .9 },
			cards = { spacing = 42, scale = .95, offsetX = 0, offsetY = 33, startRange = 11, endRange = 20, answerRange = 2, category = "numbers" },
			
			sequence = { numItems = 5, itemsScale = .9, itemsSpacing = 80, blankLocation = 4, placeMatch = 0, skip = 3, startNum = "random", patternLength = 1, order = "ascending", numChoices = 3 }
	},
	game6 = {
			gameType = "sequence",
			nextWaypoint = false,
			grayBGY = 110,
			question = { line1 = "What's missing?", offsetY = -67 },
			equation = { scale = .8 },
			cards = { spacing = 42, scale = .95, offsetX = 0, offsetY = 33, startRange = 30, endRange = 46, answerRange = 2, category = "numbers" },
			
			sequence = { numItems = 5, itemsScale = .9, itemsSpacing = 80, blankLocation = 4, placeMatch = 4, skip = 4, startNum = "random", patternLength = 1, order = "ascending", numChoices = 3 }
	},
	
	game7 = {
			gameType = "sequence",
			grayBGY = 110,
			question = { line1 = "What's missing?", offsetY = -67 },
			cards = { spacing = 42, scale = .95, offsetX = 0, offsetY = 33, startRange = 67, endRange = 88, answerRange = 3, category = "numbers" },
			
			sequence = { numItems = 4, itemsScale = .95, itemsSpacing = 80, blankLocation = 3, placeMatch = 0, skip = 3, startNum = "random", patternLength = 1, order = "ascending", numChoices = 4 }
	},
	game8 = {
			gameType = "sequence",
			nextWaypoint = false,
			grayBGY = 110,
			question = { line1 = "What's missing?", offsetY = -67 },
			equation = { scale = .8 },
			cards = { spacing = 42, scale = .95, offsetX = 0, offsetY = 33, startRange = 10, endRange = 30, answerRange = 2, category = "numbers" },
			
			sequence = { numItems = 5, itemsScale = .9, itemsSpacing = 80, blankLocation = 4, placeMatch = 0, skip = 3, startNum = "random", patternLength = 1, order = "ascending", numChoices = 3 }
	},
	game9 = {
			gameType = "sequence",
			grayBGY = 110,
			question = { line1 = "What's missing?", offsetY = -67 },
			cards = { spacing = 42, scale = .95, offsetX = 0, offsetY = 33, startRange = 67, endRange = 84, answerRange = 3, category = "numbers" },
			
			sequence = { numItems = 4, itemsScale = .95, itemsSpacing = 80, blankLocation = 3, placeMatch = 1, skip = 4, startNum = "random", patternLength = 1, order = "ascending", numChoices = 4 }
	},
	
}
