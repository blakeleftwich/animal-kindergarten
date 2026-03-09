local myData = require("Scripts.myData")
require("Scripts.gameController")
require("Scripts.gameAnimations")
require("Scripts.gameMatchingInline")
require("Scripts.gameEquationInline")
require("Scripts.gameCountingInline")
require("Scripts.gameSequenceInline")
require("Scripts.gameQuestionInline")
require("Scripts.gameAudio")

function closeGameScreen()

	Runtime:removeEventListener( "enterFrame", bgGameAnimations)
	if (addCarsTimer) then
		timer.cancel( addCarsTimer )
		addCarsTimer = nil
	end

	buttonsActive = false
	Particles:removeParticles(explosions)

	audio.stop( 11 )

	local screen = display.captureScreen()
	screen.anchorX = 0.5
	screen.anchorY = 0.5
	screen.x = halfW
	screen.y = halfH
	screen:toFront()
	local currentIndex = itemIndex
	
	
	bgSunGroup.xScale, bgSunGroup.yScale = bgSunGroup.initScale, bgSunGroup.initScale
	bgSunGroup.x = bgSunGroup.initX
	bgSunGroup.y = bgSunGroup.initY
	bgCloudsOneGroup.alpha = 1
	bgCloudsTwoGroup.alpha = 1
	
	gameCornerCloud1.alpha = 0
	gameCornerCloud2.alpha = 0
	
	if (myData.isTV) then
		bgSunGroup.alpha = 1
	end
	
	sun.alpha = 1
	sunTwo.alpha = 0
	
	backButton:setFillColor(255/255,254/255,240/255)
	
	if (playingRandomGame == true) then
	else
			bg.alpha = 1
			bgLighter.alpha = 0
	end
	
	
	audio.fade( { channel=3 , time=700 , volume=0  } )
	
	
	local function openMenu()
		
		
		dustGroupBack:toFront()
		titleGroupBack:toFront()
		
		dustGroupFront:toFront()
		titleGroupFront:toFront()
		
		bgBirdGroup:toFront()
		
		mainContainer:toFront()
		bgWhite:toFront()
		
		
		if (titleAddCarsTimer) then
			timer.cancel( titleAddCarsTimer )
			titleAddCarsTimer = nil
		end
		timer.performWithDelay( 0, titleAddCars ) -- was 500
		titleAddCarsTimer = timer.performWithDelay( math.random( titleAddCarMin, titleAddCarMax ), titleAddCars, -1 )
	
		
		titleGroup.alpha = 1
		dustGroupBack.alpha = 1
		titleGroupBack.alpha = 1
		dustGroupFront.alpha = 1
		titleGroupFront.alpha = 1
		
		fromTitle = false
		
		selectAnimation1()
		
		
		fromMenu = true
		fromGame = true
		
		prevEquationGame = nil
		prevGame = nil
		
		if gamePuzzle then
			gamePuzzle:destroy()
			gamePuzzle = nil
		end
		
		screen:removeSelf()
		
		gameBackground:removeSelf()
		gameBackground = nil
		bgPlane:removeSelf()
		bgPlane = nil
		for i = #carsFront, 1, -1 do
			if (carsFront[i]) then
				carTemp = carsFront[i]
				if (carsFront[i].carTrans) then
					transition.cancel( carsFront[i].carTrans )
					carsFront[i].carTrans = nil
				end
				table.remove( carsFront, i )
			
				carTemp:removeSelf()
				carTemp = nil
			end
		end
		for i = #carsBack, 1, -1 do
			if (carsBack[i]) then
				carTemp = carsBack[i]
				if (carsBack[i].carTrans) then
					transition.cancel( carsBack[i].carTrans )
					carsBack[i].carTrans = nil
				end
				table.remove( carsBack, i )
				
				carTemp:removeSelf()
				carTemp = nil
			end
		end
		
		
		gameIcon:removeSelf()
		gameIcon = nil
		if (cursor) then
			cursor:removeSelf()
			cursor = nil
		end
		Runtime:removeEventListener( "onFTVKey", trackCursor )
		Runtime:removeEventListener( "key", trackCursor )
		Runtime:removeEventListener( "axis", trackCursorAxis )
		
		Runtime:removeEventListener( "enterFrame", worldStarFloat)
		Runtime:removeEventListener( "enterFrame", victoryStarFloat)
		
		
		for i = #gamePathText, 1, -1 do
			gamePathText[i]:removeSelf()
			gamePathText[i] = nil
			table.remove(gamePathText,i)
		end
		
		resetGameItems(true)
		
		if (cardGroup) then
			cardGroup:removeSelf()
			cardGorup = nil
		end
		
		
		curGame = 1
		currentWaypoint = 1
		curWaypoint = 1
		
		mainContainer.x = 0
		if (levelCompleted == true) then
		
			if (itemIndex+1 > totalLevels - repeatedLevelsNum and menuGroup[itemIndex+1] and levels[300].repeatedLevels[itemIndex+1-subFromRepeatLevels].completed ~= "completed" and menuGroup[itemIndex+1].levelID ~= selectableChar and menuGroup[itemIndex+1].levelID ~= iapChar and menuGroup[itemIndex+1].levelID ~= rateChar or
				itemIndex+1 <= totalLevels - repeatedLevelsNum and menuGroup[itemIndex+1] and levels[menuGroup[itemIndex+1].levelID] ~= "completed" and menuGroup[itemIndex+1].levelID ~= selectableChar and menuGroup[itemIndex+1].levelID ~= iapChar and menuGroup[itemIndex+1].levelID ~= rateChar) then
				transition.to( star, { delay=700, time=1, alpha = 0, transition=easing.outExpo } )
			end
			victoryStar:removeSelf()
			victoryStar = nil
			
		else
			Runtime:removeEventListener( "enterFrame", worldStarFloat)
			worldStar:removeSelf()
			worldStar = nil
		end
	
	end
	
	
	local dontWakeUpChar = false
	
	
	local function starAnimation()
		
		
		local function scaleStarBack( object )
			endGameTransition = transition.to( star, { time=100 , xScale = star.initScale, yScale = star.initScale, transition=easing.outExpo } )
			
			local function nextCharacter()
			
				if (menuGroup[itemIndex+2].levelID == selectableChar or
					dontWakeUpChar == false or
					dontWakeUpChar == true and variation == 4 and menuGroup[itemIndex+2].levelID == iapChar) then
					
					itemIndex = itemIndex+1
					
					nextItem()
				end
				
				local function fadeZZZ()
					local function scaleUp()
						local function scaleCharDown()
								endOfGame = false
								endZZZ = false
								
								
								if (menuGroup[itemIndex+1].levelID ~= iapChar and menuGroup[itemIndex+1].levelID ~= rateChar) then
									transition.to(menuGroup[itemIndex+1].eyelids, {time=250, alpha = 0, transition=easing.outExpo} )
									transition.to( menuGroup[itemIndex+1], { time=100 , xScale = 1, yScale = 1, transition=easing.inExpo } )
								end
							
								local function startLevel()
									startNextLevel = true
								end
								timer.performWithDelay( 1000, startLevel )
						end
						
							if savedData.enableSounds == true then
								playReservedChannel(completedSound, 16, 0)
							end
						
							if (menuGroup[itemIndex+1].levelID ~= iapChar and menuGroup[itemIndex+1].levelID ~= rateChar) then
								transition.to(menuGroup[itemIndex+1], {time=100, xScale = 1.3, yScale = 1.3, onComplete = scaleCharDown, transition=easing.outExpo} )
							else
								scaleCharDown()
							end
					end
					
					
					if (dontWakeUpChar == false) then
						endZZZ = true
						
						transition.to(menuGroup[itemIndex+1].z1, {time=250, alpha = 0, transition=easing.outExpo, onComplete=scaleUp} )
						transition.to(menuGroup[itemIndex+1].z2, {time=250, alpha = 0, transition=easing.outExpo} )
						transition.to(menuGroup[itemIndex+1].z3, {time=250, alpha = 0, transition=easing.outExpo} )
						transition.to(menuGroup[itemIndex+1], {time=250, xScale = 1, yScale = 1, transition=easing.outExpo} )
					
					
						if (char2Transition) then
							transition.cancel( char2Transition )
							char2Transition = nil
						end
					end
				end
				
				endGameTimer = timer.performWithDelay( 500, fadeZZZ )
				
			end
			
			print("Level " .. itemIndex)
			
			if (reviewPopUp ~= nil and savedData.appOpenNum == showOnPlayFirst and currentLevelPlayedNum == showReviewFrequency or
					reviewPopUp ~= nil and savedData.appOpenNum == showOnPlaySecond and currentLevelPlayedNum == showReviewFrequency) then
			
				needsToShowRatePopup = true
				endGameTimer = timer.performWithDelay( 1000, goToTitleForRatePopup )
			
			elseif (menuGroup[itemIndex+2].levelID == selectableChar or
				itemIndex+2 > totalLevels - repeatedLevelsNum and variation == 5 and menuGroup[itemIndex+2] and levels[300].repeatedLevels[itemIndex+2-subFromRepeatLevels] and levels[300].repeatedLevels[itemIndex+2-subFromRepeatLevels].completed ~= "completed" and nextCharLocked == true or
				itemIndex+2 <= totalLevels - repeatedLevelsNum and variation == 5 and itemIndex+2 <= totalLevels - repeatedLevelsNum and menuGroup[itemIndex+2] and levels[menuGroup[itemIndex+2].levelID] ~= "completed" and nextCharLocked == true or
				variation == 5 and menuGroup[itemIndex+2] and menuGroup[itemIndex+2].levelID == rateChar or
			itemIndex+2 > totalLevels - repeatedLevelsNum and variation == 4 and savedData.enablePromo == false and menuGroup[itemIndex+2] and levels[300].repeatedLevels[itemIndex+2-subFromRepeatLevels].completed ~= "completed" and nextCharLocked == true or
			itemIndex+2 <= totalLevels - repeatedLevelsNum and variation == 4 and itemIndex+2 <= totalAvailLevels and savedData.enablePromo == false and menuGroup[itemIndex+2] and levels[menuGroup[itemIndex+2].levelID] ~= "completed" and nextCharLocked == true or
			itemIndex+2 <= totalLevels - repeatedLevelsNum and variation == 4 and itemIndex+2 <= totalAvailLevels+1 and savedData.enablePromo == true and menuGroup[itemIndex+2] and levels[menuGroup[itemIndex+2].levelID] ~= "completed" and nextCharLocked == true or
			variation == 4 and menuGroup[itemIndex+2].levelID == iapChar) then
				
				print("next character")
				if (menuGroup[itemIndex+2].levelID == selectableChar or
						variation == 4 and menuGroup[itemIndex+2].levelID == iapChar) then
					dontWakeUpChar = true
				end
				
				endGameTimer = timer.performWithDelay( 1000, nextCharacter )
			
			else
				endOfGame = false
				endZZZ = false
			end
		end
		
		if savedData.enableSounds == true then
			playReservedChannel(popSounds[1], 19, 0)
		end
		
		levelNotCompleted = false
		endGameTransition = transition.from(star, {time=500, xScale = star.initScale+.15, yScale = star.initScale+.15, onComplete = scaleStarBack, transition=easing.inExpo} )
		Particles:newEmitter(explosions,"fireworks", "Images/confettiParticle.png", 12, 12, 40, star.x, star.y, -4, 4, -16, 6, 255,255,200)--lastRgb[1], lastRgb[2], lastRgb[3])
		explosions:toFront()
		bgWhiteTwo:toFront()
		
		levelCompleted = false
		
	end
	
	Runtime:removeEventListener( "enterFrame", countTime )
	transition.to( cardGroup, { time=700, x=800, transition=easing.outExpo } )
	transition.to( gamePathGroup, { time=700, alpha = 0, transition=easing.outExpo } )
	if (levelCompleted == true) then
		endOfGame = true
		
		currentLevelPlayedNum = currentLevelPlayedNum + 1
		
		if (itemIndex+2 > totalLevels - repeatedLevelsNum and menuGroup[itemIndex+2] and levels[300].repeatedLevels[itemIndex+2-subFromRepeatLevels] and levels[300].repeatedLevels[itemIndex+2-subFromRepeatLevels].locked == "locked" and menuGroup[itemIndex+2].levelID ~= selectableChar or
			itemIndex+2 <= totalLevels - repeatedLevelsNum and menuGroup[itemIndex+2] and levels[menuGroup[itemIndex+2].levelID+100] == "locked" and menuGroup[itemIndex+2].levelID ~= selectableChar) then
			nextCharLocked = true
		else
			nextCharLocked = false
		end
		
		
		if (itemIndex+1 > totalLevels - repeatedLevelsNum and menuGroup[itemIndex+1] and levels[300].repeatedLevels[itemIndex+1-subFromRepeatLevels].completed ~= "completed" and menuGroup[itemIndex+1].levelID ~= selectableChar or
				itemIndex+1 <= totalLevels - repeatedLevelsNum and menuGroup[itemIndex+1] and levels[menuGroup[itemIndex+1].levelID] ~= "completed" and menuGroup[itemIndex+1].levelID ~= selectableChar) then
			
			endGameTimer = timer.performWithDelay( 1600, starAnimation )
			levelNotCompleted = true
			buttonsActive = false
			
			print("test1")
			
				
					local function playMenuMusicTimer()
					
						if savedData.enableMusic == true then
						audio.play( introMenuSound, { channel = 1, loops = -1 }  )
						audio.setVolume( 1, { channel=1 } )
						audio.play( introMenuSound, { channel = 2, loops = -1 }  )
						audio.setVolume( 1, { channel=2 } )
					end
				end
				timer.performWithDelay( 2800, playMenuMusicTimer )
		else
			
			local function nextCharacter()
				
				levelCompleted = false
			end
			timer.performWithDelay( 3100, nextCharacter )
			levelNotCompleted = false
			buttonsActive = false
			
			print("test2")
			
			local function playMenuMusicTimer()
			
				if savedData.enableMusic == true then
					audio.play( introMenuSound, { channel = 1, loops = -1 }  )
					audio.setVolume( 1, { channel=1 } )
					audio.play( introMenuSound, { channel = 2, loops = -1 }  )
					audio.setVolume( 1, { channel=2 } )
				end
			end
			timer.performWithDelay( 2800, playMenuMusicTimer )
			
			if (reviewPopUp ~= nil and savedData.appOpenNum == showOnPlayFirst and currentLevelPlayedNum == showReviewFrequency or
					reviewPopUp ~= nil and savedData.appOpenNum == showOnPlaySecond and currentLevelPlayedNum == showReviewFrequency) then
			
				needsToShowRatePopup = true
				endGameTimer = timer.performWithDelay( 2700, goToTitleForRatePopup )
				
			end
			
		end
		
		saveLevelData()
		
	else
		transition.to( worldStar, { time=700, alpha = 0, transition=easing.outExpo } )
		
	end
	
	transition.to( questionText, { time=700, x=1000, transition=easing.outExpo } )
	transition.to( questionTextTwo, { time=700, x=1000, transition=easing.outExpo } )
	transition.to( dotsGroup, { time=700, x=1000, transition=easing.outExpo } )
	transition.to( equationGroup, { time=700, x=1000, transition=easing.outExpo } )
	transition.to( equationComplexGroup, { time=700, x=1000, transition=easing.outExpo } )
	
	if (myData.isTV) then 
		transition.to( cursor, { time=0, alpha=0 } )
	end
	
	if (howManyBackground) then
		transition.to( howManyBackground, { time=700, x=-1000, transition=easing.outExpo } )
	end
	if (howManyGroup) then
		transition.to( howManyGroup, { time=700, x=1000, transition=easing.outExpo } )
	end
	
	transition.to( screen, { time=700, xScale=.5, yScale=.5, transition=easing.outExpo } )
	bgWhiteTwo:toFront()
	bgWhiteTwo.alpha = 0
	
	local function removeBGTwo()
		bgWhiteTwo.alpha = 0
	end
	transition.to( bgWhiteTwo, { time=700, alpha = 1, transition=easing.outExpo, onComplete = removeBGTwo } )
	transition.to( bgWhiteTwo, { delay=1200, time=700, alpha = 0, transition=easing.outExpo} )
	
	timer.performWithDelay( 500, openMenu )
	
