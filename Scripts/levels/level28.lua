--Ralphie: Image Patterns
return {
	game1 = {
			gameType = "sequence",
			grayBGY = 110,
			question = { line1 = "What comes next?", offsetY = -67 },
			equation = { scale = .975 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 9, endRange = 12, answerRange = 2, category = "items" },
			sequence = { numItems = 6, itemsScale = 1, itemsSpacing = 2, blankLocation = 6, placeMatch = 0, skip = 1, skipPattern = "", startNum = "random", patternLength = 2, order = "ascending", numChoices = 3 }
	},
	game2 = {
			gameType = "sequence",
			grayBGY = 110,
			question = { line1 = "What comes next?", offsetY = -67 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 5, endRange = 8, answerRange = 2, category = "items" },
			sequence = { numItems = 5, itemsScale = 1, itemsSpacing = 2, blankLocation = 5, placeMatch = 0, skip = 1, skipPattern = "", startNum = "random", patternLength = 2, order = "ascending", numChoices = 3 }
	},
	game3 = {
			gameType = "sequence",
			grayBGY = 110,
			question = { line1 = "What comes next?", offsetY = -67 },
			equation = { scale = .975 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 4, answerRange = 2, category = "items" },
			sequence = { numItems = 6, itemsScale = 1, itemsSpacing = 2, blankLocation = 6, placeMatch = 0, skip = 1, skipPattern = "", startNum = "random", patternLength = 3, order = "ascending", numChoices = 3 }
	},
	game4 = {
			gameType = "sequence",
			grayBGY = 110,
			question = { line1 = "What's missing?", offsetY = -67 },
			equation = { scale = .975 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 5, endRange = 8, answerRange = 2, category = "items" },
			sequence = { numItems = 6, itemsScale = 1, itemsSpacing = 2, blankLocation = 5, placeMatch = 0, skip = 1, skipPattern = "", startNum = "random", patternLength = 2, order = "ascending", numChoices = 3 }
	},
	game5 = {
			gameType = "sequence",
			grayBGY = 110,
			question = { line1 = "What's missing?", offsetY = -67 },
			equation = { scale = .975 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 9, endRange = 12, answerRange = 2, category = "items" },
			sequence = { numItems = 6, itemsScale = 1, itemsSpacing = 2, blankLocation = 5, placeMatch = 0, skip = 1, skipPattern = "", startNum = "random", patternLength = 3, order = "ascending", numChoices = 3 }
	},
	game6 = {
			gameType = "sequence",
			grayBGY = 110,
			question = { line1 = "What's missing?", offsetY = -67 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 4, answerRange = 2, category = "items" },
			sequence = { numItems = 5, itemsScale = 1, itemsSpacing = 2, blankLocation = 4, placeMatch = 0, skip = 1, skipPattern = "", startNum = "random", patternLength = 2, order = "ascending", numChoices = 3 }
	},
	-- game1 = {
			-- gameType = "question",
			-- nextWaypoint = true,
			-- grayBGY = 110,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 1, endRange = 3, answerRange = 3, category = "numbers" },
			
			-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
	-- },
	-- game2 = {
			-- gameType = "question",
			-- nextWaypoint = true,
			-- grayBGY = 110,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 4, endRange = 6, answerRange = 3, category = "numbers" },
			
			-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
	-- },
	-- game3 = {
			-- gameType = "question",
			-- nextWaypoint = true,
			-- grayBGY = 110,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 2, endRange = 10, answerRange = 3, category = "numbers" },
			
			-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
	-- },
	-- game4 = {
			-- gameType = "question",
			-- nextWaypoint = true,
			-- grayBGY = 110,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 11, endRange = 14, answerRange = 3, category = "numbers" },
			
			-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = false, imageCount = "random", skip = 1 }
	-- },
	-- game5 = {
			-- gameType = "question",
			-- nextWaypoint = true,
			-- grayBGY = 110,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 15, endRange = 20, answerRange = 3, category = "numbers" },
			
			-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = false, imageCount = "random", skip = 1 }
	-- },
	-- game6 = {
			-- gameType = "question",
			-- nextWaypoint = true,
			-- grayBGY = 110,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 11, endRange = 20, answerRange = 3, category = "numbers" },
			
			-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = false, imageCount = "random", skip = 1 }
	-- },
	
}
