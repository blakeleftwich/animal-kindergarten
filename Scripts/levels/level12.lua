--Cordelia COunting Skills
return {
	
	
	game1 = {
			gameType = "touchCounting",
			question = { scale = .9, offsetY = -65 },
			cards = { scale = 1, offsetX = 0, offsetY = 50, startRange = 6, endRange = 9, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
					
	},
	
	
	game2 = {
			gameType = "question",
			grayBGY = 100,
			question = { scale = 0.95 },
			cards = { scale = .95, offsetX = 0, offsetY = 20, startRange = 6, endRange = 9, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
			
	},
	
	game3 = {
			gameType = "question",
			nextWaypoint = false,
			grayBGY = 110,
			question = { offsetY = -67 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 6, endRange = 10, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = false, imageCount = 10, skip = 1, showGreen = true, showYellow = false }
	},
	
		
	game4 = {
			gameType = "question",
			grayBGY = 110,
			question = { offsetY = -67 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 6, endRange = 10, answerRange = 3, category = "numbers" },
			
			questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = false, imageCount = 10, skip = 1, showGreen = true, showYellow = false }
	},
	

	game5 = {
			gameType = "question",
			nextWaypoint = false,
			grayBGY = 100,
			question = { scale = 0.95 },
			cards = { scale = .95, offsetX = 0, offsetY = 20, startRange = 12, endRange = 15, answerRange = 3, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = false, imageCount = "random", skip = 1 }
			
	},
	
	
	game6 = {
			gameType = "basket",
			question = { scale = .85, offsetY = -65 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 5, endRange = 9, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, numExtraMin = -1, numExtraMax = 0, imageCount = "random", skip = 1 }
				
	},
	
	
	
	
	
	game7 = {
			gameType = "question",
			nextWaypoint = false,
			grayBGY = 110,
			question = { offsetY = -67 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 6, endRange = 9, answerRange = 3, category = "numbers" },
			
			questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = false, imageCount = 18, skip = 1, showGreen = true, showYellow = false }
	},
	game8 = {
			gameType = "question",
			grayBGY = 110,
			question = { offsetY = -67 },
			cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 6, endRange = 9, answerRange = 3, category = "numbers" },
			
			questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = false, imageCount = 18, skip = 1, showGreen = true, showYellow = false }
	},
	game9 = {
			gameType = "question",
			nextWaypoint = false,
			grayBGY = 100,
			question = { scale = 0.95 },
			cards = { scale = .95, offsetX = 0, offsetY = 20, startRange = 9, endRange = 13, answerRange = 3, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = false, imageCount = "random", skip = 1 }
			
	},
	game10 = {
			gameType = "question",
			grayBGY = 100,
			question = { scale = 0.95 },
			cards = { scale = .95, offsetX = 0, offsetY = 20, startRange = 15, endRange = 20, answerRange = 3, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = false, imageCount = "random", skip = 1 }
			
	},
	
	
}
