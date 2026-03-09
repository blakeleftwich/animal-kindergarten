local gameDetails = {

	level1 = { --Ralphie the Cat Remember your colors
	
		game1 = {
				
								
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Find the matching colors!", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 176, vSpacing = 93, scale = 1.25, offsetX = 0, offsetY = -33, startRange = 5, endRange = 6, category = "colorToColor" },
				matching = { mode = "showme", classic = false, layout = 1, numRandom = true, showMeMode = 2 }
		},
		game2 = {
				gameType = "question", --touch the red items
				nextWaypoint = false,--false
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 54, vSpacing = 118, scale = 1.25, offsetX = 0, offsetY = -57, startRange = 1, endRange = 4, answerRange = 3, category = "colorItem" },
				questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }
		},
		game3 = {
				
								
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Find the matching colors!", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 76, vSpacing = 93, scale = 1.25, offsetX = 0, offsetY = -33, startRange = 7, endRange = 8, category = "colorToColor" },
				matching = { mode = "memory", classic = true, layout = 1, numRandom = true, showMeMode = 2 }
		},
		game4 = {
				gameType = "question", --touch the red items
				nextWaypoint = true,--false
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
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
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Find the matching colors!", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 176, vSpacing = 93, scale = 1.25, offsetX = 0, offsetY = -33, startRange = 3, endRange = 4, category = "colorItemToColorItem" },
				matching = { mode = "showme", classic = false, layout = 1, numRandom = true, showMeMode = 2 }
		},
		game6 = {
		
				gameType = "question", --touch the red items
				nextWaypoint = true,--false
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
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
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Find the matching colors!", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 76, vSpacing = 93, scale = 1.25, offsetX = 0, offsetY = -33, startRange = 1, endRange = 8, category = "colorToColor" },
				matching = { mode = "memory", classic = true, layout = 5, numRandom = true, showMeMode = 2 }
		},
	
	
	},
	
	level2 = { --Webster: Size and Shape
		
		game1 = {
				gameType = "puzzleSlots",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .72, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .75, offsetX = 0, offsetY = 50, startRange = 1, endRange = 2, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 3, numChoices = 3, scattered = true, imageCount = "random", skip = 1 },
				puzzle = { imageSet = "ShapesDifficult", number = "random", minRand = 1, maxRand = 3, incorrectChoices = 0, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		},
		
	
		game2 = {
				gameType = "question", --touch the red items
				nextWaypoint = true,--false
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 60, vSpacing = 118, scale = 1.4, offsetX = 0, offsetY = -57, startRange = 4, endRange = 7, answerRange = 5, category = "shape" },
				questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }
				
		}, 
		
		game3 = {
				gameType = "puzzle",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 8, endRange = 8, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 },
				puzzle = { imageSet = "Objects", typeSet = "Shapes", number = 9, minRand = 4, maxRand = 9, maskSet = 3, otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "slotAlpha", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		},
		
		game4 = {
				gameType = "puzzleSlots",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .72, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .75, offsetX = 0, offsetY = 50, startRange = 6, endRange = 10, answerRange = 1, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 3, numChoices = 3, scattered = true, imageCount = "random", skip = 1 },
				puzzle = { imageSet = "ShapesDifficult", number = "random", minRand = 6, maxRand = 8, incorrectChoices = 1, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		},
		
			
		game5 = {
				gameType = "question", --touch the red items
				nextWaypoint = false,--false
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 60, vSpacing = 118, scale = 1.4, offsetX = 0, offsetY = -57, startRange = 4, endRange = 7, answerRange = 5, category = "shape" },
				questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }
				
		}, 
		-- game3 = {
				-- gameType = "puzzleSlots",
				-- nextWaypoint = true, --false,
				-- grayBGY = 140,
				-- question = { line1 = "", line2 = "", spacing = 20, scale = .72, offsetX = 0, offsetY = -66 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { scale = .75, offsetX = 0, offsetY = 50, startRange = 3, endRange = 5, answerRange = 2, category = "numbers" },
				
				-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 3, numChoices = 3, scattered = true, imageCount = "random", skip = 1 },
				-- puzzle = { imageSet = "ShapesDifficult", number = "random", minRand = 6, maxRand = 8, incorrectChoices = 1, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		-- },
		
		
		
		-- game3 = {
				-- gameType = "puzzleSlots",
				-- nextWaypoint = true, --false,
				-- grayBGY = 140,
				-- question = { line1 = "", line2 = "", spacing = 20, scale = .72, offsetX = 0, offsetY = -66 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { scale = .75, offsetX = 0, offsetY = 50, startRange = 1, endRange = 6, answerRange = 2, category = "numbers" },
				
				-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 3, numChoices = 3, scattered = true, imageCount = "random", skip = 1 },
				-- puzzle = { imageSet = "ShapesDifficult", number = "random", minRand = 4, maxRand = 6, incorrectChoices = 1, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		-- },
		
		-- game4 = {
				-- gameType = "puzzleSlots",
				-- nextWaypoint = true, --false,
				-- grayBGY = 140,
				-- question = { line1 = "", line2 = "", spacing = 20, scale = .72, offsetX = 0, offsetY = -66 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { scale = .75, offsetX = 0, offsetY = 50, startRange = 1, endRange = 3, answerRange = 2, category = "numbers" },
				
				-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 4, scattered = true, imageCount = "random", skip = 1 },
				-- puzzle = { imageSet = "ShapesDifficult", number = "random", minRand = 1, maxRand = 5, incorrectChoices = 1, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		-- },
		game6 = {
				gameType = "puzzleSlots",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .72, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .75, offsetX = 0, offsetY = 50, startRange = 1, endRange = 10, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 3, numChoices = 3, scattered = true, imageCount = "random", skip = 1 },
				puzzle = { imageSet = "ShapesDifficult", number = { 10, 7, 5 }, minRand = 1, maxRand = 10, incorrectChoices = 2, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		},
		
		game7 = {
				gameType = "question", --touch the red items
				nextWaypoint = false,--false
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 60, vSpacing = 118, scale = 1.4, offsetX = 0, offsetY = -57, startRange = 6, endRange = 10, answerRange = 5, category = "shape" },
				questions = { questionType1 = "Which one is a", questionType2 = "triangle", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }
				
		}, 
		
		game8 = {
				gameType = "puzzleSlots",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .72, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 40, startRange = 1, endRange = 10, answerRange = 1, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 4, scattered = true, imageCount = "random", skip = 1 },
				puzzle = { imageSet = "ShapesDifficult", number = { 10, 9, 8, 6 }, minRand = 1, maxRand = 10, incorrectChoices = 1, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		},
	},	
	
	
	
	level3 = { --Oliver: bigger/smaller
		
		
		game1 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 78, scale = .92, offsetX = 0, offsetY = -40, startRange = 1, endRange = 2, category = "item" },				
				questions = { questionType1 = "Which item is", questionType2 = "BiggerSmaller", numAnswers = 1, numChoices = 2, scattered = true, imageCount = "random", skip = 1 }
				--for 2 cards: cards spacing = 78, cards scale = .92, questions numChoices = 4
				--for 3 cards: cards spacing = 75, cards scale = .88, questions numChoices = 4 				
				--for 4 cards: cards spacing = 60, cards scale = .715, questions numChoices = 4 
		},
		game2 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 78, scale = .92, offsetX = 0, offsetY = -40, startRange = 1, endRange = 2, category = "item" },				
				questions = { questionType1 = "Which item is", questionType2 = "BiggerSmaller", numAnswers = 1, numChoices = 2, scattered = true, imageCount = "random", skip = 1 }
		},
		game3 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 75, scale = .88, offsetX = 0, offsetY = -40, startRange = 1, endRange = 2, category = "item" },				
				questions = { questionType1 = "Which item is", questionType2 = "BiggerSmaller", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
		},
		
		game4 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 75, scale = .88, offsetX = 0, offsetY = -40, startRange = 1, endRange = 2, category = "item" },				
				questions = { questionType1 = "Which item is", questionType2 = "BiggerSmaller", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
		},
		
		game5 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 60, scale = .715, offsetX = 0, offsetY = -40, startRange = 1, endRange = 2, category = "item" },				
				questions = { questionType1 = "Which item is", questionType2 = "BiggerSmaller", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 1 }
		},
		game6 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 75, scale = .88, offsetX = 0, offsetY = -40, startRange = 1, endRange = 2, category = "item" },				
				questions = { questionType1 = "Which item is", questionType2 = "BiggerSmaller", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
		},
		game7 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 60, scale = .715, offsetX = 0, offsetY = -40, startRange = 1, endRange = 2, category = "item" },				
				questions = { questionType1 = "Which item is", questionType2 = "BiggerSmaller", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 1 }
		},
		
		game8 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 60, scale = .715, offsetX = 0, offsetY = -40, startRange = 1, endRange = 2, category = "item" },				
				questions = { questionType1 = "Which item is", questionType2 = "BiggerSmaller", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 1 }
		},
		
	},	
	
	
	
	
	level4 = { --Chip: Shape Up!
		game1 = {
				gameType = "question", --touch the red items
				nextWaypoint = true,--false
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 60, vSpacing = 118, scale = 1.4, offsetX = 0, offsetY = -57, startRange = 4, endRange = 7, answerRange = 5, category = "shape" },
				questions = { questionType1 = "Which one is a", questionType2 = "rectangle", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }
		},
		game2 = {
				gameType = "question", --touch the red items
				nextWaypoint = false,--false
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 60, vSpacing = 118, scale = 1.4, offsetX = 0, offsetY = -57, startRange = 1, endRange = 3, answerRange = 5, category = "shapeItem" },
				questions = { questionType1 = "Which one is a", questionType2 = "triangle", numAnswers = 2, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }
				
		},
		game3 = {
				
								
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Find the matching shapes!", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { 
					spacing = 10, vSpacing = 18, scale = 1.3, offsetX = 0, offsetY = -26, startRange = 5, endRange = 10, category = "shapeToShape" },
				matching = { mode = "showme", classic = false, layout = 1, numRandom = true, showMeMode = 2 }
		},
		game4 = {
				gameType = "question", --touch the red items
				nextWaypoint = true,--false
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 48.75, vSpacing = 118, scale = 1.125, offsetX = 0, offsetY = -55, startRange = 5, endRange = 8, answerRange = 5, category = "shapeItem" },
				questions = { questionType1 = "Which one is a", questionType2 = "oval", numAnswers = 2, numChoices = 5, scattered = true, imageCount = 9, skip = 1 }	
					
			
		},
		game5 = {
				gameType = "question", --touch the red items
				nextWaypoint = false,--false
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 60, vSpacing = 118, scale = 1.4, offsetX = 0, offsetY = -57, startRange = 6, endRange = 10, answerRange = 5, category = "shapeItem" },
				questions = { questionType1 = "Which one is a", questionType2 = "octagon", numAnswers = 2, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }
		},
		game6 = {
				
								
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Find the matching shapes!", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 60, vSpacing = 118, scale = 1.3, offsetX = 0, offsetY = -26, startRange = 3, endRange = 6, category = "shapeToShape" },
				matching = { mode = "showme", classic = false, layout = 5, numRandom = true, showMeMode = 2 }
		},
		
		game7 = {
				gameType = "question", --touch the red items
				nextWaypoint = false,--false
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 48.75, vSpacing = 118, scale = 1.125, offsetX = 0, offsetY = -55, startRange = 1, endRange = 10, answerRange = 5, category = "shapeItem" },
				questions = { questionType1 = "Which one is a", questionType2 = "rhombus", numAnswers = 2, numChoices = 5, scattered = true, imageCount = 9, skip = 1 }
		},
		game8 = {
				gameType = "question", --touch the red items
				nextWaypoint = true,--false
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 60, vSpacing = 118, scale = 1.4, offsetX = 0, offsetY = -57, startRange = 6, endRange = 10, answerRange = 5, category = "shapeItem" },
				questions = { questionType1 = "Which one is a", questionType2 = "pentagon", numAnswers = 2, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }
		},
		game9 = {
				
								
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Find the matching shapes!", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 60, vSpacing = 118, scale = 1.3, offsetX = 0, offsetY = -26, startRange = 1, endRange = 10, category = "shapeToShape" },
				matching = { mode = "memory", classic = true, layout = 9, numRandom = true, showMeMode = 2 }
		},
		
		
	},
		
	
	
	level5 = { --Pinkie: Identify Numbers
		
		game1 = {
				gameType = "touchTheNumber",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
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
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Find the matching colors!", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 76, vSpacing = 93, scale = 1.25, offsetX = 0, offsetY = -33, startRange = 8, endRange = 12, category = "numbersToNumbers" },
				matching = { mode = "showme", classic = false, layout = 1, numRandom = true, showMeMode = 2 }
		},
		game3 = {
				gameType = "touchTheNumber",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = 50, startRange = 21, endRange = 21, answerRange = 2, category = "numbers" },
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
		},
		game4 = {
				
								
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Find the matching colors!", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 76, vSpacing = 93, scale = 1.25, offsetX = 0, offsetY = -33, startRange = 13, endRange = 20, category = "numbersToNumbers" },
				matching = { mode = "showme", classic = false, layout = 1, numRandom = true, showMeMode = 2 }
		},
		game5 = {
				gameType = "touchTheNumber",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = 50, startRange = 22, endRange = 22, answerRange = 3, category = "numbers" },
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 1 }
		},
		game6 = {
				
								
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Find the matching colors!", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 76, vSpacing = 93, scale = 1.25, offsetX = 0, offsetY = -33, startRange = 16, endRange = 20, category = "numbersToNumbers" },
				matching = { mode = "showme", classic = false, layout = 5, numRandom = true, showMeMode = 2 }
		},
		
	},
	
	level6 = { --Percival The Puppy Color and Shape puzzles
		game1 = {
				gameType = "puzzle",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 10, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 },
				puzzle = { imageSet = "Num", typeSet = "Color", number = "random", minRand = 1, maxRand = 10, maskSet = 3, otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "slotAlpha", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
				
		},
		game2 = {
				gameType = "puzzle",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 8, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 },
				puzzle = { imageSet = "Objects", typeSet = "Color", number = "random", minRand = 1, maxRand = 8, maskSet = 3, otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "slotAlpha", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		},
		game3 = {
				gameType = "puzzle",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 10, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 },
				puzzle = { imageSet = "Objects", typeSet = "Shapes", number = "random", minRand = 1, maxRand = 10, maskSet = 3, otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "slotAlpha", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		},
		game4 = {
				gameType = "puzzle",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 10, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 },
				puzzle = { imageSet = "Num", typeSet = "Color", number = "random", minRand = 1, maxRand = 10, maskSet = 3, otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "slotAlpha", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
				
		},
		game5 = {
				gameType = "puzzle",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 8, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 },
				puzzle = { imageSet = "Objects", typeSet = "Color", number = "random", minRand = 1, maxRand = 8, maskSet = 3, otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "slotAlpha", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		},
		game6 = {
				gameType = "puzzle",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 10, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 },
				puzzle = { imageSet = "Objects", typeSet = "Shapes", number = "random", minRand = 1, maxRand = 10, maskSet = 3, otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "slotAlpha", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		},
		
		
	
	},
	
	
	level7 = { --Sunshine Review 1
		
		game1 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 75, scale = .88, offsetX = 0, offsetY = -40, startRange = 1, endRange = 2, category = "item" },			
				questions = { questionType1 = "Which item is", questionType2 = "BiggerSmaller", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
		},
		game2 = {
				gameType = "question", --touch the red items
				nextWaypoint = true,--false
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 54, vSpacing = 118, scale = 1.25, offsetX = 0, offsetY = -57, startRange = 5, endRange = 8, answerRange = 5, category = "colorItem" },
				questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 4,scattered = true, imageCount = 9, skip = 1 }
		},
		game3 = {
				gameType = "touchTheNumber",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = 50, startRange = 37, endRange = 37, answerRange = 3, category = "numbers" },
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 1 }
				
		},
		game4 = {
				gameType = "question", --touch the red items
				nextWaypoint = true,--false
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 54, vSpacing = 118, scale = 1.25, offsetX = 0, offsetY = -57, startRange = 3, endRange = 6, answerRange = 5, category = "shapeItem" },
				questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }
		},
		game5 = {
				
								
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Find the matching colors!", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 76, vSpacing = 93, scale = 1.25, offsetX = 0, offsetY = -33, startRange = 1, endRange = 8, category = "colorToColor" },
				matching = { mode = "memory", classic = true, layout = 5, numRandom = true, showMeMode = 2 }
		},
		game6 = {
				gameType = "question", --touch the red items
				nextWaypoint = false,--false
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 54, vSpacing = 118, scale = 1.25, offsetX = 0, offsetY = -57, startRange = 7, endRange = 10, answerRange = 5, category = "shapeItem" },
				questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }
		},
		game7 = {
				gameType = "touchTheNumber",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = 50, startRange = 38, endRange = 38, answerRange = 2, category = "numbers" },
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
				
		},
		game8 = {
				gameType = "question", --touch the red items
				nextWaypoint = false,--false
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 54, vSpacing = 118, scale = 1.25, offsetX = 0, offsetY = -57, startRange = 4, endRange = 8, answerRange = 5, category = "colorItem" },
				questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 4,scattered = true, imageCount = 9, skip = 1 }
		},
		game9 = {
				gameType = "question", --touch the red items
				nextWaypoint = true,--false
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 54, vSpacing = 118, scale = 1.25, offsetX = 0, offsetY = -57, startRange = 7, endRange = 10, answerRange = 5, category = "shapeItem" },
				questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }
		},
		game10 = {
				gameType = "touchTheNumber",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = 50, startRange = 36, endRange = 36, answerRange = 2, category = "numbers" },
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
				
				
		},
		game11 = {
				
								
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Find the matching shapes!", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 76, vSpacing = 93, scale = 1.25, offsetX = 0, offsetY = -33, startRange = 1, endRange = 10, category = "shapeToShape" },
				matching = { mode = "memory", classic = true, layout = 9, numRandom = true, showMeMode = 2 }
		},
		
		
		
		-- game1 = {
				-- gameType = "question", --touch the red items
				-- nextWaypoint = false,--false
				-- grayBGY = 140,				
				-- question = { line1 = "", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -66 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { spacing = 54, vSpacing = 118, scale = 1.25, offsetX = 0, offsetY = -57, startRange = 1, endRange = 7, answerRange = 5, category = "shapeItem" },
				-- questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 4,scattered = true, imageCount = 9, skip = 1 }
		-- },
		-- game2 = {
				-- gameType = "question", --touch the red items
				-- nextWaypoint = true,--false
				-- grayBGY = 140,				
				-- question = { line1 = "", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -66 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { spacing = 54, vSpacing = 118, scale = 1.25, offsetX = 0, offsetY = -57, startRange = 1, endRange = 7, answerRange = 5, category = "colorItem" },
				-- questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 4,scattered = true, imageCount = 9, skip = 1 }
		-- },
		
		
		
	
		-- game5 = {
				-- gameType = "touchTheNumber",
				-- nextWaypoint = true,
				-- grayBGY = 140,
				-- question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { scale = 1, offsetX = 0, offsetY = 50, startRange = 21, endRange = 21, answerRange = 2, category = "numbers" },
				-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 1 }
		-- },
		
		-- game6 = {
				-- gameType = "question", --touch the red items
				-- nextWaypoint = false,--false
				-- grayBGY = 140,				
				-- question = { line1 = "", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -66 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { spacing = 54, vSpacing = 118, scale = 1.25, offsetX = 0, offsetY = -57, startRange = 1, endRange = 10, answerRange = 5, category = "shapeItem" },
				-- questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }
		-- },
		-- game7 = {
				
								
				-- gameType = "matching",
				-- nextWaypoint = true,
				-- grayBGY = 140,
				-- question = { line1 = "Find the matching colors!", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -66 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { spacing = 76, vSpacing = 93, scale = 1.25, offsetX = 0, offsetY = -33, startRange = 1, endRange = 8, category = "colorToColor" },
				-- matching = { mode = "memory", classic = true, layout = 5, numRandom = true, showMeMode = 2 }
		-- },
		
		-- game8 = {
				-- gameType = "puzzle",
				-- nextWaypoint = false, --false,
				-- grayBGY = 140,
				-- question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 6, endRange = 8, answerRange = 2, category = "numbers" },
				
				-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 },
				-- puzzle = { imageSet = "Num", typeSet = "Color", number = "random", minRand = 6, maxRand = 8, maskSet = 3, otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "slotAlpha", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
				
		-- },
		
		-- game9 = {
				-- gameType = "touchTheNumber",
				-- nextWaypoint = true,
				-- grayBGY = 140,
				-- question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { scale = 1, offsetX = 0, offsetY = 50, startRange = 20, endRange = 20, answerRange = 2, category = "numbers" },
				-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 1 }
		-- },
		-- game10 = {
				-- gameType = "question",
				-- nextWaypoint = false,
				-- grayBGY = 140,
				-- question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { spacing = 75, scale = .88, offsetX = 0, offsetY = -40, startRange = 1, endRange = 2, category = "item" },				
				-- questions = { questionType1 = "Which item is", questionType2 = "BiggerSmaller", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
		-- },
		
		-- game11 = {
					-- gameType = "puzzleSlots",
				-- nextWaypoint = false, --false,
				-- grayBGY = 140,
				-- question = { line1 = "", line2 = "", spacing = 20, scale = .72, offsetX = 0, offsetY = -66 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { scale = .75, offsetX = 0, offsetY = 50, startRange = 1, endRange = 6, answerRange = 2, category = "numbers" },
				
				-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 3, numChoices = 3, scattered = true, imageCount = "random", skip = 1 },
				-- puzzle = { imageSet = "Shapes", number = "random", minRand = 3, maxRand = 5, incorrectChoices = 2, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		-- },
		
		-- game12 = {
				-- gameType = "question",
				-- nextWaypoint = false,
				-- grayBGY = 140,
				-- question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { spacing = 75, scale = .88, offsetX = 0, offsetY = -40, startRange = 1, endRange = 2, category = "item" },				
				-- questions = { questionType1 = "Which item is", questionType2 = "BiggerSmaller", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
		-- },
		-- game13 = {
				-- gameType = "question", --touch the red items
				-- nextWaypoint = false,--false
				-- grayBGY = 140,				
				-- question = { line1 = "", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -66 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { spacing = 54, vSpacing = 118, scale = 1.25, offsetX = 0, offsetY = -57, startRange = 1, endRange = 8, answerRange = 5, category = "colorItem" },
				-- questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 4,scattered = true, imageCount = 9, skip = 1 }
		-- },
		-- game14 = {
				-- gameType = "touchTheNumber",
				-- nextWaypoint = true,
				-- grayBGY = 140,
				-- question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { scale = 1, offsetX = 0, offsetY = 50, startRange = 22, endRange = 22, answerRange = 2, category = "numbers" },
				-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 1 }
		-- },
		-- game15 = {
				-- gameType = "question", --touch the red items
				-- nextWaypoint = false,--false
				-- grayBGY = 140,				
				-- question = { line1 = "", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -66 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { spacing = 54, vSpacing = 118, scale = 1.25, offsetX = 0, offsetY = -57, startRange = 7, endRange = 10, answerRange = 5, category = "shapeItem" },
				-- questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 4,scattered = true, imageCount = 9, skip = 1 }
		-- },
		-- game16 = {
				-- gameType = "question", --touch the red items
				-- nextWaypoint = false,--false
				-- grayBGY = 140,				
				-- question = { line1 = "", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -66 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { spacing = 54, vSpacing = 118, scale = 1.25, offsetX = 0, offsetY = -57, startRange = 5, endRange = 8 , answerRange = 5, category = "colorItem" },
				-- questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }
		-- },
		
		-- game17 = {
				
								
				-- gameType = "matching",
				-- nextWaypoint = false,
				-- grayBGY = 140,
				-- question = { line1 = "Find the matching shapes!", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -66 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { spacing = 76, vSpacing = 93, scale = 1.25, offsetX = 0, offsetY = -33, startRange = 1, endRange = 10, category = "shapeToShape" },
				-- matching = { mode = "memory", classic = true, layout = 9, numRandom = true, showMeMode = 2 }
		-- },
		
		-- game18 = {
				-- gameType = "puzzleSlots",
				-- nextWaypoint = true, --false,
				-- grayBGY = 140,
				-- question = { line1 = "", line2 = "", spacing = 20, scale = .72, offsetX = 0, offsetY = -66 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { scale = .8, offsetX = 0, offsetY = 40, startRange = 2, endRange = 8, answerRange = 2, category = "numbers" },
				
				-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 4, scattered = true, imageCount = "random", skip = 1 },
				-- puzzle = { imageSet = "ShapesDifficult", number = "random", minRand = 2, maxRand = 8, incorrectChoices = 1, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		-- },
		-- game9 = {
				
								
				-- gameType = "matching",
				-- nextWaypoint = false,
				-- grayBGY = 140,
				-- question = { line1 = "Find the matching colors!", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -66 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { spacing = 76, vSpacing = 93, scale = 1.25, offsetX = 0, offsetY = -33, startRange = 16, endRange = 20, category = "numbersToNumbers" },
				-- matching = { mode = "showme", classic = false, layout = 5, numRandom = true, showMeMode = 2 }
		-- },
		

		-- game10 = {
				-- gameType = "question",
				-- nextWaypoint = false,
				-- grayBGY = 110,
				-- question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 1, endRange = 8, answerRange = 2, category = "numbers" },
				
				-- questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = false, imageCount = 8, skip = 1, showGreen = true, showYellow = false }
		-- },
		-- game11 = {
				-- gameType = "question",
				-- nextWaypoint = false,
				-- grayBGY = 110,
				-- question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { scale = .85, offsetX = 0, offsetY = 33, startRange = 1, endRange = 8, answerRange = 2, category = "numbers" },
				
				-- questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = false, imageCount = 8, skip = 1, showGreen = true, showYellow = false }
		-- },
		-- game9 = {
				-- gameType = "puzzleSlots",
				-- nextWaypoint = false, --false,
				-- grayBGY = 140,
				-- question = { line1 = "", line2 = "", spacing = 20, scale = .72, offsetX = 0, offsetY = -66 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { scale = .75, offsetX = 0, offsetY = 50, startRange = 1, endRange = 6, answerRange = 2, category = "numbers" },
				
				-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 3, numChoices = 3, scattered = true, imageCount = "random", skip = 1 },
				-- puzzle = { imageSet = "Shapes", number = "random", minRand = 3, maxRand = 5, incorrectChoices = 2, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		-- },
		
		-- game10 = {
				-- gameType = "puzzleSlots",
				-- nextWaypoint = false, --false,
				-- grayBGY = 140,
				-- question = { line1 = "", line2 = "", spacing = 20, scale = .72, offsetX = 0, offsetY = -66 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { scale = .8, offsetX = 0, offsetY = 40, startRange = 2, endRange = 8, answerRange = 2, category = "numbers" },
				
				-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 4, scattered = true, imageCount = "random", skip = 1 },
				-- puzzle = { imageSet = "ShapesDifficult", number = "random", minRand = 2, maxRand = 8, incorrectChoices = 1, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		-- },
		-- game11 = {
				-- gameType = "puzzleSlots",
				-- nextWaypoint = false, --false,
				-- grayBGY = 140,
				-- question = { line1 = "", line2 = "", spacing = 20, scale = .72, offsetX = 0, offsetY = -66 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 7, endRange = 10, answerRange = 2, category = "numbers" },
				
				-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 3, scattered = false, imageCount = "random", skip = 1 },
				-- puzzle = { imageSet = "Shapes", number = "random", minRand = 7, maxRand = 10, incorrectChoices = 0, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		-- },
		
		-- game9  = {
				-- gameType = "puzzle",
				-- nextWaypoint = true, --false,
				-- grayBGY = 140,
				-- question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 6, endRange = 6, answerRange = 2, category = "numbers" },
				
				-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 },
				-- puzzle = { imageSet = "Objects", typeSet = "Shapes", number = "random", minRand = 6, maxRand = 6, maskSet = 3, otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "slotAlpha", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
				
		-- },
		
	},	
		
	level8 = { --Chauncey: Touch Counting
		game1 = {
				gameType = "touchCounting",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = 50, startRange = 2, endRange = 5, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
						
		},
		game2 = {
				gameType = "touchCounting",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = 50, startRange = 3, endRange = 6, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
						
		},
		game3 = {
				gameType = "touchCounting",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = 50, startRange = 4, endRange = 7, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
						
		},
		game4 = {
				gameType = "touchCounting",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = 50, startRange = 5, endRange = 8, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
						
		},
		game5 = {
				gameType = "touchCounting",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = 50, startRange = 6, endRange = 9, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
						
		},
		game6 = {
				gameType = "touchCounting",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = 50, startRange = 7, endRange = 10, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
						
		},
	
		
	},
		
	
	level9 = { --Oleg: Colors Shapes & Counting
		game1 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 6, endRange = 11, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 6, skip = 1, showGreen = false, showYellow = false }
		},
		game2 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 6, endRange = 11, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 6, skip = 1, showGreen = false, showYellow = false }
		},
		game3 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 6, endRange = 12, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 8, skip = 1, showGreen = true, showYellow = false }
		},
		game4 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 6, endRange = 12, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 8, skip = 1, showGreen = true, showYellow = false }
		},
		
		game5 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 8, endRange = 15, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 10, skip = 1, showGreen = true, showYellow = false }
		},
		game6 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 8, endRange = 15, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 10, skip = 1, showGreen = true, showYellow = false }
		},
		game7 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 12, endRange = 20, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = false, imageCount = 12, skip = 1, showGreen = true, showYellow = false }
		},
		game8 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 12, endRange = 20, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = false, imageCount = 12, skip = 1, showGreen = true, showYellow = false }
		},
		
		game9 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 8, endRange = 15, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = false, imageCount = 14, skip = 1, showGreen = true, showYellow = false }
		},
		game10 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 8, endRange = 15, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = false, imageCount = 14, skip = 1, showGreen = true, showYellow = false }
		},
		game11 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 12, endRange = 20, answerRange = 3, category = "numbers" },
				
				questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = false, imageCount = 18, skip = 1, showGreen = true, showYellow = false }
		},
		game12 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 12, endRange = 20, answerRange = 3, category = "numbers" },
				
				questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = false, imageCount = 18, skip = 1, showGreen = true, showYellow = false }
		},
	},
		
	
	level10 = { --Webster In the Basket
		game1 = {
				gameType = "basket",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .85, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 2, endRange = 5, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, numExtraMin = -1, numExtraMax = 0, imageCount = "random", skip = 1 }
					
		},
		game2 = {
				gameType = "basket",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .85, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 3, endRange = 6, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, numExtraMin = -1, numExtraMax = 0, imageCount = "random", skip = 1 }
					
		},
		game3 = {
				gameType = "basket",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .85, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 4, endRange = 7, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, numExtraMin = -1, numExtraMax = 0, imageCount = "random", skip = 1 }
					
		},
		game4 = {
				gameType = "basket",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .85, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 5, endRange = 8, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, numExtraMin = -1, numExtraMax = 0, imageCount = "random", skip = 1 }
					
		},
		game5 = {
				gameType = "basket",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .85, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 5, endRange = 9, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, numExtraMin = -1, numExtraMax = 0, imageCount = "random", skip = 1 }
					
		},
		game6 = {
				gameType = "basket",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .85, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 6, endRange = 10, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, numExtraMin = -1, numExtraMax = 0, imageCount = "random", skip = 1 }
					
		},
	
	},
	
	
	level11 = { --Bella: How Many?
		game1 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 100,
				question = { line1 = "", line2 = "", spacing = 20, scale = 0.95, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 20, startRange = 3, endRange = 8, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
				
		},
		game2 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 100,
				question = { line1 = "", line2 = "", spacing = 20, scale = 0.95, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 20, startRange = 5, endRange = 9, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
				
		},
		game3 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 100,
				question = { line1 = "", line2 = "", spacing = 20, scale = 0.95, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 20, startRange = 8, endRange = 10, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
				
		},
		game4 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 100,
				question = { line1 = "", line2 = "", spacing = 20, scale = 0.95, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 20, startRange = 11, endRange = 13, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = false, imageCount = "random", skip = 1 }
				
		},
		game5 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 100,
				question = { line1 = "", line2 = "", spacing = 20, scale = 0.95, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 20, startRange = 13, endRange = 15, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = false, imageCount = "random", skip = 1 }
				
		},
		game6 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 100,
				question = { line1 = "", line2 = "", spacing = 20, scale = 0.95, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 20, startRange = 14, endRange = 17, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = false, imageCount = "random", skip = 1 }
				
		},
		game7 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 100,
				question = { line1 = "", line2 = "", spacing = 20, scale = 0.95, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 20, startRange = 15, endRange = 20, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = false, imageCount = "random", skip = 1 }
				
		},
		
	},
	
	level12 = { --Cordelia COunting Skills
		
		
		game1 = {
				gameType = "touchCounting",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = 50, startRange = 6, endRange = 9, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
						
		},
		
		
		game2 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 100,
				question = { line1 = "", line2 = "", spacing = 20, scale = 0.95, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 20, startRange = 6, endRange = 9, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
				
		},
		
		game3 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 6, endRange = 10, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = false, imageCount = 10, skip = 1, showGreen = true, showYellow = false }
		},
		
			
		game4 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 6, endRange = 10, answerRange = 3, category = "numbers" },
				
				questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = false, imageCount = 10, skip = 1, showGreen = true, showYellow = false }
		},
		
	
		game5 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 100,
				question = { line1 = "", line2 = "", spacing = 20, scale = 0.95, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 20, startRange = 12, endRange = 15, answerRange = 3, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = false, imageCount = "random", skip = 1 }
				
		},
		
		
		game6 = {
				gameType = "basket",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .85, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 5, endRange = 9, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, numExtraMin = -1, numExtraMax = 0, imageCount = "random", skip = 1 }
					
		},
		
		
		
		
		
		game7 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 6, endRange = 9, answerRange = 3, category = "numbers" },
				
				questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = false, imageCount = 18, skip = 1, showGreen = true, showYellow = false }
		},
		game8 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 6, endRange = 9, answerRange = 3, category = "numbers" },
				
				questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = false, imageCount = 18, skip = 1, showGreen = true, showYellow = false }
		},
		game9 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 100,
				question = { line1 = "", line2 = "", spacing = 20, scale = 0.95, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 20, startRange = 9, endRange = 13, answerRange = 3, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = false, imageCount = "random", skip = 1 }
				
		},
		game10 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 100,
				question = { line1 = "", line2 = "", spacing = 20, scale = 0.95, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 20, startRange = 15, endRange = 20, answerRange = 3, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = false, imageCount = "random", skip = 1 }
				
		},
		
		
	},
		
	
	level13 = { --Bella Numeric Order
		
		game1 = {
				
				gameType = "counting",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = -35, startRange = 10, endRange = 20, category = "numbers" },
				
				counting = { rowNum = 2, columnNum = 2, spacing = 10, startNum = "random", skip = 1, placeMatch = 2 }
		},
		-- game2 = {
				-- gameType = "question",
				-- nextWaypoint = true,
				-- grayBGY = 140,
				-- question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { spacing = 74, scale = 1.7, offsetX = 0, offsetY = -50, startRange = 1, endRange = 10, answerRange = 2, category = "numbers" },
				
				-- questions = { questionType1 = "Which number is", questionType2 = "FirstLast", numAnswers = 1, numChoices = 2, scattered = false, imageCount = 12, skip = 1 }
		-- },
		game2 = {
				gameType = "counting",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.4, offsetX = 0, offsetY = -35, startRange = 25, endRange = 30, category = "numbers" },
				
				counting = { rowNum = 4, columnNum = 1, spacing = 11, startNum = "random", skip = 1, placeMatch = 0 }
		},
		game3 = {
				gameType = "counting",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = -35, startRange = 45, endRange = 55, category = "numbers" },
				
				counting = { rowNum = 3, columnNum = 2, spacing = 11, startNum = "random", skip = 1, placeMatch = 0 }
		},
		-- game4 = {
				-- gameType = "question",
				-- nextWaypoint = false,
				-- grayBGY = 140,
				-- question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { spacing = 68, scale = 1.6, offsetX = 0, offsetY = -50, startRange = 5, endRange = 15, answerRange = 2, category = "numbers" },
				
				-- questions = { questionType1 = "Which number is", questionType2 = "FirstLast", numAnswers = 1, numChoices = 3, scattered = false, imageCount = 12, skip = 1 }
		-- },
		-- game5 = {
				-- gameType = "question",
				-- nextWaypoint = true,
				-- grayBGY = 140,
				-- question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { spacing = 68, scale = 1.6, offsetX = 0, offsetY = -50, startRange = 12, endRange = 20, answerRange = 2, category = "numbers" },
				
				-- questions = { questionType1 = "Which number is", questionType2 = "FirstLast", numAnswers = 1, numChoices = 3, scattered = false, imageCount = 12, skip = 1 }
		-- },
		game4 = {
				
				gameType = "counting",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = -35, startRange = 25, endRange = 35, category = "numbers" },
				
				counting = { rowNum = 2, columnNum = 2, spacing = 10, startNum = "random", skip = 1, placeMatch = 2 }
		},
		game5 = {
				gameType = "counting",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.4, offsetX = 0, offsetY = -35, startRange = 60, endRange = 70, category = "numbers" },
				
				counting = { rowNum = 4, columnNum = 1, spacing = 11, startNum = "random", skip = 1, placeMatch = 0 }
		},
		game6 = {
				gameType = "counting",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.4, offsetX = 0, offsetY = -35, startRange = 40, endRange = 50, category = "numbers" },
				
				counting = { rowNum = 4, columnNum = 1, spacing = 11, startNum = "random", skip = 1, placeMatch = 0 }
		},
		game7 = {
				gameType = "counting",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = -35, startRange = 80, endRange = 100, category = "numbers" },
				
				counting = { rowNum = 4, columnNum = 2, spacing = 11, startNum = "random", skip = 1, placeMatch = 0 }
		},
		-- game7 = {
				-- gameType = "question",
				-- nextWaypoint = true,
				-- grayBGY = 140,
				-- question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { spacing = 60, scale = 1.4, offsetX = 0, offsetY = -50, startRange = 12, endRange = 20, answerRange = 3, category = "numbers" },
				
				-- questions = { questionType1 = "Which number is", questionType2 = "FirstLast", numAnswers = 1, numChoices = 4, scattered = false, imageCount = 12, skip = 1 }
		-- },
		
	},
		
	
	level14 = { -- Chloe What Comes Next
	
		-- game2 = {
				-- gameType = "puzzleSlots",
				-- nextWaypoint = true, --false,
				-- grayBGY = 140,
				-- question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 8, endRange = 17, answerRange = 2, category = "numbers" },
				
				-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 3, scattered = true, imageCount = "random", skip = 1, skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
				-- puzzle = { imageSet = "Cards", number = "random", minRand = 8, maxRand = 20, incorrectChoices = 2, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		-- },
		-- game1 = {
				-- gameType = "puzzleSlots",
				-- nextWaypoint = true, --false,
				-- grayBGY = 140,
				-- question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 7, answerRange = 1, category = "numbers" },
				
				-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 4, scattered = true, imageCount = "random", skip = 1, skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
				-- puzzle = { imageSet = "Cards", number = "random", minRand = 1, maxRand = 7, incorrectChoices = 3, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		

				
		-- },
		game1 = {
				gameType = "puzzleSlots",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 8, endRange = 11, answerRange = 1, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 4, scattered = true, imageCount = "random", skip = 1, skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
				puzzle = { imageSet = "Cards", number = "random", minRand = 8, maxRand = 11, incorrectChoices = 3, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		

				
		},
		game2 = {
				gameType = "puzzleSlots",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 10, endRange = 14, answerRange = 1, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 4, scattered = true, imageCount = "random", skip = 1, skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
				puzzle = { imageSet = "Cards", number = "random", minRand = 10, maxRand = 14, incorrectChoices = 3, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		

				
		},
		
		game3 = {
				gameType = "puzzleSlots",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.25, offsetX = 0, offsetY = 60, startRange = 21, endRange = 30, answerRange = 3, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 4, scattered = true, imageCount = "random", skip = 1, skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
				puzzle = { imageSet = "CardsClassic", number = "random", minRand = 21, maxRand = 30, incorrectChoices = 3, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		},
		game4 = {
				gameType = "puzzleSlots",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.25, offsetX = 0, offsetY = 60, startRange = 28, endRange = 42, answerRange = 3, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 4, scattered = true, imageCount = "random", skip = 1, skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
				puzzle = { imageSet = "CardsClassic", number = "random", minRand = 28, maxRand = 42, incorrectChoices = 3, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		},
		game5 = {
				gameType = "puzzleSlots",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.25, offsetX = 0, offsetY = 60, startRange = 38, endRange = 62, answerRange = 3, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 4, scattered = true, imageCount = "random", skip = 1, skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
				puzzle = { imageSet = "CardsClassic", number = "random", minRand = 38, maxRand = 62, incorrectChoices = 3, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		},
		game6 = {
				gameType = "puzzleSlots",
				nextWaypoint = false, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.25, offsetX = 0, offsetY = 60, startRange = 40, endRange = 80, answerRange = 3, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 4, scattered = true, imageCount = "random", skip = 1, skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
				puzzle = { imageSet = "CardsClassic", number = "random", minRand = 40, maxRand = 80, incorrectChoices = 3, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		},
		game7 = {
				gameType = "puzzleSlots",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.25, offsetX = 0, offsetY = 60, startRange = 60, endRange = 94 , answerRange = 3, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 4, scattered = true, imageCount = "random", skip = 1, skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
				puzzle = { imageSet = "CardsClassic", number = "random", minRand = 60, maxRand = 94, incorrectChoices = 3, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		},
		-- game1 = {
				-- gameType = "sequence",
				-- nextWaypoint = false,
				-- grayBGY = 110,
				-- question = { line1 = "What comes next?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { spacing = 38.5, scale = .85, offsetX = 0, offsetY = 33, startRange = 1, endRange = 9, answerRange = 2, category = "numbers" },
				
				-- sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 80, blankLocation = 4, placeMatch = 0, skip = 1, startNum = "random", patternLength = 1, order = "ascending", numChoices = 3 }
		-- },
		-- game2 = {
				-- gameType = "sequence",
				-- nextWaypoint = true,
				-- grayBGY = 110,
				-- question = { line1 = "What comes next?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { spacing = 38.5, scale = .85, offsetX = 0, offsetY = 33, startRange = 4, endRange = 9, answerRange = 2, category = "numbers" },
				
				-- sequence = { numItems = 5, itemsScale = .875, itemsSpacing = 80, blankLocation = 5, placeMatch = 0, skip = 1, startNum = "random", patternLength = 1, order = "ascending", numChoices = 3 }
		-- },
		-- game3 = {
				-- gameType = "sequence",
				-- nextWaypoint = false,
				-- grayBGY = 110,
				-- question = { line1 = "What comes next?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { spacing = 38.5, scale = .85, offsetX = 0, offsetY = 33, startRange = 10, endRange = 15, answerRange = 2, category = "numbers" },
				
				-- sequence = { numItems = 5, itemsScale = .875, itemsSpacing = 80, blankLocation = 5, placeMatch = 0, skip = 1, startNum = "random", patternLength = 1, order = "ascending", numChoices = 4 }
		-- },
		-- game4 = {
				-- gameType = "sequence",
				-- nextWaypoint = true,
				-- grayBGY = 110,
				-- question = { line1 = "What comes next?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { spacing = 38.5, scale = .85, offsetX = 0, offsetY = 33, startRange = 13, endRange = 20, answerRange = 2, category = "numbers" },
				
				-- sequence = { numItems = 5, itemsScale = .875, itemsSpacing = 80, blankLocation = 5, placeMatch = 0, skip = 1, startNum = "random", patternLength = 1, order = "ascending", numChoices = 3 }
		-- },
		-- game5 = {
				-- gameType = "sequence",
				-- nextWaypoint = true,
				-- grayBGY = 110,
				-- question = { line1 = "What comes next?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { spacing = 38.5, scale = .85, offsetX = 0, offsetY = 33, startRange = 25, endRange = 30, answerRange = 2, category = "numbers" },
				
				-- sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 80, blankLocation = 4, placeMatch = 0, skip = 1, startNum = "random", patternLength = 1, order = "ascending", numChoices = 3 }
		-- },
		
		-- game6 = {
				-- gameType = "sequence",
				-- nextWaypoint = true,
				-- grayBGY = 110,
				-- question = { line1 = "What comes next?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { spacing = 38.5, scale = .85, offsetX = 0, offsetY = 33, startRange = 20, endRange = 29, answerRange = 2, category = "numbers" },
				
				-- sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 80, blankLocation = 4, placeMatch = 0, skip = 1, startNum = "random", patternLength = 1, order = "ascending", numChoices = 4 }
		-- },
		-- game7 = {
				-- gameType = "sequence",
				-- nextWaypoint = false,
				-- grayBGY = 110,
				-- question = { line1 = "What comes next?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { spacing = 38.5, scale = .85, offsetX = 0, offsetY = 33, startRange = 25, endRange = 35, answerRange = 2, category = "numbers" },
				
				-- sequence = { numItems = 5, itemsScale = .875, itemsSpacing = 80, blankLocation = 5, placeMatch = 0, skip = 1, startNum = "random", patternLength = 1, order = "ascending", numChoices = 3 }
		-- },
		-- game8 = {
				-- gameType = "sequence",
				-- nextWaypoint = true,
				-- grayBGY = 110,
				-- question = { line1 = "What comes next?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { spacing = 38.5, scale = .85, offsetX = 0, offsetY = 33, startRange = 35, endRange = 40, answerRange = 2, category = "numbers" },
				
				-- sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 90, blankLocation = 4, placeMatch = 0, skip = 1, startNum = "random", patternLength = 1, order = "ascending", numChoices = 4 }
		-- },
		-- game9 = {
				-- gameType = "sequence",
				-- nextWaypoint = true,
				-- grayBGY = 110,
				-- question = { line1 = "What comes next?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { spacing = 38.5, scale = .85, offsetX = 0, offsetY = 33, startRange = 40, endRange = 50, answerRange = 2, category = "numbers" },
				-- sequence = { numItems = 5, itemsScale = .875, itemsSpacing = 90, blankLocation = 5, placeMatch = 0, skip = 1, startNum = "random", patternLength = 1, order = "ascending", numChoices = 3 }
		-- }
		
	},
		
	
	
	
	
	
	level15 = { --Percival Puppy Build the Number
	
		game1 = {
				gameType = "puzzleSlots",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 12, endRange = 20, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 1 },
				puzzle = { imageSet = "Num", number = "random", minRand = 12, maxRand = 20, incorrectChoices = 2, maskSet = 3, otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "slotAlpha", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
				
		},
		game2 = {
				gameType = "puzzleSlots",
				nextWaypoint = false, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 32, endRange = 60, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 1 },
				puzzle = { imageSet = "NumDifficult", number = "random", minRand = 32, maxRand = 60, incorrectChoices = 2, maskSet = 3, otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "slotAlpha", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
				
		},
		game3 = {
				gameType = "puzzleSlots",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -36 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.4, offsetX = 0, offsetY = 50, startRange = 22, endRange = 30, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 1, skipPattern = "", startNum = "", order = "ascending" },
				puzzle = { imageSet = "CardsNum", number = "random", minRand = 22, maxRand = 30, incorrectChoices = 2, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
				
		},
		game4 = {
				gameType = "puzzleSlots",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.4, offsetX = 0, offsetY = 50, startRange = 63, endRange = 99, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 1 },
				puzzle = { imageSet = "CardsNum", number = "random", minRand = 63, maxRand = 99, incorrectChoices = 2, maskSet = 3, otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "slotAlpha", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
				
		},
		game5 = {
				
				gameType = "puzzleSlots",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.4, offsetX = 0, offsetY = 50, startRange = 1, endRange = 9, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 },
				puzzle = { imageSet = "CardsNumDifficult", number = "random", minRand = 32, maxRand = 60, incorrectChoices = 1, maskSet = 3, otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "slotAlpha", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		
		},
		game6 = {
				
				gameType = "puzzleSlots",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -36 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.4, offsetX = 0, offsetY = 50, startRange = 77, endRange = 99, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1, skipPattern = "", startNum = "", order = "ascending" },
				puzzle = { imageSet = "CardsNumDifficult", number = "random", minRand = 77, maxRand = 99, incorrectChoices = 2, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		
		},
		game7 = {
				
				gameType = "puzzleSlots",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -36 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.4, offsetX = 0, offsetY = 50, startRange = 62, endRange = 75, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 1, skipPattern = "", startNum = "", order = "ascending" },
				puzzle = { imageSet = "CardsNumDifficult", number = "random", minRand = 62, maxRand = 75, incorrectChoices = 3, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		
		},
		
		
	},
		
	
	
	level16 = { -- Percival First and Last
		game1 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 60, scale = 1.4, offsetX = 0, offsetY = -50, startRange = 5, endRange = 12, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "Which number is", questionType2 = "FirstLast", numAnswers = 1, numChoices = 2, scattered = false, imageCount = 12, skip = 1 }
		},
		game2 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 60, scale = 1.4, offsetX = 0, offsetY = -50, startRange = 17, endRange = 23, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "Which number is", questionType2 = "FirstLast", numAnswers = 1, numChoices = 3, scattered = false, imageCount = 12, skip = 1 }
		},
		game3 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 60, scale = 1.4, offsetX = 0, offsetY = -50, startRange = 12, endRange = 16, answerRange = 3, category = "numbers" },
				
				questions = { questionType1 = "Which number is", questionType2 = "FirstLast", numAnswers = 1, numChoices = 4, scattered = false, imageCount = 12, skip = 1 }
		},
		game4 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 60, scale = 1.4, offsetX = 0, offsetY = -50, startRange = 24, endRange = 39, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "Which number is", questionType2 = "FirstLast", numAnswers = 1, numChoices = 3, scattered = false, imageCount = 12, skip = 1 }
		},
		game5 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 60, scale = 1.4, offsetX = 0, offsetY = -50, startRange = 51, endRange = 70, answerRange = 3, category = "numbers" },
				
				questions = { questionType1 = "Which number is", questionType2 = "FirstLast", numAnswers = 1, numChoices = 4, scattered = false, imageCount = 12, skip = 1 }
		},
		game6 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 49, scale = 1.125, offsetX = 0, offsetY = -50, startRange = 40, endRange = 50, answerRange = 4, category = "numbers" },
				
				questions = { questionType1 = "Which number is", questionType2 = "FirstLast", numAnswers = 1, numChoices = 5, scattered = false, imageCount = 12, skip = 1 }
		},
		game7 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 60, scale = 1.4, offsetX = 0, offsetY = -50, startRange = 75, endRange = 96, answerRange = 3, category = "numbers" },
				
				questions = { questionType1 = "Which number is", questionType2 = "FirstLast", numAnswers = 1, numChoices = 4, scattered = false, imageCount = 12, skip = 1 }
		},
		game8 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 49, scale = 1.125, offsetX = 0, offsetY = -50, startRange = 51, endRange = 74, answerRange = 4, category = "numbers" },
				
				questions = { questionType1 = "Which number is", questionType2 = "FirstLast", numAnswers = 1, numChoices = 5, scattered = false, imageCount = 12, skip = 1 }
		},
		game9 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 49, scale = 1.125, offsetX = 0, offsetY = -50, startRange = 80, endRange = 96, answerRange = 4, category = "numbers" },
				
				questions = { questionType1 = "Which number is", questionType2 = "FirstLast", numAnswers = 1, numChoices = 5, scattered = false, imageCount = 12, skip = 1 }
		},
		
	},	
	
	
	level17 = { -- Oliver Matching Fun
		game1 = {
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Find the matching pictures!", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -69 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.25, offsetX = 0, offsetY = -33, startRange = 8, endRange = 10, category = "item" },
				
				matching = { mode = "memory", classic = true, layout = 1, numRandom = true }
		},
		game2 = {
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Find the matching pictures!", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -69 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.46, offsetX = 0, offsetY = -57, startRange = 1, endRange = 2, category = "item" },
				
				matching = { mode = "memory", classic = true, layout = 3, numRandom = true }
		},
		game3 = {
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Find the matching pictures!", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -69 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.25, offsetX = 0, offsetY = -33, startRange = 18, endRange = 21, category = "item" },
				
				matching = { mode = "memory", classic = true, layout = 5, numRandom = true }
		},
		game4 = {
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Find the matching pictures!", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -69 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 0.8, offsetX = 0, offsetY = -34, startRange = 13, endRange = 16, category = "item" },
				
				matching = { mode = "memory", classic = true, layout = 6, numRandom = true }
		},
		game5 = {
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Find the matching pictures!", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -69 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.46, offsetX = 0, offsetY = -57, startRange = 11, endRange = 12, category = "item" },
				
				matching = { mode = "memory", classic = true, layout = 3, numRandom = true }
		},
		game6 = {
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Find the matching pictures!", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -69 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.25, offsetX = 0, offsetY = -33, startRange = 3, endRange = 7, category = "item" },
				
				matching = { mode = "memory", classic = true, layout = 9, numRandom = true }
		},
		
	},
	
	
	
	level18 = { -- Ralphie Review 3
		game1 = {
				gameType = "counting",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = -35, startRange = 9, endRange = 35, category = "numbers" },
				
				counting = { rowNum = 3, columnNum = 2, spacing = 11, startNum = "random", skip = 1, placeMatch = 0 }
		},
		-- game2 = {
				-- gameType = "puzzleSlots",
				-- nextWaypoint = false, --false,
				-- grayBGY = 140,
				-- question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { scale = 1.25, offsetX = 0, offsetY = 60, startRange = 40, endRange = 60 , answerRange = 3, category = "numbers" },
				
				-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 4, scattered = true, imageCount = "random", skip = 1, skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
				-- puzzle = { imageSet = "CardsClassic", number = "random", minRand = 9, maxRand = 99, incorrectChoices = 2, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		-- },
		game2 = {
				gameType = "puzzleSlots",
				nextWaypoint = false, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 10, endRange = 14, answerRange = 1, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 4, scattered = true, imageCount = "random", skip = 1, skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
				puzzle = { imageSet = "Cards", number = "random", minRand = 10, maxRand = 14, incorrectChoices = 3, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		

				
		},
		game3 = {
				gameType = "puzzleSlots",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -36 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.4, offsetX = 0, offsetY = 50, startRange = 70, endRange = 99, answerRange = 1, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1, skipPattern = "", startNum = "", order = "ascending" },
				puzzle = { imageSet = "CardsNumDifficult", number = "random", minRand = 9, maxRand = 45, incorrectChoices = 2, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
				
		},
		game4 = {
				gameType = "counting",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = -35, startRange = 9, endRange = 45, category = "numbers" },
				
				counting = { rowNum = 3, columnNum = 2, spacing = 11, startNum = "random", skip = 1, placeMatch = 0 }
		},
		game5 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 60, scale = 1.4, offsetX = 0, offsetY = -50, startRange = 50, endRange = 70, answerRange = 3, category = "numbers" },
				
				questions = { questionType1 = "Which number is", questionType2 = "FirstLast", numAnswers = 1, numChoices = 4, scattered = false, imageCount = 12, skip = 1 }
		},
		game6 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 60, scale = 1.4, offsetX = 0, offsetY = -50, startRange = 80, endRange = 99, answerRange = 3, category = "numbers" },
				
				questions = { questionType1 = "Which number is", questionType2 = "FirstLast", numAnswers = 1, numChoices = 4, scattered = false, imageCount = 12, skip = 1 }
		},
		game7 = {
				gameType = "puzzleSlots",
				nextWaypoint = false, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.25, offsetX = 0, offsetY = 60, startRange = 50, endRange = 60 , answerRange = 3, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 3, scattered = true, imageCount = "random", skip = 1, skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
				puzzle = { imageSet = "CardsClassic", number = "random", minRand = 50, maxRand = 60, incorrectChoices = 2, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		},
		game8 = {
				gameType = "counting",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = -35, startRange = 9, endRange = 45, category = "numbers" },
				
				counting = { rowNum = 4, columnNum = 2, spacing = 11, startNum = "random", skip = 1, placeMatch = 0 }
		},
		game9 = {
				gameType = "puzzleSlots",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -36 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.4, offsetX = 0, offsetY = 50, startRange = 60, endRange = 75, answerRange = 1, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 3, scattered = true, imageCount = "random", skip = 1, skipPattern = "", startNum = "", order = "ascending" },
				puzzle = { imageSet = "CardsNumDifficult", number = "random", minRand = 60, maxRand = 75, incorrectChoices = 3, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
				
		},
		-- game10 = {
				-- gameType = "puzzleSlots",
				-- nextWaypoint = false, --false,
				-- grayBGY = 140,
				-- question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { scale = 1.25, offsetX = 0, offsetY = 60, startRange = 25, endRange = 45 , answerRange = 3, category = "numbers" },
				
				-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 4, scattered = true, imageCount = "random", skip = 1, skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
				-- puzzle = { imageSet = "CardsClassic", number = "random", minRand = 25, maxRand = 45, incorrectChoices = 2, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		-- },
		-- game10 = {
				-- gameType = "counting",
				-- nextWaypoint = true,
				-- grayBGY = 140,
				-- question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { scale = .95, offsetX = 0, offsetY = -35, startRange = 80, endRange = 99, category = "numbers" },
				
				-- counting = { rowNum = 4, columnNum = 2, spacing = 11, startNum = "random", skip = 1, placeMatch = 0 }
		-- },
	
		-- game1 = {
				-- gameType = "touchTheNumber",
				-- nextWaypoint = false,
				-- grayBGY = 140,
				-- question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { scale = 1, offsetX = 0, offsetY = 50, startRange = 23, endRange = 23, answerRange = 2, category = "numbers" },
				-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 1 }
				-- },
		-- game2 = {
				-- gameType = "puzzle",
				-- nextWaypoint = true, --false,
				-- grayBGY = 140,
				-- question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 6, endRange = 10, answerRange = 2, category = "numbers" },
				
				-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 },
				-- puzzle = { imageSet = "Num", typeSet = "Color", number = "random", minRand = 6, maxRand = 10, maskSet = 3, otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "slotAlpha", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
				
		-- },
		-- game3 = {
				-- gameType = "question",
				-- nextWaypoint = false,
				-- grayBGY = 110,
				-- question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 12, endRange = 20, answerRange = 2, category = "numbers" },
				
				-- questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = false, imageCount = 18, skip = 1, showGreen = true, showYellow = false }
		-- },
		-- game4 = {
				-- gameType = "question",
				-- nextWaypoint = true,
				-- grayBGY = 110,
				-- question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 12, endRange = 20, answerRange = 2, category = "numbers" },
				
				-- questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = false, imageCount = 18, skip = 1, showGreen = true, showYellow = false }
		-- },
		-- game5 = {
				-- gameType = "question",
				-- nextWaypoint = false,
				-- grayBGY = 140,
				-- question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { spacing = 62, scale = .74, offsetX = 0, offsetY = -34, startRange = 1, endRange = 2, category = "item" },				
				-- questions = { questionType1 = "Which item is", questionType2 = "BiggerSmaller", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 1 }
		-- },
		-- game6 = {
				-- gameType = "counting",
				-- nextWaypoint = true,
				-- grayBGY = 140,
				-- question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { scale = .95, offsetX = 0, offsetY = -35, startRange = 5, endRange = 20, category = "numbers" },
				
				-- counting = { rowNum = 3, columnNum = 2, spacing = 11, startNum = "random", skip = 1, placeMatch = 0 }
		-- },
		-- game7 = {
				
								
				-- gameType = "matching",
				-- nextWaypoint = false,
				-- grayBGY = 140,
				-- question = { line1 = "Find the matching colors!", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -66 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { spacing = 76, vSpacing = 93, scale = 1.25, offsetX = 0, offsetY = -33, startRange = 5, endRange = 20, category = "numbersToNumbers" },
				-- matching = { mode = "showme", classic = false, layout = 9, numRandom = true, showMeMode = 2 }
		-- },
		-- game8 = {
				-- gameType = "basket",
				-- nextWaypoint = false,
				-- grayBGY = 140,
				-- question = { line1 = "", line2 = "", spacing = 20, scale = .85, offsetX = 0, offsetY = -65 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 2, endRange = 6, answerRange = 2, category = "numbers" },
				
				-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, numExtraMin = -1, numExtraMax = 0, imageCount = "random", skip = 1 }
					
		-- },
		-- game9 = {
				
				-- gameType = "puzzleSlots",
				-- nextWaypoint = true, --false,
				-- grayBGY = 140,
				-- question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -36 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { scale = 1.4, offsetX = 0, offsetY = 50, startRange = 0, endRange = 1, answerRange = 2, category = "numbers" },
				
				-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 3, scattered = true, imageCount = "random", skip = 1, skipPattern = "", startNum = "", order = "ascending" },
				-- puzzle = { imageSet = "CardsNumDifficult", number = "random", minRand = 12, maxRand = 20, incorrectChoices = 2, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		
		-- },
		-- game10 = {
				-- gameType = "question", --touch the red items
				-- nextWaypoint = false,--false
				-- grayBGY = 140,				
				-- question = { line1 = "", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -66 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { spacing = 49, vSpacing = 118, scale = 1.15, offsetX = 0, offsetY = -61, startRange = 6, endRange = 10, answerRange = 5, category = "shape" },
				-- questions = { questionType1 = "Which one is a", questionType2 = "random", numAnswers = 1, numChoices = 5, scattered = true, imageCount = 9, skip = 1 }
		-- },
		-- game11 = {
				-- gameType = "touchCounting",
				-- nextWaypoint = false,
				-- grayBGY = 140,
				-- question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -65 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { scale = 1, offsetX = 0, offsetY = 50, startRange = 5, endRange = 9, answerRange = 2, category = "numbers" },
				
				-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
						
		-- },
		-- game12 = {
				-- gameType = "puzzleSlots",
				-- nextWaypoint = false, --false,
				-- grayBGY = 140,
				-- question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 8, endRange = 17, answerRange = 2, category = "numbers" },
				
				-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 3, scattered = true, imageCount = "random", skip = 1, skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
				-- puzzle = { imageSet = "Cards", number = "random", minRand = 8, maxRand = 20, incorrectChoices = 2, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		

				
		-- },
		-- game13 = {
				-- gameType = "question",
				-- nextWaypoint = true,
				-- grayBGY = 100,
				-- question = { line1 = "", line2 = "", spacing = 20, scale = 0.95, offsetX = 0, offsetY = -66 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { scale = .95, offsetX = 0, offsetY = 20, startRange = 15, endRange = 20, answerRange = 2, category = "numbers" },
				
				-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = false, imageCount = "random", skip = 1 }
				
		-- },
		-- game14 = {
				-- gameType = "question",
				-- nextWaypoint = false,
				-- grayBGY = 140,
				-- question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { spacing = 60, scale = 1.4, offsetX = 0, offsetY = -50, startRange = 6, endRange = 20, answerRange = 2, category = "numbers" },
				
				-- questions = { questionType1 = "Which number is", questionType2 = "FirstLast", numAnswers = 1, numChoices = 4, scattered = false, imageCount = 12, skip = 1 }
		-- },
		-- game15 = {
				
								
				-- gameType = "matching",
				-- nextWaypoint = false,
				-- grayBGY = 140,
				-- question = { line1 = "Find the matching shapes!", line2 = "", spacing = 20, scale = .8, offsetX = 0, offsetY = -66 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { spacing = 76, vSpacing = 93, scale = 1.25, offsetX = 0, offsetY = -33, startRange = 5, endRange = 10, category = "shapeToShape" },
				-- matching = { mode = "showme", classic = false, layout = 5, numRandom = true, showMeMode = 2 }
		-- },
		-- game16 = {
				-- gameType = "puzzleSlots",
				-- nextWaypoint = true, --false,
				-- grayBGY = 140,
				-- question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { scale = 1.25, offsetX = 0, offsetY = 60, startRange = 60, endRange = 94 , answerRange = 3, category = "numbers" },
				
				-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 4, scattered = true, imageCount = "random", skip = 1, skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
				-- puzzle = { imageSet = "CardsClassic", number = "random", minRand = 60, maxRand = 94, incorrectChoices = 3, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		-- },
	},	
	
	level19 = { --Dudley Pop It
		game1 = {
				gameType = "bubbleCounting",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, groupStartRange = 2, groupEndRange = 2, answerRange = 3, category = "numbers" },
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
		},
		game2 = {
				gameType = "bubbleCounting",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = 50, startRange = 3, endRange = 7, groupStartRange = 3, groupEndRange = 3, answerRange = 3, category = "numbers" },
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
		},
		game3 = {
				gameType = "bubbleCounting",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = 50, startRange = 1, endRange = 10, groupStartRange = 3, groupEndRange = 3, answerRange = 3, category = "numbers" },
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
		},
		game4 = {
				gameType = "bubbleCounting",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = 50, startRange = 1, endRange = 10, groupStartRange = 3, groupEndRange = 3, answerRange = 3, category = "numbers" },
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
		},
		game5 = {
				gameType = "bubbleCounting",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = 50, startRange = 1, endRange = 10, groupStartRange = 3, groupEndRange = 3, answerRange = 3, category = "numbers" },
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
		},
		game6 = {
				gameType = "bubbleCounting",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = 50, startRange = 1, endRange = 10, groupStartRange = 3, groupEndRange = 3, answerRange = 3, category = "numbers" },
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
		},
		
	},
		
		
	level20 = { --Sunshine Bee: Matching numbers to groups
		game1 = {
				
								
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Touch a number, then a card", line2 = "with the same number of items.", spacing = 20, scale = .8, offsetX = 0, offsetY = -69 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 76, vSpacing = 93, scale = 1.25, offsetX = 0, offsetY = -13, startRange = 1, endRange = 10, category = "numbersToGroups" },
				matching = { mode = "showme", classic = true, layout = 1, numRandom = true, showMeMode = 2 }
		},
		game2 = {
				
								
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Touch a number, then a card", line2 = "with the same number of items.", spacing = 20, scale = .8, offsetX = 0, offsetY = -69 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 76, vSpacing = 93, scale = 1.46, offsetX = 0, offsetY = -47, startRange = 1, endRange = 10, category = "numbersToGroups" },
				matching = { mode = "showme", classic = true, layout = 3, numRandom = true, showMeMode = 2 }
		},
		game3 = {
				
								
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Touch a number, then a card", line2 = "with the same number of items.", spacing = 20, scale = .8, offsetX = 0, offsetY = -69 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 76, vSpacing = 93, scale = 1.15, offsetX = 0, offsetY = -20, startRange = 1, endRange = 10, category = "numbersToGroups" },
				matching = { mode = "showme", classic = true, layout = 5, numRandom = true, showMeMode = 2 }
		},
		game4 = {
				
								
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Touch a number, then a card", line2 = "with the same number of items.", spacing = 20, scale = .8, offsetX = 0, offsetY = -69 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 76, vSpacing = 93, scale = 0.8, offsetX = 0, offsetY = -19, startRange = 1, endRange = 10, category = "numbersToGroups" },
				matching = { mode = "showme", classic = true, layout = 6, numRandom = true, showMeMode = 2 }
		},
		game5 = {
				
								
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Touch a number, then a card", line2 = "with the same number of items.", spacing = 20, scale = .8, offsetX = 0, offsetY = -69 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 76, vSpacing = 93, scale = 1.46, offsetX = 0, offsetY = -47, startRange = 1, endRange = 10, category = "numbersToGroups" },
				matching = { mode = "showme", classic = true, layout = 3, numRandom = true, showMeMode = 2 }
		},
		game6 = {
				
								
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Touch a number, then a card", line2 = "with the same number of items.", spacing = 20, scale = .8, offsetX = 0, offsetY = -69 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 76, vSpacing = 93, scale = 1.15, offsetX = 0, offsetY = -20, startRange = 1, endRange = 10, category = "numbersToGroups" },
				matching = { mode = "showme", classic = true, layout = 1, numRandom = true, showMeMode = 2 }
		},
	
	},
		
		
	level21 = { --Chauncey Spot the Difference
		game1 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "Which one is different?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .94, offsetX = 0, offsetY = -30, startRange = 1, endRange = 3, category = "random" },
				questions = { questionType1 = "Which one is different", questionType2 = "hidden object", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 1, skip = 1 }
		},
		game2 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "Which one is different?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .94, offsetX = 0, offsetY = -30, startRange = 1, endRange = 3, category = "random" },
				questions = { questionType1 = "Which one is different", questionType2 = "hidden object", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 1, skip = 1 }
		},
		game3 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "Which one is different?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .94, offsetX = 0, offsetY = -30, startRange = 1, endRange = 3, category = "random" },
				questions = { questionType1 = "Which one is different", questionType2 = "hidden object", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 1, skip = 1 }
		},
		game4 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "Which one is different?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .94, offsetX = 0, offsetY = -30, startRange = 1, endRange = 3, category = "random" },
				questions = { questionType1 = "Which one is different", questionType2 = "hidden object", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 1, skip = 1 }
		},
		game5 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "Which one is different?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .94, offsetX = 0, offsetY = -30, startRange = 1, endRange = 3, category = "random" },
				questions = { questionType1 = "Which one is different", questionType2 = "hidden object", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 1, skip = 1 }
		},
		game6 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "Which one is different?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .94, offsetX = 0, offsetY = -30, startRange = 1, endRange = 3, category = "random" },
				questions = { questionType1 = "Which one is different", questionType2 = "hidden object", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 1, skip = 1 }
		},
		
	},
	
	level22 = { --Pete: Greatest and Least
		game1 = {
				
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 74, scale = 1.7, offsetX = 0, offsetY = -32, startRange = 5, endRange = 12, answerRange = 2, category = "numbers" },
				questions = { questionType1 = "Which number is", questionType2 = "GreaterLess", numAnswers = 1, numChoices = 2, scattered = true, imageCount = "random", skip = 1 }
		
				
		},
		game2 = {
				
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 74, scale = 1.7, offsetX = 0, offsetY = -32, startRange = 17, endRange = 23, answerRange = 2, category = "numbers" },
				questions = { questionType1 = "Which number is", questionType2 = "GreaterLess", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
		
				
		},
		game3 = {
				
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 60, scale = 1.375, offsetX = 0, offsetY = -32, startRange = 12, endRange = 16, answerRange = 3, category = "numbers" },
				questions = { questionType1 = "Which number is", questionType2 = "GreaterLess", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 1 }
		
				
		},
		game4 = {
				
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 74, scale = 1.7, offsetX = 0, offsetY = -32, startRange = 24, endRange = 39, answerRange = 2, category = "numbers" },
				questions = { questionType1 = "Which number is", questionType2 = "GreaterLess", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
		
				
		},
		game5 = {
				
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 60, scale = 1.375, offsetX = 0, offsetY = -40, startRange = 51, endRange = 70, answerRange = 3, category = "numbers" },
				questions = { questionType1 = "Which number is", questionType2 = "GreaterLess", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 1 }
		
				
		},
		game6 = {
				
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 48.5, scale = 1.1, offsetX = 0, offsetY = -40, startRange = 40, endRange = 99, answerRange = 4, category = "numbers" },
				questions = { questionType1 = "Which number is", questionType2 = "GreaterLess", numAnswers = 1, numChoices = 5, scattered = true, imageCount = "random", skip = 1 }
		
				
		},
		game7 = {
				
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 60, scale = 1.375, offsetX = 0, offsetY = -40, startRange = 75, endRange = 99, answerRange = 3, category = "numbers" },
				questions = { questionType1 = "Which number is", questionType2 = "GreaterLess", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 1 }
		
				
		},
		game8 = {
				
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 48.5, scale = 1.1, offsetX = 0, offsetY = -40, startRange = 40, endRange = 99, answerRange = 4, category = "numbers" },
				questions = { questionType1 = "Which number is", questionType2 = "GreaterLess", numAnswers = 1, numChoices = 5, scattered = true, imageCount = "random", skip = 1 }
		
				
		},
		game9 = {
				
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 48.5, scale = 1.1, offsetX = 0, offsetY = -40, startRange = 40, endRange = 99, answerRange = 4, category = "numbers" },
				questions = { questionType1 = "Which number is", questionType2 = "GreaterLess", numAnswers = 1, numChoices = 5, scattered = true, imageCount = "random", skip = 1 }
		
				
		},
		
	},	
		
	
	level23 = { --Oliver Matching Groups
		game1 = {
				
								
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Match picture cards that have", line2 = "the same number of items.", spacing = 20, scale = .8, offsetX = 0, offsetY = -69 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 60, vSpacing = 93, scale = 1.25, offsetX = 0, offsetY = -13, startRange = 1, endRange = 10, category = "groupsToGroups" },
				matching = { mode = "showme", classic = true, layout = 1, numRandom = true, showMeMode = 2 }
		},
		game2 = {
				
								
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Match picture cards that have", line2 = "the same number of items.", spacing = 20, scale = .8, offsetX = 0, offsetY = -69 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 76, vSpacing = 93, scale = 1.46, offsetX = 0, offsetY = -54, startRange = 1, endRange = 10, category = "groupsToGroups" },
				matching = { mode = "showme", classic = true, layout = 3, numRandom = true, showMeMode = 2 }
		},
		game3 = {
				
								
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
								question = { line1 = "Match picture cards that have", line2 = "the same number of items.", spacing = 20, scale = .8, offsetX = 0, offsetY = -69 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 76, vSpacing = 93, scale = 1.25, offsetX = 0, offsetY = -13, startRange = 1, endRange = 10, category = "groupsToGroups" },
				matching = { mode = "showme", classic = true, layout = 5, numRandom = true, showMeMode = 2 }
		},
		game4 = {
				
								
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
								question = { line1 = "Match picture cards that have", line2 = "the same number of items.", spacing = 20, scale = .8, offsetX = 0, offsetY = -69 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 76, vSpacing = 93, scale = 0.8, offsetX = 0, offsetY = -19, startRange = 1, endRange = 10, category = "groupsToGroups" },
				matching = { mode = "showme", classic = true, layout = 6, numRandom = true, showMeMode = 2 }
		},
		game5 = {
				
								
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
								question = { line1 = "Match picture cards that have", line2 = "the same number of items.", spacing = 20, scale = .8, offsetX = 0, offsetY = -69 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 76, vSpacing = 93, scale = 1.46, offsetX = 0, offsetY = -54, startRange = 1, endRange = 10, category = "groupsToGroups" },
				matching = { mode = "showme", classic = true, layout = 3, numRandom = true, showMeMode = 2 }
		},
		game6 = {
				
								
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
								question = { line1 = "Match picture cards that have", line2 = "the same number of items.", spacing = 20, scale = .8, offsetX = 0, offsetY = -69 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 76, vSpacing = 93, scale = 1.25, offsetX = 0, offsetY = -13, startRange = 1, endRange = 10, category = "groupsToGroups" },
				matching = { mode = "showme", classic = true, layout = 9, numRandom = true, showMeMode = 2 }
		},
	
	},
	
	level24 = { --Sunshine: Review 3
	
		
		game1 = {
				gameType = "bubbleCounting",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = 50, startRange = 3, endRange = 6, groupStartRange = 3, groupEndRange = 3, answerRange = 3, category = "numbers" },
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
		},
		game2 = {
				
								
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Touch a number, then a card", line2 = "with the same number of items.", spacing = 20, scale = .8, offsetX = 0, offsetY = -69 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 76, vSpacing = 93, scale = 1.15, offsetX = 0, offsetY = -27, startRange = 5, endRange = 10, category = "numbersToGroups" },
				matching = { mode = "showme", classic = true, layout = 9, numRandom = true, showMeMode = 2 }
		},
		game3 = {
				
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 60, scale = 1.375, offsetX = 0, offsetY = -40, startRange = 5, endRange = 10, answerRange = 4, category = "numbers" },
				questions = { questionType1 = "Which number is", questionType2 = "GreaterLess", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 1 }
		
				
		},
		game4 = {
				
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 60, scale = 1.375, offsetX = 0, offsetY = -40, startRange = 15, endRange = 30, answerRange = 4, category = "numbers" },
				questions = { questionType1 = "Which number is", questionType2 = "GreaterLess", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 1 }
		
				
		},
		
		game5 = {
				
								
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Touch a number, then a card", line2 = "with the same number of items.", spacing = 20, scale = .8, offsetX = 0, offsetY = -69 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 76, vSpacing = 93, scale = 1.15, offsetX = 0, offsetY = -27, startRange = 5, endRange = 10, category = "numbersToGroups" },
				matching = { mode = "showme", classic = true, layout = 9, numRandom = true, showMeMode = 2 }
		},
		
		game6 = {
				gameType = "bubbleCounting",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = 50, startRange = 7, endRange = 10, groupStartRange = 3, groupEndRange = 3, answerRange = 3, category = "numbers" },
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }
		},
	
		game7 = {
				
								
				gameType = "matching",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Touch a number, then a card", line2 = "with the same number of items.", spacing = 20, scale = .8, offsetX = 0, offsetY = -69 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
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
		
	},
		
	
	level25 = { --Chauncey Building Bigger Numbers
		game1 = {
				gameType = "puzzleSlots",
				nextWaypoint = false, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.4, offsetX = 0, offsetY = 50, startRange = 1, endRange = 9, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 },
				puzzle = { imageSet = "CardsNum", number = "random", minRand = 120, maxRand = 170, incorrectChoices = 2, maskSet = 3, otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "slotAlpha", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
				
		},
		game2 = {
				
				gameType = "puzzleSlots",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -36 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.4, offsetX = 0, offsetY = 50, startRange = 0, endRange = 1, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 3, scattered = true, imageCount = "random", skip = 1, skipPattern = "", startNum = "", order = "ascending" },
				puzzle = { imageSet = "CardsNumDifficult", number = "random", minRand = 100, maxRand = 119, incorrectChoices = 2, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		
		},
		game3 = {
				gameType = "puzzleSlots",
				nextWaypoint = false, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.4, offsetX = 0, offsetY = 50, startRange = 1, endRange = 9, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 },
				puzzle = { imageSet = "CardsNumDifficult", number = "random", minRand = 400, maxRand = 500, incorrectChoices = 1, maskSet = 3, otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "slotAlpha", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
				
		},
		game4 = {
				
				gameType = "puzzleSlots",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -36 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.4, offsetX = 0, offsetY = 50, startRange = 0, endRange = 1, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 3, scattered = true, imageCount = "random", skip = 1, skipPattern = "", startNum = "", order = "ascending" },
				puzzle = { imageSet = "CardsNumDifficult", number = "random", minRand = 275, maxRand = 399, incorrectChoices = 3, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		
		},
		game5 = {
				gameType = "puzzleSlots",
				nextWaypoint = false, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.4, offsetX = 0, offsetY = 50, startRange = 1, endRange = 9, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 },
				puzzle = { imageSet = "CardsNumDifficult", number = "random", minRand = 111, maxRand = 274, incorrectChoices = 3, maskSet = 3, otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "slotAlpha", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
				
		},
		game6 = {
				gameType = "puzzleSlots",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.4, offsetX = 0, offsetY = 50, startRange = 1, endRange = 9, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 },
				puzzle = { imageSet = "CardsNumDifficult", number = "random", minRand = 575, maxRand = 700, incorrectChoices = 3, maskSet = 3, otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "slotAlpha", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
				
		},
		game7 = {
				
				gameType = "puzzleSlots",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -36 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.4, offsetX = 0, offsetY = 50, startRange = 0, endRange = 1, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 3, scattered = true, imageCount = "random", skip = 1, skipPattern = "", startNum = "", order = "ascending" },
				puzzle = { imageSet = "CardsNumDifficult", number = "random", minRand = 275, maxRand = 574, incorrectChoices = 3, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		
		},
		game8 = {
				
				gameType = "puzzleSlots",
				nextWaypoint = false, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -36 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.4, offsetX = 0, offsetY = 50, startRange = 0, endRange = 1, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 3, scattered = true, imageCount = "random", skip = 1, skipPattern = "", startNum = "", order = "ascending" },
				puzzle = { imageSet = "CardsNumDifficult", number = "random", minRand = 700, maxRand = 899, incorrectChoices = 3, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		
		},
		game9 = {
				
				gameType = "puzzleSlots",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -36 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.4, offsetX = 0, offsetY = 50, startRange = 0, endRange = 1, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 3, scattered = true, imageCount = "random", skip = 1, skipPattern = "", startNum = "", order = "ascending" },
				puzzle = { imageSet = "CardsNumDifficult", number = "random", minRand = 300, maxRand = 999, incorrectChoices = 3, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		
		},
		game10 = {
				
				gameType = "puzzleSlots",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -36 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.4, offsetX = 0, offsetY = 50, startRange = 0, endRange = 1, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 3, scattered = true, imageCount = "random", skip = 1, skipPattern = "", startNum = "", order = "ascending" },
				puzzle = { imageSet = "CardsNumDifficult", number = "random", minRand = 500, maxRand = 999, incorrectChoices = 3, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		
		},
		
	},
	
	level26 = { --Chloe: Skip Counting by 2s
	
		game1 = {
				
				gameType = "counting",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = -35, startRange = 2, endRange = 10, category = "numbers" },
				
				counting = { rowNum = 3, columnNum = 2, spacing = 10, startNum = "random", skip = 2, placeMatch = 2 }
		},
		game2 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 100,
				question = { line1 = "", line2 = "", spacing = 20, scale = 0.95, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 20, startRange = 4, endRange = 12, answerRange = 3, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 2, placeMatch = 2 }
				
		},
		game3 = {
				gameType = "puzzleSlots",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 8, endRange = 12, answerRange = 4, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 4, scattered = true, imageCount = "random", skip = 2, skipPattern = "", startNum = "", placeMatch = 2, order = "ascending" },
				puzzle = { imageSet = "Cards", number = "random", minRand = 8, maxRand = 12, incorrectChoices = 2, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		

				
		},
		game4 = {
				
				gameType = "counting",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = -35, startRange = 22, endRange = 33, category = "numbers" },
				
				counting = { rowNum = 3, columnNum = 2, spacing = 10, startNum = "random", skip = 2, placeMatch = 2 }
		},
		game5 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 100,
				question = { line1 = "", line2 = "", spacing = 20, scale = 0.95, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 20, startRange = 12, endRange = 16, answerRange = 3, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 2, placeMatch = 2 }
				
		},
		game6 = {
				gameType = "puzzleSlots",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.25, offsetX = 0, offsetY = 60, startRange = 40, endRange = 90, answerRange = 3, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 4, scattered = true, imageCount = "random", skip = 2, skipPattern = "", startNum = "", placeMatch = 2, order = "ascending" },
				puzzle = { imageSet = "CardsClassic", number = "random", minRand = 40, maxRand = 90, incorrectChoices = 3, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		},
		
		
	
	
	
		-- game1 = {
				
				-- gameType = "counting",
				-- nextWaypoint = true,
				-- grayBGY = 140,
				-- question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { scale = .95, offsetX = 0, offsetY = -35, startRange = 2, endRange = 10, category = "numbers" },
				
				-- counting = { rowNum = 2, columnNum = 2, spacing = 10, startNum = "random", skip = 2, placeMatch = 2 }
		-- },
		-- game2 = {
				
				-- gameType = "sequence",
				-- nextWaypoint = true,
				-- grayBGY = 110,
				-- question = { line1 = "What comes next?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { spacing = 38.5, scale = .95, offsetX = 0, offsetY = 33, startRange = 20, endRange = 30, answerRange = 2, category = "numbers" },
				
				-- sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 80, blankLocation = 4, placeMatch = 2, skip = 2, startNum = "random", patternLength = 1, order = "ascending", numChoices = 3 }
				
				
		-- },
		-- game3 = {
				
				-- gameType = "counting",
				-- nextWaypoint = true,
				-- grayBGY = 140,
				-- question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { scale = .95, offsetX = 0, offsetY = -35, startRange = 4, endRange = 16, category = "numbers" },
				
				-- counting = { rowNum = 3, columnNum = 2, spacing = 10, startNum = "random", skip = 2, placeMatch = 2 }
		-- },
		-- game4 = {
				-- gameType = "sequence",
				-- nextWaypoint = true,
				-- grayBGY = 110,
				-- question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				-- equation = { scale = .9, offsetX = 0, offsetY = 0 },
				-- cards = { spacing = 42, scale = .95, offsetX = 0, offsetY = 33, startRange = 8, endRange = 12, answerRange = 2, category = "numbers" },
				
				-- sequence = { numItems = 5, itemsScale = .9, itemsSpacing = 80, blankLocation = 4, placeMatch = 2, skip = 2, startNum = "random", patternLength = 1, order = "ascending", numChoices = 3 }
			-- },
		-- game5 = {
				
				-- gameType = "counting",
				-- nextWaypoint = true,
				-- grayBGY = 140,
				-- question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { scale = .95, offsetX = 0, offsetY = -35, startRange = 8, endRange = 20, category = "numbers" },
				
				-- counting = { rowNum = 3, columnNum = 2, spacing = 10, startNum = "random", skip = 2, placeMatch = 2 }
		-- },
		-- game6 = {
				-- gameType = "sequence",
				-- nextWaypoint = true,
				-- grayBGY = 110,
				-- question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				-- equation = { scale = .9, offsetX = 0, offsetY = 0 },
				-- cards = { spacing = 42, scale = .95, offsetX = 0, offsetY = 33, startRange = 10, endRange = 18, answerRange = 2, category = "numbers" },
				
				-- sequence = { numItems = 5, itemsScale = .9, itemsSpacing = 80, blankLocation = 3, placeMatch = 2, skip = 2, startNum = "random", patternLength = 1, order = "ascending", numChoices = 3 }
			-- },
		
	},
		
	level27 = { --Pete What's Missing
	
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
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 42, scale = .95, offsetX = 0, offsetY = 33, startRange = 40, endRange = 66, answerRange = 2, category = "numbers" },
				
				sequence = { numItems = 4, itemsScale = .95, itemsSpacing = 80, blankLocation = 4, placeMatch = 0, skip = 1, startNum = "random", patternLength = 1, order = "ascending", numChoices = 3 }
		},
		game2 = {
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 42, scale = .95, offsetX = 0, offsetY = 33, startRange = 14, endRange = 20, answerRange = 3, category = "numbers" },
				
				sequence = { numItems = 4, itemsScale = .95, itemsSpacing = 80, blankLocation = 4, placeMatch = 0, skip = 2, startNum = "random", patternLength = 1, order = "ascending", numChoices = 4 }
		},
		game3 = {
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
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
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 42, scale = .95, offsetX = 0, offsetY = 33, startRange = 21, endRange = 39, answerRange = 3, category = "numbers" },
				
				sequence = { numItems = 4, itemsScale = .95, itemsSpacing = 80, blankLocation = 3, placeMatch = 0, skip = 2, startNum = "random", patternLength = 1, order = "ascending", numChoices = 4 }
		},
		game5 = {
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = .9, offsetX = 0, offsetY = 0 },
				cards = { spacing = 42, scale = .95, offsetX = 0, offsetY = 33, startRange = 11, endRange = 20, answerRange = 2, category = "numbers" },
				
				sequence = { numItems = 5, itemsScale = .9, itemsSpacing = 80, blankLocation = 4, placeMatch = 0, skip = 3, startNum = "random", patternLength = 1, order = "ascending", numChoices = 3 }
		},
		game6 = {
				gameType = "sequence",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = .8, offsetX = 0, offsetY = 0 },
				cards = { spacing = 42, scale = .95, offsetX = 0, offsetY = 33, startRange = 30, endRange = 46, answerRange = 2, category = "numbers" },
				
				sequence = { numItems = 5, itemsScale = .9, itemsSpacing = 80, blankLocation = 4, placeMatch = 4, skip = 4, startNum = "random", patternLength = 1, order = "ascending", numChoices = 3 }
		},
		
		game7 = {
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 42, scale = .95, offsetX = 0, offsetY = 33, startRange = 67, endRange = 88, answerRange = 3, category = "numbers" },
				
				sequence = { numItems = 4, itemsScale = .95, itemsSpacing = 80, blankLocation = 3, placeMatch = 0, skip = 3, startNum = "random", patternLength = 1, order = "ascending", numChoices = 4 }
		},
		game8 = {
				gameType = "sequence",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = .8, offsetX = 0, offsetY = 0 },
				cards = { spacing = 42, scale = .95, offsetX = 0, offsetY = 33, startRange = 10, endRange = 30, answerRange = 2, category = "numbers" },
				
				sequence = { numItems = 5, itemsScale = .9, itemsSpacing = 80, blankLocation = 4, placeMatch = 0, skip = 3, startNum = "random", patternLength = 1, order = "ascending", numChoices = 3 }
		},
		game9 = {
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 42, scale = .95, offsetX = 0, offsetY = 33, startRange = 67, endRange = 84, answerRange = 3, category = "numbers" },
				
				sequence = { numItems = 4, itemsScale = .95, itemsSpacing = 80, blankLocation = 3, placeMatch = 1, skip = 4, startNum = "random", patternLength = 1, order = "ascending", numChoices = 4 }
		},
		
	},
	
	level28 = { --Ralphie: Image Patterns
		game1 = {
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What comes next?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = .975, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 9, endRange = 12, answerRange = 2, category = "items" },
				sequence = { numItems = 6, itemsScale = 1, itemsSpacing = 2, blankLocation = 6, placeMatch = 0, skip = 1, skipPattern = "", startNum = "random", patternLength = 2, order = "ascending", numChoices = 3 }
		},
		game2 = {
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What comes next?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 5, endRange = 8, answerRange = 2, category = "items" },
				sequence = { numItems = 5, itemsScale = 1, itemsSpacing = 2, blankLocation = 5, placeMatch = 0, skip = 1, skipPattern = "", startNum = "random", patternLength = 2, order = "ascending", numChoices = 3 }
		},
		game3 = {
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What comes next?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = .975, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 4, answerRange = 2, category = "items" },
				sequence = { numItems = 6, itemsScale = 1, itemsSpacing = 2, blankLocation = 6, placeMatch = 0, skip = 1, skipPattern = "", startNum = "random", patternLength = 3, order = "ascending", numChoices = 3 }
		},
		game4 = {
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = .975, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 5, endRange = 8, answerRange = 2, category = "items" },
				sequence = { numItems = 6, itemsScale = 1, itemsSpacing = 2, blankLocation = 5, placeMatch = 0, skip = 1, skipPattern = "", startNum = "random", patternLength = 2, order = "ascending", numChoices = 3 }
		},
		game5 = {
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = .975, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 9, endRange = 12, answerRange = 2, category = "items" },
				sequence = { numItems = 6, itemsScale = 1, itemsSpacing = 2, blankLocation = 5, placeMatch = 0, skip = 1, skipPattern = "", startNum = "random", patternLength = 3, order = "ascending", numChoices = 3 }
		},
		game6 = {
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
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
		
	},
	
	level29 = { --Pinkie Skip Counting by 5s
	
		game1 = {
				
				gameType = "counting",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = -35, startRange = 2, endRange = 10, category = "numbers" },
				
				counting = { rowNum = 3, columnNum = 2, spacing = 10, startNum = "random", skip = 5, placeMatch = 5 }
		},
		game2 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 100,
				question = { line1 = "", line2 = "", spacing = 20, scale = 0.95, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 20, startRange = 10, endRange = 30, answerRange = 3, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 5 }
				
		},
		-- game3 = {
				-- gameType = "puzzleSlots",
				-- nextWaypoint = true, --false,
				-- grayBGY = 140,
				-- question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 5, endRange = 5, answerRange = 4, category = "numbers" },
				
				-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 4, scattered = true, imageCount = "random", skip = 5, skipPattern = "", startNum = "", placeMatch = 5, order = "ascending" },
				-- puzzle = { imageSet = "Cards", number = "random", minRand = 5, maxRand = 5, incorrectChoices = 2, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		

				
		-- },
		game3 = {
				gameType = "puzzleSlots",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.25, offsetX = 0, offsetY = 60, startRange = 50, endRange = 60, answerRange = 3, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 4, scattered = true, imageCount = "random", skip = 5, skipPattern = "", startNum = "", placeMatch = 5, order = "ascending" },
				puzzle = { imageSet = "CardsClassic", number = "random", minRand = 50, maxRand = 60, incorrectChoices = 3, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		},
		game4 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 100,
				question = { line1 = "", line2 = "", spacing = 20, scale = 0.95, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 20, startRange = 5, endRange = 30, answerRange = 3, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 5 }
				
		},
		game5 = {
				
				gameType = "counting",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = -35, startRange = 20, endRange = 35, category = "numbers" },
				
				counting = { rowNum = 3, columnNum = 2, spacing = 10, startNum = "random", skip = 5, placeMatch = 5 }
		},
		
		game6 = {
				gameType = "puzzleSlots",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.25, offsetX = 0, offsetY = 60, startRange = 40, endRange = 60, answerRange = 3, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 4, scattered = true, imageCount = "random", skip = 5, skipPattern = "", startNum = "", placeMatch = 5, order = "ascending" },
				puzzle = { imageSet = "CardsClassic", number = "random", minRand = 40, maxRand = 60, incorrectChoices = 3, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		},
		game7 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 100,
				question = { line1 = "", line2 = "", spacing = 20, scale = 0.95, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 20, startRange = 10, endRange = 30, answerRange = 3, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 5 }
				
		},
	
	
		-- game1 = {
				-- gameType = "counting",
				-- nextWaypoint = true,
				-- grayBGY = 140,
				-- question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { scale = 1.1, offsetX = 0, offsetY = -25, startRange = 5, endRange = 20, category = "numbers" },
				
				-- counting = { rowNum = 2, columnNum = 2, spacing = 11, startNum = "random", skip = 5, placeMatch = 5 }
		-- },
		-- game2 = {
				-- gameType = "sequence",
				-- nextWaypoint = true,
				-- grayBGY = 110,
				-- question = { line1 = "What comes next?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { spacing = 42, scale = .95, offsetX = 0, offsetY = 33, startRange = 15, endRange = 35, answerRange = 2, category = "numbers" },
				
				-- sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 80, blankLocation = 4, placeMatch = 5, skip = 5, startNum = "random", patternLength = 1, order = "ascending", numChoices = 3 }
		-- },
		-- game3 = {
				-- gameType = "counting",
				-- nextWaypoint = true,
				-- grayBGY = 140,
				-- question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { scale = 1.1, offsetX = 0, offsetY = -25, startRange = 20, endRange = 60, category = "numbers" },
				
				-- counting = { rowNum = 3, columnNum = 2, spacing = 11, startNum = "random", skip = 5, placeMatch = 5 }
		-- },
		-- game4 = {
				-- gameType = "sequence",
				-- nextWaypoint = true,
				-- grayBGY = 110,
				-- question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				-- equation = { scale = .8, offsetX = 0, offsetY = 0 },
				-- cards = { spacing = 42, scale = .95, offsetX = 0, offsetY = 33, startRange = 30, endRange = 75, answerRange = 2, category = "numbers" },
				
				-- sequence = { numItems = 5, itemsScale = .9, itemsSpacing = 80, blankLocation = 4, placeMatch = 5, skip = 5, startNum = "random", patternLength = 1, order = "ascending", numChoices = 3 }
	
		-- },
		-- game5 = {
				-- gameType = "counting",
				-- nextWaypoint = true,
				-- grayBGY = 140,
				-- question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { scale = 1.1, offsetX = 0, offsetY = -25, startRange = 45, endRange = 90, category = "numbers" },
				
				-- counting = { rowNum = 3, columnNum = 2, spacing = 11, startNum = "random", skip = 5, placeMatch = 5 }
		-- },
		-- game6 = {
				-- gameType = "sequence",
				-- nextWaypoint = true,
				-- grayBGY = 110,
				-- question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				-- equation = { scale = .8, offsetX = 0, offsetY = 0 },
				-- cards = { spacing = 42, scale = .95, offsetX = 0, offsetY = 33, startRange = 60, endRange = 85, answerRange = 2, category = "numbers" },
				
				-- sequence = { numItems = 5, itemsScale = .9, itemsSpacing = 80, blankLocation = 3, placeMatch = 5, skip = 5, startNum = "random", patternLength = 1, order = "ascending", numChoices = 3 }
	-- },
		
	},
	
	level30 = { --Oleg Review 4 Nimble Numbers
		
		game1 = {
				gameType = "counting",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = -35, startRange = 8, endRange = 20, category = "numbers" },
				
				counting = { rowNum = 3, columnNum = 2, spacing = 11, startNum = "random", skip = 2, placeMatch = 2 }
		},
		game2 = {
				gameType = "sequence",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = .975, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 5, endRange = 8, answerRange = 2, category = "items" },
				sequence = { numItems = 6, itemsScale = 1, itemsSpacing = 2, blankLocation = 5, placeMatch = 0, skip = 1, skipPattern = "", startNum = "random", patternLength = 2, order = "ascending", numChoices = 3 }
		},
		
		game3 = {
				gameType = "puzzleSlots",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.25, offsetX = 0, offsetY = 60, startRange = 40, endRange = 60, answerRange = 3, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 4, scattered = true, imageCount = "random", skip = 5, skipPattern = "", startNum = "", placeMatch = 5, order = "ascending" },
				puzzle = { imageSet = "CardsClassic", number = "random", minRand = 40, maxRand = 60, incorrectChoices = 3, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		},
		
		
		game4 = {
				gameType = "sequence",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = .9, offsetX = 0, offsetY = 0 },
				cards = { spacing = 42, scale = .95, offsetX = 0, offsetY = 33, startRange = 11, endRange = 20, answerRange = 2, category = "numbers" },
				
				sequence = { numItems = 5, itemsScale = .9, itemsSpacing = 80, blankLocation = 4, placeMatch = 0, skip = 3, startNum = "random", patternLength = 1, order = "ascending", numChoices = 3 }
		},
		game5 = {
				
				gameType = "puzzleSlots",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -36 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.4, offsetX = 0, offsetY = 50, startRange = 0, endRange = 1, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 3, scattered = true, imageCount = "random", skip = 1, skipPattern = "", startNum = "", order = "ascending" },
				puzzle = { imageSet = "CardsNumDifficult", number = "random", minRand = 300, maxRand = 999, incorrectChoices = 3, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		
		},
		
		game6 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 100,
				question = { line1 = "", line2 = "", spacing = 20, scale = 0.95, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 20, startRange = 10, endRange = 30, answerRange = 3, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 5 }
		
		},
		
		
		game7 = {
				gameType = "sequence",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = .975, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 9, endRange = 12, answerRange = 2, category = "items" },
				sequence = { numItems = 6, itemsScale = 1, itemsSpacing = 2, blankLocation = 5, placeMatch = 0, skip = 1, skipPattern = "", startNum = "random", patternLength = 3, order = "ascending", numChoices = 3 }
		},
		
		
		game8 = {
				
				gameType = "puzzleSlots",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -36 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.4, offsetX = 0, offsetY = 50, startRange = 0, endRange = 1, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 3, scattered = true, imageCount = "random", skip = 1, skipPattern = "", startNum = "", order = "ascending" },
				puzzle = { imageSet = "CardsNumDifficult", number = "random", minRand = 500, maxRand = 999, incorrectChoices = 3, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		
		
				
		},
		game9 = {
				
				gameType = "counting",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = -35, startRange = 20, endRange = 35, category = "numbers" },
				
				counting = { rowNum = 3, columnNum = 2, spacing = 10, startNum = "random", skip = 5, placeMatch = 5 }
		},
		
		
	},
	
	level31 = { --Cordelia The Order of Things
		game1 = {
				gameType = "puzzleSlots",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -36 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.55, offsetX = 0, offsetY = 60, startRange = 31, endRange = 49, answerRange = 10, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 3, numChoices = 3, scattered = true, imageCount = 3, skip = "none", skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
				puzzle = { imageSet = "CardsPutInOrderClassic", number = "random", minRand = 1, maxRand = 30, incorrectChoices = 0, minSlotNum = 3, maxSlotNum = 3, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		

				
		},
		-- game2 = {
				-- gameType = "puzzleSlots",
				-- nextWaypoint = false, --false,
				-- grayBGY = 140,
				-- question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -36 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { scale = 1.55, offsetX = 0, offsetY = 50, startRange = 1, endRange = 30, answerRange = 30, category = "numbers" },
				
				-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 3, numChoices = 3, scattered = true, imageCount = 3, skip = "none", skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
				-- puzzle = { imageSet = "CardsPutInOrderClassicDifficult", number = "random", minRand = 1, maxRand = 99, incorrectChoices = 0, minSlotNum = 3, maxSlotNum = 3, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		

				
		-- },
		game2 = {
				gameType = "puzzleSlots",
				nextWaypoint = false, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -36 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 12, endRange = 17, answerRange = 10, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 3, scattered = true, imageCount = "random", skip = 1, skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
				puzzle = { imageSet = "CardsPutInOrder", number = "random", minRand = 16, maxRand = 20, incorrectChoices = 0, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		

				
		},
		game3 = {
				gameType = "puzzleSlots",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -36 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.55, offsetX = 0, offsetY = 50, startRange = 65, endRange = 79, answerRange = 10, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 3, scattered = true, imageCount = 4, skip = "none", skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
				puzzle = { imageSet = "CardsPutInOrderClassic", number = "random", minRand = 50, maxRand = 99, incorrectChoices = 0, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		

				
		},
		game4 = {
				gameType = "puzzleSlots",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -36 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.55, offsetX = 0, offsetY = 50, startRange = 50, endRange = 65, answerRange = 10, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 3, numChoices = 5, scattered = true, imageCount = 3, skip = "none", skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
				puzzle = { imageSet = "CardsPutInOrderClassicDifficult", number = "random", minRand = 1, maxRand = 30, incorrectChoices = 0, minSlotNum = 3, maxSlotNum = 3, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		

				
		},
		game5 = {
				gameType = "puzzleSlots",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -36 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.55, offsetX = 0, offsetY = 50, startRange = 1, endRange = 99, answerRange = 10, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 4, scattered = true, imageCount = 4, skip = "none", skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
				puzzle = { imageSet = "CardsPutInOrderClassicDifficult", number = "random", minRand = 1, maxRand = 99, incorrectChoices = 0, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		

				
		},
		-- game6 = {
				-- gameType = "puzzleSlots",
				-- nextWaypoint = false, --false,
				-- grayBGY = 140,
				-- question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -36 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { scale = 1.55, offsetX = 0, offsetY = 50, startRange = 1, endRange = 99, answerRange = 10, category = "numbers" },
				
				-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 5, numChoices = 5, scattered = true, imageCount = 5, skip = "none", skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
				-- puzzle = { imageSet = "CardsPutInOrderClassicDifficult", number = "random", minRand = 1, maxRand = 99, incorrectChoices = 0, minSlotNum = 5, maxSlotNum = 5, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		

				
		-- },
		game6 = {
				gameType = "puzzleSlots",
				nextWaypoint = false, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -36 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.55, offsetX = 0, offsetY = 50, startRange = 1, endRange = 99, answerRange = 10, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 4, scattered = true, imageCount = 4, skip = "none", skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
				puzzle = { imageSet = "CardsPutInOrderClassicDifficult", number = "random", minRand = 1, maxRand = 99, incorrectChoices = 0, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		

				
		},
		game7 = {
				gameType = "puzzleSlots",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -36 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.55, offsetX = 0, offsetY = 50, startRange = 1, endRange = 99, answerRange = 10, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 4, scattered = true, imageCount = 4, skip = "none", skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
				puzzle = { imageSet = "CardsPutInOrderClassicDifficult", number = "random", minRand = 1, maxRand = 99, incorrectChoices = 0, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		

				
		},
		-- game8 = {
				-- gameType = "puzzleSlots",
				-- nextWaypoint = true, --false,
				-- grayBGY = 140,
				-- question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -36 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { scale = 1.55, offsetX = 0, offsetY = 50, startRange = 1, endRange = 99, answerRange = 10, category = "numbers" },
				
				-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 5, numChoices = 5, scattered = true, imageCount = 5, skip = "none", skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
				-- puzzle = { imageSet = "CardsPutInOrderClassicDifficult", number = "random", minRand = 1, maxRand = 99, incorrectChoices = 0, minSlotNum = 5, maxSlotNum = 5, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		

				
		-- },
		game8 = {
				gameType = "puzzleSlots",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -36 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.55, offsetX = 0, offsetY = 50, startRange = 1, endRange = 99, answerRange = 10, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 4, scattered = true, imageCount = 4, skip = "none", skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
				puzzle = { imageSet = "CardsPutInOrderClassicDifficult", number = "random", minRand = 1, maxRand = 99, incorrectChoices = 0, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		

				
		},
		
	},
	
	level32 = { --Dudley One More
	
		game1 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 60, scale = 1.4, offsetX = 0, offsetY = -42, startRange = 1, endRange = 10, answerRange = 3, category = "numbers" },
				questions = { questionType1 = "Which is", questionType2 = "more than", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = 1, skipMin = 1, skipMax = 5 }
		},	
		game2 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 75, scale = 1.75, offsetX = 0, offsetY = -42, startRange = 20, endRange = 30, answerRange = 3, category = "numbers" },
				questions = { questionType1 = "Which is", questionType2 = "more than", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = 1, skipMin = 1, skipMax = 5 }
		},	
		game3 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 60, scale = 1.4, offsetX = 0, offsetY = -42, startRange = 11, endRange = 19, answerRange = 3, category = "numbers" },
				questions = { questionType1 = "Which is", questionType2 = "more than", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = 1, skipMin = 1, skipMax = 5 }
		},	
		game4 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 73, scale = 1.75, offsetX = 0, offsetY = -42, startRange = 15, endRange = 50, answerRange = 3, category = "numbers" },
				questions = { questionType1 = "Which is", questionType2 = "more than", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = 1, skipMin = 1, skipMax = 5 }
		},	
		game5 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 60, scale = 1.4, offsetX = 0, offsetY = -42, startRange = 20, endRange = 99, answerRange = 3, category = "numbers" },
				questions = { questionType1 = "Which is", questionType2 = "more than", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = 1, skipMin = 1, skipMax = 5 }
		},	
		game6 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 60, scale = 1.4, offsetX = 0, offsetY = -42, startRange = 30, endRange = 99, answerRange = 3, category = "numbers" },
				questions = { questionType1 = "Which is", questionType2 = "more than", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = 1, skipMin = 1, skipMax = 5 }
		},	
		
	},
		
	level33 = { --Pinkie Greater Than
	
		game1 = {
				gameType = "basketGreaterLessThan",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .7, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 0, startRange = 3, endRange = 3, numStartRange = 1, numEndRange = 10, numCorrectMin = 1, numCorrectMax = 3, answerRange = 10, category = "numbers" },
				questions = { questionType1 = "basketGreaterLessThan", questionType2 = "greater than", numAnswers = 1, numChoices = 5, scattered = true, numExtraMin = 1, numExtraMax = 2, imageCount = 4, skip = 1 }
		},
		game2 = {
				gameType = "basketGreaterLessThan",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .7, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 0, startRange = 4, endRange = 4, numStartRange = 5, numEndRange = 25, numCorrectMin = 2, numCorrectMax = 4, answerRange = 10, category = "numbers" },
				questions = { questionType1 = "basketGreaterLessThan", questionType2 = "greater than", numAnswers = 1, numChoices = 4, scattered = true, numExtraMin = 1, numExtraMax = 2, imageCount = 4, skip = 1 }
		},
		game3 = {
				gameType = "basketGreaterLessThan",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .7, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 0, startRange = 4, endRange = 5, numStartRange = 10, numEndRange = 50, numCorrectMin = 2, numCorrectMax = 4, answerRange = 10, category = "numbers" },
				questions = { questionType1 = "basketGreaterLessThan", questionType2 = "greater than", numAnswers = 1, numChoices = 5, scattered = true, numExtraMin = 1, numExtraMax = 2, imageCount = 4, skip = 1 }
		},
		game4 = {
				gameType = "basketGreaterLessThan",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .7, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 0, startRange = 5, endRange = 5, numStartRange = 9, numEndRange = 99, numCorrectMin = 2, numCorrectMax = 4, answerRange = 10, category = "numbers" },
				questions = { questionType1 = "basketGreaterLessThan", questionType2 = "greater than", numAnswers = 1, numChoices = 5, scattered = true, numExtraMin = 1, numExtraMax = 2, imageCount = 4, skip = 1 }
		},
		game5 = {
				gameType = "basketGreaterLessThan",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .7, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 0, startRange = 3, endRange = 5, numStartRange = 5, numEndRange = 99, numCorrectMin = 2, numCorrectMax = 4, answerRange = 10, category = "numbers" },
				questions = { questionType1 = "basketGreaterLessThan", questionType2 = "greater than", numAnswers = 1, numChoices = 4, scattered = true, numExtraMin = 1, numExtraMax = 2, imageCount = 4, skip = 1 }
		},
		game6 = {
				gameType = "basketGreaterLessThan",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .7, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 0, startRange = 3, endRange = 5, numStartRange = 5, numEndRange = 99, numCorrectMin = 2, numCorrectMax = 4, answerRange = 10, category = "numbers" },
				questions = { questionType1 = "basketGreaterLessThan", questionType2 = "greater than", numAnswers = 1, numChoices = 5, scattered = true, numExtraMin = 1, numExtraMax = 2, imageCount = 4, skip = 1 }
		},
	},
		
	level34 = { --Sunshine the Bee:
		game1 = {
				
				gameType = "counting",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = -35, startRange = 10, endRange = 40, category = "numbers" },
				
				counting = { rowNum = 2, columnNum = 2, spacing = 10, startNum = "random", skip = 10, placeMatch = 10 }
		},
		game2 = {
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 42, scale = .95, offsetX = 0, offsetY = 33, startRange = 30, endRange = 60, answerRange = 2, category = "numbers" },
				
				sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 80, blankLocation = 4, placeMatch = 10, skip = 10, startNum = "random", patternLength = 4, order = "ascending", numChoices = 3 }
		},
		game3 = {
				
				gameType = "counting",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = -35, startRange = 50, endRange = 60, category = "numbers" },
				
				counting = { rowNum = 3, columnNum = 2, spacing = 10, startNum = "random", skip = 10, placeMatch = 10 }
		},
		game4 = {
					gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 42, scale = .95, offsetX = 0, offsetY = 33, startRange = 20, endRange = 50, answerRange = 2, category = "numbers" },
				
				sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 80, blankLocation = 4, placeMatch = 10, skip = 10, startNum = "random", patternLength = 4, order = "ascending", numChoices = 3 }
		},
		game5 = {
				
				gameType = "counting",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = -35, startRange = 10, endRange = 40, category = "numbers" },
				
				counting = { rowNum = 3, columnNum = 2, spacing = 10, startNum = "random", skip = 10, placeMatch = 10 }
		},
		game6 = {
					gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 42, scale = .95, offsetX = 0, offsetY = 33, startRange = 30, endRange = 60, answerRange = 2, category = "numbers" },
				
				sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 80, blankLocation = 4, placeMatch = 10, skip = 10, startNum = "random", patternLength = 4, order = "ascending", numChoices = 3 }
		},
		
	},	
		
	level35 = { --Ralphie How Many More
		game1 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 115,
				question = { line1 = "", line2 = "", spacing = 30, scale = .78, offsetX = 0, offsetY = -69},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .98, offsetX = 0, offsetY = 35, startRange = 1, endRange = 3, answerRange = 2, category = "apples" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 2, scattered = true, imageCount = "random", skip = 1 }	
		},
		game2 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 115,
				question = { line1 = "", line2 = "", spacing = 30, scale = .78, offsetX = 0, offsetY = -69},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .98, offsetX = 0, offsetY = 35, startRange = 2, endRange = 4, answerRange = 2, category = "apples" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game3 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 115,
				question = { line1 = "", line2 = "", spacing = 30, scale = .78, offsetX = 0, offsetY = -69},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .98, offsetX = 0, offsetY = 35, startRange = 1, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 2, scattered = true, imageCount = "random", skip = 1 }	
		},
		game4 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 115,
				question = { line1 = "", line2 = "", spacing = 30, scale = .78, offsetX = 0, offsetY = -69},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .98, offsetX = 0, offsetY = 35, startRange = 2, endRange = 5, answerRange = 2, category = "apples" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game5 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 115,
				question = { line1 = "", line2 = "", spacing = 30, scale = .78, offsetX = 0, offsetY = -69},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .98, offsetX = 0, offsetY = 35, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game6 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 115,
				question = { line1 = "", line2 = "", spacing = 30, scale = .78, offsetX = 0, offsetY = -69},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .98, offsetX = 0, offsetY = 35, startRange = 2, endRange = 5, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 2, scattered = true, imageCount = "random", skip = 1 }	
		},
		game7 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 115,
				question = { line1 = "", line2 = "", spacing = 30, scale = .78, offsetX = 0, offsetY = -69},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .98, offsetX = 0, offsetY = 35, startRange = 2, endRange = 5, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
	},
		
	level36 = { --Cordelia Review 5 Going Up
		
		game1 = {
				gameType = "puzzleSlots",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -36 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.55, offsetX = 0, offsetY = 50, startRange = 1, endRange = 99, answerRange = 10, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 4, scattered = true, imageCount = 4, skip = "none", skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
				puzzle = { imageSet = "CardsPutInOrderClassicDifficult", number = "random", minRand = 1, maxRand = 99, incorrectChoices = 0, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		

				
		},
		game2 = {
				gameType = "basketGreaterLessThan",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .7, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 0, startRange = 3, endRange = 5, numStartRange = 5, numEndRange = 99, numCorrectMin = 2, numCorrectMax = 4, answerRange = 10, category = "numbers" },
				questions = { questionType1 = "basketGreaterLessThan", questionType2 = "greater than", numAnswers = 1, numChoices = 5, scattered = true, numExtraMin = 1, numExtraMax = 2, imageCount = 4, skip = 1 }
		},
		
		
		
		game3 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 60, scale = 1.4, offsetX = 0, offsetY = -42, startRange = 20, endRange = 99, answerRange = 3, category = "numbers" },
				questions = { questionType1 = "Which is", questionType2 = "more than", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = 1, skipMin = 1, skipMax = 5 }
		},	
		
		game4 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 115,
				question = { line1 = "", line2 = "", spacing = 30, scale = .78, offsetX = 0, offsetY = -69},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .98, offsetX = 0, offsetY = 35, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		
		game5 = {
				
				gameType = "counting",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = -35, startRange = 10, endRange = 40, category = "numbers" },
				
				counting = { rowNum = 3, columnNum = 2, spacing = 10, startNum = "random", skip = 10, placeMatch = 10 }
		},
		
		
		game6 = {
				gameType = "basketGreaterLessThan",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .7, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 0, startRange = 3, endRange = 5, numStartRange = 5, numEndRange = 50, numCorrectMin = 2, numCorrectMax = 4, answerRange = 4, category = "numbers" },
				questions = { questionType1 = "basketGreaterLessThan", questionType2 = "greater than", numAnswers = 1, numChoices = 5, scattered = true, numExtraMin = 1, numExtraMax = 2, imageCount = 4, skip = 1 }
		},
		game7 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 60, scale = 1.4, offsetX = 0, offsetY = -42, startRange = 30, endRange = 99, answerRange = 3, category = "numbers" },
				questions = { questionType1 = "Which is", questionType2 = "more than", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = 1, skipMin = 1, skipMax = 5 }
		},	
		
		game8 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 115,
				question = { line1 = "", line2 = "", spacing = 30, scale = .78, offsetX = 0, offsetY = -69},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .96, offsetX = 0, offsetY = 35, startRange = 2, endRange = 5, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
				
		},
		
		
	
			
	
		
		
	
		
		
		
		
		
	},
		
	level37 = { -- Oliver Ten More
		game1 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 75, scale = 1.75, offsetX = 0, offsetY = -42, startRange = 1, endRange = 10, answerRange = 3, category = "numbers" },
				questions = { questionType1 = "Which is", questionType2 = "more than", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = 10, skipMin = 10, skipMax = 10 }
		},	
		game2 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 75, scale = 1.75, offsetX = 0, offsetY = -42, startRange = 25, endRange = 35, answerRange = 3, category = "numbers" },
				questions = { questionType1 = "Which is", questionType2 = "more than", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = 10, skipMin = 10, skipMax = 10 }
		},	
		game3 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 60, scale = 1.4, offsetX = 0, offsetY = -42, startRange = 11, endRange = 24, answerRange = 3, category = "numbers" },
				questions = { questionType1 = "Which is", questionType2 = "more than", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = 10, skipMin = 10, skipMax = 10 }
		},	
		game4 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 75, scale = 1.75, offsetX = 0, offsetY = -42, startRange = 40, endRange = 70, answerRange = 3, category = "numbers" },
				questions = { questionType1 = "Which is", questionType2 = "more than", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = 10, skipMin = 10, skipMax = 10 }
		},	
		game5 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 60, scale = 1.4, offsetX = 0, offsetY = -42, startRange = 25, endRange = 39, answerRange = 3, category = "numbers" },
				questions = { questionType1 = "Which is", questionType2 = "more than", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = 10, skipMin = 10, skipMax = 10 }
		},	
		game6 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 75, scale = 1.75, offsetX = 0, offsetY = -42, startRange = 71, endRange = 85, answerRange = 3, category = "numbers" },
				questions = { questionType1 = "Which is", questionType2 = "more than", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = 10, skipMin = 10, skipMax = 10 }
		},	
		game7 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 60, scale = 1.4, offsetX = 0, offsetY = -42, startRange = 10, endRange = 85, answerRange = 3, category = "numbers" },
				questions = { questionType1 = "Which is", questionType2 = "more than", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = 10, skipMin = 10, skipMax = 10 }
		},	
		game8 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 60, scale = 1.4, offsetX = 0, offsetY = -42, startRange = 10, endRange = 85, answerRange = 3, category = "numbers" },
				questions = { questionType1 = "Which is", questionType2 = "more than", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = 10, skipMin = 10, skipMax = 10 }
		},	
	},
	
	level38 = { -- Webster What's Missing 2s 5s 10s
		
		game1 = {
				
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 38.5, scale = .95, offsetX = 0, offsetY = 33, startRange = 10, endRange = 70, answerRange = 4, category = "numbers" },
				
				sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 80, blankLocation = "random", placeMatch = "random", skip = 1, startNum = "random", patternLength = 1, order = "ascending", numChoices = 3 }
		},
		game2 = {
				gameType = "puzzleSlots",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.25, offsetX = 0, offsetY = 60, startRange = 10, endRange = 70, answerRange = 4, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 3, scattered = true, imageCount = "random", skip = "random", skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
				puzzle = { imageSet = "CardsClassic", number = "random", minRand = 1, maxRand = 70, incorrectChoices = 2, minSlotNum = 2, maxSlotNum = 3, turnOffEndVO = true, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		},
		game3 = {
				gameType = "sequence",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 38.5, scale = .95, offsetX = 0, offsetY = 33, startRange = 10, endRange = 70, answerRange = 4, category = "numbers" },
				
				sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 80, blankLocation = "random", placeMatch = "random", skip = 1, startNum = "random", patternLength = 1, order = "ascending", numChoices = 3 }
		},
		-- game4 = {
				-- gameType = "puzzleSlots",
				-- nextWaypoint = true, --false,
				-- grayBGY = 140,
				-- question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { scale = 1.25, offsetX = 0, offsetY = 60, startRange = 10, endRange = 70, answerRange = 4, category = "numbers" },
				
				-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 5, numChoices = 3, scattered = true, imageCount = "random", skip = "random", skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
				-- puzzle = { imageSet = "CardsClassic", number = "random", minRand = 10, maxRand = 70, incorrectChoices = 2, minSlotNum = 3, maxSlotNum = 4, turnOffEndVO = true, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		-- },
		game4 = {
				gameType = "puzzleSlots",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.25, offsetX = 0, offsetY = 60, startRange = 10, endRange = 70, answerRange = 4, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 3, scattered = true, imageCount = "random", skip = "random", skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
				puzzle = { imageSet = "CardsClassic", number = "random", minRand = 10, maxRand = 70, incorrectChoices = 2, minSlotNum = 2, maxSlotNum = 3, turnOffEndVO = true, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		},
		game5 = {
				gameType = "puzzleSlots",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.25, offsetX = 0, offsetY = 60, startRange = 10, endRange = 80, answerRange = 4, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 3, scattered = true, imageCount = "random", skip = "random", skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
				puzzle = { imageSet = "CardsClassic", number = "random", minRand = 10, maxRand = 70, incorrectChoices = 2, minSlotNum = 2, maxSlotNum = 3, turnOffEndVO = true, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		},
		game6 = {
				gameType = "sequence",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = .8, offsetX = 0, offsetY = 0 },
				cards = { spacing = 38.5, scale = .95, offsetX = 0, offsetY = 33, startRange = 20, endRange = 70, answerRange = 4, category = "numbers" },
				
				sequence = { numItems = 5, itemsScale = .9, itemsSpacing = 80, blankLocation = "random", placeMatch = "random", skip = 1, startNum = "random", patternLength = 1, order = "ascending", numChoices = 3 }
		},
		-- game7 = {
				-- gameType = "puzzleSlots",
				-- nextWaypoint = true, --false,
				-- grayBGY = 140,
				-- question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { scale = 1.25, offsetX = 0, offsetY = 60, startRange = 20, endRange = 80, answerRange = 4, category = "numbers" },
				
				-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 5, numChoices = 3, scattered = true, imageCount = "random", skip = "random", skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
				-- puzzle = { imageSet = "CardsClassic", number = "random", minRand = 10, maxRand = 80, incorrectChoices = 2, minSlotNum = 3, maxSlotNum = 4, turnOffEndVO = true, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		-- },
		game7 = {
				gameType = "puzzleSlots",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.25, offsetX = 0, offsetY = 60, startRange = 20, endRange = 80, answerRange = 4, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 3, scattered = true, imageCount = "random", skip = "random", skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
				puzzle = { imageSet = "CardsClassic", number = "random", minRand = 10, maxRand = 80, incorrectChoices = 2, minSlotNum = 2, maxSlotNum = 3, turnOffEndVO = true, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		},
		game8 = {
				gameType = "puzzleSlots",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.25, offsetX = 0, offsetY = 60, startRange = 30, endRange = 80, answerRange = 4, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 3, scattered = true, imageCount = "random", skip = "random", skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
				puzzle = { imageSet = "CardsClassic", number = "random", minRand = 1, maxRand = 70, incorrectChoices = 2, minSlotNum = 2, maxSlotNum = 3, turnOffEndVO = true, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		},
	},
	
	level39 = { -- Petes Apples and Bananas
		game1 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 115,
				question = { line1 = "", line2 = "", spacing = 30, scale = .78, offsetX = 0, offsetY = -69},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .98, offsetX = 0, offsetY = 35, startRange = 1, endRange = 5, answerRange = 2, category = "apples" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 2, scattered = true, imageCount = "random", skip = 1 }	
		},
		game2 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 115,
				question = { line1 = "", line2 = "", spacing = 30, scale = .78, offsetX = 0, offsetY = -69},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .98, offsetX = 0, offsetY = 35, startRange = 1, endRange = 5, answerRange = 2, category = "apples" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 2, scattered = true, imageCount = "random", skip = 1 }	
		},
		game3 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 115,
				question = { line1 = "", line2 = "", spacing = 30, scale = .78, offsetX = 0, offsetY = -69},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .98, offsetX = 0, offsetY = 35, startRange = 1, endRange = 5, answerRange = 2, category = "apples" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game4 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 115,
				question = { line1 = "", line2 = "", spacing = 30, scale = .78, offsetX = 0, offsetY = -69},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .98, offsetX = 0, offsetY = 35, startRange = 1, endRange = 5, answerRange = 2, category = "apples" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game5 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 115,
				question = { line1 = "", line2 = "", spacing = 30, scale = .78, offsetX = 0, offsetY = -69},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .98, offsetX = 0, offsetY = 35, startRange = 1, endRange = 5, answerRange = 2, category = "apples" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game6 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 115,
				question = { line1 = "", line2 = "", spacing = 30, scale = .78, offsetX = 0, offsetY = -69},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .98, offsetX = 0, offsetY = 35, startRange = 1, endRange = 5, answerRange = 2, category = "apples" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		
	},
	
	level40 = { --Percival The Puppy:
		game1 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 9},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 3, answerRange = 2, category = "numbersDots" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 2, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game2 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 9},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 2, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game3 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 9},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 3, answerRange = 2, category = "numbersDots" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game4 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 9},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game5 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 9},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game6 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 9},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
	},
	
	level41 = { -- Bella Review 6
		game1 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 115,
				question = { line1 = "", line2 = "", spacing = 30, scale = .78, offsetX = 0, offsetY = -69},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .98, offsetX = 0, offsetY = 35, startRange = 2, endRange = 3, answerRange = 2, category = "numbersDots" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		-- game2 = {
				-- gameType = "basketGreaterLessThan",
				-- nextWaypoint = true,
				-- grayBGY = 140,
				-- question = { line1 = "", line2 = "", spacing = 20, scale = .7, offsetX = 0, offsetY = -65 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { scale = .8, offsetX = 0, offsetY = 0, startRange = 5, endRange = 5, numStartRange = 5, numEndRange = 50, numCorrectMin = 1, numCorrectMax = 3, answerRange = 2, category = "numbers" },
				-- questions = { questionType1 = "basketGreaterLessThan", questionType2 = "greater than", numAnswers = 1, numChoices = 5, scattered = true, numExtraMin = 0, numExtraMax = 0, imageCount = 4, skip = 1 }
		-- },
		game2 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 75, scale = 1.75, offsetX = 0, offsetY = -42, startRange = 40, endRange = 70, answerRange = 3, category = "numbers" },
				questions = { questionType1 = "Which is", questionType2 = "more than", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = 10, skipMin = 10, skipMax = 10 }
		},	
		game3 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 9},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		
		game4 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 60, scale = 1.4, offsetX = 0, offsetY = -42, startRange = 10, endRange = 85, answerRange = 3, category = "numbers" },
				questions = { questionType1 = "Which is", questionType2 = "more than", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = 10, skipMin = 10, skipMax = 10 }
		},	
		-- game4 = {
				
								
				-- gameType = "matching",
				-- nextWaypoint = true,
				-- grayBGY = 140,
				-- question = { line1 = "Match picture cards that have", line2 = "the same number of items.", spacing = 20, scale = .8, offsetX = 0, offsetY = -69 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { spacing = 60, vSpacing = 93, scale = 1.25, offsetX = 0, offsetY = -13, startRange = 6, endRange = 10, category = "groupsToGroups" },
				-- matching = { mode = "showme", classic = true, layout = 1, numRandom = true, showMeMode = 2 }
		-- },
		game5 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 115,
				question = { line1 = "", line2 = "", spacing = 30, scale = .78, offsetX = 0, offsetY = -69},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .98, offsetX = 0, offsetY = 35, startRange = 4, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game6 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 9},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		
		game7 = {
				gameType = "sequence",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = .8, offsetX = 0, offsetY = 0 },
				cards = { spacing = 42, scale = .95, offsetX = 0, offsetY = 35, startRange = 20, endRange = 70, answerRange = 10, category = "numbers" },
				
				sequence = { numItems = 5, itemsScale = .9, itemsSpacing = 80, blankLocation = "random", placeMatch = "random", skip = 1, startNum = "random", patternLength = 1, order = "ascending", numChoices = 3 }
		},
		game8 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 115,
				question = { line1 = "", line2 = "", spacing = 30, scale = .78, offsetX = 0, offsetY = -69},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .98, offsetX = 0, offsetY = 35, startRange = 1, endRange = 5, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		-- game10 = {
				-- gameType = "puzzleSlots",
				-- nextWaypoint = true, --false,
				-- grayBGY = 140,
				-- question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { scale = 1.25, offsetX = 0, offsetY = 60, startRange = 20, endRange = 80, answerRange = 10, category = "numbers" },
				
				-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 5, numChoices = 3, scattered = true, imageCount = "random", skip = "random", skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
				-- puzzle = { imageSet = "CardsClassic", number = "random", minRand = 10, maxRand = 80, incorrectChoices = 2, minSlotNum = 3, maxSlotNum = 4, turnOffEndVO = true, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		-- },
		game9 = {
				gameType = "puzzleSlots",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.25, offsetX = 0, offsetY = 60, startRange = 20, endRange = 60, answerRange = 10, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 3, scattered = true, imageCount = "random", skip = "random", skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
				puzzle = { imageSet = "CardsClassic", number = "random", minRand = 20, maxRand = 60, incorrectChoices = 2, minSlotNum = 2, maxSlotNum = 3, turnOffEndVO = true, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		},
		
	},	
	
	level42 = { -- Sunshine Which two?
		game1 = {
				gameType = "question",
				nextWaypoint = true,				
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 75, scale = 1.75, offsetX = 0, offsetY = -42, startRange = 3, endRange = 4, answerRange = 2, category = "numbersDots"  },
				
				questions = { questionType1 = "Which 2 numbers add up to", questionType2 = "random", numAnswers = 2, numChoices = 3, scattered = true, imageCount = 9, skip = 1 }	
				
		},
		game2 = {
				gameType = "question",
				nextWaypoint = false,				
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 60, scale = 1.4, offsetX = 0, offsetY = -42, startRange = 6, endRange = 7, answerRange = 3, category = "numbersDots" },
				
				questions = { questionType1 = "Which 2 numbers add up to", questionType2 = "random", numAnswers = 2, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }	
				
		},
		-- game3 = {
				-- gameType = "question",
				-- nextWaypoint = true,				
				-- grayBGY = 140,
				-- question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65},
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { spacing = 60, scale = 1.4, offsetX = 0, offsetY = -42, startRange = 1, endRange = 4, answerRange = 2, category = "numbersDots" },
				
				-- questions = { questionType1 = "Which 2 numbers add up to", questionType2 = "random", numAnswers = 2, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }	
				
		-- },
		game3 = {
				gameType = "question",
				nextWaypoint = true,				
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 60, scale = 1.4, offsetX = 0, offsetY = -42, startRange = 4, endRange = 5, answerRange = 3, category = "numbersDots" },
				
				questions = { questionType1 = "Which 2 numbers add up to", questionType2 = "random", numAnswers = 2, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }	
				
		},
		game4 = {
				gameType = "question",
				nextWaypoint = true,				
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 49, scale = 1.15, offsetX = 0, offsetY = -42, startRange = 4, endRange = 9, answerRange = 4, category = "numbersDots" },
				
				questions = { questionType1 = "Which 2 numbers add up to", questionType2 = "random", numAnswers = 2, numChoices = 5, scattered = true, imageCount = 9, skip = 1 }	
				
		},
		game5 = {
				gameType = "question",
				nextWaypoint = true,				
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 75, scale = 1.75, offsetX = 0, offsetY = -42, startRange = 3, endRange = 4, answerRange = 2, category = "numbers"  },
				
				questions = { questionType1 = "Which 2 numbers add up to", questionType2 = "random", numAnswers = 2, numChoices = 3, scattered = true, imageCount = 9, skip = 1 }	
				
		},
		game6 = {
				gameType = "question",
				nextWaypoint = false,				
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 60, scale = 1.4, offsetX = 0, offsetY = -42, startRange = 7, endRange = 8, answerRange = 3, category = "numbers" },
				
				questions = { questionType1 = "Which 2 numbers add up to", questionType2 = "random", numAnswers = 2, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }	
				
		},
		-- game8 = {
				-- gameType = "question",
				-- nextWaypoint = true,				
				-- grayBGY = 140,
				-- question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65},
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { spacing = 60, scale = 1.4, offsetX = 0, offsetY = -42, startRange = 1, endRange = 4, answerRange = 2, category = "numbers" },
				
				-- questions = { questionType1 = "Which 2 numbers add up to", questionType2 = "random", numAnswers = 2, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }	
				
		-- },
		game7 = {
				gameType = "question",
				nextWaypoint = true,				
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 60, scale = 1.4, offsetX = 0, offsetY = -42, startRange = 4, endRange = 6, answerRange = 3, category = "numbers" },
				
				questions = { questionType1 = "Which 2 numbers add up to", questionType2 = "random", numAnswers = 2, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }	
				
		},
		game8 = {
				gameType = "question",
				nextWaypoint = true,				
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 49, scale = 1.15, offsetX = 0, offsetY = -42, startRange = 4, endRange = 9, answerRange = 4, category = "numbers" },
				
				questions = { questionType1 = "Which 2 numbers add up to", questionType2 = "random", numAnswers = 2, numChoices = 5, scattered = true, imageCount = 9, skip = 1 }	
				
		},
	},	
	
	level43 = { --Oliver
		game1 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 9},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game2 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 9},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game3 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 9},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game4 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = .85, offsetX = 0, offsetY = 3},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game5 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = .85, offsetX = 0, offsetY = 3},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game6 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = .85, offsetX = 0, offsetY = 3},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game7 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = .85, offsetX = 0, offsetY = 3},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game8 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = .85, offsetX = 0, offsetY = 3},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		
	},
	
	level44 = { --Pinkie Pig One to Five More
	
		game1 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.75, offsetX = 0, offsetY = -42, startRange = 1, endRange = 5, answerRange = 3, category = "numbers", spacing = 75 },
				questions = { questionType1 = "Which is", questionType2 = "more than", numAnswers = 1, numChoices = 2, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = "randomRange", skipMin = 1, skipMax = 5 }
		},	
		game2 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.75, offsetX = 0, offsetY = -42, startRange = 1, endRange = 5, answerRange = 3, category = "numbers", spacing = 75 },
				questions = { questionType1 = "Which is", questionType2 = "more than", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = "randomRange", skipMin = 1, skipMax = 5 }
		},	
		game3 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.4, offsetX = 0, offsetY = -42, startRange = 1, endRange = 4, answerRange = 3, category = "numbers", spacing = 60 },
				questions = { questionType1 = "Which is", questionType2 = "more than", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = "randomRange", skipMin = 1, skipMax = 5 }
		},	
		game4 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.75, offsetX = 0, offsetY = -42, startRange = 2, endRange = 5, answerRange = 3, category = "numbers", spacing = 75 },
				questions = { questionType1 = "Which is", questionType2 = "more than", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = "randomRange", skipMin = 1, skipMax = 5 }
		},	
		game5 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.4, offsetX = 0, offsetY = -42, startRange = 3, endRange = 5, answerRange = 3, category = "numbers", spacing = 60 },
				questions = { questionType1 = "Which is", questionType2 = "more than", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = "randomRange", skipMin = 1, skipMax = 5 }
		},	
		game6 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.75, offsetX = 0, offsetY = -42, startRange = 4, endRange = 5, answerRange = 3, category = "numbers", spacing = 75 },
				questions = { questionType1 = "Which is", questionType2 = "more than", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = "randomRange", skipMin = 1, skipMax = 5 }
		},	
	},
	
	level45 = { --Dudley Addition Mix Up
		
		game1 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 115,
				question = { line1 = "", line2 = "", spacing = 30, scale = .78, offsetX = 0, offsetY = -69},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .98, offsetX = 0, offsetY = 35, startRange = 3, endRange = 5, answerRange = 2, category = "apples" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game2 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 60, scale = 1.4, offsetX = 0, offsetY = -42, startRange = 25, endRange = 39, answerRange = 3, category = "numbers" },
				questions = { questionType1 = "Which is", questionType2 = "more than", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = 10, skipMin = 10, skipMax = 10 }
		},	
		game3 = {
				gameType = "question",
				nextWaypoint = true,				
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 60, scale = 1.4, offsetX = 0, offsetY = -42, startRange = 4, endRange = 7, answerRange = 3, category = "numbers" },
				
				questions = { questionType1 = "Which 2 numbers add up to", questionType2 = "random", numAnswers = 2, numChoices = 4, scattered = true, imageCount = 9, skip = 1 }	
				
		},
		game4 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 9},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game5 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 115,
				question = { line1 = "", line2 = "", spacing = 30, scale = .78, offsetX = 0, offsetY = -69},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .98, offsetX = 0, offsetY = 35, startRange = 4, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		
	
		game6 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = .85, offsetX = 0, offsetY = 3},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 3, answerRange = 2, category = "numbers" },
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game7 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 115,
				question = { line1 = "", line2 = "", spacing = 30, scale = .78, offsetX = 0, offsetY = -69},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .98, offsetX = 0, offsetY = 35, startRange = 4, endRange = 5, answerRange = 3, category = "numbers" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 1 }	
		},
		game8 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = .85, offsetX = 0, offsetY = 3},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 2, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game9 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = .85, offsetX = 0, offsetY = 3},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 5, answerRange = 3, category = "numbers" },
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 4, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		
	},
		
	level46 = { -- Daisy True or False Addition
	
		game1 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 106,				
				question = { line1 = "True or false?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1.1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 70, rotation = 90, scale = 1.30, offsetX = 0, offsetY = 33, startRange = 1, endRange = 5, category = "random" },
				questions = { questionType1 = "TrueOrFalse", questionType2 = "oneEquation", symbol = "+", numAnswers = 1, numChoices = 2, scattered = true, imageCount = 1, skip = 1 }		
		},
		game2 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 106,				
				question = { line1 = "True or false?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1.1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 70, rotation = 90, scale = 1.30, offsetX = 0, offsetY = 33, startRange = 1, endRange = 5, category = "random" },
				questions = { questionType1 = "TrueOrFalse", questionType2 = "oneEquation", symbol = "+", numAnswers = 1, numChoices = 2, scattered = true, imageCount = 1, skip = 1 }		
		},
		game3 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 106,				
				question = { line1 = "True or false?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1.1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 70, rotation = 90, scale = 1.30, offsetX = 0, offsetY = 33, startRange = 1, endRange = 5, category = "random" },
				questions = { questionType1 = "TrueOrFalse", questionType2 = "oneEquation", symbol = "+", numAnswers = 1, numChoices = 2, scattered = true, imageCount = 1, skip = 1 }		
		},
		game4 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 106,				
				question = { line1 = "True or false?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1.1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 70, rotation = 90, scale = 1.30, offsetX = 0, offsetY = 33, startRange = 1, endRange = 5, category = "random" },
				questions = { questionType1 = "TrueOrFalse", questionType2 = "oneEquation", symbol = "+", numAnswers = 1, numChoices = 2, scattered = true, imageCount = 1, skip = 1 }		
		},
		game5 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 106,				
				question = { line1 = "True or false?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1.1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 70, rotation = 90, scale = 1.30, offsetX = 0, offsetY = 33, startRange = 1, endRange = 5, category = "random" },
				questions = { questionType1 = "TrueOrFalse", questionType2 = "oneEquation", symbol = "+", numAnswers = 1, numChoices = 2, scattered = true, imageCount = 1, skip = 1 }		
		},
		game6 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 106,				
				question = { line1 = "True or false?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1.1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 70, rotation = 90, scale = 1.30, offsetX = 0, offsetY = 33, startRange = 1, endRange = 5, category = "random" },
				questions = { questionType1 = "TrueOrFalse", questionType2 = "oneEquation", symbol = "+", numAnswers = 1, numChoices = 2, scattered = true, imageCount = 1, skip = 1 }		
		},
		
		
	},

	level47 = { -- Chip Addition Word Problems
	
		game1 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 106,
				question = { line1 = "Solve the word problem.", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				equation = { scale = 0.8, offsetX = 0, offsetY = 0 },
				cards = { spacing = 48, scale = 1.25, offsetX = 0, offsetY = 34, startRange = 1, endRange = 3, category = "numbers" },
				questions = { questionType1 = "Word problem", questionType2 = "addition", numAnswers = 1, numChoices = 2, scattered = true, imageCount = 6, skip = 1 }	
		},
		game2 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 106,
				question = { line1 = "Solve the word problem.", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				equation = { scale = 0.8, offsetX = 0, offsetY = 0 },
				cards = { spacing = 48, scale = 1.25, offsetX = 0, offsetY = 34, startRange = 1, endRange = 4, category = "numbers" },
				questions = { questionType1 = "Word problem", questionType2 = "addition", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 6, skip = 1 }	
		},
		game3 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 106,
				question = { line1 = "Solve the word problem.", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				equation = { scale = 0.8, offsetX = 0, offsetY = 0 },
				cards = { spacing = 48, scale = 1.25, offsetX = 0, offsetY = 34, startRange = 2, endRange = 5, category = "numbers" },
				questions = { questionType1 = "Word problem", questionType2 = "addition", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 6, skip = 1 }	
		},
		game4 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 106,
				question = { line1 = "Solve the word problem.", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				equation = { scale = 0.8, offsetX = 0, offsetY = 0 },
				cards = { spacing = 48, scale = 1.25, offsetX = 0, offsetY = 34, startRange = 1, endRange = 4, category = "numbers" },
				questions = { questionType1 = "Word problem", questionType2 = "addition", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 6, skip = 1 }	
		},
		game5 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 106,
				question = { line1 = "Solve the word problem.", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				equation = { scale = 0.8, offsetX = 0, offsetY = 0 },
				cards = { spacing = 48, scale = 1.25, offsetX = 0, offsetY = 34, startRange = 2, endRange = 5, category = "numbers" },
				questions = { questionType1 = "Word problem", questionType2 = "addition", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 6, skip = 1 }	
		},
		game6 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 106,
				question = { line1 = "Solve the word problem.", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				equation = { scale = 0.8, offsetX = 0, offsetY = 0 },
				cards = { spacing = 48, scale = 1.25, offsetX = 0, offsetY = 34, startRange = 3, endRange = 5, category = "numbers" },
				questions = { questionType1 = "Word problem", questionType2 = "addition", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 6, skip = 1 }	
		},
		
	},
	
	level48 = { -- Chauncey Review 7 Addition Magician
		
		game1 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 115,
				question = { line1 = "", line2 = "", spacing = 30, scale = .78, offsetX = 0, offsetY = -69},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .96, offsetX = 0, offsetY = 35, startRange = 2, endRange = 5, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		
		game2 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 9},
				cards = { scale = .94, offsetX = 0, offsetY = 33, startRange = 3, endRange = 6, answerRange = 2, category = "numbersDots" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game3 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.75, offsetX = 0, offsetY = -42, startRange = 2, endRange = 7, answerRange = 3, category = "numbers", spacing = 75 },
				questions = { questionType1 = "Which is", questionType2 = "more than", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = "randomRange", skipMin = 1, skipMax = 5 }
		},	
		-- game5 = {
				-- gameType = "puzzleSlots",
				-- nextWaypoint = false, --false,
				-- grayBGY = 140,
				-- question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { scale = 1.25, offsetX = 0, offsetY = 60, startRange = 10, endRange = 60, answerRange = 2, category = "numbers" },
				
				-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 5, numChoices = 3, scattered = true, imageCount = "random", skip = "random", skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
				-- puzzle = { imageSet = "CardsClassic", number = "random", minRand = 10, maxRand = 60, incorrectChoices = 2, minSlotNum = 5, maxSlotNum = 5, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		-- },
		game4 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 3},
				cards = { scale = .94, offsetX = 0, offsetY = 33, startRange = 1, endRange = 6, answerRange = 2, category = "numbers" },
				
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game5 = {
				gameType = "question",
				nextWaypoint = true,				
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 49, scale = 1.15, offsetX = 0, offsetY = -42, startRange = 1, endRange = 8, answerRange = 4, category = "numbers" },
				
				questions = { questionType1 = "Which 2 numbers add up to", questionType2 = "random", numAnswers = 2, numChoices = 5, scattered = true, imageCount = 9, skip = 1 }	
				
		},
		game6 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 115,
				question = { line1 = "", line2 = "", spacing = 30, scale = .78, offsetX = 0, offsetY = -69},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .96, offsetX = 0, offsetY = 35, startRange = 1, endRange = 8, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many apples", questionType2 = "add", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game7 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = .85, offsetX = 0, offsetY = 3},
				cards = { scale = .94, offsetX = 0, offsetY = 33, startRange = 2, endRange = 9, answerRange = 2, category = "numbers" },
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		-- game9 = {
				-- gameType = "sequence",
				-- nextWaypoint = false,
				-- grayBGY = 110,
				-- question = { line1 = "What comes next?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				-- equation = { scale = .8, offsetX = 0, offsetY = 0 },
				-- cards = { spacing = 38.5, scale = .95, offsetX = 0, offsetY = 33, startRange = 10, endRange = 70, answerRange = 2, category = "numbers" },
				
				-- sequence = { numItems = 5, itemsScale = .9, itemsSpacing = 80, blankLocation = 5, placeMatch = 0, skip = 1, startNum = "random", patternLength = 1, order = "descending", numChoices = 3 }
		-- },
		game8 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = .85, offsetX = 0, offsetY = 3},
				cards = { scale = .94, offsetX = 0, offsetY = 33, startRange = 1, endRange = 9, answerRange = 2, category = "numbers" },
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game9 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 106,				
				question = { line1 = "True or false?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1.1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 70, rotation = 90, scale = 1.30, offsetX = 0, offsetY = 33, startRange = 1, endRange = 9, category = "random" },
				questions = { questionType1 = "TrueOrFalse", questionType2 = "oneEquation", symbol = "+", numAnswers = 1, numChoices = 2, scattered = true, imageCount = 1, skip = 1 }		
		},
		game10 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = .85, offsetX = 0, offsetY = 3},
				cards = { scale = .94, offsetX = 0, offsetY = 33, startRange = 1, endRange = 9, answerRange = 2, category = "numbers" },
				equations = { sign = "+", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game11 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 106,
				question = { line1 = "Solve the word problem.", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				equation = { scale = 0.8, offsetX = 0, offsetY = 0 },
				cards = { spacing = 48, scale = 1.25, offsetX = 0, offsetY = 34, startRange = 3, endRange = 9, category = "numbers" },
				questions = { questionType1 = "Word problem", questionType2 = "addition", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 6, skip = 1 }	
		},
		
	},
		
	level49 = { --Chloe Less Than
		game1 = {
				gameType = "basketGreaterLessThan",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .7, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 0, startRange = 3, endRange = 3, numStartRange = 1, numEndRange = 10, numCorrectMin = 1, numCorrectMax = 3, answerRange = 2, category = "numbers" },
				questions = { questionType1 = "basketGreaterLessThan", questionType2 = "less than", numAnswers = 1, numChoices = 5, scattered = true, numExtraMin = 1, numExtraMax = 2, imageCount = 4, skip = 1 }
		},
		game2 = {
				gameType = "basketGreaterLessThan",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .7, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 0, startRange = 4, endRange = 4, numStartRange = 5, numEndRange = 25, numCorrectMin = 2, numCorrectMax = 4, answerRange = 2, category = "numbers" },
				questions = { questionType1 = "basketGreaterLessThan", questionType2 = "less than", numAnswers = 1, numChoices = 4, scattered = true, numExtraMin = 1, numExtraMax = 2, imageCount = 4, skip = 1 }
		},
		game3 = {
				gameType = "basketGreaterLessThan",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .7, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 0, startRange = 4, endRange = 5, numStartRange = 5, numEndRange = 40, numCorrectMin = 2, numCorrectMax = 4, answerRange = 2, category = "numbers" },
				questions = { questionType1 = "basketGreaterLessThan", questionType2 = "less than", numAnswers = 1, numChoices = 5, scattered = true, numExtraMin = 1, numExtraMax = 2, imageCount = 4, skip = 1 }
		},
		game4 = {
				gameType = "basketGreaterLessThan",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .7, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 0, startRange = 5, endRange = 5, numStartRange = 10, numEndRange = 60, numCorrectMin = 2, numCorrectMax = 4, answerRange = 2, category = "numbers" },
				questions = { questionType1 = "basketGreaterLessThan", questionType2 = "less than", numAnswers = 1, numChoices = 5, scattered = true, numExtraMin = 1, numExtraMax = 2, imageCount = 4, skip = 1 }
		},
		game5 = {
				gameType = "basketGreaterLessThan",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .7, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 0, startRange = 3, endRange = 5, numStartRange = 10, numEndRange = 99, numCorrectMin = 2, numCorrectMax = 4, answerRange = 2, category = "numbers" },
				questions = { questionType1 = "basketGreaterLessThan", questionType2 = "less than", numAnswers = 1, numChoices = 4, scattered = true, numExtraMin = 1, numExtraMax = 2, imageCount = 4, skip = 1 }
		},
		game6 = {
				gameType = "basketGreaterLessThan",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .7, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 0, startRange = 3, endRange = 5, numStartRange = 10, numEndRange = 99, numCorrectMin = 2, numCorrectMax = 4, answerRange = 2, category = "numbers" },
				questions = { questionType1 = "basketGreaterLessThan", questionType2 = "less than", numAnswers = 1, numChoices = 5, scattered = true, numExtraMin = 1, numExtraMax = 2, imageCount = 4, skip = 1 }
		},
	},
		
	level50 = { -- Percival Take Away

		game1 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 115,
				question = { line1 = "", line2 = "", spacing = 30, scale = .78, offsetX = 0, offsetY = -69},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .98, offsetX = 0, offsetY = 35, startRange = 1, endRange = 3, answerRange = 2, category = "apples" },
				
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 2, scattered = true, imageCount = "random", skip = 1 }	
		},
		game2 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 115,
				question = { line1 = "", line2 = "", spacing = 30, scale = .78, offsetX = 0, offsetY = -69},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .98, offsetX = 0, offsetY = 35, startRange = 2, endRange = 4, answerRange = 2, category = "apples" },
				
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game3 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 115,
				question = { line1 = "", line2 = "", spacing = 30, scale = .78, offsetX = 0, offsetY = -69},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .98, offsetX = 0, offsetY = 35, startRange = 2, endRange = 4, answerRange = 2, category = "numbersDots" },
				
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game4 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 115,
				question = { line1 = "", line2 = "", spacing = 30, scale = .78, offsetX = 0, offsetY = -69},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .98, offsetX = 0, offsetY = 35, startRange = 1, endRange = 5, answerRange = 2, category = "apples" },
				
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game5 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 115,
				question = { line1 = "", line2 = "", spacing = 30, scale = .78, offsetX = 0, offsetY = -69},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .98, offsetX = 0, offsetY = 35, startRange = 1, endRange = 6, answerRange = 2, category = "numbersDots" },
				
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		
		game6 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 115,
				question = { line1 = "", line2 = "", spacing = 30, scale = .78, offsetX = 0, offsetY = -69},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .98, offsetX = 0, offsetY = 35, startRange = 1, endRange = 5, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game7  = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 115,
				question = { line1 = "", line2 = "", spacing = 30, scale = .78, offsetX = 0, offsetY = -69},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .98, offsetX = 0, offsetY = 35, startRange = 1, endRange = 7, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
	},
	
	level51 = { -- Chloe
		game1 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 75, scale = 1.75, offsetX = 0, offsetY = -42, startRange = 1, endRange = 30, answerRange = 3, category = "numbers" },
				questions = { questionType1 = "Which is", questionType2 = "less than", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = 10, skipMin = 10, skipMax = 10 }
		},	
		game2 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 75, scale = 1.75, offsetX = 0, offsetY = -42, startRange = 25, endRange = 45, answerRange = 3, category = "numbers" },
				questions = { questionType1 = "Which is", questionType2 = "less than", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = 10, skipMin = 10, skipMax = 10 }
		},	
		game3 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 60, scale = 1.4, offsetX = 0, offsetY = -42, startRange = 11, endRange = 34, answerRange = 3, category = "numbers" },
				questions = { questionType1 = "Which is", questionType2 = "less than", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = 10, skipMin = 10, skipMax = 10 }
		},	
		game4 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 75, scale = 1.75, offsetX = 0, offsetY = -42, startRange = 40, endRange = 80, answerRange = 3, category = "numbers" },
				questions = { questionType1 = "Which is", questionType2 = "less than", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = 10, skipMin = 10, skipMax = 10 }
		},	
		game5 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 60, scale = 1.4, offsetX = 0, offsetY = -42, startRange = 25, endRange = 49, answerRange = 3, category = "numbers" },
				questions = { questionType1 = "Which is", questionType2 = "less than", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = 10, skipMin = 10, skipMax = 10 }
		},	
		game6 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 75, scale = 1.75, offsetX = 0, offsetY = -42, startRange = 71, endRange = 95, answerRange = 3, category = "numbers" },
				questions = { questionType1 = "Which is", questionType2 = "less than", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = 10, skipMin = 10, skipMax = 10 }
		},	
		game7 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 60, scale = 1.4, offsetX = 0, offsetY = -42, startRange = 10, endRange = 95, answerRange = 3, category = "numbers" },
				questions = { questionType1 = "Which is", questionType2 = "less than", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = 10, skipMin = 10, skipMax = 10 }
		},	
		game8 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 60, scale = 1.4, offsetX = 0, offsetY = -42, startRange = 10, endRange = 95, answerRange = 3, category = "numbers" },
				questions = { questionType1 = "Which is", questionType2 = "less than", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = 10, skipMin = 10, skipMax = 10 }
		},	
	},
		
	level52 = { --Percival The Puppy: Counting to 10
		game1 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 9},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 3, answerRange = 2, category = "numbersDots" },
				
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 2, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game2 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 9},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game3 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 9},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 3, answerRange = 3, category = "numbersDots" },
				
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 4, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game4 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 9},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game5 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 9},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 2, endRange = 5, answerRange = 3, category = "numbersDots" },
				
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 4, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game6 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 9},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
	},
		
	level53 = { -- Ralphie One to Five Less
		game1 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 75, scale = 1.75, offsetX = 0, offsetY = -42, startRange = 1, endRange = 5, answerRange = 4, category = "numbers" },
				
				questions = { questionType1 = "Which is", questionType2 = "less than", numAnswers = 1, numChoices = 2, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = "randomRange", skipMin = 1, skipMax = 5 }
		},	
		game2 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 75, scale = 1.75, offsetX = 0, offsetY = -42, startRange = 1, endRange = 5, answerRange = 4, category = "numbers" },
				
				questions = { questionType1 = "Which is", questionType2 = "less than", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = "randomRange", skipMin = 1, skipMax = 5 }
		},	
		game3 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 75, scale = 1.75, offsetX = 0, offsetY = -42, startRange = 1, endRange = 5, answerRange = 4, category = "numbers" },
				
				questions = { questionType1 = "Which is", questionType2 = "less than", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = "randomRange", skipMin = 1, skipMax = 5 }
		},	
		game4 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 60, scale = 1.4, offsetX = 0, offsetY = -42, startRange = 1, endRange = 5, answerRange = 4, category = "numbers" },
				
				questions = { questionType1 = "Which is", questionType2 = "less than", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = "randomRange", skipMin = 1, skipMax = 5 }
		},	
		game5 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 75, scale = 1.75, offsetX = 0, offsetY = -42, startRange = 1, endRange = 5, answerRange = 4, category = "numbers" },
				
				questions = { questionType1 = "Which is", questionType2 = "less than", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = "randomRange", skipMin = 1, skipMax = 5 }
		},	
		game6 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 60, scale = 1.4, offsetX = 0, offsetY = -42, startRange = 1, endRange = 5, answerRange = 4, category = "numbers" },
				
				questions = { questionType1 = "Which is", questionType2 = "less than", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = "randomRange", skipMin = 1, skipMax = 5 }
		},	
	},
		
	level54 = { --Cordelia Subtraction Mix Up
		game1 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 115,
				question = { line1 = "", line2 = "", spacing = 30, scale = .78, offsetX = 0, offsetY = -69},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .98, offsetX = 0, offsetY = 35, startRange = 1, endRange = 5, answerRange = 4, category = "apples" },
				
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		-- game1 = {
				-- gameType = "question",
				-- nextWaypoint = true,
				-- grayBGY = 115,
				-- question = { line1 = "", line2 = "", spacing = 30, scale = .78, offsetX = 0, offsetY = -69},
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { scale = .98, offsetX = 0, offsetY = 35, startRange = 2, endRange = 5, answerRange = 2, category = "apples" },
				
				-- questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		-- },
		game2 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
			cards = { spacing = 75, scale = 1.75, offsetX = 0, offsetY = -42, startRange = 1, endRange = 5, answerRange = 3, category = "numbers" },
				
				questions = { questionType1 = "Which is", questionType2 = "less than", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = "randomRange", skipMin = 1, skipMax = 5 }
		},	
		game3 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 9},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 6, answerRange = 2, category = "numbersDots" },
				
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game4 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 115,
				question = { line1 = "", line2 = "", spacing = 30, scale = .78, offsetX = 0, offsetY = -69},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .98, offsetX = 0, offsetY = 35, startRange = 1, endRange = 8, answerRange = 3, category = "numbers" },
				
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 4, scattered = true, imageCount = "random", skip = 1 }	
		},
		game5 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 75, scale = 1.75, offsetX = 0, offsetY = -42, startRange = 4, endRange = 50, answerRange = 3, category = "numbers" },
				
				questions = { questionType1 = "Which is", questionType2 = "less than", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = "randomRange", skipMin = 1, skipMax = 5 }
		},	
		game6 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 9},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 8, answerRange = 3, category = "numbersDots" },
				
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 4, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game7 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = .85, offsetX = 0, offsetY = 3},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 6, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game8 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = .85, offsetX = 0, offsetY = 3},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 10, answerRange = 3, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 4, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		
	},	
		
	level55 = { --Sunshine subtraction equations
		game1 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 9},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 6, answerRange = 2, category = "numbersDots" },
				
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game2 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 9},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 7, answerRange = 2, category = "numbersDots" },
				
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game3 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 9},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 7, answerRange = 2, category = "numbersDots" },
				
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game4 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = .85, offsetX = 0, offsetY = 3},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 8, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game5 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = .85, offsetX = 0, offsetY = 3},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 9, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game6 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = .85, offsetX = 0, offsetY = 3},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 7, answerRange = 3, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 4, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game7 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = .85, offsetX = 0, offsetY = 3},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 8, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game8 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = .85, offsetX = 0, offsetY = 3},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 9, answerRange = 3, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 4, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		
		
	},
		
	level56 = { --Oliver Subtraction Word Problems
		game1 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 106,
				question = { line1 = "Solve the word problem.", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				equation = { scale = 0.8, offsetX = 0, offsetY = 0 },
				cards = { spacing = 48, scale = 1.25, offsetX = 0, offsetY = 34, startRange = 1, endRange = 3, category = "numbers" },
				questions = { questionType1 = "Word problem", questionType2 = "subtraction", numAnswers = 1, numChoices = 2, scattered = true, imageCount = 6, skip = 1 }	
		},
		game2 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 106,
				question = { line1 = "Solve the word problem.", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				equation = { scale = 0.8, offsetX = 0, offsetY = 0 },
				cards = { spacing = 48, scale = 1.25, offsetX = 0, offsetY = 34, startRange = 1, endRange = 4, category = "numbers" },
				questions = { questionType1 = "Word problem", questionType2 = "subtraction", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 6, skip = 1 }	
		},
		game3 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 106,
				question = { line1 = "Solve the word problem.", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				equation = { scale = 0.8, offsetX = 0, offsetY = 0 },
				cards = { spacing = 48, scale = 1.25, offsetX = 0, offsetY = 34, startRange = 2, endRange = 5, category = "numbers" },
				questions = { questionType1 = "Word problem", questionType2 = "subtraction", numAnswers = 1, numChoices = 2, scattered = true, imageCount = 6, skip = 1 }	
		},
		game4 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 106,
				question = { line1 = "Solve the word problem.", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				equation = { scale = 0.8, offsetX = 0, offsetY = 0 },
				cards = { spacing = 48, scale = 1.25, offsetX = 0, offsetY = 34, startRange = 1, endRange = 4, category = "numbers" },
				questions = { questionType1 = "Word problem", questionType2 = "subtraction", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 6, skip = 1 }	
		},
		game5 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 106,
				question = { line1 = "Solve the word problem.", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				equation = { scale = 0.8, offsetX = 0, offsetY = 0 },
				cards = { spacing = 48, scale = 1.25, offsetX = 0, offsetY = 34, startRange = 2, endRange = 5, category = "numbers" },
				questions = { questionType1 = "Word problem", questionType2 = "subtraction", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 6, skip = 1 }	
		},
		game6 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 106,
				question = { line1 = "Solve the word problem.", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				equation = { scale = 0.8, offsetX = 0, offsetY = 0 },
				cards = { spacing = 48, scale = 1.25, offsetX = 0, offsetY = 34, startRange = 3, endRange = 5, category = "numbers" },
				questions = { questionType1 = "Word problem", questionType2 = "subtraction", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 6, skip = 1 }	
		},
		
	},
		
		
	level57 = { --Oleg Action Subtraction
		game1 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 115,
				question = { line1 = "", line2 = "", spacing = 30, scale = .78, offsetX = 0, offsetY = -69},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .96, offsetX = 0, offsetY = 35, startRange = 2, endRange = 8, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		
		game2 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 9},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 8, answerRange = 2, category = "numbersDots" },
				
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game3 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.75, offsetX = 0, offsetY = -42, startRange = 5, endRange = 25, answerRange = 3, category = "numbers", spacing = 75 },
				questions = { questionType1 = "Which is", questionType2 = "less than", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = "randomRange", skipMin = 1, skipMax = 5 }
		},	
		-- game5 = {
				-- gameType = "puzzleSlots",
				-- nextWaypoint = false, --false,
				-- grayBGY = 140,
				-- question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { scale = 1.25, offsetX = 0, offsetY = 60, startRange = 10, endRange = 60, answerRange = 2, category = "numbers" },
				
				-- questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 5, numChoices = 3, scattered = true, imageCount = "random", skip = "random", skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
				-- puzzle = { imageSet = "CardsClassic", number = "random", minRand = 10, maxRand = 60, incorrectChoices = 2, minSlotNum = 5, maxSlotNum = 5, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		-- },
		game4 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 0.85, offsetX = 0, offsetY = 9},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 6, answerRange = 2, category = "numbers" },
				
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		
		-- game5 = {
				-- gameType = "question",
				-- nextWaypoint = true,
				-- grayBGY = 115,
				-- question = { line1 = "", line2 = "", spacing = 30, scale = .78, offsetX = 0, offsetY = -69},
				-- equation = { scale = 1, offsetX = 0, offsetY = 0 },
				-- cards = { scale = .96, offsetX = 0, offsetY = 35, startRange = 1, endRange = 8, answerRange = 2, category = "numbers" },
				
				-- questions = { questionType1 = "How many apples", questionType2 = "subtracct", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		-- },
		game5 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 115,
				question = { line1 = "", line2 = "", spacing = 30, scale = .78, offsetX = 0, offsetY = -69},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .96, offsetX = 0, offsetY = 35, startRange = 1, endRange = 8, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game6 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = .85, offsetX = 0, offsetY = 3},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 2, endRange = 9, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		-- game9 = {
				-- gameType = "sequence",
				-- nextWaypoint = false,
				-- grayBGY = 110,
				-- question = { line1 = "What comes next?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				-- equation = { scale = .8, offsetX = 0, offsetY = 0 },
				-- cards = { spacing = 38.5, scale = .95, offsetX = 0, offsetY = 33, startRange = 10, endRange = 70, answerRange = 2, category = "numbers" },
				
				-- sequence = { numItems = 5, itemsScale = .9, itemsSpacing = 80, blankLocation = 5, placeMatch = 0, skip = 1, startNum = "random", patternLength = 1, order = "descending", numChoices = 3 }
		-- },
		game7 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = .85, offsetX = 0, offsetY = 3},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 9, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game8 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 106,				
				question = { line1 = "True or false?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1.1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 70, rotation = 90, scale = 1.30, offsetX = 0, offsetY = 33, startRange = 1, endRange = 9, category = "random" },
				questions = { questionType1 = "TrueOrFalse", questionType2 = "oneEquation", symbol = "-", numAnswers = 1, numChoices = 2, scattered = true, imageCount = 1, skip = 1 }		
		},
		game9 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = .85, offsetX = 0, offsetY = 3},
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 1, endRange = 9, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game10 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 106,
				question = { line1 = "Solve the word problem.", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -66 },
				equation = { scale = 0.8, offsetX = 0, offsetY = 0 },
				cards = { spacing = 48, scale = 1.25, offsetX = 0, offsetY = 34, startRange = 3, endRange = 9, category = "numbers" },
				questions = { questionType1 = "Word problem", questionType2 = "subtraction", numAnswers = 1, numChoices = 4, scattered = true, imageCount = 6, skip = 1 }	
		},
		
	},
		
		
		
	--[[
		
	level51 = { -- Chloe Puzzling Numbers
		game1 = {
				gameType = "puzzle",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 2, endRange = 7, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 },
				puzzle = { imageSet = "Numbers", typeSet = "Color", number = "random", minRand = 2, maxRand = 7, maskSet = 3, otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "slotAlpha", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
			},
		game2 = {
				gameType = "puzzleSlots",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -36 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.3, offsetX = 0, offsetY = 50, startRange = 50, endRange = 50, answerRange = 10, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 3, scattered = true, imageCount = "random", skip = 5, skipPattern = "", startNum = "", order = "ascending" },
				puzzle = { imageSet = "", number = "random", minRand = 2, maxRand = 7, incorrectChoices = 0, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		

				
		},
		game3 = {
				gameType = "puzzleSlots",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -36 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 8, endRange = 15, answerRange = 10, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 3, scattered = true, imageCount = "random", skip = 1, skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
				puzzle = { imageSet = "CardsPutInOrder", number = "random", minRand = 8, maxRand = 15, incorrectChoices = 0, minSlotNum = 5, maxSlotNum = 5, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		

				
		},
		game4 = {
				gameType = "puzzle",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 8, answerRange = 10, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 },
				puzzle = { imageSet = "Numbers", typeSet = "Color", number = "random", minRand = 8, maxRand = 10, maskSet = 3, otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "slotAlpha", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
			},
		game5 = {
				gameType = "puzzleSlots",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -36 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 12, endRange = 17, answerRange = 10, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 3, scattered = true, imageCount = "random", skip = 1, skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
				puzzle = { imageSet = "CardsPutInOrder", number = "random", minRand = 12, maxRand = 17, incorrectChoices = 0, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		

				
		},
		game6 = {
				gameType = "puzzleSlots",
				nextWaypoint = true, --false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = .9, offsetX = 0, offsetY = -36 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 12, endRange = 17, answerRange = 10, category = "numbers" },
				
				questions = { questionType1 = "How many", questionType2 = "random", numAnswers = 4, numChoices = 3, scattered = true, imageCount = "random", skip = 1, skipPattern = "", startNum = "", placeMatch = 0, order = "ascending" },
				puzzle = { imageSet = "CardsPutInOrder", number = "random", minRand = 16, maxRand = 20, incorrectChoices = 0, minSlotNum = 4, maxSlotNum = 4, maskSet = "random", otherSlot = "", slotColor = { 1, 1, 1 }, slotAlpha = 1, bgSlot = "", bgSlotColor = { 0, 0, 0 }, bgSlotAlpha = 0.075 },
		

				
		},
	},
		
	level52 = { --Oleg: Count 'em Out

		game1 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 8, endRange = 14, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 6, skip = 1, showGreen = true, showYellow = false }
		},
		game2 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 7, endRange = 12, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 6, skip = 1, showGreen = true, showYellow = false }
		},
		game3 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 6, endRange = 12, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 8, skip = 1, showGreen = true, showYellow = true }
		},
		game4 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 10, endRange = 15, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 8, skip = 1, showGreen = true, showYellow = true }
		},
		
		game5 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 7, endRange = 20, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 10, skip = 1, showGreen = true, showYellow = true }
		},
		game6 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 10, endRange = 20, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 10, skip = 1, showGreen = true, showYellow = true }
		},
		game7 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 15, endRange = 20, answerRange = 1, category = "numbers" },
				
				questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = false, imageCount = 12, skip = 1, showGreen = true, showYellow = true }
		},
		game8 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 3, endRange = 20, answerRange = 1, category = "numbers" },
				
				questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = false, imageCount = 12, skip = 1, showGreen = true, showYellow = true }
		},
		
		game9 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 5, endRange = 20, answerRange = 1, category = "numbers" },
				
				questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = false, imageCount = 14, skip = 1, showGreen = true, showYellow = true }
		},
		game10 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 8, endRange = 20, answerRange = 1, category = "numbers" },
				
				questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = false, imageCount = 14, skip = 1, showGreen = true, showYellow = true }
		},
		game11 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 8, endRange = 20, answerRange = 1, category = "numbers" },
				
				questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = false, imageCount = 18, skip = 1, showGreen = true, showYellow = true }
		},
		game12 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = 33, startRange = 8, endRange = 20, answerRange = 1, category = "numbers" },
				
				questions = { questionType1 = "How many are", questionType2 = "random", numAnswers = 1, numChoices = 3, scattered = false, imageCount = 18, skip = 1, showGreen = true, showYellow = true }
		},
		
	},
	
	
	
	level53 = { -- Ralphie What comes next
		game1 = {
				gameType = "sequence",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "What comes next?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 42, scale = .95, offsetX = 0, offsetY = 33, startRange = 4, endRange = 7, answerRange = 2, category = "numbers" },
				
				sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 80, blankLocation = 4, placeMatch = 0, skip = 1, startNum = "random", patternLength = 1, order = "descending", numChoices = 3 }
		},
		game2 = {
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 42, scale = .95, offsetX = 0, offsetY = 33, startRange = 5, endRange = 9, answerRange = 2, category = "numbers" },
				
				sequence = { numItems = 5, itemsScale = .875, itemsSpacing = 80, blankLocation = 5, placeMatch = 0, skip = 1, startNum = "random", patternLength = 1, order = "descending", numChoices = 3 }
		},
		game3 = {
				gameType = "sequence",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "What comes next?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = .8, offsetX = 0, offsetY = 0 },
				cards = { spacing = 42, scale = .95, offsetX = 0, offsetY = 33, startRange = 10, endRange = 14, answerRange = 2, category = "numbers" },
				
				sequence = { numItems = 5, itemsScale = .9, itemsSpacing = 80, blankLocation = 5, placeMatch = 0, skip = 1, startNum = "random", patternLength = 1, order = "descending", numChoices = 3 }
		},
		game4 = {
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = .8, offsetX = 0, offsetY = 0 },
				cards = { spacing = 42, scale = .95, offsetX = 0, offsetY = 33, startRange = 14, endRange = 20, answerRange = 2, category = "numbers" },
				
				sequence = { numItems = 5, itemsScale = .9, itemsSpacing = 80, blankLocation = 5, placeMatch = 0, skip = 1, startNum = "random", patternLength = 1, order = "descending", numChoices = 3 }
		},
		game5 = {
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What comes next?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 42, scale = .95, offsetX = 0, offsetY = 33, startRange = 10, endRange = 16, answerRange = 2, category = "numbers" },
				
				sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 80, blankLocation = 4, placeMatch = 0, skip = 1, startNum = "random", patternLength = 1, order = "descending", numChoices = 3 }
		},
		
		game6 = {
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What comes next?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 42, scale = .95, offsetX = 0, offsetY = 33, startRange = 8, endRange = 20, answerRange = 2, category = "numbers" },
				
				sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 80, blankLocation = 4, placeMatch = 0, skip = 1, startNum = "random", patternLength = 1, order = "descending", numChoices = 3 }
		},
		game7 = {
				gameType = "sequence",
				nextWaypoint = false,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = .8, offsetX = 0, offsetY = 0 },
				cards = { spacing = 42, scale = .95, offsetX = 0, offsetY = 33, startRange = 8, endRange = 20, answerRange = 2, category = "numbers" },
				
				sequence = { numItems = 5, itemsScale = .9, itemsSpacing = 80, blankLocation = 5, placeMatch = 0, skip = 1, startNum = "random", patternLength = 1, order = "descending", numChoices = 3 }
		},
		game8 = {
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What comes next?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 42, scale = .95, offsetX = 0, offsetY = 33, startRange = 8, endRange = 20, answerRange = 2, category = "numbers" },
				
				sequence = { numItems = 4, itemsScale = .875, itemsSpacing = 90, blankLocation = 4, placeMatch = 0, skip = 1, startNum = "random", patternLength = 1, order = "descending", numChoices = 3 }
		},
		game9 = {
				gameType = "sequence",
				nextWaypoint = true,
				grayBGY = 110,
				question = { line1 = "What's missing?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -67 },
				equation = { scale = .8, offsetX = 0, offsetY = 0 },
				cards = { spacing = 42, scale = .95, offsetX = 0, offsetY = 33, startRange = 10, endRange = 20, answerRange = 2, category = "numbers" },
				sequence = { numItems = 5, itemsScale = .9, itemsSpacing = 90, blankLocation = 5, placeMatch = 0, skip = 1, startNum = "random", patternLength = 1, order = "descending", numChoices = 3 }
		}
	},
		
	level54 = { -- Chip One Less
		game1 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.75, offsetX = 0, offsetY = -42, startRange = 1, endRange = 10, answerRange = 3, category = "numbers", spacing = 75 },
				questions = { questionType1 = "Which is", questionType2 = "less than", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = 1, skipMin = 1, skipMax = 5 }
		},	
		game2 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.75, offsetX = 0, offsetY = -42, startRange = 1, endRange = 33, answerRange = 3, category = "numbers", spacing = 75 },
				questions = { questionType1 = "Which is", questionType2 = "less than", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = 1, skipMin = 1, skipMax = 5 }
		},	
		game3 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.75, offsetX = 0, offsetY = -42, startRange = 11, endRange = 40, answerRange = 3, category = "numbers", spacing = 75 },
				questions = { questionType1 = "Which is", questionType2 = "less than", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = 1, skipMin = 1, skipMax = 5 }
		},	
		game4 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.75, offsetX = 0, offsetY = -42, startRange = 11, endRange = 50, answerRange = 3, category = "numbers", spacing = 75 },
				questions = { questionType1 = "Which is", questionType2 = "less than", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = 1, skipMin = 1, skipMax = 5 }
		},	
		game5 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.75, offsetX = 0, offsetY = -42, startRange = 25, endRange = 98, answerRange = 3, category = "numbers" , spacing = 75},
				questions = { questionType1 = "Which is", questionType2 = "less than", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = 1, skipMin = 1, skipMax = 5 }
		},	
		game6 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1.75, offsetX = 0, offsetY = -42, startRange = 25, endRange = 98, answerRange = 3, category = "numbers", spacing = 75 },
				questions = { questionType1 = "Which is", questionType2 = "less than", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = 1, skipMin = 1, skipMax = 5 }
		},	
	},
		
	
	level55 = { --Percival The Puppy:
		game1 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = 1, offsetX = 0, offsetY = -42, startRange = 1, endRange = 98, answerRange = 3, category = "numbers" },
				questions = { questionType1 = "Which is", questionType2 = "less than", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = 1, skipMin = 1, skipMax = 5 }
		},	
		game2 = {
				gameType = "question",
				nextWaypoint = true,				
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = -50, startRange = 1, endRange = 5, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "Which 2 numbers add up to", questionType2 = "random", numAnswers = 2, numChoices = 3, scattered = true, imageCount = 9, skip = 1 }	
				
		},
		game3 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 115,
				question = { line1 = "", line2 = "", spacing = 30, scale = .78, offsetX = 0, offsetY = -69},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .98, offsetX = 0, offsetY = 35, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 2, scattered = true, imageCount = "random", skip = 1 }	
		},
		game4 = {
				gameType = "question",
				nextWaypoint = false,				
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = -50, startRange = 1, endRange = 5, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "Which 2 numbers add up to", questionType2 = "random", numAnswers = 2, numChoices = 3, scattered = true, imageCount = 9, skip = 1 }	
				
		},
		game5 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 106,				
				question = { line1 = "True or false?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1.1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 70, rotation = 90, scale = 1.30, offsetX = 0, offsetY = 33, startRange = 1, endRange = 5, category = "random" },
				questions = { questionType1 = "TrueOrFalse", questionType2 = "oneEquation", symbol = "+", numAnswers = 1, numChoices = 2, scattered = true, imageCount = 1, skip = 1 }		
		},
		game6 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 75, scale = 1.75, offsetX = 0, offsetY = -42, startRange = 1, endRange = 5, answerRange = 3, category = "numbers" },
				
				questions = { questionType1 = "Which is", questionType2 = "more than", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = "randomRange", skipMin = 1, skipMax = 5 }
		},	
		game7 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 75, scale = 1.75, offsetX = 0, offsetY = -42, startRange = 1, endRange = 98, answerRange = 3, category = "numbers" },
				
				questions = { questionType1 = "Which is", questionType2 = "less than", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = 1, skipMin = 1, skipMax = 5 }
		},	
		game8 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 115,
				question = { line1 = "", line2 = "", spacing = 30, scale = .78, offsetX = 0, offsetY = -69},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .98, offsetX = 0, offsetY = 35, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 2, scattered = true, imageCount = "random", skip = 1 }	
		},
		game9 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,				
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 75, scale = 1.75, offsetX = 0, offsetY = -42, startRange = 1, endRange = 5, answerRange = 3, category = "numbers" },
				
				questions = { questionType1 = "Which is", questionType2 = "more than", numAnswers = 1, numChoices = 3, scattered = true, imageCount = 9, placeMatch = 0, placeMatch = 0, skip = "randomRange", skipMin = 1, skipMax = 5 }
		},	
		game10 = {
				gameType = "question",
				nextWaypoint = false,				
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -65},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .95, offsetX = 0, offsetY = -50, startRange = 1, endRange = 5, answerRange = 2, category = "numbers" },
				
				questions = { questionType1 = "Which 2 numbers add up to", questionType2 = "random", numAnswers = 2, numChoices = 3, scattered = true, imageCount = 9, skip = 1 }	
				
		},
		game11 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 106,				
				question = { line1 = "True or false?", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -66 },
				equation = { scale = 1.1, offsetX = 0, offsetY = 0 },
				cards = { spacing = 70, rotation = 90, scale = 1.30, offsetX = 0, offsetY = 33, startRange = 1, endRange = 5, category = "random" },
				questions = { questionType1 = "TrueOrFalse", questionType2 = "oneEquation", symbol = "+", numAnswers = 1, numChoices = 2, scattered = true, imageCount = 1, skip = 1 }		
		},
		
	},
	
	
	--]]
	
	
	
		
	
		
	
	
		
		
	
		
		
	-- REPEATED LEVELS -- 
		
		
	level58 = { --Pete the Frog: Subtraction to 5
		game1 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 115,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .98, offsetX = 0, offsetY = 35, startRange = 1, endRange = 3, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game2 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 115,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .98, offsetX = 0, offsetY = 35, startRange = 1, endRange = 4, answerRange = 2, category = "numbersDots" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game3 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 9},
				cards = { scale = .85, offsetX = 0, offsetY = 35, startRange = 1, endRange = 3, answerRange = 2, category = "numbersDots" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game4 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 115,
				question = { line1 = "", line2 = "", spacing = 35, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .98, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game5 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 115,
				question = { line1 = "", line2 = "", spacing = 35, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .98, offsetX = 0, offsetY = 50, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game6 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 9},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 0, endRange = 3, answerRange = 2, category = "numbersDots" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game7 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 115,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .98, offsetX = 0, offsetY = 35, startRange = 2, endRange = 5, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game8 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 115,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .98, offsetX = 0, offsetY = 35, startRange = 1, endRange = 5, answerRange = 2, category = "numbersDots" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game9 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 5},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		game10 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 115,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .98, offsetX = 0, offsetY = 35, startRange = 1, endRange = 5, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game11 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 115,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .98, offsetX = 0, offsetY = 35, startRange = 1, endRange = 5, answerRange = 2, category = "numbers" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game12 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 4},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 0, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game13 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 4},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 2, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		game14 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 4},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 0, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		
	},
	
	level59 = { --Pete the Frog: Subtraction to 5
		game1 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 3, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game2 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 4, answerRange = 2, category = "numbersDots" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game3 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 9},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 1, endRange = 3, answerRange = 2, category = "numbersDots" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game4 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game5 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game6 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 9},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 0, endRange = 3, answerRange = 2, category = "numbersDots" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game7 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 2, endRange = 5, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game8 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "numbersDots" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game9 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 5},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		game10 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game11 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "numbers" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game12 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 4},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 0, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game13 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 4},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 2, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		game14 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 4},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 0, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		
	},
		
	level60 = { --Pete the Frog: Subtraction to 5
		game1 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 3, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game2 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 4, answerRange = 2, category = "numbersDots" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game3 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 9},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 1, endRange = 3, answerRange = 2, category = "numbersDots" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game4 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game5 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game6 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 9},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 0, endRange = 3, answerRange = 2, category = "numbersDots" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game7 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 2, endRange = 5, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game8 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "numbersDots" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game9 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 5},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		game10 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game11 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "numbers" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game12 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 4},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 0, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game13 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 4},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 2, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		game14 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 4},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 0, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		
	},
		
	level61 = { --Pete the Frog: Subtraction to 5
		game1 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 3, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game2 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 4, answerRange = 2, category = "numbersDots" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game3 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 9},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 1, endRange = 3, answerRange = 2, category = "numbersDots" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game4 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game5 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game6 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 9},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 0, endRange = 3, answerRange = 2, category = "numbersDots" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game7 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 2, endRange = 5, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game8 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "numbersDots" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game9 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 5},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		game10 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game11 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "numbers" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game12 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 4},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 0, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game13 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 4},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 2, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		game14 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 4},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 0, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		
	},
		
	level62 = { --Pete the Frog: Subtraction to 5
		game1 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 3, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game2 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 4, answerRange = 2, category = "numbersDots" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game3 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 9},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 1, endRange = 3, answerRange = 2, category = "numbersDots" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game4 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game5 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game6 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 9},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 0, endRange = 3, answerRange = 2, category = "numbersDots" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game7 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 2, endRange = 5, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game8 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "numbersDots" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game9 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 5},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		game10 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game11 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "numbers" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game12 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 4},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 0, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game13 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 4},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 2, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		game14 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 4},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 0, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		
	},
		
	level63 = { --Pete the Frog: Subtraction to 5
		game1 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 3, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game2 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 4, answerRange = 2, category = "numbersDots" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game3 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 9},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 1, endRange = 3, answerRange = 2, category = "numbersDots" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game4 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game5 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game6 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 9},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 0, endRange = 3, answerRange = 2, category = "numbersDots" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game7 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 2, endRange = 5, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game8 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "numbersDots" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game9 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 5},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		game10 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game11 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "numbers" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game12 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 4},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 0, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game13 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 4},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 2, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		game14 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 4},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 0, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		
	},
		
	level64 = { --Pete the Frog: Subtraction to 5
		game1 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 3, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game2 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 4, answerRange = 2, category = "numbersDots" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game3 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 9},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 1, endRange = 3, answerRange = 2, category = "numbersDots" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game4 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game5 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game6 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 9},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 0, endRange = 3, answerRange = 2, category = "numbersDots" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game7 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 2, endRange = 5, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game8 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "numbersDots" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game9 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 5},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		game10 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game11 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "numbers" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game12 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 4},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 0, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game13 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 4},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 2, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		game14 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 4},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 0, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		
	},
		
	level65 = { --Pete the Frog: Subtraction to 5
		game1 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 3, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game2 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 4, answerRange = 2, category = "numbersDots" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game3 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 9},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 1, endRange = 3, answerRange = 2, category = "numbersDots" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game4 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game5 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game6 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 9},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 0, endRange = 3, answerRange = 2, category = "numbersDots" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game7 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 2, endRange = 5, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game8 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "numbersDots" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game9 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 5},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		game10 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game11 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "numbers" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game12 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 4},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 0, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game13 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 4},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 2, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		game14 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 4},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 0, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		
	},
		
	level66 = { --Pete the Frog: Subtraction to 5
		game1 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 3, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game2 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 4, answerRange = 2, category = "numbersDots" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game3 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 9},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 1, endRange = 3, answerRange = 2, category = "numbersDots" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game4 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game5 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game6 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 9},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 0, endRange = 3, answerRange = 2, category = "numbersDots" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game7 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 2, endRange = 5, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game8 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "numbersDots" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game9 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 5},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		game10 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game11 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "numbers" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game12 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 4},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 0, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game13 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 4},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 2, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		game14 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 4},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 0, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		
	},
		
	level67 = { --Pete the Frog: Subtraction to 5
		game1 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 3, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game2 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 4, answerRange = 2, category = "numbersDots" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game3 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 9},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 1, endRange = 3, answerRange = 2, category = "numbersDots" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game4 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game5 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game6 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 9},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 0, endRange = 3, answerRange = 2, category = "numbersDots" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game7 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 2, endRange = 5, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game8 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "numbersDots" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game9 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 5},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		game10 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game11 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "numbers" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game12 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 4},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 0, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game13 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 4},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 2, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		game14 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 4},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 0, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		
	},
		
	level68 = { --Pete the Frog: Subtraction to 5
		game1 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 3, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game2 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 4, answerRange = 2, category = "numbersDots" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game3 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 9},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 1, endRange = 3, answerRange = 2, category = "numbersDots" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game4 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game5 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game6 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 9},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 0, endRange = 3, answerRange = 2, category = "numbersDots" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game7 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 2, endRange = 5, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game8 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "numbersDots" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game9 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 5},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		game10 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game11 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "numbers" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game12 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 4},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 0, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game13 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 4},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 2, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		game14 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 4},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 0, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		
	},
		
	level69 = { --Pete the Frog: Subtraction to 5
		game1 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 3, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game2 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 4, answerRange = 2, category = "numbersDots" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game3 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 9},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 1, endRange = 3, answerRange = 2, category = "numbersDots" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game4 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game5 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game6 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 9},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 0, endRange = 3, answerRange = 2, category = "numbersDots" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game7 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 2, endRange = 5, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game8 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "numbersDots" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game9 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 5},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		game10 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game11 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "numbers" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game12 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 4},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 0, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game13 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 4},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 2, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		game14 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 4},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 0, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		
	},
		
	level70 = { --Pete the Frog: Subtraction to 5
		game1 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 3, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game2 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 4, answerRange = 2, category = "numbersDots" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game3 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 9},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 1, endRange = 3, answerRange = 2, category = "numbersDots" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game4 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game5 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game6 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 9},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 0, endRange = 3, answerRange = 2, category = "numbersDots" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game7 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 2, endRange = 5, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game8 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "numbersDots" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game9 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 5},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		game10 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game11 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "numbers" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game12 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 4},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 0, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game13 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 4},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 2, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		game14 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 4},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 0, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		
	},
		
	level71 = { --Pete the Frog: Subtraction to 5
		game1 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 3, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game2 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 4, answerRange = 2, category = "numbersDots" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game3 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 9},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 1, endRange = 3, answerRange = 2, category = "numbersDots" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game4 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game5 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game6 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 9},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 0, endRange = 3, answerRange = 2, category = "numbersDots" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game7 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 2, endRange = 5, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game8 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "numbersDots" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game9 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 5},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		game10 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game11 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "numbers" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game12 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 4},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 0, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game13 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 4},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 2, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		game14 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 4},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 0, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		
	},
		
	level72 = { --Pete the Frog: Subtraction to 5
		game1 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 3, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game2 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 4, answerRange = 2, category = "numbersDots" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game3 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 9},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 1, endRange = 3, answerRange = 2, category = "numbersDots" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game4 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game5 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game6 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 9},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 0, endRange = 3, answerRange = 2, category = "numbersDots" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game7 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 2, endRange = 5, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game8 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "numbersDots" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game9 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 5},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		game10 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game11 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "numbers" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game12 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 4},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 0, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game13 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 4},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 2, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		game14 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 4},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 0, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		
	},
		
	level73 = { --Pete the Frog: Subtraction to 5
		game1 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 3, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game2 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 4, answerRange = 2, category = "numbersDots" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game3 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 9},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 1, endRange = 3, answerRange = 2, category = "numbersDots" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game4 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game5 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game6 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 9},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 0, endRange = 3, answerRange = 2, category = "numbersDots" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game7 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 2, endRange = 5, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game8 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "numbersDots" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game9 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 5},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		game10 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game11 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "numbers" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game12 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 4},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 0, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game13 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 4},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 2, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		game14 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 4},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 0, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		
	},
		
	level74 = { --Pete the Frog: Subtraction to 5
		game1 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 3, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game2 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 4, answerRange = 2, category = "numbersDots" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game3 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 9},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 1, endRange = 3, answerRange = 2, category = "numbersDots" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game4 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game5 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game6 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 9},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 0, endRange = 3, answerRange = 2, category = "numbersDots" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game7 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 2, endRange = 5, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game8 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "numbersDots" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game9 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 5},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		game10 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game11 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "numbers" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game12 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 4},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 0, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game13 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 4},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 2, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		game14 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 4},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 0, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		
	},
		
	level75 = { --Pete the Frog: Subtraction to 5
		game1 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 3, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game2 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 4, answerRange = 2, category = "numbersDots" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game3 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 9},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 1, endRange = 3, answerRange = 2, category = "numbersDots" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game4 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game5 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game6 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 9},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 0, endRange = 3, answerRange = 2, category = "numbersDots" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game7 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 2, endRange = 5, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game8 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "numbersDots" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game9 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 5},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		game10 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game11 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "numbers" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game12 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 4},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 0, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game13 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 4},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 2, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		game14 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 4},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 0, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		
	},
		
	level76 = { --Pete the Frog: Subtraction to 5
		game1 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 3, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game2 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 4, answerRange = 2, category = "numbersDots" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game3 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 9},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 1, endRange = 3, answerRange = 2, category = "numbersDots" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game4 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game5 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game6 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 9},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 0, endRange = 3, answerRange = 2, category = "numbersDots" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game7 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 2, endRange = 5, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game8 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "numbersDots" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game9 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 5},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 2, endRange = 5, answerRange = 2, category = "numbersDots" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		game10 = {
				gameType = "question",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "apples" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game11 = {
				gameType = "question",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "", line2 = "", spacing = 30, scale = .8, offsetX = 0, offsetY = -41.5},
				equation = { scale = 1, offsetX = 0, offsetY = 0 },
				cards = { scale = .8, offsetX = 0, offsetY = 50, startRange = 1, endRange = 5, answerRange = 2, category = "numbers" },
				questions = { questionType1 = "How many apples", questionType2 = "subtract", numAnswers = 1, numChoices = 3, scattered = true, imageCount = "random", skip = 1 }	
		},
		game12 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 4},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 0, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -35, dotsOffsetX = -4.75 }
		},
		game13 = {
				gameType = "equation",
				nextWaypoint = true,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 4},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 2, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		game14 = {
				gameType = "equation",
				nextWaypoint = false,
				grayBGY = 140,
				question = { line1 = "Solve the equation.", line2 = "", spacing = 20, scale = 1, offsetX = 0, offsetY = -30 },
				equation = { scale = .85, offsetX = 0, offsetY = 4},
				cards = { scale = .85, offsetX = 0, offsetY = 54, startRange = 0, endRange = 5, answerRange = 2, category = "numbers" },
				equations = { sign = "-", numBlanks = 1, choiceOneBlank = false, choiceTwoBlank = false, answerBlank = true, numChoices = 3, choicesRandom = true, dotsOffsetY = -31.5, dotsOffsetX = 0 }
		},
		
	},
		
	
	
}
return gameDetails