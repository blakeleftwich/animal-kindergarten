--Webster the Duck: Sequences & Patterns
return {
	game1 = {
			gameType = "sequence",
			nextWaypoint = false,
			question = { line1 = "What comes next?", offsetY = -30 },
			cards = { scale = .85, offsetX = 0, offsetY = 60, startRange = 1, endRange = 10, answerRange = 2, category = "numbers" },
			
			sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 80, blankLocation = 4, skip = 1, startNum = "random", patternLength = 3, numChoices = 3 }
	},
	game2 = {
			gameType = "sequence",
			question = { line1 = "What's missing?", offsetY = -30 },
			cards = { scale = .85, offsetX = 0, offsetY = 60, startRange = 1, endRange = 10, answerRange = 2, category = "numbers" },
			
			sequence = { numItems = 5, itemsScale = .875, itemsSpacing = 80, blankLocation = "random", skip = 1, startNum = "random", patternLength = 4, numChoices = 3 }
	},
	game3 = {
			gameType = "sequence",
			nextWaypoint = false,
			question = { line1 = "What comes next?", offsetY = -30 },
			cards = { scale = .85, offsetX = 0, offsetY = 60, startRange = 1, endRange = 10, answerRange = 2, category = "items" },
			
			sequence = { numItems = 5, itemsScale = .875, itemsSpacing = 80, blankLocation = 5, skip = 1, startNum = 5, patternLength = 2, numChoices = 3 }
	},
	game4 = {
			gameType = "sequence",
			question = { line1 = "What's missing?", offsetY = -30 },
			cards = { scale = .85, offsetX = 0, offsetY = 60, startRange = 1, endRange = 10, answerRange = 2, category = "items" },
			
			sequence = { numItems = 5, itemsScale = .875, itemsSpacing = 80, blankLocation = "random", skip = 1, startNum = 5, patternLength = 2, numChoices = 3 }
	},
	game5 = {
			gameType = "sequence",
			question = { line1 = "What comes next?", offsetY = -30 },
			cards = { scale = .85, offsetX = 0, offsetY = 60, startRange = 1, endRange = 12, answerRange = 2, category = "numbers" },
			
			sequence = { numItems = 5, itemsScale = .875, itemsSpacing = 80, blankLocation = 5, skip = 2, startNum = 2, patternLength = 5, numChoices = 3 }
	},
	
	game6 = {
			gameType = "sequence",
			nextWaypoint = false,
			question = { line1 = "What comes next?", offsetY = -30 },
			cards = { scale = .85, offsetX = 0, offsetY = 60, startRange = 1, endRange = 10, answerRange = 2, category = "items" },
			
			sequence = { numItems = 6, itemsScale = .875, itemsSpacing = 80, blankLocation = 6, skip = 1, startNum = "random", patternLength = 3, numChoices = 3 }
	},
	game7 = {
			gameType = "sequence",
			question = { line1 = "What's missing?", offsetY = -30 },
			cards = { scale = .85, offsetX = 0, offsetY = 60, startRange = 1, endRange = 10, answerRange = 2, category = "items" },
			
			sequence = { numItems = 6, itemsScale = .875, itemsSpacing = 80, blankLocation = "random", skip = 1, startNum = 1, patternLength = 3, numChoices = 3 }
	},
	game8 = {
			gameType = "sequence",
			question = { line1 = "What comes next?", offsetY = -30 },
			cards = { scale = .85, offsetX = 0, offsetY = 60, startRange = 1, endRange = 12, answerRange = 2, category = "numbers" },
			
			sequence = { numItems = 5, itemsScale = .875, itemsSpacing = 80, blankLocation = 5, skip = 2, startNum = 6, patternLength = 3, numChoices = 3 }
	},
	game9 = {
			gameType = "sequence",
			nextWaypoint = false,
			question = { line1 = "What's missing?", offsetY = -30 },
			cards = { scale = .85, offsetX = 0, offsetY = 60, startRange = 1, endRange = 20, answerRange = 2, category = "items" },
			sequence = { numItems = 7, itemsScale = .875, itemsSpacing = 70, blankLocation = 7, skip = 1, startNum = 1, patternLength = 4, numChoices = 3 }
	},
	game10 = {
			gameType = "sequence",
			question = { line1 = "What's missing?", offsetY = -30 },
			cards = { scale = .85, offsetX = 0, offsetY = 60, startRange = 1, endRange = 20, answerRange = 2, category = "items" },
			sequence = { numItems = 7, itemsScale = .875, itemsSpacing = 70, blankLocation = "random", skip = 1, startNum = 1, patternLength = 4, numChoices = 3 }
	},
	
	
}
