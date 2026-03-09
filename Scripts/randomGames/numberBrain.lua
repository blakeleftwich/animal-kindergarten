return {
	{
			
			gameType = "puzzleSlots",
			question = { offsetY = -36 },
			cards = { scale = 1.4, offsetX = 0, offsetY = 50, startRange = 0, endRange = 1, answerRange = 2, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 3, scattered = true, imageCount = "random", skip = 1, skipPattern = "", startNum = "", order = "ascending" },
			puzzle = { imageSet = "CardsNumDifficult", number = "random", minRand = 50, maxRand = 99, incorrectChoices = 2, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
	
	},
	{
			
			gameType = "counting",
			question = { offsetY = -67 },
			cards = { scale = .95, offsetX = 0, offsetY = -35, startRange = 20, endRange = 70, category = "numbers" },
			
			counting = { rowNum = 3, columnNum = 2, spacing = 10, startNum = "random", skip = 10, placeMatch = 10 }
	},
	
	{
			
							
			gameType = "matching",
			question = { line1 = "Touch a number, then a card", line2 = "with the same number of items.", scale = .8, offsetY = -69 },
			cards = { spacing = 76, vSpacing = 93, scale = 1.2, offsetX = 0, offsetY = -23, startRange = 4, endRange = 10, category = "numbersToGroups" },
			matching = { mode = "showme", classic = true, layout = 3, numRandom = true, showMeMode = 2 }
	},
	
	
	{
			gameType = "puzzleSlots",
			question = { scale = .9, offsetY = -36 },
			cards = { scale = 1.3, offsetX = 0, offsetY = 50, startRange = 1, endRange = 70, answerRange = 10, category = "numbers" },
			
			questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 4, scattered = true, imageCount = "random", skip = "none", skipPattern = "", startNum = "", order = "ascending" },
			puzzle = { imageSet = "CardsPutInOrderClassicDifficult", number = "random", minRand = 1, maxRand = 30, incorrectChoices = 0, minSlotNum = 5, maxSlotNum = 5, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
	

			
	},
	{
			gameType = "sequence",
			grayBGY = 110,
			question = { line1 = "What comes next?", offsetY = -67 },
			cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 10, endRange = 70, answerRange = 2, category = "numbers" },
			
			sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 80, blankLocation = 4, placeMatch = 10, skip = 10, startNum = "random", patternLength = 1, order = "ascending", numChoices = 3 }
	},
	
	
	{
			
							
			gameType = "matching",
			question = { line1 = "Touch a number, then a card", line2 = "with the same number of items.", scale = .8, offsetY = -69 },
			cards = { spacing = 76, vSpacing = 93, scale = 0.8, offsetX = 0, offsetY = -23, startRange = 1, endRange = 10, category = "numbersToGroups" },
			matching = { mode = "showme", classic = true, layout = 6, numRandom = true, showMeMode = 2 }
	},
	
	{
			
							
			gameType = "matching",
			question = { line1 = "Touch a number, then a card", line2 = "with the same number of items.", scale = .8, offsetY = -69 },
			cards = { spacing = 76, vSpacing = 93, scale = 0.8, offsetX = 0, offsetY = -23, startRange = 1, endRange = 10, category = "numbersToGroups" },
			matching = { mode = "showme", classic = true, layout = 6, numRandom = true, showMeMode = 2 }
	},
}
