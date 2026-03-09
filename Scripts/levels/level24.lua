--Sunshine: Review 3
return {

	
	game1 = {
			gameType = "bubbleCounting",
			question = { scale = .9 },
			cards = { scale = 1, offsetX = 0, offsetY = 50, startRange = 3, endRange = 6, groupStartRange = 3, groupEndRange = 3, answerRange = 3, category = "numbers" },
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
	},
	game2 = {
			
							
			gameType = "matching",
			question = { line1 = "Touch a number, then a card", line2 = "with the same number of items.", scale = .8, offsetY = -69 },
			cards = { spacing = 76, vSpacing = 93, scale = 1.15, offsetX = 0, offsetY = -27, startRange = 5, endRange = 10, category = "numbersToGroups" },
			matching = { mode = "showme", classic = true, layout = 9, numRandom = true, showMeMode = 2 }
	},
	game3 = {
			
			gameType = "question",
			nextWaypoint = false,
			cards = { spacing = 60, scale = 1.375, offsetX = 0, offsetY = -40, startRange = 5, endRange = 10, answerRange = 4, category = "numbers" },
			questions = { questionType1 = "Which number is", questionType2 = "GreaterLess", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 1 }
	
			
	},
	game4 = {
			
			gameType = "question",
			cards = { spacing = 60, scale = 1.375, offsetX = 0, offsetY = -40, startRange = 15, endRange = 30, answerRange = 4, category = "numbers" },
			questions = { questionType1 = "Which number is", questionType2 = "GreaterLess", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 1 }
	
			
	},
	
	game5 = {
			
							
			gameType = "matching",
			question = { line1 = "Touch a number, then a card", line2 = "with the same number of items.", scale = .8, offsetY = -69 },
			cards = { spacing = 76, vSpacing = 93, scale = 1.15, offsetX = 0, offsetY = -27, startRange = 5, endRange = 10, category = "numbersToGroups" },
			matching = { mode = "showme", classic = true, layout = 9, numRandom = true, showMeMode = 2 }
	},
	
	game6 = {
			gameType = "bubbleCounting",
			question = { scale = .9 },
			cards = { scale = 1, offsetX = 0, offsetY = 50, startRange = 7, endRange = 10, groupStartRange = 3, groupEndRange = 3, answerRange = 3, category = "numbers" },
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
	},

	game7 = {
			
							
			gameType = "matching",
			question = { line1 = "Touch a number, then a card", line2 = "with the same number of items.", scale = .8, offsetY = -69 },
			cards = { spacing = 76, vSpacing = 93, scale = 1.15, offsetX = 0, offsetY = -27, startRange = 5, endRange = 10, category = "groupsToGroups" },
			matching = { mode = "showme", classic = true, layout = 5, numRandom = true, showMeMode = 2 }
	},
	

	-- game1 = {
			-- gameType = "bubbleCounting",
			-- nextWaypoint = true,
			-- grayBGY = 140,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = 1, offsetX = 0, offsetY = 50, startRange = 4, endRange = 10, groupStartRange = 3, groupEndRange = 3, answerRange = 3, category = "numbers" },
			-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
	-- },
	-- game2 = {
			
			-- gameType = "question",
			-- nextWaypoint = true,
			-- grayBGY = 140,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { spacing = 60, scale = 1.375, offsetX = 0, offsetY = -40, startRange = 35, endRange = 50, answerRange = 4, category = "numbers" },
			-- questions = { questionType1 = "Which number is", questionType2 = "GreaterLess", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 1 }
	
			
	-- },
	
	-- game3 = {
			
							
			-- gameType = "matching",
			-- nextWaypoint = true,
			-- grayBGY = 140,
			-- question = { line1 = "Touch a number, then a card", line2 = "with the same number of items.", spacing = 20, scale = .8, offsetX = 0, offsetY = -69 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { spacing = 76, vSpacing = 93, scale = 1.46, offsetX = 0, offsetY = -47, startRange = 4, endRange = 10, category = "numbersToGroups" },
			-- matching = { mode = "showme", classic = true, layout = 3, numRandom = true, showMeMode = 2 }
	-- },
	
	-- game4 = {
			
							
			-- gameType = "matching",
			-- nextWaypoint = true,
			-- grayBGY = 140,
							-- question = { line1 = "Match picture cards that have", line2 = "the same number of items.", spacing = 20, scale = .8, offsetX = 0, offsetY = -69 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { spacing = 76, vSpacing = 93, scale = 1.25, offsetX = 0, offsetY = -13, startRange = 6, endRange = 10, category = "groupsToGroups" },
			-- matching = { mode = "showme", classic = true, layout = 1, numRandom = true, showMeMode = 2 }
	-- },
	-- game5 = {
			-- gameType = "bubbleCounting",
			-- nextWaypoint = true,
			-- grayBGY = 140,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = 1, offsetX = 0, offsetY = 50, startRange = 6, endRange = 10, groupStartRange = 3, groupEndRange = 3, answerRange = 3, category = "numbers" },
			-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
	-- },
	-- game6 = {
			
			-- gameType = "question",
			-- nextWaypoint = true,
			-- grayBGY = 140,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { spacing = 60, scale = 1.375, offsetX = 0, offsetY = -40, startRange = 50, endRange = 96, answerRange = 4, category = "numbers" },
			-- questions = { questionType1 = "Which number is", questionType2 = "GreaterLess", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 1 }
	
			
	-- },
	
	-- game1 = {
			-- gameType = "sequence",
			-- nextWaypoint = true,
			-- grayBGY = 100,
			-- question = { line1 = "What comes next?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
			-- equation = { scale = .97, offsetX = 0, offsetY = 0 },
			-- cards = { scale = .95, offsetX = 0, offsetY = 20, startRange = 9, endRange = 12, answerRange = 2, category = "items" },
			-- sequence = { numItems = 6, itemsScale = 1, itemsSpacing = 2, blankLocation = 6, placeMatch = 0, skip = 1, skipPattern = "", startNum = "random", patternLength = 2, order = "ascending", numChoices = 3 }
	-- },
	-- game2 = {
			-- gameType = "basket",
			-- nextWaypoint = true,
			-- grayBGY = 140,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = .85, offsetX = 0, offsetY = -65 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 2, endRange = 7, answerRange = 2, category = "numbers" },
			
			-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, numExtraMin = -1, numExtraMax = 0, imageCount = "random", skip = 1 }
				
	-- },
	-- game3 = {
			-- gameType = "question",
			-- nextWaypoint = true,
			-- grayBGY = 100,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = 0.95, offsetX = 0, offsetY = -66 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = 1, offsetX = 0, offsetY = 20, startRange = 14, endRange = 17, answerRange = 2, category = "numbers" },
			
			-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = false, imageCount = "random", skip = 1 }
			
	-- },
	-- game4 = {
			-- gameType = "sequence",
			-- nextWaypoint = true,
			-- grayBGY = 110,
			-- question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
			-- equation = { scale = .9, offsetX = 0, offsetY = 0 },
			-- cards = { spacing = 38.5, scale = .95, offsetX = 0, offsetY = 33, startRange = 10, endRange = 20, answerRange = 2, category = "numbers" },
			
			-- sequence = { numItems = 5, itemsScale = .9, itemsSpacing = 80, blankLocation = 4, placeMatch = 0, skip = 1, startNum = "random", patternLength = 1, order = "ascending", numChoices = 3 }
	-- },
	-- game5 = {
			-- gameType = "question",
			-- nextWaypoint = false,
			-- grayBGY = 110,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 15, endRange = 20, answerRange = 2, category = "numbers" },
			
			-- questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = false, imageCount = 18, skip = 1, showGreen = true, showYellow = true }
	-- },
	-- game6 = {
			-- gameType = "question",
			-- nextWaypoint = true,
			-- grayBGY = 110,
			-- question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
			-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
			-- cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 15, endRange = 20, answerRange = 2, category = "numbers" },
			
			-- questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = false, imageCount = 18, skip = 1, showGreen = true, showYellow = true }
	-- },
	-- game7 = {
			-- gameType = "sequence",
			-- nextWaypoint = true,
			-- grayBGY = 100,
			-- question = { line1 = "What comes next?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
			-- equation = { scale = .97, offsetX = 0, offsetY = 0 },
			-- cards = { scale = .95, offsetX = 0, offsetY = 20, startRange = 9, endRange = 12, answerRange = 2, category = "items" },
			-- sequence = { numItems = 6, itemsScale = 1, itemsSpacing = 2, blankLocation = 5, placeMatch = 0, skip = 1, skipPattern = "", startNum = "random", patternLength = 3, order = "ascending", numChoices = 3 }
	-- },
	
}
