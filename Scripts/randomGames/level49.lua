--Cordelia The Chicken:
return {
	game1 = {
			gameType = "question",
			nextWaypoint = false,
			question = { offsetY = -65 },
			cards = { scale = 1, offsetX = 0, offsetY = -50, startRange = 1, endRange = 5, answerRange = 5, category = "colorItem" },
			questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 5, scattered = true, imageCount = 9, skip = 1 }
	},
	
	game2 = {
			gameType = "question",
			nextWaypoint = false,
			question = { offsetY = -65 },
			cards = { scale = 1, offsetX = 0, offsetY = -50, startRange = 1, endRange = 5, answerRange = 5, category = "shape" },
			questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 5, scattered = true, imageCount = 9, skip = 1 }
	},
		
	game3 = {
			gameType = "question",
			nextWaypoint = false,
			question = { offsetY = -65 },
			cards = { scale = 1, offsetX = 0, offsetY = -50, startRange = 4, endRange = 8, answerRange = 5, category = "colorItem" },
			questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 5, scattered = true, imageCount = 9, skip = 1 }
	},
	
	
	game4 = {
			gameType = "question",
			nextWaypoint = false,
			question = { offsetY = -65 },
			cards = { scale = 1, offsetX = 0, offsetY = -50, startRange = 5, endRange = 9, answerRange = 5, category = "shape" },
			questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 5, scattered = true, imageCount = 9, skip = 1 }
	},
	
	game5 = {
			gameType = "question",
			question = { offsetY = -65 },
			cards = { scale = .94, offsetX = 0, offsetY = -34, startRange = 1, endRange = 2, category = "item" },				
			questions = { questionType1 = "Which item is", questionType2 = "BiggerSmaller", numAnswers = 1, numChoices = 2, scattered = true, imageCount = "random", skip = 1 }
	},
	
	game6 = {
			gameType = "question",
			nextWaypoint = false,
			question = { offsetY = -65 },
			cards = { scale = .94, offsetX = 0, offsetY = -34, startRange = 1, endRange = 2, category = "item" },				
			questions = { questionType1 = "Which item is", questionType2 = "BiggerSmaller", numAnswers = 1, numChoices = 2, scattered = true, imageCount = "random", skip = 1 }
	},
	
	game7 = {
			gameType = "touchCounting",
			nextWaypoint = false,
			question = { scale = .9, offsetY = -65 },
			cards = { scale = 1, offsetX = 0, offsetY = 50, startRange = 2, endRange = 8, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
	},			
	
	game8 = {
			gameType = "basket",
			nextWaypoint = false,
			question = { scale = .85, offsetY = -65 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 3, endRange = 5, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, numExtraMin = 0, numExtraMax = 0, imageCount = "random", skip = 1 }
	},
	
	game9 = {
				
			gameType = "matching",
			nextWaypoint = false,
			question = { line1 = "Touch a number, then a card", line2 = "with the same number of items.", scale = .8, offsetY = -67 },
			cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 4, endRange = 9, category = "numbersToGroups" },
			matching = { mode = "showme", layout = 5, numRandom = true }
	},
	
	game10 = {
			gameType = "question",
			grayBGY = 110,
			question = { offsetY = -67 },
			cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 2, endRange = 6, answerRange = 3, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
	},	
	
	game11 = {
			gameType = "question",
			nextWaypoint = false,
			grayBGY = 110,
			question = { offsetY = -67 },
			cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 1, endRange = 10, answerRange = 3, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
	},
	
			
	
	
	game12 = {
			gameType = "question",
			nextWaypoint = false,
			grayBGY = 110,
			question = { offsetY = -67 },
			cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 3, endRange = 10, answerRange = 3, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 1 }
	},
	game13 = {
			gameType = "question",
			nextWaypoint = false,
			grayBGY = 110,
			question = { offsetY = -67 },
			cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 4, endRange = 8, answerRange = 3, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 1 }
	},
	
	game14 = {
			gameType = "puzzleSlots",
			nextWaypoint = false, --false,
			question = { offsetY = -65 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 9, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 },
			puzzle = { imageSet = "NumDifficult", number = "random", minRand = 10, maxRand = 15, incorrectChoices = 1, maskSet = 3, otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "slotAlpha", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
			
	},
		
		
	game15 = {
			gameType = "question",
			grayBGY = 110,
			question = { offsetY = -67 },
			cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 5, endRange = 10, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = false, imageCount = 18, skip = 1 }
	},
	game16 = {
			gameType = "question",
			nextWaypoint = false,
			grayBGY = 110,
			question = { offsetY = -67 },
			cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 3, endRange = 10, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = false, imageCount = 18, skip = 1 }
	},
		
	game17 = {
			gameType = "puzzleSlots",
			nextWaypoint = false, --false,
			question = { offsetY = -65 },
			cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 9, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 },
			puzzle = { imageSet = "NumDifficult", number = "random", minRand = 10, maxRand = 15, incorrectChoices = 1, maskSet = 3, otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "slotAlpha", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
			
	},
	
	game18 = {
			gameType = "question",
			nextWaypoint = false,
			question = { scale = .9, offsetY = -65 },
			cards = { scale = 1, offsetX = 0, offsetY = -50, startRange = 1, endRange = 5, answerRange = 1, category = "groups" },
			
			questions = { questionType1 = "Which number is", questionType2 = "MostLeast", numAnswers = 1, numChoices = 2, scattered = true, imageCount = "random", skip = 1 }
	},
	game19 = {
			gameType = "question",
			nextWaypoint = false,
			question = { scale = .9, offsetY = -65 },
			cards = { scale = 1, offsetX = 0, offsetY = -50, startRange = 3, endRange = 7, answerRange = 1, category = "groups" },
			
			questions = { questionType1 = "Which number is", questionType2 = "MostLeast", numAnswers = 1, numChoices = 2, scattered = true, imageCount = "random", skip = 1 }
	},
	
	game20 = {
			gameType = "question",
			question = { scale = .9, offsetY = -65 },
			cards = { scale = 1, offsetX = 0, offsetY = -50, startRange = 5, endRange = 10, answerRange = 1, category = "groups" },
			
			questions = { questionType1 = "Which number is", questionType2 = "MostLeast", numAnswers = 1, numChoices = 2, scattered = true, imageCount = "random", skip = 1 }
	},
	
	game21 = {
			gameType = "question",
			nextWaypoint = false,
			question = { offsetY = -65 },
			cards = { scale = 1, offsetX = 0, offsetY = -50, startRange = 6, endRange = 17, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "Which number is", questionType2 = "FirstLast", numAnswers = 1, numChoices = 3, scattered = false, imageCount = 12, skip = 1 }
	},
	game22 = {
			gameType = "question",
			nextWaypoint = false,
			question = { offsetY = -65 },
			cards = { scale = 1, offsetX = 0, offsetY = -50, startRange = 10, endRange = 20, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "Which number is", questionType2 = "FirstLast", numAnswers = 1, numChoices = 3, scattered = false, imageCount = 12, skip = 1 }
	},
	game23 = {
			gameType = "question",
			nextWaypoint = false,
			grayBGY = 110,
			question = { offsetY = -67 },
			cards = { scale = .8, offsetX = 0, offsetY = 30, startRange = 4, endRange = 18, answerRange = 2, category = "numbers" },
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 2 }
			
	
			
			
			},
	game24 = {
			
			gameType = "counting",
			nextWaypoint = false,
			question = { offsetY = -67 },
			cards = { scale = .95, offsetX = 0, offsetY = -35, startRange = 2, endRange = 20, category = "numbers" },
			
			counting = { rowNum = 4, columnNum = 2, spacing = 10, startNum = 2, skip = 2 }
	},
	game25 = {
			gameType = "sequence",
			grayBGY = 110,
			question = { line1 = "What's missing?", offsetY = -67 },
			cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 4, endRange = 20, answerRange = 3, category = "numbers" },
			sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 90, blankLocation = "random", skip = 2, startNum = 4, patternLength = 4, numChoices = 3 }

			
			
			
			},
	game26 = {
			
			gameType = "counting",
			nextWaypoint = false,
			question = { offsetY = -67 },
			cards = { scale = .95, offsetX = 0, offsetY = -35, startRange = 6, endRange = 20, category = "numbers" },
			
			counting = { rowNum = 4, columnNum = 2, spacing = 10, startNum = 6, skip = 2 }
	},
	
	
	game27 = {
			gameType = "question",
			nextWaypoint = false,
			grayBGY = 110,
			question = { offsetY = -67 },
			cards = { scale = .8, offsetX = 0, offsetY = 30, startRange = 10, endRange = 30, answerRange = 2, category = "numbers" },
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 5 }
	},
	
	
	game28 = {
			gameType = "question",
			nextWaypoint = false,
			grayBGY = 110,
			question = { offsetY = -67 },
			cards = { scale = .8, offsetX = 0, offsetY = 30, startRange = 10, endRange = 60, answerRange = 2, category = "numbers" },
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 5, scattered = true, imageCount = "random", skip = 10 }
			
	},
	
	
	
	game29 = {
			gameType = "sequence",
			nextWaypoint = false,
			grayBGY = 110,
			question = { line1 = "What's missing?", offsetY = -67 },
			cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 5, endRange = 30, answerRange = 2, category = "numbers" },
			sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 90, blankLocation = 4, skip = 5, startNum = 5, patternLength = 4, numChoices = 4 }
	
				},
		
	game30 = {
			gameType = "question",
			grayBGY = 110,
			question = { offsetY = -67 },
			cards = { scale = .8, offsetX = 0, offsetY = 30, startRange = 10, endRange = 60, answerRange = 2, category = "numbers" },
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 5, scattered = true, imageCount = "random", skip = 10 }
			
	},
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
}