end

function callResetGameItems()
	resetGameItems(false)
end

function resetGameItems(isEndOfGame)


	if gamePuzzle then
		gamePuzzle:destroy()
		gamePuzzle = nil
	end
	

	for i = #cards, 1, -1 do
		
		if (cards[i].textGroup) then
			cards[i].textGroup:removeSelf()
			cards[i].textGroup = nil
		end
		if (cards[i].textGroup) then
			cards[i].textGroup:removeSelf()
			cards[i].textGroup = nil
		end
		if (cards[i].shadow) then
			cards[i].shadow:removeSelf()
			cards[i].shadow = nil
		end
		
		if (cards[i].xImage) then
			cards[i].xImage:removeSelf()
			cards[i].xImage = nil
		end
		
		if (MatchingTap) then cards[i]:removeEventListener( "touch", MatchingTap ) end
		if (ChoiceTap) then cards[i]:removeEventListener( "touch", ChoiceTap ) end
		if (ComplexChoiceTap) then cards[i]:removeEventListener( "touch", ComplexChoiceTap ) end
		if (CheckCounting) then cards[i]:removeEventListener( "touch", CheckCounting ) end
		if (checkSequenceAnswer) then cards[i]:removeEventListener( "touch", checkSequenceAnswer ) end
		if (checkQuestionAnswer) then cards[i]:removeEventListener( "touch", checkQuestionAnswer ) end
		cards[i]:removeSelf()
		cards[i] = nil
		table.remove(cards,i)
	end
	
	for i = #chosen, 1, -1 do
		chosen[i] = nil
		table.remove(chosen,i)
	end
	for i = #cardImages, 1, -1 do
		cardImages[i] = nil
		table.remove(cardImages,i)
	end
	for i = #cardPairs, 1, -1 do
		cardPairs[i] = nil
		table.remove(cardPairs,i)
	end
	if (gameplayMode == 2) then
		if (peekButton) then
			peekButton:removeEventListener( "touch", peek )
			peekButton:removeSelf()
			peekButton = nil
		end
	end
	
	if (goodJobTimer) then
		timer.cancel(goodJobTimer)
		goodJobTimer = nil
	end
	if (showAgainTimer) then
		timer.cancel(showAgainTimer)
		showAgainTimer = nil
	end
	if (automaticPeekTimer) then
		timer.cancel(automaticPeekTimer)
	end
	
	for i = #floaters, 1, -1 do
		table.remove(floaters, i)
	end
	
	if (question == "How many are" and curGame+1 % 2 == 0 or question ~= "How many are" or isEndOfGame == true) then
		if (howManyBackground) then
			howManyBackground:removeSelf()
			howManyBackground = nil
		end
		if (howManyImages) then
			for i = #howManyImages, 1, -1 do
				howManyImages[i]:removeSelf()
				howManyImages[i] = nil
			end
		end
		if (howManyGroup) then
			howManyGroup:removeSelf()
			howManyGroup = nil
		end
	end
	
	if (dots) then
		for i = #dots, 1, -1 do
			if (dots[i]) then
				dots[i]:removeSelf()
				dots[i] = nil
			end
		end
	end
	
	if (cardGroup) then
		cardGroup:removeSelf()
		cardGroup = nil
	end

	if (equationComplexGroup) then
		for i = equationComplexGroup.numChildren, 1, -1 do
			if (equationComplexGroup[i]) then
				equationComplexGroup[i]:removeSelf()
				equationComplexGroup[i] = nil
			end
		end
		equationComplexGroup:removeSelf()
		equationComplexGroup = nil
	end

	if (equationCardOptions) then
		for i = #equationCardOptions, 1, -1 do
			equationCardOptions[i] = nil
		end
	end
	
	choiceOne = "0"
	choiceTwo = "0"
	choiceThree = "0"
	answer = "0"
	choiceOneText.text = "_"
	choiceTwoText.text = "_"
	answerText.text = "_"
	
	choiceOneComplete = false
	choiceTwoComplete = false
	
	questionText.text = ""
	questionText.alpha = 0
	questionTextTwo.text = ""
	questionTextTwo.alpha = 0
	
	currentCountingNumber = 1
	timeToComplete = 0
	
	Runtime:removeEventListener( "enterFrame", cardFloat)
	Runtime:removeEventListener( "enterFrame", countTime )
	questionHitBox:removeEventListener( "touch", instructionsTouch )
	instructionsReplayButton:removeEventListener("touch", instructionsTouch)
	Runtime:removeEventListener( "onFTVKey", instructionsTouch )
	Runtime:removeEventListener( "key", instructionsTouch )
	
	if (checkQuestionAnswer) then Runtime:removeEventListener( "onFTVKey", checkQuestionAnswer ) end
	if (checkSequenceAnswer) then Runtime:removeEventListener( "onFTVKey", checkSequenceAnswer ) end
	if (CheckCounting) then Runtime:removeEventListener( "onFTVKey", CheckCounting ) end
	if (ChoiceTap) then Runtime:removeEventListener( "onFTVKey", ChoiceTap ) end
	if (ComplexChoiceTap) then Runtime:removeEventListener( "onFTVKey", ComplexChoiceTap ) end
	if (MatchingTap) then Runtime:removeEventListener( "onFTVKey", MatchingTap ) end

	if (checkQuestionAnswer) then Runtime:removeEventListener( "key", checkQuestionAnswer ) end
	if (checkSequenceAnswer) then Runtime:removeEventListener( "key", checkSequenceAnswer ) end
	if (CheckCounting) then Runtime:removeEventListener( "key", CheckCounting ) end
	if (ChoiceTap) then Runtime:removeEventListener( "key", ChoiceTap ) end
	if (ComplexChoiceTap) then Runtime:removeEventListener( "key", ComplexChoiceTap ) end
	if (MatchingTap) then Runtime:removeEventListener( "key", MatchingTap ) end

end

function goToTitleForRatePopup()

	buttonsActive = false

	changeBackground()
	menuUnload = true
	local function unloadMenu()
		menu.reset()
		menu.unload()
		menuUnload = false
		itemIndex = 0
	end
	timer.performWithDelay( 300, unloadMenu)
	
	
	closeSelectScreen()
	mainContainer.anchorX=0
	mainContainer.anchorY=0.5

	transition.to( mainContainer, { time=700, alpha = 0, x=mainContainer.width+2000, transition=easing.outExpo } )
	transition.to( backButton, { time=700, alpha=0, transition=easing.outExpo, onComplete = openMenu } )
	
	destroySelectButtons()
	title()
	onLevelSelectScreen = false
	currentState = "title"
	Runtime:addEventListener( "enterFrame", iapCardFloat)
	Runtime:removeEventListener( "enterFrame", sleepingCharAnim )
	 Runtime:removeEventListener( "enterFrame", zAnim )
	 if (char1Transition) then
		transition.cancel(char1Transition)
		char1Transition = nil
	 end
	 if (char2Transition) then
		transition.cancel(char2Transition)
		char2Transition = nil
	 end
	 if (char3Transition) then
		transition.cancel(char3Transition)
		char3Transition = nil
	 end
	 
	 
	 if (variation == 5) then
		
		if (showRateInline == true) then
	 
			 local function resetSelectScreen()
				menu.unload()
				menu.reset()
				loadScrollMenu()
			end
			timer.performWithDelay( 100, resetSelectScreen )
			
		end
	
		showRateInline = false
	
	end
	

end


