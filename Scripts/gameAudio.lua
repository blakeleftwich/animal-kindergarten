function playInstructionsAudio(questionTouched)

	levelOptions = gameDetails["level" .. level]
	gameOptions = gameLevelDetails
	
	questionOptions = gameOptions.question
	equationOptions = gameOptions.equation
	equationOptions = gameOptions.equation
	cardOptions = gameOptions.cards
	if (gameOptions.gameType == "question") then
		questionsOptions = gameOptions.questions
	end
	
	
	local skipHeresAnotherOne = false
	
	if (
		gameOptions.gameType == "matching" and 
		cardOptions.category ~= "shapeToShape" and cardOptions.category ~= "colorToColor" and
		cardOptions.category ~= "shapeItemToShapeItem" and cardOptions.category ~= "colorItemToColorItem" and
		cardOptions.category ~= "shapeToShapeItem" and cardOptions.category ~= "colorToColorItem"or
		gameOptions.gameType == "touchCounting" or
		gameOptions.gameType == "basket" or
			gameOptions.gameType == "basketEvenOdd" or
			gameOptions.gameType == "basketGreaterLessThan" or
		gameOptions.gameType == "touchTheNumber" or
		gameOptions.gameType == "puzzleSlots" or
		gameOptions.gameType == "question" and question == "Which one is a" or
		gameOptions.gameType == "question" and question == "How many" or
		gameOptions.gameType == "question" and question == "Which number is" or
		gameOptions.gameType == "question" and question == "How many are" or
		gameOptions.gameType == "question" and question == "Which one is different") then
		
		skipHeresAnotherOne = true
		
	end
	
	skipHeresAnotherOne = true
	
	
	if (skipHeresAnotherOne == false and questionTouched == false and playedGames[#playedGames-1] and playedGames[#playedGames-2] and playedGames[#playedGames-3] == nil and
			playedGames[#playedGames] == playedGames[#playedGames-1] and
			playedGames[#playedGames] == playedGames[#playedGames-2] or
			skipHeresAnotherOne == false and questionTouched == false and playedGames[#playedGames-1] and playedGames[#playedGames-2] and playedGames[#playedGames-3] and
			playedGames[#playedGames] == playedGames[#playedGames-1] and
			playedGames[#playedGames] == playedGames[#playedGames-2] and
			playedGames[#playedGames] ~= playedGames[#playedGames-3]) then
	
	
		if savedData.enableSounds == true then
		
			if (gameOptions.gameType == "matching") then
			
				if (cardOptions.category == "shapeToShape" or
						cardOptions.category == "shapeItemToShapeItem" or
						cardOptions.category == "shapeToShapeItem") then
				
					playReservedChannel(matchTheShapeCards, 11, 0)
				elseif (cardOptions.category == "colorToColor" or
							cardOptions.category == "colorItemToColorItem" or
							cardOptions.category == "colorToColorItem") then
				
					playReservedChannel(matchTheColorCards, 11, 0)
				else
					playReservedChannel(numbersAndNumbersInstructions, 11, 0)
				end
			
			else
		
				playReservedChannel(heresAnotherOne, 11, 0)
				
			end
			
			
		end
	
	else
	
		if (gameOptions.gameType == "matching") then
		
			print("test 4")
			print(cardOptions.category)
		
			if (cardOptions.category == "numbersToGroups") then
				if savedData.enableSounds == true then
					if (myData.isTV) then 
						playReservedChannel(numbersAndGroupsInstructions2, 11, 0)
					else
						playReservedChannel(numbersAndGroupsInstructions, 11, 0)
					end
				end
			elseif (cardOptions.category == "groupsToGroups") then
				if savedData.enableSounds == true then
						playReservedChannel(groupsAndGroupsInstructions, 11, 0)
				end
			elseif (cardOptions.category == "shapeToShape" and isClassicMode == false) then
				if savedData.enableSounds == true then
				
					
						if (playingFirstPartShowMe == true) then
							if (gameplayMode == 2) then
								playReservedChannel(findThe, 11, 0)
							else
								playReservedChannel(pickThe, 11, 0)
							end
						else
							if (gameplayMode == 2) then
								playReservedChannel(nowFindThe, 11, 0)
							else
								playReservedChannel(nowPickThe, 11, 0)
							end
						end
						
						local function partTwoAudio()
							if savedData.enableSounds == true then
								playReservedChannel(gameSounds[ showMeSelectOptionsPlural[1] ], 11, 0)
							end
							
							
						end
						if (questionAudioTimer) then
							timer.cancel( questionAudioTimer )
							questionAudioTimer = nil
						end
						
						if (playingFirstPartShowMe == true) then
							questionAudioTimer = timer.performWithDelay( 700, partTwoAudio )
						elseif (gameplayMode ~= 2) then -- memory mode
							print("Test memory")
							questionAudioTimer = timer.performWithDelay( 1200, partTwoAudio )
						else
							questionAudioTimer = timer.performWithDelay( 1200, partTwoAudio )
						end
						
					
				end
			elseif (cardOptions.category == "shapeToShape" and matchingOptions.mode == "showme") then
				if savedData.enableSounds == true then
					playReservedChannel(shapesAndItemsMatchingInstructions, 11, 0)
				end
			elseif (cardOptions.category == "shapeToShape" and matchingOptions.mode == "memory") then
				if savedData.enableSounds == true then
					playReservedChannel(shapesMatchingInstructions, 11, 0)
				end
			elseif (cardOptions.category == "shapeToShapeItem" and isClassicMode == false) then
				if savedData.enableSounds == true then
			
					
						if (playingFirstPartShowMe == true) then
							if (gameplayMode == 2) then
								playReservedChannel(findThe, 11, 0)
							else
								playReservedChannel(pickThe, 11, 0)
							end
						else
							if (gameplayMode == 2) then
								playReservedChannel(nowFindThe, 11, 0)
							else
								playReservedChannel(nowPickThe, 11, 0)
							end
						end
						
						local function partTwoAudio()
							if savedData.enableSounds == true then
								playReservedChannel(gameSounds[ showMeSelectOptionsPlural[1] ], 11, 0)
							end
							
							
						end
						if (questionAudioTimer) then
							timer.cancel( questionAudioTimer )
							questionAudioTimer = nil
						end
						
						if (playingFirstPartShowMe == true) then
							questionAudioTimer = timer.performWithDelay( 700, partTwoAudio )
						elseif (gameplayMode ~= 2) then -- memory mode
							questionAudioTimer = timer.performWithDelay( 1200, partTwoAudio )
						else
							questionAudioTimer = timer.performWithDelay( 1200, partTwoAudio )
						end
						
					
				end
			elseif (cardOptions.category == "shapeToShapeItem" and matchingOptions.mode == "showme") then
				if savedData.enableSounds == true then
					if (myData.isTV) then 
						playReservedChannel(shapesAndItemsMatchingInstructions2, 11, 0)
					else
						playReservedChannel(shapesAndItemsMatchingInstructions, 11, 0)
					end
				end
			elseif (cardOptions.category == "shapeToShapeItem" and matchingOptions.mode == "memory") then
				if savedData.enableSounds == true then
					if (myData.isTV) then 
						playReservedChannel(shapesAndItemsMatchingInstructions2, 11, 0)
					else
						playReservedChannel(shapesMatchingInstructions, 11, 0)
					end
				end
			
			elseif (cardOptions.category == "shapeItemToShapeItem" and isClassicMode == false) then
				if savedData.enableSounds == true then
			
					
						if (playingFirstPartShowMe == true) then
							if (gameplayMode == 2) then
								playReservedChannel(findThe, 11, 0)
							else
								playReservedChannel(pickThe, 11, 0)
							end
						else
							if (gameplayMode == 2) then
								playReservedChannel(nowFindThe, 11, 0)
							else
								playReservedChannel(nowPickThe, 11, 0)
							end
						end
						
						local function partTwoAudio()
							if savedData.enableSounds == true then
							
								playReservedChannel(gameSounds[ showMeSelectOptionsPlural[1] ], 11, 0)
							end
							
							
						end
						if (questionAudioTimer) then
							timer.cancel( questionAudioTimer )
							questionAudioTimer = nil
						end
						
						if (playingFirstPartShowMe == true) then
							questionAudioTimer = timer.performWithDelay( 700, partTwoAudio )
						elseif (gameplayMode ~= 2) then -- memory mode
							questionAudioTimer = timer.performWithDelay( 1250, partTwoAudio )
						else
							questionAudioTimer = timer.performWithDelay( 1200, partTwoAudio )
						end
						
					
				end
			elseif (cardOptions.category == "shapeItemToShapeItem" and matchingOptions.mode == "showme") then
				if savedData.enableSounds == true then
					if (myData.isTV) then 
						playReservedChannel(shapesAndItemsMatchingInstructions2, 11, 0)
					else
						playReservedChannel(shapesAndItemsMatchingInstructions, 11, 0)
					end
				end
			elseif (cardOptions.category == "shapeItemToShapeItem" and matchingOptions.mode == "memory") then
				if savedData.enableSounds == true then
					if (myData.isTV) then 
						playReservedChannel(shapesAndItemsMatchingInstructions2, 11, 0)
					else
						playReservedChannel(shapesMatchingInstructions, 11, 0)
					end
				end
			
			elseif (cardOptions.category == "colorToColor" and isClassicMode == false) then
				if savedData.enableSounds == true then
			
					
						if (playingFirstPartShowMe == true) then
							if (gameplayMode == 2) then
								playReservedChannel(findThe, 11, 0)
							else
								playReservedChannel(pickThe, 11, 0)
							end
						else
							if (gameplayMode == 2) then
								playReservedChannel(nowFindThe, 11, 0)
							else
								playReservedChannel(nowPickThe, 11, 0)
							end
						end
						
						local function partTwoAudio()
							if savedData.enableSounds == true then
								playReservedChannel(gameSounds[ showMeSelectOptions[1] ], 11, 0)
							end
							
							
							local function partThreeAudio()
								if savedData.enableSounds == true then
									playReservedChannel( cards2, 11, 0)
								end
							
							end
							if (questionAudioTimer) then
								timer.cancel( questionAudioTimer )
								questionAudioTimer = nil
							end
							questionAudioTimer = timer.performWithDelay( 800, partThreeAudio )
							
						
						end
						if (questionAudioTimer) then
							timer.cancel( questionAudioTimer )
							questionAudioTimer = nil
						end
						
						
						if (playingFirstPartShowMe == true) then
							questionAudioTimer = timer.performWithDelay( 700, partTwoAudio )
						elseif (gameplayMode ~= 2) then -- memory mode
							
							questionAudioTimer = timer.performWithDelay( 1450, partTwoAudio ) -- 1150
						else
							questionAudioTimer = timer.performWithDelay( 1400, partTwoAudio ) -- 1400
						end
						
				end
			elseif (cardOptions.category == "colorToColor" and matchingOptions.mode == "showme") then
				if savedData.enableSounds == true then
					playReservedChannel(colorsAndItemsMatchingInstructions, 11, 0)
				end
			elseif (cardOptions.category == "colorToColor" and matchingOptions.mode == "memory") then
				if savedData.enableSounds == true then
					playReservedChannel(colorsMatchingInstructions, 11, 0)
				end
				
			elseif (cardOptions.category == "colorToColorItem" and isClassicMode == false) then
				if savedData.enableSounds == true then
			
					
						if (playingFirstPartShowMe == true) then
							if (gameplayMode == 2) then
								playReservedChannel(findThe, 11, 0)
							else
								playReservedChannel(pickThe, 11, 0)
							end
						else
							if (gameplayMode == 2) then
								playReservedChannel(nowFindThe, 11, 0)
							else
								playReservedChannel(nowPickThe, 11, 0)
							end
						end
						
						local function partTwoAudio()
							if savedData.enableSounds == true then
								playReservedChannel(gameSounds[ showMeSelectOptions[1] ], 11, 0)
							end
							
							
							local function partThreeAudio()
								if savedData.enableSounds == true then
									playReservedChannel( items, 11, 0)
								end
							
							end
							if (questionAudioTimer) then
								timer.cancel( questionAudioTimer )
								questionAudioTimer = nil
							end
							
							if (gameplayMode ~= 2) then
								questionAudioTimer = timer.performWithDelay( 800, partThreeAudio )
							end
						
						end
						if (questionAudioTimer) then
							timer.cancel( questionAudioTimer )
							questionAudioTimer = nil
						end
						
						if (playingFirstPartShowMe == true) then
							questionAudioTimer = timer.performWithDelay( 700, partTwoAudio )
						elseif (gameplayMode ~= 2) then -- memory mode
							questionAudioTimer = timer.performWithDelay( 1000, partTwoAudio )
						else
							questionAudioTimer = timer.performWithDelay( 1200, partTwoAudio )
						end
						
				
				end
			elseif (cardOptions.category == "colorToColorItem" and matchingOptions.mode == "showme") then
				if savedData.enableSounds == true then
					if (myData.isTV) then 
						playReservedChannel(colorsAndItemsMatchingInstructions, 11, 0)
					else
						playReservedChannel(colorsAndItemsMatchingInstructions, 11, 0)
					end
				end
			elseif 	(cardOptions.category == "colorToColorItem" and matchingOptions.mode == "memory") then
				if savedData.enableSounds == true then
					if (myData.isTV) then 
						playReservedChannel(colorsMatchingInstructions, 11, 0)
					else
						playReservedChannel(colorsMatchingInstructions, 11, 0)
					end
				end
			
			elseif (cardOptions.category == "colorItemToColorItem" and isClassicMode == false) then
				if savedData.enableSounds == true then
			
					
						if (playingFirstPartShowMe == true) then
							if (gameplayMode == 2) then
								playReservedChannel(findThe, 11, 0)
							else
								playReservedChannel(pickThe, 11, 0)
							end
						else
							if (gameplayMode == 2) then
								playReservedChannel(nowFindThe, 11, 0)
							else
								playReservedChannel(nowPickThe, 11, 0)
							end
						end
						
						local function partTwoAudio()
							if savedData.enableSounds == true then
								playReservedChannel(gameSounds[ showMeSelectOptions[1] ], 11, 0)
							end
							
							
							local function partThreeAudio()
								if savedData.enableSounds == true then
									playReservedChannel( items, 11, 0)
								end
							
							end
							if (questionAudioTimer) then
								timer.cancel( questionAudioTimer )
								questionAudioTimer = nil
							end
							
							if (gameplayMode ~= 2) then
								questionAudioTimer = timer.performWithDelay( 800, partThreeAudio )
							end
						
						end
						if (questionAudioTimer) then
							timer.cancel( questionAudioTimer )
							questionAudioTimer = nil
						end
						
						if (playingFirstPartShowMe == true) then
							questionAudioTimer = timer.performWithDelay( 750, partTwoAudio )
						elseif (gameplayMode ~= 2) then -- memory mode
							questionAudioTimer = timer.performWithDelay( 1250, partTwoAudio )
						else
							questionAudioTimer = timer.performWithDelay( 1200, partTwoAudio )
						end
						
				
				end
			elseif (cardOptions.category == "colorItemToColorItem" and matchingOptions.mode == "showme") then
				if savedData.enableSounds == true then
					if (myData.isTV) then 
						playReservedChannel(colorItemsMatchingInstructions2, 11, 0)
					else
						playReservedChannel(colorItemsMatchingInstructions, 11, 0)
					end
				end
			elseif (cardOptions.category == "colorItemToColorItem" and matchingOptions.mode == "memory") then
				if savedData.enableSounds == true then
					if (myData.isTV) then 
						playReservedChannel(colorsMatchingInstructions, 11, 0)
					else
						playReservedChannel(colorsMatchingInstructions, 11, 0)
					end
				end
			elseif (cardOptions.category == "numbersToNumbers" and isClassicMode == false) then
				if savedData.enableSounds == true then
			
					print("is first game")
				print(isMatchingCardsFirstPlay)
			
				
					if (playingFirstPartShowMe == true) then
						if (gameplayMode == 2) then
							playReservedChannel(findThe, 11, 0)
						else
							playReservedChannel(pickThe, 11, 0)
						end
					else
						if (gameplayMode == 2) then
							playReservedChannel(nowFindThe, 11, 0)
						else
							playReservedChannel(nowPickThe, 11, 0)
						end
					end
					
					local function partTwoAudio()
						if savedData.enableSounds == true then
							print("test sound")
							print(showMeSelectOptionsPlural[1])
								playReservedChannel(gameSounds[ showMeSelectOptionsPlural[1] ], 11, 0)
						end
						
					
					end
					if (questionAudioTimer) then
						timer.cancel( questionAudioTimer )
						questionAudioTimer = nil
					end
					
					if (playingFirstPartShowMe == true) then
						if (isMatchingCardsFirstPlay == true) then
							questionAudioTimer = timer.performWithDelay( 818, partTwoAudio ) 
						elseif (gameplayMode == 2 or myData.isTV) then -- memory mode
							questionAudioTimer = timer.performWithDelay( 818, partTwoAudio ) --was 1000
						else
							questionAudioTimer = timer.performWithDelay( 818, partTwoAudio ) --was 700
						end
					else
						if (isMatchingCardsFirstPlay == true) then
							questionAudioTimer = timer.performWithDelay( 1290, partTwoAudio )
						elseif (gameplayMode == 2 or myData.isTV) then -- memory mode
							questionAudioTimer = timer.performWithDelay( 1290, partTwoAudio ) --was 1000
						else
							questionAudioTimer = timer.performWithDelay( 1290, partTwoAudio )
						end
					end
						
				
				end
			elseif (cardOptions.category == "numbersToNumbers" and matchingOptions.mode == "showme") then
				if savedData.enableSounds == true then
					if (myData.isTV) then 
						playReservedChannel(numbersAndNumbersInstructions, 11, 0)
					else
						playReservedChannel(numbersAndNumbersInstructions, 11, 0)
					end
				end
			elseif (cardOptions.category == "numbersToNumbers" and matchingOptions.mode == "memory") then
				if savedData.enableSounds == true then
					if (myData.isTV) then 
						playReservedChannel(numbersAndNumbersInstructions, 11, 0)
					else
						playReservedChannel(numbersAndNumbersInstructions, 11, 0)
					end
				end
			elseif (cardOptions.category == "item") then
				if savedData.enableSounds == true then
					playReservedChannel(itemMatchingInstructions, 11, 0)
				end
			elseif (cardOptions.category == "numbersToEquations") then
				if savedData.enableSounds == true then
				
					if (gameplayMode == 1) then
						if (myData.isTV) then 
							playReservedChannel(equationsAnswersShowMeInstructions2, 11, 0)
						else
							playReservedChannel(equationsAnswersShowMeInstructions, 11, 0)
						end
					else
						playReservedChannel(equationsAnswersMatchInstructions, 11, 0)
					end
					
				end
			end
			
		elseif (gameOptions.gameType == "equation" or gameOptions.gameType == "complex equation") then
		
			if (questionTouched == true) then
				if savedData.enableSounds == true then
					playReservedChannel(solveTheEquationSound[1], 11, 0)
				end
			else
		
				if savedData.enableSounds == true then
					playReservedChannel(solveTheEquationSound[currentEquationVO], 11, 0)
				end
				
				currentEquationVO = currentEquationVO + 1
				if (currentEquationVO > #solveTheEquationSound) then
					currentEquationVO = 1
				end
			end
			
		elseif (gameOptions.gameType == "counting") then
		
			if savedData.enableSounds == true then
				if (myData.isTV) then 
					playReservedChannel(countingSound2, 11, 0)
				else
					playReservedChannel(countingSound, 11, 0)
				end
			end
			
		elseif (gameOptions.gameType == "sequence") then
		
		
			if (prevSequenceVO == "What comes next?" and questionOptions.line1 == "What's missing?" or 
				prevSequenceVO == "What's missing?" and questionOptions.line1 == "What comes next?") then
			
				
				currentSequenceVO = 1
			end
		
			if (questionOptions.line1 == "What comes next?") then
				if (questionTouched == true) then
					if savedData.enableSounds == true then
						playReservedChannel(whatComesNextSound[1], 11, 0)
					end
				else
			
					if savedData.enableSounds == true then
						playReservedChannel(whatComesNextSound[currentSequenceVO], 11, 0)
					end
					
					currentSequenceVO = currentSequenceVO + 1
					if (currentSequenceVO > #whatComesNextSound) then
						currentSequenceVO = 1
					end
				end
				
			
			else
				
				if (questionTouched == true) then
					if savedData.enableSounds == true then
						playReservedChannel(whatsMissingSound[1], 11, 0)
					end
				else
			
					if savedData.enableSounds == true then
						playReservedChannel(whatsMissingSound[currentSequenceVO], 11, 0)
					end
					
					currentSequenceVO = currentSequenceVO + 1
					if (currentSequenceVO > #whatsMissingSound) then
						currentSequenceVO = 1
					end
				end
				
				
			end
			
			prevSequenceVO = questionOptions.line1
		
		elseif (gameOptions.gameType == "question") then
		
		
			if (question == "How many more apples do you need to make" or 
				question == "How many apples do you need to take away to leave") then
			
				if (question == "How many more apples do you need to make") then
					if (appleGameImage == "apples") then
						if savedData.enableSounds == true then
							playReservedChannel(howManyMoreApplesSound, 11, 0)
						end
					else
						if savedData.enableSounds == true then
							playReservedChannel(howManyMoreBananasSound, 11, 0)
						end
					end
				else
					if (appleGameImage == "apples") then
						if savedData.enableSounds == true then
							playReservedChannel(howManyApplesSound, 11, 0)
						end
					else
						if savedData.enableSounds == true then
							playReservedChannel(howManyBananasSound, 11, 0)
						end
					end
				end
				
				
				local function partTwoAudio()
					if savedData.enableSounds == true then
						playReservedChannel(gameNumSounds[ questionTwo ], 11, 0)
					end
					
					local function partThreeAudio()
						if (questionTwo == 1) then
							if (appleGameImage == "apples") then
								if savedData.enableSounds == true then
									playReservedChannel(gameSounds[ "apple" ], 11, 0)
								end
							else
								if savedData.enableSounds == true then
									playReservedChannel(gameSounds[ "banana" ], 11, 0)
								end
							end
						else
							if savedData.enableSounds == true then
								playReservedChannel(gameSounds[ appleGameImage ], 11, 0)
							end
						end
					end
					if (questionAudioTimer) then
						timer.cancel( questionAudioTimer )
						questionAudioTimer = nil
					end
					questionAudioTimer = timer.performWithDelay( 600, partThreeAudio )
				
				end
				if (questionAudioTimer) then
					timer.cancel( questionAudioTimer )
					questionAudioTimer = nil
				end
				
				if (question == "How many more apples do you need to make") then
					questionAudioTimer = timer.performWithDelay( 2300, partTwoAudio )
				else
					questionAudioTimer = timer.performWithDelay( 2900, partTwoAudio )
				end
			
			elseif (question == "How many") then
			
				if savedData.enableSounds == true then
					playReservedChannel(howManySound, 11, 0)
				end
				
				local function partTwoAudio()
					if savedData.enableSounds == true then
						playReservedChannel(gameSounds[ questionTwo ], 11, 0)
					end
				
				end
				if (questionAudioTimer) then
					timer.cancel( questionAudioTimer )
					questionAudioTimer = nil
				end
				questionAudioTimer = timer.performWithDelay( 800, partTwoAudio )
				
			elseif (question == "How many are") then
			
				if savedData.enableSounds == true then
					playReservedChannel(howManyAreSound, 11, 0)
				end
				
				local function partTwoAudio()
					if savedData.enableSounds == true then
						playReservedChannel(gameSounds[ questionTwo ], 11, 0)
					end
				
				end
				if (questionAudioTimer) then
					timer.cancel( questionAudioTimer )
					questionAudioTimer = nil
				end
				questionAudioTimer = timer.performWithDelay( 1000, partTwoAudio )
				
			elseif (questionTwo == "first") then
			
				if savedData.enableSounds == true then
					playReservedChannel(whichNumberFirstSound, 11, 0)
				end
				
			elseif (questionTwo == "last") then
			
				if savedData.enableSounds == true then
					playReservedChannel(whichNumberLastSound, 11, 0)
				end
			
			elseif (questionTwo == "most") then
			
				if savedData.enableSounds == true then
					playReservedChannel(whichCardMostSound, 11, 0)
				end
			
			elseif (questionTwo == "least") then
			
				if (cardOptions.category == "numbers") then
					playReservedChannel(whichNumIsLeast, 11, 0)
				else
					playReservedChannel(whichCardLeastSound, 11, 0)
				end
			elseif (questionTwo == "less") then
		
				if savedData.enableSounds == true then
					playReservedChannel(whichNumIsLess, 11, 0)
				end
				
			elseif (questionTwo == "greater") then
			
				if savedData.enableSounds == true then
					playReservedChannel(whichNumIsGreater, 11, 0)
				end
				
			elseif (questionTwo == "greatest") then
			
				if savedData.enableSounds == true then
					playReservedChannel(whichNumIsGreatest, 11, 0)
				end
			
			elseif (question == "Which 2 numbers add up to") then
			
				if savedData.enableSounds == true then
					if (numAnswers == 2) then
					playReservedChannel(whichTwoAddSound, 11, 0)
					else
						playReservedChannel(whichThreeAddSound, 11, 0)
					end
				end
				
				local function partTwoAudio()
					if savedData.enableSounds == true then
						playReservedChannel(gameNumSounds[ questionTwo ], 11, 0)
					end
				
				end
				if (questionAudioTimer) then
					timer.cancel( questionAudioTimer )
					questionAudioTimer = nil
				end
				questionAudioTimer = timer.performWithDelay( 2000, partTwoAudio )
				
			elseif (question == "Which one is a" or question == "Which one is an") then
				
							
				if savedData.enableSounds == true then
			
					if (numAnswers > 1) then
						
						if (myData.isTV) then 
							playReservedChannel(pickAllThe, 11, 0)
						else
							playReservedChannel(touchAllThe, 11, 0)
						end
						
					else
					
						if (numOrGroup == "shape" or numOrGroup == "shapeItem") then
							if (questionTwo == "oval" or questionTwo == "octagon") then
								
								playReservedChannel(whichOneIsAnSound, 11, 0)
							else
								playReservedChannel(whichOneIsASound, 11, 0)
							end
						elseif (numOrGroup == "color" or numOrGroup == "colorItem") then
							playReservedChannel(whichOneIsSound, 11, 0)
							
						end
						
					end
					
					
				end
				
				local function partTwoAudio()
					if savedData.enableSounds == true then
						playReservedChannel(gameSounds[ questionTwo ], 11, 0)
					end
					
					local function partThreeAudio()
						
						if (numOrGroup == "colorItem" or numOrGroup == "shapeItem") then
							playReservedChannel(items, 11, 0)
						else
							playReservedChannel(cards2, 11, 0)
						end
						
					end
					
					if (questionAudioTimer) then
						timer.cancel( questionAudioTimer )
						questionAudioTimer = nil
					end
					if (numAnswers > 1) then
						if (questionTwo == "rectangle") then
							questionAudioTimer = timer.performWithDelay( 1000, partThreeAudio )
						else
							questionAudioTimer = timer.performWithDelay( 750, partThreeAudio )
						end
					end
					
				end
				if (questionAudioTimer) then
					timer.cancel( questionAudioTimer )
					questionAudioTimer = nil
				end
				if (numAnswers > 1) then
					questionAudioTimer = timer.performWithDelay( 1200, partTwoAudio )
				else
					questionAudioTimer = timer.performWithDelay( 1000, partTwoAudio )
				end
			
				
			elseif (question == "Which number is" or question == "Which item is") then
				
				if savedData.enableSounds == true then
					if (questionTwo == "bigger") then
						if (numChoices > 2) then
							playReservedChannel(whichOneIsBiggest, 11, 0)
						else
							playReservedChannel(whichOneIsBigger, 11, 0)
						end
					else
						if (numChoices > 2) then
							playReservedChannel(whichOneIsSmallest, 11, 0)
						else
							playReservedChannel(whichOneIsSmaller, 11, 0)
						end
					end
				end
			
			
			elseif (question == "Which is") then
		
				if savedData.enableSounds == true then
					playReservedChannel(whichOneIsSound, 11, 0)
				end
				
				local function partTwoAudio()
					if savedData.enableSounds == true then
						playReservedChannel(gameNumSounds[ groupSkip ], 11, 0)
					end
					
					local function partThreeAudio()
						if (questionTwo == "more than") then
							if savedData.enableSounds == true then
								playReservedChannel(moreThanSound, 11, 0)
							end
						else
							if savedData.enableSounds == true then
								playReservedChannel(lessThanSound, 11, 0)
							end
						end
						
						local function partFourAudio()
							if savedData.enableSounds == true then
								if (whichIsSecondNum <= 100) then
									playReservedChannel(gameNumSounds[ whichIsSecondNum ], 11, 0)
								else
								
									local function partFiveAudio()
										local numTemp
										if (whichIsSecondNum < 110) then
											numTemp = tonumber( tostring(whichIsSecondNum):sub(3, 3) )
										else
											numTemp = tonumber( tostring(whichIsSecondNum):sub(2, 3) )
										end
										playReservedChannel(gameNumSounds[ numTemp ], 11, 0)
									end
								
									playReservedChannel(hundredSounds[ tonumber(tostring(whichIsSecondNum):sub(1, 1)) ], 11, 0)
								
								
									if (questionAudioTimer) then
										timer.cancel( questionAudioTimer )
										questionAudioTimer = nil
									end
									questionAudioTimer = timer.performWithDelay( 900, partFiveAudio )
								end
							end
						end
						
						if (questionAudioTimer) then
							timer.cancel( questionAudioTimer )
							questionAudioTimer = nil
						end
						questionAudioTimer = timer.performWithDelay( 900, partFourAudio )
					end
					
					if (questionAudioTimer) then
						timer.cancel( questionAudioTimer )
						questionAudioTimer = nil
					end
					
					
					if (groupSkip > 99) then
						questionAudioTimer = timer.performWithDelay( 1000, partThreeAudio )
					else
						questionAudioTimer = timer.performWithDelay( 800, partThreeAudio )
					end
				end
				if (questionAudioTimer) then
					timer.cancel( questionAudioTimer )
					questionAudioTimer = nil
				end
				questionAudioTimer = timer.performWithDelay( 1000, partTwoAudio )
				
			elseif (question == "PickEvenOdd") then
			
				if savedData.enableSounds == true then
					if (isEvenOdd == "even") then
						playReservedChannel(pickTheEven, 11, 0)
					else
						playReservedChannel(pickTheOdd, 11, 0)
					end
					
				end
			
			elseif (question == "AllGreaterLessThan") then
		
				if savedData.enableSounds == true then
					
					
					local function partTwoAudio()
						if savedData.enableSounds == true then
						
							if (greaterLessThanAnswer <= 100) then
								playReservedChannel( gameNumSounds[greaterLessThanAnswer], 11, 0 )
							else
								local function partFiveAudio()
									local numTemp
									if (greaterLessThanAnswer < 110) then
										numTemp = tonumber( tostring(greaterLessThanAnswer):sub(3, 3) )
									else
										numTemp = tonumber( tostring(greaterLessThanAnswer):sub(2, 3) )
									end
									playReservedChannel(gameNumSounds[ numTemp ], 11, 0)
								end
							
								playReservedChannel(hundredSounds[ tonumber(tostring(greaterLessThanAnswer):sub(1, 1)) ], 11, 0)
							
							
								if (questionAudioTimer) then
									timer.cancel( questionAudioTimer )
									questionAudioTimer = nil
								end
								questionAudioTimer = timer.performWithDelay( 900, partFiveAudio )
									
							end
						
						end
					
					end
					
					if (questionAudioTimer) then
						timer.cancel( questionAudioTimer )
						questionAudioTimer = nil
					end
					questionAudioTimer = timer.performWithDelay( 2300, partTwoAudio )
					
					
					if (isGreaterLessThan == "greater than" ) then
						playReservedChannel(pickTheNumbersGreaterThan, 11, 0)
					else
						playReservedChannel(pickTheNumbersLessThan, 11, 0)
					end
					
				end
				
			
			elseif (question == "TrueOrFalse") then
		
				if savedData.enableSounds == true then
					playReservedChannel(trueOrFalseSound, 11, 0)
				end
			
			
			elseif (question == "Word problem") then
		
		
				if savedData.enableSounds == true then
					if (numOrGroup == "operations") then
						playReservedChannel(whatOperationSound, 11, 0)
					else
						playReservedChannel(solveWordProblemSound, 11, 0)
					end
				end
			
			elseif (question == "Which one is different") then
			
				if savedData.enableSounds == true then
					if (questionTwo == "category") then
						playReservedChannel(whichOneDoesntBelong, 11, 0)
					else
						
						
						playReservedChannel(whichOneIsDifferentSound[whichOneIsDifferentVO], 11, 0)
						
						whichOneIsDifferentVO = whichOneIsDifferentVO + 1
						if (whichOneIsDifferentVO > #whichOneIsDifferentSound) then
							whichOneIsDifferentVO = 1
						end
					end
				end
			
			end
			
			
		elseif (gameOptions.gameType == "puzzleSlots") then
			
			if (questionTouched == true) then
				readPuzzleSlotsVO()
			end
			
		elseif (gameOptions.gameType == "puzzle") then
		
			if (questionTouched == true) then
				readPuzzleVO()
			end
			
			
		elseif (gameOptions.gameType == "basket" or
			gameOptions.gameType == "basketEvenOdd" or
			gameOptions.gameType == "basketGreaterLessThan") then
	
			if (questionTouched == true) then
				itemStartTouched = false
				
				readBasketVO(true)
			end
		
		elseif (gameOptions.gameType == "bubbleCounting") then
		
			if (questionTouched == true) then
				readBubbleCountingVO(true)
			end
		
		elseif (gameOptions.gameType == "touchTheNumber") then
	
			if (questionTouched == true) then
				readTouchTheNumVO(true)
			end
		
		
		elseif (gameOptions.gameType == "touchCounting") then
		
			if (questionTouched == true) then
				readCountingVO(true)
			end
			
		end
		
	end
	
	
end