function decideLevelOrder()

	for i = #levelOrder, 1, -1 do
		levelOrder[i] = nil
	end
	
	local set1, set2, set3, set4, set5
	
	if (variation == 4 or variation == 7 and gameplayType == 1) then
		set1 = { 2, 3, 6 }
		set2 = { 4, 5, 7 }
		set3 = { 1, 8 }
	elseif (variation == 5 or variation == 2 or variation == 7 and gameplayType == 2) then
		set1 = { 2, 3, 6 }
		set2 = { 4, 5, 7 }
		set3 = { 1, 8, 10 }
		set4 = { 9, 11, 12, 16 }
		set5 = { 13, 14, 15, 17 }
	end
	
	repeat 
		local chosenLevel = math.random(1, 3) 
		levelOrder[#levelOrder+1] = set1[chosenLevel]
		table.remove( set1, chosenLevel )
	until #set1 == 0
	repeat 
		local chosenLevel = math.random(1, 3) 
		levelOrder[#levelOrder+1] = set2[chosenLevel]
		table.remove( set2, chosenLevel )
	until #set2 == 0
	repeat
		local chosenLevel = math.random(1, 3) 
		levelOrder[#levelOrder+1] = set3[chosenLevel]
		table.remove( set3, chosenLevel )
	until #set3 == 0
	if (variation == 5 or variation ==2 or variation == 7 and gameplayType == 2) then
		repeat 
			local chosenLevel = math.random(1, 4) 
			levelOrder[#levelOrder+1] = set4[chosenLevel]
			table.remove( set4, chosenLevel )
		until #set4 == 0
		repeat 
			local chosenLevel = math.random(1, 4) 
			levelOrder[#levelOrder+1] = set5[chosenLevel]
			table.remove( set5, chosenLevel )
		until #set5 == 0
	end
	
end


function setOptions()

	levelOptions = gameDetails["level" .. level]
	gameOptions = gameLevelDetails
	
	questionOptions = gameOptions.question
	equationOptions = gameOptions.equation
	equationOptions = gameOptions.equation
	cardOptions = gameOptions.cards
	puzzleOptions = gameOptions.puzzle
	
	currentAnswersNumChosen = 0
	
	cardSettingsSpacing = nil
	cardSettingsSpacingV = nil

	
	if (gameOptions.gameType == "puzzle") then
		gameplayMode = 7
		
		playedGames[#playedGames+1] = "puzzle"
	elseif (gameOptions.gameType == "basket") then
		gameplayMode = 8
		
		question = gameOptions.gameType
		
		playedGames[#playedGames+1] = "basket"
		
	elseif (gameOptions.gameType == "basketEvenOdd" or
			gameOptions.gameType == "basketGreaterLessThan") then
		
		question = gameOptions.gameType
		questionsOptions = gameOptions.questions
		
		if (gameOptions.gameType == "basketGreaterLessThan") then
			gameplayMode = 13
			
			playedGames[#playedGames+1] = "basketGreaterLessThan"
		else
			gameplayMode = 14
			
			playedGames[#playedGames+1] = "basketEvenOdd"
		end
		
		local randomEvenOdd = math.random(1, 2)
		
		if (randomEvenOdd == 1 and questionsOptions.questionType2 == "random" or
				questionsOptions.questionType2 == "greater than" or
				questionsOptions.questionType2 == "even") then
			isEvenOdd = "even"
			isGreaterLessThan = "greater than"
		else
			isEvenOdd = "odd"
			isGreaterLessThan = "less than"
		end
		
	elseif (gameOptions.gameType == "puzzleSlots") then
		gameplayMode = 9
		
		playedGames[#playedGames+1] = "puzzleSlots"
	elseif (gameOptions.gameType == "touchCounting") then
		gameplayMode = 10
		
		playedGames[#playedGames+1] = "touchCounting"
	elseif (gameOptions.gameType == "touchTheNumber") then
		gameplayMode = 11
		
		playedGames[#playedGames+1] = "touchTheNumber"
		
	elseif (gameOptions.gameType == "bubbleCounting") then
		gameplayMode = 12
		
		playedGames[#playedGames+1] = "bubbleCounting"
	elseif (gameOptions.gameType == "cardSlots") then
		gameplayMode = 15
		
		playedGames[#playedGames+1] = "cardSlots"
	elseif (gameOptions.gameType == "matching") then
	
		matchingOptions = gameOptions.matching
	
		nextWaypoint = gameOptions.nextWaypoint
		
		isClassicMode = matchingOptions.classic
		
		if (matchingOptions.mode == "showme") then
			gameplayMode = 1
			
			if (matchingOptions.showMeMode and matchingOptions.showMeMode == 2) then
				showMeMode = 2 -- New Pick Color
			else
				showMeMode = nil -- Original
			end
			
			playingFirstPartShowMe = true
		else
			gameplayMode = 2
			
			showMeMode = nil
			
			playingFirstPartShowMe = true
		end
		startRange = cardOptions.startRange
		endRange = cardOptions.endRange
		matchingSign = matchingOptions.symbol
		if (matchingSign == "random") then
			local randomSign = math.random( 1, 2 )
			if (randomSign == 1) then
				matchingSign = "+"
			else
				matchingSign = "-"
			end
		end
		layout = matchingOptions.layout
		print("Layout " .. layout)
		
		local matchingType = cardOptions.category
		if (matchingType == "numbersToNumbers") then
			gameplayMatch = 1
		elseif (matchingType == "numbersToGroups") then
			gameplayMatch = 2
		elseif (matchingType == "groupsToGroups") then
			gameplayMatch = 3
		elseif (matchingType == "dotsToDots") then
			gameplayMatch = 4
		elseif (matchingType == "numbersToDots") then
			gameplayMatch = 5
		elseif (matchingType == "shapeToShape") then
			gameplayMatch = 6
		elseif (matchingType == "shapeToShapeItem") then
			gameplayMatch = 7
		elseif (matchingType == "shapeItemToShapeItem") then
			gameplayMatch = 8
		elseif (matchingType == "colorToColor") then
			gameplayMatch = 9
		elseif (matchingType == "colorToColorItem") then
			gameplayMatch = 10
		elseif (matchingType == "colorItemToColorItem") then
			gameplayMatch = 11
		elseif (matchingType == "colorToWord") then
			gameplayMatch = 12
		elseif (matchingType == "colorItemToWord") then
			gameplayMatch = 13
		elseif (matchingType == "item") then
			gameplayMatch = 14
		elseif (matchingType == "numbersToEquations") then
			gameplayMatch = 15
		end
		
		orderRandom = matchingOptions.numRandom
		
		print("Type of game: " .. gameplayMatch)
		
		playedGames[#playedGames+1] = "matching"
	elseif (gameOptions.gameType == "equation" or gameOptions.gameType == "complex equation") then
	
		equationsOptions = gameOptions.equations
		
		nextWaypoint = gameOptions.nextWaypoint
	
		gameplayMode = 3
		startRange = cardOptions.startRange
		endRange = cardOptions.endRange
		
		if (equationsOptions.sign == "random") then
			repeat randomSign = math.random(1,2)
			until prevSign ~= randomSign
			if (randomSign == 1) then
				equationSign = "+"
			else
				equationSign = "-"
			end
		else
			equationSign = equationsOptions.sign
		end
		numBlanks = equationsOptions.numBlanks
		choiceOneBlank = equationsOptions.choiceOneBlank
		choiceTwoBlank = equationsOptions.choiceTwoBlank
		if (gameOptions.gameType == "complex equation") then
			choiceThreeBlank = equationsOptions.choiceThreeBlank
		end
		answerBlank = equationsOptions.answerBlank
		numOrGroup = cardOptions.category
		numChoices = equationsOptions.numChoices
		
		choicesOrderRand = equationsOptions.choicesRandom
		
		playedGames[#playedGames+1] = "equation"
	elseif (gameOptions.gameType == "counting") then
	
		countingOptions = gameOptions.counting
	
		nextWaypoint = gameOptions.nextWaypoint
	
		gameplayMode = 4
		startRange = cardOptions.startRange
		endRange = cardOptions.endRange
		startNumber = countingOptions.startNum
		local matchingType = cardOptions.category
		if (matchingType == "numbers") then
			gameplayMatch = 1
		elseif (matchingType == "groups") then
			gameplayMatch = 2
		elseif (matchingType == "dots") then
			gameplayMatch = 3
		elseif ( matchingType == "all") then
			gameplayMatch = 4
		end
		
		row = countingOptions.rowNum
		column = countingOptions.columnNum
		
		if (startNumber == "random") then
		
			repeat
				startNumber = math.random(startRange, endRange)
			until countingOptions.placeMatch == 0 or
					countingOptions.placeMatch ~= 0 and startNumber % countingOptions.placeMatch == 0
					
		
		end
		
		spacing = countingOptions.spacing
		
		playedGames[#playedGames+1] = "counting"
	elseif (gameOptions.gameType == "sequence") then
	
		if (cardOptions.spacing) then
			cardSettingsSpacing = cardOptions.spacing
		else
			cardSettingsSpacing = nil
		end
	
		sequenceOptions = gameOptions.sequence
		
		nextWaypoint = gameOptions.nextWaypoint
		
		gameplayMode = 6
		startRange = cardOptions.startRange
		endRange = cardOptions.endRange
		numChoices = sequenceOptions.numChoices
		startNumber = sequenceOptions.startNum
		
		imageCount = sequenceOptions.numItems
		
		if (numChoices == "random") then
			repeat
				numChoices = math.random(3, 5)
			until endRange - numChoices > startRange
		end
		if (imageCount == "random") then
			repeat
				randomAnswer = math.random(4, 10)
			until prevGame ~= randomAnswer
			imageCount = randomAnswer
		end
		local tempPlaceMatch = sequenceOptions.placeMatch
		sequenceSkipAmount = sequenceOptions.skip
		if (sequenceOptions.placeMatch == "random") then
			local randomSkip = math.random(1, 3)
			
			if (randomSkip == 1) then
				sequenceSkipAmount = 2
			elseif (randomSkip == 2) then
				sequenceSkipAmount = 5
			else
				sequenceSkipAmount = 10
			end
			
			tempPlaceMatch = sequenceSkipAmount
		end
		if (startNumber == "random") then
			
			repeat
				startNumber = math.random(startRange, endRange)
			until tempPlaceMatch == 0 and endRange - numChoices > startNumber or
					tempPlaceMatch == 0 and endRange - numChoices <= startRange or
					tempPlaceMatch ~= 0 and endRange - numChoices > startNumber and startNumber % tempPlaceMatch == 0 or 
					tempPlaceMatch ~= 0 and endRange - numChoices <= startRange and startNumber % tempPlaceMatch == 0
					
		end
		
		startRange = math.random(startRange, endRange-numChoices)
		
		prevGame = randomAnswer
		
		playedGames[#playedGames+1] = "sequence"
	elseif (gameOptions.gameType == "question") then
	
		questionsOptions = gameOptions.questions
	
		nextWaypoint = gameOptions.nextWaypoint
	
		gameplayMode = 5
		choiceOneBlank, choiceTwoBlank, answerBlank = true, true, false
		numBlanks = 2
		equationSign = "+"
		questionSign = questionsOptions.symbol
		
		question = questionsOptions.questionType1
		questionTwo = questionsOptions.questionType2
		
		print("test")
		print(question)
		
		if (gameOptions.counting) then
			countingOptions = gameOptions.counting
			
			row = countingOptions.rowNum
			column = countingOptions.columnNum
			spacing = countingOptions.spacing
		end
		
		startRange = cardOptions.startRange
		endRange = cardOptions.endRange
		
		numAnswers = questionsOptions.numAnswers
		if (question == "Which 2 numbers add up to" and numAnswers == "random") then
			local randomNumAnswers = math.random( 1, 2 )
			if (randomNumAnswers == 1 and numChoices >= 4) then
				numAnswers = 3
			else
				numAnswers = 2
			end
		end
		
		numChoices = questionsOptions.numChoices
		
		if (questionsOptions.skip == "random") then
			local tempNum = math.random(1,2)
			if (tempNum == 1) then
				groupSkip = 2
			elseif (tempNum == 2) then
				groupSkip = 5
			end
		else
			groupSkip = questionsOptions.skip
		end
		
		if (question == "How many apples" and questionTwo == "random") then
			repeat
				randomGame = math.random(1, 2)
			until prevGame ~= randomGame
			prevGame = randomGame
			if (randomGame == 1) then
				questionTwo = "add"
			else
				questionTwo = "subtract"
			end
		end
		
		if (question == "How many" and questionTwo == "random") then
			
			if (randomImage == 0) then
				randomImage = math.random(1, #howManyImageList)
			end
			
			randomImage = randomImage + 1
			if (randomImage > #howManyImageList) then
				randomImage = 1
			end
		
			questionTwo = howManyImageList[randomImage].image
			
			if (groupSkip == 2) then
				repeat randomGroupImage = math.random( 1, 2 )
				until prevGroupImage ~= randomGroupImage
				questionTwo = howManyGroupList[randomGroupImage].image
			elseif (groupSkip == 5) then
				repeat randomGroupImage = math.random( 3, 4 )
				until prevGroupImage ~= randomGroupImage
				questionTwo = howManyGroupList[randomGroupImage].image
			elseif (groupSkip == 10) then
				repeat randomGroupImage = math.random( 5, 6 )
				until prevGroupImage ~= randomGroupImage
				questionTwo = howManyGroupList[randomGroupImage].image
			end
			prevGroupImage = randomGroupImage
			
			
		elseif (question == "How many apples" and questionTwo == "add") then
			repeat randomItem = math.random(1, #howManyApplesList)
			until prevApples ~= randomItem
			prevApples = randomItem
			appleGameImage = howManyApplesList[randomItem].image
			question = "How many more apples do you need to make"
			
			repeat
				if (startRange == 1 or startRange == 0) then
					questionTwo = math.random(2, endRange)
				else
					local randomAnswerQuestion = math.random(1,2)
					if (randomAnswerQuestion == 1) then
						questionTwo = math.random(startRange, endRange)
					else
						if (startRange + 1 <= endRange - 1) then
							questionTwo = math.random(startRange+1, endRange-1)
						elseif (startRange <= endRange - 1) then
							questionTwo = math.random(startRange, endRange-1)
						else
							questionTwo = math.random(startRange, endRange)
						end
					end
				end
			until endRange <= 2 or prevAppleAnswer == nil or prevAppleAnswer ~= questionTwo
			prevAppleAnswer = questionTwo
			
		elseif (question == "How many apples" and questionTwo == "subtract") then
			repeat randomItem = math.random(1, #howManyApplesList)
			until prevApples ~= randomItem
			prevApples = randomItem
			appleGameImage = howManyApplesList[randomItem].image
			question = "How many apples do you need to take away to leave"
			local randomAnswerQuestion = math.random(1,2)
			
			repeat
				if (randomAnswerQuestion == 1) then
					questionTwo = math.random(startRange, endRange-1)
				else
					if (startRange + 1 <= endRange - 2) then
						questionTwo = math.random(startRange+1, endRange-2)
					elseif (startRange <= endRange - 2) then
						questionTwo = math.random(startRange, endRange-2)
					else
						questionTwo = math.random(startRange, endRange-1)
					end
				end
			until startRange >= endRange-2 or prevAppleAnswer == nil or prevAppleAnswer ~= questionTwo
			prevAppleAnswer = questionTwo
			
		elseif (question == "How many are" and questionTwo == "random") then
				
				
			if (#prevHowManyAreItem > #howManyAreCategories - 3) then
				for i = #prevHowManyAreItem-3, 1, -1 do
					table.remove( prevHowManyAreItem, i )
				end
			end
			
			local wasRepeated = false
			repeat
				wasRepeated = false
				
				if (questionsOptions.showYellow == false and questionsOptions.showGreen == true) then
					randomHowManyAreItem = math.random( 1, 6 )
				elseif (questionsOptions.showYellow == false) then
					randomHowManyAreItem = math.random( 1, 5 )
				else
					randomHowManyAreItem = math.random( 1, 7 )
				end
				
				for i = 1, #prevHowManyAreItem do
					if (prevHowManyAreItem[i] == randomHowManyAreItem) then
						wasRepeated = true
					end
				end
			until wasRepeated == false
			prevHowManyAreItem[#prevHowManyAreItem+1] = randomHowManyAreItem
			
			
			howManyAnswer = randomHowManyAreItem
			
			print(questionsOptions.showYellow)
			print(questionsOptions.showGreen)
			
			if (questionsOptions.showYellow == false and questionsOptions.showGreen == true) then
				questionTwo = howManyAreCategories[randomHowManyAreItem]
				print("Question Two: " .. howManyAreCategories[randomHowManyAreItem])
			elseif (questionsOptions.showYellow == false) then
				questionTwo = howManyAreCategoriesAlt2[randomHowManyAreItem]
				print("Question Two: " .. howManyAreCategoriesAlt2[randomHowManyAreItem])
			else
				questionTwo = howManyAreCategoriesAlt[randomHowManyAreItem]
				print("Question Two: " .. howManyAreCategoriesAlt[randomHowManyAreItem])
			end
		
		elseif (questionTwo == "FirstLast"
					or questionTwo == "MostLeast"
					or questionTwo == "BiggerSmaller"
					or questionTwo == "GreaterLess") then
			
			if (cardOptions.spacing) then
				cardSettingsSpacing = cardOptions.spacing
			else
				cardSettingsSpacing = nil
			end
			
			repeat
				randomGame = math.random(1, 2)
			until prevGame ~= randomGame
			prevGame = randomGame
			if (randomGame == 1) then 
				if (questionTwo == "FirstLast") then
					questionTwo = "last" 
				elseif (questionTwo == "MostLeast") then
					questionTwo = "most" 
				elseif (questionTwo == "GreaterLess") then
						questionTwo = "greatest" 
				else
					questionTwo = "bigger" 
				end
			else
				if (questionTwo == "FirstLast") then
					questionTwo = "first"
				elseif (questionTwo == "MostLeast") then
					questionTwo = "least"
				elseif (questionTwo == "GreaterLess") then
						questionTwo = "least" 
				else
					questionTwo = "smaller" 
				end
			end
			
		elseif (question == "Which 2 numbers add up to" and questionTwo ~= "random") then
			
			if (cardOptions.spacing) then
				cardSettingsSpacing = cardOptions.spacing
			else
				cardSettingsSpacing = nil
			end
			
			questionTwo = questionsOptions.questionType2
			answer = questionTwo
		elseif (question == "Which 2 numbers add up to" and questionTwo == "random") then
			
			if (cardOptions.spacing) then
				cardSettingsSpacing = cardOptions.spacing
			else
				cardSettingsSpacing = nil
			end
			
			local randomOneAnswer = math.random( 1, 5 )
			
			print(prevAddGame)
			
			repeat
				if (randomOneAnswer == 1 and prevAddGame ~= 4 and prevAddGame ~= 3 and prevAddGame ~= 5) then
					if (numAnswers == 2 and startRange < 3 and endRange > 4) then
						questionTwo = math.random(4, endRange-1)
					elseif (numAnswers == 3 and startRange < 6 and endRange > 7) then
						questionTwo = math.random(7, endRange-1)
					 elseif (startRange+1 < endRange-1) then
						questionTwo = math.random(startRange+1, endRange-1)
					else
						questionTwo = math.random(startRange, endRange)
					end
				else
					if (numAnswers == 2 and startRange < 3) then
						questionTwo = math.random(3, endRange)
					elseif (numAnswers == 3 and startRange < 6) then
						questionTwo = math.random(6, endRange)
					 else
						questionTwo = math.random(startRange, endRange)
					end
				end
			until prevAddGame ~= questionTwo and numAnswers == 2 and questionTwo - 1 >= numChoices or
					prevAddGame ~= questionTwo and numAnswers == 2 and questionTwo >= numChoices and endRange < 6 or
					prevAddGame ~= questionTwo and numAnswers == 3 and questionTwo ~= 21 
					or questionTwo == 3 and questionTwo >= numChoices
					
			prevAddGame = questionTwo
			answer = questionTwo
			
			
			if (numAnswers == 2) then
				numBlanks = 2
			else
				numBlanks = 3
			end
		
		
		elseif (question == "Which is") then
			
			if (cardOptions.spacing) then
				cardSettingsSpacing = cardOptions.spacing
			else
				cardSettingsSpacing = nil
			end
			
			
			if (questionTwo == "random") then
				local randomQuestionTwo = math.random( 1, 2 )
				if (randomQuestionTwo == 1) then
					questionTwo = "more than"
				else
					questionTwo = "less than"
				end
			end
			
			print("more than")
			
			local randomAnswerWhichIs
			repeat
				if (questionsOptions.skip == "random") then
					local tempNum = math.random(1,5)
					if (tempNum == 1) then
						groupSkip = 2
					elseif (tempNum == 2) then
						groupSkip = 4
					elseif (tempNum == 3) then
						groupSkip = 5
					elseif (tempNum == 4) then
						groupSkip = 10
					elseif (tempNum == 5) then
						groupSkip = 20
					end
				elseif (questionsOptions.skip == "randomRange") then
					groupSkip = math.random(questionsOptions.skipMin, questionsOptions.skipMax)
				end
			
				whichIsSecondNum = math.random(startRange, endRange)
				
				if (questionTwo == "more than") then
					randomAnswerWhichIs = whichIsSecondNum + groupSkip
				else
					randomAnswerWhichIs = whichIsSecondNum  - groupSkip
				end
				
			until prevGame ~= randomAnswerWhichIs and randomAnswerWhichIs > 0 and randomAnswerWhichIs < 999
			prevGame = randomAnswerWhichIs
			whichIsMoreLessThanAnswer = randomAnswerWhichIs
		
			print(whichIsMoreLessThanAnswer)
		
		elseif (question == "Which one is a") then
		
			if (cardOptions.spacing) then
				cardSettingsSpacing = cardOptions.spacing
			else
				cardSettingsSpacing = nil
			end
			if (cardOptions.vSpacing) then
				cardSettingsSpacingV = cardOptions.vSpacing
			else
				cardSettingsSpacingV = nil
			end
		
			if (prevWhichOneIsA == nil or
				#prevWhichOneIsA > startRange-endRange) then
				prevWhichOneIsA = {}
			end
		
			if (questionTwo == "random") then
				local hasRepeated = false
				repeat
					hasRepeated = false
				
					randomShape = math.random( startRange, endRange )
					
					for i = 1, #prevWhichOneIsA do
						if (prevWhichOneIsA[i] == randomShape) then
							hasRepeated = true
						end
					end
				until prevGame ~= randomShape and hasRepeated == false
			else
				if (cardOptions.category == "shape" or cardOptions.category == "shapeItem") then
					for i = 1, #firstShapeSet do
						if (firstShapeSet[i] == questionTwo) then
							randomShape = i
						end
					end
				else
					for i = 1, #firstColorSet do
						if (firstColorSet[i] == questionTwo) then
							randomShape = i
						end
					end
				end
			end
			prevGame = randomShape
			
			prevWhichOneIsA[#prevWhichOneIsA+1] = randomShape
			
			if (cardOptions.category == "shape" or cardOptions.category == "shapeItem") then
				questionTwo = firstShapeSet[randomShape]
			else
				questionTwo = firstColorSet[randomShape]
			end
			shapeAnswer = randomShape
		
		elseif (question == "TrueOrFalse" and questionTwo == "random") then
		
			if (cardOptions.spacing) then
				cardSettingsSpacing = cardOptions.spacing
			else
				cardSettingsSpacing = nil
			end
		
			local randomQuestionTwo = math.random( 1, 2 )
			if (randomQuestionTwo == 1) then
				questionTwo = "oneEquation"
			else
				questionTwo = "twoEquations"
			end
			
			if (questionTwo == "twoEquations") then
				startRange = 1
				endRange = 10
			end
		elseif (question == "TrueOrFalse" and questionTwo == "twoEquations") then
			
			if (cardOptions.spacing) then
				cardSettingsSpacing = cardOptions.spacing
			else
				cardSettingsSpacing = nil
			end
			
			startRange = 1
			endRange = 10
		elseif (question == "TrueOrFalse" and questionTwo == "oneEquation") then
			
			if (cardOptions.spacing) then
				cardSettingsSpacing = cardOptions.spacing
			else
				cardSettingsSpacing = nil
			end
			
		
		elseif (question == "Which sentence" and questionTwo == "random" or
					question == "Word problem" and questionTwo == "random") then
		
		
			if (cardOptions.spacing) then
				cardSettingsSpacing = cardOptions.spacing
			else
				cardSettingsSpacing = nil
			end
		
			local randomQuestionTwo = math.random( 1, 2 )
			if (randomQuestionTwo == 1) then
				questionTwo = "addition"
			else
				questionTwo = "subtraction"
			end
		
		end
		
		
		if (question == "Word problem") then
		
			print("word test 1")
			
			if (cardOptions.spacing) then
				cardSettingsSpacing = cardOptions.spacing
			else
				cardSettingsSpacing = nil
			end
		
			local randomAnswer
			repeat
				if (startRange < 2) then
					choiceOne = math.random( 2, endRange )
					
					if (questionTwo == "addition") then
						choiceTwo = math.random( 2, endRange )
					else
						choiceTwo = math.random( 1, endRange )
					end
				else
					choiceOne = math.random( startRange, endRange )
					choiceTwo = math.random( startRange, endRange )
				end
				
				if (questionTwo == "addition") then
					randomAnswer = choiceOne + choiceTwo
				else
					randomAnswer = choiceOne - choiceTwo
				end
				
			until prevWordProblemAnswer ~= randomAnswer and randomAnswer > 0  and randomAnswer <= 100
			prevWordProblemAnswer = randomAnswer
			
			print("word test 2")
			
		end
		
		
		if (question == "Which number is") then
			if (cardOptions.spacing) then
				cardSettingsSpacing = cardOptions.spacing
			else
				cardSettingsSpacing = nil
			end
		end
		
		
		numAnswers = questionsOptions.numAnswers
		
		
		imagesScattered = questionsOptions.scattered
		imageCount = questionsOptions.imageCount
		
		
		if (question == "PickEvenOdd" or question == "AllGreaterLessThan") then
			local randomEvenOdd = math.random(1, 2)
			
			if (randomEvenOdd == 1 and questionsOptions.questionType2 ~= "even" and
				questionsOptions.questionType2 ~= "odd" or
				questionsOptions.questionType2 == "even") then
				isEvenOdd = "even"
				isGreaterLessThan = "greater than"
			elseif (randomEvenOdd == 2 and questionsOptions.questionType2 ~= "odd" and
					questionsOptions.questionType2 ~= "even" or
					questionsOptions.questionType2 == "odd") then
				isEvenOdd = "odd"
				isGreaterLessThan = "less than"
			end
			
			local matchingType = cardOptions.category
			if (matchingType == "numbers") then
				gameplayMatch = 1
			elseif (matchingType == "groups") then
				gameplayMatch = 2
			elseif (matchingType == "dots") then
				gameplayMatch = 3
			elseif ( matchingType == "all") then
				gameplayMatch = 4
			end
			
		end
		
		
		if (question == "How many" and imageCount == "random" or 
			question == "How many are" and imageCount == "random") then
			
			repeat
				randomAnswer = math.random(startRange, endRange)
			until prevGame ~= randomAnswer and randomAnswer % groupSkip == 0
			prevGame = randomAnswer
			imageCount = randomAnswer
			
		end
		numOrGroup = cardOptions.category
		
		
		if (question == "Word problem" and numOrGroup == "operations") then
			numChoices = 2
		end
		
		print("Answer: " .. questionTwo)
		
		playedGames[#playedGames+1] = question
		
		
	end
	
	if (playingRandomGame == true) then
	
		local numGamesCompleted = 0
		local completeGames = 0
		repeat
			numGamesCompleted = numGamesCompleted + 1
			completeGames = completeGames + randomLevelDetails["random" .. randomLevelChallenge].waypointSkip[numGamesCompleted]
		until completeGames >= curGame
		
		if (completeGames == curGame) then
			nextWaypoint = true
		else
			nextWaypoint = false
		end
		
	else
		nextWaypoint = gameOptions.nextWaypoint
	end
	

end

function instructionsTouch( event )
	
	if ( (event.phase == "began" and buttonsActive == true and gameCompleted == false) or 
		(event.phase == "down" and buttonsActive == true and gameCompleted == false) ) then
		
		
		if (event.keyName and event.keyName == "buttonY" or 
			event.keyName and event.keyName == "mediaPlayPause" or
			system.getInfo ("model") == "Apple TV" and event.keyName == "buttonX" or
			event.keyName == nil) then
	
			playInstructionsAudio(true)
		end
	end
	
end


function nextGame()

	levelOptions = gameDetails["level" .. level]
	
	if (playingRandomGame == true) then
	
		print("playing random level")
		print(randomLevelDetails["random" .. randomLevelChallenge].text)
		
		if (randomLevelDetails["random" .. randomLevelChallenge].games[curGame] and randomLevelDetails["random" .. randomLevelChallenge].games[curGame].chooseRandom[1] ~= "") then
			if (randomLevelDetails["random" .. randomLevelChallenge].games[curGame].chooseRandom[1] == "range") then
				currentRandomGame = math.random(randomLevelDetails["random" .. randomLevelChallenge].games[curGame].chooseRandom[2], randomLevelDetails["random" .. randomLevelChallenge].games[curGame].chooseRandom[3])
			else
				local randomIndex = math.random(1,#randomLevelDetails["random" .. randomLevelChallenge].games[curGame].chooseRandom-1)
				currentRandomGame = randomLevelDetails["random" .. randomLevelChallenge].games[curGame].chooseRandom[randomIndex+1]
			end
		else
			if (randomLevelDetails["random" .. randomLevelChallenge].chooseRandom[1] == "range") then
				currentRandomGame = math.random(randomLevelDetails["random" .. randomLevelChallenge].chooseRandom[2], randomLevelDetails["random" .. randomLevelChallenge].chooseRandom[3]-1)
			else
				local randomIndex = math.random(1,#randomLevelDetails["random" .. randomLevelChallenge].chooseRandom-1)
				currentRandomGame = randomLevelDetails["random" .. randomLevelChallenge].chooseRandom[randomIndex+1]
			end
		end
	
		print(currentRandomGame)
	
		if (randomLevelDetails["random" .. randomLevelChallenge].games[curGame] and randomLevelDetails["random" .. randomLevelChallenge].games[curGame].category ~= "") then
			print("Test1")
			gameLevelDetails = randomGameDetails[randomLevelDetails["random" .. randomLevelChallenge].games[curGame].category][currentRandomGame]
		elseif (randomLevelDetails["random" .. randomLevelChallenge].category ~= "") then
			print("Test2")
			gameLevelDetails = randomGameDetails[randomLevelDetails["random" .. randomLevelChallenge].category][currentRandomGame]
		else
			print("Test3")
		
			local newCategory = randomLevelDetails.randomLevelOptions[math.random(1, #randomLevelDetails.randomLevelOptions)]
			
			gameLevelDetails = randomGameDetails[newCategory][currentRandomGame]
			
		end
		
		
	else
		gameLevelDetails = levelOptions["game" .. curGame]
	end
	
	
	gameOptions = gameLevelDetails
	
	questionOptions = gameOptions.question
	equationOptions = gameOptions.equation
	equationOptions = gameOptions.equation
	cardOptions = gameOptions.cards
	
	local completeGames = 0
	if (playingRandomGame == true) then
		for i = 1, #randomLevelDetails["random" .. randomLevelChallenge].waypointSkip do
			completeGames = completeGames + randomLevelDetails["random" .. randomLevelChallenge].waypointSkip[i]
		end
	else
		for key,value in pairs(levelOptions) do
			completeGames = completeGames + 1
		end
	end
	
	
	if (curGame < completeGames+1 ) then
	
		correctAnswer = nil
		gameCompleted = false
	
		
		scaleCards = cardOptions.scale
		
		if (cardGroup) then
			cardGroup:removeSelf()
			cardGroup = nil
		end
		
		cardGroup = display.newGroup()
		cardGroup.x = 0
		cardGroup.y = 0
		
		
		print("Waypoint: " .. currentWaypoint)
		
		print(currentRandomGame)
		
		Runtime:addEventListener( "enterFrame", countTime )
		
		
		setOptions()
		print(gameplayMode)
		if (gameplayMode == 3) then
			AddEquation()
		elseif (gameplayMode == 4 or
				gameplayMode == 5 and question == "PickEvenOdd" or
				gameplayMode == 5 and question == "AllGreaterLessThan") then
			AddCountingGame()
		elseif (gameplayMode == 5) then
			AddQuestionGame()
		elseif (gameplayMode == 6) then
			AddSequenceGame()
		elseif (gameplayMode == 7) then
			gamePuzzle = require("Scripts.gamePuzzle").new()
		elseif (gameplayMode == 8 or gameplayMode == 13 or gameplayMode == 14) then
			gamePuzzle = require("Scripts.gameBasket").new()
		elseif (gameplayMode == 9) then
			gamePuzzle = require("Scripts.gamePuzzleSlots").new()
		elseif (gameplayMode == 10) then
			gamePuzzle = require("Scripts.gameCounting").new()
		elseif (gameplayMode == 11) then
			gamePuzzle = require("Scripts.gameTouchTheNumber").new()
		elseif (gameplayMode == 12) then
			gamePuzzle = require("Scripts.gameCountingBubble").new()
		elseif (gameplayMode == 15) then
			gamePuzzle = require("Scripts.gameCardSlots").new()
		else
			AddMatchCards()
		end
		
		local function addInstructionsListener()
			questionHitBox:addEventListener( "touch", instructionsTouch )
			instructionsReplayButton:addEventListener("touch", instructionsTouch)
			
			if (myData.isController) then
				Runtime:addEventListener( "key", instructionsTouch )
			elseif (myData.isFireTV) then 
				Runtime:addEventListener( "onFTVKey", instructionsTouch )
			end
		end
		timer.performWithDelay( 700, addInstructionsListener )
		playInstructionsAudio(false)
		
		
		cardGroup.y = halfH + cardOptions.offsetY
		
		
		questionText.xScale = questionOptions.scale
		questionText.yScale = questionOptions.scale
		questionText.anchorX=0.5 
		questionText.anchorY=0.5 
		
		
		questionText.y = questionText.initY
		questionText.x = 1000
		questionText.y = questionText.initY + questionOptions.offsetY
		questionHitBox.y = questionText.y - 10
		
		if system.getInfo( "platformName" ) == "Android" then
			if (gameOptions.gameType == "sequence" and cardOptions.category == "items") then
				questionText.y = questionText.y - androidTextOffsetY - 10
			else
				questionText.y = questionText.y - androidTextOffsetY
			end
		end
		
		questionTextTwo.xScale = questionOptions.scale
		questionTextTwo.yScale = questionOptions.scale
		questionTextTwo.anchorX=0.5 
		questionTextTwo.anchorY=0.5 
		
		questionTextTwo.y = questionText.y + 20
		questionTextTwo.x = 1000
		
		cardGroup:toFront()
		
		
		levelOptions = gameDetails["level" .. level]
		gameOptions = gameLevelDetails
		cardOptions = gameOptions.cards
		
		local function showCursor()
		
		
			cursor.xScale = cardOptions.scale -- Hand Cursor
			cursor.yScale = cardOptions.scale
			
			cursor:toFront()
			
		
			currentCardSelected = 1
			
			
			if (cards and #cards > 0) then
				
				if (gameplayMode == 4) then
					for i = 1, #cards do
						if (cards[i].id < cards[currentCardSelected].id) then
							currentCardSelected = i
						end
					end
				end
				
				if (cards[currentCardSelected].rotation == 0) then
					cursor.x, cursor.y = cards[currentCardSelected]:localToContent( cards[currentCardSelected].contentWidth*0.37, cards[currentCardSelected].contentHeight*0.5 )
				else
					cursor.x, cursor.y = cards[currentCardSelected]:localToContent( cards[currentCardSelected].contentWidth*0.41, cards[currentCardSelected].contentHeight*-0.52 )
				end
				
				
				targetCard = cards[currentCardSelected]
				cursorTransition = transition.to( cursor, { time=700, alpha=1 } )
			
			end
		
		end
		if (gameplayMode ~= 9 and gameplayMode ~= 15 and
			gameplayMode ~= 8 and gameplayMode ~= 13 and gameplayMode ~= 14) then
			if (myData.isTV or gameplayMode == 4) then
				cursorTransition = timer.performWithDelay( 700, showCursor )
			end
		end
	
	elseif (numGamesLeft == 0) then
	
		saveLevelData()
		
	end
	

end

function setUpEquationTables()

	equationAddition3 = 1
	equationAddition5 = 1
	equationSubtraction3 = 1
	equationSubtraction5 = 1
	
	
	randomizeTable(additionEquations3)
	randomizeTable(additionEquations5)
	randomizeTable(subtractionEquations3)
	randomizeTable(subtractionEquations5)

end

function puzzleOptionsOld()
	
	currentObjectSet = 1
	objectSets = {
		
		{ id = 1, image = "Egg", VO = "egg", maskSet = { 11, 19 }, w = 160, h = 212, slotW = 168, slotH = 216, puzzleOffsetX = 0, puzzleOffsetY = 7, slotOffsetX = 0, slotOffsetY = 0 },
		{ id = 3, image = "Ball", VO = "ballVO", maskSet = { 19 }, w = 192, h = 192, slotW = 196, slotH = 196, puzzleOffsetX = 0, puzzleOffsetY = 4, slotOffsetX = 0, slotOffsetY = 0 },
		{ id = 4, image = "Owl", VO = "owlVO", maskSet = { 19 }, w = 240, h = 216, slotW = 244, slotH = 220, puzzleOffsetX = 0, puzzleOffsetY = 7, slotOffsetX = 0, slotOffsetY = 0 },
		{ id = 5, image = "Tree", VO = "tree", maskSet = { 12, 19 }, w = 184, h = 220, slotW = 188, slotH = 224, puzzleOffsetX = 0, puzzleOffsetY = 8, slotOffsetX = 0, slotOffsetY = 0 },
		{ id = 6, image = "Barrel", VO = "barrel", maskSet = { 11, 19 }, w = 156, h = 200, slotW = 160, slotH = 204, puzzleOffsetX = 0, puzzleOffsetY = 5, slotOffsetX = 0, slotOffsetY = 0 },
		{ id = 8, image = "Banana", VO = "banana", maskSet = { 14 }, w = 264, h = 200, slotW = 268, slotH = 204, puzzleOffsetX = 0, puzzleOffsetY = 0, slotOffsetX = 0, slotOffsetY = 0 },
		{ id = 10, image = "Eggplant", VO = "eggplant", maskSet = { 16 }, w = 228, h = 168, slotW = 236, slotH = 172, puzzleOffsetX = 0, puzzleOffsetY = 0, slotOffsetX = 0, slotOffsetY = 0 },
		{ id = 14, image = "RedBird", VO = "bird", maskSet = { 21 }, w = 204*0.98, h = 208*0.98, slotW = 208*0.98, slotH = 212*0.98, puzzleOffsetX = 0, puzzleOffsetY = 10, slotOffsetX = 0, slotOffsetY = 0 },
		
		
	}
	randomizeTable(objectSets)
	randomizeTable(objectSets)
	
	colorSets = {
		{ id = 3, image = "Ball", preVO = "orange", VO = "balls", maskSet = { 19 }, w = 192, h = 192, slotW = 196, slotH = 196, puzzleOffsetX = 0, puzzleOffsetY = 4, slotOffsetX = 0, slotOffsetY = 0 },
		{ id = 4, image = "Owl", preVO = "blue", VO = "owlVO", maskSet = { 19 }, w = 240, h = 216, slotW = 244, slotH = 220, puzzleOffsetX = 0, puzzleOffsetY = 7, slotOffsetX = 0, slotOffsetY = 0 },
		{ id = 7, image = "Acorn", preVO = "brown", VO = "acorn", maskSet = { 19, 12 }, w = 192, h = 232, slotW = 196, slotH = 236, puzzleOffsetX = 0, puzzleOffsetY = 12, slotOffsetX = 0, slotOffsetY = 0 },
		{ id = 8, image = "Banana", preVO = "yellow", VO = "banana", maskSet = { 14 }, w = 264, h = 200, slotW = 268, slotH = 204, puzzleOffsetX = 0, puzzleOffsetY = 0, slotOffsetX = 0, slotOffsetY = 0 },
		{ id = 14, image = "RedBird", preVO = "red", VO = "blueBird", maskSet = { 21 }, w = 204*0.98, h = 208*0.98, slotW = 208*0.98, slotH = 212*0.98, puzzleOffsetX = 0, puzzleOffsetY = 10, slotOffsetX = 0, slotOffsetY = 0 },
		{ id = 10, image = "Eggplant", preVO = "purple", VO = "eggplant", maskSet = { 16 }, w = 228, h = 168, slotW = 236, slotH = 172, puzzleOffsetX = 0, puzzleOffsetY = 0, slotOffsetX = 0, slotOffsetY = 0 },
		{ id = 11, image = "Leaf", preVO = "green", VO = "leaf", maskSet = { 15 }, w = 248, h = 164, slotW = 252, slotH = 168, puzzleOffsetX = 0, puzzleOffsetY = 1, slotOffsetX = 0, slotOffsetY = 0 },
		
	}
	randomizeTable(colorSets)
	randomizeTable(colorSets)
	
	shapeSets = {
		{ id = 3, image = "Circle", VO = "circle", maskSet = { 19 }, w = 192, h = 192, slotW = 196, slotH = 196, puzzleOffsetX = 0, puzzleOffsetY = 4, slotOffsetX = 0, slotOffsetY = 0 },
		{ id = 3, image = "Star", VO = "star", maskSet = { 19 }, w = 188, h = 180, slotW = 192, slotH = 184, puzzleOffsetX = 0, puzzleOffsetY = 4, slotOffsetX = 0, slotOffsetY = 0 },
		{ id = 3, image = "Square", VO = "square", maskSet = { 21 }, w = 188, h = 188, slotW = 192, slotH = 192, puzzleOffsetX = 0, puzzleOffsetY = 4, slotOffsetX = 0, slotOffsetY = 0 },
		{ id = 3, image = "Oval", VO = "oval", maskSet = { 19 }, w = 148, h = 188, slotW = 152, slotH = 192, puzzleOffsetX = 0, puzzleOffsetY = 4, slotOffsetX = 0, slotOffsetY = 0 },
		{ id = 3, image = "Rhombus", VO = "rhombus", maskSet = { 19 }, w = 150, h = 232, slotW = 150, slotH = 232, puzzleOffsetX = 0, puzzleOffsetY = 4, slotOffsetX = 0, slotOffsetY = 0 },
		{ id = 3, image = "Rectangle", VO = "rectangle", maskSet = { 21 }, w = 188, h = 156, slotW = 192, slotH = 160, puzzleOffsetX = 0, puzzleOffsetY = 4, slotOffsetX = 0, slotOffsetY = 0 },
		{ id = 3, image = "Pentagon", VO = "pentagon", maskSet = { 19 }, w = 204, h = 192, slotW = 208, slotH = 196, puzzleOffsetX = 0, puzzleOffsetY = 4, slotOffsetX = 0, slotOffsetY = 0 },
		{ id = 3, image = "Octagon", VO = "octagon", maskSet = { 19 }, w = 188, h = 188, slotW = 192, slotH = 192, puzzleOffsetX = 0, puzzleOffsetY = 4, slotOffsetX = 0, slotOffsetY = 0 },
		{ id = 3, image = "Heart", VO = "heart", maskSet = { 19 }, w = 204, h = 188, slotW = 208, slotH = 192, puzzleOffsetX = 0, puzzleOffsetY = 4, slotOffsetX = 0, slotOffsetY = 0 },
		{ id = 3, image = "Triangle", VO = "triangle", maskSet = { 19 }, w = 196, h = 168, slotW = 200, slotH = 172, puzzleOffsetX = 0, puzzleOffsetY = 4, slotOffsetX = 0, slotOffsetY = 0 },
	}
	randomizeTable(shapeSets)
	randomizeTable(shapeSets)
	
end

function puzzleOptionsSettings()
	
	currentObjectSet = 1
	objectSets = {
		
		
		{ id = 1, image = "Egg", VO = "egg", maskSet = { 11, 19 }, w = 160, h = 212, slotW = 168, slotH = 216, puzzleOffsetX = 0, puzzleOffsetY = 7, slotOffsetX = 0, slotOffsetY = 0 },
		{ id = 2, image = "Donut", VO = "circleDonut", maskSet = { 19 }, w = 220, h = 216, slotW = 224, slotH = 220, puzzleOffsetX = 0, puzzleOffsetY = 7, slotOffsetX = 0, slotOffsetY = 0 },
		{ id = 3, image = "Ball", VO = "ballVO", maskSet = { 19 }, w = 192, h = 192, slotW = 196, slotH = 196, puzzleOffsetX = 0, puzzleOffsetY = 4, slotOffsetX = 0, slotOffsetY = 0 },
		{ id = 4, image = "Owl", VO = "blueOwl", maskSet = { 19 }, w = 240, h = 216, slotW = 244, slotH = 220, puzzleOffsetX = 0, puzzleOffsetY = 7, slotOffsetX = 0, slotOffsetY = 0 },
		{ id = 5, image = "Tree", VO = "tree", maskSet = { 12, 19 }, w = 184, h = 220, slotW = 188, slotH = 224, puzzleOffsetX = 0, puzzleOffsetY = 8, slotOffsetX = 0, slotOffsetY = 0 },
		{ id = 6, image = "Barrel", VO = "barrel", maskSet = { 11, 19 }, w = 156, h = 200, slotW = 160, slotH = 204, puzzleOffsetX = 0, puzzleOffsetY = 5, slotOffsetX = 0, slotOffsetY = 0 },
		{ id = 7, image = "Acorn", VO = "acorn", maskSet = { 19, 12 }, w = 192, h = 232, slotW = 196, slotH = 236, puzzleOffsetX = 0, puzzleOffsetY = 12, slotOffsetX = 0, slotOffsetY = 0 },
		{ id = 8, image = "Banana", VO = "banana", maskSet = { 14 }, w = 264, h = 200, slotW = 268, slotH = 204, puzzleOffsetX = 0, puzzleOffsetY = 0, slotOffsetX = 0, slotOffsetY = 0 },
		{ id = 9, image = "Watermelon", VO = "watermelon", maskSet = { 15 }, w = 288, h = 144, slotW = 292, slotH = 148, puzzleOffsetX = 0, puzzleOffsetY = 3, slotOffsetX = 0, slotOffsetY = 0 },
		{ id = 10, image = "Eggplant", VO = "eggplant", maskSet = { 16 }, w = 228, h = 168, slotW = 236, slotH = 172, puzzleOffsetX = 0, puzzleOffsetY = 0, slotOffsetX = 0, slotOffsetY = 0 },
		{ id = 11, image = "Leaf", VO = "leaf", maskSet = { 15 }, w = 248, h = 164, slotW = 252, slotH = 168, puzzleOffsetX = 0, puzzleOffsetY = 1, slotOffsetX = 0, slotOffsetY = 0 },
		{ id = 12, image = "Corn", VO = "corn", maskSet = { 17 }, w = 248, h = 172, slotW = 252, slotH = 176, puzzleOffsetX = 0, puzzleOffsetY = 1, slotOffsetX = 0, slotOffsetY = 0 },
		{ id = 13, image = "IceCream", VO = "iceCream", maskSet = { 20 }, w = 136*.88, h = 256*.88, slotW = 140*.88, slotH = 260*.88, puzzleOffsetX = 0, puzzleOffsetY = 10, slotOffsetX = 0, slotOffsetY = 0 },
		{ id = 14, image = "RedBird", VO = "redBird", maskSet = { 21 }, w = 204*0.98, h = 208*0.98, slotW = 208*0.98, slotH = 212*0.98, puzzleOffsetX = 0, puzzleOffsetY = 10, slotOffsetX = 0, slotOffsetY = 0 },
				
		
	}
	randomizeTable(objectSets)
	randomizeTable(objectSets)
	
	
	colorSets = {
		{ id = 3, image = "Ball", preVO = "orangeBall", VO = "", maskSet = { 19 }, w = 192, h = 192, slotW = 196, slotH = 196, puzzleOffsetX = 0, puzzleOffsetY = 4, slotOffsetX = 0, slotOffsetY = 0 },
		{ id = 4, image = "Owl", preVO = "blueOwlColor", VO = "", maskSet = { 19 }, w = 240, h = 216, slotW = 244, slotH = 220, puzzleOffsetX = 0, puzzleOffsetY = 7, slotOffsetX = 0, slotOffsetY = 0 },
		{ id = 7, image = "Acorn", preVO = "brownAcorn", VO = "", maskSet = { 19, 12 }, w = 192, h = 232, slotW = 196, slotH = 236, puzzleOffsetX = 0, puzzleOffsetY = 12, slotOffsetX = 0, slotOffsetY = 0 },
		{ id = 8, image = "Banana", preVO = "yellowBanana", VO = "", maskSet = { 14 }, w = 264, h = 200, slotW = 268, slotH = 204, puzzleOffsetX = 0, puzzleOffsetY = 0, slotOffsetX = 0, slotOffsetY = 0 },
		{ id = 14, image = "RedBird", preVO = "redBirdColor", VO = "", maskSet = { 21 }, w = 204*0.98, h = 208*0.98, slotW = 208*0.98, slotH = 212*0.98, puzzleOffsetX = 0, puzzleOffsetY = 10, slotOffsetX = 0, slotOffsetY = 0 },
		{ id = 10, image = "Eggplant", preVO = "purpleEggplant", VO = "", maskSet = { 16 }, w = 228, h = 168, slotW = 236, slotH = 172, puzzleOffsetX = 0, puzzleOffsetY = 0, slotOffsetX = 0, slotOffsetY = 0 },
		{ id = 11, image = "Leaf", preVO = "greenLeaf", VO = "", maskSet = { 15 }, w = 248, h = 164, slotW = 252, slotH = 168, puzzleOffsetX = 0, puzzleOffsetY = 1, slotOffsetX = 0, slotOffsetY = 0 },
		
	}
	randomizeTable(colorSets)
	randomizeTable(colorSets)
	
	shapeSetsRandomized = {
		{ id = 3, image = "Circle", VO = "circle", maskSet = { 19 }, w = 192, h = 192, slotW = 196, slotH = 196, puzzleOffsetX = 0, puzzleOffsetY = 4, slotOffsetX = 0, slotOffsetY = 0, puzzleSlotsScale = 0.4 },
		{ id = 3, image = "Star", VO = "star", maskSet = { 19 }, w = 188, h = 180, slotW = 192, slotH = 184, puzzleOffsetX = 0, puzzleOffsetY = 4, slotOffsetX = 0, slotOffsetY = 0, puzzleSlotsScale = 0.4 },
		{ id = 3, image = "Square", VO = "square", maskSet = { 21 }, w = 188, h = 188, slotW = 192, slotH = 192, puzzleOffsetX = 0, puzzleOffsetY = 4, slotOffsetX = 0, slotOffsetY = 0, puzzleSlotsScale = 0.4 },
		{ id = 3, image = "Oval", VO = "oval", maskSet = { 21 }, w = 148, h = 188, slotW = 152, slotH = 192, puzzleOffsetX = 0, puzzleOffsetY = 4, slotOffsetX = 0, slotOffsetY = 0, puzzleSlotsScale = 0.4 },
		{ id = 3, image = "Rhombus", VO = "rhombus", maskSet = { 21 }, w = 150, h = 232, slotW = 150, slotH = 232, puzzleOffsetX = 0, puzzleOffsetY = 4, slotOffsetX = 0, slotOffsetY = 0, puzzleSlotsScale = 0.4 },
		{ id = 3, image = "Rectangle", VO = "rectangle", maskSet = { 21 }, w = 188, h = 156, slotW = 192, slotH = 160, puzzleOffsetX = 0, puzzleOffsetY = 4, slotOffsetX = 0, slotOffsetY = 0, puzzleSlotsScale = 0.4 },
		{ id = 3, image = "Pentagon", VO = "pentagon", maskSet = { 19 }, w = 204, h = 192, slotW = 208, slotH = 196, puzzleOffsetX = 0, puzzleOffsetY = 4, slotOffsetX = 0, slotOffsetY = 0, puzzleSlotsScale = 0.4 },
		{ id = 3, image = "Octagon", VO = "octagon", maskSet = { 19 }, w = 188, h = 188, slotW = 192, slotH = 192, puzzleOffsetX = 0, puzzleOffsetY = 4, slotOffsetX = 0, slotOffsetY = 0, puzzleSlotsScale = 0.4 },
		{ id = 3, image = "Heart", VO = "heart", maskSet = { 19 }, w = 204, h = 188, slotW = 208, slotH = 192, puzzleOffsetX = 0, puzzleOffsetY = 4, slotOffsetX = 0, slotOffsetY = 0, puzzleSlotsScale = 0.4 },
		{ id = 3, image = "Triangle", VO = "triangle", maskSet = { 21 }, w = 196, h = 168, slotW = 200, slotH = 172, puzzleOffsetX = 0, puzzleOffsetY = 4, slotOffsetX = 0, slotOffsetY = 0, puzzleSlotsScale = 0.4 },
	}
	randomizeTable(shapeSetsRandomized)
	randomizeTable(shapeSetsRandomized)
	
	
	shapeSets = {
		{ id = 3, image = "Circle", VO = "circle", maskSet = { 19 }, w = 192, h = 192, slotW = 196, slotH = 196, puzzleOffsetX = 0, puzzleOffsetY = 4, slotOffsetX = 0, slotOffsetY = 0, puzzleSlotsScale = 0.35 },
		{ id = 3, image = "Square", VO = "square", maskSet = { 21 }, w = 188, h = 188, slotW = 192, slotH = 192, puzzleOffsetX = 0, puzzleOffsetY = 4, slotOffsetX = 0, slotOffsetY = 0, puzzleSlotsScale = 0.35 },
		{ id = 3, image = "Triangle", VO = "triangle", maskSet = { 21 }, w = 196, h = 168, slotW = 200, slotH = 172, puzzleOffsetX = 0, puzzleOffsetY = 4, slotOffsetX = 0, slotOffsetY = 0, puzzleSlotsScale = 0.35 },
		
		{ id = 3, image = "Rectangle", VO = "rectangle", maskSet = { 21 }, w = 188, h = 156, slotW = 192, slotH = 160, puzzleOffsetX = 0, puzzleOffsetY = 4, slotOffsetX = 0, slotOffsetY = 0, puzzleSlotsScale = 0.35 },
		
		{ id = 3, image = "Star", VO = "star", maskSet = { 19 }, w = 188, h = 180, slotW = 192, slotH = 184, puzzleOffsetX = 0, puzzleOffsetY = 4, slotOffsetX = 0, slotOffsetY = 0, puzzleSlotsScale = 0.35 },
		{ id = 3, image = "Heart", VO = "heart", maskSet = { 19 }, w = 204, h = 188, slotW = 208, slotH = 192, puzzleOffsetX = 0, puzzleOffsetY = 4, slotOffsetX = 0, slotOffsetY = 0, puzzleSlotsScale = 0.35 },
		{ id = 3, image = "Rhombus", VO = "rhombus", maskSet = { 21 }, w = 150, h = 232, slotW = 150, slotH = 232, puzzleOffsetX = 0, puzzleOffsetY = 4, slotOffsetX = 0, slotOffsetY = 0, puzzleSlotsScale = 0.35 },
		{ id = 3, image = "Oval", VO = "oval", maskSet = { 21 }, w = 148, h = 188, slotW = 152, slotH = 192, puzzleOffsetX = 0, puzzleOffsetY = 4, slotOffsetX = 0, slotOffsetY = 0, puzzleSlotsScale = 0.35 },
		
		{ id = 3, image = "Pentagon", VO = "pentagon", maskSet = { 19 }, w = 204, h = 192, slotW = 208, slotH = 196, puzzleOffsetX = 0, puzzleOffsetY = 4, slotOffsetX = 0, slotOffsetY = 0, puzzleSlotsScale = 0.35 },
		{ id = 3, image = "Octagon", VO = "octagon", maskSet = { 19 }, w = 188, h = 188, slotW = 192, slotH = 192, puzzleOffsetX = 0, puzzleOffsetY = 4, slotOffsetX = 0, slotOffsetY = 0, puzzleSlotsScale = 0.35 },
		}
	
	
end

function setCountingOptions()

	countingImageOptions = {
		
		{ id = "appleCount", name = "apple", plural = "apples", w = 144, h = 148, numColors = 1, numOffsetX = 0, numOffsetY = 0.13, numOffsetYAndroid = 0.08, numScale = .9, qScale = 1, sound = "foodCrunch", soundTwo = "chomp", animation = { id = "balloon", particles = "juice", duration = 100, anchor = { 0.5, 0.5 }, particleOffset = { 0, 0 } } },
		{ id = "watermelon", name = "watermelon", plural = "watermelon slices", pluralVO = "watermelonSlices", w = 162, h = 152, numColors = 1, numOffsetX = 0, numOffsetY = 0.03, numOffsetYAndroid = 0.06, numScale = .9, qScale = .75, sound = "foodCrunch", soundTwo = "chomp", animation = { id = "disappear", particles = "juice", duration = 110, anchor = { 0.5, 0.5 }, particleOffset = { 0, 0 } } },
		{ id = "strawberry2", name = "strawberry", plural = "strawberries",  w = 144, h = 204, numColors = 1, numOffsetX = 0.04, numOffsetY = 0.13, numOffsetYAndroid = 0.09, numScale = 1, qScale = 1, sound = "gulp", soundTwo = "chomp", animation = { id = "disappear", particles = "juice", duration = 110, anchor = { 0.5, 0.5 }, particleOffset = { 0, 0 } } },
		{ id = "pepper", name = "pepper", plural = "peppers",  w = 140, h = 166, numColors = 3, numOffsetX = 0.02, numOffsetY = 0.12, numOffsetYAndroid = 0.09, numScale = .9, qScale = 1, sound = "foodCrunch", soundTwo = "laughSillyB", animation = { id = "disappear", particles = "pepperSmoke", duration = 110, anchor = { 0.5, 0.5 }, particleOffset = { 0, 0 } } },
		{ id = "raspberry", name = "raspberry", plural = "raspberries", w = 147, h = 167, numColors = 1, numOffsetX = 0.015, numOffsetY = 0.11, numOffsetYAndroid = 0.075, numScale = .9, qScale = 1, sound = "spin", soundTwo = "", animation = { id = "spin", particles = "", duration = 870, anchor = { 0.5, 0.5 }, particleOffset = { 0, 0 } } },
		{ id = "orangeCount", name = "orange", plural = "oranges", w = 150, h = 164, numColors = 1, numOffsetX = 0.015, numOffsetY = 0.11, numOffsetYAndroid = 0.08, numScale = 1, qScale = 1, sound = "gulp", soundTwo = "laughSilly3", animation = { id = "walkright", particles = "dust", duration = 1200, anchor = { 0.5, 0.5 }, particleOffset = { 0, 0 } } },
		
		
		{ id = "heartCount", name = "heart", plural = "hearts", w = 160, h = 140, numColors = 1, numOffsetX = 0.025, numOffsetY = 0.005, numOffsetYAndroid = 0.05, numScale = .9, qScale = 1, sound = "heartReward", soundTwo = "none", animation = { id = "balloon", particles = "none", duration = 700, anchor = { 0.5, 0.5 }, particleOffset = { 0, 0 } } },
		{ id = "starCount", name = "star", plural = "stars", w = 160, h = 153, numColors = 1, numOffsetX = 0.02, numOffsetY = 0.085, numOffsetYAndroid = 0.07, numScale = .9, qScale = 1, sound = "starReward", soundTwo = "none", animation = { id = "spin", particles = "none", duration = 1400, anchor = { 0.5, 0.5 }, particleOffset = { 0, 0 } } },
		
		
	}

end

function setTouchTheNumberOptions()

	numberCount = 1
	currentNumberCount = 1
	game2LoopingOne = 0
	game2LoopingTwo = 0
	teachModeRepeating = false
	touchTheNumberOption = 1
	prevTouchTheNumberOptions = touchTheNumberOption
	game2LoopFourStart = 5
	
	
	touchTheNumberTeachAnim = { 
		{ id = "shake", sound = "", particles = "", duration = 600, anchor = { 0.5, 0.5 }, particleOffset = { 0, 0 } },
		{ id = "spin", sound = "", particles = "", duration = 600, anchor = { 0.5, 0.5 }, particleOffset = { 0, 0 } },
	}
	touchTheNumberChooseAnim = { 
		{ id = "shake", sound = "", particles = "", duration = 600, anchor = { 0.5, 0.5 }, particleOffset = { 0, 0 } },
		{ id = "spin", sound = "", particles = "", duration = 600, anchor = { 0.5, 0.5 }, particleOffset = { 0, 0 } },
	}
	

	touchTheNumberOptions = {
			
		{ mode = "teachChoose", num = 1 },
		{ mode = "teach", num = 2 },
		{ mode = "choose", numbers = { 2 }, numChoices = 2, choicesRange = { 1, 3 }, randomOrder = false  },
		{ mode = "teach", num = 3 },
		{ mode = "choose", numbers = { 3,2 }, numChoices = 2, choicesRange = { 1, 3 }, randomOrder = true  },
		{ mode = "teach", num = 4 },
		{ mode = "choose", numbers = { 4, "random" }, numChoices = 3, choicesRange = { 1, 4 }, randomOrder = false  },
		{ mode = "teach", num = 5 },
		{ mode = "choose", numbers = { 5, "random" }, numChoices = 3, choicesRange = { 2, 5 }, randomOrder = true  },
		{ mode = "teach", num = 6 },
		{ mode = "choose", numbers = { 6, "random" }, numChoices = 3, choicesRange = { 1, 6 }, randomOrder = false  },
		{ mode = "teach", num = 7 },
		{ mode = "choose", numbers = { 7 }, numChoices = 2, choicesRange = { 1, 7 }, randomOrder = true  },
		{ mode = "teach", num = 8 },
		{ mode = "choose", numbers = { 8, "random" }, numChoices = 3, choicesRange = { 2, 8 }, randomOrder = false  },
		{ mode = "teach", num = 9 },
		{ mode = "choose", numbers = { 9, "random" }, numChoices = 3, choicesRange = { 3, 9 }, randomOrder = false  },
		{ mode = "teach", num = 10 },
		{ mode = "choose", numbers = { 10, "random" }, numChoices = 3, choicesRange = { 3, 10 }, randomOrder = false  },
		
		
		{ mode = "choose", numbers = { "random" }, numChoices = 4, choicesRange = { 6, 10 }, randomOrder = true },
		{ mode = "choose", numbers = { "random" }, numChoices = 3, choicesRange = { 11, 15 }, randomOrder = true },
		{ mode = "choose", numbers = { "random" }, numChoices = 4, choicesRange = { 14, 20 }, randomOrder = true },
		
		
		{ mode = "choose", numbers = { "random" }, numChoices = 4, choicesRange = { 10, 20 }, randomOrder = true },
		
		
		{ mode = "choose", numbers = { "random" }, numChoices = 3, choicesRange = { 5, 9 }, randomOrder = true },
		{ mode = "choose", numbers = { "random" }, numChoices = 3, choicesRange = { 2, 9 }, randomOrder = true },
	
		{ mode = "choose", numbers = { "random" }, numChoices = 3, choicesRange = { 3, 10 }, randomOrder = true  },
		{ mode = "choose", numbers = { 8,"random" }, numChoices = 3, choicesRange = { 4, 10 }, randomOrder = true  },
		{ mode = "choose", numbers = { "random" }, numChoices = 3, choicesRange = { 3, 10 }, randomOrder = true  },
		
		{ mode = "choose", numbers = { "random",7 }, numChoices = 3, choicesRange = { 2, 10 }, randomOrder = true  },
		{ mode = "choose", numbers = { "random" }, numChoices = 3, choicesRange = { 3, 5 }, randomOrder = false  },
		{ mode = "choose", numbers = { "random" }, numChoices = 3, choicesRange = { 1, 5 }, randomOrder = false  },
		
		{ mode = "choose", numbers = { "random" }, numChoices = 3, choicesRange = { 6, 7 }, randomOrder = false  },
		{ mode = "choose", numbers = { "random" }, numChoices = 3, choicesRange = { 8, 10 }, randomOrder = false  },
		{ mode = "choose", numbers = { "random" }, numChoices = 3, choicesRange = { 6, 10 }, randomOrder = false  },
		
		{ mode = "choose", numbers = { 1 }, numChoices = 2, choicesRange = { 1, 3 }, randomOrder = false  },
	
	
		{ mode = "choose", numbers = { "random" }, numChoices = 4, choicesRange = { 10, 14 }, randomOrder = true },
		{ mode = "choose", numbers = { "random" }, numChoices = 3, choicesRange = { 15, 20 }, randomOrder = true },
		{ mode = "choose", numbers = { "random" }, numChoices = 4, choicesRange = { 15, 20 }, randomOrder = true },
	
		{ mode = "teach", num = 1 },
	}
	
	colorfulNumbers = {
		{ id = 1, w = 88, h = 180, tScale = 1.05, cScale = 1.1 },
		{ id = 2, w = 136, h = 172, tScale = 1.05, cScale = 1.1 },
		{ id = 3, w = 128, h = 176, tScale = 1.05, cScale = 1.1 },
		{ id = 4, w = 164, h = 180, tScale = 1, cScale = 1.1 },
		{ id = 5, w = 136, h = 176, tScale = 1, cScale = 1.1 },
		{ id = 6, w = 160, h = 180, tScale = 1, cScale = 1.1},
		{ id = 7, w = 148, h = 172, tScale = 1, cScale = 1.1 },
		{ id = 8, w = 156, h = 176, tScale = 1, cScale = 1.1 },
		{ id = 9, w = 160, h = 180, tScale = 1, cScale = 1.1 },
		{ id = 10, w = 268, h = 180, tScale = 1, cScale = 0.675 },
		{ id = 11, w = 212, h = 180, tScale = 1, cScale = 0.69 },
		{ id = 12, w = 236, h = 180, tScale = 1, cScale = 0.69 },
		{ id = 13, w = 224, h = 180, tScale = 1, cScale = 0.69 },
		{ id = 14, w = 264, h = 180, tScale = 1, cScale = 0.69 },
		{ id = 15, w = 236, h = 180, tScale = 1, cScale = 0.69 },
		{ id = 16, w = 260, h = 180, tScale = 1, cScale = 0.69 },
		{ id = 17, w = 248, h = 180, tScale = 1, cScale = .675 },
		{ id = 18, w = 252, h = 180, tScale = 1, cScale = .69 },
		{ id = 19, w = 260, h = 180, tScale = 1, cScale = .69 },
		{ id = 20, w = 300, h = 176, tScale = 1, cScale = 0.675 },
	
	}

end

function setBubbleCountingOptions()

	game3CurBubble = 1
	
	game3BubbleOptions = { 
	
		
		{ id = "Bubble", w = 318, h = 314, numColors = 1, offsetX = 0, offsetY = 0 },
		{ id = "Balloon", w = 280, h = 361, numColors = 2, offsetX = -1.5, offsetY = 34 },
		{ id = "Cloud", w = 305, h = 297, numColors = 1, offsetX = -2.5, offsetY = -9 },
		
		
	}
	randomizeTable( game3BubbleOptions )
	
	
	game3ImageOptions = {
	
		{ id = "starCount", singularText = "star", pluralText = "stars", w = 176, h = 168, numColors = 1, numOffsetX = 0.5, numOffsetY = 0.525, sound = "starReward", soundTwo = "beachBallReward", animation = { id = "balloon", particles = "", duration = 400, anchor = { 0.5, 0.5 }, particleOffset = { 0, 0 } } },
		{ id = "block", singularText = "block", pluralText = "blocks", w = 168, h = 160, numColors = 5, numOffsetX = 0.56, numOffsetY = 0.525, animation = { id = "balloon", particles = "", duration = 400, anchor = { 0.5, 0.5 }, particleOffset = { 0, 0 } } },
		{ id = "smallHeart", singularText = "heart", pluralText = "hearts", w = 170, h = 161, numColors = 1, numOffsetX = 0.5, numOffsetY = 0.4625, animation = { id = "balloon", particles = "", duration = 400, anchor = { 0.5, 0.5 }, particleOffset = { 0, 0 } } },
		
	}

end

function setUpGameTimer()	


	dustGroupBack.alpha = 1
	dustGroupFront.alpha = 1
	
	playedGames = {}

	
	local function playBassMusicTimer()
		if (savedData.enableMusic == true) then
                        
			
		end
	end
	timer.performWithDelay( 500-soundDelay, playBassMusicTimer )
	

	correctCount = 0
	
	local backTemp = { 11, 17, 18, 19 }
	for i = #backTemp, 1, -1 do
	
		local randomBack = math.random(1, #backTemp)
		
		cardBacks[#cardBacks + 1] = backTemp[randomBack]
		
		table.remove( backTemp, randomBack)
	
	end
	currentBack = 1
	
	
	isPutNumOrderFirstPlay = true
	isPutNumTogetherFirstPlay = true
	isPutNumPuzzleFirstPlay = true
	
	usedPuzzleNums = {}
	usedSlotPuzzleNums = {}
	usedSlotOrderFirstNum = {}
	prevHowManyAreItem = {}
	
	randomRewardSounds = { "partyHorn", "cartoon", "laughSillyB", "gatorWow" }
	
	
	difficulty = 1
	layout = 0
	reward = 0
	
	decideLevelOrder()
	
	
	transition.to( gamePathGroup, { time=700, alpha=1, transition=easing.outExpo } )
	transition.to( worldStar, { time=700, alpha=1, transition=easing.outExpo } )
	
	
	setUpEquationTables()
	
	puzzleOptionsSettings()
	setCountingOptions()
	setTouchTheNumberOptions()
	setBubbleCountingOptions()
	
	if (prevBasketItems) then
		for i = #prevBasketItems, 1, -1 do
			table.remove( prevBasketItems, i )
		end
	end
	if (prevNumImagesOne) then
		for i = #prevNumImagesOne, 1, -1 do
			table.remove( prevNumImagesOne, i )
		end
	end
	
	
	basketOptions = {
		{ id = 3, xOffset = 0, yOffset = 0, numColor = { 255, 255, 255 }, showBasketBG = true }, --round basket
	}
	randomizeTable( basketOptions )
	
	basketItemOptions = {
		

		{ id = "appleCount", name = "apple", plural = "apples", delayVO = 0, w = 144, h = 148, basket = 3, numColors = 1, numOffsetX = 0.015, numOffsetY = 0.13, qScale = .85, sound = "appleReward", soundTwo = "chomp", animation = { id = "balloon", particles = "juice", duration = 100, anchor = { 0.5, 0.5 }, particleOffset = { 0, 0 } } },
		
		
		{ id = "basketStrawberry", name = "strawberry", plural = "strawberries", delayVO = 300, w = 130, h = 182, basket = 3,numColors = 1, numOffsetX = .015, numOffsetY = 0.14, numScale = 1, qScale = .85, sound = "gulp", soundTwo = "chomp", animation = { id = "disappear", particles = "juice", duration = 110, anchor = { 0.5, 0.5 }, particleOffset = { 0, 0 } } },
		
		{ id = "pepper", name = "pepper", plural = "peppers", delayVO = 0, w = 140, h = 166, basket = 3,numColors = 2, numOffsetX = .015, numOffsetY = 0.13, numScale = 1, qScale = .85, sound = "foodCrunch", soundTwo = "laughSillyB", animation = { id = "disappear", particles = "pepperSmoke", duration = 110, anchor = { 0.5, 0.5 }, particleOffset = { 0, 0 } } },
		
		{ id = "raspberry", name = "raspberry", plural = "raspberries", delayVO = 300, w = 147, h = 167, basket = 3,numColors = 1, numOffsetX = .015, numOffsetY = 0.11, numScale = .9, qScale = .85, sound = "spin", soundTwo = "none", animation = { id = "spin", particles = "", duration = 870, anchor = { 0.5, 0.5 }, particleOffset = { 0, 0 } } },
		
		{ id = "orangeCount", name = "orange", plural = "oranges", delayVO = 0, w = 150, h = 150, basket = 6,numColors = 1, numOffsetX = .015, numOffsetY = 0.1, numScale = 1, qScale = .85, sound = "gulp", soundTwo = "laughSilly3", animation = { id = "walkright", particles = "dust", duration = 1200, anchor = { 0.5, 0.5 }, particleOffset = { 0, 0 } } },
		
		{ id = "heartCount", name = "heart", plural = "hearts", delayVO = 0, w = 150, h = 131, basket = 6, numColors = 1, numOffsetX = .015, numOffsetY = 0, qScale = .85, sound = "heartReward", soundTwo = "none", animation = { id = "balloon", particles = "none", duration = 700, anchor = { 0.5, 0.5 }, particleOffset = { 0, 0 } } },
		
		{ id = "starCount", name = "star", plural = "stars", delayVO = 0, w = 150, h = 143, basket = 6, numColors = 1, numOffsetX = .015, numOffsetY = 0.1, qScale = .85, sound = "starReward", soundTwo = "none", animation = { id = "spin", particles = "none", duration = 1400, anchor = { 0.5, 0.5 }, particleOffset = { 0, 0 } } },

	
	}
	
	
	nextGame()

end

function startGame()	

	
	local screenCapture = display.captureScreen()
	bgWhite:toFront()
	screenCapture:toFront()
	screenCapture.anchorX = 0.5
	screenCapture.anchorY = 0.5
	screenCapture.x = halfW
	screenCapture.y = halfH
	
	line1.alpha = 0
	line3.alpha = 0
	line5.alpha = 0
	speechBubble.alpha = 0
	bgWhite.alpha = 0
	
	instructions.y = 1000
	
	transition.to( screenCapture, { time=700, alpha = 0, transition=easing.outExpo } )
	
	
	if (myData.isController) then
		Runtime:addEventListener( "key", trackCursor )
		Runtime:addEventListener( "axis", trackCursorAxis )
	elseif (myData.isFireTV) then 
		Runtime:addEventListener( "onFTVKey", trackCursor )
	end
	
	
	local levelOptions = gameDetails["level" .. level]
	local bgImage = backgroundOptions[levelEditorDetails.levelSetting].image
	
	
	if (savedData.enableMusic == true) then
	
	
		audio.stop( 3 )
		
		audio.play( musicOptions[levelEditorDetails.music], { channel = 3, loops = -1 }  )
		
		
					audio.setVolume( 0, { channel=3 } )
			audio.setVolume( 1, { channel=3 } )
		
		
	end
	
	
	timer.performWithDelay( 500, setUpGameTimer )
	
	
	whichDifferentHSetsTable = {}
	
	randomizeTable( biggerSmaller )
	biggerSmallerCategory = 0
	
	
end

function loadBGItems()

	gamePathGroup.x = 0
	gamePathGroup.y = 0
	
	
	currentCardSelected = 1
	cursor = display.newImageRect("Images/UI/cursorHand.png", 59, 59)
	cursor.x = 0
	cursor.y = 0
	cursor.alpha = 0
	
	
	local levelOptions
	if (playingRandomGame == true) then
		levelOptions = gameDetails["level" .. charLevel]
	else
		levelOptions = gameDetails["level" .. level]
	end
	
	
	local pathDetails = characterDetails[levelEditorDetails.character].pathOffset
	local waypointDetails = waypoints[levelEditorDetails.levelMoveStyle]
	
	
	numGames = 0
	
	
	randomizeTable( wordProblemsAddition["num10"] )
	randomizeTable( wordProblemsAddition["num25"] )
	randomizeTable( wordProblemsAddition["num50"] )
	randomizeTable( wordProblemsAddition["num100"] )
	randomizeTable( wordProblemsAddition["num1000"] )
	
	randomizeTable( wordProblemsSubtraction["num10"] )
	randomizeTable( wordProblemsSubtraction["num25"] )
	randomizeTable( wordProblemsSubtraction["num50"] )
	randomizeTable( wordProblemsSubtraction["num100"] )
	randomizeTable( wordProblemsSubtraction["num1000"] )
	
	wordProblemsAddition10 = 1
	wordProblemsAddition25 = 1
	wordProblemsAddition50 = 1
	wordProblemsAddition100 = 1
	wordProblemsAddition1000 = 1
	
	wordProblemsSubtraction10 = 1
	wordProblemsSubtraction25 = 1
	wordProblemsSubtraction50 = 1
	wordProblemsSubtraction100 = 1
	wordProblemsSubtraction1000 = 1

	
	local completeGames = 0
	if (playingRandomGame == true) then
		
		for i = 1, #randomLevelDetails["random" .. randomLevelChallenge].waypointSkip do
			completeGames = completeGames + randomLevelDetails["random" .. randomLevelChallenge].waypointSkip[i]
		end
		numGames = #randomLevelDetails["random" .. randomLevelChallenge].waypointSkip
		
		print("test random  levels")
		print(numGames)
		print(completeGames)
	else
	
		for key,value in pairs(levelOptions) do
			completeGames = completeGames + 1
		end
		
		for i = 1, completeGames do
			gameOptions = levelOptions["game" .. i]
			if (gameOptions.nextWaypoint == true) then
				numGames = numGames + 1
			end
		end
	
	end
	
	print("Num Games: " .. numGames)
	numGamesLeft = numGames
		
	
	if (system.getInfo( "platformName" ) == "Android"  ) then

		selectFont = "BigSky_1"
	else
		selectFont = "Big Sky"
	end
		
		
	local bgDetails = backgroundOptions[levelEditorDetails.levelSetting]
	local iconDetails = characterDetails[levelEditorDetails.character].icon
	
		
	gameBackground = display.newImageRect("Images/UI/" .. bgDetails.image .. ".png", bgDetails.width, bgDetails.height )
        gameBackground.anchorX=0.5
        gameBackground.anchorY = 1
	gameBackground.x = halfW
	gameBackground.y = 270+(gameBackground.height/2)
	
	for i = 1, numGames do
		gamePathText[#gamePathText+1] = display.newImageRect("Images/UI/" .. i .. ".png", 20, 15 )
		
		gamePathText[#gamePathText]:setFillColor(255/255, 254/255, 240/255)
		
		
		print(i)
		if (i ~= numGames) then
			
			gamePathText[#gamePathText].x = waypointDetails[i].start.x + waypointDetails[i].textOffset.x
			gamePathText[#gamePathText].y = waypointDetails[i].start.y + waypointDetails[i].textOffset.y
			
		else
			gamePathText[#gamePathText].x = waypointDetails[numGames-1].finish.x + waypointDetails[i].textOffset.x
			gamePathText[#gamePathText].y = waypointDetails[numGames-1].finish.y + waypointDetails[i].textOffset.y
			hopX = waypointDetails[numGames-1].finish.x
		end
		
		gamePathGroup:insert( gamePathText[#gamePathText] )
		
	
	end
	
	
	worldStar = display.newImageRect("Images/UI/worldStar.png", 15, 14 )
        worldStar.anchorX = 0.5
        worldStar.anchorY = 0.5
		
	worldStar.x = waypointDetails[#waypointDetails].finish.x
	worldStar.y = waypointDetails[#waypointDetails].finish.y - 30
	worldStar.initY = worldStar.y
	worldStar.alpha = 1
	worldStar.frame = 0
	
	Runtime:addEventListener( "enterFrame", worldStarFloat)
	
	
	local iconW, iconH
		iconW = iconDetails.width
		iconH = iconDetails.height
	
	
	gameIcon = display.newImageRect("Images/UI/" .. iconDetails.image .. ".png", iconW, iconH )
        gameIcon.anchorX = iconDetails.anchor[1]
		gameIcon.anchorY = iconDetails.anchor[2]
		
	gameIcon.x = waypointDetails[1].start.x
	gameIcon.y = waypointDetails[1].start.y
	gamePathGroup:insert( gameIcon )
	
	
	bgPlane = display.newImageRect("Images/UI/plane.png", 74, 51 )
	bgPlane.x = halfW - 500
	bgPlane.y = halfH - 40
	
	bgPlane.animation = "flyright"
	bgPlane.particles = "smoke"
	bgPlane.duration = 3400
	bgPlane.timeToAnimation = 500
	bgPlane.initRotation = bgPlane.rotation
	bgPlane.tr = bgPlane.initRotation
	bgPlane.particleOffsetX = -12
	bgPlane.particleOffsetY = 20
	bgPlane.animPrevTime = 0
	bgPlane.animTime = 0
	bgPlane.ty = bgPlane.y
	bgPlane.tx = bgPlane.x
	bgPlane.tr = bgPlane.r
	bgPlane.ts = bgPlane.xScale
	bgPlane.xv = 0
	bgPlane.yv = 0
	bgPlane.rv = 0
	bgPlane.sv = 0
	bgPlane.frame = 0
	
	
	carsFront = {}
	carsBack = {}
	
	carSpeedMin = 3500
	carSpeedMax = 4000
	carFrame = 0
	
	addCarMin = 700-- How frequent cars are added --was 1000
	addCarMax = 1400 --was 3000
	
	randomizeTable( vehicles )
	currentVehicle = 1
	
	timer.performWithDelay( 340, addCars ) -- was 500
	addCarsTimer = timer.performWithDelay( math.random( addCarMin, addCarMax ), addCars, -1 )
	
	
	gamePathGroup.x = gamePathGroup.x + pathDetails.x
	gamePathGroup.y = gamePathGroup.y + pathDetails.y
	
	gameBackground.x = gameBackground.x + bgDetails.xOffset
	gameBackground.y = gameBackground.y + bgDetails.yOffset
	
	gameBackground.alpha = 1
	
	gamePathGroup:toFront()
	
	
	bgBirdGroup:toBack()
	bgPlane:toBack()
	gameBackground:toBack()
	bgCloudsOneGroup:toBack()
	bgCloudsTwoGroup:toBack()
	bgSunGroup:toBack()
	bg:toBack()
	bgLighter:toBack()
	
	
	Runtime:addEventListener( "enterFrame", bgGameAnimations)
	
	
	if (myData.isTV) then 
	else
		if (system.getInfo( "platformName" ) == "Android" ) then
			print(system.getInfo( "platformName" ))
			if (screenGroup) then
				screenGroup:removeSelf()
				screenGroup = nil
			end
			
			screenGroup = display.newGroup()
			screenGroup.x = 0
			screenGroup.y = 0
		
			screenGroup:insert( gameBackground )
			screenGroup:insert( worldStar )
			screenGroup:insert( gamePathGroup )
			
			
				screenGroup.xScale, screenGroup.yScale = androidScale, androidScale
			
			screenGroup.anchorChildren = true
			screenGroup.anchorX = 0.5
			screenGroup.anchorY = 1
			
			screenGroup.x = halfW
			screenGroup.y = screenEdgeY
		end
	end
	

end

function gameStartAnim2()
	transition.to( line3, { time=1200, alpha=1, transition=easing.outExpo } )
	transition.to( line5, { time=1200, alpha=1, transition=easing.outExpo } )
	
	
	mainContainer.x = mainContainer.contentWidth + 2000
	mainContainer.alpha = 0
	
	
	if (playingRandomGame == true and randomLevelDetails["random" .. randomLevelChallenge] and randomLevelDetails["random" .. randomLevelChallenge].showTime ~= "") then
		timer.performWithDelay( randomLevelDetails["random" .. randomLevelChallenge].showTime, startGame, 1 ) --was 1700
	else
		timer.performWithDelay( levelEditorDetails.levelIntroShowTime, startGame, 1 ) --was 1700
	end
	
	
	local function transAnim()
		removeCharAnim("fade")
	end
	
	if (playingRandomGame == true and randomLevelDetails["random" .. randomLevelChallenge] and randomLevelDetails["random" .. randomLevelChallenge].showTime ~= "") then
		timer.performWithDelay( randomLevelDetails["random" .. randomLevelChallenge].showTime, transAnim, 1 ) --was 1700
	else
		timer.performWithDelay( levelEditorDetails.levelIntroShowTime, transAnim, 1 ) --was 1700
	end
	
	
	audio.stop( 1 )
	
	
end

function gameStartAnim1()

	titleGroup.alpha = 0
	dustGroupBack.alpha = 0
	titleGroupBack.alpha = 0
	dustGroupFront.alpha = 0
	titleGroupFront.alpha = 0
	bgBirdGroup.alpha = 0
	
	
	if (playingRandomGame == true) then
		levelEditorDetails = levelEditor[charLevel]
	else
		levelEditorDetails = levelEditor[level]
	end
	

	loadBGItems()
	
	if (cardHopSound == nil) then
		loadGameSounds()
	end
	
	
	bgSunGroup.xScale, bgSunGroup.yScale = 0.9, 0.9
	
	
	if (oniPhoneX == true) then
		bgSunGroup.x = screenEdgeX - safeScreenDistX - 24
		bgSunGroup.y = safeScreenOriginY + 29
	else
		bgSunGroup.x = screenEdgeX - safeScreenDistX - 15
		bgSunGroup.y = safeScreenOriginY + 8
	end
	
	
	bgCloudsOneGroup.alpha = 0
	bgCloudsTwoGroup.alpha = 0
	
	gameCornerCloud1.alpha = 1
	
	if (myData.isTV) then 
		bgSunGroup.alpha = 0	
	end
	
	sun.alpha = 0
	sunTwo.alpha = 1
	
	
	if (playingRandomGame == true) then
	else
		if (
			level == 2 or --
			level == 5 or --
			level == 6 or --
			level == 7 or --
			level == 8 or --
			level == 10 or --
			level == 14 or --
			level == 15 or --
			level == 18 or --
			level == 19 or --
			level == 24 or --
			level == 25 or --
			level == 26 or --
			level == 30 or --
			level == 41 or --
			level == 49 or --
			level == 51 or --
			level == 57 --
			) then
			bg.alpha = 0
			bgLighter.alpha = 1
		end
	end
	
	
	bgWhite:toFront()
	
	
	instructions.anchorX=0.5
    instructions.anchorY=0.5 
	instructions.x = 0
	instructions.y = 0
	
	
	if (playingRandomGame == true and randomLevelDetails["random" .. randomLevelChallenge] and randomLevelDetails["random" .. randomLevelChallenge].line1 ~= "") then
		line1.text = randomLevelDetails["random" .. randomLevelChallenge].line1
	else
		line1.text = levelEditorDetails.levelIntroTextLine1
	end
	
	
	if (playingRandomGame == true and randomLevelDetails["random" .. randomLevelChallenge] and randomLevelDetails["random" .. randomLevelChallenge].line3 ~= "") then
		line5.text = randomLevelDetails["random" .. randomLevelChallenge].line3
	else
		line5.text = levelEditorDetails.levelIntroTextLine2
	end
	
	
	if (playingRandomGame == true and randomLevelDetails["random" .. randomLevelChallenge] and randomLevelDetails["random" .. randomLevelChallenge].scale ~= "") then
		line1.size = randomLevelDetails["day" .. randomLevelChallenge].scale
		line5.size = randomLevelDetails["day" .. randomLevelChallenge].scale
	else
		line1.size = levelEditorDetails.levelIntroTextSize
		line5.size = levelEditorDetails.levelIntroTextSize
	end
	
	
	line3.text = ""
	line3.size = levelEditorDetails.levelIntroTextSize
	
	
	timer.performWithDelay( startMessageTime[gameplayMatch], playInstructionSound)
		
		
	audio.fade( { channel=1 , time=1000 , volume=0  } )
	local function playIntroVO()
		if savedData.enableSounds == true then
			if (playingRandomGame == true and randomLevelDetails["random" .. randomLevelChallenge] and randomLevelDetails["random" .. randomLevelChallenge].voID ~= "") then
				playReservedChannel(introSounds[randomLevelDetails["random" .. randomLevelChallenge].voID], 13, 0)
			else
				playReservedChannel(introSounds[levelEditorDetails.levelIntroVO], 11, 0)
			end
		end
	end
	timer.performWithDelay( 200, playIntroVO )
		
	line1.x, line1.y = 0,  halfH + 24
	
	
	if (playingRandomGame == true and randomLevelDetails["random" .. randomLevelChallenge] and randomLevelDetails["random" .. randomLevelChallenge].spacing ~= "") then
		line5.x, line5.y = 0, line1.y + (randomLevelDetails["random" .. randomLevelChallenge].spacing*2)
	else
		line5.x, line5.y = 0, line1.y + levelEditorDetails.levelIntroTextSpacing
	end
	
	
	if system.getInfo( "platformName" ) == "Android" then
		line1.y = halfH - 180 --60
		
		if (level == 11 or level == 22 or level == 23 or level == 44) then
			line5.y = halfH - 152 --115 --130
		else
			line5.y = halfH - 140 --115 --130
		end
	end
	
	
	speechBubble.x = halfW + 130
	speechBubble.y = halfH - 90
	
	
	instructions.anchorX, instructions.anchorY = 0.5, 0.5
	
	instructions.y = speechBubble.y - 10 + levelEditorDetails.levelIntroTextYOffset
	instructions.x = speechBubble.x + levelEditorDetails.levelIntroTextXOffset
	
	
	if system.getInfo( "platformName" ) == "Android" then
		instructions.y = instructions.y - 37
	end
	
	line1:setFillColor(64/255,64/255,64/255) -- colored here when converting to graphics 2.0 (did not find text coloring, if code redundant, remove)
	line3:setFillColor(64/255,64/255,64/255) -- colored here when converting to graphics 2.0 (did not find text coloring, if code redundant, remove)
	line5:setFillColor(64/255,64/255,64/255) -- colored here when converting to graphics 2.0 (did not find text coloring, if code redundant, remove)
	
	
	speechBubble:toFront()
	line1:toFront()
	line3:toFront()
	line5:toFront()
	instructions:toFront()
	
	
	if (sceneSkip == 0) then
	
		startCharAnim( display.viewableContentWidth/3.1 )
	
	
		transition.to( speechBubble, { time=600, alpha=.9, transition=easing.outExpo } )
	
		transition.to( line1, { time=1200, alpha=1, transition=easing.outExpo } )
	
		timer.performWithDelay( 1300, gameStartAnim2, 1 )
	else
		backButton.alpha = 1
		backButton:toFront()
		instructionsReplayButton.alpha = 1
		instructionsReplayButton:toFront()
		startGame()
		sceneSkip = 0
	end
	
	
end
