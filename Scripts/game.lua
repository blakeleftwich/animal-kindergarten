-- Game
local myData = require("Scripts.myData")

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
	--bgWhiteTwo.alpha = 1
	--bgWhiteTwo:toFront()
	screen:toFront()
	local currentIndex = itemIndex
	
	
	-- bgSunGroup.alpha = 1
	bgSunGroup.xScale, bgSunGroup.yScale = bgSunGroup.initScale, bgSunGroup.initScale
	bgSunGroup.x = bgSunGroup.initX
	bgSunGroup.y = bgSunGroup.initY
	bgCloudsOneGroup.alpha = 1
	bgCloudsTwoGroup.alpha = 1
	
	gameCornerCloud1.alpha = 0
	gameCornerCloud2.alpha = 0
	
	if (myData.isFireTV or myData.isController) then
		bgSunGroup.alpha = 1
	end
	
	sun.alpha = 1
	sunTwo.alpha = 0
	
	--backButton:setFillColor(255/255,255/255,255/255)
	backButton:setFillColor(255/255,254/255,240/255)
	
	if (playingRandomGame == true) then
		-- levelEditorDetails = levelEditor[charLevel]
	else
		-- levelEditorDetails = levelEditor[level]
		-- if (level == 9) then
			bg.alpha = 1
			bgLighter.alpha = 0
		-- end
	end
	
	
	audio.fade( { channel=3 , time=700 , volume=0  } )
	
	-- loadSelectScreen()
	-- screen:toFront()
	-- bgWhite:toFront()
	
	-- selectAnimation1()
	
	-- itemIndex = currentLevel-1
	

	local function openMenu()
		
		-- loadSelectScreen()
		-- screen:toFront()
		-- bgWhite:toFront()
		
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
		-- bgBirdGroup.alpha = 1
		
		fromTitle = false
		
		selectAnimation1()
		
		-- itemIndex = currentLevel-1
		
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
		-- Runtime:addEventListener( "enterFrame", positionMenu )
		
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
							-- if (currentIndex + 1 == itemIndex) then
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
							-- end
						end
						
						-- if (currentIndex + 1 == itemIndex) then
							if savedData.enableSounds == true then
								playReservedChannel(completedSound, 16, 0)
							end
						
							if (menuGroup[itemIndex+1].levelID ~= iapChar and menuGroup[itemIndex+1].levelID ~= rateChar) then
								transition.to(menuGroup[itemIndex+1], {time=100, xScale = 1.3, yScale = 1.3, onComplete = scaleCharDown, transition=easing.outExpo} )
							else
								scaleCharDown()
							end
						-- end
					end
					
					
					-- if (currentIndex + 1 == itemIndex) then
					if (dontWakeUpChar == false) then
						--endOfGame = false
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
					-- end
				end
				
				endGameTimer = timer.performWithDelay( 500, fadeZZZ )
				
			end
			
			print("Level " .. itemIndex)
			-- Changed for IAP Char
			
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
			--Runtime:removeEventListener("touch",touchedMenu)
			buttonsActive = false
			
			print("test1")
			
			-- if (menuGroup[itemIndex+2] and levels[menuGroup[itemIndex+2].levelID] ~= "completed" and nextCharLocked == false and menuGroup[itemIndex+2].levelID ~= selectableChar or 
				-- menuGroup[itemIndex+2] and levels[menuGroup[itemIndex+2].levelID] == "completed" and nextCharLocked == false and menuGroup[itemIndex+2].levelID ~= selectableChar or 
				-- menuGroup[itemIndex+1] and levels[menuGroup[itemIndex+1].levelID] ~= "completed" and level == totalLevels and menuGroup[itemIndex+1].levelID ~= selectableChar or
				-- menuGroup[itemIndex+1].levelID == iapChar or
				-- menuGroup[itemIndex+1].levelID == rateChar or
				-- itemIndex+1 == totalAvailLevels) then
				
				
					local function playMenuMusicTimer()
					
						if savedData.enableMusic == true then
						-- audio.stop( 3 )
						audio.play( introMenuSound, { channel = 1, loops = -1 }  )
						audio.setVolume( 1, { channel=1 } )
						audio.play( introMenuSound, { channel = 2, loops = -1 }  )
						audio.setVolume( 1, { channel=2 } )
					end
				end
				timer.performWithDelay( 2800, playMenuMusicTimer )
			-- end
		else
			
			local function nextCharacter()
				--itemIndex = itemIndex+1
				
				levelCompleted = false
			end
			-- endOfGame = false
			timer.performWithDelay( 3100, nextCharacter )
			levelNotCompleted = false
			buttonsActive = false
			
			print("test2")
			
			local function playMenuMusicTimer()
			
				if savedData.enableMusic == true then
					-- audio.stop( 3 )
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
	
	if (myData.isFireTV or myData.isController) then 
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
	--worldStar:toFront()
	
	local function removeBGTwo()
		bgWhiteTwo.alpha = 0
	end
	transition.to( bgWhiteTwo, { time=700, alpha = 1, transition=easing.outExpo, onComplete = removeBGTwo } )
	transition.to( bgWhiteTwo, { delay=1200, time=700, alpha = 0, transition=easing.outExpo} )
	
	--transition.to( mainContainer, { delay=1200, time=700, xScale=1, yScale=1 , transition=easing.outExpo } )
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
		
		cards[i]:removeEventListener( "touch", MatchingTap )
		cards[i]:removeEventListener( "touch", ChoiceTap )
		cards[i]:removeEventListener( "touch", ComplexChoiceTap )
		cards[i]:removeEventListener( "touch", CheckCounting )
		cards[i]:removeEventListener( "touch", checkSequenceAnswer )
		cards[i]:removeEventListener( "touch", checkQuestionAnswer )
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
	
	Runtime:removeEventListener( "onFTVKey", checkQuestionAnswer )
	Runtime:removeEventListener( "onFTVKey", checkSequenceAnswer )
	Runtime:removeEventListener( "onFTVKey", CheckCounting )
	Runtime:removeEventListener( "onFTVKey", ChoiceTap )
	Runtime:removeEventListener( "onFTVKey", ComplexChoiceTap )
	Runtime:removeEventListener( "onFTVKey", MatchingTap )
	
	Runtime:removeEventListener( "key", checkQuestionAnswer )
	Runtime:removeEventListener( "key", checkSequenceAnswer )
	Runtime:removeEventListener( "key", CheckCounting )
	Runtime:removeEventListener( "key", ChoiceTap )
	Runtime:removeEventListener( "key", ComplexChoiceTap )
	Runtime:removeEventListener( "key", MatchingTap )

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


function bgGameAnimations(event)


	-- Cars
	
	carFrame = carFrame + 1
	for i = #carsBack, 1, -1 do
		if (carsBack[i]) then
			carsBack[i].y = carsBack[i].initY
			carsBack[i].y = carsBack[i].y + .4 * math.sin(carFrame/.023)
		end
	end

	for i = #carsFront, 1, -1 do
		if (carsFront[i]) then
			carsFront[i].y = carsFront[i].initY
			carsFront[i].y = carsFront[i].y + .4 * math.sin(carFrame/.023)
		end
	end
	
	
	if (#carsBack > 0) then
		local randomCar = math.random( 1, 3 )
		if (carsBack[randomCar] and carsBack[randomCar].isSmokeParticles == 1) then
			Particles:newEmitter(dustGroupBack,"dust", "Images/UI/dust.png", math.random(18,28)/1.5, math.random(18,28)/1.5, 1, carsBack[randomCar].x + 20 + math.random(-12,12), carsBack[randomCar].y -30 + math.random(12,24), -4, -6.2, 1.15, 1.4, 255, 255, 255)
		end
	elseif (#carsFront > 0) then
		local randomCar = math.random( 1, 3 )
		if (carsFront[randomCar] and carsFront[randomCar].isSmokeParticles == 1) then
			Particles:newEmitter(dustGroupFront,"dust", "Images/UI/dust.png", math.random(18,28)/1.25, math.random(18,28)/1.25, 1, carsFront[randomCar].x - 20 + math.random(-12,12), carsFront[randomCar].y -30 + math.random(12,24), -4, -6.2, 1.15, 1.4, 255, 255, 255)
		end
	end
	





	-- Plane

	-- if (bgPlane.animTime <= 0) then
		-- bgPlane.animTime = bgPlane.animTime - 1
		-- if (bgPlane.animTime <= -bgPlane.timeToAnimation) then
			-- bgPlane.timeToAnimation = math.random(500, 700)
			-- startFlying(bgPlane.animation, bgPlane, bgPlane.duration)
		-- end
	-- end

	
	
	local o = bgPlane

	o.ts = 0
	if (o.animPrevTime == 0 ) then 
		o.animPrevTime = event.time - 10	
	end

	o.tDelta = event.time - o.animPrevTime
	o.animPrevTime = event.time 
	o.tRatio = 30/o.tDelta
	
	if o.animation and o.animTime > 0 and o.alpha == 1 then
			o.y = o.y + (o.yv*o.tDelta)
			o.x = o.x + (o.xv*o.tDelta)		
			if o.rv ~= 0 then 
				if o.animation == "waddleright" then
					o.rotation = o.rotation - (o.rv*o.tDelta)
				else
					o.rotation = o.rotation + (o.rv*o.tDelta)
				end
			end
			if o.sv ~= 0 then 
					o.ts = o.trackScale + (o.sv*o.tDelta)
					if o.ts < 0.1 then 
						o.ts = 0.1
					--elseif o.ts > 1.6 then 
					--   o.ts = 1.6
					end
					o.trackScale = o.ts
					o.xScale = o.ts*o.targetScale.x
					o.yScale = o.ts*o.targetScale.y
			end

			if (o.animPrevTime-o.startTime > o.animTime) then
					--print("rel")
					
					o.anchorX = 0.5
					o.anchorY = 0.5
					o.y = o.ty
					o.x = o.tx
					o.yv = 0
					o.animTime = 0
					o.rotation = 0
					o.rv = 0
					o.xScale = o.xScale
					o.yScale = o.yScale
					o.ty = o.y
					o.tx = o.x
					o.frame = 0
					
			else
				local particleX
				local particleY
				
				if (o.xScale > 0) then
					particleX = o.x + (o.particleOffsetX*o.yScale)
					particleY = o.y + (o.particleOffsetY*o.yScale)
				else
					particleX = o.x - (o.particleOffsetX*o.yScale)
					particleY = o.y + (o.particleOffsetY*o.yScale)
				end
			
					if o.animation == "flyleft" then 
							if o.x < -200 then 
								o.x = 700
							end
							o.frame = o.frame + 1
							o.y = o.ty + 30 * math.sin(o.frame/20)

					elseif o.animation == "flyright" then 
							if o.x > 700 then 
								o.x = -200
							end
							o.frame = o.frame + 1
							o.y = o.ty + 30 * math.sin(o.frame/20)
					end

					local particlexv = {min=-1,max=1}
					if o.xv > 0 then 
						particlexv = {min=-6,max=-3}
					elseif o.xv < 0 then 
						particlexv = {min=3,max=6}
					end
					if o.particles == "" then                                                            
					elseif o.particles == "smoke" then
						-- Particles:newEmitter(dustGroupBack,"fade", "Images/UI/puff.png", 50*o.yScale/1.65, 50*o.yScale/1.65, 1, particleX, particleY, particlexv.min, particlexv.max, -1, 1, 255, 255, 255, 0*o.yScale)
					end
			end
	end
	
	
	
	if (dustGroupBack) then
		dustGroupBack:toFront()
	end
	if (carGroupBack) then
		carGroupBack:toFront()
	end
	if (dustGroupFront) then
		dustGroupFront:toFront()
	end
	if (carGroupFront) then
		carGroupFront:toFront()
	end
	if (bgPlane) then
		bgPlane:toFront()
	end
	if (questionText) then
		questionText:toFront()
	end
	if (questionTextTwo) then
		questionTextTwo:toFront()
	end
	if (howManyBackground) then
		howManyBackground:toFront()
	end
	if (howManyGroup) then
		howManyGroup:toFront()
	end
	if (equationGroup) then
		equationGroup:toFront()
	end
	if (equationComplexGroup) then
		equationComplexGroup:toFront()
	end
	if (dotsGroup) then
		dotsGroup:toFront()
	end
	if (cardGroup) then
		cardGroup:toFront()
	end
	if (cursor) then
		cursor:toFront()
	end
	if (explosions) then
		explosions:toFront()
	end
	
	if (bgWhite) then
		bgWhite:toFront()
	end
	if (bgWhiteTwo) then
		bgWhiteTwo:toFront()
	end
	if (speechBubble) then
		speechBubble:toFront()
	end
	if (jill) then
		jill:toFront()
	end
	if (instructions) then
		instructions:toFront()
	end
	
end

function startFlying(direction,target,duration) 
	--Initialize		
	--print("init flying "..direction)
	target.animation = direction
	if target.animTime <= 0 then 
		target.startTime = system.getTimer()
		if duration < 1 then 
			duration = 1
		end
		target.animTime = duration
		target.xv = 900/duration
		target.frame = 0
		target.ty = target.y
		target.tx = target.x
		if direction == "flyleft" then 
			target.xv = -target.xv
		end
		--print("xv:"..target.xv)			
	end			
end


function removeCar( groupObj )

	for i = #carsFront, 1, -1 do
		if (carsFront[i] == groupObj) then
			table.remove( carsFront, i )
		end
	end
	for i = #carsBack, 1, -1 do
		if (carsBack[i] == groupObj) then
			table.remove( carsBack, i )
		end
	end

	-- for i = groupObj.numChildren, 1, -1 do
		-- groupObj[i]:removeSelf()
		-- groupObj[i] = nil
	-- end
	
	if (groupObj) then
		groupObj:removeSelf()
		groupObj = nil
	end

end

function addCars()

	local randomDirection = math.random( 1, 2 )
	local isSmokeParticles = math.random( 1, 3 )
	
	
	
	-- local randomVehicle = math.random( 1, #vehicles )
	
	local car = display.newImageRect("Images/UI/" .. vehicles[currentVehicle].name .. ".png", vehicles[currentVehicle].w, vehicles[currentVehicle].h )
	
	
	car.anchorX, car.anchorY = 0.5, 1
	
	car.isSmokeParticles = isSmokeParticles
	
	if (randomDirection == 1) then
		carsBack[#carsBack+1] = car
		carsBack[#carsBack].x = screenEdgeX + 40
		if (#carsBack >= 2 and carsBack[#carsBack-1] and carsBack[#carsBack-1].x > screenEdgeX) then
			carsBack[#carsBack].x = carsBack[#carsBack-1].x + 45
		end
		carsBack[#carsBack].xScale, carsBack[#carsBack].yScale = 0.8, 0.8
		carsBack[#carsBack].y = halfH + 177 + vehicles[currentVehicle].offsetY
		carsBack[#carsBack].initY = carsBack[#carsBack].y
		carsBack[#carsBack].carTrans = transition.to( carsBack[#carsBack], { time=math.random(carSpeedMin, carSpeedMax), x = screenOriginX - 40, onComplete=removeCar } )
		carGroupBack:insert( car )
	else
		carsFront[#carsFront+1] = car
		carsFront[#carsFront].x = screenOriginX - 40
		if (#carsFront >= 2 and carsFront[#carsFront-1] and carsFront[#carsFront-1].x < screenOriginX) then
			carsFront[#carsFront].x = carsFront[#carsFront-1].x - 45
		end
		carsFront[#carsFront].y = halfH + 197 + vehicles[currentVehicle].offsetY
		carsFront[#carsFront].initY = carsFront[#carsFront].y
		carsFront[#carsFront].xScale = -1
		carsFront[#carsFront].carTrans = transition.to( carsFront[#carsFront], { time=math.random(carSpeedMin, carSpeedMax), x = screenEdgeX + 40, onComplete=removeCar } )
		carGroupFront:insert( car )
	end
	
	
	for i = #carsFront, 1, -1 do
		if (carsFront[i]) then
			carsFront[i]:toFront()
		end
	end
	
	
	currentVehicle = currentVehicle + 1
	if (currentVehicle > #vehicles) then
		currentVehicle = 1
	end
	


end



function pathAnimDone(target)

	-- print ("Waypoint has been added here")
	
	-- print ("Waypoint is now " .. currentWaypoint)

end

function worldStarFloat()

	worldStar.frame = worldStar.frame + 1
	worldStar.y =  worldStar.initY + floatRangeStar * math.sin(worldStar.frame/30)

end


function countTime(event) 
	timeToComplete = timeToComplete + 1
	
	if (gameplayMode == 1 and automaticPeek == true and timeToComplete == timeBeforePeek[layout] and gameplayMatch ~= 15) then
		wiggle()
		timeToComplete = 0
	end
	
	if (gameplayMode == 2 and automaticPeek == true and timeToComplete == timeBeforePeek[layout]) then
		
		if (showAllCards == false) then
			if (showAgainTimer) then
				timer.cancel( showAgainTimer )
				showAgainTimer = nil
			end
			if (flipAgainTimer) then
				timer.cancel( flipAgainTimer )
				flipAgainTimer = nil
			end
			flipOne()
			timeToComplete = 0
		end
	end
	
	
end 

function cardWinHop( cardOne, cardTwo )

	local function cardWinHop2()
	
		local function removeCards()
		
			
			if savedData.enableSounds == true then
				playReservedChannel(explodeSound, 15, 0)
			end
		
		
			cardX1, cardY1 = cardOne:localToContent( 0, 0 )
			cardX2, cardY2 = cardTwo:localToContent( 0, 0 )
		
			Particles:newEmitter(explosions,"fireworks", "Images/starParticle.png", 32, 32, 10, cardX1, cardY1, -4, 4, -16, 6, 252,234,27)--altRgb[1], altRgb[2], altRgb[3])
			Particles:newEmitter(explosions,"fireworks", "Images/starParticle.png", 32, 32, 10, cardX2, cardY2, -4, 4, -16, 6, 252,234,27)--altRgb[1], altRgb[2], altRgb[3])
		
			if (gameplayOptions ~= 4) then
				cardOne.alpha = 0
				cardTwo.alpha = 0
				
				if (cardOne.shadow) then
					cardOne.shadow.alpha = 0
				end
				if (cardTwo.shadow) then
					cardTwo.shadow.alpha = 0
				end
				
				if (cardOne.textGroup) then
					cardOne.textGroup.alpha = 0
				end
				if (cardTwo.textGroup) then
					cardTwo.textGroup.alpha = 0
				end
				
				
				if (gameplayOptions == 2) then
					cards[chosen[3]].alpha = 0
				end
			end

			-- table.remove(chosen,1)
			-- table.remove(chosen,1)
			-- if (gameplayOptions == 2) then
				-- table.remove(chosen,1)
			-- end
			
			sequenceNum = sequenceNum + 1
			correctNum = correctNum + 1
			
			if (correctNum == totalPairs) then
			
				if (myData.isController) then
					Runtime:removeEventListener( "key", MatchingTap )
				elseif (myData.isFireTV) then
					Runtime:removeEventListener( "onFTVKey", MatchingTap )
				end
			
				Runtime:removeEventListener( "enterFrame", countTime )
				
				if (automaticPeekTimer) then
					timer.cancel(automaticPeekTimer)
				end
				
				if savedData.enableSounds == true then
					if (reward == 3) then
						--playReservedChannel(crowdAmazedSound, 15, 0)
					else
						playReservedChannel(shortClapSound, 21, 0)
					end
				end
				-- if savedData.enableMusic == true then
					-- if ( reward == 0 ) then
						-- audio.setVolume( 1, { channel=2 } )
					-- elseif (reward == 1) then
						-- audio.setVolume( 1, { channel=3 } )
					-- elseif (reward == 2) then
						-- audio.setVolume( 1, { channel=4 } )
					-- end
				-- end
				
				print("win!")
				
				table.remove(levelOrder,1)
				
				local function hideQuestion()
					questionText.alpha = 0
					questionTextTwo.alpha = 0
				end
				transition.to( questionText, { time=700, alpha = 0, transition=easing.outExpo, onComplete = hideQuestion } )
				transition.to( questionTextTwo, { time=700, alpha = 0, transition=easing.outExpo } )
				goodJobSequence()
				--timer.performWithDelay(900, goodJobAnimation1, 1)
				--timer.soundPerformWithDelay( 900-soundDelay, playSoundTimer, { sound=goodJobSound, reservedChannel=8, loopNumber=0 } )
				
				if (gameplayOptions == 4) then
					for i = 1, #cards do
						cards[i].alpha = 0
					end
				end
				
				
			else
			
				if (isClassicMode == false) then
					table.remove(showMeSelectOptions, 1)
					table.remove(showMeSelectOptions, 1)
					table.remove(showMeSelectOptionsPlural, 1)
					table.remove(showMeSelectOptionsPlural, 1)
					
					playingFirstPartShowMe = false
					changeShowMeQuestion(false)
					
					function playInstructionsDelay()
						playInstructionsAudio(false)
					end
					if (questionAudioTimer) then
						timer.cancel( questionAudioTimer )
						questionAudioTimer = nil
					end
					
					-- Timer for Now Touch The
					if (cardOptions.category ~= "numbersToGroups") then
						questionAudioTimer = timer.performWithDelay( 0, playInstructionsDelay )
					end
				end
			
				if (myData.isFireTV or myData.isController) then 
					timer.performWithDelay( 100, showCursor )
				end
				
			end
			
		end
		
		transition.to( cardOne, { time=150 , y=cardOne.y + 25, transition=easing.inExpo } )
		transition.to( cardTwo, { time=150 , y=cardTwo.y + 25, transition=easing.inExpo, onComplete=removeCards } )
	
		if (cardOne.textGroup) then
			transition.to( cardOne.textGroup, { time=150 , y=cardOne.y + 25 + cardOne.textGroup.offsetY, transition=easing.inExpo } )
		end
		if (cardTwo.textGroup) then
			transition.to( cardTwo.textGroup, { time=150 , y=cardTwo.y + 25 + cardTwo.textGroup.offsetY, transition=easing.inExpo } )
		end
	
	
		if (cardOne.shadow) then
			transition.to( cardOne.shadow, { time=150 , y=cardOne.y + 25 + shadowOffsetY, transition=easing.inExpo } )
		end
		if (cardTwo.shadow) then
			transition.to( cardTwo.shadow, { time=150 , y=cardTwo.y + 25 + shadowOffsetY, transition=easing.inExpo } )
		end
	end

	if savedData.enableSounds == true then
		playReservedChannel(cardHopSound, 16, 0)
	end
	
	transition.to( cardOne, { time=150 , y=cardOne.y - 20, transition=easing.outExpo } )
	transition.to( cardTwo, { time=150 , y=cardTwo.y - 20, transition=easing.outExpo, onComplete=cardWinHop2} )

	if (cardOne.textGroup) then
		transition.to( cardOne.textGroup, { time=150 , y=cardOne.y - 20 + cardOne.textGroup.offsetY, transition=easing.outExpo } )
	end
	if (cardTwo.textGroup) then
		transition.to( cardTwo.textGroup, { time=150 , y=cardTwo.y - 20 + cardTwo.textGroup.offsetY, transition=easing.outExpo } )
	end
	
	
	if (cardOne.shadow) then
		transition.to( cardOne.shadow, { time=150 , y=cardOne.y - 20 + shadowOffsetY, transition=easing.outExpo } )
	end
	if (cardTwo.shadow) then
		transition.to( cardTwo.shadow, { time=150 , y=cardTwo.y - 20 + shadowOffsetY, transition=easing.outExpo } )
	end
	
	if (correctNum+1 == totalPairs) then
		--wiggleAnimation()
	end
	
end

function cardFloat( event )

	for i = #floaters, 1, -1 do
		for j = #cards, 1, -1 do
			if (floaters[i] == cards[j].id) then
				cards[j].frame = cards[j].frame + 1
				cards[j].y =  cards[j].initY + floatRange * math.sin(cards[j].frame/30)
				cards[j].rotation = cards[j].rotation + rotationRange * math.cos(cards[j].frame/rotationRate)
			
				if (cards[j].textGroup) then
					cards[j].textGroup.y = cards[j].y + cards[j].textGroup.offsetY
					cards[j].textGroup.rotation = cards[j].rotation
				end
				if (cards[j].shadow) then
					cards[j].shadow.x = cards[j].x + shadowOffsetX
					cards[j].shadow.y = cards[j].y + shadowOffsetY
					cards[j].shadow.rotation = cards[j].rotation
				end
			end
		end
	end

	-- floater.frame = floater.frame + 1
	-- floater.y = floaterYPosition + floatRange * math.sin(floater.frame/30)
	-- floater.rotation = floater.rotation + rotationRange * math.cos(floater.frame/rotationRate)
end

function animateActors(event) 
    local ts = 0
    if (animPrevTime == 0 ) then 
		animPrevTime = event.time - 10	
    end
    local tDelta = event.time - animPrevTime
    animPrevTime = event.time 
    local tRatio = 30/tDelta
    local o = wiggler					
    if o and o.animTime > 0 and o.y then
        o.y = o.y + (o.yv*tDelta)
        o.x = o.x + (o.xv*tDelta)		
        if o.rv ~= 0 then 
            o.rotation = o.rotation + (o.rv*tDelta)
        end
        if o.sv ~= 0 then 
            ts = o.trackScale + (o.sv*tDelta)
            if ts < 0.1 then 
                ts = 0.1
            end
            o.trackScale = ts
            o.xScale = ts*o.targetScale.x
            o.yScale = ts*o.targetScale.y
        end
        if (animPrevTime-o.startTime > o.animTime) then
            o.y = o.ty
            o.x = o.tx
            o.yv = 0
            o.animTime = 0
            o.rotation = o.tr
            o.rv = 0
            o.xScale = o.targetScale.x
            o.yScale = o.targetScale.y
        else
			o.rv = (tRatio*.5*o.rv) - (.005*(o.rotation - o.tr))
        end
		if (o.textGroup) then
			o.textGroup.rotation = o.rotation
		end
	
	
		if (o.shadow) then
			o.shadow.rotation = o.rotation
		end
	else
		Runtime:removeEventListener( "enterFrame", animateActors)
	end
end

function startWiggle(target,duration) 
	wiggler = target
	animPrevTime = 0
	target.displayScale = 1
	target.tx = 0
	target.ty = 0
	target.tr = 0
	target.ts = 1
	target.xv = 0
	target.yv = 0
	target.rv = 0
	target.sv = 0
	target.rotation = 0
	target.startTime = 0
	target.animTime = 0
	target.targetScale = {x=1, y=1}
	if target.animTime == 0 then 
		target.startTime = system.getTimer()
		target.rv=-.4
		target.animTime = duration
		target.tr = target.rotation
		target.ty = target.y
        target.tx = target.x
		target.yv = 0
	else				
		if math.abs(target.rv) < .4 then
			target.rv = .4 * math.abs(target.rv)/target.rv
		end				
		target.startTime = system.getTimer()
	end	
	Runtime:addEventListener( "enterFrame", animateActors)
end	

function wiggle ()

	-- if savedData.enableSounds == true then
		-- playReservedChannel(wiggleSound, 17, 0)
	-- end

	local hasBeenSelected = false
	local randomCard

	repeat
		randomCard = math.random(1, #cards)
		hasBeenSelected = false
		
		for j = #chosen, 1, -1 do
			if cards[randomCard] == chosen[j] then
				hasBeenSelected = true
			end
		end
	until hasBeenSelected == false and cards[randomCard].alpha ~= 0 and prevWiggle ~= randomCard
	
	-- startWiggle(cards[randomCard],700)
	prevWiggle = randomCard
	
end


function equationMatchingSetup(i)
	
	cards[i].textGroup = display.newGroup()
	local firstNum = display.newImageRect("Images/" .. tonumber( cards[i].name:sub(1, 1) ) .. "Digit.png", 50, 50)
	firstNum:setFillColor(64/255,64/255,64/255)
	firstNum.xScale, firstNum.yScale = 0.55, 0.55
	cards[i].textGroup:insert( firstNum )
	
	cards[i].firstMatchNum = cards[i].name:sub(1, 1)
	
	local secondNum, thirdNum, fourthNum, fifthNum, sixthNum
	if (cards[i].name:sub(2, 2) ~= "+" and cards[i].name:sub(2, 2) ~= "-" and
		cards[i].name:sub(2, 2) ~= "x" and cards[i].name:sub(2, 2) ~= "/") then
		secondNum = display.newImageRect("Images/" .. tonumber( cards[i].name:sub(2, 2) ) .. "Digit.png", 50, 50)
		secondNum:setFillColor(64/255,64/255,64/255)
		secondNum.xScale, secondNum.yScale = 0.55, 0.55
		secondNum.x = firstNum.x + 20
		cards[i].textGroup:insert( secondNum )
		
		cards[i].firstMatchNum = cards[i].firstMatchNum .. cards[i].name:sub(2, 2)
	end
	
	if (cards[i].name:sub(3, 3) ~= "+" and cards[i].name:sub(3, 3) ~= "-" and
		cards[i].name:sub(3, 3) ~= "x" and cards[i].name:sub(3, 3) ~= "/") then
		thirdNum = display.newImageRect("Images/" .. tonumber( cards[i].name:sub(3, 3) ) .. "Digit.png", 50, 50)
		thirdNum:setFillColor(64/255,64/255,64/255)
		thirdNum.xScale, thirdNum.yScale = 0.55, 0.55
		if (tonumber( cards[i].name:sub(6, 6) ) or 
			tonumber( cards[i].name:sub(5, 5) )) then
			thirdNum.x = firstNum.x + 42
			
		else
			if (tonumber( cards[i].name:sub(4, 4) )) then
				thirdNum.x = firstNum.x - 20
			end
			thirdNum.y = firstNum.y + 33
		end
		cards[i].textGroup:insert( thirdNum )
		
		if (tonumber( cards[i].name:sub(6, 6) ) or tonumber( cards[i].name:sub(5, 5) ) ) then
			cards[i].firstMatchNum = cards[i].firstMatchNum .. cards[i].name:sub(3, 3)
		else
			cards[i].secondMatchNum = cards[i].name:sub(3, 3)
		end
	end
	
	if (tonumber( cards[i].name:sub(4, 4) ) and cards[i].name:sub(4, 4) ~= "+" and cards[i].name:sub(4, 4) ~= "-" and
		cards[i].name:sub(4, 4) ~= "x" and cards[i].name:sub(4, 4) ~= "/") then
		fourthNum = display.newImageRect("Images/" .. tonumber( cards[i].name:sub(4, 4) ) .. "Digit.png", 50, 50)
		fourthNum:setFillColor(64/255,64/255,64/255)
		fourthNum.xScale, fourthNum.yScale = 0.55, 0.55
		if (tonumber( cards[i].name:sub(5, 5) )) then
		else
			if (secondNum) then
				fourthNum.x = firstNum.x + 20
			end
		end
		fourthNum.y = firstNum.y + 33
		cards[i].textGroup:insert( fourthNum )
		
		if (secondNum) then
			cards[i].secondMatchNum = cards[i].name:sub(4, 4)
		else
			cards[i].secondMatchNum = cards[i].secondMatchNum .. cards[i].name:sub(4, 4)
		end
	end
	
	if (tonumber( cards[i].name:sub(5, 5) ) and cards[i].name:sub(5, 5) ~= "+" and cards[i].name:sub(5, 5) ~= "-" and
		cards[i].name:sub(5, 5) ~= "x" and cards[i].name:sub(5, 5) ~= "/") then
		fifthNum = display.newImageRect("Images/" .. tonumber( cards[i].name:sub(5, 5) ) .. "Digit.png", 50, 50)
		fifthNum:setFillColor(64/255,64/255,64/255)
		fifthNum.xScale, fifthNum.yScale = 0.55, 0.55
		if (tonumber( cards[i].name:sub(6, 6) )) then
			fifthNum.x = secondNum.x
		else
			if (fourthNum) then
				fifthNum.x = firstNum.x + 20
			else
				fifthNum.x = thirdNum.x
			end
		end
		fifthNum.y = firstNum.y + 33
		cards[i].textGroup:insert( fifthNum )
		
		if (tonumber( cards[i].name:sub(6, 6) ) or fourthNum == nil) then
			cards[i].secondMatchNum = cards[i].name:sub(5, 5)
		else
			cards[i].secondMatchNum = cards[i].secondMatchNum .. cards[i].name:sub(5, 5)
		end
	end
	
	if (tonumber( cards[i].name:sub(6, 6) ) and cards[i].name:sub(6, 6) ~= "+" and cards[i].name:sub(6, 6) ~= "-" and
		cards[i].name:sub(6, 6) ~= "x" and cards[i].name:sub(6, 6) ~= "/") then
		sixthNum = display.newImageRect("Images/" .. tonumber( cards[i].name:sub(6, 6) ) .. "Digit.png", 50, 50)
		sixthNum:setFillColor(64/255,64/255,64/255)
		sixthNum.xScale, sixthNum.yScale = 0.55, 0.55
		sixthNum.x = thirdNum.x
		sixthNum.y = firstNum.y + 33
		cards[i].textGroup:insert( sixthNum )
		
		cards[i].secondMatchNum = cards[i].secondMatchNum .. cards[i].name:sub(6, 6)
	end
	
	local symbol
	if (matchingSign == "+") then
		symbol = display.newImageRect("Images/plus.png", 50, 50)
	elseif (matchingSign == "-") then
		symbol = display.newImageRect("Images/minus.png", 50, 50)
	elseif (matchingSign == "x") then
		symbol = display.newImageRect("Images/multiply.png", 50, 50)
	elseif (matchingSign == "/") then
		symbol = display.newImageRect("Images/divide.png", 50, 50)
	end
	symbol:setFillColor(64/255,64/255,64/255)
	symbol.xScale, symbol.yScale = 0.6, 0.6
	
	if (tonumber( cards[i].name:sub(6, 6) )) then
		symbol.x, symbol.y = thirdNum.x - 40, firstNum.y + 33
	elseif (tonumber( cards[i].name:sub(5, 5) )) then
		if (fourthNum) then
			symbol.x, symbol.y = fifthNum.x - 40, firstNum.y + 33
		else
			symbol.x, symbol.y = fifthNum.x - 30, firstNum.y + 33
		end
	elseif (secondNum) then
		symbol.x, symbol.y = secondNum.x - 30, firstNum.y + 33
	else
		symbol.x, symbol.y = firstNum.x - 30, firstNum.y + 33
	end
	cards[i].textGroup:insert( symbol )
	
	
	cardGroup:insert( cards[i].textGroup )
	cards[i].textGroup.anchorChildren = true
	cards[i].textGroup.anchorX, cards[i].textGroup.anchorY = 0.5, 0.5
	cards[i].textGroup.x, cards[i].textGroup.y = cards[i].x, cards[i].y - 5
	cards[i].textGroup.offsetY = -5

end


function BackFlipped( object )
		
	object:addEventListener( "touch", MatchingTap )
end

function ShowBack( object )

	local isCursorTarget = false
	if (cards[object.id] == targetCard) then
		isCursorTarget = true
	end

	local xPos, yPos = object.x, object.y
	local name, pair, id, sound, initY  = object.name, object.pair, object.id, object.sound, object.initY
	local removing, showMeCate = object.removing, object.showMeCate
	
	if (cards[object.id] ) then
		cards[object.id]:removeSelf()
	end
	if (cards[object.id].textGroup) then
		cards[object.id].textGroup:removeSelf()
	end
	if (cards[object.id].shadow) then
		cards[object.id].shadow:removeSelf()
		cards[object.id].shadow = nil
	end
	
	cards[object.id] = display.newImageRect("Images/cardBG" .. cardBacks[currentBack] .. ".png", 69, 86)
	cards[object.id].x = xPos
	cards[object.id].y = yPos
	cards[object.id].name = name
	cards[object.id].pair = pair
	cards[object.id].showMeCate = showMeCate
	cards[object.id].id = id
	cards[object.id].frame = 0
	cards[object.id].initY = initY
	cards[object.id].face = false
	cards[object.id].sound = sound
	cards[object.id].removing = removing
	cardGroup:insert(cards[object.id])
	
	transition.from(cards[object.id], {time=timeToFlip, xScale = .01, onComplete=BackFlipped, transition=easing.outExpo  } )
	
	if (cards[object.id].textGroup) then
		transition.from(cards[object.id].textGroup, {time=timeToFlip, xScale = .01, transition=easing.outExpo  } )
	end
	
	
	if (isCursorTarget == true) then
		targetCard = cards[object.id]
	end
	
end

function flipOne()

	if savedData.enableSounds == true then
		playReservedChannel(attentionSound, 17, 0)
	end

	local hasBeenSelected = false
	local randomCard

	repeat
		randomCard = math.random(1, #cards)
		hasBeenSelected = false
		
		for j = #chosen, 1, -1 do
			if cards[randomCard] == chosen[j] then
				hasBeenSelected = true
			end
		end
	until hasBeenSelected == false and cards[randomCard].alpha ~= 0 and prevWiggle ~= randomCard
	
	prevWiggle = randomCard

	local xPos, yPos = cards[randomCard].x, cards[randomCard].y
	local name, pair, id, sound = cards[randomCard].name, cards[randomCard].pair, cards[randomCard].id, cards[randomCard].sound
	local initY, showMeCate = cards[randomCard].initY, cards[randomCard].showMeCate
	local removing = cards[randomCard].removing
	
	local function ShowFace()
	
		local isCursorTarget = false
		if (cards[randomCard] == targetCard) then
			isCursorTarget = true
		end
	
		cards[randomCard]:removeEventListener( "touch", MatchingTap )
		if (cards[randomCard].textGroup) then
			cards[randomCard].textGroup:removeSelf()
		end
		if (cards[randomCard].shadow) then
			cards[randomCard].shadow:removeSelf()
			cards[randomCard].shadow = nil
		end
		cards[randomCard]:removeSelf()
	
		-- cards[randomCard] = display.newImageRect("Images/" .. name .. ".png", 69, 86)
		if (gameplayMatch ~= 15 and gameplayMatch ~= 1) then
			cards[randomCard] = display.newImageRect("Images/" .. name .. ".png", 69, 86)
		elseif (gameplayMatch == 1) then
			cards[randomCard] = dynamicNumberCardSlots( tostring(name), 1, 1 ) -- 0.87, 1
		else
			if (type(cards[randomCard].name) ~= "string") then
				cards[randomCard] = dynamicNumberCardSlots( tostring(name), 1, 1 ) -- 0.87, 1
			else
				cards[randomCard] = display.newImageRect("Images/blankFlashcard.png", 69, 86)
			end
		end
		cards[randomCard].x = xPos
		cards[randomCard].y = yPos
		cards[randomCard].name = name
		cards[randomCard].pair = pair
		cards[randomCard].showMeCate = showMeCate
		cards[randomCard].id = id
		cards[randomCard].frame = 0
		cards[randomCard].initY = initY
		cards[randomCard].face = true
		cards[randomCard].sound = sound
		cards[randomCard].removing = removing
		cards[randomCard]:addEventListener( "touch", MatchingTap )
		
		cardGroup:insert(cards[randomCard])
		
		if (gameplayMatch == 15 and type(cards[randomCard].name) == "string") then
			equationMatchingSetup(randomCard)
		elseif (gameplayMatch == 15 or gameplayMatch == 1) then
			if (cards[randomCard].textGroup) then
				cardGroup:insert(cards[randomCard].textGroup)
				cards[randomCard].textGroup.anchorChildren = true
				cards[randomCard].textGroup.anchorX, cards[randomCard].textGroup.anchorY = 0.5, 0.5
				cards[randomCard].textGroup.x, cards[randomCard].textGroup.y = cards[randomCard].x, cards[randomCard].y
			
				cards[randomCard].textGroup.x = cards[randomCard].x
				cards[randomCard].textGroup.y = cards[randomCard].y
				
				dynamicNumberOffsets(randomCard)
				
			end
		end
		
		flipped = randomCard
		
		transition.from(cards[randomCard], {time=timeToFlip, xScale = .01, transition=easing.outExpo } )
		if (cards[randomCard].shadow) then
			transition.from(cards[randomCard].shadow, {time=timeToFlip, xScale = .01, transition=easing.outExpo } )
		end
		if (cards[randomCard].textGroup) then
			transition.from(cards[randomCard].textGroup, {time=timeToFlip, xScale = .01, transition=easing.outExpo } )
		end
		if (isCursorTarget == true) then
			targetCard = cards[randomCard]
		end
		
		local function flip( )
			flipOneOver( randomCard )
		end
		showAgainTimer = timer.performWithDelay( timeToShowAll, flip )
		
	end
	cards[randomCard]:removeEventListener( "touch", MatchingTap )
	transition.to(cards[randomCard], {time=timeToFlip, xScale = .01, transition=easing.outExpo, onComplete=ShowFace } )
	if (cards[randomCard].textGroup) then
		transition.to(cards[randomCard].textGroup, {time=timeToFlip, xScale = .01, transition=easing.outExpo } )
	end
	if (cards[randomCard].shadow) then
		transition.to(cards[randomCard].shadow, {time=timeToFlip, xScale = .01, transition=easing.outExpo } )
	end
	
end

function flipOneOver( object )

	local hasBeenSelected = false
	
	for j = #chosen, 1, -1 do
		if cards[object] == chosen[j] then
			hasBeenSelected = true
		end
	end
	
	if (hasBeenSelected == false) then
		local xPos, yPos = cards[object].x, cards[object].y
		local name, pair, id, sound = cards[object].name, cards[object].pair, cards[object].id, cards[object].sound
		local initY, showMeCate = cards[object].initY, cards[object].showMeCate
		local removing = cards[object].removing
		
		local function ShowBack()
		
			local isCursorTarget = false
			if (cards[object] == targetCard) then
				isCursorTarget = true
			end
		
			if (cards[object].textGroup) then
				cards[object].textGroup:removeSelf()
			end
			if (cards[object].shadow) then
				cards[object].shadow:removeSelf()
				cards[object].shadow = nil
			end
			cards[object]:removeSelf()
		
			cards[object] = display.newImageRect("Images/cardBG" .. cardBacks[currentBack] .. ".png", 69, 86)
			cards[object].x = xPos
			cards[object].y = yPos
			cards[object].name = name
			cards[object].pair = pair
			cards[object].showMeCate = showMeCate
			cards[object].id = id
			cards[object].frame = 0
			cards[object].initY = initY
			cards[object].face = false
			cards[object].sound = sound
			cards[object].removing = removing
			cards[object]:addEventListener( "touch", MatchingTap )
			cardGroup:insert(cards[object])
			
			transition.from(cards[object], {time=timeToFlip, xScale = .01, transition=easing.outExpo } )
			if (cards[object].textGroup) then
				transition.from(cards[object].textGroup, {time=timeToFlip, xScale = .01, transition=easing.outExpo } )
			end
			if (cards[object].shadow) then
				transition.from(cards[object].shadow, {time=timeToFlip, xScale = .01, transition=easing.outExpo } )
			end
			
			if (isCursorTarget == true) then
				targetCard = cards[object]
			end
			
			flipped = 0
			
		end
		cards[object]:removeEventListener( "touch", MatchingTap )
		transition.to(cards[object], {time=timeToFlip, xScale = .01, transition=easing.outExpo, onComplete=ShowBack } )
		if (cards[object].textGroup) then
			transition.to(cards[object].textGroup, {time=timeToFlip, xScale = .01, transition=easing.outExpo } )
		end
		if (cards[object].shadow) then
			transition.to(cards[object].shadow, {time=timeToFlip, xScale = .01, transition=easing.outExpo } )
		end
	end
	
end

function flipAll()

	for i = #cards, 1, -1 do
		
		local hasBeenSelected = false
		for j = #chosen, 1, -1 do
			if cards[i].id == chosen[j] then
				hasBeenSelected = true
			end
		end
	
		if (cards[i].alpha ~= 0 and hasBeenSelected == false and cards[i].removing == false and cards[i].face == false) then
	
			local xPos, yPos = cards[i].x, cards[i].y
			local name, pair, id, sound = cards[i].name, cards[i].pair, cards[i].id, cards[i].sound
			local initY, showMeCate = cards[i].initY, cards[i].showMeCate
			local removing = cards[i].removing
		
			local function ShowFace()
			
				local isCursorTarget = false
				if (cards[i] == targetCard) then
					isCursorTarget = true
				end
			
				cards[i]:removeEventListener( "touch", MatchingTap )
				if (cards[i].textGroup) then
					cards[i].textGroup:removeSelf()
				end
				if (cards[i].shadow) then
					cards[i].shadow:removeSelf()
					cards[i].shadow = nil
				end
				cards[i]:removeSelf()
			
				-- print("show face")
				-- print(gameplayMatch)
				-- cards[i] = display.newImageRect("Images/" .. name .. ".png", 69, 86)
				if (gameplayMatch ~= 15 and gameplayMatch ~= 1) then
					if (type(cards[i].name) ~= "string") then
						cards[i] = dynamicNumberCardSlots( tostring(name), 1, 1 ) -- 0.87, 1
					else
						cards[i] = display.newImageRect("Images/" .. name .. ".png", 69, 86)
					end
				elseif (gameplayMatch == 1) then
					print(name)
					cards[i] = dynamicNumberCardSlots( tostring(name), 1, 1 ) -- 0.87, 1
				else
					if (type(cards[i].name) ~= "string") then
						cards[i] = dynamicNumberCardSlots( tostring(name), 1, 1 ) -- 0.87, 1
					else
						cards[i] = display.newImageRect("Images/blankFlashcard.png", 69, 86)
					end
				end
				cards[i].x = xPos
				cards[i].y = yPos
				cards[i].name = name
				cards[i].pair = pair
				cards[i].showMeCate = showMeCate
				cards[i].id = id
				cards[i].frame = 0
				cards[i].initY = initY
				cards[i].face = true
				cards[i].sound = sound
				cards[i].removing = removing
				if (gameplayMode == 2) then
					cards[i]:addEventListener( "touch", MatchingTap )
				end
				
				-- local hasBeenSelected = false
				-- for j = #chosen, 1, -1 do
					-- print(chosen[j])
					-- if (cards[i].id == chosen[j].id ) then
						-- hasBeenSelected = true
					-- end
					-- end
				-- end
				-- if (hasBeenSelected == false) then
					-- cards[i]:addEventListener( "touch", MatchingTap )
				-- end
				
				cardGroup:insert(cards[i])
				
				if (gameplayMatch == 15 and type(cards[i].name) == "string") then
					equationMatchingSetup(i)
				elseif (gameplayMatch == 15 or gameplayMatch == 1) then
					if (cards[i].textGroup) then
						cardGroup:insert(cards[i].textGroup)
						cards[i].textGroup.anchorChildren = true
						cards[i].textGroup.anchorX, cards[i].textGroup.anchorY = 0.5, 0.5
						cards[i].textGroup.x, cards[i].textGroup.y = cards[i].x, cards[i].y
					
						cards[i].textGroup.x = cards[i].x
						cards[i].textGroup.y = cards[i].y
						
						dynamicNumberOffsets(i)
						
					end
				end
				
				
				transition.from(cards[i], {time=timeToFlip, xScale = .01, transition=easing.outExpo } )
				if (cards[i].textGroup) then
					transition.from(cards[i].textGroup, {time=timeToFlip, xScale = .01, transition=easing.outExpo } )
				end
				if (cards[i].shadow) then
					transition.from(cards[i].shadow, {time=timeToFlip, xScale = .01, transition=easing.outExpo } )
				end
				
				if (isCursorTarget == true) then
					targetCard = cards[i]
				end
				
			end
			cards[i]:removeEventListener( "touch", MatchingTap )
			transition.to(cards[i], {time=timeToFlip, xScale = .01, transition=easing.outExpo, onComplete=ShowFace } )
			if (cards[i].textGroup) then
				transition.to(cards[i].textGroup, {time=timeToFlip, xScale = .01, transition=easing.outExpo } )
			end
			if (cards[i].shadow) then
				transition.to(cards[i].shadow, {time=timeToFlip, xScale = .01, transition=easing.outExpo } )
			end
		
		end
	
	end

end

function flipAllOver()

	showAllCards = false

	for i = #cards, 1, -1 do
	
		local hasBeenSelected = false
		for j = #chosen, 1, -1 do
			if (cards[i].id == chosen[j] ) then
				hasBeenSelected = true
			end
		end
		
		if (cards[i].face == true and cards[i].alpha ~= 0 and cards[i].removing == false and hasBeenSelected == false) then
	
			local xPos, yPos = cards[i].x, cards[i].y
			local name, pair, id, sound = cards[i].name, cards[i].pair, cards[i].id, cards[i].sound
			local initY, showMeCate = cards[i].initY, cards[i].showMeCate
			local removing = cards[i].removing
		
			local function ShowBack()
			
				local isCursorTarget = false
				if (cards[i] == targetCard) then
					isCursorTarget = true
				end
			
				if (cards[i].shadow) then
					cards[i].shadow:removeSelf()
					cards[i].shadow = nil
				end
				if (cards[i].textGroup) then
					cards[i].textGroup:removeSelf()
				end
				cards[i]:removeSelf()
			
				cards[i] = display.newImageRect("Images/cardBG" .. cardBacks[currentBack] .. ".png", 69, 86)
				cards[i].x = xPos
				cards[i].y = yPos
				cards[i].name = name
				cards[i].pair = pair
				cards[i].showMeCate = showMeCate
				cards[i].id = id
				cards[i].frame = 0
				cards[i].face = false
				cards[i].initY = initY
				cards[i].sound = sound
				cards[i].removing = removing
				cards[i]:addEventListener( "touch", MatchingTap )
				cardGroup:insert(cards[i])
				
				transition.from(cards[i], {time=timeToFlip, xScale = .01, transition=easing.outExpo } )
				if (cards[i].textGroup) then
					transition.from(cards[i].textGroup, {time=timeToFlip, xScale = .01, transition=easing.outExpo } )
				end
				if (cards[i].shadow) then
					transition.from(cards[i].shadow, {time=timeToFlip, xScale = .01, transition=easing.outExpo } )
				end
				
				if (isCursorTarget == true) then
					targetCard = cards[i]
				end
				
				timeToComplete = 0
			end
			cards[i]:removeEventListener( "touch", MatchingTap )
			transition.to(cards[i], {time=timeToFlip, xScale = .01, transition=easing.outExpo, onComplete=ShowBack } )
			if (cards[i].textGroup) then
				transition.to(cards[i].textGroup, {time=timeToFlip, xScale = .01, transition=easing.outExpo } )
			end
			if (cards[i].shadow) then
				transition.to(cards[i].shadow, {time=timeToFlip, xScale = .01, transition=easing.outExpo } )
			end
	
		end
	
	end
	
	
	if (gameplayMode == 2 and currentState == "game") then
		--peekButton:addEventListener( "touch", peek )
		
		-- local function needToFlipAgain()
			-- if (showAgain == true) then
				-- flipAll()
				-- showAllCards = true
				-- showAgainTimer = timer.performWithDelay( timeToShowAll, flipAllOver )
			-- end
		-- end
		-- flipAgainTimer = timer.performWithDelay( 6000, needToFlipAgain )
	end

end

function peek (event)
	if (event.phase == "began" ) then
		if (showAgainTimer) then
			timer.cancel( showAgainTimer )
			showAgainTimer = nil
		end
		if (flipAgainTimer) then
			timer.cancel( flipAgainTimer )
			flipAgainTimer = nil
		end
		if (showAllCards == false) then
			flipAll()
			if savedData.enableSounds == true then
				playReservedChannel(cardHopSound, 16, 0)
			end
		end
		showAllCards = true
		showAgain = false
	end
	if (event.phase == "ended"  ) then
		--peekButton:removeEventListener( "touch", peek )
		showAgainTimer = timer.performWithDelay( timeToShowAll, flipAllOver )
		showAgain = true
	end
end


function playEquationCardSounds(name)

	local firstNumberSound = ""
	local secondNumberSound = ""
	local signSound = ""
	
	local signK = 1
	
	for k = 1, string.len(tostring(name)) do

		if (name:sub(k, k) ~= "+" and name:sub(k, k) ~= "-" and name:sub(k, k) ~= "*" and name:sub(k, k) ~= "/") then
			firstNumberSound = firstNumberSound .. name:sub(k, k)
		else
			signK = k
			signSound = name:sub(k, k)
			break
		end
		
	end
	
	for k = signK, string.len(tostring(name)) do

		if (name:sub(k, k) ~= "+" and name:sub(k, k) ~= "-" and name:sub(k, k) ~= "*" and name:sub(k, k) ~= "/") then
			secondNumberSound = secondNumberSound .. name:sub(k, k)
		end
		
	end
	
	
	
	-- if (signSound == "+" and tonumber(firstNumberSound) <= 100 and tonumber(secondNumberSound) <= 100 or
		-- signSound == "-" and tonumber(firstNumberSound) <= 100) then
	
		-- playReservedChannel(gameNumSounds[tonumber(firstNumberSound)], currentCardChannel, 0)
		
		if (tonumber(firstNumberSound) <= 100) then
			playReservedChannel( gameNumSounds[tonumber(firstNumberSound)], currentCardChannel, 0 )
		else
			local function partFiveAudio()
				local numTemp
				if (tonumber(firstNumberSound) < 110) then
					numTemp = tonumber( tostring(tonumber(firstNumberSound)):sub(3, 3) )
				else
					numTemp = tonumber( tostring(tonumber(firstNumberSound)):sub(2, 3) )
				end
				playReservedChannel(gameNumSounds[ numTemp ], currentCardChannel, 0)
			end
		
			playReservedChannel(hundredSounds[ tonumber(tostring(tonumber(firstNumberSound)):sub(1, 1)) ], currentCardChannel, 0)
		
		
			if (questionAudioTimer) then
				timer.cancel( questionAudioTimer )
				questionAudioTimer = nil
			end
			questionAudioTimer = timer.performWithDelay( 900, partFiveAudio )
		
		end
		
		currentCardChannel = currentCardChannel + 1
		if currentCardChannel > 19 then
			currentCardChannel = 18
		end
		
		
	-- end
	
	
	local function playSecondNumberSound()
		-- playReservedChannel(gameNumSounds[tonumber(secondNumberSound)], currentCardChannel, 0)
		
		if (tonumber(secondNumberSound) <= 100) then
			playReservedChannel( gameNumSounds[tonumber(secondNumberSound)], currentCardChannel, 0 )
		else
			local function partFiveAudio()
				local numTemp
				if (tonumber(secondNumberSound) < 110) then
					numTemp = tonumber( tostring(tonumber(secondNumberSound)):sub(3, 3) )
				else
					numTemp = tonumber( tostring(tonumber(secondNumberSound)):sub(2, 3) )
				end
				playReservedChannel(gameNumSounds[ numTemp ], currentCardChannel, 0)
			end
		
			playReservedChannel(hundredSounds[ tonumber(tostring(tonumber(secondNumberSound)):sub(1, 1)) ], currentCardChannel, 0)
		
		
			if (questionAudioTimer) then
				timer.cancel( questionAudioTimer )
				questionAudioTimer = nil
			end
			questionAudioTimer = timer.performWithDelay( 900, partFiveAudio )
		
		end
		
		
		currentCardChannel = currentCardChannel + 1
		if currentCardChannel > 19 then
			currentCardChannel = 18
		end
	end
	if (tonumber(firstNumberSound) <= 100) then
		
		equationSoundTwoTimer = timer.performWithDelay( 1200, playSecondNumberSound )
	else
		equationSoundTwoTimer = timer.performWithDelay( 2450, playSecondNumberSound )
	end
	
	local function playSignSound()
	
		if (signSound == "+") then
			playReservedChannel(gameSounds["plus"], 9, 0)
		elseif (signSound == "-") then
			playReservedChannel(gameSounds["minus"], 9, 0)
		end
		-- currentCardChannel = currentCardChannel + 1
		-- if currentCardChannel > 19 then
			-- currentCardChannel = 18
		-- end
		
	end
	if (tonumber(firstNumberSound) <= 100) then
		equationSoundTimer = timer.performWithDelay( 550, playSignSound )
	else
		equationSoundTimer = timer.performWithDelay( 1650, playSignSound )
	end

end


-- If it's matching

function CheckForMatch()
	
	turnedNum = turnedNum + 1
	
	-- if the second chosen has no value then there is 
	-- no need to continue with this function.
	if chosen[2] == nil then
		if (turnedNum == 2) then
			turnedNum = 0
		end
		return
	end
	
	-- checking values
	-- print("turnedNum is "..turnedNum)
	-- print("gameplayOptions is "..gameplayOptions)
	-- print("chosen[1] is "..chosen[1])
	-- if chosen[2] ~= nil then print("chosen[2] is "..chosen[2]) end
	-- if chosen[3] ~= nil then print("chosen[3] is "..chosen[3]) end
	-- end of checking values
	
	local mathMatch = false
	if (gameplayMatch == 15 and type(cards[chosen[1]].name) == "string" and type(cards[chosen[2]].name) ~= "string" or
		gameplayMatch == 15 and type(cards[chosen[2]].name) == "string" and type(cards[chosen[1]].name) ~= "string") then
		
		mathMatch = true
		if (type(cards[chosen[2]].name) ~= "string") then
			cards[chosen[2]].answerMatchNum = cards[chosen[2]].name
			cards[chosen[1]].firstMatchNum = tonumber( cards[chosen[1]].firstMatchNum )
			cards[chosen[1]].secondMatchNum = tonumber( cards[chosen[1]].secondMatchNum )
		
			print(cards[2].answerMatchNum)
			print(cards[1].firstMatchNum)
			print(cards[1].secondMatchNum)
		else
			cards[chosen[1]].answerMatchNum = cards[chosen[1]].name
			cards[chosen[2]].firstMatchNum = tonumber( cards[chosen[2]].firstMatchNum )
			cards[chosen[2]].secondMatchNum = tonumber( cards[chosen[2]].secondMatchNum )
			
			print(cards[1].answerMatchNum)
			print(cards[2].firstMatchNum)
			print(cards[2].secondMatchNum)
		end
	end
	
	-- if the cards are the same, hide them
	-- if (gameplayOptions == 1 and turnedNum == 2 and cards[chosen[1]].pair == cards[chosen[2]].pair or
		-- gameplayOptions == 2 and turnedNum == 3 and chosen[3] ~= nil and cards[chosen[1]].pair == cards[chosen[2]].pair and cards[chosen[2]].pair == cards[chosen[3]].pair or
		-- gameplayOptions == 3 and turnedNum == 2 and cards[chosen[1]].pair == cards[chosen[2]].pair and cards[chosen[1]].pair == sequenceNum or
		-- gameplayOptions == 4 and turnedNum == 2 and cards[chosen[1]].pair == cards[chosen[2]].pair) then
	
	if (gameplayOptions == 1 and turnedNum == 2 and cards[chosen[1]].pair == cards[chosen[2]].pair and gameplayMatch ~= 15 or
	
		-- Equation matching --
		gameplayOptions == 1 and turnedNum == 2 and gameplayMatch == 15 and mathMatch == true and matchingSign == "+" and type(cards[chosen[2]].name) ~= "string" and cards[chosen[1]].firstMatchNum + cards[chosen[1]].secondMatchNum == cards[chosen[2]].answerMatchNum or
		gameplayOptions == 1 and turnedNum == 2 and gameplayMatch == 15 and mathMatch == true and matchingSign == "+" and type(cards[chosen[1]].name) ~= "string" and cards[chosen[2]].firstMatchNum + cards[chosen[2]].secondMatchNum == cards[chosen[1]].answerMatchNum or

		gameplayOptions == 1 and turnedNum == 2 and gameplayMatch == 15 and mathMatch == true and matchingSign == "-" and type(cards[chosen[2]].name) ~= "string" and cards[chosen[1]].firstMatchNum - cards[chosen[1]].secondMatchNum == cards[chosen[2]].answerMatchNum or
		gameplayOptions == 1 and turnedNum == 2 and gameplayMatch == 15 and mathMatch == true and matchingSign == "-" and type(cards[chosen[1]].name) ~= "string" and cards[chosen[2]].firstMatchNum - cards[chosen[2]].secondMatchNum == cards[chosen[1]].answerMatchNum or
		
		gameplayOptions == 1 and turnedNum == 2 and gameplayMatch == 15 and mathMatch == true and matchingSign == "x" and type(cards[chosen[2]].name) ~= "string" and cards[chosen[1]].firstMatchNum * cards[chosen[1]].secondMatchNum == cards[chosen[2]].answerMatchNum or
		gameplayOptions == 1 and turnedNum == 2 and gameplayMatch == 15 and mathMatch == true and matchingSign == "x" and type(cards[chosen[1]].name) ~= "string" and cards[chosen[2]].firstMatchNum * cards[chosen[2]].secondMatchNum == cards[chosen[1]].answerMatchNum or
		
		gameplayOptions == 1 and turnedNum == 2 and gameplayMatch == 15 and mathMatch == true and matchingSign == "/" and type(cards[chosen[2]].name) ~= "string" and cards[chosen[1]].firstMatchNum / cards[chosen[1]].secondMatchNum == cards[chosen[2]].answerMatchNum or
		gameplayOptions == 1 and turnedNum == 2 and gameplayMatch == 15 and mathMatch == true and matchingSign == "/" and type(cards[chosen[1]].name) ~= "string" and cards[chosen[2]].firstMatchNum / cards[chosen[2]].secondMatchNum == cards[chosen[1]].answerMatchNum or
		--------------------------------
		
		gameplayOptions == 2 and turnedNum == 3 and chosen[3] ~= nil and cards[chosen[1]].pair == cards[chosen[2]].pair and cards[chosen[2]].pair == cards[chosen[3]].pair or
		gameplayOptions == 3 and turnedNum == 2 and cards[chosen[1]].pair == cards[chosen[2]].pair and cards[chosen[1]].pair == sequenceNum or
		gameplayOptions == 4 and turnedNum == 2 and cards[chosen[1]].pair == cards[chosen[2]].pair) then
	
	
		if (gameplayMode == 2 and (correctNum-1) == totalPairs) then
			peekButton:removeEventListener( "touch", peek )
		end
	
		turnedNum = 0
		
		local cardOneRemove = cards[chosen[1]]
		local cardTwoRemove = cards[chosen[2]]
		cards[chosen[1]].removing = true
		cards[chosen[2]].removing = true
		
		table.remove(chosen, 1)
		table.remove(chosen, 1)
		
	
		local function ShowMatch()
		
			Runtime:removeEventListener( "enterFrame", cardFloat)
			cardWinHop( cardOneRemove, cardTwoRemove )
			
		end
		local showMatchTimer = timer.performWithDelay( 0, ShowMatch, 1 )
		
		
	-- If they don't match, flip them back over
	elseif (gameplayOptions == 1 and turnedNum == 2 or
				gameplayOptions == 2 and turnedNum == 3 or
				gameplayOptions == 3 and turnedNum == 2 ) then
		
		turnedNum = 0
	
		
		if (gameplayType == 1) then
			if (cards[chosen[1]].pair > cards[chosen[2]].pair) then
				showCardsDelay = showCardsDelayNum[cards[chosen[1]].pair]
			else
				showCardsDelay = showCardsDelayNum[cards[chosen[2]].pair]
			end
		else
			showCardsDelay = showCardsDelayPic
		end
	
		if (showAllCards == false) then
			
			Runtime:removeEventListener( "enterFrame", cardFloat)
			transition.to(cards[chosen[1]], {delay = showCardsDelay, xScale = 1, yScale = 1, time =timeToFlip, xScale = .01, onComplete = ShowBack, transition=easing.outExpo } )
			transition.to(cards[chosen[2]], { delay = showCardsDelay, xScale = 1, yScale = 1, time =timeToFlip, xScale = .01, onComplete = ShowBack, transition=easing.outExpo } )
			if (cards[chosen[1]].shadow) then
				transition.to(cards[chosen[1]].shadow, {delay = showCardsDelay, xScale = 1, yScale = 1, time =timeToFlip, xScale = .01, transition=easing.outExpo } )
			end
			if (cards[chosen[2]].shadow) then
				transition.to(cards[chosen[2]].shadow, { delay = showCardsDelay, xScale = 1, yScale = 1, time =timeToFlip, xScale = .01, transition=easing.outExpo } )
			end
			if (cards[chosen[1]].textGroup) then
				transition.to(cards[chosen[1]].textGroup, {delay = showCardsDelay, xScale = 1, yScale = 1, time =timeToFlip, xScale = .01, transition=easing.outExpo } )
			end
			if (cards[chosen[2]].textGroup) then
				transition.to(cards[chosen[2]].textGroup, { delay = showCardsDelay, xScale = 1, yScale = 1, time =timeToFlip, xScale = .01, transition=easing.outExpo } )
			end
			
			
			if (gameplayOptions == 2) then
				transition.to(cards[chosen[3]], { delay = showCardsDelay, xScale = 1, yScale = 1, time =timeToFlip, xScale = .01, onComplete = ShowBack, transition=easing.outExpo } )
			end
			
			if (myData.isFireTV or myData.isController) then 
				timer.performWithDelay( showCardsDelay+100, showCursor )
			end
			
		else
			cards[chosen[1]]:addEventListener( "touch", MatchingTap )
			cards[chosen[1]].face = false
			transition.to( cards[chosen[1]], { time=100 , xScale = 1, yScale = 1, transition=easing.outExpo} )
			if (cards[chosen[1]].textGroup) then
				transition.to( cards[chosen[1]].textGroup, { time=100 , xScale = 1, yScale = 1, transition=easing.outExpo} )
			end
			if (cards[chosen[1]].shadow) then
				transition.to( cards[chosen[1]].shadow, { time=100 , xScale = 1, yScale = 1, transition=easing.outExpo} )
			end
			
			cards[chosen[2]]:addEventListener( "touch", MatchingTap )
			cards[chosen[2]].face = false
			transition.to( cards[chosen[2]], { time=100 , xScale = 1, yScale = 1, transition=easing.outExpo} )
			if (cards[chosen[2]].textGroup) then
				transition.to( cards[chosen[2]].textGroup, { time=100 , xScale = 1, yScale = 1, transition=easing.outExpo} )
			end
			if (cards[chosen[2]].shadow) then
				transition.to( cards[chosen[2]].shadow, { time=100 , xScale = 1, yScale = 1, transition=easing.outExpo} )
			end
			
			if (gameplayOptions == 2) then
				cards[chosen[3]]:addEventListener( "touch", MatchingTap )
				cards[chosen[3]].face = false
				transition.to( cards[chosen[3]], { time=100 , xScale = 1, yScale = 1, transition=easing.outExpo} )
			end
			
			if (myData.isFireTV or myData.isController) then 
				timer.performWithDelay( 100, showCursor )
			end
		end
		
		for i = #floaters, 1, -1 do
			if (floaters[i] == cards[chosen[1]].id or floaters[i] == cards[chosen[2]].id) then
				floaters[i] = nil
			end
		end
		if (#floaters == 0) then
			Runtime:removeEventListener( "enterFrame", cardFloat)
		end
		
		if (gameplayMode == 1) then
			if (cards[chosen[1]].shadow) then
				cards[chosen[1]].shadow:removeSelf()
				cards[chosen[1]].shadow = nil
			end
			if (cards[chosen[2]].shadow) then
				cards[chosen[2]].shadow:removeSelf()
				cards[chosen[2]].shadow = nil
			end
		end
		
		table.remove(chosen,1)
		table.remove(chosen,1)
		if (gameplayOptions == 2) then
			table.remove(chosen,1)
		end
		
		numberOfMistakes = numberOfMistakes + 1
		
		
	-- only if gameplay mode is run then flip all cards back over
	elseif (gameplayOptions == 4 and turnedNum == 2 ) then
		for i = 1, #cards do
			if (cards[i].face == true and showAllCards == true) then
				transition.to(cards[i], { delay = showCardsDelay, time =timeToFlip, xScale = .01, onComplete = ShowBack, transition=easing.outExpo } )
				if (cards[i].textGroup) then
					transition.to(cards[i].textGroup, { delay = showCardsDelay, time =timeToFlip, xScale = .01, transition=easing.outExpo } )
				end
				if (cards[i].shadow) then
					transition.to(cards[i].shadow, { delay = showCardsDelay, time =timeToFlip, xScale = .01, transition=easing.outExpo } )
				end
			end
				
		end
		
		correctNum = 0
	
	end
	
	local function startAutomaticPeek()
		if (gameplayMode == 2 and #chosen == 0 and showAllCards == false) then
			automaticPeek = true
			timeToComplete = 0
		elseif (gameplayMode == 1 and #chosen == 0) then
			automaticPeek = true
			timeToComplete = 0
		end
	end
	automaticPeekTimer = timer.performWithDelay (350, startAutomaticPeek)
	
end

function MatchingTap(event)

	local target = event.target
	local keyName = event.keyName
	
	if (target == nil) then
		target = targetCard
	end

	if event.keyName == nil and event.phase == "began" or
		event.phase == "began" and buttonsActive == true or
		(keyName and event.phase == "down" and buttonsActive ) then
		
	
		if (event.keyName and event.keyName ~= "back" and 
												event.keyName ~= "left" and 
												event.keyName ~= "right" and
												event.keyName ~= "up" and
												event.keyName ~= "down" and
												event.keyName ~= "mediaPlayPause" and
												event.keyName ~= "buttonZ" and
												event.keyName ~= "buttonX" and
												event.keyName ~= "buttonY" and
												keyName ~= "menu" or
												event.keyName == nil) then
		
			if (isClassicMode == true or
				showMeSelectOptions[1] == target.showMeCate or cardOptions.category == "numbersToGroups") then
			
				print("match test")
				print(showMeSelectOptions[1])
				print(target.showMeCate)
			
				if (myData.isFireTV or myData.isController) then 
					transition.to( cursor, { time=100, alpha=0 } )
					buttonsActive = false
				end
				-- buttonsActive = false
				
				if (turnedNum2 == 2) then
					turnedNum2 = 0
				end
				turnedNum2 = turnedNum2 + 1
				
				audio.stop( 11 )
				
				if (questionAudioTimer) then
					timer.cancel( questionAudioTimer )
					questionAudioTimer = nil
				end
				
				
				if (cardTrans) then
					transition.cancel( cardTrans )
					cardTrans = nil
				end
				cardGroup.x = cardGroup.targetX
				
				
				if (target.face == true or gameplayMode == 1) then
					if (target.shadow) then
						target.shadow:removeSelf()
						target.shadow = nil
					end
					if (target.shadow == nil) then
						target.shadow = display.newImageRect("Images/cardShadow.png", 92*0.9, 110*0.9)
						if (target.shadow) then
							target.shadow.x = target.x + shadowOffsetX
							target.shadow.y = target.y + shadowOffsetY
							target.shadow.alpha = .75
							target.shadow.rotation = target.rotation
							cardGroup:insert( target.shadow )
							target.shadow:toFront()
						end
					end
				end
				
			
				print ("Card name: " .. target.name)
				print ("Card pair: " .. target.pair)
				print ("Card id: " .. target.id)
				
				chosen[#chosen+1] = target.id
				if (target.shadow) then
					target.shadow:toFront()
				end
				if (target) then
					target:toFront()
				end
				if (target.textGroup) then
					target.textGroup:toFront()
				end
				
				if (flipped ~= 0) then
					for j = #chosen, 1, -1 do
						if (chosen[j] == cards[flipped].id) then
							if (showAgainTimer) then
								timer.cancel( showAgainTimer )
								showAgainTimer = nil
							end
						end
					end
				end
			
				showAgain = false
				automaticPeek = false
				timeToComplete = 0
				
				if (automaticPeekTimer) then
					timer.cancel(automaticPeekTimer)
				end
			
				target:removeEventListener( "touch", MatchingTap )
				
				-- Turns cards over to face
				local function ShowFace( object )
				
					local isCursorTarget = false
					if (cards[target.id] == targetCard) then
						isCursorTarget = true
					end
				
					cards[target.id]:removeEventListener( "touch", MatchingTap )
					if (cards[target.id].textGroup) then
						cards[target.id].textGroup:removeSelf()
					end
					if (cards[target.id].shadow) then
						cards[target.id].shadow:removeSelf()
						cards[target.id].shadow = nil
					end
					cards[target.id]:removeSelf()
					
					print(target.name)
					
					-- cards[target.id] = display.newImageRect("Images/" .. target.name .. ".png", 69, 86)
					if (gameplayMatch ~= 15 and gameplayMatch ~= 1) then
						cards[target.id] = display.newImageRect("Images/" .. target.name .. ".png", 69, 86)
					elseif (gameplayMatch == 1) then
						cards[target.id] = dynamicNumberCardSlots( tostring(target.name), 0.87, 1 )
					else
						if (type(cards[target.id].name) ~= "string") then
							cards[target.id] = dynamicNumberCardSlots( tostring(target.name), 0.87, 1 )
						else
							cards[target.id] = display.newImageRect("Images/blankFlashcard.png", 69, 86)
						end
					end
					cards[target.id].x = target.x
					cards[target.id].y = target.y
					cards[target.id].name = target.name
					cards[target.id].pair = target.pair
					cards[target.id].showMeCate = target.showMeCate
					cards[target.id].id = target.id
					cards[target.id].frame = 0
					cards[target.id].initY = target.initY
					cards[target.id].face = true
					cards[target.id].sound = target.sound
					cards[target.id].removing = target.removing
					cardGroup:insert(cards[target.id])
					
					
					if (gameplayMode == 2) then
						if (cards[target.id].shadow == nil) then
							cards[target.id].shadow = display.newImageRect("Images/cardShadow.png", 92*0.9, 110*0.9)
							 cards[target.id].shadow.x = cards[target.id].x + shadowOffsetX
							 cards[target.id].shadow.y = cards[target.id].y + shadowOffsetY
							 cards[target.id].shadow.alpha = .75
							 cards[target.id].shadow.rotation = cards[target.id].rotation
							 cardGroup:insert( cards[target.id].shadow )
						 end
					end
					if (cards[target.id].shadow) then
						cards[target.id].shadow:toFront()
					end
					cards[target.id]:toFront()
					if (cards[target.id].textGroup) then
						cards[target.id].textGroup:toFront()
					end
					
					-- local cardFlipSoundChannel = audio.play(cardFlipSound)
					
					if (gameplayMatch == 15 and type(cards[target.id].name) == "string") then
						equationMatchingSetup(target.id)
					elseif (gameplayMatch == 15 or gameplayMatch == 1) then
						if (cards[target.id].textGroup) then
							cardGroup:insert(cards[target.id].textGroup)
							cards[target.id].textGroup.anchorChildren = true
							cards[target.id].textGroup.anchorX, cards[target.id].textGroup.anchorY = 0.5, 0.5
							cards[target.id].textGroup.x, cards[target.id].textGroup.y = cards[target.id].x, cards[target.id].y
						
							cards[target.id].textGroup.x = cards[target.id].x
							cards[target.id].textGroup.y = cards[target.id].y
							
							dynamicNumberOffsets(target.id)
							
						end
					end
				
					
					local function scaleUp( object )
						if savedData.enableSounds == true then
						
							-- print(target.id)
							-- print(cards[target.id])
							-- print(cards[target.id].sound)
						
							-- playReservedChannel(cards[target.id].sound, currentCardChannel, 0)
						
						
			
							if (equationSoundTimer) then
								timer.cancel(equationSoundTimer)
								equationSoundTimer = nil
							end
							if (equationSoundTwoTimer) then
								timer.cancel(equationSoundTwoTimer)
								equationSoundTwoTimer = nil
							end
							
							if (gameplayMatch ~= 15) then
								-- if (cards[target.id].sound == "over100") then
									-- local overHundredSound
									-- repeat
										-- overHundredSound = math.random( 1, #overHundredSounds )
									-- until prevOverHundredSound ~= overHundredSound
									-- prevOverHundredSound = overHundredSound
								
									-- playReservedChannel(overHundredSounds[ overHundredSound ], currentCardChannel, 0)
								
								-- else
									-- playReservedChannel(cards[target.id].sound, currentCardChannel, 0)
								-- end
								
								print("Test 2")
								print(cards[target.id].sound)
								
								if (type(cards[target.id].sound) == "string") then
									playReservedChannel(gameSounds[cards[target.id].sound], currentCardChannel, 0)
								elseif (cards[target.id].sound <= 100) then
									playReservedChannel( gameNumSounds[cards[target.id].sound], 29, 0 )
								else
									local function partFiveAudio()
										local numTemp
										if (cards[target.id].sound < 110) then
											numTemp = tonumber( tostring(cards[target.id].sound):sub(3, 3) )
										else
											numTemp = tonumber( tostring(cards[target.id].sound):sub(2, 3) )
										end
										playReservedChannel(gameNumSounds[ numTemp ], 28, 0)
									end
								
									playReservedChannel(hundredSounds[ tonumber(tostring(cards[target.id].sound):sub(1, 1)) ], 29, 0)
								
								
									if (questionAudioTimer) then
										timer.cancel( questionAudioTimer )
										questionAudioTimer = nil
									end
									questionAudioTimer = timer.performWithDelay( 900, partFiveAudio )
										
								end
								
							else
								if (gameplayMatch == 15 and type(cards[target.id].name) ~= "string") then
									-- playReservedChannel(gameNumSounds[cards[target.id].name], currentCardChannel, 0)
								
									if (cards[target.id].name <= 100) then
										playReservedChannel( gameNumSounds[cards[target.id].name], 29, 0 )
									else
										local function partFiveAudio()
											local numTemp
											if (cards[target.id].name < 110) then
												numTemp = tonumber( tostring(cards[target.id].name):sub(3, 3) )
											else
												numTemp = tonumber( tostring(cards[target.id].name):sub(2, 3) )
											end
											playReservedChannel(gameNumSounds[ numTemp ], 28, 0)
										end
									
										playReservedChannel(hundredSounds[ tonumber(tostring(cards[target.id].name):sub(1, 1)) ], 29, 0)
									
									
										if (questionAudioTimer) then
											timer.cancel( questionAudioTimer )
											questionAudioTimer = nil
										end
										questionAudioTimer = timer.performWithDelay( 900, partFiveAudio )
											
									end
								
								else
									playEquationCardSounds(cards[target.id].name)
								end
							end
							
							--[[
							if (gameplayMatch ~= 15) then
								-- print("Test matching 1")
								if (cards[target.id].sound == "over100") then
									local overHundredSound
									repeat
										overHundredSound = math.random( 1, #overHundredSounds )
									until prevOverHundredSound ~= overHundredSound
									prevOverHundredSound = overHundredSound
								
									playReservedChannel(overHundredSounds[ overHundredSound ], currentCardChannel, 0)
								
								else
									playReservedChannel(cards[target.id].sound, currentCardChannel, 0)
								end
							
							else
								-- print("Test matching 2")
								-- if (gameplayMatch == 15 and type(cards[target.id].name) ~= "string") then
									-- playReservedChannel(gameNumSounds[cards[target.id].name], currentCardChannel, 0)
								-- else
									-- playEquationCardSounds(cards[target.id].name)
								-- end
								
								if (gameplayMatch == 15 and type(cards[target.id].name) ~= "string") then
									-- playReservedChannel(gameNumSounds[cards[target.id].name], currentCardChannel, 0)
								
									if (cards[target.id].name <= 100) then
										playReservedChannel( gameNumSounds[cards[target.id].name], 29, 0 )
									else
										local function partFiveAudio()
											local numTemp
											if (cards[target.id].name < 110) then
												numTemp = tonumber( tostring(cards[target.id].name):sub(3, 3) )
											else
												numTemp = tonumber( tostring(cards[target.id].name):sub(2, 3) )
											end
											playReservedChannel(gameNumSounds[ numTemp ], 28, 0)
										end
									
										playReservedChannel(hundredSounds[ tonumber(tostring(cards[target.id].name):sub(1, 1)) ], 29, 0)
									
									
										if (questionAudioTimer) then
											timer.cancel( questionAudioTimer )
											questionAudioTimer = nil
										end
										questionAudioTimer = timer.performWithDelay( 900, partFiveAudio )
											
									end
								
								else
									playEquationCardSounds(cards[target.id].name)
								end
								
							end
							
							]]
						
						end
						currentCardChannel = currentCardChannel + 1
						if currentCardChannel > 19 then
							currentCardChannel = 18
						end
					
						local function scaleBack( object )
							transition.to( cards[target.id], { time=100 , xScale = 1.15, yScale = 1.15, onComplete = CheckForMatch, transition=easing.outExpo } )
							if (cards[target.id].textGroup) then
								transition.to( cards[target.id].textGroup, { time=100 , xScale = 1.15, yScale = 1.15, transition=easing.outExpo } )
							end
							if (cards[target.id].shadow) then
								transition.to( cards[target.id].shadow, { time=100 , xScale = 1.15, yScale = 1.15, transition=easing.outExpo } )
							end
							
							if (turnedNum2 == 1) then
								local function sendCardToFloat()
									floaters[#floaters+1] = target.id
									
									Runtime:removeEventListener( "enterFrame", cardFloat)
									Runtime:addEventListener( "enterFrame", cardFloat)
									
									if (myData.isFireTV or myData.isController) then 
										timer.performWithDelay( 150, showCursor )
									end
								end
								timer.performWithDelay( 100, sendCardToFloat )
							
								-- if (cards[target.id].shadow == nil) then
									-- cards[target.id].shadow = display.newImageRect("Images/cardShadow.png", 92*scaleCards, 110*scaleCards)
									-- cards[target.id].shadow.x = cards[target.id].x + shadowOffsetX
									-- cards[target.id].shadow.y = cards[target.id].y + shadowOffsetY
									-- cards[target.id].shadow.alpha = .75
									-- cards[target.id].shadow.rotation = cards[target.id].rotation
									-- cardGroup[1]:insert( cards[target.id].shadow )
									
									-- cards[target.id].shadow:toFront()
									-- cards[target.id]:toFront()
									-- if (cards[target.id].textGroup) then
										-- cards[target.id].textGroup:toFront()
									-- end
								-- end
							end
						end
						transition.from(cards[target.id], {time=100, xScale = 1.5, yScale = 1.5, onComplete = scaleBack, transition=easing.inExpo} )
						if (cards[target.id].shadow) then
							transition.from(cards[target.id].shadow, {time=100, xScale = 1.5, yScale = 1.5, transition=easing.inExpo} )
						end
						if (cards[target.id].textGroup) then
							transition.from(cards[target.id].textGroup, {time=100, xScale = 1.5, yScale = 1.5, transition=easing.inExpo} )
						end
						
					end
					
					transition.from(cards[target.id], {time=timeToFlip, xScale = .01, onComplete = scaleUp, transition=easing.outExpo} )
					if (cards[target.id].textGroup) then
						transition.from(cards[target.id].textGroup, {time=timeToFlip, xScale = .01, transition=easing.outExpo} )
					end
					if (cards[target.id].shadow) then
						transition.from(cards[target.id].shadow, {time=timeToFlip, xScale = .01, transition=easing.outExpo} )
					end
					
					if (isCursorTarget == true) then
						targetCard = cards[target.id]
					end
					
				end
				
				
				local function scaleBack( object )
					transition.to( object, { time=100 , xScale = 1.15, yScale = 1.15, transition=easing.outExpo} )
					if (object.textGroup) then
					transition.to( object.textGroup, { time=100 , xScale = 1.15, yScale = 1.15, transition=easing.outExpo} )
				end
					if (object.shadow) then
						transition.to( object.shadow, { time=100 , xScale = 1.15, yScale = 1.15, transition=easing.outExpo} )
					end
					timer.performWithDelay( showCardsDelay, CheckForMatch )
				end
				
				if (turnedNum2 == 2) then
					for i = #floaters, 1, -1 do
						if (floaters[i] == cards[chosen[#chosen-1]].id) then
							table.remove(floaters, i)
						end
					end
					if (#floaters == 0) then
						Runtime:removeEventListener( "enterFrame", cardFloat)
					end
					transition.to(cards[chosen[#chosen-1]], {time=timeToFlip*2, rotation=0,  y=cards[chosen[#chosen-1]].initY, transition=easing.outExpo} )
					if (cards[chosen[#chosen-1]].textGroup) then
						transition.to(cards[chosen[#chosen-1]].textGroup, {time=timeToFlip*2, rotation=0,  y=cards[chosen[#chosen-1]].initY + cards[chosen[#chosen-1]].textGroup.offsetY, transition=easing.outExpo} )
					end
					if (cards[chosen[#chosen-1]].shadow) then
						transition.to(cards[chosen[#chosen-1]].shadow, {time=timeToFlip*2, rotation=cards[chosen[#chosen-1]].initRotation,  y=cards[chosen[#chosen-1]].initY + shadowOffsetY, transition=easing.outExpo} )
					end
				end
				
				if (showAllCards == false) then
					
					transition.to(cards[chosen[#chosen]], {time=timeToFlip, xScale = .01, onComplete = ShowFace, transition=easing.outExpo} )
					if (cards[chosen[#chosen]].textGroup) then
						transition.to(cards[chosen[#chosen]].textGroup, {time=timeToFlip, xScale = .01, transition=easing.outExpo} )
					end
					if (cards[chosen[#chosen]].shadow) then
						transition.to(cards[chosen[#chosen]].shadow, {time=timeToFlip, xScale = .01, transition=easing.outExpo} )
					end
				
					if savedData.enableSounds == true then
						playReservedChannel(flipSound, 14, 0)
					end
				else
					if savedData.enableSounds == true then
						-- playReservedChannel(cards[target.id].sound, currentCardChannel, 0)
					
						if (equationSoundTimer) then
							timer.cancel(equationSoundTimer)
							equationSoundTimer = nil
						end
						if (equationSoundTwoTimer) then
							timer.cancel(equationSoundTwoTimer)
							equationSoundTwoTimer = nil
						end
						if (gameplayMatch ~= 15) then
							-- if (cards[target.id].sound == "over100") then
								-- local overHundredSound
								-- repeat
									-- overHundredSound = math.random( 1, #overHundredSounds )
								-- until prevOverHundredSound ~= overHundredSound
								-- prevOverHundredSound = overHundredSound
							
								-- playReservedChannel(overHundredSounds[ overHundredSound ], currentCardChannel, 0)
							
							-- else
								-- playReservedChannel(cards[target.id].sound, currentCardChannel, 0)
							-- end
							
							print("Test 1")
							print(cards[target.id].sound)
							
							if (type(cards[target.id].sound) == "string") then
								playReservedChannel(gameSounds[cards[target.id].sound], currentCardChannel, 0)
							elseif (cards[target.id].sound <= 100) then
								playReservedChannel( gameNumSounds[cards[target.id].sound], 29, 0 )
							else
								local function partFiveAudio()
									local numTemp
									if (cards[target.id].sound < 110) then
										numTemp = tonumber( tostring(cards[target.id].sound):sub(3, 3) )
									else
										numTemp = tonumber( tostring(cards[target.id].sound):sub(2, 3) )
									end
									playReservedChannel(gameNumSounds[ numTemp ], 28, 0)
								end
							
								playReservedChannel(hundredSounds[ tonumber(tostring(cards[target.id].sound):sub(1, 1)) ], 29, 0)
							
							
								if (questionAudioTimer) then
									timer.cancel( questionAudioTimer )
									questionAudioTimer = nil
								end
								questionAudioTimer = timer.performWithDelay( 900, partFiveAudio )
									
							end
							
						else
							if (gameplayMatch == 15 and type(cards[target.id].name) ~= "string") then
								-- playReservedChannel(gameNumSounds[cards[target.id].name], currentCardChannel, 0)
							
								if (cards[target.id].name <= 100) then
									playReservedChannel( gameNumSounds[cards[target.id].name], 29, 0 )
								else
									local function partFiveAudio()
										local numTemp
										if (cards[target.id].name < 110) then
											numTemp = tonumber( tostring(cards[target.id].name):sub(3, 3) )
										else
											numTemp = tonumber( tostring(cards[target.id].name):sub(2, 3) )
										end
										playReservedChannel(gameNumSounds[ numTemp ], 28, 0)
									end
								
									playReservedChannel(hundredSounds[ tonumber(tostring(cards[target.id].name):sub(1, 1)) ], 29, 0)
								
								
									if (questionAudioTimer) then
										timer.cancel( questionAudioTimer )
										questionAudioTimer = nil
									end
									questionAudioTimer = timer.performWithDelay( 900, partFiveAudio )
										
								end
							
							else
								playEquationCardSounds(cards[target.id].name)
							end
						end
						
						
						
						-- if (gameplayMatch ~= 15) then
							-- print("Test sound")
						-- print(cards[target.id].sound)
							-- playReservedChannel(cards[target.id].sound, currentCardChannel, 0)
						-- else
							-- if (gameplayMatch == 15 and type(cards[target.id].name) ~= "string") then
								-- playReservedChannel(gameNumSounds[cards[target.id].name], currentCardChannel, 0)
							-- else
								-- playEquationCardSounds(cards[target.id].name)
							-- end
						-- end
						
						--[[
						if (gameplayMatch ~= 15) then
							if (cards[target.id].sound == "over100") then
								local overHundredSound
								repeat
									overHundredSound = math.random( 1, #overHundredSounds )
								until prevOverHundredSound ~= overHundredSound
								prevOverHundredSound = overHundredSound
							
								playReservedChannel(overHundredSounds[ overHundredSound ], currentCardChannel, 0)
							
							else
								playReservedChannel(cards[target.id].sound, currentCardChannel, 0)
							end
							
							-- if (type(cards[target.id].sound) == "string") then
								-- playReservedChannel(gameSounds[cards[target.id].sound], currentCardChannel, 0)
							-- elseif (cards[target.id].sound <= 100) then
								-- playReservedChannel( gameNumSounds[cards[target.id].sound], 29, 0 )
							-- else
								-- local function partFiveAudio()
									-- local numTemp
									-- if (cards[target.id].sound < 110) then
										-- numTemp = tonumber( tostring(cards[target.id].sound):sub(3, 3) )
									-- else
										-- numTemp = tonumber( tostring(cards[target.id].sound):sub(2, 3) )
									-- end
									-- playReservedChannel(gameNumSounds[ numTemp ], 28, 0)
								-- end
							
								-- playReservedChannel(hundredSounds[ tonumber(tostring(cards[target.id].sound):sub(1, 1)) ], 29, 0)
							
							
								-- if (questionAudioTimer) then
									-- timer.cancel( questionAudioTimer )
									-- questionAudioTimer = nil
								-- end
								-- questionAudioTimer = timer.performWithDelay( 900, partFiveAudio )
									
							-- end
							
						else
							if (gameplayMatch == 15 and type(cards[target.id].name) ~= "string") then
								-- playReservedChannel(gameNumSounds[cards[target.id].name], currentCardChannel, 0)
							
								if (cards[target.id].name <= 100) then
									playReservedChannel( gameNumSounds[cards[target.id].name], 29, 0 )
								else
									local function partFiveAudio()
										local numTemp
										if (cards[target.id].name < 110) then
											numTemp = tonumber( tostring(cards[target.id].name):sub(3, 3) )
										else
											numTemp = tonumber( tostring(cards[target.id].name):sub(2, 3) )
										end
										playReservedChannel(gameNumSounds[ numTemp ], 28, 0)
									end
								
									playReservedChannel(hundredSounds[ tonumber(tostring(cards[target.id].name):sub(1, 1)) ], 29, 0)
								
								
									if (questionAudioTimer) then
										timer.cancel( questionAudioTimer )
										questionAudioTimer = nil
									end
									questionAudioTimer = timer.performWithDelay( 900, partFiveAudio )
										
								end
							
							else
								playEquationCardSounds(cards[target.id].name)
							end
						end
						
						]]
					
					end
					currentCardChannel = currentCardChannel + 1
					if currentCardChannel > 19 then
						currentCardChannel = 18
					end
					transition.to( cards[chosen[#chosen]], { time=100 , xScale = 1.5, yScale = 1.5, transition=easing.inExpo, onComplete = scaleBack} )
					if (cards[chosen[#chosen]].textGroup) then
						transition.to( cards[chosen[#chosen]].textGroup, { time=100 , xScale = 1.5, yScale = 1.5, transition=easing.inExpo } )
					end
					if (cards[chosen[#chosen]].shadow) then
						transition.to( cards[chosen[#chosen]].shadow, { time=100 , xScale = 1.5, yScale = 1.5, transition=easing.inExpo } )
					end
					
					cards[chosen[#chosen]].face = true
					
					if (turnedNum2 == 1) then
						local function sendCardToFloat()
							floaters[#floaters+1] = target.id
							Runtime:removeEventListener( "enterFrame", cardFloat)
							Runtime:addEventListener( "enterFrame", cardFloat)
						end
						timer.performWithDelay( 100, sendCardToFloat )
						
						if (myData.isFireTV or myData.isController) then 
							timer.performWithDelay( 150, showCursor )
						end
						
						-- if (cards[target.id].shadow == nil) then
							-- cards[target.id].shadow = display.newImageRect("Images/cardShadow.png", 92*scaleCards, 110*scaleCards)
							-- cards[target.id].shadow.x = cards[target.id].x + shadowOffsetX
							-- cards[target.id].shadow.y = cards[target.id].y + shadowOffsetY
							-- cards[target.id].shadow.alpha = .75
							-- cards[target.id].shadow.rotation = cards[target.id].rotation
							-- cardGroup[1]:insert( cards[target.id].shadow )
							
							-- cards[target.id].shadow:toFront()
							-- cards[target.id]:toFront()
							-- if (cards[target.id].textGroup) then
								-- cards[target.id].textGroup:toFront()
							-- end
						-- end
						
					end
				
					if savedData.enableSounds == true then
						playReservedChannel(flipSound, 14, 0)
					end
				
				end
			
			
			else
			
				if savedData.enableSounds == true then
					playReservedChannel(wrongSound, currentWrongChannel, 0)
				end
				currentWrongChannel = currentWrongChannel + 1
				if currentWrongChannel > 20 then
					currentWrongChannel = 19
				end
				
			
			end
		
		end
	
	
	end
	
end

function ChooseCards()

	-- if (gameplayOptions == 1 or gameplayOptions == 3 or gameplayOptions == 4) then
		
		if (layout > 0 and layout < 5 ) then
			numCards = 4
		elseif (layout > 4 and layout < 9 ) then
			numCards = 6
		elseif (layout > 8 and layout < 13 ) then
			numCards = 8
		elseif (layout > 12 and layout < 18 ) then
			numCards = 10
		end
		
		
		local xmlCards = {}
		
		if (showMeSelectOptions == nil) then
			showMeSelectOptions = {}
		else
			for i = #showMeSelectOptions, 1, -1 do
				showMeSelectOptions[i] = nil
			end
		end
		
		if (showMeSelectOptionsPlural == nil) then
			showMeSelectOptionsPlural = {}
		else
			for i = #showMeSelectOptionsPlural, 1, -1 do
				showMeSelectOptionsPlural[i] = nil
			end
		end
		
		if (showMeSelectOptionsPairs == nil) then
			showMeSelectOptionsPairs = {}
		else
			for i = #showMeSelectOptionsPairs, 1, -1 do
				showMeSelectOptionsPairs[i] = nil
			end
		end
		
		
		-- randomDeck = math.random(1, #cardPairsXML.child[gameplayMatch].child)
		
		print ("Start Range: " .. startRange)
		print ("End Range: " .. endRange)
		-- print (gameplayMatch)
		
		
		local chosenNumbers = {}
		
		if (orderRandom == false) then
			for i = startRange, startRange+(numCards/2) do
				chosenNumbers[#chosenNumbers+1] = i
			end
			
		else
			chosenNum = numCards/2
		
			repeat
				local randomNumber = math.random(startRange, endRange)
				
				-- local chosenAlready = false
				-- for i = 1, #chosenNumbers do
					-- if (chosenNumbers[i] == randomNumber) then
						-- chosenAlready = true
						
					-- end
				-- end
				
				-- if (chosenAlready == false) then
					-- if (randomNumber ~= 0) then
						-- chosenNumbers[#chosenNumbers+1] = randomNumber
						-- chosenNum = chosenNum - 1
						
					-- end
					
				-- end
				
				local chosenAlready = 0
				for i = 1, #chosenNumbers do
					if (chosenNumbers[i] == randomNumber) then
						chosenAlready = chosenAlready + 1
						
					end
				end
				
				if (chosenAlready < 1 and gameplayMatch ~= 15) or
					chosenAlready < 2 and gameplayMatch == 15 and randomNumber > 3 and randomNumber % 10 ~= 1 and randomNumber % 10 ~= 2 and randomNumber % 10 ~= 3 or
					chosenAlready < 1 and gameplayMatch == 15 and randomNumber <= 3 and randomNumber > 1 then
					if (randomNumber ~= 0) then
						chosenNumbers[#chosenNumbers+1] = randomNumber
						chosenNum = chosenNum - 1
						
					end
					
				end
			
			until #chosenNumbers == (numCards/2)
		end
		
		
		for i = 1, #chosenNumbers do
		
			if (gameplayMatch == 1) then -- numbers to numbers
				
				-- xmlCards[#xmlCards+1] = firstImageSet[chosenNumbers[i]]
				-- xmlCards[#xmlCards+1] = firstImageSet[chosenNumbers[i]]
				
				xmlCards[#xmlCards+1] = chosenNumbers[i]
				xmlCards[#xmlCards+1] = chosenNumbers[i]
				
				showMeSelectOptions[#showMeSelectOptions+1] = singularNumbersSet[chosenNumbers[i]]
				showMeSelectOptionsPlural[#showMeSelectOptionsPlural+1] = pluralNumbersSet[chosenNumbers[i]]
				
				
			elseif (gameplayMatch == 2) then -- numbers to groups
			
				-- xmlCards[#xmlCards+1] = firstImageSet[chosenNumbers[i]]
				xmlCards[#xmlCards+1] = chosenNumbers[i]
				local randomGroup = math.random(1,3)
				if (randomGroup == 1) then
					xmlCards[#xmlCards+1] = secondImageSet[chosenNumbers[i]]
				elseif (randomGroup == 2) then
					xmlCards[#xmlCards+1] = thirdImageSet[chosenNumbers[i]]
				else
					xmlCards[#xmlCards+1] = fourthImageSet[chosenNumbers[i]]
				end
				
				
				showMeSelectOptions[#showMeSelectOptions+1] = firstImageSet[chosenNumbers[i]]
				showMeSelectOptionsPlural[#showMeSelectOptionsPlural+1] = firstImageSet[chosenNumbers[i]]
				
				
			elseif (gameplayMatch == 3) then -- groups to groups
				
				local randomGroup = math.random(1,2)
				local firstGroupChosen
				if (randomGroup == 1) then
					xmlCards[#xmlCards+1] = secondImageSet[chosenNumbers[i]]
					
					showMeSelectOptions[#showMeSelectOptions+1] = secondImageSet[chosenNumbers[i]]
					showMeSelectOptionsPlural[#showMeSelectOptionsPlural+1] = secondImageSet[chosenNumbers[i]]
					
					firstGroupChosen = "second"
				else
					xmlCards[#xmlCards+1] = thirdImageSet[chosenNumbers[i]]
					
					showMeSelectOptions[#showMeSelectOptions+1] = thirdImageSet[chosenNumbers[i]]
					showMeSelectOptionsPlural[#showMeSelectOptionsPlural+1] = thirdImageSet[chosenNumbers[i]]
					
					firstGroupChosen = "third"
				-- else
					-- xmlCards[#xmlCards+1] = fourthImageSet[chosenNumbers[i]]
					
					-- showMeSelectOptions[#showMeSelectOptions+1] = fourthImageSet[chosenNumbers[i]]
					-- showMeSelectOptionsPlural[#showMeSelectOptionsPlural+1] = fourthImageSet[chosenNumbers[i]]
					
					-- firstGroupChosen = "fourth"
				end
				
				-- local randomGroup = math.random(1,2)
				if (firstGroupChosen == "second") then
					-- if (randomGroup == 1) then
						xmlCards[#xmlCards+1] = thirdImageSet[chosenNumbers[i]]
					-- else
						-- xmlCards[#xmlCards+1] = fourthImageSet[chosenNumbers[i]]
					-- end
				else
					-- if (randomGroup == 1) then
						xmlCards[#xmlCards+1] = secondImageSet[chosenNumbers[i]]
					-- else
						-- xmlCards[#xmlCards+1] = fourthImageSet[chosenNumbers[i]]
					-- end
				-- else
					-- if (randomGroup == 1) then
						-- xmlCards[#xmlCards+1] = secondImageSet[chosenNumbers[i]]
					-- else
						-- xmlCards[#xmlCards+1] = thirdImageSet[chosenNumbers[i]]
					-- end
				end
				
				
				
			elseif (gameplayMatch == 4) then -- dots to dots
				xmlCards[#xmlCards+1] = fifthImageSet[chosenNumbers[i]]
				xmlCards[#xmlCards+1] = fifthImageSet[chosenNumbers[i]]
				
				showMeSelectOptions[#showMeSelectOptions+1] = fifthImageSet[chosenNumbers[i]]
				showMeSelectOptionsPlural[#showMeSelectOptionsPlural+1] = fifthImageSet[chosenNumbers[i]]
				
			elseif (gameplayMatch == 5) then -- numbers to dots
				
				xmlCards[#xmlCards+1] = firstImageSet[chosenNumbers[i]]
				xmlCards[#xmlCards+1] = fifthImageSet[chosenNumbers[i]]
				
				showMeSelectOptions[#showMeSelectOptions+1] = firstImageSet[chosenNumbers[i]]
				showMeSelectOptionsPlural[#showMeSelectOptionsPlural+1] = firstImageSet[chosenNumbers[i]]
			
			elseif (gameplayMatch == 6) then -- shape to shape
			
				xmlCards[#xmlCards+1] = firstShapeSet[chosenNumbers[i]]
				xmlCards[#xmlCards+1] = firstShapeSet[chosenNumbers[i]]
			
				showMeSelectOptions[#showMeSelectOptions+1] = firstShapeSet[chosenNumbers[i]]
				showMeSelectOptionsPlural[#showMeSelectOptionsPlural+1] = firstShapeSetPlural[chosenNumbers[i]]
			
			elseif (gameplayMatch == 7) then -- shape to shape item
			
				xmlCards[#xmlCards+1] = firstShapeSet[chosenNumbers[i]]
				local randomGroup = math.random(1,2)
				if (randomGroup == 1 and chosenNumbers[i] ~= 7) then
					xmlCards[#xmlCards+1] = secondShapeSet[chosenNumbers[i]]
				elseif (randomGroup == 2 or chosenNumbers[i] == 7) then
					xmlCards[#xmlCards+1] = thirdShapeSet[chosenNumbers[i]]
				end
			
				showMeSelectOptions[#showMeSelectOptions+1] = firstShapeSet[chosenNumbers[i]]
				showMeSelectOptionsPlural[#showMeSelectOptionsPlural+1] = firstShapeSetPlural[chosenNumbers[i]]
			
			elseif (gameplayMatch == 8) then -- shape item to shape item
			
				local randomGroup = math.random(1,2)
				local firstGroupChosen
				if (randomGroup == 1) then
					xmlCards[#xmlCards+1] = secondShapeSet[chosenNumbers[i]]
					
					showMeSelectOptions[#showMeSelectOptions+1] = secondShapeSet[chosenNumbers[i]]
					showMeSelectOptionsPlural[#showMeSelectOptionsPlural+1] = firstShapeSetPlural[chosenNumbers[i]]
					
					firstGroupChosen = "second"
				elseif (randomGroup == 2) then
					xmlCards[#xmlCards+1] = thirdShapeSet[chosenNumbers[i]]
					
					showMeSelectOptions[#showMeSelectOptions+1] = thirdShapeSet[chosenNumbers[i]]
					showMeSelectOptionsPlural[#showMeSelectOptionsPlural+1] = firstShapeSetPlural[chosenNumbers[i]]
					
					firstGroupChosen = "third"
				end
				
				if (firstGroupChosen == "second") then
					xmlCards[#xmlCards+1] = thirdShapeSet[chosenNumbers[i]]
				elseif (firstGroupChosen == "third") then
					xmlCards[#xmlCards+1] = secondShapeSet[chosenNumbers[i]]
				end
			
			elseif (gameplayMatch == 9) then -- color to color
			
				xmlCards[#xmlCards+1] = firstColorSet[chosenNumbers[i]]
				xmlCards[#xmlCards+1] = firstColorSet[chosenNumbers[i]]
				
				showMeSelectOptions[#showMeSelectOptions+1] = firstColorSet[chosenNumbers[i]]
				showMeSelectOptionsPlural[#showMeSelectOptionsPlural+1] = firstColorSet[chosenNumbers[i]]
			
			elseif (gameplayMatch == 10) then -- color to color item
			
				xmlCards[#xmlCards+1] = firstColorSet[chosenNumbers[i]]
				local randomGroup = math.random(1,2)
				if (randomGroup == 1) then
					xmlCards[#xmlCards+1] = secondColorSet[chosenNumbers[i]]
				elseif (randomGroup == 2) then
					xmlCards[#xmlCards+1] = thirdColorSet[chosenNumbers[i]]
				end
			
				showMeSelectOptions[#showMeSelectOptions+1] = firstColorSet[chosenNumbers[i]]
				showMeSelectOptionsPlural[#showMeSelectOptionsPlural+1] = firstColorSet[chosenNumbers[i]]
			
			elseif (gameplayMatch == 11) then -- color item to color item
			
				local randomGroup = math.random(1,2)
				local firstGroupChosen
				if (randomGroup == 1) then
					xmlCards[#xmlCards+1] = secondColorSet[chosenNumbers[i]]
					
					showMeSelectOptions[#showMeSelectOptions+1] = firstColorSet[chosenNumbers[i]]
					showMeSelectOptionsPlural[#showMeSelectOptionsPlural+1] = firstColorSet[chosenNumbers[i]]
					
					firstGroupChosen = "second"
				elseif (randomGroup == 2) then
					xmlCards[#xmlCards+1] = thirdColorSet[chosenNumbers[i]]
					
					showMeSelectOptions[#showMeSelectOptions+1] = firstColorSet[chosenNumbers[i]]
					showMeSelectOptionsPlural[#showMeSelectOptionsPlural+1] = firstColorSet[chosenNumbers[i]]
					
					firstGroupChosen = "third"
				end
				
				if (firstGroupChosen == "second") then
					xmlCards[#xmlCards+1] = thirdColorSet[chosenNumbers[i]]
				elseif (firstGroupChosen == "third") then
					xmlCards[#xmlCards+1] = secondColorSet[chosenNumbers[i]]
				end
			
			
			elseif (gameplayMatch == 12) then -- color to word
			
				xmlCards[#xmlCards+1] = firstColorSet[chosenNumbers[i]]
				xmlCards[#xmlCards+1] = fourthColorSet[chosenNumbers[i]]
			
				showMeSelectOptions[#showMeSelectOptions+1] = firstColorSet[chosenNumbers[i]]
				showMeSelectOptionsPlural[#showMeSelectOptionsPlural+1] = firstColorSet[chosenNumbers[i]]
			
			elseif (gameplayMatch == 13) then -- color item to word
			
				xmlCards[#xmlCards+1] = fourthColorSet[chosenNumbers[i]]
				local randomGroup = math.random(1,2)
				if (randomGroup == 1) then
					xmlCards[#xmlCards+1] = secondColorSet[chosenNumbers[i]]
				elseif (randomGroup == 2) then
					xmlCards[#xmlCards+1] = thirdColorSet[chosenNumbers[i]]
				end
			
				showMeSelectOptions[#showMeSelectOptions+1] = firstColorSet[chosenNumbers[i]]
				showMeSelectOptionsPlural[#showMeSelectOptionsPlural+1] = firstColorSet[chosenNumbers[i]]
			
			elseif (gameplayMatch == 14) then -- item to same item
				
				xmlCards[#xmlCards+1] = pictureSet[chosenNumbers[i]]
				xmlCards[#xmlCards+1] = pictureSet[chosenNumbers[i]]
			
				showMeSelectOptions[#showMeSelectOptions+1] = pictureSet[chosenNumbers[i]]
				showMeSelectOptionsPlural[#showMeSelectOptionsPlural+1] = pictureSet[chosenNumbers[i]]
				
				
			elseif (gameplayMatch == 15) then -- numbers to equations
				
				print(matchingSign)
				
				if (matchingSign == "+") then
					xmlCards[#xmlCards+1] = chosenNumbers[i]
					
					local equation
					local equationRepeated = false
					
					local randomFirstNum, randomSecondNum
					
					print("Test1: " .. chosenNumbers[i])
					
					
					repeat
						repeat
							equationRepeated = false
							equation = ""
							randomFirstNum = math.random( 1, chosenNumbers[i]-1 )
							randomSecondNum = chosenNumbers[i] - randomFirstNum
							
							if (randomSecondNum > randomFirstNum) then
								local tempNum = randomFirstNum
								randomFirstNum = randomSecondNum
								randomSecondNum = tempNum
							end
							equation = tostring(randomFirstNum) .. "+" .. tostring(randomSecondNum)
						
							for i = #xmlCards, 1, -1 do
								if (xmlCards[i] == equation) then
									equationRepeated = true
								end
							end
						until equationRepeated == false and randomSecondNum < 100
					
					until randomFirstNum % 10 + randomSecondNum % 10 <= 10 and chosenNumbers[i] <= 100 or
							randomFirstNum % 10 + randomSecondNum % 10 <= 10 and chosenNumbers[i] > 100 and
							((randomFirstNum % 100) / 10) + ((randomSecondNum % 100) / 10) <= 10 or 
							equationEasyMode == false
					
					xmlCards[#xmlCards+1] = equation
					
					
					showMeSelectOptions[#showMeSelectOptions+1] = chosenNumbers[i]
					showMeSelectOptionsPlural[#showMeSelectOptionsPlural+1] = chosenNumbers[i]
					
				elseif (matchingSign == "x") then
					
					local answer
					local equation
					local equationRepeated = false
					repeat
						equationRepeated = false
						equation = ""
						
						
						local randomFirstNum
						repeat
							answer = math.random(startRange, endRange)
							randomFirstNum = math.random( 1, answer-1 )
						until answer % randomFirstNum == 0
						local randomSecondNum = answer / randomFirstNum
						
						if (randomSecondNum > randomFirstNum) then
							local tempNum = randomFirstNum
							randomFirstNum = randomSecondNum
							randomSecondNum = tempNum
						end
						equation = tostring(randomFirstNum) .. "x" .. tostring(randomSecondNum)
					
						for i = #xmlCards, 1, -1 do
							if (xmlCards[i] == equation) then
								equationRepeated = true
							end
						end
					until equationRepeated == false
					
					xmlCards[#xmlCards+1] = answer
					xmlCards[#xmlCards+1] = equation
					
					showMeSelectOptions[#showMeSelectOptions+1] = randomAnswer
					showMeSelectOptionsPlural[#showMeSelectOptionsPlural+1] = randomAnswer
					
				elseif (matchingSign == "-") then
					
					local randomFirstNum = chosenNumbers[i]
					local randomAnswer, randomSecondNum
					
					local equation
					local equationRepeated = false
					
					print("Test2: " .. chosenNumbers[i])
					
					repeat
					
						repeat
							equationRepeated = false
							equation = ""
							
							randomSecondNum = math.random( 1, chosenNumbers[i]-1 )
							randomAnswer = randomFirstNum - randomSecondNum
							
							equation = tostring(randomFirstNum) .. "-" .. tostring(randomSecondNum)
						
							for i = #xmlCards, 1, -1 do
								if (xmlCards[i] == equation) then
									equationRepeated = true
								end
							end
						until equationRepeated == false and randomSecondNum < 100
					
					until randomFirstNum % 10 - randomSecondNum % 10 > 0 and randomFirstNum % 10 > randomSecondNum % 10 and randomFirstNum <= 100 or
							randomFirstNum % 10 - randomSecondNum % 10 > 0 and randomFirstNum % 10 > randomSecondNum % 10 and randomFirstNum > 100 and
							((randomFirstNum % 100) / 10) - ((randomSecondNum % 100) / 10) > 0 and ((randomFirstNum % 100) / 10) > ((randomSecondNum % 100) / 10) or
							randomFirstNum % 10 == 0 or
							equationEasyMode == false
					
					xmlCards[#xmlCards+1] = randomAnswer
					xmlCards[#xmlCards+1] = equation
					
					showMeSelectOptions[#showMeSelectOptions+1] = randomAnswer
					showMeSelectOptionsPlural[#showMeSelectOptionsPlural+1] = randomAnswer
					
					print("-")
					print(randomAnswer)
					print(equation)
					
				elseif (matchingSign == "/") then
					
					local randomFirstNum
					local randomAnswer
					
					local equation
					local equationRepeated = false
					repeat
						equationRepeated = false
						equation = ""
						
						local randomSecondNum
						repeat
							randomFirstNum = math.random( startRange, endRange )
							randomSecondNum = math.random( 1, randomFirstNum-1 )
						until randomFirstNum % randomSecondNum == 0
						randomAnswer = randomFirstNum / randomSecondNum
						
						equation = tostring(randomFirstNum) .. "/" .. tostring(randomSecondNum)
					
						for i = #xmlCards, 1, -1 do
							if (xmlCards[i] == equation) then
								equationRepeated = true
							end
						end
					until equationRepeated == false
					
					xmlCards[#xmlCards+1] = randomAnswer
					xmlCards[#xmlCards+1] = equation
					
					showMeSelectOptions[#showMeSelectOptions+1] = randomAnswer
					showMeSelectOptionsPlural[#showMeSelectOptionsPlural+1] = randomAnswer
				
					
				end
				
				
			end
			
			showMeSelectOptions[#showMeSelectOptions+1] = showMeSelectOptions[#showMeSelectOptions]
			showMeSelectOptionsPlural[#showMeSelectOptionsPlural+1] = showMeSelectOptionsPlural[#showMeSelectOptionsPlural]
			
			
		end
		
		
		for i = 1, #showMeSelectOptions do
			showMeSelectOptionsPairs[#showMeSelectOptionsPairs+1] = showMeSelectOptions[i]
		end
		
		
		for i = 1, #xmlCards do
			cardImages[#cardImages+1] = xmlCards[i]
		end
		
		totalPairs = numCards / 2
		
		for i = 1, numCards/2 do
			cardPairs[#cardPairs+1] = i
			cardPairs[#cardPairs+1] = i
		end
		
		
		if (isClassicMode == false) then
			if (cardOptions.category == "shapeToShape" or
				cardOptions.category == "shapeToShapeItem" or
				cardOptions.category == "shapeItemToShapeItem" or
				cardOptions.category == "colorToColor" or
				cardOptions.category == "colorToColorItem" or
				cardOptions.category == "colorItemToColorItem" or
				cardOptions.category == "numbersToNumbers") then
			
				changeShowMeQuestion(true)
			
			end
		end

end

function changeShowMeQuestion(isQuestionStart)


	if (cardOptions.category == "numbersToNumbers") then
		if (playingFirstPartShowMe == true) then
			-- if (isMatchingCardsFirstPlay == true) then
				-- if (gameplayMode == 2 or myData.isFireTV or myData.isController) then
					-- playReservedChannel(pickTheCardsWithTheNumber, 11, 0) --change to "findThe"... when VO is available
					-- questionOptions.line1 = "Pick the cards with the number " .. showMeSelectOptions[1] .. "."
				-- else
					-- playReservedChannel(touchTheCardsWithTheNumber, 11, 0)
					-- questionOptions.line1 = "Touch the cards with the number " .. showMeSelectOptions[1] .. "."
				-- end
			-- else
				if (gameplayMode == 2) then
					-- playReservedChannel(pickThe, 11, 0) --change to "findThe"... when VO is available
					questionOptions.line1 = "Find the " .. showMeSelectOptionsPlural[1] .. "."
				else
				-- elseif (myData.isFireTV or myData.isController) then
					questionOptions.line1 = "Pick the " .. showMeSelectOptionsPlural[1] .. "."
				-- else
					-- playReservedChannel(touchThe, 11, 0)
					-- questionOptions.line1 = "Touch the " .. showMeSelectOptionsPlural[1] .. "."
				end
			-- end
		else
			-- if (isMatchingCardsFirstPlay == true) then
				-- if (gameplayMode == 2 or myData.isFireTV or myData.isController) then
					-- playReservedChannel(nowPickTheCardsWithTheNumber, 11, 0)--change to "findThe"... when VO is available
					-- questionOptions.line1 = "Now pick the cards with the number " .. showMeSelectOptions[1] .. "."
				-- else
					-- playReservedChannel(nowTouchTheCardsWithTheNumber, 11, 0)
					-- questionOptions.line1 = "Now touch the cards with the number " .. showMeSelectOptions[1] .. "."
				-- end
			-- else
				if (gameplayMode == 2) then
					-- playReservedChannel(nowPickThe, 11, 0)--change to "findThe"... when VO is available
					questionOptions.line1 = "Now find the " .. showMeSelectOptionsPlural[1] .. "."
				else
				-- elseif (myData.isFireTV or myData.isController) then
					questionOptions.line1 = "Now pick the " .. showMeSelectOptionsPlural[1] .. "."
				-- else
					-- playReservedChannel(nowTouchThe, 11, 0)
					-- questionOptions.line1 = "Now touch the " .. showMeSelectOptionsPlural[1] .. "."
				end
			-- end
		end
	elseif (cardOptions.category == "numbersToGroups") then
	
	else
		-- if (myData.isFireTV or myData.isController) then 
	
	
			if (isQuestionStart == true) then
				if (gameplayMode == 2) then
					questionOptions.line1 = "Find the " .. showMeSelectOptionsPlural[1] .. "."
				elseif (cardOptions.category == "shapeToShape" or
					cardOptions.category == "shapeToShapeItem" or
					cardOptions.category == "shapeItemToShapeItem" or
					cardOptions.category == "numbersToNumbers") then
					
					questionOptions.line1 = "Pick the " .. showMeSelectOptionsPlural[1] .. "."
				else
					if (cardOptions.category == "colorToColor") then
						questionOptions.line1 = "Pick the " .. showMeSelectOptions[1] .. " cards."
					else
						questionOptions.line1 = "Pick the " .. showMeSelectOptions[1] .. " items."
					end
				end
			else
				if (gameplayMode == 2) then
					questionOptions.line1 = "Now find the " .. showMeSelectOptionsPlural[1] .. "."
				elseif (cardOptions.category == "shapeToShape" or
					cardOptions.category == "shapeToShapeItem" or
					cardOptions.category == "shapeItemToShapeItem" or
					cardOptions.category == "numbersToNumbers") then
					
					questionOptions.line1 = "Now pick the " .. showMeSelectOptionsPlural[1] .. "."
				else
					if (cardOptions.category == "colorToColor") then
						questionOptions.line1 = "Now pick the " .. showMeSelectOptions[1] .. " cards."
					else
						questionOptions.line1 = "Now pick the " .. showMeSelectOptions[1] .. " items."
					end
				end
			end
		-- else
			-- if (isQuestionStart == true) then
				-- if (gameplayMode == 2) then
					-- questionOptions.line1 = "Find the " .. showMeSelectOptionsPlural[1] .. "."
				-- elseif (cardOptions.category == "shapeToShape" or
					-- cardOptions.category == "shapeToShapeItem" or
					-- cardOptions.category == "shapeItemToShapeItem" or
					-- cardOptions.category == "numbersToNumbers") then
					
					-- questionOptions.line1 = "Touch the " .. showMeSelectOptionsPlural[1] .. "."
				-- else
					-- if (cardOptions.category == "colorToColor") then
						-- questionOptions.line1 = "Touch the " .. showMeSelectOptions[1] .. " cards."
					-- else
						-- questionOptions.line1 = "Touch the " .. showMeSelectOptions[1] .. " items."
					-- end
				-- end
			-- else
				-- if (gameplayMode == 2) then
					-- questionOptions.line1 = "Now find the " .. showMeSelectOptionsPlural[1] .. "."
				-- elseif (cardOptions.category == "shapeToShape" or
					-- cardOptions.category == "shapeToShapeItem" or
					-- cardOptions.category == "shapeItemToShapeItem" or
					-- cardOptions.category == "numbersToNumbers") then
					
					-- questionOptions.line1 = "Now touch the " .. showMeSelectOptionsPlural[1] .. "."
				-- else
					-- if (cardOptions.category == "colorToColor") then
						-- questionOptions.line1 = "Now touch the " .. showMeSelectOptions[1] .. " cards."
					-- else
						-- questionOptions.line1 = "Now touch the " .. showMeSelectOptions[1] .. " items."
					-- end
				-- end
			-- end
		-- end
	end


	
	if (cardOptions.category ~= "numbersToGroups") then
		questionOptions.line2 = ""
	end
	
	questionText.text = questionOptions.line1
	questionTextTwo.text = questionOptions.line2
	
	
	-- questionText.anchorX = 0.5
		-- questionText.anchorY = 0.5
		
	-- questionText.x = 900
	-- questionText.alpha = 1
	-- questionTextTwo.anchorX = 0.5
		-- questionTextTwo.anchorY = 0.5
		
	-- questionTextTwo.x = 900
	-- questionTextTwo.alpha = 1

end

function chooseLayout()

	
	ChooseCards()
	
	local totalCount = numCards
	
	
	
	-- if (#levelOrder ~= 0 and gameplayMatch ~= 6) then
		-- if (layout == 1 or layout == 12) then
			-- if (variation == 4 or variation == 7 and gameplayType == 2) then
				-- randomSet = 4
			-- else
				-- randomSet = 6
			-- end
		-- elseif (layout == 2 or layout == 6 or layout == 9) then
			-- randomSet = 0
		-- elseif (layout == 3 or layout == 5) then
			-- randomSet = 2
		-- elseif (layout == 4 or layout == 7 or layout == 8 or layout == 10 or layout == 11) then
			-- if (variation == 4 or variation == 7 and gameplayType == 2) then
				-- randomSet = 2
			-- else
				-- randomSet = 4
			-- end
		-- elseif (layout == 13) then
			-- randomSet = 10
		-- elseif (layout == 16) then
			-- randomSet = 8
		-- else
			-- repeat randomSet = math.random(0, #cardImages - numCards)
			-- until randomSet % 2 == 0
		-- end
	-- elseif (#levelOrder == 0 and variation == 4 or  #levelOrder == 0 and variation == 7 and gameplayMatch ~= 6) then
		-- if (variation == 4 or variation == 7 and gameplayType == 2) then
			-- repeat randomSet = math.random(0, #cardImages - numCards)
			-- until randomSet % 2 == 0 and randomSet < 4
		-- else
			-- repeat randomSet = math.random(0, #cardImages - numCards)
			-- until randomSet % 2 == 0 and randomSet < 6
		-- end
	-- else
		-- repeat randomSet = math.random(0, #cardImages - numCards)
		-- until randomSet % 2 == 0
	-- end
	
	--randomSet = startRange*2
	
	
	local tempNum = numCards
	for i = 1, tempNum do
		local randomCard = math.random(1, #cardImages)
		cards[numCards] =  display.newImageRect("Images/cardBG" .. cardBacks[currentBack] .. ".png", 69, 86)
		cards[numCards].name = cardImages[randomCard] -- Reference to pair of images
		print ("Random Card: " .. cardImages[randomCard])
		print ("Random Card Pair: " .. cardPairs[randomCard])
		cards[numCards].pair = cardPairs[randomCard]
		cards[numCards].showMeCate = showMeSelectOptionsPairs[randomCard]
		cards[numCards].id = numCards -- Reference to the index of table
		cards[numCards].frame = 0
		cards[numCards].face = false
		cards[numCards].initY = 0
		cards[numCards].frame = 0
		cards[numCards].alpha = 1
		cards[numCards].removing = false
		-- cards[numCards].sound = gameSounds[ cardImages[randomCard] ]
		cards[numCards].sound = cardImages[randomCard]
		-- cards[numCards]:addEventListener( "touch", MatchingTap )
		table.remove(cardImages, randomCard)
		table.remove(cardPairs, randomCard)
		table.remove(showMeSelectOptionsPairs, randomCard)
		cardGroup:insert (cards[numCards])
		
		numCards = numCards - 1
	end
	
	-- if (version.appStore == "Amazon" and system.getInfo ( "model" ) == "AFTB" or version.appStore == "Amazon FTV") then
		-- Runtime:addEventListener( "onFTVKey", MatchingTap )
	-- end
	
	
	
	if (layout == 1) then
		
		local count = 1
		local horizontalSpacing, verticalSpacing = 80, 95
		
		for i = 1, 2 do
			for j = 1, 2 do
				cards[count].x = j * horizontalSpacing
				cards[count].y = i * verticalSpacing
				count = count + 1
			end
		end
		
	end
	
	if (layout == 2) then
	
		local count = 1
		horizontalSpacing, verticalSpacing = 95 + cards[1].width, 100
		
		for i = 1, 2 do
			cards[count].x = i * horizontalSpacing
			count = count + 1
		end
		for i = 1, 2 do
			cards[count].x = cards[4].x + (horizontalSpacing*0.5)
			cards[count].y = (i * verticalSpacing) - ((verticalSpacing - cards[4].height) * 0.5) - verticalSpacing - (cards[4].height*0.5)
			count = count + 1
		end
	
	end
	
	if (layout == 3) then
	
		local count = 1
		horizontalSpacing = 76
		
		for i = 1, 4 do
			cards[count].x = i * (horizontalSpacing)
			count = count + 1
		end
	
	end
	
	if (layout == 4) then
	
		local count = 1
		local horizontalSpacing, verticalSpacing = 180, cards[1].height
		
		cards[1].x, cards[1].y = 0, 0
		cards[2].x, cards[2].y = cards[1].x + horizontalSpacing, 0
		cards[3].x, cards[3].y = cards[1].width + 0, cards[1].y + verticalSpacing
		cards[4].x, cards[4].y = cards[1].width + cards[1].x + horizontalSpacing, cards[1].y + verticalSpacing

	end
	
	if (layout == 5) then
	
		local count = 1
		local horizontalSpacing, verticalSpacing = 78, 95
		
		for i = 1, 2 do
			for j = 1, 3 do
				cards[count].x = j * horizontalSpacing
				cards[count].y = i * verticalSpacing
				count = count + 1
			end
		end
	
	end
	
	if (layout == 6) then
	
		local count = 1
		local horizontalSpacing, verticalSpacing = 80, 95
		
		cards[count].x, cards[1].y = 0, 0
		-- cards[count].xScale = .9
		-- cards[count].yScale = .9
		count = count + 1
		
		for i = 1, 2 do
			cards[count].x = (i * horizontalSpacing) - horizontalSpacing - (horizontalSpacing*0.5)
			cards[count].y = verticalSpacing
			-- cards[count].xScale = .9
			-- cards[count].yScale = .9
			count = count + 1
		end
		for i = 1, 3 do
			cards[count].x = (i * horizontalSpacing) - (horizontalSpacing*2)
			cards[count].y = verticalSpacing * 2
			-- cards[count].xScale = .9
			-- cards[count].yScale = .9
			count = count + 1
		end
	
	
	end
	
	if (layout == 7) then
	
		local count = 1
		local horizontalSpacing, verticalSpacing = 85, 100
		
		cards[count].x, cards[1].y = 0, 0
		-- cards[count].xScale = .9
		-- cards[count].yScale = .9
		count = count + 1
		
		for i = 1, 3 do
			cards[count].x = (i * horizontalSpacing) - (horizontalSpacing*2)
			cards[count].y = -verticalSpacing
			-- cards[count].xScale = .9
			-- cards[count].yScale = .9
			count = count + 1
		end
		for i = 1, 2 do
			cards[count].x = (i * (horizontalSpacing*2)) - horizontalSpacing - (horizontalSpacing*2)
			cards[count].y = -verticalSpacing * 2
			-- cards[count].xScale = .9
			-- cards[count].yScale = .9
			count = count + 1
		end
	
	end

	if (layout == 8) then
	
		local count = 1
		horizontalSpacing, verticalSpacing = 85, 100
		
		for i = 1, 2 do
			cards[count].x = i * horizontalSpacing
			count = count + 1
		end
		for i = 1, 2 do
			cards[count].x = cards[6].x + (i * horizontalSpacing)
			cards[count].y = cards[6].y + verticalSpacing
			count = count + 1
		end
		for i = 1, 2 do
			cards[count].x = cards[4].x + (i * horizontalSpacing)
			cards[count].y = cards[4].y + verticalSpacing
			count = count + 1
		end
	
	end
	
	if (layout == 9) then
		
		local count = 1
		local horizontalSpacing, verticalSpacing = 77, 95
		
		for i = 1, 2 do
			for j = 1, 4 do
				cards[count].x = j * horizontalSpacing
				cards[count].y = i * verticalSpacing
				count = count + 1
			end
		end
		
	end
	
	if (layout == 10) then
	
		local count = 1
		local horizontalSpacing, verticalSpacing = 85, 100
		
		for i = 1, 2 do
			for j = 1, 2 do
				cards[count].x = i * horizontalSpacing
				cards[count].y = (j * verticalSpacing) * 2
				count = count + 1
			end
		end
		for i = 1, 2 do
			for j = 1, 2 do
				cards[count].x = ((j * horizontalSpacing) * 3) - (horizontalSpacing*2) - (horizontalSpacing)
				cards[count].y = (i * verticalSpacing)  + verticalSpacing + (verticalSpacing*0.5)
				count = count + 1
			end
		end
	
	end

	if (layout == 11) then
	
		local count = totalCount
		horizontalSpacing, verticalSpacing = 150, 100
		
		for i = 1, 3 do
			cards[count].x = (i * horizontalSpacing) - (horizontalSpacing*0.5)
			count = count - 1
		end
		for i = 1, 2 do
			cards[count].x = i * horizontalSpacing
			cards[count].y = cards[8].y + verticalSpacing
			count = count - 1
		end
		for i = 1, 3 do
			cards[count].x = (i * horizontalSpacing) - (horizontalSpacing*0.5)
			cards[count].y = cards[5].y + verticalSpacing
			count = count - 1
		end
	
	end
	
	if (layout == 12) then
	
		local count = totalCount
		horizontalSpacing, verticalSpacing = 85, 100
		
		for i = 1, 2 do
			cards[count].x = ((i * horizontalSpacing) * 3) - (horizontalSpacing*2)
			count = count - 1
		end
		for i = 1, 4 do
			cards[count].x = i * horizontalSpacing
			cards[count].y = cards[8].y + verticalSpacing
			count = count - 1
		end
		for i = 1, 2 do
			cards[count].x = ((i * horizontalSpacing) * 3) - (horizontalSpacing*2)
			cards[count].y = cards[5].y + verticalSpacing
			count = count - 1
		end
	
	end
	
	if (layout == 13) then
	
		local count = totalCount
		horizontalSpacing, verticalSpacing = 85, 100
		
		for i = 1, 2 do
			cards[count].x = (i * horizontalSpacing) - horizontalSpacing
			count = count - 1
		end
		cards[count].x = cards[10].x - (cards[10].width*0.5)
		cards[count].y = cards[9].y + verticalSpacing
		count = count - 1
		for i = 1, 4 do
			cards[count].x = (i * horizontalSpacing) + (cards[9].width*0.5)
			cards[count].y = cards[9].y + verticalSpacing
			count = count - 1
		end
		for i = 1, 2 do
			cards[count].x = (i * horizontalSpacing) - horizontalSpacing
			cards[count].y = cards[4].y + verticalSpacing
			count = count - 1
		end
		cards[count].x = cards[5].x
		cards[count].y = cards[4].y + verticalSpacing
		count = count - 1
	
	end
	
	if (layout == 14) then
		
		local count = 1
		local horizontalSpacing, verticalSpacing = 85, 100
		
		for i = 1, 2 do
			for j = 1, 5 do
				cards[count].x = j * horizontalSpacing
				cards[count].y = i * verticalSpacing
				count = count + 1
			end
		end
		
	end
	
	if (layout == 15) then
	
		local count = totalCount
		horizontalSpacing, verticalSpacing = 85, 100
		
		for i = 1, 4 do
			cards[count].x = i * horizontalSpacing
			count = count - 1
		end
		for i = 1, 2 do
			cards[count].x = ((i * horizontalSpacing) * 3) - (horizontalSpacing*2)
			cards[count].y = cards[8].y + verticalSpacing
			count = count - 1
		end
		for i = 1, 4 do
			cards[count].x = i * horizontalSpacing
			cards[count].y = cards[5].y + verticalSpacing
			count = count - 1
		end
	
	end
	
	if (layout == 16) then
	
		local count = totalCount
		horizontalSpacing, verticalSpacing = 85, 100
		
		for i = 1, 2 do
			cards[count].x = ((i * horizontalSpacing) * 2)
			count = count - 1
		end
		for i = 1, 5 do
			cards[count].x = i * horizontalSpacing
			cards[count].y = cards[10].y + verticalSpacing
			count = count - 1
		end
		for i = 1, 3 do
			cards[count].x = ((i * horizontalSpacing) * 2) - (horizontalSpacing)
			cards[count].y = cards[8].y + verticalSpacing
			count = count - 1
		end
	
	end
	
	if (layout == 17) then
	
		local count = totalCount
		horizontalSpacing, verticalSpacing = 68, 95
		
		for i = 1, 2 do
			cards[count].x = ((i * horizontalSpacing) * 2)
			count = count - 1
		end
		for i = 3, 4 do
			cards[count].x = ((i * horizontalSpacing) * 2) - 20
			count = count - 1
		end
		cards[count].x = cards[10].x + horizontalSpacing
		cards[count].y = cards[10].y + verticalSpacing
		count = count - 1
		cards[count].x = cards[8].x + horizontalSpacing
		cards[count].y = cards[8].y + verticalSpacing
		count = count - 1
		for i = 1, 2 do
			cards[count].x = ((i * horizontalSpacing) * 2)
			cards[count].y = cards[6].y + verticalSpacing
			count = count - 1
		end
		for i = 3, 4 do
			cards[count].x = ((i * horizontalSpacing) * 2) - 20
			cards[count].y = cards[6].y + verticalSpacing
			count = count - 1
		end
	
	end
	
	
	
	for i = 1, #cards do
		cards[i].initY = cards[i].y
	end
	
	
end

-- Not Used
function decideDifficulty()

	if (difficulty == 1) then
		if (layout == 0) then
			local randomLayout = math.random( 1, 2 )
			layout = randomLayout
		else
			local randomLayout = math.random( 1, 3 )
			layout = randomLayout
		end
	elseif (difficulty == 2) then
		if (layout == 1 or layout == 2 or layout == 3) then
			local randomLayout = math.random( 4, 5 )
			layout = randomLayout
		else
			local randomLayout = math.random( 4, 7 )
			layout = randomLayout
		end
	elseif (difficulty == 3) then
		if (layout == 4 or layout == 5 or layout == 6 or  layout == 7) then
			local randomLayout = math.random( 8, 9 )
			layout = randomLayout
		else
			local randomLayout = math.random( 7, 10 )
			layout = randomLayout
		end
	elseif (difficulty == 4) then
		if (layout == 7 or layout == 8 or layout == 9 or  layout == 10) then
			local randomLayout = math.random( 11, 12 )
			layout = randomLayout
		else
			local randomLayout = math.random( 11, 13 )
			layout = randomLayout
		end
	elseif (difficulty == 5) then
		if (layout == 11 or layout == 12 or layout == 13) then
			local randomLayout = math.random( 14, 15 )
			layout = randomLayout
		else
			local randomLayout = math.random( 14, 17 )
			layout = randomLayout
		end
	elseif (difficulty == 6) then
		local randomLayout = math.random( 12, 17 )
		layout = randomLayout
	
	end

end
--


-- If it's multiple choice

function equationWin()

	if (myData.isFireTV or myData.isController) then 
		transition.to( cursor, { time=100, alpha=0 } )
	end

	if (gameplayMode == 5) then
		if savedData.enableSounds == true then
			playReservedChannel(shortClapSound, 21, 0)
		end
	end
	
	local function hideQuestion()
		questionText.alpha = 0
		questionTextTwo.alpha = 0
	end
	transition.to( questionText, { time=700, alpha = 0, transition=easing.outExpo, onComplete = hideQuestion } )
	transition.to( questionTextTwo, { time=700, alpha = 0, transition=easing.outExpo } )

	Runtime:removeEventListener( "enterFrame", countTime )
	transition.to( cardGroup, { time=700, alpha = 0, transition=easing.outExpo } )
	if (gameplayMode == 3) then
		transition.to( equationGroup, { time=700, alpha = 0, transition=easing.outExpo } )
		transition.to( howManyBackground, { time=700, alpha = 0, transition=easing.outExpo } )
		transition.to( equationComplexGroup, { time=700, alpha = 0, transition=easing.outExpo } )
		transition.to( dotsGroup, { time=700, alpha = 0, transition=easing.outExpo } )
	elseif (gameplayMode == 5 or gameplayMode == 6) then
	
		
		if (question == "How many" or 
			question == "How many more apples do you need to make" or
			question == "How many apples do you need to take away to leave" or
			question == "How many are" and curGame % 2 == 0 or
			question == "TrueOrFalse" or
			question == "Word problem" or
			gameplayMode == 6) then
			
			for i = 1, #howManyImages do
				transition.to( howManyImages[i], { time=700, alpha = 0, transition=easing.outExpo } )
			end
			transition.to( howManyBackground, { time=700, alpha = 0, transition=easing.outExpo } )
		end
		
		
	end
	goodJobSequence()

	print("good job seq")
	
end


function equationWrong( target )

	local randomRotation = math.random(-400,400)
						
		local function setCardsAlpha( obj )

			target.alpha = 0
			target.rotation = 0
			target.y = target.initY
			if (target.textGroup) then
				target.textGroup.alpha = 0
				target.textGroup.rotation = 0
				target.textGroup.y = target.textGroup.initY
			end
			if (target.shadow) then
				target.shadow.alpha = 0
				target.shadow.rotation = 0
				target.shadow.y = target.shadow.initY
			end
			target.xImage.alpha = 0
			target.xImage.rotation = 0
			target.xImage.y = target.xImage.initY
		
		end
		
		
		if (target.textGroup) then
			target.textGroup.initY = target.textGroup.y
			transition.to( target.textGroup, { time=500 , rotation = randomRotation, alpha=1, y=800, transition=easing.inExpo} )
		end
		if (target.shadow) then
			target.shadow.initY = target.shadow.y
			transition.to( target.shadow, { time=500 , rotation = randomRotation, alpha=1, y=800, transition=easing.inExpo} )
		end
		
		target.initY = target.y
		transition.to( target, { time=500 , rotation = randomRotation, alpha=1, y=800, transition=easing.inExpo} )
		
		target.xImage.alpha = 1
		target.xImage.initY = target.xImage.y
		transition.to( target.xImage, { time=500 , rotation = randomRotation, alpha=1, y=800, transition=easing.inExpo, onComplete = setCardsAlpha } )
		
end


function ComplexChoiceTap(event)
	
	local target = event.target
	local keyName = event.keyName
	if (target == nil) then
		target = targetCard
	end

	--if event.keyName == nil and event.phase == "began" or
	--	event.phase == "began" and buttonsActive == true then
	if event.keyName == nil and event.phase == "began" or
		event.phase == "began" and buttonsActive == true or
		(keyName and event.phase == "down" and buttonsActive) then
		
		
		if (event.keyName and event.keyName ~= "back" and 
												event.keyName ~= "left" and 
												event.keyName ~= "right" and
												event.keyName ~= "up" and
												event.keyName ~= "down" and 
												event.keyName ~= "buttonY" and
												event.keyName ~= "mediaPlayPause" and
												event.keyName ~= "buttonZ" and
												event.keyName ~= "buttonX" and
												keyName ~= "menu" or
												event.keyName == nil) then
	
			if (myData.isFireTV or myData.isController) then 
				transition.to( cursor, { time=100, alpha=0 } )
				buttonsActive = false
			end
			buttonsActive = false
			
			
			if (cardTrans) then
				transition.cancel( cardTrans )
				cardTrans = nil
			end
			cardGroup.x = cardGroup.targetX
			
			
			
			
			
			
			local newX, newY
			local possibleAnswer
			
			local choiceOneChosen = false
			local choiceTwoChosen = false
			local answerChosen = false
			
			-- local details = levelDetails["level" .. level]
			-- local detailsTwo = details.cards[currentWaypoint]
			
			
			if savedData.enableSounds == true then
				playReservedChannel(flipSound, 14, 0)
			end
			
			
			local done = false
			local fixCardsDone = false
			
			local function fixEquationCardPos()

				if (target.row == 1) then
					local pos = 7 - row
					local visibleCard
					for i = 1, totalRow do
						if (cards[i].y == cards[i].initY and cards[i].alpha == 1 or cards[i].id == floaters[1]) then
							
							if (question == "Which 2 numbers add up to") then
								
								transition.to( cards[i], { time=100 , x = rowPositionWhichTwoNum[pos], transition=easing.outExpo } )
							else
								transition.to( cards[i], { time=100 , x = rowPosition[pos], transition=easing.outExpo } )
							end
							
							if (cards[i].textGroup) then
								if (question == "Which 2 numbers add up to") then
									transition.to( cards[i].textGroup, { time=100 , x = rowPositionWhichTwoNum[pos] + cards[i].textGroup.offsetX, transition=easing.outExpo } )
								else
									transition.to( cards[i].textGroup, { time=100 , x = rowPosition[pos] + cards[i].textGroup.offsetX, transition=easing.outExpo } )
								end
							end
							
							if (question == "Which 2 numbers add up to") then
								transition.to( cards[i].xImage, { time=100 , x = rowPositionWhichTwoNum[pos], transition=easing.outExpo } )
							else
								transition.to( cards[i].xImage, { time=100 , x = rowPosition[pos], transition=easing.outExpo } )
							end
							
							
							pos = pos + 2
							
							visibleCard = i
						end
					end
					row = row - 1
					
					local function moveCards()
						for i = 1, #cards do
							if (cards[i].alpha == 0) then
								cards[i].x = cards[visibleCard].x
								if (cards[i].textGroup) then
									cards[i].textGroup.x = cards[visibleCard].x + cards[i].textGroup.offsetX
								end
								if (cards[i].xImage) then
									cards[i].xImage.x = cards[visibleCard].x
								end
							end
						end
					end
					timer.performWithDelay( 105, moveCards )
					
					if (myData.isFireTV or myData.isController) then 
						timer.performWithDelay( 100, showCursor )
					end
				else
				
					local posTwo = 7 - rowTwo
					local visibleCard
					for i = totalRow+1, totalRowTwo+totalRow do
						if (cards[i].y == cards[i].initY and cards[i].alpha == 1 or cards[i].id == floaters[1]) then
							
							if (question == "Which 2 numbers add up to") then
								transition.to( cards[i], { time=100 , x = rowPositionWhichTwoNum[posTwo], transition=easing.outExpo } )
							else
								transition.to( cards[i], { time=100 , x = rowPosition[posTwo], transition=easing.outExpo } )
							end
							if (cards[i].textGroup) then
								if (question == "Which 2 numbers add up to") then
									transition.to( cards[i].textGroup, { time=100 , x = rowPositionWhichTwoNum[posTwo] + cards[i].textGroup.offsetX, transition=easing.outExpo } )
								else
									transition.to( cards[i].textGroup, { time=100 , x = rowPosition[posTwo] + cards[i].textGroup.offsetX, transition=easing.outExpo } )
								end
							end
							
							if (question == "Which 2 numbers add up to") then
								transition.to( cards[i].xImage, { time=100 , x = rowPositionWhichTwoNum[posTwo], transition=easing.outExpo } )
							else
								transition.to( cards[i].xImage, { time=100 , x = rowPosition[posTwo], transition=easing.outExpo } )
							end
							
							posTwo = posTwo + 2
							
							visibleCard = i
						end
					end
					rowTwo = rowTwo - 1
					
					local function moveCards()
						for i = 1, #cards do
							if (cards[i].alpha == 0) then
								cards[i].x = cards[visibleCard].x
								if (cards[i].textGroup) then
									cards[i].textGroup.x = cards[visibleCard].x + cards[i].textGroup.offsetX
								end
								if (cards[i].xImage) then
									cards[i].xImage.x = cards[visibleCard].x
								end
							end
						end
					end
					timer.performWithDelay( 105, moveCards )
					
					if (myData.isFireTV or myData.isController) then 
						timer.performWithDelay( 100, showCursor )
					end
				end
				
				fixCardsDone = true

				timer.performWithDelay( 150, makeButtonsActive )
				
			end
			
			local blankX, blankY
			local function equationCardHop( object )
				local function equationCardHopTwo( obj )
					local function moveCardToSpot( obj )
						if (gameplayMode == 3) then
						
							if savedData.enableSounds == true then
								playReservedChannel(shortClapSound, 21, 0)
							end
						
							local underlineX, underlineY
							for i = equationComplexGroup.numChildren, 1, -1 do
								if (equationComplexGroup[i]) then
									if (equationComplexGroup[i].id == "_") then
										underlineX, underlineY = equationComplexGroup[i]:localToContent(0,0)
										obj.x = underlineX
										if (obj.textGroup) then
											obj.textGroup.x = obj.x + obj.textGroup.offsetX
										end
										equationComplexGroup[i].alpha = 0
									end
								end
							end
						
							if (numRows == 1) then
								-- obj.y = equationGroup.y - detailsTwo.offsetY
								obj.y = gameOptions.grayBGY - cardOptions.offsetY
								Particles:newEmitter(explosions,"fireworks", "Images/starParticle.png", 32, 32, 10, underlineX, gameOptions.grayBGY - cardOptions.offsetY, -4, 4, -16, 6, 252,234,27)--altRgb[1], altRgb[2], altRgb[3])
							else
								-- obj.y = newEquationY - detailsTwo.offsetY
								obj.y = gameOptions.grayBGY - cardOptions.offsetY
								Particles:newEmitter(explosions,"fireworks", "Images/starParticle.png", 32, 32, 10, underlineX, gameOptions.grayBGY - cardOptions.offsetY, -4, 4, -16, 6, 252,234,27)--altRgb[1], altRgb[2], altRgb[3])
							end
							if (obj.textGroup) then
								obj.textGroup.y = obj.y + obj.textGroup.offsetY
							end
						
						elseif (gameplayMode == 5) then
							Particles:newEmitter(explosions,"fireworks", "Images/starParticle.png", 32, 32, 10, obj.x, obj.y, -4, 4, -16, 6, 252,234,27)--altRgb[1], altRgb[2], altRgb[3])
							obj.alpha = 0
						end
						
						if savedData.enableSounds == true then
							playReservedChannel(explodeSound, 15, 0)
						end
						
						if (done == false and fixCardsDone == false) then
							fixEquationCardPos()
						elseif (done == true) then
						
							if (myData.isController) then
								Runtime:removeEventListener( "key", ComplexChoiceTap )
							elseif (myData.isFireTV) then
								Runtime:removeEventListener( "onFTVKey", ComplexChoiceTap )
							end
						
							for i = 1, #cards do
								if (cards[i].y == cards[i].initY) then
									transition.to( cards[i], { time=150 , alpha = 0 } )
									
									if (cards[i].textGroup) then
										transition.to( cards[i].textGroup, { time=150 , alpha = 0 } )
									end
								end
							end
						end
						
					end
					
					if (obj.textGroup) then
						transition.to( obj.textGroup, { time=150 , y=obj.y + 25 + obj.textGroup.offsetY, transition=easing.inExpo } )
					end
					transition.to( obj, { time=150 , y=obj.y + 25, transition=easing.inExpo, onComplete=moveCardToSpot } )
				end
				
				if (object.textGroup) then
					transition.to( object.textGroup, { time=150 , y=object.y - 20 + object.textGroup.offsetY, transition=easing.outExpo} )
				end
				transition.to( object, { time=150 , y=object.y - 20, transition=easing.outExpo, onComplete=equationCardHopTwo} )
				if (gameplayMode == 5) then
					for i = 1, #cards do
						if (cards[i].id == floaters[1]) then
							Runtime:removeEventListener( "enterFrame", cardFloat)
							
							if (cards[i].textGroup) then
								transition.to( cards[i].textGroup, { time=150 , rotation = 0, y=cards[i].y - 20 + cards[i].textGroup.offsetY, transition=easing.outExpo} )
							end
							
							transition.to( cards[i], { time=150 , rotation = 0, y=cards[i].y - 20, transition=easing.outExpo, onComplete=equationCardHopTwo} )
							
						end
					end
				end
				
				if savedData.enableSounds == true then
					playReservedChannel(cardHopSound, 16, 0)
				end
				
			end
			
			local function scalePop( obj )
			
				audio.stop( 11 )
				if (questionAudioTimer) then
					timer.cancel( questionAudioTimer )
					questionAudioTimer = nil
				end
				
				if savedData.enableSounds == true then
					for i = #cards, 1, -1 do
						if (target == cards[i]) then
							-- if (cards[i].sound == "over100") then
								-- local overHundredSound
								-- repeat
									-- overHundredSound = math.random( 1, #overHundredSounds )
								-- until prevOverHundredSound ~= overHundredSound
								-- prevOverHundredSound = overHundredSound
							
								-- playReservedChannel(overHundredSounds[ overHundredSound ], currentCardChannel, 0)
							
							-- else
								-- playReservedChannel(cards[i].sound, currentCardChannel, 0)
							-- end
							
							if (cards[i].id == 0) then
								playReservedChannel( gameSounds["zero"], 29, 0 )
							elseif (cards[i].id <= 100) then
								playReservedChannel( gameNumSounds[cards[i].id], 29, 0 )
							else
								local function partFiveAudio()
									local numTemp
									if (cards[i].id < 110) then
										numTemp = tonumber( tostring(cards[i].id):sub(3, 3) )
									else
										numTemp = tonumber( tostring(cards[i].id):sub(2, 3) )
									end
									playReservedChannel(gameNumSounds[ numTemp ], 28, 0)
								end
							
								playReservedChannel(hundredSounds[ tonumber(tostring(cards[i].id):sub(1, 1)) ], 29, 0)
							
							
								if (questionAudioTimer) then
									timer.cancel( questionAudioTimer )
									questionAudioTimer = nil
								end
								questionAudioTimer = timer.performWithDelay( 900, partFiveAudio )
									
							end
						end
					end
				end
				currentCardChannel = currentCardChannel + 1
				if currentCardChannel > 19 then
					currentCardChannel = 18
				end
				
				if (gameplayMode == 5) then
					
					if (choiceOneComplete == true) then
						choiceOneComplete = false
						local function startCardFloat()
							floaters[#floaters+1] = target.id
							Runtime:removeEventListener( "enterFrame", cardFloat)
							Runtime:addEventListener( "enterFrame", cardFloat)
						end
						timer.performWithDelay( 100, startCardFloat )
						
						if (obj.textGroup) then
							transition.to( obj.textGroup, { time=100 , xScale = 1.15, yScale = 1.15, transition=easing.outExpo } )
						end
						transition.to( obj, { time=100 , xScale = 1.15, yScale = 1.15, transition=easing.outExpo } )
					
						timer.performWithDelay( 150, makeButtonsActive )
					else
						for i = #cards, 1, -1 do
							cards[i]:removeEventListener( "touch", ChoiceTap )
						end
						if (obj.textGroup) then
							transition.to( obj.textGroup, { time=100 , xScale = 1.15, yScale = 1.15, transition=easing.outExpo } )
						end
						transition.to( obj, { time=100 , xScale = 1.15, yScale = 1.15, onComplete = equationCardHop, transition=easing.outExpo } )
					end
				else
					obj:removeEventListener( "touch", ChoiceTap )
					
					if (obj.textGroup) then
						transition.to( obj.textGroup, { time=100 , xScale = 1, yScale = 1, transition=easing.outExpo } )
					end
					transition.to( obj, { time=100 , xScale = 1, yScale = 1, onComplete = equationCardHop, transition=easing.outExpo } )
				end
				
			end
			
			
			
			
			if (target.id == equationAnswer) then
			
				transition.to(target, {time=100, xScale = 1.5, yScale = 1.5, onComplete = scalePop, transition=easing.inExpo} )
				if (target.textGroup) then
					transition.to(target.textGroup, {time=100, xScale = 1.5, yScale = 1.5, transition=easing.inExpo} )
				end
				
				blankX, blankY = choiceOneText:localToContent( 0, 0 )
				timer.performWithDelay(timeToShowWin, equationWin)
				choiceOneChosen = true
				
				done = true
					
				choiceOne = target.id
				
				for i = #cards, 1, -1 do
					cards[i]:removeEventListener( "touch", ComplexChoiceTap )
				end	
			
			else
			
				equationWrong( target )
				
				timer.performWithDelay( 500, fixEquationCardPos )
				target:removeEventListener( "touch", ComplexChoiceTap )
				
				if savedData.enableSounds == true then
					for i = #cards, 1, -1 do
						if (target == cards[i]) then
							playReservedChannel(wrongSound, currentWrongChannel, 0)
						end
					end
				end
				currentWrongChannel = currentWrongChannel + 1
				if currentWrongChannel > 20 then
					currentWrongChannel = 19
				end
			
			end

			
		end
			
	end
	
end

function decideComplexEquation()

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
	equationComplexGroup = display.newGroup()

	local levelOptions = gameDetails["level" .. level]
	local gameOptions = gameLevelDetails
	local equationOptions = gameOptions.equation
	local detailsBG = gameOptions.grayBGY

	howManyBackground = display.newImageRect("Images/UI/messageBG.png", 1000, 110 )
	howManyBackground.x = -1000
	howManyBackground.y = detailsBG
	equationComplexGroup:toFront()
	
	print("testing 1")
	print(startRange)
	print(endRange)
	print(equationSign)
	print(prevEquationGame)
	
	repeat
		repeat
			equationAnswer = math.random( startRange, endRange)
		until prevEquationGame ~= equationAnswer and equationSign == "+" and equationAnswer > 3 or
				prevEquationGame ~= equationAnswer and equationSign == "-" and equationAnswer < endRange - 3
	
		choiceOne = math.random( 1, endRange - 1 )
		choiceTwo = math.random( 1, endRange - 1 )
		choiceThree = math.random( 1, endRange - 1 )
	
	until choiceOne > 0 and choiceTwo > 0 and choiceThree > 0 and choiceOne + choiceTwo + choiceThree == equationAnswer and equationSign == "+" or
			choiceOne > 0 and choiceTwo > 0 and choiceThree > 0 and choiceOne - choiceTwo - choiceThree == equationAnswer and equationSign == "-"
	prevEquationGame = equationAnswer
	
	print("testing 2")
	
	if (answerBlank == true) then
		if (equationSign == "+") then
			equationText = tostring(choiceOne.."+"..choiceTwo.."+"..choiceThree.."=".."_")
		else
			equationText = tostring(choiceOne.."-"..choiceTwo.."-"..choiceThree.."=".."_")
		end
	end
	
	print(choiceOne)
	print(choiceTwo)
	print(choiceThree)
	print(equationAnswer)
	
	local cardTextGroups = {}
	
	for k = 1, string.len(equationText) do
	
		if (equationText:sub(k,k) == "+" or equationText:sub(k,k) == "-") then
			if (equationText:sub(k,k) == "+") then
				cardTextGroups[#cardTextGroups+1] = display.newImageRect("Images/plus.png", 50, 50 )
				cardTextGroups[#cardTextGroups]:setFillColor(255/255,254/255,240/255)
				cardTextGroups[#cardTextGroups].xScale, cardTextGroups[#cardTextGroups].yScale = 1, 1
				if (cardTextGroups[#cardTextGroups-1]) then
					if (cardTextGroups[#cardTextGroups-1].id == "_") then
						cardTextGroups[#cardTextGroups].x = cardTextGroups[#cardTextGroups-1].x + 70
					elseif (cardTextGroups[#cardTextGroups-1].id ~= "_" or cardTextGroups[#cardTextGroups-1].id ~= "+" or
								cardTextGroups[#cardTextGroups-1].id ~= "=") then
						cardTextGroups[#cardTextGroups].x = cardTextGroups[#cardTextGroups-1].x + 40
					else
						cardTextGroups[#cardTextGroups].x = cardTextGroups[#cardTextGroups-1].x + 50
					end
				end
				cardTextGroups[#cardTextGroups].id = "+"
			else
				cardTextGroups[#cardTextGroups+1] = display.newImageRect("Images/minus.png", 50, 50 )
				cardTextGroups[#cardTextGroups]:setFillColor(255/255,254/255,240/255)
				cardTextGroups[#cardTextGroups].xScale, cardTextGroups[#cardTextGroups].yScale = 1, 1
				if (cardTextGroups[#cardTextGroups-1]) then
					if (cardTextGroups[#cardTextGroups-1].id == "_") then
						cardTextGroups[#cardTextGroups].x = cardTextGroups[#cardTextGroups-1].x + 70
					elseif (cardTextGroups[#cardTextGroups-1].id ~= "_" or cardTextGroups[#cardTextGroups-1].id ~= "-" or
								cardTextGroups[#cardTextGroups-1].id ~= "=") then
						cardTextGroups[#cardTextGroups].x = cardTextGroups[#cardTextGroups-1].x + 40
					else
						cardTextGroups[#cardTextGroups].x = cardTextGroups[#cardTextGroups-1].x + 50
					end
				end
				cardTextGroups[#cardTextGroups].id = "-"
			end
		elseif (equationText:sub(k,k) == "=") then
			cardTextGroups[#cardTextGroups+1] = display.newImageRect("Images/equals.png", 50, 50 )
			cardTextGroups[#cardTextGroups]:setFillColor(255/255,254/255,240/255)
			cardTextGroups[#cardTextGroups].xScale, cardTextGroups[#cardTextGroups].yScale = 1, 1
			if (cardTextGroups[#cardTextGroups-1]) then
				if (cardTextGroups[#cardTextGroups-1].id == "_") then
					cardTextGroups[#cardTextGroups].x = cardTextGroups[#cardTextGroups-1].x + 70
				elseif (cardTextGroups[#cardTextGroups-1].id ~= "_" or cardTextGroups[#cardTextGroups-1].id ~= "+" or
							cardTextGroups[#cardTextGroups-1].id ~= "=") then
					cardTextGroups[#cardTextGroups].x = cardTextGroups[#cardTextGroups-1].x + 40
				else
					cardTextGroups[#cardTextGroups].x = cardTextGroups[#cardTextGroups-1].x + 50
				end
			end
			cardTextGroups[#cardTextGroups].id = "="
		elseif (equationText:sub(k,k) == "_") then
			cardTextGroups[#cardTextGroups+1] = display.newImageRect("Images/UI/blankCard.png", 65, 79 )
			cardTextGroups[#cardTextGroups]:setFillColor(255/255,254/255,240/255)
			cardTextGroups[#cardTextGroups].xScale, cardTextGroups[#cardTextGroups].yScale = 1, 1
			if (cardTextGroups[#cardTextGroups-1]) then
			
				cardTextGroups[#cardTextGroups].x = cardTextGroups[#cardTextGroups-1].x + 70
				-- cardTextGroups[#cardTextGroups].y = 30
				-- cardTextGroups[#cardTextGroups].y = 30
			end
			cardTextGroups[#cardTextGroups].id = "_"
		else
			cardTextGroups[#cardTextGroups+1] = display.newImageRect("Images/" .. equationText:sub(k, k) .. "Digit.png", 50, 50 )
			cardTextGroups[#cardTextGroups]:setFillColor(255/255,254/255,240/255)
			cardTextGroups[#cardTextGroups].xScale, cardTextGroups[#cardTextGroups].yScale = 1, 1
			if (cardTextGroups[#cardTextGroups-1]) then
				if (cardTextGroups[#cardTextGroups-1].id == "_") then
					cardTextGroups[#cardTextGroups].x = cardTextGroups[#cardTextGroups-1].x + 70
				elseif (cardTextGroups[#cardTextGroups-1].id ~= "_" or cardTextGroups[#cardTextGroups-1].id ~= "+" or
							cardTextGroups[#cardTextGroups-1].id ~= "=") then
					cardTextGroups[#cardTextGroups].x = cardTextGroups[#cardTextGroups-1].x + 40
				else
					cardTextGroups[#cardTextGroups].x = cardTextGroups[#cardTextGroups-1].x + 50
				end
			end
			cardTextGroups[#cardTextGroups].id = equationText:sub(k, k)
		end
		
		equationComplexGroup:insert( cardTextGroups[#cardTextGroups] )
	
	end
	
	
	equationComplexGroup.xScale = equationOptions.scale
	equationComplexGroup.yScale = equationOptions.scale
	
	
	equationComplexGroup.anchorChildren = true
	equationComplexGroup.anchorX = 0.5
	equationComplexGroup.anchorY = 0.5
	
	--tempCardGroup.x = halfW
	
	if (numOrGroup == "numbersDots") then
		equationComplexGroup.y = gameOptions.grayBGY + equationOptions.offsetY
	else
		equationComplexGroup.y = gameOptions.grayBGY + equationOptions.offsetY
	end

	newEquationGroupX = equationComplexGroup.x
	newEquationGroupY = equationComplexGroup.y
	
	transition.to( howManyBackground, { time=700, x=halfW, transition=easing.outExpo } )
	

end

function decideComplexChoices()

	local levelOptions = gameDetails["level" .. level]
	local gameOptions = gameLevelDetails
	local questionOptions = gameOptions.questions
	local cardOptions = gameOptions.cards
	

	randomNumbers = {}
	
	local tempChoices = numChoices
	
	
	randomNumbers[#randomNumbers+1] = equationAnswer
	
	for i = 1, tempChoices-1 do
		repeat 
			local repeated = false
			randomNumber = math.random(startRange, endRange)
			
			for i = 1, #randomNumbers do
				if (randomNumbers[i] == randomNumber) then
					repeated = true
				end
			end
			
		until repeated == false and randomNumber <= randomNumbers[1] + 5 and
														randomNumber >= randomNumbers[1] - 5
														
		print("random numbers")
		print(randomNumber)
		randomNumbers[#randomNumbers+1] = randomNumber
	end
	
	
	print("test")
	for i = 1, #randomNumbers do
		print(randomNumbers[i])
	end
	
	
	
	-- if (choicesOrderRand == false) then
		-- table.sort( randomNumbers, compare)
	-- end
	
	--table.sort( randomNumbers, compare)

	randomizeTable( randomNumbers )
	randomizeTable( randomNumbers )
	
	local randomSpotTable = math.random(1, 3) 
	if (randomSpotTable == 1 and #randomNumbers > 2) then
		randomNumbers[1], randomNumbers[3] = randomNumbers[3], randomNumbers[1] 
	elseif (randomSpotTable == 2) then
		randomNumbers[1], randomNumbers[2] = randomNumbers[2], randomNumbers[1] 
	end
	
	
	
	local scale = scaleCards
	spacing = 20
	row = numChoices
	totalRow = row
	rowTwo = 0
	totalRowTwo = rowTwo
	numRows = 1
	
	if (numChoices == 5) then
		scale = scaleCards
		spacing = 18
		row = 5
		totalRow = row
		rowTwo = 0
		totalRowTwo = rowTwo
		numRows = 1
	elseif (numChoices == 6) then
		scale = scaleCards
		spacing = 20
		row = 3
		totalRow = row
		rowTwo = 3
		totalRowTwo = rowTwo
		numRows = 2
	elseif (numChoices == 7) then
		scale = scaleCards
		spacing = 20
		row = 4
		totalRow = row
		rowTwo = 3
		totalRowTwo = rowTwo
		numRows = 2
	elseif (numChoices == 8) then
		scale = scaleCards
		spacing = 20
		row = 4
		totalRow = row
		rowTwo = 4
		totalRowTwo = rowTwo
		numRows = 2
	elseif (numChoices == 9) then
		scale = scaleCards
		spacing = 20
		row = 5
		totalRow = row
		rowTwo = 4
		totalRowTwo = rowTwo
		numRows = 2
	elseif (numChoices == 10) then
		scale = scaleCards
		spacing = 20
		row = 5
		totalRow = row
		rowTwo = 5
		totalRowTwo = rowTwo
		numRows = 2
	end
	
	
	
	local tempCardGroup = display.newGroup()
	local tempCardGroupTwo = display.newGroup()
	
	print(row)
	for i = 1, row do
		print(randomNumbers[1])
		
		if (numOrGroup == "numbers") then
			cards[i] = dynamicNumberCardSlots( tostring(randomNumbers[1]), scale, 1 )
			-- cards[i] =  display.newImageRect("Images/" .. firstImageSet[randomNumbers[1]] .. ".png", 79*scale, 99*scale)
			cards[i].sound = randomNumbers[1]
		elseif (numOrGroup == "dots") then
			cards[i] =  display.newImageRect("Images/" .. fifthImageSet[randomNumbers[1]] .. ".png", 79*scale, 99*scale)
			cards[i].sound = randomNumbers[1]
		elseif (numOrGroup == "numbersDots") then
			cards[i] =  display.newImageRect("Images/" .. sixthImageSet[randomNumbers[1]] .. ".png", 79*scale, 99*scale)
			cards[i].sound = randomNumbers[1]
		else
			local randomSet
			if (numOrGroup == "groups") then
				randomSet = math.random(1,3)
			else
				randomSet = math.random(1,6)
			end
			if (randomSet == 1) then
				cards[i] =  display.newImageRect("Images/" .. fourthImageSet[randomNumbers[1]] .. ".png", 79*scale, 99*scale)
				cards[i].sound = fourthImageSet[randomNumbers[1]]
			elseif (randomSet == 2) then
				cards[i] =  display.newImageRect("Images/" .. secondImageSet[randomNumbers[1]] .. ".png", 79*scale, 99*scale)
				cards[i].sound = secondImageSet[randomNumbers[1]]
			elseif (randomSet == 3) then
				cards[i] =  display.newImageRect("Images/" .. thirdImageSet[randomNumbers[1]] .. ".png", 79*scale, 99*scale)
				cards[i].sound = thirdImageSet[randomNumbers[1]]
			elseif (numOrGroup == "both") then
				cards[i] = dynamicNumberCardSlots( tostring(randomNumbers[1]), scale, 1 )
				-- cards[i] =  display.newImageRect("Images/" .. firstImageSet[randomNumbers[1]] .. ".png", 79*scale, 99*scale)
				cards[i].sound = randomNumbers[1]
			end
		end
		
		
		cards[i].id = randomNumbers[1] -- Reference to the index of table
		--cards[i].x = i * (cards[i].width+spacing)
		if (question == "Which 2 numbers add up to") then
			cards[i].x = rowPositionWhichTwoNum[(5-row)+(i*2)-1]
		else
			cards[i].x = rowPosition[(5-row)+(i*2)-1]
		end
		if (numRows == 2) then
			cards[i].y = halfH
			-- equationGroup.y = halfH - 100
		else
			cards[i].y = halfH
			-- equationGroup.y = halfH - 100
		end
		cards[i].initY = cards[i].y
		cards[i].frame = 0
		cards[i].row = 1
		-- cards[i]:addEventListener( "touch", ComplexChoiceTap )
		cardGroup:insert(cards[i])
		
		if (cards[i].textGroup) then
			cardGroup:insert(cards[i].textGroup)
			cards[i].textGroup.anchorChildren = true
			cards[i].textGroup.anchorX, cards[i].textGroup.anchorY = 0.5, 0.5
			cards[i].textGroup.x, cards[i].textGroup.y = cards[i].x, cards[i].y
		
			cards[i].textGroup.x = cards[i].x
			cards[i].textGroup.y = cards[i].y
			
			dynamicNumberOffsets(i)
			
		end
		
		cards[i].xImage = display.newImageRect("Images/UI/cardX.png", 59, 50)
		cards[i].xImage.x = cards[i].x
		cards[i].xImage.y = cards[i].y
		cards[i].xImage.alpha = 0
		cardGroup:insert(cards[i].xImage)
		
		table.remove( randomNumbers, 1 )
		
	end
	
	
	-- if (version.appStore == "Amazon" and system.getInfo ( "model" ) == "AFTB" or version.appStore == "Amazon FTV") then
		-- Runtime:addEventListener( "onFTVKey", ComplexChoiceTap )
	-- end
	
	
	levelOptions = gameDetails["level" .. level]
	gameOptions = gameLevelDetails
	
	cardOptions = gameOptions.cards
	
	oldCardGroupX = cardGroup.x
	oldCardGroupY = cardGroup.y
	
	cardGroup.anchorChildren = true
	cardGroup.anchorX = 0.5
	cardGroup.anchorY = 0.5
	
	newCardGroupX = cardGroup.x
	newCardGroupY = cardGroup.y
	
	cardGroup.x = 1000

end



function ChoiceTap(event)

	local target = event.target
	local keyName = event.keyName
	
	if (target == nil) then
		target = targetCard
	end

	if event.keyName == nil and event.phase == "began" or
		event.phase == "began" and buttonsActive == true or
		(keyName and event.phase == "down" and buttonsActive) then
		
	
		if (event.keyName and event.keyName ~= "back" and 
												event.keyName ~= "left" and 
												event.keyName ~= "right" and
												event.keyName ~= "up" and
												event.keyName ~= "down" and 
												event.keyName ~= "buttonY" and
												event.keyName ~= "mediaPlayPause" and
												event.keyName ~= "buttonZ" and
												event.keyName ~= "buttonX" and
												keyName ~= "menu" or
												event.keyName == nil) then
												
	
			if (myData.isFireTV or myData.isController) then 
				transition.to( cursor, { time=100, alpha=0 } )
				buttonsActive = false
			end
			buttonsActive = false
		
			local newX, newY
			local possibleAnswer
			
			local choiceOneChosen = false
			local choiceTwoChosen = false
			local answerChosen = false
			
			-- local details = levelDetails["level" .. level]
			-- local detailsTwo
			-- if (details.cards) then
				-- detailsTwo = details.cards[currentWaypoint]
			-- end
			
			
			if (cardTrans) then
				transition.cancel( cardTrans )
				cardTrans = nil
			end
			cardGroup.x = cardGroup.targetX
			
			
			if savedData.enableSounds == true then
				playReservedChannel(flipSound, 14, 0)
			end
			
			if (numRows == 1) then
				-- newX = newCardGroupX - oldCardGroupX
				-- newY = detailsTwo.offsetY
				
				-- newEquationX = newEquationGroupX - oldEquationGroupX
				-- newEquationY = newEquationGroupY - oldEquationGroupY
			else
				-- if (target.row == 1) then
					-- newX = newCardGroupX - oldCardGroupX
					-- newY = newCardGroupY - oldCardGroupY + 35
				-- else
					-- newX = newCardGroupTwoX - oldCardGroupTwoX
					-- newY = newCardGroupTwoY - oldCardGroupTwoY + 35
				-- end
				
				-- newEquationX = newEquationGroupX - oldEquationGroupX
				-- newEquationY = equationGroup.y + 50
			end
			
			local done = false
			local fixCardsDone = false
			
			local function fixEquationCardPos()

				if (target.row == 1) then
				
					local pos = 7 - row
					local visibleCard
					for i = 1, totalRow do
						if (cards[i].y == cards[i].initY and cards[i].alpha == 1 or cards[i].id == floaters[1] or cards[i].id == floaters[2]) then
							
							
							if (cardSettingsSpacing) then
								
								transition.to( cards[i], { time=100 , x = newCardPositions[pos], transition=easing.outExpo } )
								if (cards[i].textGroup) then
									transition.to( cards[i].textGroup, { time=100 , x = newCardPositions[pos] + cards[i].textGroup.offsetX, transition=easing.outExpo } )
								end
								if (cards[i].shadow) then
									transition.to( cards[i].shadow, { time=100 , x = newCardPositions[pos] + shadowOffsetX, transition=easing.outExpo } )
								end
								transition.to( cards[i].xImage, { time=100 , x = newCardPositions[pos], transition=easing.outExpo } )
							else
							
								transition.to( cards[i], { time=100 , x = rowPosition[pos], transition=easing.outExpo } )
								if (cards[i].textGroup) then
									transition.to( cards[i].textGroup, { time=100 , x = rowPosition[pos] + cards[i].textGroup.offsetX, transition=easing.outExpo } )
								end
								if (cards[i].shadow) then
									transition.to( cards[i].shadow, { time=100 , x = rowPosition[pos] + shadowOffsetX, transition=easing.outExpo } )
								end
								transition.to( cards[i].xImage, { time=100 , x = rowPosition[pos], transition=easing.outExpo } )
							end
							
							pos = pos + 2
							
							visibleCard = i
							
							
						end
					end
					row = row - 1
					
					local function moveCards()
						for i = 1, #cards do
							if (cards[i].alpha == 0) then
								cards[i].x = cards[visibleCard].x
								if (cards[i].textGroup) then
									cards[i].textGroup.x = cards[visibleCard].x + cards[i].textGroup.offsetX
								end
								if (cards[i].shadow) then
									cards[i].shadow.x = cards[visibleCard].x + shadowOffsetX
								end
								if (cards[i].xImage) then
									cards[i].xImage.x = cards[visibleCard].x
								end
							end
						end
					end
					timer.performWithDelay( 105, moveCards )
				
					
					if (myData.isFireTV or myData.isController) then 
						timer.performWithDelay( 100, showCursor )
					end
				else
				
					local posTwo = 7 - rowTwo
					local visibleCard
					for i = totalRow+1, totalRowTwo+totalRow do
						if (cards[i].y == cards[i].initY and cards[i].alpha == 1 or cards[i].id == floaters[1]) then
							
							transition.to( cards[i], { time=100 , x = rowPosition[posTwo], transition=easing.outExpo } )
							if (cards[i].textGroup) then
								transition.to( cards[i].textGroup, { time=100 , x = rowPosition[posTwo] + cards[i].textGroup.offsetX, transition=easing.outExpo } )
							end
							if (cards[i].shadow) then
								transition.to( cards[i].shadow, { time=100 , x = rowPosition[posTwo] + shadowOffsetX, transition=easing.outExpo } )
							end
							transition.to( cards[i].xImage, { time=100 , x = rowPosition[posTwo], transition=easing.outExpo } )
							posTwo = posTwo + 2
							
							visibleCard = i
							
							
						end
					end
					rowTwo = rowTwo - 1
					
					local function moveCards()
						for i = 1, #cards do
							if (cards[i].alpha == 0) then
								cards[i].x = cards[visibleCard].x
								if (cards[i].textGroup) then
									cards[i].textGroup.x = cards[visibleCard].x + cards[i].textGroup.offsetX
								end
								if (cards[i].shadow) then
									cards[i].shadow.x = cards[visibleCard].x + shadowOffsetX
								end
								if (cards[i].xImage) then
									cards[i].xImage.x = cards[visibleCard].x
								end
							end
						end
					end
					timer.performWithDelay( 105, moveCards )
				
					
					if (myData.isFireTV or myData.isController) then 
						timer.performWithDelay( 100, showCursor )
					end
				end
				
				fixCardsDone = true

				timer.performWithDelay( 150, makeButtonsActive )
				
			end
			
			local blankX, blankY
			local function equationCardHop( object )
				local function equationCardHopTwo( obj )
					local function moveCardToSpot( obj )
						if (gameplayMode == 3) then
						
							if savedData.enableSounds == true then
								playReservedChannel(shortClapSound, 21, 0)
							end
						
							local newX, newY
							local newCardX, newCardY = obj:localToContent( 0, 0 )
						
							-- obj.x = blankX
							if (choiceOneChosen == true) then
								newX, newY = underlineOneImage:localToContent( 0, 0 )
								underlineOneImage.alpha = 0
							elseif (choiceTwoChosen == true) then
								newX, newY = underlineTwoImage:localToContent( 0, 0 )
								underlineTwoImage.alpha = 0
							elseif (answerChosen == true) then
								newX, newY = underlineThreeImage:localToContent( 0, 0 )
								underlineThreeImage.alpha = 0
							end
						
							--if (numRows == 1) then
								-- obj.y = equationGroup.y - detailsTwo.offsetY
								Particles:newEmitter(explosions,"fireworks", "Images/starParticle.png", 32, 32, 10, newX, newY, -4, 4, -16, 6, 252,234,27)--altRgb[1], altRgb[2], altRgb[3])
								obj.x = obj.x - (newCardX - newX)
								-- obj.y = obj.y - (newCardY - newY)
							-- else
								-- obj.y = newEquationY - detailsTwo.offsetY
								obj.y = gameOptions.grayBGY - cardOptions.offsetY
								-- Particles:newEmitter(explosions,"fireworks", "Images/starParticle.png", 32, 32, 10, blankX, gameOptions.grayBGY - cardOptions.offsetY, -4, 4, -16, 6, 252,234,27)--altRgb[1], altRgb[2], altRgb[3])
							-- end
							
							if (obj.textGroup) then
								obj.textGroup.x = obj.x + obj.textGroup.offsetX
								obj.textGroup.y = obj.y + obj.textGroup.offsetY
							end
							if (obj.shadow) then
								obj.shadow.x = obj.x + shadowOffsetX
								obj.shadow.y = obj.y + shadowOffsetY
							end
						
						elseif (gameplayMode == 5) then
							Particles:newEmitter(explosions,"fireworks", "Images/starParticle.png", 32, 32, 10, obj.x, obj.y, -4, 4, -16, 6, 252,234,27)--altRgb[1], altRgb[2], altRgb[3])
							obj.alpha = 0
							
							if (obj.textGroup) then
								obj.textGroup.alpha = 0
							end
							if (obj.shadow) then
								obj.shadow.alpha = 0
							end
						end
						
						if savedData.enableSounds == true then
							playReservedChannel(explodeSound, 15, 0)
						end
						
						if (done == false and fixCardsDone == false) then
							fixEquationCardPos()
						elseif (done == true) then
						
							if (myData.isController) then
								Runtime:removeEventListener( "key", ChoiceTap )
							elseif (myData.isFireTV) then
								Runtime:removeEventListener( "onFTVKey", ChoiceTap )
							end
						
							for i = 1, #cards do
								if (cards[i].y == cards[i].initY) then
									if (cards[i].textGroup) then
										transition.to( cards[i].textGroup, { time=150 , alpha = 0 } )
									end
									if (cards[i].shadow) then
										transition.to( cards[i].shadow, { time=150 , alpha = 0 } )
									end
									transition.to( cards[i], { time=150 , alpha = 0 } )
								end
							end
						end
						
					end
					if (obj.textGroup) then
						transition.to( obj.textGroup, { time=150 , y=obj.y + 25 + obj.textGroup.offsetY, transition=easing.inExpo } )
					end
					if (obj.shadow) then
						transition.to( obj.shadow, { time=150 , y=obj.y + 25 + shadowOffsetY, transition=easing.inExpo } )
					end
					transition.to( obj, { time=150 , y=obj.y + 25, transition=easing.inExpo, onComplete=moveCardToSpot } )
				end
				
				if (object.textGroup) then
					transition.to( object.textGroup, { time=150 , y=object.y - 20 + object.textGroup.offsetY, transition=easing.outExpo } )
				end
				if (object.shadow) then
					transition.to( object.shadow, { time=150 , y=object.y - 20 + shadowOffsetY, transition=easing.outExpo } )
				end
				transition.to( object, { time=150 , y=object.y - 20, transition=easing.outExpo, onComplete=equationCardHopTwo} )
				if (gameplayMode == 5) then
					for i = 1, #cards do
						for a = 1, #floaters do
							if (cards[i].id == floaters[a]) then
								Runtime:removeEventListener( "enterFrame", cardFloat)
								
								if (cards[i].textGroup) then
									transition.to( cards[i].textGroup, { time=150 , rotation = 0, y=cards[i].y - 20 + cards[i].textGroup.offsetY, transition=easing.outExpo } )
								end
								if (cards[i].shadow) then
									transition.to( cards[i].shadow, { time=150 , rotation = 0, y=cards[i].y - 20 + shadowOffsetY, transition=easing.outExpo } )
								end
								transition.to( cards[i], { time=150 , rotation = 0, y=cards[i].y - 20, transition=easing.outExpo, onComplete=equationCardHopTwo} )
							end
						end
					end
				end
				
				if savedData.enableSounds == true then
					playReservedChannel(cardHopSound, 16, 0)
				end
				
			end
			
			local function scalePop( obj )
			
				
				if (obj.shadow == nil) then
					obj.shadow = display.newImageRect("Images/cardShadow.png", 92*scaleCards, 110*scaleCards)
					obj.shadow.x = obj.x + shadowOffsetX
					obj.shadow.y = obj.y + shadowOffsetY
					obj.shadow.alpha = .75
					obj.shadow.rotation = obj.rotation
					cardGroup:insert( obj.shadow )
					
					obj.shadow:toFront()
					obj:toFront()
					if (obj.textGroup) then
						obj.textGroup:toFront()
					end
				end
			
				audio.stop( 11 )
				if (questionAudioTimer) then
					timer.cancel( questionAudioTimer )
					questionAudioTimer = nil
				end
				
				if savedData.enableSounds == true then
					for i = #cards, 1, -1 do
						if (target == cards[i]) then
							-- playReservedChannel(cards[i].sound, currentCardChannel, 0)
						
							if (cards[i].id == 0) then
								playReservedChannel( gameSounds["zero"], 29, 0 )
							elseif (cards[i].id <= 100) then
								playReservedChannel( gameNumSounds[cards[i].id], 29, 0 )
							else
								local function partFiveAudio()
									local numTemp
									if (cards[i].id < 110) then
										numTemp = tonumber( tostring(cards[i].id):sub(3, 3) )
									else
										numTemp = tonumber( tostring(cards[i].id):sub(2, 3) )
									end
									playReservedChannel(gameNumSounds[ numTemp ], 28, 0)
								end
							
								playReservedChannel(hundredSounds[ tonumber(tostring(cards[i].id):sub(1, 1)) ], 29, 0)
							
							
								if (questionAudioTimer) then
									timer.cancel( questionAudioTimer )
									questionAudioTimer = nil
								end
								questionAudioTimer = timer.performWithDelay( 900, partFiveAudio )
									
							end
						
						end
					end
				end
				currentCardChannel = currentCardChannel + 1
				if currentCardChannel > 19 then
					currentCardChannel = 18
				end
				
				if (gameplayMode == 5) then
					
					if (choiceOneComplete == true or
						numAnswers == 3 and choiceOneComplete == false and choiceTwoComplete == true) then
						
						if (numAnswers == 3 and choiceTwoComplete == true) then
							choiceTwoComplete = false
						end
						choiceOneComplete = false
						local function startCardFloat()
							floaters[#floaters+1] = target.id
							Runtime:removeEventListener( "enterFrame", cardFloat)
							Runtime:addEventListener( "enterFrame", cardFloat)
						end
						timer.performWithDelay( 100, startCardFloat )
						
						
						-- if (cards[target.id].shadow == nil) then
							-- cards[target.id].shadow = display.newImageRect("Images/cardShadow.png", 92*scaleCards, 110*scaleCards)
							-- cards[target.id].shadow.x = cards[target.id].x + shadowOffsetX
							-- cards[target.id].shadow.y = cards[target.id].y + shadowOffsetY
							-- cards[target.id].shadow.alpha = .75
							-- cards[target.id].shadow.rotation = cards[target.id].rotation
							-- cardGroup:insert( cards[target.id].shadow )
							
							-- cards[target.id].shadow:toFront()
							-- cards[target.id]:toFront()
							-- if (cards[target.id].textGroup) then
								-- cards[target.id].textGroup:toFront()
							-- end
						-- end
						
						if (obj.textGroup) then
							transition.to( obj.textGroup, { time=100 , xScale = 1.15, yScale = 1.15, transition=easing.outExpo } )
						end
						if (obj.shadow) then
							transition.to( obj.shadow, { time=100 , xScale = 1.15, yScale = 1.15, transition=easing.outExpo } )
						end
						transition.to( obj, { time=100 , xScale = 1.15, yScale = 1.15, transition=easing.outExpo } )
						
						if (myData.isFireTV or myData.isController) then 
							timer.performWithDelay( 150, showCursor )
						else
							timer.performWithDelay( 150, makeButtonsActive )
						end
					
					elseif (numAnswers == 2 and choiceOneComplete == false or
								numAnswers == 3 and choiceOneComplete == false and choiceTwoComplete == false) then
					
						for i = #cards, 1, -1 do
							cards[i]:removeEventListener( "touch", ChoiceTap )
						end
						
						if (obj.textGroup) then
							transition.to( obj.textGroup, { time=100 , xScale = 1.15, yScale = 1.15, transition=easing.outExpo } )
						end
						if (obj.shadow) then
							transition.to( obj.shadow, { time=100 , xScale = 1.15, yScale = 1.15, transition=easing.outExpo } )
						end
						transition.to( obj, { time=100 , xScale = 1.15, yScale = 1.15, onComplete = equationCardHop, transition=easing.outExpo } )
					end
				else
					obj:removeEventListener( "touch", ChoiceTap )
					
					if (obj.textGroup) then
						transition.to( obj.textGroup, { time=100 , xScale = 1.15, yScale = 1.15, transition=easing.outExpo } )
					end
					if (obj.shadow) then
						transition.to( obj.shadow, { time=100 , xScale = 1.15, yScale = 1.15, transition=easing.outExpo } )
					end
					transition.to( obj, { time=100 , xScale = 1.15, yScale = 1.15, onComplete = equationCardHop, transition=easing.outExpo } )
				end
				
			end
		
		
			if (numBlanks == 1) then
			
				if (choiceOne == "0") then
				
					if (equationSign == "+" and target.id + choiceTwo == answer or
						equationSign == "-" and target.id - choiceTwo == answer) then
						
						if (target.textGroup) then
							transition.to(target.textGroup, {time=100, xScale = 1.5, yScale = 1.5, transition=easing.inExpo} )
						end
						if (target.shadow) then
							transition.to(target.shadow, {time=100, xScale = 1.5, yScale = 1.5, transition=easing.inExpo} )
						end
						transition.to(target, {time=100, xScale = 1.5, yScale = 1.5, onComplete = scalePop, transition=easing.inExpo} )
						blankX, blankY = choiceOneText:localToContent( 0, 0 )
						timer.performWithDelay(timeToShowWin, equationWin)
						choiceOneChosen = true
						
						done = true
							
						choiceOne = target.id
						target:removeEventListener( "touch", ChoiceTap )
						
					else
					
						equationWrong( target )
						
						timer.performWithDelay( 500, fixEquationCardPos )
						target:removeEventListener( "touch", ChoiceTap )
						
						if savedData.enableSounds == true then
							for i = #cards, 1, -1 do
								if (target == cards[i]) then
									playReservedChannel(wrongSound, currentWrongChannel, 0)
								end
							end
						end
						currentWrongChannel = currentWrongChannel + 1
						if currentWrongChannel > 20 then
							currentWrongChannel = 19
						end
					end
					
				elseif (choiceTwo == "0") then
				
					if (equationSign == "+" and choiceOne + target.id == answer or
						equationSign == "-" and choiceOne - target.id == answer) then
						
						if (target.textGroup) then
							transition.to(target.textGroup, {time=100, xScale = 1.5, yScale = 1.5, transition=easing.inExpo} )
						end
						if (target.shadow) then
							transition.to(target.shadow, {time=100, xScale = 1.5, yScale = 1.5, transition=easing.inExpo} )
						end
						transition.to(target, {time=100, xScale = 1.5, yScale = 1.5, onComplete = scalePop, transition=easing.inExpo} )
						blankX, blankY = choiceTwoText:localToContent( 0, 0 )
						timer.performWithDelay(timeToShowWin, equationWin)
							
						choiceTwoChosen = true	
						choiceTwo = target.id
						target:removeEventListener( "touch", ChoiceTap )
						
						done = true
					else
						
						equationWrong( target )
						
						timer.performWithDelay( 500, fixEquationCardPos )
						target:removeEventListener( "touch", ChoiceTap )
						
						if savedData.enableSounds == true then
							for i = #cards, 1, -1 do
								if (target == cards[i]) then
									playReservedChannel(wrongSound, currentWrongChannel, 0)
								end
							end
						end
						currentWrongChannel = currentWrongChannel + 1
						if currentWrongChannel > 20 then
							currentWrongChannel = 19
						end
					end
				
				elseif (answer == "0") then
				
					if (equationSign == "+" and choiceOne + choiceTwo == target.id or
						equationSign == "-" and choiceOne - choiceTwo == target.id) then
						
						if (target.textGroup) then
							transition.to(target.textGroup, {time=100, xScale = 1.5, yScale = 1.5, transition=easing.inExpo} )
						end
						if (target.shadow) then
							transition.to(target.shadow, {time=100, xScale = 1.5, yScale = 1.5, transition=easing.inExpo} )
						end
						transition.to(target, {time=100, xScale = 1.5, yScale = 1.5, onComplete = scalePop, transition=easing.inExpo} )
						blankX, blankY = answerText:localToContent( 0, 0 )
						timer.performWithDelay(timeToShowWin, equationWin)
							
						answerChosen = true
						answer = target.id
						target:removeEventListener( "touch", ChoiceTap )
						
						done = true
					else
						
						equationWrong( target )
						
						timer.performWithDelay( 500, fixEquationCardPos )
						target:removeEventListener( "touch", ChoiceTap )
						
						if savedData.enableSounds == true then
							for i = #cards, 1, -1 do
								if (target == cards[i]) then
									playReservedChannel(wrongSound, currentWrongChannel, 0)
								end
							end
						end
						currentWrongChannel = currentWrongChannel + 1
						if currentWrongChannel > 20 then
							currentWrongChannel = 19
						end
					end
				
				end
			
			elseif (numBlanks == 2) then
			
			
				if (choiceOne == "0") then
					
					for i = 1, #cards do
					
						if (answerBlank == false and cards[i] ~= target and equationSign == "+" and target.id + cards[i].id == answer or
							choiceTwoBlank == false and cards[i] ~= target and equationSign == "+" and  target.id + choiceTwo == cards[i].id or
							answerBlank == false and cards[i] ~= target and equationSign == "-" and target.id - cards[i].id == answer or 
							choiceTwoBlank == false and cards[i] ~= target and equationSign == "-" and target.id - choiceTwo == cards[i].id) then
							
							if (gameplayMode == 3) then
								if (target.textGroup) then
									transition.to(target.textGroup, {time=100, xScale = 1.5, yScale = 1.5, transition=easing.inExpo} )
								end
								if (target.shadow) then
									transition.to(target.shadow, {time=100, xScale = 1.5, yScale = 1.5, transition=easing.inExpo} )
								end
								transition.to(target, {time=100, xScale = 1.5, yScale = 1.5, onComplete = scalePop, transition=easing.inExpo} )
										
							elseif (gameplayMode == 5) then
								if (target.textGroup) then
									transition.to(target.textGroup, {time=100, xScale = 1.5, yScale = 1.5, transition=easing.inExpo} )
								end
								if (target.shadow) then
									transition.to(target.shadow, {time=100, xScale = 1.5, yScale = 1.5, transition=easing.inExpo} )
								end
								transition.to(target, {time=100, xScale = 1.5, yScale = 1.5, onComplete = scalePop, transition=easing.inExpo} )
								choiceOneComplete = true
							end
							
							blankX, blankY = choiceOneText:localToContent( 0, 0 )
							choiceOneChosen = true
							choiceOne = target.id
							possibleAnswer = true
							target:removeEventListener( "touch", ChoiceTap )
							break
						elseif (answerBlank == false and cards[i] ~= target and equationSign == "+" and cards[i].id + target.id == answer or
							choiceTwoBlank == false and cards[i] ~= target and equationSign == "+" and  cards[i].id + choiceTwo == target.id or
							answerBlank == false and cards[i] ~= target and equationSign == "-" and cards[i].id - target.id == answer or 
							choiceTwoBlank == false and cards[i] ~= target and equationSign == "-" and cards[i].id - choiceTwo == target.id) then
							
							--startWiggle(target,700)
							possibleAnswer = true
							break
						end
					
					end
					
					if (possibleAnswer ~= true) then
						
						equationWrong( target )
						
						timer.performWithDelay( 500, fixEquationCardPos )
						target:removeEventListener( "touch", ChoiceTap )
						
						if savedData.enableSounds == true then
							for i = #cards, 1, -1 do
								if (target == cards[i]) then
									playReservedChannel(wrongSound, currentWrongChannel, 0)
								end
							end
						end
						currentWrongChannel = currentWrongChannel + 1
						if currentWrongChannel > 20 then
							currentWrongChannel = 19
						end
					end
					
				elseif (choiceTwo == "0") then
						
					for i = 1, #cards do
						if (answerBlank == false and equationSign == "+" and choiceOne + target.id == answer or
							choiceOneBlank == false and equationSign == "+" and choiceOne + target.id == cards[i].id or
							answerBlank == false and equationSign == "-" and choiceOne - target.id == answer or
							choiceOneBlank == false and equationSign == "-" and choiceOne - target.id == cards[i].id ) then
							
							if (target.textGroup) then
								transition.to(target.textGroup, {time=100, xScale = 1.5, yScale = 1.5, transition=easing.inExpo} )
							end
							if (target.shadow) then
								transition.to(target.shadow, {time=100, xScale = 1.5, yScale = 1.5, transition=easing.inExpo} )
							end
							transition.to(target, {time=100, xScale = 1.5, yScale = 1.5, onComplete = scalePop, transition=easing.inExpo} )
							blankX, blankY = choiceTwoText:localToContent( 0, 0 )
							if (answer~=0) then
								done = true
								timer.performWithDelay(timeToShowWin, equationWin)
							end
							choiceTwoChosen = true
							choiceTwo = target.id
							possibleAnswer = true
							target:removeEventListener( "touch", ChoiceTap )
							break
						elseif (answerBlank == false and equationSign == "+" and choiceOne + target.id == answer or
							choiceOneBlank == false and equationSign == "+" and choiceOne + cards[i].id == target.id or
							answerBlank == false and equationSign == "-" and choiceOne - target.id == answer or
							choiceOneBlank == false and equationSign == "-" and choiceOne - cards[i].id == target.id ) then
						
							--startWiggle(target,700)
							possibleAnswer = true
							break
						end
					end	
					
					if (possibleAnswer ~= true) then
						
						equationWrong( target )
						
						timer.performWithDelay( 500, fixEquationCardPos )
						target:removeEventListener( "touch", ChoiceTap )
						
						if savedData.enableSounds == true then
							for i = #cards, 1, -1 do
								if (target == cards[i]) then
									playReservedChannel(wrongSound, currentWrongChannel, 0)
								end
							end
						end
						currentWrongChannel = currentWrongChannel + 1
						if currentWrongChannel > 20 then
							currentWrongChannel = 19
						end
					end
					
				elseif (answer == "0") then
				
					if (equationSign == "+" and choiceOne + choiceTwo == target.id or
						equationSign == "-" and choiceOne - choiceTwo == target.id) then
					
						if (target.textGroup) then
							transition.to(target.textGroup, {time=100, xScale = 1.5, yScale = 1.5, transition=easing.inExpo} )
						end
						if (target.shadow) then
							transition.to(target.shadow, {time=100, xScale = 1.5, yScale = 1.5, transition=easing.inExpo} )
						end
						transition.to(target, {time=100, xScale = 1.5, yScale = 1.5, onComplete = scalePop, transition=easing.inExpo} )
						blankX, blankY = answerText:localToContent( 0, 0 )
						timer.performWithDelay(timeToShowWin, equationWin)
						answerChosen = true
						answer = target.id
						target:removeEventListener( "touch", ChoiceTap )
						
						done = true
					else
						
						equationWrong( target )
						
						timer.performWithDelay( 500, fixEquationCardPos )
						target:removeEventListener( "touch", ChoiceTap )
						
						if savedData.enableSounds == true then
							for i = #cards, 1, -1 do
								if (target == cards[i]) then
									playReservedChannel(wrongSound, currentWrongChannel, 0)
								end
							end
						end
						currentWrongChannel = currentWrongChannel + 1
						if currentWrongChannel > 20 then
							currentWrongChannel = 19
						end
					end
				end
			
			elseif (numBlanks == 3) then
				
				print("test")
				print(gameplayMode)
				print(choiceOne)
				print(choiceTwo)
				print(choiceThree)
				print(answer)
				
				if (choiceOne == "0") then
					
					print("Test 2")
					
					for i = 1, #cards do
					
						for k = 1, #cards do
						
							if (gameplayMode == 3 and i ~= k and cards[i] ~= target and cards[k] ~= target and equationSign == "+" and target.id + cards[i].id == cards[k].id or
								gameplayMode == 3 and i ~= k and cards[i] ~= target and cards[k] ~= target and equationSign == "+" and target.id + cards[k].id == cards[i].id or
								gameplayMode == 3 and i ~= k and cards[i] ~= target and cards[k] ~= target and equationSign == "-" and target.id - cards[i].id == cards[k].id or
								gameplayMode == 3 and i ~= k and cards[i] ~= target and cards[k] ~= target and equationSign == "-" and target.id - cards[k].id == cards[i].id or
								gameplayMode == 5 and i ~= k and cards[i] ~= target and cards[k] ~= target and equationSign == "+" and target.id + cards[i].id + cards[k].id == answer and choiceOneComplete == false) then
							
							
								if (gameplayMode == 3) then
									transition.to(target, {time=100, xScale = 1.5, yScale = 1.5, onComplete = scalePop, transition=easing.inExpo} )
									if (target.textGroup) then
										transition.to(target.textGroup, {time=100, xScale = 1.5, yScale = 1.5, transition=easing.inExpo} )
									end
											
								elseif (gameplayMode == 5) then
								
									transition.to(target, {time=100, xScale = 1.5, yScale = 1.5, onComplete = scalePop, transition=easing.inExpo} )
									if (target.textGroup) then
										transition.to(target.textGroup, {time=100, xScale = 1.5, yScale = 1.5, transition=easing.inExpo} )
									end
									
									print("choiceOneComplete")
									
									choiceOneComplete = true
								end
							
								-- if (target.textGroup) then
									-- transition.to(target.textGroup, {time=100, xScale = 1.5, yScale = 1.5, transition=easing.inExpo} )
								-- end
								if (target.shadow) then
									transition.to(target.shadow, {time=100, xScale = 1.5, yScale = 1.5, transition=easing.inExpo} )
								end
								-- transition.to(target, {time=100, xScale = 1.5, yScale = 1.5, onComplete = scalePop, transition=easing.inExpo} )
								blankX, blankY = choiceOneText:localToContent( 0, 0 )
								choiceOneChosen = true
								choiceOne = target.id
								possibleAnswer = true
								target:removeEventListener( "touch", ChoiceTap )
								
								print("breaking")
								break
							elseif (gameplayMode == 3 and i ~= k and cards[i] ~= target and cards[k] ~= target and equationSign == "+" and cards[i].id + target.id == cards[k].id or
								gameplayMode == 3 and i ~= k and cards[i] ~= target and cards[k] ~= target and equationSign == "+" and cards[k].id + target.id == cards[i].id or
								gameplayMode == 3 and i ~= k and cards[i] ~= target and cards[k] ~= target and equationSign == "-" and cards[i].id - target.id == cards[k].id or
								gameplayMode == 3 and i ~= k and cards[i] ~= target and cards[k] ~= target and equationSign == "-" and cards[k].id - target.id == cards[i].id or
								gameplayMode == 3 and i ~= k and cards[i] ~= target and cards[k] ~= target and equationSign == "+" and cards[k].id + cards[i].id == target.id or
								gameplayMode == 3 and i ~= k and cards[i] ~= target and cards[k] ~= target and equationSign == "+" and cards[i].id + cards[k].id == target.id or
								gameplayMode == 3 and i ~= k and cards[i] ~= target and cards[k] ~= target and equationSign == "-" and cards[k].id - cards[i].id == target.id or
								gameplayMode == 3 and i ~= k and cards[i] ~= target and cards[k] ~= target and equationSign == "-" and cards[i].id - cards[k].id == target.id) then
								
								print("other")
								
								--startWiggle(target,700)
								possibleAnswer = true
								break
							end
							
						end
						
					end
					
					print("is possible answer")
					
					if (possibleAnswer ~= true) then
						
						print("Test 3")
						
						equationWrong( target )
						
						timer.performWithDelay( 500, fixEquationCardPos )
						target:removeEventListener( "touch", ChoiceTap )
						
						if savedData.enableSounds == true then
							for i = #cards, 1, -1 do
								if (target == cards[i]) then
									playReservedChannel(wrongSound, currentWrongChannel, 0)
								end
							end
						end
						currentWrongChannel = currentWrongChannel + 1
						if currentWrongChannel > 20 then
							currentWrongChannel = 19
						end
					end
					
				elseif (choiceTwo == "0") then
				
					print("Test 10")
				
					for i = 1, #cards do
						if (gameplayMode == 3 and cards[i] ~= target and equationSign == "+" and choiceOne + target.id == cards[i].id or
							gameplayMode == 3 and cards[i] ~= target and equationSign == "-" and choiceOne - target.id == cards[i].id or
							gameplayMode == 5 and cards[i].id ~= choiceOne and cards[i] ~= target and equationSign == "+" and choiceOne + target.id + cards[i].id == answer) then
						
							if (gameplayMode == 3) then
								transition.to(target, {time=100, xScale = 1.5, yScale = 1.5, onComplete = scalePop, transition=easing.inExpo} )
								if (target.textGroup) then
									transition.to(target.textGroup, {time=100, xScale = 1.5, yScale = 1.5, transition=easing.inExpo} )
								end
										
							elseif (gameplayMode == 5) then
								transition.to(target, {time=100, xScale = 1.5, yScale = 1.5, onComplete = scalePop, transition=easing.inExpo} )
								if (target.textGroup) then
									transition.to(target.textGroup, {time=100, xScale = 1.5, yScale = 1.5, transition=easing.inExpo} )
								end
								
								print("choiceTwoComplete")
								
								choiceTwoComplete = true
							end
							
							
							-- if (target.textGroup) then
								-- transition.to(target.textGroup, {time=100, xScale = 1.5, yScale = 1.5, transition=easing.inExpo} )
							-- end
							if (target.shadow) then
								transition.to(target.shadow, {time=100, xScale = 1.5, yScale = 1.5, transition=easing.inExpo} )
							end
							-- transition.to(target, {time=100, xScale = 1.5, yScale = 1.5, onComplete = scalePop, transition=easing.inExpo} )
							blankX, blankY = choiceTwoText:localToContent( 0, 0 )
							choiceTwoChosen = true
							choiceTwo = target.id
							possibleAnswer = true
							target:removeEventListener( "touch", ChoiceTap )
							break
						elseif (gameplayMode == 3 and cards[i] ~= target and equationSign == "+" and choiceOne + cards[i].id == target.id or
									gameplayMode == 3 and cards[i] ~= target and equationSign == "-" and choiceOne - cards[i].id == target.id) then
						
							--startWiggle(target,700)
							possibleAnswer = true
							break
						end
						
					end
					
					if (possibleAnswer ~= true) then
						
						equationWrong( target )
						
						timer.performWithDelay( 500, fixEquationCardPos )
						target:removeEventListener( "touch", ChoiceTap )
						
						if savedData.enableSounds == true then
							for i = #cards, 1, -1 do
								if (target == cards[i]) then
									playReservedChannel(wrongSound, currentWrongChannel, 0)
								end
							end
						end
						currentWrongChannel = currentWrongChannel + 1
						if currentWrongChannel > 20 then
							currentWrongChannel = 19
						end
					end
				
				
				elseif (gameplayMode == 5 and choiceThree == "0") then
				
					print("Test 11")
					
					for i = 1, #cards do
						if (equationSign == "+" and choiceOne + choiceTwo + target.id == answer) then
							
						
							transition.to(target, {time=100, xScale = 1.5, yScale = 1.5, onComplete = scalePop, transition=easing.inExpo} )
							if (target.textGroup) then
								transition.to(target.textGroup, {time=100, xScale = 1.5, yScale = 1.5, transition=easing.inExpo} )
							end
							
							timer.performWithDelay(timeToShowWin, equationWin)
							choiceThreeChosen = true
							choiceThree = target.id
							target:removeEventListener( "touch", ChoiceTap )
							possibleAnswer = true
							done = true
							break
						else
						
							equationWrong( target )
							
							timer.performWithDelay( 500, fixEquationCardPos )
							target:removeEventListener( "touch", ChoiceTap )
							
							if savedData.enableSounds == true then
								for i = #cards, 1, -1 do
									if (target == cards[i]) then
										playReservedChannel(wrongSound, currentWrongChannel, 0)
									end
								end
							end
							currentWrongChannel = currentWrongChannel + 1
							if currentWrongChannel > 20 then
								currentWrongChannel = 19
							end
						
							break
						end
						
					end
					
				
				elseif (answer == "0") then
				
					if (gameplayMode == 3 and equationSign == "+" and choiceOne + choiceTwo == target.id or
						gameplayMode == 3 and equationSign == "-" and choiceOne - choiceTwo == target.id or
						gameplayMode == 5 and equationSign == "+" and choiceOne + choiceTwo + target.id == answer) then
					
						if (target.textGroup) then
							transition.to(target.textGroup, {time=100, xScale = 1.5, yScale = 1.5, transition=easing.inExpo} )
						end
						if (target.shadow) then
							transition.to(target.shadow, {time=100, xScale = 1.5, yScale = 1.5, transition=easing.inExpo} )
						end
						transition.to(target, {time=100, xScale = 1.5, yScale = 1.5, onComplete = scalePop, transition=easing.inExpo} )
						blankX, blankY = answerText:localToContent( 0, 0 )
						timer.performWithDelay(timeToShowWin, equationWin)
						answerChosen = true
						answer = target.id
						target:removeEventListener( "touch", ChoiceTap )
						
						done = true
					else
						
						equationWrong( target )
						
						timer.performWithDelay( 500, fixEquationCardPos )
						target:removeEventListener( "touch", ChoiceTap )
						
						if savedData.enableSounds == true then
							for i = #cards, 1, -1 do
								if (target == cards[i]) then
									playReservedChannel(wrongSound, currentWrongChannel, 0)
								end
							end
						end
						currentWrongChannel = currentWrongChannel + 1
						if currentWrongChannel > 20 then
							currentWrongChannel = 19
						end
					end
				
				end
				
			end
			
			
		
		end
	
	end
	
end

function decideEquation()

	local levelOptions = gameDetails["level" .. level]
	local gameOptions = gameLevelDetails
	local equationOptions = gameOptions.equation
	local detailsBG = gameOptions.grayBGY
	local cardOptions = gameOptions.cards

	howManyBackground = display.newImageRect("Images/UI/messageBG.png", 1000, 110 )
	howManyBackground.x = -1000
	howManyBackground.y = detailsBG
	equationGroup:toFront()
	
	signText.text = equationSign
	
	-- Chooses random numbers for each place in equation and 
	-- checks to see if equation will work with those numbers
	
	if (cardOptions.endRange <= 5 and gameplayMode == 3) then
	
		
		if (equationSign == "+") then
		
			if (cardOptions.endRange == 5) then
				choiceOne = additionEquations5[equationAddition5][1]
				choiceTwo = additionEquations5[equationAddition5][2]
				answer = choiceOne + choiceTwo
				
				equationAddition5 = equationAddition5 + 1
				
				if (equationAddition5 > #additionEquations5) then
					equationAddition5 = 1
				end
			else
				choiceOne = additionEquations3[equationAddition3][1]
				choiceTwo = additionEquations3[equationAddition3][2]
				answer = choiceOne + choiceTwo
				
				equationAddition3 = equationAddition3 + 1
				
				if (equationAddition3 > #additionEquations3) then
					equationAddition3 = 1
				end
			end
			
		else
			
			if (cardOptions.endRange == 5) then
				choiceOne = subtractionEquations5[equationSubtraction5][1]
				choiceTwo = subtractionEquations5[equationSubtraction5][2]
				answer = choiceOne - choiceTwo
				
				equationSubtraction5 = equationSubtraction5 + 1
				
				if (equationSubtraction5 > #subtractionEquations5) then
					equationSubtraction5 = 1
				end
			else
				choiceOne = subtractionEquations3[equationSubtraction3][1]
				choiceTwo = subtractionEquations3[equationSubtraction3][2]
				answer = choiceOne - choiceTwo
				
				equationSubtraction3 = equationSubtraction3 + 1
				
				if (equationSubtraction3 > #subtractionEquations3) then
					equationSubtraction3 = 1
				end
			end
			
		end
		
		choiceOneText.text = choiceOne
		choiceTwoText.text = choiceTwo
	
	
	else
	
		if (equationSign == "+") then
		
			
			if (answerBlank == false) then
			
				--answer = math.random( 3, 10)
				if (numBlanks == 1) then
					repeat
						
						if (startRange < 3) then
							answer = math.random( 3, endRange)
						else
							answer = math.random( startRange, endRange)
						end
					until prevEquationAddGame ~= answer
					prevEquationAddGame = answer
				elseif (numBlanks == 2 and gameplayMode == 3) then
					repeat
						if (startRange < 3) then
							answer = math.random( 3, endRange)
						else
							answer = math.random( startRange, endRange)
						end
					until prevEquationAddGame ~= answer
					prevEquationAddGame = answer
					
				end
				answerText.text = answer
			end
			if (choiceOneBlank == false) then
				if (answerBlank == false) then
					-- repeat choiceOne = math.random(1,answer-1)
					-- until choiceOne ~= answer
					
					
					local randomOne = math.random( 1, 100 )
					repeat 
						if (answer > 4) then
							if (randomOne == 1) then
								choiceOne = math.random( 1, answer-1)
							else
								choiceOne = math.random( 2, answer-2)
							end
						else
							choiceOne = math.random( 1, answer-1)
						end
					until answer - choiceOne > 0
					
				else
					--choiceOne = math.random(1,9)
					
					print("1 " .. answer)
					
					local randomOne = math.random( 1, 100 )
					repeat 
					
						if (answer and answer ~= "0" and answer ~= 0) then
							if (randomOne == 1 or answer < 5) then
								choiceOne = math.random( 1, answer-1)
							else
								choiceOne = math.random( 2, answer-2)
							end
						else
							if (randomOne == 1) then
								choiceOne = math.random( 1, endRange-1)
							else
								choiceOne = math.random( 2, endRange-2)
							end
						end
					until prevEquationAddGame ~= choiceOne or 
							answer and answer ~= "0" and answer > 0 and answer < 5 and answer / 2 ~= choiceOne or 
							answer and answer ~= "0" and answer > 0 and answer >= 5 and answer / 2 ~= choiceOne
					
				end
				choiceOneText.text = choiceOne
				
			end
			if (choiceTwoBlank == false) then
				if (answerBlank == false) then
					-- repeat choiceTwo = math.random(1,answer-1)
					-- until choiceTwo ~= answer
					
					
					local randomOne = math.random( 1, 100 )
					repeat 
						if (answer > 4) then
							if (randomOne == 1) then
								choiceTwo = math.random( 1, answer-1)
							else
								choiceTwo = math.random( 2, answer-2)
							end
						else
							choiceTwo = math.random( 1, answer-1)
						end
					until answer - choiceTwo > 0 and answer > choiceTwo
					
				elseif (choiceOneBlank == false) then
					-- repeat choiceTwo = math.random(1,9)
					-- until choiceTwo + choiceOne < 11
					
					print("2 " .. answer)
					
					local randomOne = math.random( 1, 100 )
					repeat 
					
						if (choiceOne < endRange - 2) then
							if (randomOne == 1 or answer and answer ~= "0" and answer > 0 and answer < 5) then
								choiceTwo = math.random( 1, endRange-1)
							else
								choiceTwo = math.random( 2, endRange-2)
							end
						else
							choiceTwo = math.random( 1, endRange-1)
						end
					until choiceOne ~= choiceTwo and choiceTwo + choiceOne <= endRange or
							answer and answer ~= "0" and answer > 0 and choiceOne ~= choiceTwo and choiceTwo + choiceOne == answer
				
				
				else
					--choiceTwo = math.random(1,9)
					
					
					local randomOne = math.random( 1, 100 )
					repeat 
						if (randomOne == 1) then
							choiceTwo = math.random( 1, endRange-1)
						else
							choiceTwo = math.random( 2, endRange-2)
						end
					until prevEquationAddGame ~= choiceTwo
					
					
				end
				choiceTwoText.text = choiceTwo
			end
			
		elseif (equationSign == "-") then
		
			
			if (choiceOneBlank == false) then
				if (numBlanks == 1) then
					
					repeat
						if (startRange < 3) then
							choiceOne = math.random(3,endRange)
						else
							choiceOne = math.random(startRange,endRange)
						end
					until prevEquationSubGame ~= choiceOne
					prevEquationSubGame = choiceOne
				elseif (numBlanks == 2) then
					repeat
						if (startRange < 3) then
							choiceOne = math.random(3,endRange)
						else
							choiceOne = math.random(startRange,endRange)
						end
					until prevEquationSubGame ~= choiceOne
					prevEquationSubGame = choiceOne
				end
				choiceOneText.text = choiceOne
			end
			if (answerBlank == false) then
				if (choiceOneBlank == false) then
					--repeat answer = math.random(1,choiceOne-1)
					--until answer ~= choiceOne
					
					local randomOne = math.random( 1, 100 )
					repeat 
						if (choiceOne > 4) then
							if (randomOne == 1) then
								answer = math.random( 1, choiceOne-1)
							else
								answer = math.random( 2, choiceOne-2)
							end
						else
							answer = math.random( 1, choiceOne-1)
						end
					until choiceOne - answer > 0
					
				else
					--answer = math.random(1,9)
					
					local randomOne = math.random( 1, 100 )
					repeat 
						if (randomOne == 1) then
							answer = math.random( 1, endRange-1)
						else
							answer = math.random( 2, endRange-2)
						end
					until prevEquationSubGame ~= answer
					
				end
				answerText.text = answer
				
				
			end
			if (choiceTwoBlank == false) then
				if (choiceOneBlank == false) then
					-- repeat choiceTwo = math.random( 1, choiceOne-1)
					-- until choiceTwo ~= choiceOne
					local randomOne = math.random( 1, 100 )
					repeat 
						if (choiceOne > 4) then
							if (randomOne == 1) then
								choiceTwo = math.random( 1, choiceOne-1)
							else
								choiceTwo = math.random( 2, choiceOne-2)
							end
						else
							choiceTwo = math.random( 1, choiceOne-1)
						end
					until choiceTwo ~= choiceOne and choiceOne - choiceTwo > 0 and choiceOne > choiceTwo
				elseif (answerBlank == false) then
				
					-- repeat choiceTwo = math.random( 1, 9)
					-- until answer + choiceTwo < 11
					
					local randomOne = math.random( 1, 100 )
					repeat 
						if (endRange - choiceOne > 1) then
							if (randomOne == 1) then
								choiceTwo = math.random( 1, choiceOne-1)
							else
								choiceTwo = math.random( 2, choiceOne-2)
							end
						else
							choiceTwo = math.random( 1, choiceOne-1)
						end
					until answer + choiceTwo <= endRange
					
				else
					--choiceTwo = math.random( 1, 9)
					
					local randomOne = math.random( 1, 100 )
					repeat 
						if (randomOne == 1) then
							choiceTwo = math.random( 1, choiceOne-1)
						else
							choiceTwo = math.random( 2, choiceOne-2)
						end
					until prevEquationSubGame ~= choiceTwo
					
				end
				choiceTwoText.text = choiceTwo
				
			end

		end
	
	end
	
	
	if (choiceOneBlank == true) then
		choiceOneText.alpha = 0
		underlineOneImage.alpha = 1
	else
		choiceOneText.alpha = 1
		underlineOneImage.alpha = 0
	end
	if (choiceTwoBlank == true) then
		choiceTwoText.alpha = 0
		underlineTwoImage.alpha = 1
	else
		choiceTwoText.alpha = 1
		underlineTwoImage.alpha = 0
	end
	if (answerBlank == true) then
		answerText.alpha = 0
		underlineThreeImage.alpha = 1
	else
		answerText.alpha = 1
		underlineThreeImage.alpha = 0
	end
	
	--equationGroup.x = 900
	
	--equationGroup:setReferencePoint ( display.CenterReferencePoint ) -- commented out for graphics 2.0 and replaced with:
       equationGroup.xScale, equationGroup.yScale = gameOptions.equation.scale, gameOptions.equation.scale
		equationGroup.anchorChildren = true
		equationGroup.anchorX = 0.5
        equationGroup.anchorY = 0.5
	
	--tempCardGroup.x = halfW
	
	if (numOrGroup == "numbersDots") then
		equationGroup.y = gameOptions.grayBGY + equationOptions.offsetY
		underlineOneImage.y = answerText.y
		underlineTwoImage.y = answerText.y
		underlineThreeImage.y = answerText.y - 15
		
		equationGroup.y = gameOptions.grayBGY + 15
		
		if system.getInfo( "platformName" ) == "Android" then
			if (equationOptions.scale == 0.85) then
				underlineOneImage.y = answerText.y + 151
				underlineTwoImage.y = answerText.y + 151
				underlineThreeImage.y = answerText.y + 157
				
				equationGroup.y = gameOptions.grayBGY + equationOptions.offsetY + 49
			else
				underlineOneImage.y = answerText.y + 151
				underlineTwoImage.y = answerText.y + 151
				underlineThreeImage.y = answerText.y + 157
				
				equationGroup.y = gameOptions.grayBGY + equationOptions.offsetY + 30
			end
		else
		
			
		end
	else
		equationGroup.y = gameOptions.grayBGY + equationOptions.offsetY
		underlineOneImage.y = answerText.y - 5
		underlineTwoImage.y = answerText.y - 5
		underlineThreeImage.y = answerText.y - 5
		
		if system.getInfo( "platformName" ) == "Android" then
			if (equationOptions.scale == 0.85) then
				underlineOneImage.y = answerText.y + 165
				underlineTwoImage.y = answerText.y + 165
				underlineThreeImage.y = answerText.y + 165
				
				equationGroup.y = gameOptions.grayBGY + equationOptions.offsetY + 47
			else
				underlineOneImage.y = answerText.y + 165
				underlineTwoImage.y = answerText.y + 165
				underlineThreeImage.y = answerText.y + 165
				
				equationGroup.y = gameOptions.grayBGY + equationOptions.offsetY + 23
			end
		end
	end

	newEquationGroupX = equationGroup.x
	newEquationGroupY = equationGroup.y
	
	transition.to( howManyBackground, { time=700, x=halfW, transition=easing.outExpo } )
	
	-- print("Equation setup")
	
end

function decideChoices()

	local levelOptions = gameDetails["level" .. level]
	
	local gameOptions = gameLevelDetails
	local equationOptions = gameOptions.equation
	local detailsBG = gameOptions.grayBGY
	local cardOptions = gameOptions.cards
	local answerRange = cardOptions.answerRange

	local possibleSolutions = 0
	
	randomNumbers = {}
	local randomNumber
	
	print(choiceOne)
	print(choiceTwo)
	print(answer)
	
	if (cardOptions.endRange <= 5 and gameplayMode == 3) then
	
		
		for i = #randomNumbers, 1, -1 do
			randomNumbers[i] = nil
		end
	
		randomNumbers[#randomNumbers+1] = answer
	
	
		for i = 1, numChoices-1 do
			
			repeat 
				local repeated = false
				
				if (randomNumbers[1] == 0 and answerRange == 1) then
					randomNumber = math.random(0, randomNumbers[1] + 2)
				else
					randomNumber = math.random(randomNumbers[1] - answerRange, randomNumbers[1] + answerRange)
				
				end
				
				for i = 1, #randomNumbers do
					if (randomNumbers[i] == randomNumber) then
						repeated = true
					end
				end
				
			until repeated == false and randomNumber > -1
		
			randomNumbers[#randomNumbers+1] = randomNumber
		end
		
		answer = "0"
		
	else
	
	
		repeat
		
			for i = #randomNumbers, 1, -1 do
				randomNumbers[i] = nil
			end
			possibleSolutions = 0
			
			for i = 1, numChoices do
				local repeated
				repeat 
					repeated = false
					--randomNumber = math.random(1, 10)
					-- local randomOne = math.random(1, 10)
					-- if (randomOne == 1) then
						-- randomNumber = 1
					-- else
					if (gameplayMode == 5) then
						local randomChooseOne = math.random( 1, 5 )
						if (numAnswers == 2) then
						
							if (answer > 4 and randomChooseOne == 1) then
								randomNumber = math.random( 2, endRange-1)
							else
								randomNumber = math.random(1, endRange)
							end
							
							if (answer >= 8 and randomNumber < math.floor(answer/2.8) or randomNumber >= answer and randomNumber >= 6) then
								repeated = true
							end
						
						else
							
							-- if (answer > 6 and randomChooseOne == 1) then
								-- randomNumber = math.random( 2, answer-2)
							if (questionTwo == 23 or questionTwo == 32) then
								randomNumber = math.random( 2, answer-1)
							elseif (questionTwo == 24 or questionTwo == 25) then
								randomNumber = math.random( 3, answer-1)
							else
								randomNumber = math.random(1, answer-1)
							end
							
							
							
							if (answer >= 7 and randomNumber < math.floor(answer/5) and
								questionTwo ~= 21 and questionTwo ~= 22 and questionTwo ~= 23 and questionTwo ~= 24 and questionTwo ~= 25 and questionTwo ~= 31 and questionTwo ~= 32) then
								
								repeated = true
							end
						
						end
						
					else
						randomNumber = math.random(1, endRange)
					end
					-- end
					
					for i = 1, #randomNumbers do
						if (randomNumbers[i] == randomNumber) then
							repeated = true
						end
					end
					
				until repeated == false
				randomNumbers[#randomNumbers+1] = randomNumber
			end
			
			
			for i = 1, #randomNumbers do
				for j = 1, #randomNumbers do
					
					if (equationSign == "+") then
						-- Make sure each possible equation has a solution
						
						if (gameplayMode == 5 and numAnswers == 3) then
						
							-- local oneChosen = math.random( 1, 100 )
						
							for k = 1, #randomNumbers do
							
									if (randomNumbers[i] + randomNumbers[j] + randomNumbers[k] == answer and i ~= j and j ~= k and i ~= k) then
										
										
										if ( (randomNumbers[i] - (math.floor(randomNumbers[i]/10)*10) ) + (randomNumbers[j] - (math.floor(randomNumbers[j]/10)*10) ) + (randomNumbers[k] - (math.floor(randomNumbers[k]/10)*10) ) < 10 or
											answer % 10 == 0 and (randomNumbers[i] - (math.floor(randomNumbers[i]/10)*10) ) + (randomNumbers[j] - (math.floor(randomNumbers[j]/10)*10) ) + (randomNumbers[k] - (math.floor(randomNumbers[k]/10)*10) ) <= 10 or
											answer <= 16) then
										
											-- if (oneChosen ~= 1 and randomNumbers[i] == 1 or
												-- oneChosen ~= 1 and randomNumbers[j] == 1 or
												-- oneChosen ~= 1 and randomNumbers[k] == 1) then
											-- else
												possibleSolutions = possibleSolutions + 1
											-- end
										
										end
										
									end
							
							end
						
						else
						
							if (numBlanks == 1 and choiceOneBlank == true and randomNumbers[i] + choiceTwo == answer ) then
								possibleSolutions = possibleSolutions + 1
							elseif ( numBlanks == 1 and choiceTwoBlank == true and choiceOne + randomNumbers[i] == answer ) then
								possibleSolutions = possibleSolutions + 1
							elseif ( numBlanks == 1 and answerBlank == true and choiceOne + choiceTwo == randomNumbers[i] ) then
								possibleSolutions = possibleSolutions + 1
							elseif ( numBlanks == 2 and answerBlank == false and randomNumbers[i] + randomNumbers[j] == answer and i ~= j ) then
								possibleSolutions = possibleSolutions + 1
							elseif ( numBlanks == 2 and choiceOneBlank == false and choiceOne + randomNumbers[i] == randomNumbers[j] and i ~= j ) then
								possibleSolutions = possibleSolutions + 1
							elseif ( numBlanks == 2 and choiceTwoBlank == false and randomNumbers[i] + choiceTwo == randomNumbers[j] and i ~= j ) then
								possibleSolutions = possibleSolutions + 1
							elseif ( numBlanks == 3 ) then
								for k = 1, #randomNumbers do
							
									if ( randomNumbers[i] + randomNumbers[j] == randomNumbers[k] and i ~= j and j ~= k ) then
										possibleSolutions = possibleSolutions + 1
										
									end
							
								end
							end
						
						end
						
					elseif (equationSign == "-") then
					
						if ( numBlanks == 1 and choiceOneBlank == true and randomNumbers[i] - choiceTwo == answer ) then
							possibleSolutions = possibleSolutions + 1
						elseif ( numBlanks == 1 and choiceTwoBlank == true and choiceOne - randomNumbers[i] == answer ) then
							possibleSolutions = possibleSolutions + 1
						elseif ( numBlanks == 1 and answerBlank == true and choiceOne - choiceTwo == randomNumbers[i] ) then
							possibleSolutions = possibleSolutions + 1
						elseif ( numBlanks == 2 and answerBlank == false and randomNumbers[i] - randomNumbers[j] == answer and i ~= j ) then
							possibleSolutions = possibleSolutions + 1
						elseif ( numBlanks == 2 and choiceOneBlank == false and choiceOne - randomNumbers[i] == randomNumbers[j] and i ~= j ) then
							possibleSolutions = possibleSolutions + 1
						elseif ( numBlanks == 2 and choiceTwoBlank == false and randomNumbers[i] - choiceTwo == randomNumbers[j] and i ~= j ) then
							possibleSolutions = possibleSolutions + 1
						elseif ( numBlanks == 3 ) then
							for k = 1, #randomNumbers do
						
								if ( randomNumbers[i] - randomNumbers[j] == randomNumbers[k] and i ~= j and j ~= k ) then
									possibleSolutions = possibleSolutions + 1
									
								end
						
							end
						end
						
						
					end
				
				end
			end
		
		until possibleSolutions > 0
		print("Possible solutions: " .. possibleSolutions)
	
	end
	
	
	if (numBlanks == 1 and cardOptions.endRange > 5) then
	
		print("test")
	
		local answerFound
		for i = 1, #randomNumbers do
		
			if (equationSign == "+") then
				if (choiceOneBlank == true) then
					if (randomNumbers[i] + choiceTwo == answer) then
						answerFound = i
					end
				elseif (choiceTwoBlank == true) then
					if (choiceOne + randomNumbers[i] == answer) then
						answerFound = i
					end
				elseif (answerBlank == true) then
					if (choiceOne + choiceTwo == randomNumbers[i]) then
						answerFound = i
					end
				end
			else
				if (choiceOneBlank == true) then
					if (randomNumbers[i] - choiceTwo == answer) then
						answerFound = i
					end
				elseif (choiceTwoBlank == true) then
					if (choiceOne - randomNumbers[i] == answer) then
						answerFound = i
					end
				elseif (answerBlank == true) then
					if (choiceOne - choiceTwo == randomNumbers[i]) then
						answerFound = i
					end
				end
			end
		
		end
	
	
		randomNumbers[1] = randomNumbers[answerFound]
		for i = 2, numChoices do
			randomNumbers[i] = nil
		end
		for i = 2, numChoices do
			
			local repeated
			repeat 
				repeated = false
				if (numOrGroup == "numbers") then
					randomNumber = math.random(1, 100)
				else
					randomNumber = math.random(1, 10)
				end
				
				for i = 1, #randomNumbers do
					if (randomNumbers[i] == randomNumber) then
						repeated = true
					end
				end
				
			until repeated == false and 
					randomNumber <= randomNumbers[1] + answerRange and randomNumber >= randomNumbers[1] - answerRange
			
			randomNumbers[i] = randomNumber
			
		end
	end
	
	
	
	-- if (choicesOrderRand == false) then
		table.sort( randomNumbers, compare)
	randomizeTable( randomNumbers )
	-- end
	
	
	local scale = scaleCards
	spacing = 20
	row = numChoices
	totalRow = row
	rowTwo = 0
	totalRowTwo = rowTwo
	numRows = 1
	
	newCardPositions = nil
	newCardPositions = {}
	if (cardSettingsSpacing) then
		for i = 1, 9 do
			if (i == 1) then
				newCardPositions[#newCardPositions+1] = 0
			else
				newCardPositions[#newCardPositions+1] = newCardPositions[#newCardPositions] + cardSettingsSpacing
			end
		end
	end
	
	if (numChoices == 5) then
		scale = scaleCards
		spacing = 18
		row = 5
		totalRow = row
		rowTwo = 0
		totalRowTwo = rowTwo
		numRows = 1
	elseif (numChoices == 6) then
		scale = scaleCards
		spacing = 20
		row = 3
		totalRow = row
		rowTwo = 3
		totalRowTwo = rowTwo
		numRows = 2
	elseif (numChoices == 7) then
		scale = scaleCards
		spacing = 20
		row = 4
		totalRow = row
		rowTwo = 3
		totalRowTwo = rowTwo
		numRows = 2
	elseif (numChoices == 8) then
		scale = scaleCards
		spacing = 20
		row = 4
		totalRow = row
		rowTwo = 4
		totalRowTwo = rowTwo
		numRows = 2
	elseif (numChoices == 9) then
		scale = scaleCards
		spacing = 20
		row = 5
		totalRow = row
		rowTwo = 4
		totalRowTwo = rowTwo
		numRows = 2
	elseif (numChoices == 10) then
		scale = scaleCards
		spacing = 20
		row = 5
		totalRow = row
		rowTwo = 5
		totalRowTwo = rowTwo
		numRows = 2
	end
	
	local tempCardGroup = display.newGroup()
	local tempCardGroupTwo = display.newGroup()
	
	for i = 1, row do
		
		if (numOrGroup == "numbers") then
			dynamicNumberCard( i, tostring(randomNumbers[1]), scale )
			-- cards[i] =  display.newImageRect("Images/" .. firstImageSet[randomNumbers[1]] .. ".png", 79*scale, 99*scale)
			-- cards[i].sound = gameSounds[ firstImageSet[randomNumbers[1]] ]
		elseif (numOrGroup == "dots") then
			cards[i] =  display.newImageRect("Images/" .. fifthImageSet[randomNumbers[1]] .. ".png", 79*scale, 99*scale)
			-- cards[i].sound = gameSounds[ firstImageSet[randomNumbers[1]] ]
			cards[i].sound = firstImageSet[randomNumbers[1]]
		elseif (numOrGroup == "numbersDots") then
			if (randomNumbers[1] == 0) then
				-- dynamicNumberCard( i, tostring(randomNumbers[1]), scale )
				cards[#cards+1] =  display.newImageRect("Images/dotsCard0.png", 79*scale, 99*scale)
				
				if (randomNumbers[1] == 0) then
					-- cards[i].sound = gameSounds[ "zero" ]
					cards[i].sound = "zero"
				else
					-- cards[#cards].sound = gameSounds[ firstImageSet[randomNumbers[1]] ]
					cards[#cards].sound = firstImageSet[randomNumbers[1]]
				end
			else
				cards[i] =  display.newImageRect("Images/" .. sixthImageSet[randomNumbers[1]] .. ".png", 79*scale, 99*scale)
				
				if (randomNumbers[1] == 0) then
					-- cards[i].sound = gameSounds[ "zero" ]
					cards[i].sound = "zero"
				else
					-- cards[i].sound = gameSounds[ firstImageSet[randomNumbers[1]] ]
					cards[i].sound = firstImageSet[randomNumbers[1]]
				end
			end
		else
			local randomSet
			if (numOrGroup == "groups") then
				randomSet = math.random(1,3)
			else
				randomSet = math.random(1,6)
			end
			if (randomSet == 1) then
				cards[i] =  display.newImageRect("Images/" .. fourthImageSet[randomNumbers[1]] .. ".png", 79*scale, 99*scale)
				-- cards[i].sound = gameSounds[ fourthImageSet[randomNumbers[1]] ]
				cards[i].sound = fourthImageSet[randomNumbers[1]]
			elseif (randomSet == 2) then
				cards[i] =  display.newImageRect("Images/" .. secondImageSet[randomNumbers[1]] .. ".png", 79*scale, 99*scale)
				-- cards[i].sound = gameSounds[ secondImageSet[randomNumbers[1]] ]
				cards[i].sound = secondImageSet[randomNumbers[1]]
			elseif (randomSet == 3) then
				cards[i] =  display.newImageRect("Images/" .. thirdImageSet[randomNumbers[1]] .. ".png", 79*scale, 99*scale)
				-- cards[i].sound = gameSounds[ thirdImageSet[randomNumbers[1]] ]
				cards[i].sound = thirdImageSet[randomNumbers[1]]
			elseif (numOrGroup == "both") then
				dynamicNumberCard( i, tostring(randomNumbers[1]), scale )
				-- cards[i] =  display.newImageRect("Images/" .. firstImageSet[randomNumbers[1]] .. ".png", 79*scale, 99*scale)
				-- cards[i].sound = gameSounds[ firstImageSet[randomNumbers[1]] ]
			end
		end
		
		
		cards[i].id = randomNumbers[1] -- Reference to the index of table
		--cards[i].x = i * (cards[i].width+spacing)
		if (cardSettingsSpacing) then
			cards[i].x = newCardPositions[(5-row)+(i*2)-1]
		else
			cards[i].x = rowPosition[(5-row)+(i*2)-1]
		end
		if (numRows == 2) then
			cards[i].y = halfH
			-- equationGroup.y = halfH - 100
		else
			cards[i].y = halfH
			-- equationGroup.y = halfH - 100
		end
		cards[i].initY = cards[i].y
		cards[i].frame = 0
		cards[i].row = 1
		-- cards[i]:addEventListener( "touch", ChoiceTap )
		cardGroup:insert(cards[i])
		
		if (cards[i].textGroup) then
			cardGroup:insert(cards[i].textGroup)
			cards[i].textGroup.anchorChildren = true
			cards[i].textGroup.anchorX, cards[i].textGroup.anchorY = 0.5, 0.5
			cards[i].textGroup.x, cards[i].textGroup.y = cards[i].x, cards[i].y
		
			cards[i].textGroup.x = cards[i].x
			cards[i].textGroup.y = cards[i].y
			
			dynamicNumberOffsets(i)
			
		end
		
		cards[i].xImage = display.newImageRect("Images/UI/cardX.png", 59, 50)
		cards[i].xImage.x = cards[i].x
		cards[i].xImage.y = cards[i].y
		cards[i].xImage.alpha = 0
		cardGroup:insert(cards[i].xImage)
		
		table.remove( randomNumbers, 1 )
		
	end
	
	
	for i = 1, rowTwo do
		
		if (numOrGroup == "numbers") then
			dynamicNumberCard( #cards+1, tostring(randomNumbers[1]), scale )
			-- cards[#cards+1] =  display.newImageRect("Images/" .. firstImageSet[randomNumbers[1]] .. ".png", 79*scale, 99*scale)
			-- cards[#cards].sound = gameSounds[ firstImageSet[randomNumbers[1]] ]
		elseif (numOrGroup == "dots") then
			cards[#cards+1] =  display.newImageRect("Images/" .. fifthImageSet[randomNumbers[1]] .. ".png", 79*scale, 99*scale)
			cards[#cards].sound = gameSounds[ firstImageSet[randomNumbers[1]] ]
		elseif (numOrGroup == "numbersDots") then
			if (randomNumbers[1] == 0) then
				-- dynamicNumberCard( #cards+1, tostring(randomNumbers[1]), scale )
				cards[#cards+1] =  display.newImageRect("Images/dotsCard0.png", 79*scale, 99*scale)
				cards[#cards].sound = gameSounds[ firstImageSet[randomNumbers[1]] ]
			else
				cards[#cards+1] =  display.newImageRect("Images/" .. sixthImageSet[randomNumbers[1]] .. ".png", 79*scale, 99*scale)
				cards[#cards].sound = gameSounds[ firstImageSet[randomNumbers[1]] ]
			end
		else
			local randomSet
			if (numOrGroup == "groups") then
				randomSet = math.random(1,3)
			else
				randomSet = math.random(1,6)
			end
			if (randomSet == 1) then
				cards[#cards+1] =  display.newImageRect("Images/" .. fourthImageSet[randomNumbers[1]] .. ".png", 79*scale, 99*scale)
				cards[#cards].sound = gameSounds[ fourthImageSet[randomNumbers[1]] ]
			elseif (randomSet == 2) then
				cards[#cards+1] =  display.newImageRect("Images/" .. secondImageSet[randomNumbers[1]] .. ".png", 79*scale, 99*scale)
				cards[#cards].sound = gameSounds[ secondImageSet[randomNumbers[1]] ]
			elseif (randomSet == 3) then
				cards[#cards+1] =  display.newImageRect("Images/" .. thirdImageSet[randomNumbers[1]] .. ".png", 79*scale, 99*scale)
				cards[#cards].sound = gameSounds[ thirdImageSet[randomNumbers[1]] ]
			elseif (numOrGroup == "both") then
				dynamicNumberCard( #cards+1, tostring(randomNumbers[1]), scale )
				-- cards[#cards+1] =  display.newImageRect("Images/" .. firstImageSet[randomNumbers[1]] .. ".png", 79*scale, 99*scale)
				-- cards[#cards].sound = gameSounds[ firstImageSet[randomNumbers[1]] ]
			end
		end
		cards[#cards].id = randomNumbers[1] -- Reference to the index of table
		--cards[#cards].x = i * (cards[#cards].width+spacing)
		cards[#cards].x = rowPosition[(5-rowTwo)+(i*2)-1]
		cards[#cards].y = halfH + 100
		cards[#cards].initY = cards[#cards].y
		cards[#cards].row = 2
		cards[#cards].frame = 0
		-- cards[#cards]:addEventListener( "touch", ChoiceTap )
		cardGroup:insert(cards[#cards])
		
		if (cards[#cards].textGroup) then
			cardGroup:insert(cards[#cards].textGroup)
			cards[#cards].textGroup.anchorChildren = true
			cards[#cards].textGroup.anchorX, cards[#cards].textGroup.anchorY = 0.5, 0.5
			cards[#cards].textGroup.x, cards[#cards].textGroup.y = cards[#cards].x, cards[#cards].y
		
			cards[#cards].textGroup.x = cards[#cards].x
			cards[#cards].textGroup.y = cards[#cards].y
			
			dynamicNumberOffsets(#cards)
			
		end
		
		cards[i].xImage = display.newImageRect("Images/UI/cardX.png", 59, 50)
		cards[i].xImage.x = cards[i].x
		cards[i].xImage.y = cards[i].y
		cards[i].xImage.alpha = 0
		cardGroup:insert(cards[i].xImage)
		
		table.remove( randomNumbers, 1 )
		
	end
	
	-- if (version.appStore == "Amazon" and system.getInfo ( "model" ) == "AFTB" or version.appStore == "Amazon FTV") then
		-- Runtime:addEventListener( "onFTVKey", ChoiceTap )
	-- end
	
	
	--tempCardGroup:setReferencePoint ( display.CenterReferencePoint ) -- commented out for graphics 2.0 and replaced with:
        --tempCardGroup.anchorX = 0.5
        --tempCardGroup.anchorY = 0.5
		
	-- oldCardGroupX = cardGroup.x
	-- oldCardGroupY = cardGroup.y

	
	-- newCardGroupX = tempCardGroup.x
	-- newCardGroupY = tempCardGroup.y
	
	
	-- tempCardGroupTwo:setReferencePoint ( display.CenterReferencePoint )
	-- oldCardGroupTwoX = tempCardGroupTwo.x
	-- oldCardGroupTwoY = tempCardGroupTwo.y
	
	-- newCardGroupTwoX = tempCardGroupTwo.x
	-- newCardGroupTwoY = tempCardGroupTwo.y
	
	-- cardGroup:insert( tempCardGroup )
	-- cardGroup:insert( tempCardGroupTwo )
	
	
	levelOptions = gameDetails["level" .. level]
	gameOptions = gameLevelDetails
	
	cardOptions = gameOptions.cards
	
	oldCardGroupX = cardGroup.x
	oldCardGroupY = cardGroup.y
	
	cardGroup.anchorChildren = true
	cardGroup.anchorX = 0.5
	cardGroup.anchorY = 0.5
	
	newCardGroupX = cardGroup.x
	newCardGroupY = cardGroup.y
	
	cardGroup.x = 1000
	
	if (numOrGroup == "numbersDots") then
		dots = {}
		if (choiceOneBlank == false) then
			if (choiceOne ~= 0) then
				dots[#dots+1] =  display.newImageRect("Images/" .. dotImages[choiceOne] .. ".png", 82, 29)
				dots[#dots].x = choiceOneText.x
				dotsGroup:insert( dots[#dots] )
			end
		else
			dots[#dots+1] =  display.newImageRect("Images/" .. dotImages[1] .. ".png", 82, 29)
			dots[#dots].x = choiceOneText.x
			dots[#dots].alpha = 0
			dotsGroup:insert( dots[#dots] )
		end
		if (choiceTwoBlank == false) then
			if (choiceTwo ~= 0) then
				dots[#dots+1] =  display.newImageRect("Images/" .. dotImages[choiceTwo] .. ".png", 82, 29)
				dots[#dots].x = choiceTwoText.x
				dotsGroup:insert( dots[#dots] )
			end
		else
			dots[#dots+1] =  display.newImageRect("Images/" .. dotImages[1] .. ".png", 82, 29)
			dots[#dots].x = choiceTwoText.x
			dots[#dots].alpha = 0
			dotsGroup:insert( dots[#dots] )
		end
		if (answerBlank == false) then
			if (answer ~= 0) then
				dots[#dots+1] =  display.newImageRect("Images/" .. dotImages[answer] .. ".png", 82, 29)
				dots[#dots].x = answerText.x
				dotsGroup:insert( dots[#dots] )
			end
		else
			dots[#dots+1] =  display.newImageRect("Images/" .. dotImages[1] .. ".png", 82, 29)
			dots[#dots].x = answerText.x
			dots[#dots].alpha = 0
			dotsGroup:insert( dots[#dots] )
		end
		
		--dotsGroup:setReferencePoint( display.CenterReferencePoint ) -- commented out for graphics 2.0 and replaced with:
        dotsGroup.xScale,dotsGroup.yScale = gameOptions.equation.scale, gameOptions.equation.scale
		dotsGroup.anchorChildren = true
		dotsGroup.anchorX = 0.5
        dotsGroup.anchorY = 0.5
		
		dotsGroup.x = 1000
		dotsGroup.alpha = 1
	end
	
end
	
	
-- If it's counting

function CheckCounting( event )
	
	local target = event.target
	local keyName = event.keyName
	
	
	if (target == nil) then
		target = targetCard
	end
	
	if event.keyName == nil and event.phase == "began" and buttonsActive == true or
		event.phase == "began" and buttonsActive == true or
		(keyName and event.phase == "down" and buttonsActive == true) then
		
	
		if (event.keyName and event.keyName ~= "back" and 
												event.keyName ~= "left" and 
												event.keyName ~= "right" and
												event.keyName ~= "up" and
												event.keyName ~= "down" and 
												event.keyName ~= "buttonY" and
												event.keyName ~= "mediaPlayPause" and 
												event.keyName ~= "buttonZ" and
												event.keyName ~= "buttonX" and
												keyName ~= "menu" or
												event.keyName == nil) then
											
			
			if (myData.isFireTV or myData.isController) then 
				-- transition.to( cursor, { time=100, alpha=0 } )
			end
			buttonsActive = false
			
			local levelOptions = gameDetails["level" .. level]
			local gameOptions = gameLevelDetails
			local questionOptions = gameOptions.question
			local countingOptions = gameOptions.counting
			
			
			if (cardTrans) then
				transition.cancel( cardTrans )
				cardTrans = nil
			end
			cardGroup.x = cardGroup.targetX
			
		
			local function removeCards()
				for i = #cards, 1, -1 do
					local newX, newY = cards[i]:localToContent( 0, 0 )
				
					if (cards[i].textGroup) then
						cards[i].textGroup:removeSelf()
						cards[i].textGroup = nil
					end
					if (cards[i].shadow) then
						cards[i].shadow:removeSelf()
						cards[i].shadow = nil
					end
				
					Particles:newEmitter(explosions,"fireworks", "Images/starParticle.png", 32, 32, 10, newX, newY, -4, 4, -16, 6, 252,234,27)--altRgb[1], altRgb[2], altRgb[3])
					cards[i]:removeSelf()
					cards[i] = nil
					table.remove( cards, i )
				end
				
				if savedData.enableSounds == true then
					playReservedChannel(shortClapSound, 21, 0)
				end
				
				
				local function hideQuestion()
					questionText.alpha = 0
					questionTextTwo.alpha = 0
				end
				transition.to( questionText, {  time=700, alpha = 0, transition=easing.outExpo, onComplete = hideQuestion } )
				transition.to( questionTextTwo, {  time=700, alpha = 0, transition=easing.outExpo } )
				-- timer.performWithDelay( 0, goodJobSequence )
				
				if (question == "PickEvenOdd" or question == "AllGreaterLessThan") then
					timer.performWithDelay( 0, equationWin )
				else
					timer.performWithDelay( 0, goodJobSequence )
				end
				
				if savedData.enableSounds == true then
					playReservedChannel(explodeSound, 15, 0)
				end
			end
		
			local function scalePop( obj )
			
				audio.stop( 11 )
			
				if savedData.enableSounds == true then
					for i = #cards, 1, -1 do
						if (obj == cards[i]) then
							-- playReservedChannel(cards[i].sound, currentCardChannel, 0)
						
							local tempSayOver100 = false
				
							-- for m = #cards, 1, -1 do
								-- if (type(cards[m].sound) ~= "string" and cards[m].sound >= 100) then
									-- tempSayOver100 = true
								-- end
							-- end
						
							-- if (cards[i].sound == "over100") then
								-- local overHundredSound
								-- repeat
									-- overHundredSound = math.random( 1, #overHundredSounds )
								-- until prevOverHundredSound ~= overHundredSound
								-- prevOverHundredSound = overHundredSound
							
								-- playReservedChannel(overHundredSounds[ overHundredSound ], currentCardChannel, 0)
							
							-- else
								-- playReservedChannel(cards[i].sound, currentCardChannel, 0)
							-- end
							
							if (type(cards[i].sound) == "string") then
								playReservedChannel(gameSounds[cards[i].sound], currentCardChannel, 0)
								
							elseif (tempSayOver100 == true) then
					
								local overHundredSound
								repeat
									overHundredSound = math.random( 1, #overHundredSounds )
								until prevOverHundredSound ~= overHundredSound
								prevOverHundredSound = overHundredSound
							
								playReservedChannel(overHundredSounds[ overHundredSound ], 29, 0)
								
							elseif (cards[i].sound <= 100) then
								playReservedChannel( gameNumSounds[cards[i].sound], 29, 0 )
							else
								local function partFiveAudio()
								
									if (cards[i] and cards[i].sound) then
								
										local numTemp
										if (cards[i].sound < 110) then
											numTemp = tonumber( tostring(cards[i].sound):sub(3, 3) )
										else
											numTemp = tonumber( tostring(cards[i].sound):sub(2, 3) )
										end
										playReservedChannel(gameNumSounds[ numTemp ], 28, 0)
										
									end
									
								end
							
								playReservedChannel(hundredSounds[ tonumber(tostring(cards[i].sound):sub(1, 1)) ], 29, 0)
							
							
								if (questionAudioTimer) then
									timer.cancel( questionAudioTimer )
									questionAudioTimer = nil
								end
								questionAudioTimer = timer.performWithDelay( 900, partFiveAudio )
									
							end
						
						end
					end
				end
				currentCardChannel = currentCardChannel + 1
				if currentCardChannel > 19 then
					currentCardChannel = 18
				end
			
				local function sendCardToFloat()
					floaters[#floaters+1] = obj.id
					if (#floaters < 2) then
						Runtime:removeEventListener( "enterFrame", cardFloat)
						Runtime:addEventListener( "enterFrame", cardFloat)
					end
				end
				local function sendCardToHop()
				
					for i = #cards, 1, -1 do
						cards[i]:removeEventListener( "touch", CheckCounting )
						-- cards[i]:removeEventListener( "key", CheckCounting )
						-- cards[i]:removeEventListener( "onFTVKey", CheckCounting )
					end
					
					if (myData.isController) then
						Runtime:removeEventListener( "key", CheckCounting )
					elseif (myData.isFireTV) then
						Runtime:removeEventListener( "onFTVKey", CheckCounting )
					end
				
					local function sendCardToHopTwo()
						
						for i = #cards, 1, -1 do
							if (cards[i].textGroup) then
								transition.to( cards[i].textGroup, { time=150 , rotation = 0, y=cards[i].y + 25 + cards[i].textGroup.offsetY, transition=easing.inExpo } )
							end
							if (cards[i].shadow) then
								transition.to( cards[i].shadow, { time=150 , rotation = 0, y=cards[i].y + 25 + shadowOffsetY, transition=easing.inExpo } )
							end
							transition.to( cards[i], { time=150 , rotation = 0, y=cards[i].y + 25, transition=easing.inExpo } )
							
						end
						timer.performWithDelay( 150, removeCards )
					end
					
					for i = #floaters, 1, -1 do
						floaters[i] = nil
						table.remove( floaters, i )
					end
					Runtime:removeEventListener( "enterFrame", cardFloat)
					for i = #cards, 1, -1 do
						if (cards[i].textGroup) then
							transition.to( cards[i].textGroup, { time=150 , rotation=0, y=cards[i].initY - 20 + cards[i].textGroup.offsetY, transition=easing.outExpo } )
						end
						if (cards[i].shadow) then
							transition.to( cards[i].shadow, { time=150 , rotation=0, y=cards[i].initY - 20 + shadowOffsetY, transition=easing.outExpo } )
						end
					
						transition.to( cards[i], { time=150 , rotation=0, y=cards[i].initY - 20, transition=easing.outExpo } )
					end
					timer.performWithDelay( 150, sendCardToHopTwo )
					
					if savedData.enableSounds == true then
						playReservedChannel(cardHopSound, 16, 0)
					end
				end
				
				-- print("curr" .. currentCountingNumber)
				-- print(startNumber + ((row*column)*countingOptions.skip))
				local hasMoreAnswers = false
				
				
				if (question == "PickEvenOdd" and currentCountingNumber + 1 < numEvenOddAnswers or
						question == "AllGreaterLessThan" and currentCountingNumber + 1 < numGreaterLessThanAnswers or
						question ~= "PickEvenOdd" and question ~= "AllGreaterLessThan" and currentCountingNumber ~= startNumber + ((row*column)*countingOptions.skip) - countingOptions.skip) then
					timer.performWithDelay( 100, sendCardToFloat )
					
					if (myData.isFireTV or myData.isController) then 
						timer.performWithDelay( 150, showCursor )
					else
						timer.performWithDelay( 150, makeButtonsActive )
					end
				else
					buttonsActive = false
					
					for i = #cards, 1, -1 do
						if (obj == cards[i]) then
							if (type(cards[i].sound) ~= "string" and cards[i].sound >= 100) then
								timer.performWithDelay( 700, sendCardToHop )
							else
								timer.performWithDelay( 100, sendCardToHop )
							end
						end
					end
					
				end
				
				if (question == "PickEvenOdd" or question == "AllGreaterLessThan") then
					currentCountingNumber = currentCountingNumber + 1
				elseif (question ~= "PickEvenOdd" and question ~= "AllGreaterLessThan" and target.id < startNumber + ((row*column)*countingOptions.skip)) then
					currentCountingNumber = currentCountingNumber + countingOptions.skip
				end
				
				if (obj.textGroup) then
					transition.to( obj.textGroup, { time=100 , xScale = 1.15, yScale = 1.15, transition=easing.outExpo } )
				end
				if (obj.shadow) then
					transition.to( obj.shadow, { time=100 , xScale = 1.15, yScale = 1.15, transition=easing.outExpo } )
				end
				
				transition.to( obj, { time=100 , xScale = 1.15, yScale = 1.15, transition=easing.outExpo } )
				obj.frame = 0
			end
		
		
		
			local evenOddCorrect = false
			if (question == "PickEvenOdd") then
				if (isEvenOdd == "even" and target.id % 2 == 0) then
					evenOddCorrect = true
				elseif (isEvenOdd == "odd" and target.id % 2 ~= 0) then
					evenOddCorrect = true
				end
			elseif (question == "AllGreaterLessThan") then
				if (isGreaterLessThan == "greater than" and target.id > greaterLessThanAnswer) then
					evenOddCorrect = true
				elseif (isGreaterLessThan == "less than" and target.id < greaterLessThanAnswer) then
					evenOddCorrect = true
				elseif (isGreaterLessThan == "equal to" and target.id == greaterLessThanAnswer) then
					evenOddCorrect = true
				end
			end
		
			
			if (question == "PickEvenOdd" and evenOddCorrect == true or
				question == "AllGreaterLessThan" and evenOddCorrect == true or
				question ~= "PickEvenOdd" and question ~= "AllGreaterLessThan" and target.id == currentCountingNumber) then
			
			
				target:removeEventListener( "touch", CheckCounting )
				target:removeEventListener( "key", CheckCounting )
				target:removeEventListener( "onFTVKey", CheckCounting )
				
				
				if (myData.isFireTV or myData.isController) then 
					transition.to( cursor, { time=100, alpha=0 } )
				end
				
				
				if (target.shadow == nil) then
					target.shadow = display.newImageRect("Images/cardShadow.png", 92*scaleCards, 110*scaleCards)
					target.shadow.x = target.x + shadowOffsetX
					target.shadow.y = target.y + shadowOffsetY
					target.shadow.alpha = .75
					target.shadow.rotation = target.rotation
					cardGroup[1]:insert( target.shadow )
					
					target.shadow:toFront()
					target:toFront()
					if (target.textGroup) then
						target.textGroup:toFront()
					end
				end
				
				
			
				if (target.textGroup) then
					transition.to(target.textGroup, {time=100, xScale = 1.5, yScale = 1.5, transition=easing.inExpo} )
				end
				if (target.shadow) then
					transition.to(target.shadow, {time=100, xScale = 1.5, yScale = 1.5, transition=easing.inExpo} )
				end
				transition.to(target, {time=100, xScale = 1.5, yScale = 1.5, onComplete = scalePop, transition=easing.inExpo} )
				
				if savedData.enableSounds == true then
					playReservedChannel(flipSound, 14, 0)
				end
				
				audio.stop( 11 )
				if (questionAudioTimer) then
					timer.cancel( questionAudioTimer )
					questionAudioTimer = nil
				end
				
				
				if (myData.isFireTV or myData.isController) then 
				else
					if (cursorTimer) then
						timer.cancel( cursorTimer )
						cursorTimer = nil
					end
					if (cursorTransition) then
						transition.cancel( cursorTransition )
						cursorTransition = nil
					end
					transition.to( cursor, { time=100, alpha=0 } )
				end
				
			else
				-- for i = #floaters, 1, -1 do
					-- floaters[i] = nil
					-- table.remove( floaters, i )
				-- end
				-- for i = #cards, 1, -1 do
					-- if (cards[i].xScale > 1) then
					
						-- if (cards[i].shadow) then
							-- cards[i].shadow:removeSelf()
							-- cards[i].shadow = nil
						-- end
					
						-- if (cards[i].textGroup) then
							-- transition.to( cards[i].textGroup, { time=100, rotation=0, y=cards[i].initY + cards[i].textGroup.offsetY, xScale = 1, yScale = 1, transition=easing.outExpo } )
						-- end
					
						-- transition.to( cards[i], { time=100, rotation=0, y=cards[i].initY, xScale = 1, yScale = 1, transition=easing.outExpo } )
					-- end
				-- end
				
				
				-- if (question == "PickEvenOdd") then
					-- currentCountingNumber = 0
				-- else
					-- currentCountingNumber = startNumber
				-- end
				
				-- Runtime:removeEventListener( "enterFrame", cardFloat)
				if savedData.enableSounds == true then
					for i = #cards, 1, -1 do
						if (target == cards[i]) then
							playReservedChannel(wrongSound, currentWrongChannel, 0)
						end
					end
				end
				currentWrongChannel = currentWrongChannel + 1
				if currentWrongChannel > 20 then
					currentWrongChannel = 19
				end
				
				-- if (version.appStore == "Amazon" and system.getInfo ( "model" ) == "AFTB" or version.appStore == "Amazon FTV") then
				-- if (myData.isFireTV or gameplayMode == 4 or myData.isController) then
					-- cursorTimer = timer.performWithDelay( 100, showCursor )
				-- else
					makeButtonsActive()
				-- end
				-- end
				
				
				-- local function addListeners()
					-- for i = #cards, 1, -1 do
						-- cards[i]:removeEventListener( "touch", CheckCounting )
						-- cards[i]:removeEventListener( "key", CheckCounting )
						-- cards[i]:removeEventListener( "onFTVKey", CheckCounting )
					-- end	
					-- for i = #cards, 1, -1 do
						-- cards[i]:addEventListener( "touch", CheckCounting )
						-- cards[i]:addEventListener( "key", CheckCounting )
						-- cards[i]:addEventListener( "onFTVKey", CheckCounting )
					-- end	
				-- end
				-- timer.performWithDelay( 200, addListeners )
				
			end
			
		end
	
	end
	
end


-- If it's sequence
function checkSequenceAnswer( event )
	
	local target = event.target
	local keyName = event.keyName
	
	if (target == nil) then
		target = targetCard
	end
	
	if event.keyName == nil and event.phase == "began" and buttonsActive == true and correctAnswer ~= true or
		event.phase == "began" and buttonsActive == true and correctAnswer ~= true or
		(keyName and event.phase == "down" and buttonsActive == true and correctAnswer ~= true) then
		
	
		if (event.keyName and event.keyName ~= "back" and 
												event.keyName ~= "left" and 
												event.keyName ~= "right" and
												event.keyName ~= "up" and
												event.keyName ~= "down" and
												event.keyName ~= "buttonY" and
												event.keyName ~= "mediaPlayPause" and
												event.keyName ~= "buttonZ" and
												event.keyName ~= "buttonX" or
												event.keyName == nil) then
												
		
			if (myData.isFireTV or myData.isController) then 
				transition.to( cursor, { time=100, alpha=0 } )
				buttonsActive = false
			end
			buttonsActive = false
		
		
			if (cardTrans) then
				transition.cancel( cardTrans )
				cardTrans = nil
			end
			cardGroup.x = cardGroup.targetX
		
		
			target:removeEventListener( "touch", checkSequenceAnswer )
			-- target:removeEventListener( "key", checkSequenceAnswer )
			-- target:removeEventListener( "onFTVKey", checkSequenceAnswer )
		
			local answer = true
			local newX, newY
			
			-- local details = levelDetails["level" .. level]
			-- local detailsTwo = details.cards[currentWaypoint]
			local levelOptions = gameDetails["level" .. level]
			local gameOptions = gameLevelDetails
			local cardOptions = gameOptions.cards
			
			
			local done = false
			
			local function fixEquationCardPos()

				local pos = 7 - row
				local visibleCard
				for i = 1, totalRow do
					if (cards[i].y == cards[i].initY and cards[i].alpha == 1) then
						
						if (cardSettingsSpacing) then
							transition.to( cards[i], { time=100 , x = newCardPositions[pos], transition=easing.outExpo } )
							if (cards[i].textGroup) then
								transition.to( cards[i].textGroup, { time=100 , x = newCardPositions[pos] + cards[i].textGroup.offsetX, transition=easing.outExpo } )
							end
							if (cards[i].shadow) then
								transition.to( cards[i].shadow, { time=100 , x = newCardPositions[pos] + shadowOffsetX, transition=easing.outExpo } )
							end
							transition.to( cards[i].xImage, { time=100 , x = newCardPositions[pos], transition=easing.outExpo } )
						
						
							-- transition.to( cards[i], { time=100 , x = newCardPositions[pos], transition=easing.outExpo } )
							-- if (cards[i].shadow) then
								-- transition.to( cards[i].shadow, { time=100 , x = newCardPositions[pos] + shadowOffsetX, transition=easing.outExpo } )
							-- end
							-- transition.to( cards[i].xImage, { time=100 , x = newCardPositions[pos], transition=easing.outExpo } )
						
							-- if (cards[i].image) then
								-- transition.to( cards[i].xImage, { time=100 , x = newCardPositions[pos], transition=easing.outExpo } )
							-- end
						else
							transition.to( cards[i], { time=100 , x = rowPosition[pos], transition=easing.outExpo } )
							if (cards[i].textGroup) then
								transition.to( cards[i].textGroup, { time=100 , x = rowPosition[pos] + cards[i].textGroup.offsetX, transition=easing.outExpo } )
							end
							if (cards[i].shadow) then
								transition.to( cards[i].shadow, { time=100 , x = rowPosition[pos] + shadowOffsetX, transition=easing.outExpo } )
							end
							transition.to( cards[i].xImage, { time=100 , x = rowPosition[pos], transition=easing.outExpo } )
						end
						
						pos = pos + 2
						
						visibleCard = i
						
						
					end
				end
				row = row - 1
				
				local function moveCards()
					for i = 1, #cards do
						if (cards[i].alpha == 0) then
							cards[i].x = cards[visibleCard].x
							if (cards[i].shadow) then
								cards[i].shadow.x = cards[visibleCard].x + shadowOffsetX
							end
							if (cards[i].textGroup) then
								cards[i].textGroup.x = cards[visibleCard].x + cards[i].textGroup.offsetX
							end
							if (cards[i].xImage) then
								cards[i].xImage.x = cards[visibleCard].x
							end
						end
					end
				end
				timer.performWithDelay( 105, moveCards )
				
				done = true
				
				buttonsActiveTimer = timer.performWithDelay( 150, makeButtonsActive )
				
				if (myData.isFireTV or myData.isController) then 
					showCursorTimer = timer.performWithDelay( 100, showCursor )
				end

			end
			
			local oldBlankX, oldBlankY
			local blankX, blankY
			local function equationCardHop( object )
				local function equationCardHopTwo( obj )
					local function moveCardToSpot( obj )
						if (gameplayMode == 3 or gameplayMode == 6) then
						
							-- display.currentStage:insert(obj)
						
							-- if (cardOptions.category == "numbers") then
								-- obj.x = blankX - 13
							-- else
								-- obj.x = blankX - 5
							-- end
							obj.x = obj.x + blankX
							
							obj.y = gameOptions.grayBGY - cardOptions.offsetY
							
							if (obj.textGroup) then
								obj.textGroup.x = obj.x + obj.textGroup.offsetX
								obj.textGroup.y = obj.y + obj.textGroup.offsetY
							end
							if (obj.shadow) then
								obj.shadow.x = obj.x + shadowOffsetX
								obj.shadow.y = obj.y + shadowOffsetY
							end
							
							howManyImages[#howManyImages].alpha = 0
							
							Particles:newEmitter(explosions,"fireworks", "Images/starParticle.png", 32, 32, 10, oldBlankX, gameOptions.grayBGY, -4, 4, -16, 6, 252,234,27)--altRgb[1], altRgb[2], altRgb[3])
							timer.performWithDelay( 1000, equationWin )
						end
						
						if savedData.enableSounds == true then
							playReservedChannel(explodeSound, 15, 0)
						end
						
						if savedData.enableSounds == true then
							playReservedChannel(shortClapSound, 21, 0)
						end
						
						for i = 1, #cards do
							if (cards[i].y == cards[i].initY) then
								if (cards[i].textGroup) then
									transition.to( cards[i].textGroup, { time=150 , alpha = 0 } )
								end
								if (cards[i].shadow) then
									transition.to( cards[i].shadow, { time=150 , alpha = 0 } )
								end
								transition.to( cards[i], { time=150 , alpha = 0 } )
							end
						end
						
					end
					if (obj.textGroup) then
						transition.to( obj.textGroup, { time=150 , y=obj.y + 25 + obj.textGroup.offsetY, transition=easing.inExpo } )
					end
					if (obj.shadow) then
						transition.to( obj.shadow, { time=150 , y=obj.y + 25 + shadowOffsetY, transition=easing.inExpo } )
					end
					transition.to( obj, { time=150 , y=obj.y + 25, transition=easing.inExpo, onComplete=moveCardToSpot } )
				end
				
				if (object.textGroup) then
					transition.to( object.textGroup, { time=150 , y=object.y - 20 + object.textGroup.offsetY, transition=easing.outExpo } )
				end
				if (object.shadow) then
					transition.to( object.shadow, { time=150 , y=object.y - 20 + shadowOffsetY, transition=easing.outExpo } )
				end
				transition.to( object, { time=150 , y=object.y - 20, transition=easing.outExpo, onComplete=equationCardHopTwo} )
				
				if savedData.enableSounds == true then
					playReservedChannel(cardHopSound, 16, 0)
				end
				
			end
			
			local function scalePop( obj )
			
				for i = #cards, 1, -1 do
					cards[i]:removeEventListener( "touch", checkSequenceAnswer )
					cards[i]:removeEventListener( "key", checkSequenceAnswer )
					cards[i]:removeEventListener( "onFTVKey", checkSequenceAnswer )
				end
			
				audio.stop( 11 )
			
				if savedData.enableSounds == true then
					for i = #cards, 1, -1 do
						if (target == cards[i]) then
							-- playReservedChannel(cards[i].sound, currentCardChannel, 0)
						
							if (type(cards[i].sound) == "string") then
								playReservedChannel( gameSounds[cards[i].sound], currentCardChannel, 0)
							elseif (cards[i].sound <= 100) then
								playReservedChannel( gameNumSounds[cards[i].sound], 29, 0 )
							else
								local function partFiveAudio()
									local numTemp
									if (cards[i].sound < 110) then
										numTemp = tonumber( tostring(cards[i].sound):sub(3, 3) )
									else
										numTemp = tonumber( tostring(cards[i].sound):sub(2, 3) )
									end
									playReservedChannel(gameNumSounds[ numTemp ], 28, 0)
								end
							
								playReservedChannel(hundredSounds[ tonumber(tostring(cards[i].sound):sub(1, 1)) ], 29, 0)
							
							
								if (questionAudioTimer) then
									timer.cancel( questionAudioTimer )
									questionAudioTimer = nil
								end
								questionAudioTimer = timer.performWithDelay( 900, partFiveAudio )
									
							end
						
						end
					end
				end
				currentCardChannel = currentCardChannel + 1
				if currentCardChannel > 19 then
					currentCardChannel = 18
				end
				
				if (obj.textGroup) then
					transition.to( obj.textGroup, { time=100 , xScale = 1.15, yScale = 1.15, transition=easing.outExpo } )
				end
				if (obj.shadow) then
					transition.to( obj.shadow, { time=100 , xScale = 1.15, yScale = 1.15, transition=easing.outExpo } )
				end
				
				transition.to( obj, { time=100 , xScale = 1.15, yScale = 1.15, onComplete = equationCardHop, transition=easing.outExpo } )
				
			end
		
			
			if (target.id ~= sequenceAnswer) then
				answer = false
			end
			
			
			if (answer == true) then
				print("correct")
				
				correctAnswer = true
				
				if (buttonsActiveTimer) then
					timer.cancel( buttonsActiveTimer )
					buttonsActiveTimer = nil
				end
				if (showCursorTimer) then
					timer.cancel( showCursorTimer )
					showCursorTimer = nil
				end
				if (fixCardsTimer) then
					timer.cancel( fixCardsTimer )
					fixCardsTimer = nil
				end
				
				for i = #cards, 1, -1 do
					cards[i]:removeEventListener( "touch", checkSequenceAnswer )
					-- cards[i]:removeEventListener( "key", checkSequenceAnswer )
					-- cards[i]:removeEventListener( "onFTVKey", checkSequenceAnswer )
				end
				
				if (myData.isController) then
					Runtime:removeEventListener( "key", checkSequenceAnswer )
				elseif (myData.isFireTV) then
					Runtime:removeEventListener( "onFTVKey", checkSequenceAnswer )
				end
				
				print("Test location")
				print(location)
				oldBlankX, oldBlankY = howManyImages[location]:localToContent( 0, 0 )
				blankX, blankY = howManyImages[location]:localToContent( 0, 0 )
				local tempSequenceCsrdX, tempSequenceCardY = target:localToContent( 0, 0 )
				
				blankX = blankX - tempSequenceCsrdX
				
				if savedData.enableSounds == true then
					playReservedChannel(flipSound, 14, 0)
				end
				
				audio.stop( 11 )
				if (questionAudioTimer) then
					timer.cancel( questionAudioTimer )
					questionAudioTimer = nil
				end
				
				
				if (cards[target.index] and cards[target.index].shadow == nil) then
					cards[target.index].shadow = display.newImageRect("Images/cardShadow.png", 92*scaleCards, 110*scaleCards)
					cards[target.index].shadow.x = cards[target.index].x + shadowOffsetX
					cards[target.index].shadow.y = cards[target.index].y + shadowOffsetY
					cards[target.index].shadow.alpha = .75
					cards[target.index].shadow.rotation = cards[target.index].rotation
					cardGroup:insert( cards[target.index].shadow )
					
					cards[target.index].shadow:toFront()
					cards[target.index]:toFront()
					if (cards[target.index].textGroup) then
						cards[target.index].textGroup:toFront()
					end
				end
				
				
				if (target.textGroup) then
					transition.to(target.textGroup, {time=100, xScale = 1.5, yScale = 1.5, transition=easing.inExpo} )
				end
				if (target.shadow) then
					transition.to(target.shadow, {time=100, xScale = 1.5, yScale = 1.5, transition=easing.inExpo} )
				end
				transition.to(target, {time=100, xScale = 1.5, yScale = 1.5, onComplete = scalePop, transition=easing.inExpo} )
			else
			
				target:removeEventListener( "touch", checkSequenceAnswer )
				-- target:removeEventListener( "key", checkSequenceAnswer )
				-- target:removeEventListener( "onFTVKey", checkSequenceAnswer )
				
				local function setCardsAlpha( obj )
				
					target.alpha = 0
					target.rotation = 0
					target.y = target.initY
					if (target.shadow) then
						target.shadow.alpha = 0
						target.shadow.rotation = 0
						target.shadow.y = target.shadow.initY
					end
					if (target.textGroup) then
						target.textGroup.alpha = 0
						target.textGroup.rotation = 0
						target.textGroup.y = target.textGroup.initY
					end
					target.xImage.alpha = 0
					target.xImage.rotation = 0
					target.xImage.y = target.xImage.initY
				
				end
				
				print("wrong")
				local randomRotation = math.random(-400,400)
				target.initY = target.y
				transition.to( target, { time=500 , rotation = randomRotation, alpha=1, y=800, transition=easing.inExpo} )
				
				if (target.textGroup) then
					target.textGroup.initY = target.textGroup.y
					transition.to( target.textGroup, { time=500 , rotation = randomRotation, alpha=1, y=800, transition=easing.inExpo} )
				end
				if (target.shadow) then
					target.shadow.initY = target.shadow.y
					transition.to( target.shadow, { time=500 , rotation = randomRotation, alpha=1, y=800, transition=easing.inExpo} )
				end
				target.xImage.alpha = 1
				target.xImage.initY = target.xImage.y
				transition.to( target.xImage, { time=500 , rotation = randomRotation, alpha=1, y=800, transition=easing.inExpo, onComplete = setCardsAlpha } )
				
				fixCardsTimer = timer.performWithDelay( 550, fixEquationCardPos )
				if savedData.enableSounds == true then
					for i = #cards, 1, -1 do
						if (target == cards[i]) then
							playReservedChannel(wrongSound, currentWrongChannel, 0)
						end
					end
				end
				currentWrongChannel = currentWrongChannel + 1
				if currentWrongChannel > 20 then
					currentWrongChannel = 19
				end
			end
		
		end
		
	end
	
end

function sequenceCards()

	local levelOptions = gameDetails["level" .. level]
	local gameOptions = gameLevelDetails
	local cardOptions = gameOptions.cards
	local sequenceOptions = gameOptions.sequence
	-- local details = levelDetails["level" .. level]
	local detailsBG = gameOptions.grayBGY
	local answerRange = cardOptions.answerRange
	
	local sequenceOrder = sequenceOptions.order
	
	howManyBackground = display.newImageRect("Images/UI/messageBG.png", 1000, 116 )
	howManyBackground.x = -1000
	howManyBackground.y = detailsBG
	
	howManyGroup = display.newGroup()
	howManyImages = {}
	
	local tempImageCount = imageCount
	
	pattern = {}
	
	if (cardOptions.category == "items") then
		sequence = {}
		repeat
			repeat
				local repeated = false
				-- randomItem = math.random(1, #sequenceImageList)
				randomItem = math.random(cardOptions.startRange, cardOptions.endRange)
				for i = 1, #sequence do
					if (sequence[i] == randomItem) then
						repeated = true
					end
				end
			until repeated == false
			sequence[#sequence+1] = randomItem
			pattern[#pattern+1] = randomItem
			tempImageCount = tempImageCount - 1
		until #sequence == sequenceOptions.patternLength
	end
	
	local sequenceNum = 1
	for i = 1, tempImageCount do
		if (cardOptions.category == "numbers") then
			if (pattern[1] == nil) then
				pattern[#pattern+1] = startNumber
			else
			
				if (sequenceSkipAmount ~= nil) then
					if (sequenceOrder == "ascending") then
						pattern[#pattern+1] = pattern[#pattern] + sequenceSkipAmount
					else
						pattern[#pattern+1] = pattern[#pattern] - sequenceSkipAmount
					end
				else
					if (sequenceOrder == "ascending") then
						pattern[#pattern+1] = pattern[#pattern] + sequenceOptions.skip
					else
						pattern[#pattern+1] = pattern[#pattern] - sequenceOptions.skip
					end
				end
			
				-- pattern[#pattern+1] = pattern[#pattern] + sequenceOptions.skip
			end
		else
			pattern[#pattern+1] = sequence[sequenceNum]
			sequenceNum = sequenceNum + 1
			if (sequenceNum > sequenceOptions.patternLength) then
				sequenceNum = 1
			end
		end
	end
	
	scalePerItems = 0 --used to scale image pattern images differently based on the number of items
	
	for i = 1, imageCount do
		
		if (cardOptions.category == "numbers") then
			howManyImages[#howManyImages+1] = display.newText( pattern[i], 179, 93, dynamicFont, 75 )
			howManyImages[#howManyImages]:setFillColor(255/255,254/255,240/255)
		else
			print("Pattern: " .. pattern[i])
			howManyImages[#howManyImages+1] = display.newImageRect("Images/" .. sequenceImageList[pattern[i]].image .. ".png", sequenceImageList[pattern[i]].w * 0.6, sequenceImageList[pattern[i]].h * 0.6 )
			howManyImages[#howManyImages].sound = gameSounds[ sequenceImageList[pattern[i]].vo ]
		end
		
		-- howManyImages[#howManyImages].x = (i-1) * sequenceOptions.itemsSpacing
		
		if (howManyImages[#howManyImages-1]) then
			if (cardOptions.category == "numbers") then
				if (imageCount == 6) then
					howManyImages[#howManyImages].x = howManyImages[#howManyImages-1].x + (howManyImages[#howManyImages-1].contentWidth*0.5) + (howManyImages[#howManyImages].contentWidth*0.5) + 40
				elseif (imageCount == 5) then
					howManyImages[#howManyImages].x = howManyImages[#howManyImages-1].x + (howManyImages[#howManyImages-1].contentWidth*0.5) + (howManyImages[#howManyImages].contentWidth*0.5) + 35
				else
					howManyImages[#howManyImages].x = howManyImages[#howManyImages-1].x + (howManyImages[#howManyImages-1].contentWidth*0.5) + (howManyImages[#howManyImages].contentWidth*0.5) + 30
				
				end
			else
				if (imageCount == 6) then
					howManyImages[#howManyImages].x = howManyImages[#howManyImages-1].x + (howManyImages[#howManyImages-1].contentWidth*0.5) + (howManyImages[#howManyImages].contentWidth*0.5) + 18
				elseif (imageCount == 5) then
					howManyImages[#howManyImages].x = howManyImages[#howManyImages-1].x + (howManyImages[#howManyImages-1].contentWidth*0.5) + (howManyImages[#howManyImages].contentWidth*0.5) + 24
				else
					howManyImages[#howManyImages].x = howManyImages[#howManyImages-1].x + (howManyImages[#howManyImages-1].contentWidth*0.5) + (howManyImages[#howManyImages].contentWidth*0.5) + 24
				
				end
			end
		end
		
		if (cardOptions.category == "numbers") then
			if (imageCount == 6) then
				scalePerItems = 0				
			elseif (imageCount == 5) then
				scalePerItems = 0
			else
				scalePerItems = 0
			end
		else
			if (imageCount == 6) then
				scalePerItems = .2				
			elseif (imageCount == 5) then
				scalePerItems = 0
			else
				scalePerItems = 0
			end
		end
		
		howManyImages[#howManyImages].xScale = sequenceOptions.itemsScale - scalePerItems
		howManyImages[#howManyImages].yScale = sequenceOptions.itemsScale - scalePerItems
		
		
		howManyImages[#howManyImages].id = pattern[i]
		howManyGroup:insert( howManyImages[#howManyImages] )
			
	end
	
	
	
	if (cardOptions.category == "numbers") then
		howManyGroup.y = detailsBG + 5
		
		if system.getInfo( "platformName" ) == "Android"then
			howManyGroup.y = howManyGroup.y - 170
				
		end
	else
		howManyGroup.y = detailsBG
	end
	
	if (sequenceOptions.blankLocation == "random") then
		if (cardOptions.category == "numbers") then
			if (sequenceOptions.skip > 2) then
				location = math.random(3, #howManyImages-1)
			else
				location = math.random(sequenceOptions.skip+1, #howManyImages-1)
			end
		else
			location = math.random(sequenceOptions.patternLength+1, #howManyImages-1)
		end
	else
		location = sequenceOptions.blankLocation
	end
	
	howManyImages[location].alpha = 0
	
	howManyImages[#howManyImages+1] = display.newImageRect("Images/UI/blankCard.png", 65*1.25, 79*1.25)
	howManyImages[#howManyImages].x = howManyImages[location].x
	howManyImages[#howManyImages].y = howManyImages[location].y
	
	if (cardOptions.category == "items") then
		howManyImages[#howManyImages].y = howManyImages[location].y
	else
		howManyImages[#howManyImages].y = howManyImages[location].y - 4
	end
	if system.getInfo( "platformName" ) == "Android" then
		if (cardOptions.category == "numbers") then
			if (sequenceOptions.itemsScale == .875) then
				howManyImages[#howManyImages].y = howManyImages[location].y - 25
			elseif (sequenceOptions.itemsScale == .9) then
				howManyImages[#howManyImages].y = howManyImages[location].y - 20
			elseif (sequenceOptions.itemsScale == .95) then
				howManyImages[#howManyImages].y = howManyImages[location].y - 12
			else
				howManyImages[#howManyImages].y = howManyImages[location].y - 25
			end
		end
	end
	
	if system.getInfo( "platformName" ) == "Android" then
		if (cardOptions.category == "numbers") then
			howManyImages[#howManyImages].y = howManyImages[#howManyImages].y + 168
		end
	end
	howManyGroup:insert( howManyImages[#howManyImages] )
	
	
	oldHowManyGroupX = howManyGroup.x
	howManyGroup.xScale, howManyGroup.yScale = gameOptions.equation.scale, gameOptions.equation.scale
	--howManyGroup:setReferencePoint(display.CenterReferencePoint) -- commented out for graphics 2.0 and replaced with:
        howManyGroup.anchorChildren = true
		howManyGroup.anchorX = 0.5
        howManyGroup.anchorY = 0.5
		
	newHowManyGroupX = howManyGroup.x
	
	howManyGroup.x = 1000
	howManyGroup.y = detailsBG
	if system.getInfo( "platformName" ) == "Android" then
		if (cardOptions.category == "numbers") then
			if (sequenceOptions.itemsScale == .875) then
				howManyGroup.y = detailsBG - 139
			elseif (sequenceOptions.itemsScale == .9) then
				if (gameOptions.equation.scale == .8) then
					howManyGroup.y = detailsBG - 115
				else
					howManyGroup.y = detailsBG - 130
				end
			elseif (sequenceOptions.itemsScale == .95) then
				howManyGroup.y = detailsBG - 153
			else
				howManyGroup.y = detailsBG - 143
			end
		end
	end
	
	
	randomNumbers = {}
	randomNumbers[1] = howManyImages[location].id
	sequenceAnswer = howManyImages[location].id
	
	for i = 1, numChoices-1 do
	
		local repeated = false
		local randomNumber
	
		repeat 
			repeated = false
			
			if (cardOptions.category == "numbers") then
				randomNumber = math.random(1, 1000)
			else
				randomNumber = math.random(1, #sequenceImageList)
			end
			for i = 1, #randomNumbers do
				if (randomNumbers[i] == randomNumber) then
					repeated = true
				end
			end
			
			if (cardOptions.category == "numbers") then
			else
				if (sequenceOptions.patternLength > #randomNumbers) then
					local inSequence = false
					for i = 1, #sequence do
						if (sequence[i] == randomNumber) then
							inSequence = true
							break
						end
					end
					
					if (inSequence == false) then
						repeated = true
					end
				end
			end
			
		until cardOptions.category ~= "numbers" and repeated == false or
			cardOptions.category == "numbers" and repeated == false and sequenceSkipAmount == 1 and 
														randomNumber <= randomNumbers[1] + answerRange and
														randomNumber >= randomNumbers[1] - answerRange or
			cardOptions.category == "numbers" and repeated == false and sequenceSkipAmount > 1 and randomNumber % sequenceSkipAmount == 0 and
														randomNumber <= randomNumbers[1] + (answerRange * sequenceSkipAmount) and
														randomNumber >= randomNumbers[1] - (answerRange * sequenceSkipAmount)
		
		randomNumbers[#randomNumbers+1] = randomNumber
	end
	
	local randomPlace = math.random(numChoices)
	local temp = randomNumbers[randomPlace]
	randomNumbers[randomPlace] = randomNumbers[1]
	randomNumbers[1] = temp
	
	
	
	local scale = scaleCards
	spacing = 20
	row = numChoices
	totalRow = row
	numRows = 1
	
	newCardPositions = nil
	newCardPositions = {}
	if (cardSettingsSpacing) then
		for i = 1, 9 do
			if (i == 1) then
				newCardPositions[#newCardPositions+1] = 0
			else
				newCardPositions[#newCardPositions+1] = newCardPositions[#newCardPositions] + cardSettingsSpacing
			end
		end
	end
	
	-- local tempCardGroup = display.newGroup()
	
	for i = 1, numChoices do
		
		if (cardOptions.category == "numbers") then
			dynamicNumberCard( i, tostring(randomNumbers[1]), scale )
			-- cards[i] =  display.newImageRect("Images/" .. firstImageSet[randomNumbers[1]] .. ".png", 79*scale, 99*scale)
			-- cards[i].sound = gameSounds[ firstImageSet[randomNumbers[1]] ]
			
		else
			cards[i] = display.newImageRect("Images/" .. sequenceCardList[randomNumbers[1]].image .. ".png", 79*scale, 99*scale)
			cards[i].sound = sequenceImageList[randomNumbers[1]].vo
			-- cards[i].sound = sequenceImageList[randomNumbers[1]].image
		end
		
		
		cards[i].id = randomNumbers[1] -- Reference to the index of table
		cards[i].index = i
		-- cards[i].x = i * (cards[i].width+spacing)
		
		if (cardSettingsSpacing) then
			cards[i].x = newCardPositions[(5-row)+(i*2)-1]
		else
			cards[i].x = rowPosition[(5-row)+(i*2)-1]
		end
		cards[i].y = halfH
		cards[i].initY = cards[i].y
		
		-- cards[i]:addEventListener( "touch", checkSequenceAnswer )
		cardGroup:insert(cards[i])
		
		if (cards[i].textGroup) then
			cardGroup:insert(cards[i].textGroup)
			cards[i].textGroup.anchorChildren = true
			cards[i].textGroup.anchorX, cards[i].textGroup.anchorY = 0.5, 0.5
			cards[i].textGroup.x, cards[i].textGroup.y = cards[i].x, cards[i].y
		
			cards[i].textGroup.x = cards[i].x
			cards[i].textGroup.y = cards[i].y
			
			dynamicNumberOffsets(i)
			
		end
		
		cards[i].xImage = display.newImageRect("Images/UI/cardX.png", 59, 50)
		cards[i].xImage.x = cards[i].x
		cards[i].xImage.y = cards[i].y
		cards[i].xImage.alpha = 0
		cardGroup:insert(cards[i].xImage)
		
		table.remove( randomNumbers, 1 )
		table.remove( pattern, 1 )
	end
	
	-- if (version.appStore == "Amazon" and system.getInfo ( "model" ) == "AFTB" or version.appStore == "Amazon FTV") then
		-- Runtime:addEventListener( "onFTVKey", checkSequenceAnswer )
	-- end
	
	
	levelOptions = gameDetails["level" .. level]
	gameOptions = gameLevelDetails
	
	cardOptions = gameOptions.cards
	
	oldCardGroupX = cardGroup.x
	oldCardGroupY = cardGroup.y
	
	cardGroup.anchorChildren = true
	cardGroup.anchorX = 0.5
	cardGroup.anchorY = 0.5
	
	
	newCardGroupX = cardGroup.x
	newCardGroupY = cardGroup.y
	
	cardGroup.x = 1000
	cardGroup:toFront()
	

end


-- If it's questions

function equationCardSetup(i)
	
	cards[i].textGroup = display.newGroup()
	
	
	local cardTextGroups = {}
	
	
	for k = 1, string.len(tostring(equationCardOptions[cards[i].id][1])) do

		cardTextGroups[#cardTextGroups+1] = display.newImageRect("Images/" .. tostring(equationCardOptions[cards[i].id][1]):sub(k, k) .. "Digit.png", 50, 50 )
		cardTextGroups[#cardTextGroups]:setFillColor(64/255,64/255,64/255)
		cardTextGroups[#cardTextGroups].xScale, cardTextGroups[#cardTextGroups].yScale = 0.27, 0.27
		if (cardTextGroups[#cardTextGroups-1]) then
			cardTextGroups[#cardTextGroups].x = cardTextGroups[#cardTextGroups-1].x + 10.5
		end
		cards[i].textGroup:insert( cardTextGroups[#cardTextGroups] )
	end
	
	
	if (questionTwo == "addition") then
		cardTextGroups[#cardTextGroups+1] = display.newImageRect("Images/plus.png", 50, 50 )
	else
		cardTextGroups[#cardTextGroups+1] = display.newImageRect("Images/minus.png", 50, 50 )
	end
	cardTextGroups[#cardTextGroups]:setFillColor(64/255,64/255,64/255)
	cardTextGroups[#cardTextGroups].xScale, cardTextGroups[#cardTextGroups].yScale = 0.27, 0.27
	cardTextGroups[#cardTextGroups].x = cardTextGroups[#cardTextGroups-1].x + 10.5
	cards[i].textGroup:insert( cardTextGroups[#cardTextGroups] )
	
	for k = 1, string.len(tostring(equationCardOptions[cards[i].id][2])) do
	
		cardTextGroups[#cardTextGroups+1] = display.newImageRect("Images/" .. tostring(equationCardOptions[cards[i].id][2]):sub(k, k) .. "Digit.png", 50, 50 )
		cardTextGroups[#cardTextGroups]:setFillColor(64/255,64/255,64/255)
		cardTextGroups[#cardTextGroups].xScale, cardTextGroups[#cardTextGroups].yScale = 0.27, 0.27
		if (k == 1) then
			cardTextGroups[#cardTextGroups].x = cardTextGroups[#cardTextGroups-1].x + 10.5
		else
			cardTextGroups[#cardTextGroups].x = cardTextGroups[#cardTextGroups-1].x + 10.5
		end
		cards[i].textGroup:insert( cardTextGroups[#cardTextGroups] )
	end
	
	cardTextGroups[#cardTextGroups+1] = display.newImageRect("Images/equals.png", 50, 50 )
	cardTextGroups[#cardTextGroups]:setFillColor(64/255,64/255,64/255)
	cardTextGroups[#cardTextGroups].xScale, cardTextGroups[#cardTextGroups].yScale = 0.27, 0.27
	cardTextGroups[#cardTextGroups].x = cardTextGroups[#cardTextGroups-1].x + 10.5
	cards[i].textGroup:insert( cardTextGroups[#cardTextGroups] )
	
	for k = 1, string.len(tostring(equationCardOptions[cards[i].id][3])) do
	
		cardTextGroups[#cardTextGroups+1] = display.newImageRect("Images/" .. tostring(equationCardOptions[cards[i].id][3]):sub(k, k) .. "Digit.png", 50, 50 )
		cardTextGroups[#cardTextGroups]:setFillColor(64/255,64/255,64/255)
		cardTextGroups[#cardTextGroups].xScale, cardTextGroups[#cardTextGroups].yScale = 0.27, 0.27
		if (k == 1) then
			cardTextGroups[#cardTextGroups].x = cardTextGroups[#cardTextGroups-1].x + 10.5
		else
			cardTextGroups[#cardTextGroups].x = cardTextGroups[#cardTextGroups-1].x + 10.5
		end
		cards[i].textGroup:insert( cardTextGroups[#cardTextGroups] )
	end
	
	
	

end

function equationSentences()

	equationCardOptions = {}
	

	if (questionTwo == "addition") then
	
		local randomEquation = { 0, 0, 0 }
		if (startRange < 3) then
			randomEquation[3] = math.random( 3, endRange )
		else
			randomEquation[3] = math.random( startRange, endRange )
		end
		randomEquation[1] = math.random( 1, randomEquation[3]-1 )
		randomEquation[2] = randomEquation[3] - randomEquation[1]
		equationCardOptions[#equationCardOptions+1] = randomEquation
		
		
		local repeated = false
		for i = 1, numChoices-1 do
			local randomEquation = { 0, 0, 0 }
			repeat
				repeated = false
				if (startRange < 3) then
					randomEquation[3] = math.random( 3, endRange )
				else
					randomEquation[3] = math.random( startRange, equationCardOptions[1][3] )
				end
				randomEquation[1] = math.random( 1, randomEquation[3]-1 )
				randomEquation[2] = randomEquation[3] - randomEquation[1]
				
				local incorrectChoice = math.random( 1, 4 )
				if (incorrectChoice == 1) then
					local tempNumber = randomEquation[1]
					randomEquation[1] = randomEquation[3]
					randomEquation[3] = tempNumber
				end
				
				for k = #equationCardOptions, 1, -1 do
					if (equationCardOptions[k][1] == randomEquation[1] and
						equationCardOptions[k][2] == randomEquation[2] and
						equationCardOptions[k][3] == randomEquation[3]) then
						
						repeated = true
						
					end
				end
			until repeated == false
			equationCardOptions[#equationCardOptions+1] = randomEquation
		
		end
		
	elseif (questionTwo == "subtraction") then
	
		local randomEquation = { 0, 0, 0 }
		if (startRange < 3) then
			randomEquation[1] = math.random( 3, endRange )
		else
			randomEquation[1] = math.random( startRange, endRange )
		end
		randomEquation[2] = math.random( 1, randomEquation[1]-1 )
		randomEquation[3] = randomEquation[1] - randomEquation[2]
		equationCardOptions[#equationCardOptions+1] = randomEquation
		
		
		local repeated = false
		for i = 1, numChoices-1 do
			local randomEquation = { 0, 0, 0 }
			repeat
				repeated = false
				if (startRange < 3) then
					randomEquation[1] = math.random( 3, endRange )
				else
					randomEquation[1] = math.random( startRange, equationCardOptions[1][1] )
				end
				randomEquation[2] = math.random( 1, randomEquation[1]-1 )
				randomEquation[3] = randomEquation[1] - randomEquation[2]
				
				local incorrectChoice = math.random( 1, 4 )
				if (incorrectChoice == 1) then
					local tempNumber = randomEquation[1]
					randomEquation[1] = randomEquation[3]
					randomEquation[3] = tempNumber
				end
				
				for k = #equationCardOptions, 1, -1 do
					if (equationCardOptions[k][1] == randomEquation[1] and
						equationCardOptions[k][2] == randomEquation[2] and
						equationCardOptions[k][3] == randomEquation[3]) then
						
						repeated = true
						
					end
				end
			until repeated == false
			equationCardOptions[#equationCardOptions+1] = randomEquation
		
		end
	
	end
	

end

function equationHowMany()


	local answerNumber

	for i = 1, #randomNumbers do
		
		if (randomNumbers[i] == 1) then
		
			local randomImageSet = math.random( 1, #sentenceImages )
			
			answerNumber = i
			
			if (questionTwo == "addition") then
				for j = 1, equationCardOptions[randomNumbers[i]][1] do
					howManyImages[#howManyImages+1] = display.newImageRect("Images/" .. sentenceImages[randomImageSet][1] .. ".png", 58, 58 )
					howManyImages[#howManyImages].x = j * 70
					howManyGroup:insert( howManyImages[#howManyImages] )
				end
			
				for j = equationCardOptions[randomNumbers[i]][1]+1, equationCardOptions[randomNumbers[i]][1]+equationCardOptions[randomNumbers[i]][2] do
					howManyImages[#howManyImages+1] = display.newImageRect("Images/" .. sentenceImages[randomImageSet][2] .. ".png", 58, 58 )
					howManyImages[#howManyImages].x = j * 70
					howManyGroup:insert( howManyImages[#howManyImages] )
				end
			else
				for j = 1, equationCardOptions[randomNumbers[i]][1] do
					howManyImages[#howManyImages+1] = display.newImageRect("Images/" .. sentenceImages[randomImageSet][1] .. ".png", 58, 58 )
					howManyImages[#howManyImages].x = j * 70
					howManyGroup:insert( howManyImages[#howManyImages] )
				end
			
				local tempHowManyImages = #howManyImages
				for j = tempHowManyImages, tempHowManyImages - equationCardOptions[randomNumbers[i]][2]+1, -1 do
					howManyImages[#howManyImages+1] = display.newImageRect("Images/UI/cardX.png", 59, 50 )
					howManyImages[#howManyImages].x = howManyImages[j].x
					howManyGroup:insert( howManyImages[#howManyImages] )
				end
			end
		end
	
	end
	
	
	
	local howManyImagesNum
	local posIncrement = 1
	
	if (questionTwo == "addition") then
	
		howManyImagesNum = equationCardOptions[1][1]+equationCardOptions[1][2]
		
		local position = sentencePositions[howManyImagesNum]
		
		if (howManyImagesNum > 6) then
		
			for i = 1, howManyImagesNum do
				if ( i < ((howManyImagesNum) / 2)+1) then
					howManyImages[i].x = i * position[1]
					howManyImages[i].y = halfH-70
				else
					howManyImages[i].x = (i-howManyImagesNum/2) * position[1]
					howManyImages[i].y = halfH-20
				end
				
				howManyImages[i].xScale = position[2]
				howManyImages[i].yScale = position[2]
			
				posIncrement = posIncrement + 2
			end
			
		end
		
		
	else
	
		howManyImagesNum = equationCardOptions[1][1]
		
		local position = sentencePositions[howManyImagesNum]
		
		if (howManyImagesNum > 6) then
		
			for i = 1, howManyImagesNum do
				if ( i < ((howManyImagesNum) / 2)+1) then
					howManyImages[i].x = i * position[1]
					howManyImages[i].y = halfH-70
				else
					howManyImages[i].x = (i-howManyImagesNum/2) * position[1]
					howManyImages[i].y = halfH-20
				end
				
				howManyImages[i].xScale = position[2]
				howManyImages[i].yScale = position[2]
			
				posIncrement = posIncrement + 2
			end
			
			local tempXImageNum = 1
			for i = howManyImagesNum, howManyImagesNum-equationCardOptions[1][2]+1, -1 do
			
				howManyImages[howManyImagesNum+tempXImageNum].xScale = position[2]
				howManyImages[howManyImagesNum+tempXImageNum].yScale = position[2]
			
				howManyImages[howManyImagesNum+tempXImageNum].x = howManyImages[i].x
				howManyImages[howManyImagesNum+tempXImageNum].y = howManyImages[i].y
			
				tempXImageNum = tempXImageNum + 1
			end
			
		end
		
		
	end

end


function truefalseEquation()

	equationCardOptions = {}

	print(questionTwo)
	print(startRange)
	print(endRange)
	
	if (question == "TrueOrFalse" and questionSign == "+" or 
		question == "Which sign is missing" and signMissingAnswer == "plus") then

		local randomEquation = { 0, 0, 0, 0 }
		if (startRange < 3) then
			randomEquation[3] = math.random( 3, endRange )
		else
			randomEquation[3] = math.random( startRange, endRange )
		end
		repeat
			randomEquation[1] = math.random( 1, randomEquation[3]-1 )
			randomEquation[2] = randomEquation[3] - randomEquation[1]
		until randomEquation[2] <= 5 and questionTwo == "twoEquations" or
				questionTwo ~= "twoEquations"
		
		if (questionTwo == "twoEquations") then
			
			local tempNumber = randomEquation[3]
			
			
			repeat
				-- if (startRange < 3) then
					-- randomEquation[3] = math.random( 3, endRange )
				-- else
					randomEquation[3] = math.random( 1, endRange )
				-- end
				randomEquation[4] = math.random( 1, endRange )
			until randomEquation[3] + randomEquation[4] == tempNumber and randomEquation[4] <= 5
			
		end
		
		if (question == "TrueOrFalse" and trueFalseAnswer == "false") then
			
			if (questionTwo == "twoEquations") then
				local randomNumber = math.random( 1, 4 )
				if (randomNumber == 2 and randomEquation[randomNumber] > 1 or 
					randomNumber == 4 and randomEquation[randomNumber] > 1) then
					
					randomEquation[randomNumber] = randomEquation[randomNumber] - 1
				elseif (randomEquation[randomNumber] > 1 and randomEquation[randomNumber] < endRange) then
					randomEquation[randomNumber] = randomEquation[randomNumber] + 1
				elseif (randomEquation[randomNumber] == 1) then
					randomEquation[randomNumber] = randomEquation[randomNumber] + 1
				elseif (randomEquation[randomNumber] == endRange) then
					randomEquation[randomNumber] = randomEquation[randomNumber] - 1
				end
				
			else
				local tempNumber = randomEquation[1]
				randomEquation[1] = randomEquation[3]
				randomEquation[3] = tempNumber
			end
			
		end
		
		equationCardOptions[#equationCardOptions+1] = randomEquation
	
	elseif (question == "TrueOrFalse" and questionSign == "-" or 
				question == "Which sign is missing" and signMissingAnswer == "minus") then
	
		local randomEquation = { 0, 0, 0, 0 }
		if (startRange < 3) then
			randomEquation[1] = math.random( 3, endRange )
		else
			randomEquation[1] = math.random( startRange, endRange )
		end
		repeat
			randomEquation[2] = math.random( 1, randomEquation[1]-1 )
			randomEquation[3] = randomEquation[1] - randomEquation[2]
		until randomEquation[2] <= 5 and questionTwo == "twoEquations" or
				questionTwo ~= "twoEquations"
		
		if (questionTwo == "twoEquations") then
			
			local tempNumber = randomEquation[3]
			
			repeat
				-- if (startRange < 3) then
					-- randomEquation[3] = math.random( 3, endRange )
				-- else
					randomEquation[3] = math.random( 1, endRange )
				-- end
				randomEquation[4] = math.random( 1, randomEquation[3] )
			until randomEquation[3] - randomEquation[4] == tempNumber and randomEquation[4] <= 5
			
		end
		
		if (question == "TrueOrFalse" and trueFalseAnswer == "false") then
			
			if (questionTwo == "twoEquations") then
				local randomNumber = math.random( 1, 4 )
				if (randomNumber == 2 and randomEquation[randomNumber] > 1 or 
					randomNumber == 4 and randomEquation[randomNumber] > 1) then
					
					randomEquation[randomNumber] = randomEquation[randomNumber] - 1
				elseif (randomEquation[randomNumber] > 1 and randomEquation[randomNumber] < endRange) then
					randomEquation[randomNumber] = randomEquation[randomNumber] + 1
				elseif (randomEquation[randomNumber] == 1) then
					randomEquation[randomNumber] = randomEquation[randomNumber] + 1
				elseif (randomEquation[randomNumber] == endRange) then
					randomEquation[randomNumber] = randomEquation[randomNumber] - 1
				end
				
			else
				local tempNumber = randomEquation[1]
				randomEquation[1] = randomEquation[3]
				randomEquation[3] = tempNumber
			end
			
		end
		
		equationCardOptions[#equationCardOptions+1] = randomEquation
		
	elseif (questionSign == "x") then
	
		local randomEquation = { 0, 0, 0, 0 }
		repeat
			if (startRange < 3) then
				randomEquation[3] = math.random( 3, endRange )
			else
				randomEquation[3] = math.random( startRange, endRange )
			end
			randomEquation[1] = math.random( 1, randomEquation[3]-1 )
			randomEquation[2] = randomEquation[3] / randomEquation[1]
		until randomEquation[3] % randomEquation[1] == 0
		
		if (questionTwo == "twoEquations") then
			
			local tempNumber = randomEquation[3]
			
			repeat
				-- if (startRange < 3) then
					-- randomEquation[3] = math.random( 3, endRange )
				-- else
					randomEquation[3] = math.random( 1, endRange )
				-- end
				randomEquation[4] = math.random( 1, rendRange )
			until randomEquation[3] * randomEquation[4] == tempNumber
			
		end
		
		if (trueFalseAnswer == "false") then
			
			if (questionTwo == "twoEquations") then
				local randomNumber = math.random( 1, 4 )
				if (randomEquation[randomNumber] > 1 and randomEquation[randomNumber] < endRange) then
					randomEquation[randomNumber] = randomEquation[randomNumber] + 1
				elseif (randomEquation[randomNumber] == 1) then
					randomEquation[randomNumber] = randomEquation[randomNumber] + 1
				elseif (randomEquation[randomNumber] == endRange) then
					randomEquation[randomNumber] = randomEquation[randomNumber] - 1
				end
				
			else
				if (randomEquation[1] == 1) then
					local tempNumber = randomEquation[1]
					randomEquation[1] = randomEquation[3]
					randomEquation[3] = tempNumber
				elseif (randomEquation[2] == 1) then
					local tempNumber = randomEquation[2]
					randomEquation[2] = randomEquation[3]
					randomEquation[3] = tempNumber
				else
					local tempNumber = randomEquation[1]
					randomEquation[1] = randomEquation[3]
					randomEquation[3] = tempNumber
				end
			end
			
		end
		
		equationCardOptions[#equationCardOptions+1] = randomEquation
		
	elseif (questionSign == "/") then
	
		local randomEquation = { 0, 0, 0, 0 }
		repeat
			if (startRange < 3) then
				randomEquation[1] = math.random( 3, endRange )
			else
				randomEquation[1] = math.random( startRange, endRange )
			end
			randomEquation[2] = math.random( 1, randomEquation[1]-1 )
			randomEquation[3] = randomEquation[1] / randomEquation[2]
		until randomEquation[1] % randomEquation[2] == 0
		
		
		if (questionTwo == "twoEquations") then
			
			local tempNumber = randomEquation[3]
			
			repeat
				-- if (startRange < 3) then
					-- randomEquation[3] = math.random( 3, endRange )
				-- else
					randomEquation[3] = math.random( 1, endRange )
				-- end
				randomEquation[4] = math.random( 1, randomEquation[3] )
			until randomEquation[3] / randomEquation[4] == tempNumber
			
		end
		
		
		if (trueFalseAnswer == "false") then
			
			if (questionTwo == "twoEquations") then
				local randomNumber = math.random( 1, 4 )
				if (randomEquation[randomNumber] > 1 and randomEquation[randomNumber] < endRange) then
					randomEquation[randomNumber] = randomEquation[randomNumber] + 1
				elseif (randomEquation[randomNumber] == 1) then
					randomEquation[randomNumber] = randomEquation[randomNumber] + 1
				elseif (randomEquation[randomNumber] == endRange) then
					randomEquation[randomNumber] = randomEquation[randomNumber] - 1
				end
				
			else
				if (randomEquation[2] == 1) then
					local tempNumber = randomEquation[1]
					randomEquation[1] = randomEquation[2]
					randomEquation[2] = tempNumber
				elseif (randomEquation[3] == 1) then
					local tempNumber = randomEquation[1]
					randomEquation[1] = randomEquation[3]
					randomEquation[3] = tempNumber
				else
					local tempNumber = randomEquation[1]
					randomEquation[1] = randomEquation[3]
					randomEquation[3] = tempNumber
				end
			end
			
		end
		
		equationCardOptions[#equationCardOptions+1] = randomEquation
	
	end

end

function checkQuestionAnswer( event )
	
	
	local target = event.target
	local keyName = event.keyName
	
	if (target == nil) then
		target = targetCard
	end
        
	if (event.keyName == nil and event.phase == "began" and buttonsActive == true and correctAnswer ~= true) or
		(event.phase == "began" and buttonsActive == true and correctAnswer ~= true) or
		(keyName and event.phase == "down" and buttonsActive == true and correctAnswer ~= true) then
	
		
		if (event.keyName and event.keyName ~= "back" and 
												event.keyName ~= "left" and 
												event.keyName ~= "right" and
												event.keyName ~= "up" and
												event.keyName ~= "down" and
												event.keyName ~= "mediaPlayPause" and 
												event.keyName ~= "buttonZ" and
												event.keyName ~= "buttonX" and
												event.keyName ~= "buttonY" and
												keyName ~= "menu" or
												event.keyName == nil) then
	
			if (myData.isFireTV or myData.isController) then 
				if (question == "Which one is different" and gameOptions.questions.questionType2 == "hidden object" or
					question == "Which item is" or
					question == "Which number is" or
					question == "Which one is a" or
					question == "Which one is an") then
				else
					transition.to( cursor, { time=100, alpha=0 } )
					buttonsActive = false
				end
			end
			buttonsActive = false
			
			if (cardTrans) then
				transition.cancel( cardTrans )
				cardTrans = nil
			end
			cardGroup.x = cardGroup.targetX
			
			
			-- target:removeEventListener( "touch", checkQuestionAnswer ) -- comment out
			-- target:removeEventListener( "key", checkQuestionAnswer )
			-- target:removeEventListener( "onFTVKey", checkQuestionAnswer )
				
		
			local answer = true
			local equationWinCalled = false
			local done = false
			
			local function fixEquationCardPos()

				local pos = 7 - row
				local visibleCard
				for i = 1, totalRow do
					-- if (cards[i].y == cards[i].initY and cards[i].alpha == 1) then
					if (numAnswers == 1 and cards[i].y == cards[i].initY and cards[i].alpha == 1 or
							numAnswers > 1 and cards[i].y < screenEdgeY and cards[i].alpha == 1) then
							
						
						if (cardSettingsSpacing) then
								transition.to( cards[i], { time=100 , x = newCardPositions[pos], transition=easing.outExpo } )
								if (cards[i].textGroup) then
									transition.to( cards[i].textGroup, { time=100 , x = newCardPositions[pos] + cards[i].textGroup.offsetX, transition=easing.outExpo } )
								end
								if (cards[i].shadow) then
									transition.to( cards[i].shadow, { time=100 , x = newCardPositions[pos] + shadowOffsetX, transition=easing.outExpo } )
								end
								transition.to( cards[i].xImage, { time=100 , x = newCardPositions[pos], transition=easing.outExpo } )
							
								if (cards[i].image) then
									transition.to( cards[i].image, { time=100 , x = newCardPositions[pos], transition=easing.outExpo } )
								end
						elseif (cardOptions.rotation and cardOptions.rotation == 90) then
							transition.to( cards[i], { time=100 , x = longRowPosition[pos], transition=easing.outExpo } )
							if (cards[i].shadow) then
								transition.to( cards[i].shadow, { time=100 , x = longRowPosition[pos] + shadowOffsetX, transition=easing.outExpo } )
							end
							transition.to( cards[i].xImage, { time=100 , x = longRowPosition[pos], transition=easing.outExpo } )
						
							if (cards[i].image) then
								transition.to( cards[i].image, { time=100 , x = longRowPosition[pos], transition=easing.outExpo } )
							end
						elseif (question == "Which one is different" and gameOptions.questions.questionType2 == "hidden object" or
									question == "Which item is") then
							transition.to( cards[i], { time=100 , x = rowPosition2[pos], transition=easing.outExpo } )
							if (cards[i].shadow) then
								transition.to( cards[i].shadow, { time=100 , x = rowPosition2[pos] + shadowOffsetX, transition=easing.outExpo } )
							end
							transition.to( cards[i].xImage, { time=100 , x = rowPosition2[pos], transition=easing.outExpo } )
						
							if (cards[i].image) then
								transition.to( cards[i].image, { time=100 , x = rowPosition2[pos], transition=easing.outExpo } )
							end
							
						else
							
							transition.to( cards[i], { time=100 , x = rowPosition[pos], transition=easing.outExpo } )
							if (cards[i].textGroup) then
								transition.to( cards[i].textGroup, { time=100 , x = rowPosition[pos] + cards[i].textGroup.offsetX, transition=easing.outExpo } )
							end
							if (cards[i].shadow) then
								transition.to( cards[i].shadow, { time=100 , x = rowPosition[pos] + shadowOffsetX, transition=easing.outExpo } )
							end
							transition.to( cards[i].xImage, { time=100 , x = rowPosition[pos], transition=easing.outExpo } )
							
							if (cards[i].image) then
								transition.to( cards[i].image, { time=100 , x = rowPosition[pos], transition=easing.outExpo } )
							end
						
						end
						
						pos = pos + 2
							
						visibleCard = i
						
						
					end
				end
				row = row - 1
				
				local function moveCards()
					for i = 1, #cards do
						if (cards[i].alpha == 0) then
							cards[i].x = cards[visibleCard].x
							if (cards[i].textGroup) then
								cards[i].textGroup.x = cards[visibleCard].x + cards[i].textGroup.offsetX
							end
							if (cards[i].shadow) then
								cards[i].shadow.x = cards[visibleCard].x + shadowOffsetX
							end
							if (cards[i].xImage) then
								cards[i].xImage.x = cards[visibleCard].x
							end
						end
					end
				end
				timer.performWithDelay( 105, moveCards )
				
				
				
				done = true
				
				buttonsActiveTimer = timer.performWithDelay( 150, makeButtonsActive )
				
				if (myData.isFireTV or myData.isController) then 
					showCursorTimer = timer.performWithDelay( 110, showCursor )
				end

			end
			
			local function equationCardHop( obj )
				local function equationCardHopTwo( obj )
					local function moveCardToSpot( obj )
					
						local newX, newY = obj:localToContent( 0, 0 )
					
						Particles:newEmitter(explosions,"fireworks", "Images/starParticle.png", 32, 32, 10, newX-13, newY, -4, 4, -16, 6, 252,234,27)--altRgb[1], altRgb[2], altRgb[3])
						if (obj.textGroup) then
							obj.textGroup.alpha = 0
						end
						if (obj.shadow) then
							obj.shadow.alpha = 0
						end
						obj.alpha = 0
						if (obj.image) then
							obj.image.alpha = 0
						end
						
						
						if (equationWinCalled == false) then
							timer.performWithDelay( 0, equationWin )
							equationWinCalled = true
							
							
							if savedData.enableSounds == true then
								playReservedChannel(explodeSound, 15, 0)
							end
						end
						
						
						if (done == false) then
							--fixEquationCardPos()
						end
						
						for i = 1, #cards do
							if (cards[i].textGroup) then
								transition.to( cards[i].textGroup, { time=150 , alpha = 0 } )
							end
							if (cards[i].shadow) then
								transition.to( cards[i].shadow, { time=150 , alpha = 0 } )
							end
						
							transition.to( cards[i], { time=150 , alpha = 0 } )
						
							if (cards[i].image) then
								transition.to( cards[i].image, { time=150 , alpha = 0 } )
							end
						
						end
						
					end
					
					if (obj.textGroup) then
						transition.to( obj.textGroup, { time=150 , y=obj.y + 25 + obj.textGroup.offsetY, transition=easing.inExpo } )
					end
					if (obj.shadow) then
						transition.to( obj.shadow, { time=150 , y=obj.y + 25 + shadowOffsetY, transition=easing.inExpo } )
					end
					transition.to( obj, { time=150 , y=obj.y + 25, transition=easing.inExpo, onComplete=moveCardToSpot } )
				
					if (obj.image) then
						transition.to( obj.image, { time=150 , y=obj.image.y + 25, transition=easing.inExpo } )
					end
					
				end
				
				-- if (obj.textGroup) then
					-- transition.to( obj.textGroup, { time=150 , y=obj.y - 20 + obj.textGroup.offsetY, transition=easing.outExpo} )
				-- end
				-- if (obj.shadow) then
					-- transition.to( obj.shadow, { time=150 , y=obj.y - 20 + shadowOffsetY, transition=easing.outExpo} )
				-- end
				-- transition.to( obj, { time=150 , y=obj.y - 20, transition=easing.outExpo, onComplete=equationCardHopTwo} )
			
				-- if (obj.image) then
					-- transition.to( obj.image, { time=150 , y=obj.y - 20, transition=easing.outExpo} )
				-- end
				
				for i = #cards, 1, -1 do
					if (numAnswers == 1 and cards[i] == obj or
						numAnswers > 1 and cards[i].answer == shapeAnswer) then
						
						if (cards[i].textGroup) then
							transition.to( cards[i].textGroup, { time=150 , y=cards[i].y - 20 + cards[i].textGroup.offsetY, transition=easing.outExpo} )
						end
						if (cards[i].shadow) then
							transition.to( cards[i].shadow, { time=150 , y=cards[i].y - 20 + shadowOffsetY, transition=easing.outExpo} )
						end
						transition.to( cards[i], { time=150 , y=cards[i].y - 20, transition=easing.outExpo, onComplete=equationCardHopTwo} )
					
						if (cards[i].image) then
							transition.to( cards[i].image, { time=150 , y=cards[i].y - 20, transition=easing.outExpo} )
						end
					end
				end
			
				if savedData.enableSounds == true then
					playReservedChannel(cardHopSound, 16, 0)
				end
			end
			
			local function scalePop( obj )
				
				
				if (numAnswers > currentAnswersNumChosen) then
					obj:removeEventListener( "touch", checkQuestionAnswer )
					obj:removeEventListener( "key", checkQuestionAnswer )
					obj:removeEventListener( "onFTVKey", checkQuestionAnswer )
				
				
					local function startCardFloat()
						floaters[#floaters+1] = obj.id
						if (#floaters <= 1) then
							Runtime:removeEventListener( "enterFrame", cardFloat)
							Runtime:addEventListener( "enterFrame", cardFloat)
						end
					end
					timer.performWithDelay( 100, startCardFloat )
				else
					for i = #cards, 1, -1 do
						cards[i]:removeEventListener( "touch", checkQuestionAnswer )
						cards[i]:removeEventListener( "key", checkQuestionAnswer )
						cards[i]:removeEventListener( "onFTVKey", checkQuestionAnswer )
					end
				
					cardGroup:toFront()
				end
			
				
				if savedData.enableSounds == true then
					for i = #cards, 1, -1 do
						-- if (obj == cards[i]) then
							-- playReservedChannel(cards[i].sound, currentCardChannel, 0)
						-- end
						
						if (obj == cards[i] and cards[i].sound ~= nil) then
						
							local tempSayOver100 = false
				
							-- for m = #cards, 1, -1 do
								-- if (question == "Which is" and type(cards[m].sound) ~= "string" and cards[m].sound >= 100) then
									-- tempSayOver100 = true
								-- end
							-- end
						
							-- if (cards[i].sound == "over100") then
								-- local overHundredSound
								-- repeat
									-- overHundredSound = math.random( 1, #overHundredSounds )
								-- until prevOverHundredSound ~= overHundredSound
								-- prevOverHundredSound = overHundredSound
							
								-- playReservedChannel(overHundredSounds[ overHundredSound ], currentCardChannel, 0)
							
							-- else
								-- playReservedChannel(cards[i].sound, currentCardChannel, 0)
							-- end
							
							if (cards[i].sound == 0) then
								playReservedChannel( gameSounds["zero"], 29, 0 )
								
							elseif (type(cards[i].sound) == "string") then
								playReservedChannel( gameSounds[cards[i].sound], currentCardChannel, 0)
								
							elseif (tempSayOver100 == true) then
					
								local overHundredSound
								repeat
									overHundredSound = math.random( 1, #overHundredSounds )
								until prevOverHundredSound ~= overHundredSound
								prevOverHundredSound = overHundredSound
							
								playReservedChannel(overHundredSounds[ overHundredSound ], 29, 0)
						
								
							elseif (cards[i].sound <= 100) then
								playReservedChannel( gameNumSounds[cards[i].sound], 29, 0 )
							else
								local function partFiveAudio()
									local numTemp
									if (cards[i].sound < 110) then
										numTemp = tonumber( tostring(cards[i].sound):sub(3, 3) )
									else
										numTemp = tonumber( tostring(cards[i].sound):sub(2, 3) )
									end
									playReservedChannel(gameNumSounds[ numTemp ], 28, 0)
								end
							
								playReservedChannel(hundredSounds[ tonumber(tostring(cards[i].sound):sub(1, 1)) ], 29, 0)
							
							
								if (questionAudioTimer) then
									timer.cancel( questionAudioTimer )
									questionAudioTimer = nil
								end
								questionAudioTimer = timer.performWithDelay( 900, partFiveAudio )
									
							end
							
							
						end
						
					end
				end
				currentCardChannel = currentCardChannel + 1
				if currentCardChannel > 19 then
					currentCardChannel = 18
				end
				
				
				
				
				if (question == "Which one is different" and gameOptions.questions.questionType2 == "hidden object" or
					question == "Which item is") then
					
					if (obj.shadow) then
						transition.to( obj.shadow, { time=100 , xScale = 1.05, yScale = 1.05, transition=easing.outExpo } )
					end
					if (numAnswers > currentAnswersNumChosen) then
						transition.to( obj, { time=100 , xScale = 1.05, yScale = 1.05, transition=easing.outExpo } )
					else
						transition.to( obj, { time=100 , xScale = 1.05, yScale = 1.05, onComplete = equationCardHop, transition=easing.outExpo } )
					end
					if (obj.image) then
						if (obj.image.xScale < 0) then
							transition.to( obj.image, { time=100 , xScale = -1.05, yScale = 1.05, transition=easing.outExpo } )
						else
							transition.to( obj.image, { time=100 , xScale = 1.05, yScale = 1.05, transition=easing.outExpo } )
						end
					end
				elseif (obj.xScale < 0) then
					if (obj.shadow) then
						transition.to( obj.shadow, { time=100 , xScale = -1.15, yScale = 1.15, transition=easing.outExpo } )
					end
					if (numAnswers > currentAnswersNumChosen) then
						transition.to( obj, { time=100 , xScale = -1.15, yScale = 1.15, transition=easing.outExpo } )
					else
						transition.to( obj, { time=100 , xScale = -1.15, yScale = 1.15, onComplete = equationCardHop, transition=easing.outExpo } )
					end
				
				elseif (question == "Word problem") then
					if (obj.textGroup) then
						transition.to( obj.textGroup, { time=100 , xScale = 1.3, yScale = 1.3, transition=easing.outExpo } )
					end
					if (obj.shadow) then
						transition.to( obj.shadow, { time=100 , xScale = 1, yScale = 1, transition=easing.outExpo } )
					end
					transition.to( obj, { time=100 , xScale = 1.3, yScale = 1.3, onComplete = equationCardHop, transition=easing.outExpo } )
				else
				
					if (obj.textGroup) then
						transition.to( obj.textGroup, { time=100 , xScale = 1.15, yScale = 1.15, transition=easing.outExpo } )
					end
					if (obj.shadow) then
						transition.to( obj.shadow, { time=100 , xScale = 1.15, yScale = 1.15, transition=easing.outExpo } )
					end
					if (numAnswers > currentAnswersNumChosen) then
						transition.to( obj, { time=100 , xScale = 1.15, yScale = 1.15, transition=easing.outExpo } )
					else
						transition.to( obj, { time=100 , xScale = 1.15, yScale = 1.15, onComplete = equationCardHop, transition=easing.outExpo } )
					end
				
				end
				
			end
			
			print("answer 1")
			
			if (questionTwo == "last" or questionTwo == "most" or questionTwo == "more" or questionTwo == "bigger" or questionTwo == "greater" or questionTwo == "greatest") then
				for i = #cards, 1, -1 do
					if (target.id < cards[i].id) then
						answer = false
					end
				end
			elseif (questionTwo == "first" or questionTwo == "least" or questionTwo == "fewer" or questionTwo == "smaller" or questionTwo == "less") then
				for i = #cards, 1, -1 do
					if (target.id > cards[i].id) then
						answer = false
					end
				end
			elseif (question == "How many") then
				if (target.id ~= imageCount) then
					answer = false
				end
			elseif (question == "How many are") then
				if (target.id ~= howManyAnswer) then
					answer = false
				end
			elseif (question == "How many more apples do you need to make") then
				if (imageCount + target.id ~= questionTwo) then
					answer = false
				end
			elseif (question == "How many apples do you need to take away to leave") then
				if (imageCount - target.id ~= questionTwo) then
					answer = false
				end
			elseif (question == "Which one is the same") then
			
				if (target.id ~= whichSameAnswer) then
					answer = false
				end
			elseif (question == "Which one is different" and gameOptions.questions.questionType2 == "hidden object") then

				if (target.id ~= whichDifferentAnswer) then
					answer = false
				end
			elseif (question == "Which one is different" and gameOptions.questions.questionType2 == "category") then
				
				if (target.id ~= whichDifferentCategoryAnswer) then
					answer = false
				end
			
			
			elseif (question == "Which is") then
			
				if (target.id ~= whichIsMoreLessThanAnswer) then
					answer = false
				end
			
			elseif (question == "TrueOrFalse") then
			
				if (target.id ~= trueFalseAnswer) then
					answer = false
				end
			
			elseif (question == "Word problem") then
				
				if (target.id ~= prevWordProblemAnswer) then
					answer = false
				end
			
			elseif (question == "Which one is a" or question == "Which one is an") then
				-- if (shapeAnswer ~= target.id) then
					-- answer = false
				-- end
				
				print("answer")
				print(shapeAnswer)
				print(target.answer)
				
				if (shapeAnswer ~= target.answer) then
					answer = false
				end
			end
			
			if (answer == true) then
				print("correct")
				
				
				currentAnswersNumChosen = currentAnswersNumChosen + 1
				
				if (buttonsActiveTimer) then
					timer.cancel( buttonsActiveTimer )
					buttonsActiveTimer = nil
				end
				if (showCursorTimer) then
					timer.cancel( showCursorTimer )
					showCursorTimer = nil
				end
				if (fixCardsTimer) then
					timer.cancel( fixCardsTimer )
					fixCardsTimer = nil
				end
				
				
				if (numAnswers > currentAnswersNumChosen) then
					target:removeEventListener( "touch", checkQuestionAnswer )
					-- target:removeEventListener( "key", checkQuestionAnswer )
					-- target:removeEventListener( "onFTVKey", checkQuestionAnswer )
				
					
				
					if (myData.isFireTV or myData.isController) then 
						showCursorTimer = timer.performWithDelay( 300, showCursor )
					
					else
						buttonsActiveTimer = timer.performWithDelay( 150, makeButtonsActive )
					end
				else
				
					for i = #cards, 1, -1 do
						cards[i]:removeEventListener( "touch", checkQuestionAnswer )
						-- cards[i]:removeEventListener( "key", checkQuestionAnswer )
						-- cards[i]:removeEventListener( "onFTVKey", checkQuestionAnswer )
					end
					
					if (myData.isController) then
						Runtime:removeEventListener( "key", checkQuestionAnswer )
					elseif (myData.isFireTV) then
						Runtime:removeEventListener( "onFTVKey", checkQuestionAnswer )
					end
					
					correctAnswer = true
				
				end
				
				
				if savedData.enableSounds == true then
					playReservedChannel(flipSound, 14, 0)
				end
				
				audio.stop( 11 )
				if (questionAudioTimer) then
					timer.cancel( questionAudioTimer )
					questionAudioTimer = nil
				end
				
				
				if (cards[target.index] and cards[target.index].shadow == nil) then
					cards[target.index].shadow = display.newImageRect("Images/cardShadow.png", 92*scaleCards, 110*scaleCards)
					cards[target.index].shadow.x = cards[target.index].x + shadowOffsetX
					cards[target.index].shadow.y = cards[target.index].y + shadowOffsetY
					cards[target.index].shadow.alpha = .75
					cards[target.index].shadow.rotation = cards[target.index].rotation
					cardGroup[1]:insert( cards[target.index].shadow )
					
					cards[target.index].shadow:toFront()
					cards[target.index]:toFront()
					if (cards[target.index].textGroup) then
						cards[target.index].textGroup:toFront()
					end
					if (cards[target.index].image) then
						cards[target.index].image:toFront()
					end
				end
				
				
				if (question == "Which one is different" and gameOptions.questions.questionType2 == "hidden object" or
					question == "Which item is" or
					question == "Which number is" or
					question == "Which one is a" or
					question == "Which one is an") then
					
					transition.to( cursor, { time=100, alpha=0 } )
					
					if (target.shadow) then
						transition.to(target.shadow, {time=100, xScale = 1.15, yScale = 1.15, transition=easing.inExpo} )
					end
					transition.to(target, {time=100, xScale = 1.15, yScale = 1.15, onComplete = scalePop, transition=easing.inExpo} )
				
					if (target.image) then
						
						if (target.image.xScale < 0) then
							transition.to(target.image, {time=100, xScale = -1.15, yScale = 1.15, transition=easing.inExpo} )
						else
							transition.to(target.image, {time=100, xScale = 1.15, yScale = 1.15, transition=easing.inExpo} )
						end
						
					end
				
				elseif (target.xScale < 0) then
					if (target.shadow) then
						transition.to(target.shadow, {time=100, xScale = -1.5, yScale = 1.5, transition=easing.inExpo} )
					end
					transition.to(target, {time=100, xScale = -1.5, yScale = 1.5, onComplete = scalePop, transition=easing.inExpo} )
				
				elseif (question == "Word problem") then
					if (target.textGroup) then
						transition.to(target.textGroup, {time=100, xScale = 1.5, yScale = 1.5, transition=easing.inExpo} )
					end
					if (target.shadow) then
						transition.to(target.shadow, {time=100, xScale = 1, yScale = 1, transition=easing.inExpo} )
					end
					transition.to(target, {time=100, xScale = 1.5, yScale = 1.5, onComplete = scalePop, transition=easing.inExpo} )
				else
				
					if (target.textGroup) then
						transition.to(target.textGroup, {time=100, xScale = 1.5, yScale = 1.5, transition=easing.inExpo} )
					end
					if (target.shadow) then
						transition.to(target.shadow, {time=100, xScale = 1.5, yScale = 1.5, transition=easing.inExpo} )
					end
					transition.to(target, {time=100, xScale = 1.5, yScale = 1.5, onComplete = scalePop, transition=easing.inExpo} )
				end
			
			else
			
				if (question == "Which one is different" and gameOptions.questions.questionType2 == "hidden object" or
					question == "Which item is" or
					question == "Which one is a" or 
					question == "Which one is an" or
					questionTwo == "last" or questionTwo == "most" or questionTwo == "more" or questionTwo == "bigger" or questionTwo == "greater" or questionTwo == "greatest" or
					questionTwo == "first" or questionTwo == "least" or questionTwo == "fewer" or questionTwo == "smaller" or questionTwo == "less") then
					
					buttonsActive = true
					
				else
				
					target:removeEventListener( "touch", checkQuestionAnswer )
					-- target:removeEventListener( "key", checkQuestionAnswer )
					-- target:removeEventListener( "onFTVKey", checkQuestionAnswer )
				
					local function setCardsAlpha( obj )
					
						target.alpha = 0
						target.rotation = 0
						target.y = target.initY
						if (target.textGroup) then
							target.textGroup.alpha = 0
							target.textGroup.rotation = 0
							target.textGroup.y = target.textGroup.initY
						end
						if (target.shadow) then
							target.shadow.alpha = 0
							target.shadow.rotation = 0
							target.shadow.y = target.shadow.initY
						end
						target.xImage.alpha = 0
						target.xImage.rotation = 0
						target.xImage.y = target.xImage.initY
					
					end
				
					print("wrong")
					local randomRotation = math.random(-400,400)
					target.initY = target.y
					transition.to( target, { time=500 , rotation = randomRotation, alpha=1, y=800, transition=easing.inExpo} )
					
					if (target.textGroup) then
						target.textGroup.initY = target.textGroup.y
						transition.to( target.textGroup, { time=500 , rotation = randomRotation, alpha=1, y=800, transition=easing.inExpo} )
					end
					if (target.shadow) then
						target.shadow.initY = target.shadow.y
						transition.to( target.shadow, { time=500 , rotation = randomRotation, alpha=1, y=800, transition=easing.inExpo} )
					end
					target.xImage.alpha = 1
					target.xImage.initY = target.xImage.y
					transition.to( target.xImage, { time=500 , rotation = randomRotation, alpha=1, y=800, transition=easing.inExpo, onComplete = setCardsAlpha } )
					
					fixCardsTimer = timer.performWithDelay( 550, fixEquationCardPos )
				
				end
				
				if savedData.enableSounds == true then
					for i = #cards, 1, -1 do
						if (target == cards[i]) then
							playReservedChannel(wrongSound, currentWrongChannel, 0)
						end
					end
				end
				currentWrongChannel = currentWrongChannel + 1
				if currentWrongChannel > 20 then
					currentWrongChannel = 19
				end
			end
		
		end
		
	end
	
end

function randomCards()

	local levelOptions = gameDetails["level" .. level]
	local gameOptions = gameLevelDetails
	local questionOptions = gameOptions.questions
	local cardOptions = gameOptions.cards
	local equationOptions = gameOptions.equation
	
	local answerRange = cardOptions.answerRange
	

	randomNumbers = {}
	
	local tempChoices = numChoices
	
	if (question == "How many more apples do you need to make") then
		local randomOne = math.random( 1, 100 )
		
		repeat
			imageCount = math.random(1,endRange-1)
		until randomOne == 1 and questionTwo - imageCount > 0 and questionTwo - imageCount < 11 or
				questionTwo == 2 and questionTwo - imageCount > 0 and questionTwo - imageCount < 11 or
				questionTwo - imageCount > 0 and questionTwo - imageCount < 11 and imageCount ~= 1
		randomNumbers[#randomNumbers+1] = questionTwo - imageCount
		tempChoices = tempChoices - 1
		
	elseif (question == "How many apples do you need to take away to leave") then
		local randomOne = math.random( 1, 10 )
	
	
		repeat
			imageCount = math.random(2,endRange)
		until randomOne == 1 and imageCount - questionTwo > 0 and imageCount - questionTwo < 11 or
				questionTwo == endRange-1 and imageCount - questionTwo > 0 and imageCount - questionTwo < 11 or
				imageCount - questionTwo > 1 and imageCount - questionTwo < 11
		
		randomNumbers[#randomNumbers+1] = imageCount - questionTwo
		tempChoices = tempChoices - 1
		
	end
	
	if (question == "Which one is a" or question == "Which one is an") then
		-- randomNumbers[#randomNumbers+1] = shapeAnswer
		-- tempChoices = tempChoices - 1
		
		for i = 1, numAnswers do
			randomNumbers[#randomNumbers+1] = shapeAnswer
			tempChoices = tempChoices - 1
		end
	end
	
	if (question == "How many") then
	
		randomNumbers[#randomNumbers+1] = imageCount
		tempChoices = tempChoices - 1
	end
	
	if (question == "How many are") then
	elseif (question == "How many" and groupSkip ~= 1 and groupSkip ~= 2) then
	
		for i = 1, tempChoices do
			repeat 
				local repeated = false
				
				randomNumber = math.random(startRange, endRange)
				-- if (question == "How many more apples do you need to make") then
					-- randomNumber = math.random( 1, 4 )
				-- elseif (question == "How many apples do you need to take away to leave") then
					-- randomNumber = math.random( 1, 4 )
				-- end
				
				for i = 1, #randomNumbers do
					if (randomNumbers[i] == randomNumber) then
						repeated = true
					end
				end
				
			until repeated == false and randomNumber % groupSkip == 0
			randomNumbers[#randomNumbers+1] = randomNumber
		end
		
		
		
	elseif (question == "How many more apples do you need to make" or 
				question == "How many apples do you need to take away to leave") then
				
		for i = 1, tempChoices do
			repeat 
				local repeated = false
				
				repeat
					-- if (randomNumbers[1] == 1 and answerRange == 1) then
						-- randomNumber = math.random(0, randomNumbers[1]+answerRange)
					-- else
						randomNumber = math.random(randomNumbers[1] - answerRange, randomNumbers[1]+answerRange)
					-- end
				until randomNumber > 0 and randomNumber <= 10
				for i = 1, #randomNumbers do
					if (randomNumbers[i] == randomNumber) then
						repeated = true
					end
				end
				
			until repeated == false
			randomNumbers[#randomNumbers+1] = randomNumber
		end
		
	elseif (question == "Which item is") then
			
		-- randomNumbers[#randomNumbers+1] = 1
		-- randomNumbers[#randomNumbers+1] = 2
		
		for i = 1, tempChoices do
			randomNumbers[#randomNumbers+1] = i
		end
		
		if (questionTwo == "bigger") then
			whichItemIsAnswer = randomNumbers[#randomNumbers]
		else
			whichItemIsAnswer = 1
		end
		
		biggerSmallerCategory = biggerSmallerCategory + 1
		if (biggerSmallerCategory > #biggerSmaller) then
			biggerSmallerCategory = 1
		end
		
	elseif (question == "Which one is the same") then
		
		local choicesWhichGame = tempChoices
		repeat
			tempChoices = choicesWhichGame
			for i = #randomNumbers, 1, -1 do
				randomNumbers[i] = nil
				table.remove( randomNumbers, i )
			end
		
			randomCategory = math.random( 1, #whichSameSets.image )
			local randomNumber = math.random( 1, 2 )
			randomNumbers[#randomNumbers+1] = randomNumber
			tempChoices = tempChoices - 1
			whichSameAnswer = randomNumber
		
			if (randomNumber == 1) then
				randomNumber = 2
			else
				randomNumber = 1
			end
		
			for i = 1, tempChoices do
				randomNumbers[#randomNumbers+1] = randomNumber
			end
		until prevWhichSameAnswer ~= whichSameAnswer
		
		prevWhichSameAnswer = whichSameAnswer
		
	elseif (question == "Which one is different" and gameOptions.questions.questionType2 == "hidden object") then
	
		if (randomCategory == 0) then
			randomCategory = math.random( 1, #whichDifferentHSets )
		else
			randomCategory = randomCategory + 1
			
			if (randomCategory > #whichDifferentHSets) then
				randomCategory = 1
			end
		end
	
		local choicesWhichGame = tempChoices
		repeat
			tempChoices = choicesWhichGame
			for i = #randomNumbers, 1, -1 do
				randomNumbers[i] = nil
				table.remove( randomNumbers, i )
			end
	
			-- randomCategory = math.random( 1, #whichDifferentHSets )
			local randomNumber = math.random( 1, 2 )
			randomNumbers[#randomNumbers+1] = randomNumber
			tempChoices = tempChoices - 1
			whichDifferentAnswer = randomNumber
		
			if (randomNumber == 1) then
				randomNumber = 2
			else
				randomNumber = 1
			end
		
			for i = 1, tempChoices do
				randomNumbers[#randomNumbers+1] = randomNumber
			end
		until prevWhichDifferentAnswer ~= whichDifferentAnswer
		
		prevWhichDifferentAnswer = whichDifferentAnswer
		
	elseif (question == "Which one is different" and gameOptions.questions.questionType2 == "category") then
		
		local choicesWhichGame = tempChoices
		repeat
			tempChoices = choicesWhichGame
			for i = #randomNumbers, 1, -1 do
				randomNumbers[i] = nil
				table.remove( randomNumbers, i )
			end
		
			randomCategory = math.random( 1, #whichDifferentCSets )
			
			randomSet1 = math.random( 1, #whichDifferentCSets[randomCategory] )
			repeat
				randomSet2 = math.random( 1, #whichDifferentCSets[randomCategory] )
			until randomSet2 ~= randomSet1
			
			
			local randomNumber = math.random( 1, #whichDifferentCSets[randomCategory][randomSet1] )
			randomNumber = whichDifferentCSets[randomCategory][randomSet1][randomNumber]
			randomNumbers[#randomNumbers+1] = randomNumber
			whichDifferentCategoryAnswer = randomNumber
			tempChoices = tempChoices - 1
			
			for i = 1, tempChoices do
			
				repeat
					local repeated = false
					randomNumber = math.random( 1, #whichDifferentCSets[randomCategory][randomSet2] )
					randomNumber = whichDifferentCSets[randomCategory][randomSet2][randomNumber]
					for i = #randomNumbers, 1, -1 do
					
						if (randomNumbers[i] == randomNumber) then
							repeated = true
						end
					end
				until repeated == false
				
				randomNumbers[#randomNumbers+1] = randomNumber
			end
			
		until prevWhichDifferentCAnswer ~= whichDifferentCategoryAnswer
		
		prevWhichDifferentCAnswer = whichDifferentCategoryAnswer
		
	elseif (question == "Which is") then
	
		randomNumbers[#randomNumbers+1] = whichIsMoreLessThanAnswer
		tempChoices =  tempChoices - 1
		
		
		print("test")
		print(whichIsSecondNum) -- 2
		print(tempChoices) -- 3
		print(randomNumbers[1]) -- 1
		print(questionOptions.placeMatch) -- 0
		
		for i = 1, tempChoices do
			repeat 
				local repeated = false
				
				-- randomNumber = math.random(whichIsMoreLessThanAnswer-(tempChoices*groupSkip), whichIsMoreLessThanAnswer+(tempChoices*groupSkip))
				randomNumber = math.random(1, 1000)
				for i = 1, #randomNumbers do
					if (randomNumbers[i] == randomNumber or randomNumber == whichIsSecondNum) then
						repeated = true
					end
				end
				
			until repeated == false and
					randomNumber <= randomNumbers[1] + answerRange and randomNumber >= randomNumbers[1] - answerRange and questionOptions.placeMatch == 0 or
				repeated == false and 
					randomNumber <= randomNumbers[1] + (questionOptions.placeMatch * tempChoices) and randomNumber >= randomNumbers[1] - (questionOptions.placeMatch * tempChoices) and questionOptions.placeMatch ~= 0 and
					math.abs(randomNumber - randomNumbers[1]) % questionOptions.placeMatch == 0
			
			randomNumbers[#randomNumbers+1] = randomNumber
			
		end
	
	
	elseif (question == "TrueOrFalse") then
	
		randomNumbers[#randomNumbers+1] = "true"
		randomNumbers[#randomNumbers+1] = "false"
		
		local randomAnswerChoice = math.random( 1, 2 )
		if (randomAnswerChoice == 1) then
			trueFalseAnswer = "true"
		else
			trueFalseAnswer = "false"
		end
	
	
	elseif (question == "Word problem") then
	
		if (numOrGroup == "numbers") then
			randomNumbers[#randomNumbers+1] = prevWordProblemAnswer
			
			for i = 1, tempChoices-1 do
				repeat 
					local repeated = false
					
					randomNumber = math.random(1,100)
					for i = 1, #randomNumbers do
						if (randomNumbers[i] == randomNumber) then
							repeated = true
						end
					end
					
				until repeated == false and randomNumber >= prevWordProblemAnswer - 3 and randomNumber <= prevWordProblemAnswer + 3
				randomNumbers[#randomNumbers+1] = randomNumber
			end
			
		else
		
			if (questionTwo == "addition") then
				prevWordProblemAnswer = "add"
				randomNumbers[#randomNumbers+1] = prevWordProblemAnswer
				randomNumbers[#randomNumbers+1] = "subtract"
			else
				prevWordProblemAnswer = "subtract"
				randomNumbers[#randomNumbers+1] = prevWordProblemAnswer
				randomNumbers[#randomNumbers+1] = "add"
			end
			
			
		end
	
	else
	
	print("Test 12")
	print(tempChoices)
	print(startRange)
	print(endRange)
	print(answerRange)
	print(#randomNumbers)
	
		for i = 1, tempChoices do
			repeat 
				local repeated = false
				
				if (randomNumbers[1] == nil and questionTwo == "most" or 
					randomNumbers[1] == nil and questionTwo == "more" or 
					randomNumbers[1] == nil and questionTwo == "first" or 
					randomNumbers[1] == nil and questionTwo == "greater") then
				
					randomNumber = math.random(startRange + (tempChoices), endRange)
					
				elseif (randomNumbers[1] == nil and questionTwo == "least" or 
						randomNumbers[1] == nil and questionTwo == "fewer" or 
						randomNumbers[1] == nil and questionTwo == "last") then
				
					randomNumber = math.random(startRange, endRange - (tempChoices))
				
				elseif (question == "How many") then
				
					randomNumber = math.random(1, 1000)
				else
					randomNumber = math.random(startRange, endRange)
				
				end
				-- if (question == "How many more apples do you need to make") then
					-- randomNumber = math.random( 1, 4 )
				-- elseif (question == "How many apples do you need to take away to leave") then
					-- randomNumber = math.random( 1, 4 )
				-- end
				
				for i = 1, #randomNumbers do
					if (randomNumbers[i] == randomNumber) then
						repeated = true
					end
				end
				
			until repeated == false and randomNumbers[1] == nil or
				question ~= "How many" and repeated == false and randomNumbers[1] and 
										randomNumbers[1] - answerRange <= randomNumber and randomNumbers[1] + answerRange >= randomNumber or
				question == "How many" and repeated == false and questionOptions.placeMatch == nil and randomNumbers[1] and 
										randomNumbers[1] - answerRange <= randomNumber and randomNumbers[1] + answerRange >= randomNumber or
				question == "How many" and repeated == false and questionOptions.placeMatch and questionOptions.placeMatch == 0 and randomNumbers[1] and 
										randomNumbers[1] - answerRange <= randomNumber and randomNumbers[1] + answerRange >= randomNumber or
				question == "How many" and repeated == false and questionOptions.placeMatch and questionOptions.placeMatch ~= 0 and randomNumber % questionOptions.placeMatch == 0 and randomNumbers[1] and 
										randomNumbers[1] - (answerRange * questionOptions.placeMatch) <= randomNumber and randomNumbers[1] + (answerRange * questionOptions.placeMatch) >= randomNumber
			
			
			print(randomNumber)
			randomNumbers[#randomNumbers+1] = randomNumber
		end
	end
	
	
	print("Test 13")
	
	
	if (question == "How many" or 
		question == "How many are" and curGame % 2 ~= 0 or
		question == "How many more apples do you need to make" or
		question == "How many apples do you need to take away to leave") then
		
		howManyAreNum = { 0, 0, 0, 0, 0, 0, 0 }
	
		local randomPlace = math.random(numChoices)
		local temp = randomNumbers[randomPlace]
		randomNumbers[randomPlace] = randomNumbers[1]
		randomNumbers[1] = temp
		
		-- local details = levelDetails["level" .. level]
		local detailsBG = gameOptions.grayBGY
		
		-- if (imagesScattered == false) then
			-- howManyBackground = display.newImageRect("Images/UI/messageBG.png", 700, 80 )
		-- else
		-- if (curGame%2 ~= 0) then
			howManyBackground = display.newImageRect("Images/UI/messageBG.png", 1000, 110 )
		--end
		-- end
		howManyBackground.x = -1000
		howManyBackground.y = detailsBG
		
		howManyGroup = display.newGroup()
		howManyImages = {}
		
		local posIncrement = 3
		
		print("how many") 
		print(imageCount/groupSkip)
		print(imageCount)
		
		for i = 1, imageCount/groupSkip do
		
			if (imagesScattered == false) then
			
				local position = howManyPositions[imageCount]
			
				if ( i < ((imageCount/groupSkip) / 2)+1) then
					if ( question == "How many") then
						if (groupSkip == 1) then
							howManyImages[#howManyImages+1] = display.newImageRect("Images/" .. questionTwo .. ".png", 58, 58 )
						elseif (groupSkip == 2) then
							howManyImages[#howManyImages+1] = display.newImageRect("Images/" .. howManyGroupList[randomGroupImage].image .. ".png", 58, 58 )
						elseif (groupSkip == 5) then
							howManyImages[#howManyImages+1] = display.newImageRect("Images/" .. howManyGroupList[randomGroupImage].image .. ".png", 58, 58 )
						elseif (groupSkip == 10) then
							howManyImages[#howManyImages+1] = display.newImageRect("Images/" .. howManyGroupList[randomGroupImage].image .. ".png", 58, 58 )
							
						end
					elseif (question == "How many are") then
					
						if (questionOptions.showYellow == false and questionOptions.showGreen == true) then
							local randomColor = math.random( 0, 2 )
							local randomShape = math.random( 0, 2 )
							
							howManyImages[#howManyImages+1] = display.newImageRect("Images/" .. howManyAreList[((randomColor*3)+1) + randomShape] .. ".png", 68, 68 )

							howManyAreNum[randomColor+1] = howManyAreNum[randomColor+1] + 1
							howManyAreNum[randomShape+4] = howManyAreNum[randomShape+4] + 1
						
						elseif (questionOptions.showYellow == false) then
							local randomColor = math.random( 0, 1 )
							local randomShape = math.random( 0, 2 )
							
							howManyImages[#howManyImages+1] = display.newImageRect("Images/" .. howManyAreListAlt[((randomColor*3)+1) + randomShape] .. ".png", 68, 68 )

							howManyAreNum[randomColor+1] = howManyAreNum[randomColor+1] + 1
							howManyAreNum[randomShape+3] = howManyAreNum[randomShape+3] + 1
						else
							local randomColor = math.random( 0, 3 )
							local randomShape = math.random( 0, 2 )
							
							howManyImages[#howManyImages+1] = display.newImageRect("Images/" .. howManyAreListAlt[((randomColor*3)+1) + randomShape] .. ".png", 68, 68 )

							howManyAreNum[randomColor+1] = howManyAreNum[randomColor+1] + 1
							howManyAreNum[randomShape+5] = howManyAreNum[randomShape+5] + 1
						end
					else
						howManyImages[#howManyImages+1] = display.newImageRect("Images/" .. appleGameImage .. ".png", 58, 58 )
					end
					howManyImages[#howManyImages].x = i * position[1]
					howManyImages[#howManyImages].y = halfH-70
					howManyGroup:insert( howManyImages[#howManyImages] )
				else
					if ( question == "How many") then
						howManyImages[#howManyImages+1] = display.newImageRect("Images/" .. questionTwo .. ".png", 58, 58 )
					elseif (question == "How many are") then
						
						if (questionOptions.showYellow == false and questionOptions.showGreen == true) then
							local randomColor = math.random( 0, 2 )
							local randomShape = math.random( 0, 2 )
							
							howManyImages[#howManyImages+1] = display.newImageRect("Images/" .. howManyAreList[((randomColor*3)+1) + randomShape] .. ".png", 68, 68 )
						
							howManyAreNum[randomColor+1] = howManyAreNum[randomColor+1] + 1
							howManyAreNum[randomShape+4] = howManyAreNum[randomShape+4] + 1
						elseif (questionOptions.showYellow == false) then
							local randomColor = math.random( 0, 1 )
							local randomShape = math.random( 0, 2 )
							
							howManyImages[#howManyImages+1] = display.newImageRect("Images/" .. howManyAreListAlt[((randomColor*3)+1) + randomShape] .. ".png", 68, 68 )
						
							howManyAreNum[randomColor+1] = howManyAreNum[randomColor+1] + 1
							howManyAreNum[randomShape+3] = howManyAreNum[randomShape+3] + 1
						else
							local randomColor = math.random( 0, 3 )
							local randomShape = math.random( 0, 2 )
							
							howManyImages[#howManyImages+1] = display.newImageRect("Images/" .. howManyAreListAlt[((randomColor*3)+1) + randomShape] .. ".png", 68, 68 )
						
							howManyAreNum[randomColor+1] = howManyAreNum[randomColor+1] + 1
							howManyAreNum[randomShape+5] = howManyAreNum[randomShape+5] + 1
						end
					else
						howManyImages[#howManyImages+1] = display.newImageRect("Images/" .. appleGameImage .. ".png", 58, 58 )
					end
					howManyImages[#howManyImages].x = (i-imageCount/2) * position[1]
					howManyImages[#howManyImages].y = halfH-20
					howManyGroup:insert( howManyImages[#howManyImages] )
				end
				
				
				howManyImages[#howManyImages].xScale = position[2]
				howManyImages[#howManyImages].yScale = position[2]
				
			else
			
			
					if ( question == "How many") then
						if (groupSkip == 1) then
							howManyImages[#howManyImages+1] = display.newImageRect("Images/" .. questionTwo .. ".png", 58, 58 )
						elseif (groupSkip == 2) then
							howManyImages[#howManyImages+1] = display.newImageRect("Images/" .. howManyGroupList[randomGroupImage].image .. ".png", 58, 58 )
						elseif (groupSkip == 5) then
							howManyImages[#howManyImages+1] = display.newImageRect("Images/" .. howManyGroupList[randomGroupImage].image .. ".png", 58, 58 )
						elseif (groupSkip == 10) then
							howManyImages[#howManyImages+1] = display.newImageRect("Images/" .. howManyGroupList[randomGroupImage].image .. ".png", 58, 58 )
							
						end
					elseif (question == "How many are") then
					
						if (questionOptions.showYellow == false and questionOptions.showGreen == true) then
							local randomColor = math.random( 0, 2 )
							local randomShape = math.random( 0, 2 )
							
							howManyImages[#howManyImages+1] = display.newImageRect("Images/" .. howManyAreList[((randomColor*3)+1) + randomShape] .. ".png", 68, 68 )
						
							howManyAreNum[randomColor+1] = howManyAreNum[randomColor+1] + 1
							howManyAreNum[randomShape+4] = howManyAreNum[randomShape+4] + 1
							
						elseif (questionOptions.showYellow == false) then
						
							local randomColor = math.random( 0, 1 )
							local randomShape = math.random( 0, 2 )
							
							howManyImages[#howManyImages+1] = display.newImageRect("Images/" .. howManyAreListAlt[((randomColor*3)+1) + randomShape] .. ".png", 68, 68 )
						
							howManyAreNum[randomColor+1] = howManyAreNum[randomColor+1] + 1
							howManyAreNum[randomShape+3] = howManyAreNum[randomShape+3] + 1
							
						else
							local randomColor = math.random( 0, 3 )
							local randomShape = math.random( 0, 2 )
							
							howManyImages[#howManyImages+1] = display.newImageRect("Images/" .. howManyAreListAlt[((randomColor*3)+1) + randomShape] .. ".png", 68, 68 )
						
							howManyAreNum[randomColor+1] = howManyAreNum[randomColor+1] + 1
							howManyAreNum[randomShape+5] = howManyAreNum[randomShape+5] + 1
						end
						
					else
						howManyImages[#howManyImages+1] = display.newImageRect("Images/" .. appleGameImage .. ".png", 58, 58 )
					end
					
					local position
					if (groupSkip > 1) then
						position = howManyGroupPositions[imageCount/groupSkip]
					else
						position = howManyPositions[imageCount/groupSkip]
					end
					
					howManyImages[#howManyImages].x = position[posIncrement]
					howManyImages[#howManyImages].y = position[posIncrement+1]
					
					howManyImages[#howManyImages].xScale = position[2]
					howManyImages[#howManyImages].yScale = position[2]
					
					howManyGroup:insert( howManyImages[#howManyImages] )
					
					posIncrement = posIncrement + 2
				
			end
			
		end
		
		--howManyGroup:setReferencePoint(display.CenterReferencePoint) -- commented out for graphics 2.0 and replaced with:
        howManyGroup.anchorChildren = true
		howManyGroup.anchorX = 0.5
        howManyGroup.anchorY = 0.5
		
		howManyGroup.x = 1000
		howManyGroup.y = detailsBG
		
	end
	
	if (question == "TrueOrFalse" or question == "Which sign is missing") then
	
		
		local detailsBG = gameOptions.grayBGY
	
		howManyBackground = display.newImageRect("Images/UI/messageBG.png", 1000, 110 )
		howManyBackground.x = -1000
		howManyBackground.y = detailsBG
		
		howManyGroup = display.newGroup()
		howManyImages = {}
		
		
		truefalseEquation()
		print(equationCardOptions)
		print(equationCardOptions[1])
		
		local randomPosition = math.random( 1, 2 )
		
		if (randomPosition == 1) then
			for i = 1, string.len(tostring(equationCardOptions[1][1])) do
			
				howManyImages[#howManyImages+1] = display.newImageRect("Images/" .. tostring(equationCardOptions[1][1]):sub(i, i) .. "Digit.png", 50, 50 )
				howManyImages[#howManyImages]:setFillColor(255/255,254/255,240/255)
				
				if (howManyImages[#howManyImages-1]) then
					howManyImages[#howManyImages].x = howManyImages[#howManyImages-1].x + 33
				end
				howManyGroup:insert( howManyImages[#howManyImages] )
			end
			
			
			if (question == "Which sign is missing") then
				howManyImages[#howManyImages+1] = display.newImageRect("Images/UI/blankCard.png", 65, 79 )
			elseif (questionSign == "-") then
				howManyImages[#howManyImages+1] = display.newImageRect("Images/minus.png", 50, 50 )
			elseif (questionSign == "+") then
				howManyImages[#howManyImages+1] = display.newImageRect("Images/plus.png", 50, 50 )
			elseif (questionSign == "x") then
				howManyImages[#howManyImages+1] = display.newImageRect("Images/multiply.png", 50, 50 )
			elseif (questionSign == "/") then
				howManyImages[#howManyImages+1] = display.newImageRect("Images/divide.png", 50, 50 )
			end
			howManyImages[#howManyImages]:setFillColor(255/255,254/255,240/255)
			
			if (question == "Which sign is missing") then
				howManyImages[#howManyImages].x = howManyImages[#howManyImages-1].x + 65
				howManyImages[#howManyImages].id = "?"
			else
				howManyImages[#howManyImages].x = howManyImages[#howManyImages-1].x + 45
			end
			howManyGroup:insert( howManyImages[#howManyImages] )
			
			for i = 1, string.len(tostring(equationCardOptions[1][2])) do
			
				howManyImages[#howManyImages+1] = display.newImageRect("Images/" .. tostring(equationCardOptions[1][2]):sub(i, i) .. "Digit.png", 50, 50 )
				howManyImages[#howManyImages]:setFillColor(255/255,254/255,240/255)
				
				if (i == 1) then
					if (question == "Which sign is missing") then
						howManyImages[#howManyImages].x = howManyImages[#howManyImages-1].x + 65
						howManyImages[#howManyImages].id = "?"
					else
						howManyImages[#howManyImages].x = howManyImages[#howManyImages-1].x + 45
					end
				else
					howManyImages[#howManyImages].x = howManyImages[#howManyImages-1].x + 33
				end
				howManyGroup:insert( howManyImages[#howManyImages] )
			end
			
			howManyImages[#howManyImages+1] = display.newImageRect("Images/equals.png", 50, 50 )
			howManyImages[#howManyImages]:setFillColor(255/255,254/255,240/255)
			howManyImages[#howManyImages].x = howManyImages[#howManyImages-1].x + 45
			howManyGroup:insert( howManyImages[#howManyImages] )
			
			for i = 1, string.len(tostring(equationCardOptions[1][3])) do
			
				howManyImages[#howManyImages+1] = display.newImageRect("Images/" .. tostring(equationCardOptions[1][3]):sub(i, i) .. "Digit.png", 50, 50 )
				howManyImages[#howManyImages]:setFillColor(255/255,254/255,240/255)
				
				if (i == 1) then
					howManyImages[#howManyImages].x = howManyImages[#howManyImages-1].x + 45
				else
					howManyImages[#howManyImages].x = howManyImages[#howManyImages-1].x + 33
				end
				howManyGroup:insert( howManyImages[#howManyImages] )
			end
			
			if (questionTwo == "twoEquations") then
			
				if (questionSign == "-") then
					howManyImages[#howManyImages+1] = display.newImageRect("Images/minus.png", 50, 50 )
				elseif (questionSign == "+") then
					howManyImages[#howManyImages+1] = display.newImageRect("Images/plus.png", 50, 50 )
				elseif (questionSign == "x") then
					howManyImages[#howManyImages+1] = display.newImageRect("Images/multiply.png", 50, 50 )
				elseif (questionSign == "/") then
					howManyImages[#howManyImages+1] = display.newImageRect("Images/divide.png", 50, 50 )
				end
				howManyImages[#howManyImages]:setFillColor(255/255,254/255,240/255)
				
				howManyImages[#howManyImages].x = howManyImages[#howManyImages-1].x + 45
				howManyGroup:insert( howManyImages[#howManyImages] )
			
				for i = 1, string.len(tostring(equationCardOptions[1][4])) do
			
				howManyImages[#howManyImages+1] = display.newImageRect("Images/" .. tostring(equationCardOptions[1][4]):sub(i, i) .. "Digit.png", 50, 50 )
				howManyImages[#howManyImages]:setFillColor(255/255,254/255,240/255)
				
					if (i == 1) then
						howManyImages[#howManyImages].x = howManyImages[#howManyImages-1].x + 45
					else
						howManyImages[#howManyImages].x = howManyImages[#howManyImages-1].x + 33
					end
					howManyGroup:insert( howManyImages[#howManyImages] )
				end
			
			end
			
		else
		
			for i = 1, string.len(tostring(equationCardOptions[1][3])) do
			
				howManyImages[#howManyImages+1] = display.newImageRect("Images/" .. tostring(equationCardOptions[1][3]):sub(i, i) .. "Digit.png", 50, 50 )
				howManyImages[#howManyImages]:setFillColor(255/255,254/255,240/255)
				
				if (howManyImages[#howManyImages-1]) then
					howManyImages[#howManyImages].x = howManyImages[#howManyImages-1].x + 33
				end
				howManyGroup:insert( howManyImages[#howManyImages] )
			end
			
			if (questionTwo == "twoEquations") then
			
				if (questionSign == "-") then
					howManyImages[#howManyImages+1] = display.newImageRect("Images/minus.png", 50, 50 )
				elseif (questionSign == "+") then
					howManyImages[#howManyImages+1] = display.newImageRect("Images/plus.png", 50, 50 )
				elseif (questionSign == "x") then
					howManyImages[#howManyImages+1] = display.newImageRect("Images/multiply.png", 50, 50 )
				elseif (questionSign == "/") then
					howManyImages[#howManyImages+1] = display.newImageRect("Images/divide.png", 50, 50 )
				end
				howManyImages[#howManyImages]:setFillColor(255/255,254/255,240/255)
				
				howManyImages[#howManyImages].x = howManyImages[#howManyImages-1].x + 45
				howManyGroup:insert( howManyImages[#howManyImages] )
			
				for i = 1, string.len(tostring(equationCardOptions[1][4])) do
			
				howManyImages[#howManyImages+1] = display.newImageRect("Images/" .. tostring(equationCardOptions[1][4]):sub(i, i) .. "Digit.png", 50, 50 )
				howManyImages[#howManyImages]:setFillColor(255/255,254/255,240/255)
				
					if (i == 1) then
						howManyImages[#howManyImages].x = howManyImages[#howManyImages-1].x + 45
					else
						howManyImages[#howManyImages].x = howManyImages[#howManyImages-1].x + 33
					end
					howManyGroup:insert( howManyImages[#howManyImages] )
				end
			
			end
			
			howManyImages[#howManyImages+1] = display.newImageRect("Images/equals.png", 50, 50 )
			howManyImages[#howManyImages]:setFillColor(255/255,254/255,240/255)
			howManyImages[#howManyImages].x = howManyImages[#howManyImages-1].x + 45	
			howManyGroup:insert( howManyImages[#howManyImages] )
			
			for i = 1, string.len(tostring(equationCardOptions[1][1])) do
			
				howManyImages[#howManyImages+1] = display.newImageRect("Images/" .. tostring(equationCardOptions[1][1]):sub(i, i) .. "Digit.png", 50, 50 )
				howManyImages[#howManyImages]:setFillColor(255/255,254/255,240/255)
				
				if (i == 1) then
					howManyImages[#howManyImages].x = howManyImages[#howManyImages-1].x + 45
				else
					howManyImages[#howManyImages].x = howManyImages[#howManyImages-1].x + 33
				end
				howManyGroup:insert( howManyImages[#howManyImages] )
			end
			
			
			if (question == "Which sign is missing") then
				howManyImages[#howManyImages+1] = display.newImageRect("Images/UI/blankCard.png", 65, 79 )
			elseif (questionSign == "-") then
				howManyImages[#howManyImages+1] = display.newImageRect("Images/minus.png", 50, 50 )
			elseif (questionSign == "+") then
				howManyImages[#howManyImages+1] = display.newImageRect("Images/plus.png", 50, 50 )
			elseif (questionSign == "x") then
				howManyImages[#howManyImages+1] = display.newImageRect("Images/multiply.png", 50, 50 )
			elseif (questionSign == "/") then
				howManyImages[#howManyImages+1] = display.newImageRect("Images/divide.png", 50, 50 )
			end
			howManyImages[#howManyImages]:setFillColor(255/255,254/255,240/255)
			
			if (question == "Which sign is missing") then
				howManyImages[#howManyImages].x = howManyImages[#howManyImages-1].x + 65
				howManyImages[#howManyImages].id = "?"
			else
				howManyImages[#howManyImages].x = howManyImages[#howManyImages-1].x + 45
			end
			howManyGroup:insert( howManyImages[#howManyImages] )
			
			for i = 1, string.len(tostring(equationCardOptions[1][2])) do
			
				howManyImages[#howManyImages+1] = display.newImageRect("Images/" .. tostring(equationCardOptions[1][2]):sub(i, i) .. "Digit.png", 50, 50 )
				howManyImages[#howManyImages]:setFillColor(255/255,254/255,240/255)
				
				if (i == 1) then
					if (question == "Which sign is missing") then
						howManyImages[#howManyImages].x = howManyImages[#howManyImages-1].x + 65
					else
						howManyImages[#howManyImages].x = howManyImages[#howManyImages-1].x + 45
					end
				else
					howManyImages[#howManyImages].x = howManyImages[#howManyImages-1].x + 33
				end
				howManyGroup:insert( howManyImages[#howManyImages] )
			end
		
		end
		
		howManyGroup.xScale, howManyGroup.yScale = gameOptions.equation.scale, gameOptions.equation.scale
		howManyGroup.anchorChildren = true
		howManyGroup.anchorX = 0.5
        howManyGroup.anchorY = 0.5
		
		howManyGroup.x = 1000
		howManyGroup.y = detailsBG
	
	end
	
	if (question == "Word problem") then
	
		local detailsBG = gameOptions.grayBGY
	
	
		local questionLines = {}
		local numberLines
		
		if (questionTwo == "addition") then
			if (choiceOne+choiceTwo <= 10) then
				currentWordProblem = wordProblemsAddition["num10"][wordProblemsAddition10]
			elseif (choiceOne+choiceTwo <= 25) then
				currentWordProblem = wordProblemsAddition["num25"][wordProblemsAddition25]
			elseif (choiceOne+choiceTwo <= 50) then
				currentWordProblem = wordProblemsAddition["num50"][wordProblemsAddition50]
			elseif (choiceOne+choiceTwo <= 100) then
				currentWordProblem = wordProblemsAddition["num100"][wordProblemsAddition100]
			elseif (choiceOne+choiceTwo <= 1000) then
				currentWordProblem = wordProblemsAddition["num1000"][wordProblemsAddition1000]
			end
		else
			if (choiceOne <= 10) then
				currentWordProblem = wordProblemsSubtraction["num10"][wordProblemsSubtraction10]
			elseif (choiceOne <= 25) then
				currentWordProblem = wordProblemsSubtraction["num25"][wordProblemsSubtraction25]
			elseif (choiceOne <= 50) then
				currentWordProblem = wordProblemsSubtraction["num50"][wordProblemsSubtraction50]
			elseif (choiceOne <= 100) then
				currentWordProblem = wordProblemsSubtraction["num100"][wordProblemsSubtraction100]
			elseif (choiceOne <= 1000) then
				currentWordProblem = wordProblemsSubtraction["num1000"][wordProblemsSubtraction1000]
			end
			
			-- currentWordProblem = 1 -- Use this to test specific word problem, comment out after testing
		end
		
		-- currentWordProblem = 1 -- Use this to test specific word problem, comment out after testing
		
		
		if (questionTwo == "addition") then
			
				numberLines = #wordProblems["addition"][currentWordProblem]
		else
			numberLines = #wordProblems["subtraction"][currentWordProblem]
			
		end
		
		for i = 1, numberLines do
		
			if (questionTwo == "addition") then
				questionLines[#questionLines+1] = wordProblems["addition"][currentWordProblem][i]
			else
				questionLines[#questionLines+1] = wordProblems["subtraction"][currentWordProblem][i]
			end
		
		end
		
		for i = 1, numberLines do
			
			
			for k = 1, string.len( questionLines[i] ) - 7 do
			
				if (questionLines[i]:sub(k,k+7) == "firstNum") then
					questionLines[i] = questionLines[i]:sub(1,k-1) .. choiceOne .. questionLines[i]:sub(k+8,string.len( questionLines[i]))
				end
			
			end
			
			
			for k = 1, string.len( questionLines[i] ) - 8 do
			
				if (questionLines[i]:sub(k,k+8) == "secondNum") then
					questionLines[i] = questionLines[i]:sub(1,k-1) .. choiceTwo .. questionLines[i]:sub(k+9,string.len( questionLines[i]))
				end
			
			end
		
			
		
		end
	
	
		-- if (questionTwo == "addition") then
			-- wordProblemsAddition = wordProblemsAddition + 1
			-- if (wordProblemsAddition > #wordProblems["addition"]) then
				-- wordProblemsAddition = 1
			-- end
			
		-- else
			-- wordProblemsSubtraction = wordProblemsSubtraction + 1
			-- if (wordProblemsSubtraction > #wordProblems["subtraction"]) then
				-- wordProblemsSubtraction = 1
			-- end
		-- end
		
		
		if (questionTwo == "addition") then
			if (choiceOne+choiceTwo <= 10) then
				prevWordProblemAdd = wordProblemsAddition["num10"][wordProblemsAddition10]
				repeat
					wordProblemsAddition10 = wordProblemsAddition10 + 1
					if (wordProblemsAddition10 > #wordProblemsAddition["num10"]) then
						wordProblemsAddition10 = 1
					end
				until prevWordProblemAdd ~= wordProblemsAddition["num10"][wordProblemsAddition10]
			elseif (choiceOne+choiceTwo <= 25) then
				prevWordProblemAdd = wordProblemsAddition["num25"][wordProblemsAddition25]
				repeat
					wordProblemsAddition25 = wordProblemsAddition25 + 1
					if (wordProblemsAddition25 > #wordProblemsAddition["num25"]) then
						wordProblemsAddition25 = 1
					end
				until prevWordProblemAdd ~= wordProblemsAddition["num25"][wordProblemsAddition25]
			elseif (choiceOne+choiceTwo <= 50) then
				prevWordProblemAdd = wordProblemsAddition["num50"][wordProblemsAddition50]
				repeat
					wordProblemsAddition50 = wordProblemsAddition50 + 1
					if (wordProblemsAddition50 > #wordProblemsAddition["num50"]) then
						wordProblemsAddition50 = 1
					end
				until prevWordProblemAdd ~= wordProblemsAddition["num50"][wordProblemsAddition50]
			elseif (choiceOne+choiceTwo <= 100) then
				prevWordProblemAdd = wordProblemsAddition["num100"][wordProblemsAddition100]
				repeat
					wordProblemsAddition100 = wordProblemsAddition100 + 1
					if (wordProblemsAddition100 > #wordProblemsAddition["num100"]) then
						wordProblemsAddition100 = 1
					end
				until prevWordProblemAdd ~= wordProblemsAddition["num100"][wordProblemsAddition100]
			elseif (choiceOne+choiceTwo <= 1000) then
				prevWordProblemAdd = wordProblemsAddition["num1000"][wordProblemsAddition1000]
				repeat
					wordProblemsAddition1000 = wordProblemsAddition1000 + 1
					if (wordProblemsAddition1000 > #wordProblemsAddition["num1000"]) then
						wordProblemsAddition1000 = 1
					end
				until prevWordProblemAdd ~= wordProblemsAddition["num1000"][wordProblemsAddition1000]
			end
		else
			if (choiceOne <= 10) then
				prevWordProblemSub = wordProblemsSubtraction["num10"][wordProblemsSubtraction10]
				repeat
					wordProblemsSubtraction10 = wordProblemsSubtraction10 + 1
					if (wordProblemsSubtraction10 > #wordProblemsSubtraction["num10"]) then
						wordProblemsSubtraction10 = 1
					end
				until prevWordProblemSub ~= wordProblemsSubtraction["num10"][wordProblemsSubtraction10]
			elseif (choiceOne <= 25) then
				prevWordProblemSub = wordProblemsSubtraction["num25"][wordProblemsSubtraction25]
				repeat
					wordProblemsSubtraction25 = wordProblemsSubtraction25 + 1
					if (wordProblemsSubtraction25 > #wordProblemsSubtraction["num25"]) then
						wordProblemsSubtraction25 = 1
					end
				until prevWordProblemSub ~= wordProblemsSubtraction["num25"][wordProblemsSubtraction25]
			elseif (choiceOne <= 50) then
				prevWordProblemSub = wordProblemsSubtraction["num50"][wordProblemsSubtraction50]
				repeat
					wordProblemsSubtraction50 = wordProblemsSubtraction50 + 1
					if (wordProblemsSubtraction50 > #wordProblemsSubtraction["num50"]) then
						wordProblemsSubtraction50 = 1
					end
				until prevWordProblemSub ~= wordProblemsSubtraction["num50"][wordProblemsSubtraction50]
			elseif (choiceOne <= 100) then
				prevWordProblemSub = wordProblemsSubtraction["num100"][wordProblemsSubtraction100]
				repeat
					wordProblemsSubtraction100 = wordProblemsSubtraction100 + 1
					if (wordProblemsSubtraction100 > #wordProblemsSubtraction["num100"]) then
						wordProblemsSubtraction100 = 1
					end
				until prevWordProblemSub ~= wordProblemsSubtraction["num100"][wordProblemsSubtraction100]
			elseif (choiceOne <= 1000) then
				prevWordProblemSub = wordProblemsSubtraction["num1000"][wordProblemsSubtraction1000]
				repeat
					wordProblemsSubtraction1000 = wordProblemsSubtraction1000 + 1
					if (wordProblemsSubtraction1000 > #wordProblemsSubtraction["num1000"]) then
						wordProblemsSubtraction1000 = 1
					end
				until prevWordProblemSub ~= wordProblemsSubtraction["num1000"][wordProblemsSubtraction1000]
			end
		end
		
		
		
	
		if (#questionLines == 2) then
			howManyBackground = display.newImageRect("Images/UI/messageBG.png", 1000, 110 )
		elseif (#questionLines == 3) then
			howManyBackground = display.newImageRect("Images/UI/messageBG.png", 1000, 110 )
		elseif (#questionLines == 4) then
			howManyBackground = display.newImageRect("Images/UI/messageBG.png", 1000, 120 )
		end
		howManyBackground.x = -1000
		howManyBackground.y = detailsBG
	
		howManyGroup = display.newGroup()
		howManyImages = {}
		
		for i = 1, #questionLines do
		
			howManyImages[#howManyImages+1] = display.newText( questionLines[i], 179, 93, dynamicFont, 25 )
			howManyImages[#howManyImages]:setFillColor(255/255,254/255,240/255)
			
			-- howManyImages[#howManyImages]:setFillColor(1)
			howManyGroup:insert ( howManyImages[#howManyImages] )
			
			if (i ~= 1) then
				howManyImages[#howManyImages].y = howManyImages[#howManyImages-1].y + 30
			end
		
		end
		
		howManyGroup.xScale, howManyGroup.yScale = gameOptions.equation.scale, gameOptions.equation.scale
		howManyGroup.anchorChildren = true
		howManyGroup.anchorX = 0.5
        howManyGroup.anchorY = 0.5
		
		howManyGroup.x = 1000
		
		if system.getInfo( "platformName" ) == "Android" then
			howManyGroup.y = detailsBG + equationOptions.offsetY - 45
		else
			howManyGroup.y = detailsBG + equationOptions.offsetY
		end
	
	end
	
	
	
	
	if (question == "How many are") then
		
		questionText.x = 1000
		-- while (howManyAreNum[howManyAnswer] == 0) do
			-- if (questionOptions.showYellow == false and questionOptions.showGreen == true) then
				-- howManyAnswer = math.random( 1, 6 )
			-- elseif (questionOptions.showYellow == false) then
				-- howManyAnswer = math.random( 1, 5 )
			-- else
				-- howManyAnswer = math.random( 1, 7 )
			-- end
			
			-- if (questionOptions.showYellow == false and questionOptions.showGreen == true) then
				-- questionTwo = howManyAreCategories[howManyAnswer]
			-- elseif (questionOptions.showYellow == false) then
				-- questionTwo = howManyAreCategoriesAlt2[howManyAnswer]
			-- else
				-- questionTwo = howManyAreCategoriesAlt[howManyAnswer]
			-- end
			-- questionText.text = question .. " " .. questionTwo .. "?"
			-- print("New Question: " .. questionTwo)
		-- end
		
		
		if (howManyAreNum[howManyAnswer] == 0) then
		
			local wasRepeated = false
			repeat
				wasRepeated = false
				
				if (questionOptions.showYellow == false and questionOptions.showGreen == true) then
					randomHowManyAreItem = math.random( 1, 6 )
				elseif (questionOptions.showYellow == false) then
					randomHowManyAreItem = math.random( 1, 5 )
				else
					randomHowManyAreItem = math.random( 1, 7 )
				end
				
				for i = 1, #prevHowManyAreItem do
					if (prevHowManyAreItem[i] == randomHowManyAreItem) then
						wasRepeated = true
					end
				end
			until wasRepeated == false and howManyAreNum[randomHowManyAreItem] > 0
			prevHowManyAreItem[#prevHowManyAreItem+1] = randomHowManyAreItem
			
			if (#prevHowManyAreItem > 3) then
				prevHowManyAreItem = {}
			end
		
			howManyAnswer = randomHowManyAreItem
			
			if (questionOptions.showYellow == false and questionOptions.showGreen == true) then
				questionTwo = howManyAreCategories[randomHowManyAreItem]
			elseif (questionOptions.showYellow == false) then
				questionTwo = howManyAreCategoriesAlt2[randomHowManyAreItem]
			else
				questionTwo = howManyAreCategoriesAlt[randomHowManyAreItem]
			end
			
			questionText.text = question .. " " .. questionTwo .. "?"
		end
		
		randomNumbers[#randomNumbers+1] = howManyAreNum[howManyAnswer]
		howManyAnswer = howManyAreNum[howManyAnswer]
		tempChoices = tempChoices - 1
		
		print("test")
		print(howManyAnswer)
		print(howManyAreNum[howManyAnswer])
		print(randomNumbers[1])
		print(answerRange)
		print(randomNumber)
		
		if (randomNumbers[1] == 1 and tempChoices > answerRange or
				randomNumbers[1] == 10 and tempChoices > answerRange) then
			print("testing1")
			print(answerRange)
			print(tempChoices)
			answerRange = tempChoices
		end
		
		for i = 1, tempChoices do
			repeat 
				local repeated = false
				
				-- if (randomNumbers[1] == 1 and answerRange == 1) then
					-- randomNumber = math.random(0, 100)
				-- else
					-- randomNumber = math.random(1, 100)
				-- end
				
				randomNumber = math.random(1, 10) -- new code -- old: startRange, endRange
				
				for i = 1, #randomNumbers do
					if (randomNumbers[i] == randomNumber) then
						repeated = true
					end
				end
				
			-- until repeated == false and randomNumber > -1 and
					-- randomNumbers[1] - answerRange <= randomNumber and 
					-- randomNumbers[1] + answerRange >= randomNumber
			until repeated == false 
					and randomNumber <= randomNumbers[1] + answerRange and -- new code
						randomNumber >= randomNumbers[1] - answerRange -- new code
			
			randomNumbers[#randomNumbers+1] = randomNumber
		end
		
	elseif (question == "How many") then
	
		if (groupSkip == 2) then
			if (randomGroupImage == 1) then
				questionText.text = question .. " tooth brushes?"
			else
				questionText.text = question .. " boots?"
			end
		elseif (groupSkip == 5) then
			if (randomGroupImage == 3) then
				questionText.text = question .. " tomatoes?"
			else
				questionText.text = question .. " backpacks?"
			end
		elseif (groupSkip == 10) then
			if (randomGroupImage == 5) then
				questionText.text = question .. " stars?"
			else
				questionText.text = question .. " balloons?"
			end
		end
		
	end
	
	local randomPlace = math.random(numChoices)
	local temp = randomNumbers[randomPlace]
	randomNumbers[randomPlace] = randomNumbers[1]
	randomNumbers[1] = temp
	
	local numberOfNumbers = #randomNumbers
	
	local scale = scaleCards
	spacing = 20
	row = numChoices
	totalRow = row
	rowTwo = 0
	totalRowTwo = rowTwo
	numRows = 1
	
	newCardPositions = nil
	newCardPositions = {}
	if (cardSettingsSpacing) then
		for i = 1, 9 do
			if (i == 1) then
				newCardPositions[#newCardPositions+1] = 0
			else
				newCardPositions[#newCardPositions+1] = newCardPositions[#newCardPositions] + cardSettingsSpacing
			end
		end
	end
	
	if (numChoices == 5) then
		scale = scaleCards
		spacing = 18
		row = 5
		totalRow = row
		rowTwo = 0
		totalRowTwo = rowTwo
		numRows = 1
	elseif (numChoices == 6) then
		scale = scaleCards
		spacing = 20
		row = 3
		totalRow = row
		rowTwo = 3
		totalRowTwo = rowTwo
		numRows = 2
	elseif (numChoices == 7) then
		scale = scaleCards
		spacing = 20
		row = 4
		totalRow = row
		rowTwo = 3
		totalRowTwo = rowTwo
		numRows = 2
	elseif (numChoices == 8) then
		scale = scaleCards
		spacing = 20
		row = 4
		totalRow = row
		rowTwo = 4
		totalRowTwo = rowTwo
		numRows = 2
	elseif (numChoices == 9) then
		scale = scaleCards
		spacing = 20
		row = 5
		totalRow = row
		rowTwo = 4
		totalRowTwo = rowTwo
		numRows = 2
	elseif (numChoices == 10) then
		scale = scaleCards
		spacing = 20
		row = 5
		totalRow = row
		rowTwo = 5
		totalRowTwo = rowTwo
		numRows = 2
	end
	
	local tempCardGroup = display.newGroup()
	
	for i = 1, row do
	
		local cardGroupTemp = display.newGroup()
		
		if (question == "How many more apples do you need to make" or
			question == "How many apples do you need to take away to leave") then
			-- print(appleGameImage)
			-- print(randomNumbers[1])
			if (numOrGroup == "numbers") then
				dynamicNumberCard( i, tostring(randomNumbers[1]), scale )
				-- cards[i] = display.newImageRect("Images/" .. firstImageSet[randomNumbers[1]] .. ".png", 79*scale, 99*scale)
				-- cards[i].sound = gameNumSounds[ firstImageSet[randomNumbers[1]] ]
			elseif (numOrGroup == "numbersDots") then
				cards[i] =  display.newImageRect("Images/" .. sixthImageSet[randomNumbers[1]] .. ".png", 79*scale, 99*scale)
				-- cards[i].sound = gameSounds[ firstImageSet[randomNumbers[1]] ]
				cards[i].sound = firstImageSet[randomNumbers[1]]
			else
				cards[i] = display.newImageRect("Images/" .. appleGameImage .. randomNumbers[1] .. ".png", 79*scale, 99*scale)
				-- cards[i].sound = gameNumSounds[ randomNumbers[1] ]
				cards[i].sound = randomNumbers[1]
			end
			
		elseif (question == "Which one is the same") then
		
			if (whichSameSets.card[randomCategory][randomNumbers[1]] == "-") then
				cards[i] =  display.newImageRect("Images/" .. whichSameSets.card[randomCategory][1] .. ".png", 79*scale, 99*scale)
				-- cards[i].sound = gameSounds[ whichSameSets.card[randomCategory][1] ]
				cards[i].sound = whichSameSets.card[randomCategory][1]
				cards[i].xScale = -cards[i].xScale
			else
				cards[i] =  display.newImageRect("Images/" .. whichSameSets.card[randomCategory][randomNumbers[1]] .. ".png", 79*scale, 99*scale)
				-- cards[i].sound = gameSounds[ whichSameSets.card[randomCategory][randomNumbers[1]] ]
				cards[i].sound = whichSameSets.card[randomCategory][randomNumbers[1]]
			end
		
		elseif (question == "Which one is different" and gameOptions.questions.questionType2 == "hidden object") then
		
			local set = whichDifferentHSets[randomCategory]
			if (set[randomNumbers[1]] == "-") then
				cards[i] =  display.newImageRect("Images/" .. set[1] .. ".png", 155*scale, 194*scale)
				cards[i].sound = set[1]
				cards[i].xScale = -cards[i].xScale
			else
				cards[i] =  display.newImageRect("Images/" .. set[randomNumbers[1]] .. ".png", 155*scale, 194*scale)
				cards[i].sound = set[randomNumbers[1]]
			end
			
			-- cards[i].sound = correctCardSounds[correctCardVO]
					
		elseif (question == "Which one is different" and gameOptions.questions.questionType2 == "category") then
			
			cards[i] =  display.newImageRect("Images/" .. randomNumbers[1] .. ".png", 79*scale, 99*scale)
			-- cards[i].sound = correctCardSounds[correctCardVO]
		
			cards[i].sound = randomNumbers[1]
		
		elseif (question == "Which one is a" or question == "Which one is an") then
		
			if (numOrGroup == "shape") then
				cards[i] =  display.newImageRect("Images/" .. firstShapeSet[randomNumbers[1]] .. ".png", 79*scale, 99*scale)
				-- cards[i].sound = gameSounds[ firstShapeSet[randomNumbers[1]] ]
				cards[i].sound = firstShapeSet[randomNumbers[1]]
			elseif (numOrGroup == "shapeItem") then
				local randomItem = math.random(1, 2)
				local changeToOther = false
				for k = #cards, 1, -1 do
					if (randomItem == 1 and cards[k].sound == secondShapeSet[randomNumbers[1]]) then
						changeToOther = true
					end
					if (randomItem == 2 and cards[k].sound == thirdShapeSet[randomNumbers[1]]) then
						changeToOther = true
					end
				end
				
				if (changeToOther == true) then
					if (randomItem == 1) then
						randomItem = 2
					else
						randomItem = 1
					end
				end
				
				if (randomItem == 1) then
					cards[i] =  display.newImageRect("Images/" .. secondShapeSet[randomNumbers[1]] .. ".png", 79*scale, 99*scale)
					-- cards[i].sound = gameSounds[ secondShapeSet[randomNumbers[1]] ]
					cards[i].sound = secondShapeSet[randomNumbers[1]]
				else
					cards[i] =  display.newImageRect("Images/" .. thirdShapeSet[randomNumbers[1]] .. ".png", 79*scale, 99*scale)
					-- cards[i].sound = gameSounds[ thirdShapeSet[randomNumbers[1]] ]
					cards[i].sound = thirdShapeSet[randomNumbers[1]]
				end
			elseif (numOrGroup == "color") then
				cards[i] =  display.newImageRect("Images/" .. firstColorSet[randomNumbers[1]] .. ".png", 79*scale, 99*scale)
				-- cards[i].sound = gameSounds[ firstColorSet[randomNumbers[1]] ]
				cards[i].sound = firstColorSet[randomNumbers[1]]
			elseif (numOrGroup == "colorItem") then
				local randomItem = math.random(1, 2)
				local changeToOther = false
				for k = #cards, 1, -1 do
					if (randomItem == 1 and cards[k].sound == secondColorSet[randomNumbers[1]]) then
						changeToOther = true
					end
					if (randomItem == 2 and cards[k].sound == thirdColorSet[randomNumbers[1]]) then
						changeToOther = true
					end
				end
				
				if (changeToOther == true) then
					if (randomItem == 1) then
						randomItem = 2
					else
						randomItem = 1
					end
				end
				
				if (randomItem == 1) then
					cards[i] =  display.newImageRect("Images/" .. secondColorSet[randomNumbers[1]] .. ".png", 79*scale, 99*scale)
					-- cards[i].sound = gameSounds[ secondColorSet[randomNumbers[1]] ]
					cards[i].sound = secondColorSet[randomNumbers[1]]
				else
					cards[i] =  display.newImageRect("Images/" .. thirdColorSet[randomNumbers[1]] .. ".png", 79*scale, 99*scale)
					-- cards[i].sound = gameSounds[ thirdColorSet[randomNumbers[1]] ]
					cards[i].sound = thirdColorSet[randomNumbers[1]]
				end
			end
			
		elseif (question == "Which item is") then
		
			cards[i] =  display.newImageRect("Images/bigBlankCard.png", 155*scale, 194*scale)
			cards[i].sound = correctCardSounds[correctCardVO]
			
			
			if (numberOfNumbers == 2) then
				print("Test 1 which item is")
				if (randomNumbers[1] == 1) then
					cardFrontImage = display.newImageRect("Images/" .. biggerSmaller[biggerSmallerCategory] .. ".png", (120*scale)*.8, (136*scale)*.8) -- smallest
				else
					cardFrontImage = display.newImageRect("Images/" .. biggerSmaller[biggerSmallerCategory] .. ".png", 120*scale, 136*scale) -- biggest
				end
			elseif (numberOfNumbers == 3) then
				print("Test 2 which item is")
				if (randomNumbers[1] == 1) then
					cardFrontImage = display.newImageRect("Images/" .. biggerSmaller[biggerSmallerCategory] .. ".png", (120*scale)*.6, (136*scale)*.6) -- smallest
				elseif (randomNumbers[1] == numberOfNumbers) then
					cardFrontImage = display.newImageRect("Images/" .. biggerSmaller[biggerSmallerCategory] .. ".png", 120*scale, 136*scale) -- biggest
				else
					cardFrontImage = display.newImageRect("Images/" .. biggerSmaller[biggerSmallerCategory] .. ".png", (120*scale)*.8, (136*scale)*.8) -- mid 2
				end
			else
			print("Test 3 which item is")
				if (randomNumbers[1] == 1) then
					cardFrontImage = display.newImageRect("Images/" .. biggerSmaller[biggerSmallerCategory] .. ".png", (120*scale)*.4, (136*scale)*.4) -- smallest
				elseif (randomNumbers[1] == numberOfNumbers) then
					cardFrontImage = display.newImageRect("Images/" .. biggerSmaller[biggerSmallerCategory] .. ".png", 120*scale, 136*scale) -- biggest
				elseif (randomNumbers[1] == 2) then
					cardFrontImage = display.newImageRect("Images/" .. biggerSmaller[biggerSmallerCategory] .. ".png", (120*scale)*.8, (136*scale)*.8) -- mid 1
				else
					cardFrontImage = display.newImageRect("Images/" .. biggerSmaller[biggerSmallerCategory] .. ".png", (120*scale)*.6, (136*scale)*.6) -- mid 2
				end
			
			end
			
			cardGroupTemp:insert( cardFrontImage )
			cards[i].image = cardGroupTemp

		elseif (question == "TrueOrFalse") then
		
			cards[i] =  display.newImageRect("Images/" .. randomNumbers[1] .. ".png", 79*scale, 99*scale)
			-- cards[i].sound = gameSounds[ randomNumbers[1] .. "Sound" ]
			
			cards[i].sound = randomNumbers[1] .. "Sound"
		
		
		elseif (question == "Word problem") then
		
			if (numOrGroup == "numbers") then
				cards[i] = dynamicNumberCardSlots( tostring(randomNumbers[1]), scale, 1 )
				-- cards[i] =  display.newImageRect("Images/" .. firstImageSet[randomNumbers[1]] .. ".png", 79*scale, 99*scale)
				-- cards[i].sound = gameSounds[ firstImageSet[randomNumbers[1]] ]
			else
				cards[i] =  display.newImageRect("Images/" .. randomNumbers[1] .. "Card.png", 79*scale, 99*scale)
				-- cards[i].sound = gameSounds[ randomNumbers[1] ]
				
				cards[i].sound = randomNumbers[1]
			end
		
		else
		
			if (numOrGroup == "numbers") then
				dynamicNumberCard( i, tostring(randomNumbers[1]), scale )
				-- cards[i] =  display.newImageRect("Images/" .. firstImageSet[randomNumbers[1]] .. ".png", 79*scale, 99*scale)
				-- cards[i].sound = gameSounds[ firstImageSet[randomNumbers[1]] ]
			elseif (numOrGroup == "dots") then
				cards[i] =  display.newImageRect("Images/" .. fifthImageSet[randomNumbers[1]] .. ".png", 79*scale, 99*scale)
				-- cards[i].sound = gameSounds[ firstImageSet[randomNumbers[1]] ]
				
				cards[i].sound = firstImageSet[randomNumbers[1]]
			else
				local randomSet
				if (numOrGroup == "groups") then
					randomSet = math.random(1,3)
				else
					randomSet = math.random(1,6)
				end
				if (randomSet == 1) then
					cards[i] =  display.newImageRect("Images/" .. fourthImageSet[randomNumbers[1]] .. ".png", 79*scale, 99*scale)
					-- cards[i].sound = gameSounds[ fourthImageSet[randomNumbers[1]] ]
					cards[i].sound = fourthImageSet[randomNumbers[1]]
				elseif (randomSet == 2) then
					cards[i] =  display.newImageRect("Images/" .. secondImageSet[randomNumbers[1]] .. ".png", 79*scale, 99*scale)
					-- cards[i].sound = gameSounds[ secondImageSet[randomNumbers[1]] ]
					cards[i].sound = secondImageSet[randomNumbers[1]]
				elseif (randomSet == 3) then
					cards[i] =  display.newImageRect("Images/" .. thirdImageSet[randomNumbers[1]] .. ".png", 79*scale, 99*scale)
					-- cards[i].sound = gameSounds[ thirdImageSet[randomNumbers[1]] ]
					cards[i].sound = thirdImageSet[randomNumbers[1]]
				elseif (numOrGroup == "both") then
					dynamicNumberCard( i, tostring(randomNumbers[1]), scale )
					-- cards[i] =  display.newImageRect("Images/" .. firstImageSet[randomNumbers[1]] .. ".png", 79*scale, 99*scale)
					-- cards[i].sound = gameSounds[ firstImageSet[randomNumbers[1]] ]
				end
			end
		
		end
		
		-- print(randomNumbers[1])
		-- cards[i].id = randomNumbers[1] -- Reference to the index of table
		if (question == "Which one is a" or question == "Which one is an") then
			cards[i].id = i
			cards[i].answer = randomNumbers[1] -- Reference to the index of table
		else
			print(randomNumbers[1])
			print(cards[i])
			cards[i].id = randomNumbers[1] -- Reference to the index of table
		end
		cards[i].index = i
		-- cards[i].x = i * (cards[i].width+spacing)
		
		if (cardSettingsSpacing) then
			cards[i].x = newCardPositions[(5-row)+(i*2)-1]
		elseif (cardOptions.rotation and cardOptions.rotation == 90) then
			cards[i].x = longRowPosition[(5-row)+(i*2)-1]
		elseif (question == "Which one is different" and gameOptions.questions.questionType2 == "hidden object" or
					question == "Which item is") then
			cards[i].x = rowPosition2[(5-row)+(i*2)-1]
		elseif (question == "Which one is a" or question == "Which one is an") then
			cards[i].x = rowPosition[(5-row)+(i*2)-1] * 1.2
		else
			cards[i].x = rowPosition[(5-row)+(i*2)-1]
		end
		if (numRows == 2) then
			-- cards[i].y = halfH
			if (cardSettingsSpacingV) then
				cards[i].y = halfH - (cardSettingsSpacingV * 0.5)
			else
				cards[i].y = halfH
			end
			-- equationGroup.y = halfH - 100
		else
			-- cards[i].y = halfH
			
			if (cardSettingsSpacingV) then
				cards[i].y = halfH + (cardSettingsSpacingV * 0.5)
			else
				cards[i].y = halfH
			end
			-- equationGroup.y = halfH - 100
		end
		cards[i].initY = cards[i].y
		
		if (cardOptions.rotation and cardOptions.rotation == 90) then
			cards[i].rotation = 90
		end
		
		cards[i].row = 1
		-- cards[i]:addEventListener( "touch", checkQuestionAnswer )
		tempCardGroup:insert(cards[i])
		
		
		if (cards[i].image) then
			tempCardGroup:insert( cards[i].image )
			cards[i].image.x = cards[i].x
			cards[i].image.y = cards[i].y
			local randomDirection = math.random( 1, 2 )
			if (randomDirection == 1) then
				cards[i].image.xScale = -cards[i].image.xScale
			end
		end
		
		
		if (cards[i].textGroup) then
			
			tempCardGroup:insert(cards[i].textGroup)
			cards[i].textGroup.anchorChildren = true
			cards[i].textGroup.anchorX, cards[i].textGroup.anchorY = 0.5, 0.5
			
			cards[i].textGroup.x = cards[i].x
			cards[i].textGroup.y = cards[i].y
			
			dynamicNumberOffsets(i)
			
		end
		
		
		
		if (question == "Which one is different" and gameOptions.questions.questionType2 == "hidden object" or
			question == "Which item is") then
			cards[i].xImage = display.newImageRect("Images/UI/cardX.png", 59*2, 50*2)
		else
			cards[i].xImage = display.newImageRect("Images/UI/cardX.png", 59, 50)
		end
		cards[i].xImage.x = cards[i].x
		cards[i].xImage.y = cards[i].y
		cards[i].xImage.alpha = 0
		tempCardGroup:insert(cards[i].xImage)
		
		cards[i].frame = 0
		
		table.remove( randomNumbers, 1 )
		
	end
	
	-- if (version.appStore == "Amazon" and system.getInfo ( "model" ) == "AFTB" or version.appStore == "Amazon FTV") then
		-- Runtime:addEventListener( "onFTVKey", checkQuestionAnswer )
		-- Runtime:addEventListener( "key" , checkQuestionAnswer )
	-- end
	
	
	--tempCardGroup:setReferencePoint ( display.CenterReferencePoint ) -- commented out for graphics 2.0 and replaced with:
        --tempCardGroup.anchorX = 0.5
        --tempCardGroup.anchorY = 0.5
		
	-- oldCardGroupX = tempCardGroup.x
	-- oldCardGroupY = tempCardGroup.y
	--tempCardGroup.x = halfW
	
	-- newCardGroupX = tempCardGroup.x
	-- newCardGroupY = tempCardGroup.y
	
	cardGroup:insert( tempCardGroup )
	
	levelOptions = gameDetails["level" .. level]
	gameOptions = gameLevelDetails
	
	cardOptions = gameOptions.cards
	
	oldCardGroupX = cardGroup.x
	oldCardGroupY = cardGroup.y
	
	cardGroup.anchorChildren = true
	cardGroup.anchorX = 0.5
	cardGroup.anchorY = 0.5
	
	newCardGroupX = cardGroup.x
	newCardGroupY = cardGroup.y
	
	cardGroup.x = 1000
	cardGroup:toFront()
	
end




function dynamicNumberCard(cardID, cardValue, scale)

	print("number: " .. cardValue)

	local numberCardScale, numberCardSpacing
	if (tonumber(cardValue) < 10) then
		numberCardScale = 0.8
	elseif (tonumber(cardValue) < 100) then
		numberCardScale = 0.73
		numberCardSpacing = 27
	else
		numberCardScale = 0.5
		numberCardSpacing = 20
	end

	cards[cardID] =  display.newImageRect("Images/blankWideCard.png", 79*scale, 99*scale)
	
	
	cards[cardID].textGroup = display.newGroup()
	
	local firstNum = display.newImageRect("Images/" .. tonumber( cardValue:sub(1, 1) ) .. "Digit.png", 50*scale, 50*scale)
	firstNum:setFillColor(64/255,64/255,64/255)
	firstNum.xScale, firstNum.yScale = numberCardScale, numberCardScale
	cards[cardID].textGroup:insert( firstNum )
	
	local secondNum, thirdNum
	
	if (tonumber( cardValue:sub(2, 2) ) ) then
		secondNum = display.newImageRect("Images/" .. tonumber( cardValue:sub(2, 2) ) .. "Digit.png", 50*scale, 50*scale)
		secondNum:setFillColor(64/255,64/255,64/255)
		secondNum.xScale, secondNum.yScale = numberCardScale, numberCardScale
		
		if (tonumber( cardValue:sub(1, 1) ) == 1 and tonumber( cardValue:sub(2, 2) ) == 1) then
			secondNum.x = firstNum.x + ((numberCardSpacing - 6) *scale)
		elseif (tonumber( cardValue:sub(1, 1) ) == 1 or tonumber( cardValue:sub(2, 2) ) == 1) then
			secondNum.x = firstNum.x + ((numberCardSpacing - 3) *scale)
		else
			secondNum.x = firstNum.x + (numberCardSpacing *scale)
		end
		
		cards[cardID].textGroup:insert( secondNum )
	
	end
	
	if (tonumber( cardValue:sub(3, 3) ) ) then
	
		thirdNum = display.newImageRect("Images/" .. tonumber( cardValue:sub(3, 3) ) .. "Digit.png", 50*scale, 50*scale)
		thirdNum:setFillColor(64/255,64/255,64/255)
		thirdNum.xScale, thirdNum.yScale = numberCardScale, numberCardScale
		
		if (tonumber( cardValue:sub(2, 2) ) == 1 and tonumber( cardValue:sub(3, 3) ) == 1) then
			thirdNum.x = secondNum.x + ((numberCardSpacing - 6) *scale)
		elseif (tonumber( cardValue:sub(2, 2) ) == 1 or tonumber( cardValue:sub(3, 3) ) == 1) then
			thirdNum.x = secondNum.x + ((numberCardSpacing - 3) *scale)
		else
			thirdNum.x = secondNum.x + (numberCardSpacing *scale)
		end
		
		cards[cardID].textGroup:insert( thirdNum )
	
	end
	
	
	
	cards[cardID].sound = tonumber(cardValue)
	
	-- if (tonumber( cardValue ) > 100) then
	
		-- cards[cardID].sound = "over100"
	
	-- elseif (tonumber( cardValue ) == 0) then
		-- cards[cardID].sound = gameSounds[ "zero" ]
	-- else
	
		-- cards[cardID].sound = gameSounds[ firstImageSet[tonumber(cardValue)] ]
		
	-- end
	
end

function dynamicNumberCardSlots(cardValue, scale, numScale)

	print("number: " .. cardValue)
	
	local cardImage, cardImageTemp

	local numberCardScale, numberCardSpacing
	if (tonumber(cardValue) < 10) then
		numberCardScale = 0.8
	elseif (tonumber(cardValue) < 100) then
		numberCardScale = 0.73
		numberCardSpacing = 27
	elseif (tonumber(cardValue) < 1000) then
		numberCardScale = 0.5
		numberCardSpacing = 20
	else
		numberCardScale = 0.35
		numberCardSpacing = 15
	end
	
	cardImage = display.newGroup()


	-- print("is matching")
	if (gameOptions.gameType == "matching" and gameplayMatch == 2) then
		cardImageTemp =  display.newImageRect("Images/blankWideCardSand.png", 69, 86) -- 79, 99
	else
		print("Testing matching")
		cardImageTemp =  display.newImageRect("Images/blankWideCard.png", 69, 86) -- 79, 99
	end
	
	cardImageTemp.textGroup = display.newGroup()
	
	local firstNum = display.newImageRect("Images/" .. tonumber( cardValue:sub(1, 1) ) .. "Digit.png", 50, 50)
	firstNum:setFillColor(64/255,64/255,64/255) -- (64/255,64/255,64/255) -- blue (28/255,87/255,123/255)
	firstNum.xScale, firstNum.yScale = numberCardScale, numberCardScale
	cardImageTemp.textGroup:insert( firstNum )
	
	local secondNum, thirdNum, forthNum
	
	if (tonumber( cardValue:sub(2, 2) ) ) then
		secondNum = display.newImageRect("Images/" .. tonumber( cardValue:sub(2, 2) ) .. "Digit.png", 50, 50)
		secondNum:setFillColor(64/255,64/255,64/255)
		secondNum.xScale, secondNum.yScale = numberCardScale, numberCardScale
		
		if (tonumber( cardValue:sub(1, 1) ) == 1 and tonumber( cardValue:sub(2, 2) ) == 1) then
			secondNum.x = firstNum.x + numberCardSpacing - 6
		elseif (tonumber( cardValue:sub(1, 1) ) == 1 or tonumber( cardValue:sub(2, 2) ) == 1) then
			secondNum.x = firstNum.x + numberCardSpacing - 3
		else
			secondNum.x = firstNum.x + numberCardSpacing
		end
		
		cardImageTemp.textGroup:insert( secondNum )
	
	end
	
	if (tonumber( cardValue:sub(3, 3) ) ) then
	
		thirdNum = display.newImageRect("Images/" .. tonumber( cardValue:sub(3, 3) ) .. "Digit.png", 50, 50)
		thirdNum:setFillColor(64/255,64/255,64/255)
		thirdNum.xScale, thirdNum.yScale = numberCardScale, numberCardScale
		
		if (tonumber( cardValue:sub(2, 2) ) == 1 and tonumber( cardValue:sub(3, 3) ) == 1) then
			thirdNum.x = secondNum.x + numberCardSpacing - 6
		elseif (tonumber( cardValue:sub(2, 2) ) == 1 or tonumber( cardValue:sub(3, 3) ) == 1) then
			thirdNum.x = secondNum.x + numberCardSpacing - 3
		else
			thirdNum.x = secondNum.x + numberCardSpacing
		end
		
		cardImageTemp.textGroup:insert( thirdNum )
	
	end
	
	
	if (tonumber( cardValue:sub(4, 4) ) ) then
	
		fourthNum = display.newImageRect("Images/" .. tonumber( cardValue:sub(4, 4) ) .. "Digit.png", 50, 50)
		fourthNum:setFillColor(64/255,64/255,64/255)
		fourthNum.xScale, fourthNum.yScale = numberCardScale, numberCardScale
		
		if (tonumber( cardValue:sub(3, 3) ) == 1 and tonumber( cardValue:sub(4, 4) ) == 1) then
			fourthNum.x = thirdNum.x + numberCardSpacing - 6
		elseif (tonumber( cardValue:sub(3, 3) ) == 1 or tonumber( cardValue:sub(4, 4) ) == 1) then
			fourthNum.x = thirdNum.x + numberCardSpacing - 3
		else
			fourthNum.x = thirdNum.x + numberCardSpacing
		end
		
		cardImageTemp.textGroup:insert( fourthNum )
	
	end
	
	
	
	cardImageTemp.textGroup.offsetY = 0

	if (tonumber(tostring(cardValue):sub(1, 1)) == 1 and tonumber(cardValue) >= 100 and tonumber(tostring(cardValue):sub(3, 3)) ~= 1) then
			
		cardImageTemp.textGroup.offsetX = - 3
	elseif (tonumber(tostring(cardValue):sub(1, 1)) == 1 and tonumber(cardValue) >= 10 and tonumber(cardValue) < 100 and tonumber(tostring(cardValue):sub(2, 2)) ~= 1) then
	
		cardImageTemp.textGroup.offsetX = - 3
	else
	
		cardImageTemp.textGroup.offsetX = 0
	end
	
	cardImageTemp.textGroup.x, cardImageTemp.textGroup.y = cardImageTemp.x + cardImageTemp.textGroup.offsetX, cardImageTemp.y
	
	
	
	cardImage:insert( cardImageTemp )
	cardImage:insert( cardImageTemp.textGroup )
	
	cardImageTemp.textGroup.xScale, cardImageTemp.textGroup.yScale = numScale, numScale
	
	cardImageTemp.textGroup.anchorChildren = true
	cardImageTemp.textGroup.anchorX, cardImageTemp.textGroup.anchorY = 0.5, 0.5
	cardImageTemp.textGroup.x, cardImageTemp.textGroup.y = 0, 0
	
	
	cardImage.xScale, cardImage.yScale = scale, scale
	
	
	cardImage.sound = tonumber(cardValue)
	
	
	-- if (tonumber( cardValue ) > 100) then
	
		-- cardImage.sound = "over100"
	
	-- else
	
		-- cardImage.sound = gameSounds[ firstImageSet[tonumber(cardValue)] ]
		
	-- end
	
	return cardImage
end


function dynamicNumberOffsets(cardID)

	cards[cardID].textGroup.offsetY = 0

	if (tonumber(tostring(randomNumbers[1]):sub(1, 1)) == 1 and randomNumbers[1] >= 100 and tonumber(tostring(randomNumbers[1]):sub(3, 3)) ~= 1) then
				
		cards[cardID].textGroup.offsetX = - 3
	elseif (tonumber(tostring(randomNumbers[1]):sub(1, 1)) == 1 and randomNumbers[1] >= 10 and randomNumbers[1] < 100 and tonumber(tostring(randomNumbers[1]):sub(2, 2)) ~= 1) then
		
		cards[cardID].textGroup.offsetX = - 3
	else
		
		cards[cardID].textGroup.offsetX = 0
	end
	
	cards[cardID].textGroup.x, cards[cardID].textGroup.y = cards[cardID].x + cards[cardID].textGroup.offsetX, cards[cardID].y
	

end

function dynamicNumberOffsetsCardSlots(cardID)


end




function AddMatchCards()

	local levelOptions = gameDetails["level" .. level]
	local gameOptions = gameLevelDetails
	local questionOptions = gameOptions.question

	questionText.x = 1000
	questionTextTwo.x = 1000
	if (questionOptions.line1 ~= "") then
		
		if (myData.isFireTV or myData.isController) then 
			for k = 1, string.len( questionOptions.line1 ) - 4 do
				
				if (questionOptions.line1:sub(k,k+4) == "Touch") then
					questionOptions.line1 = questionOptions.line1:sub(1,k-1) .. "Pick" .. questionOptions.line1:sub(k+5,string.len( questionOptions.line1 ))
				end
				
				if (questionOptions.line1:sub(k,k+4) == "touch") then
					questionOptions.line1 = questionOptions.line1:sub(1,k-1) .. "pick" .. questionOptions.line1:sub(k+5,string.len( questionOptions.line1 ))
				end
			
			end
		end
	
		questionText.text = questionOptions.line1
		questionTextTwo.text = questionOptions.line2
	end
	
	--questionText:setReferencePoint(display.CenterReferencePoint) -- commented out for graphics 2.0 and replaced with:
        questionText.anchorX = 0.5
        questionText.anchorY = 0.5
		
	questionText.x = 1000
	questionText.alpha = 1
	--questionTextTwo:setReferencePoint(display.CenterReferencePoint) -- commented out for graphics 2.0 and replaced with:
        questionTextTwo.anchorX = 0.5
        questionTextTwo.anchorY = 0.5
		
	questionTextTwo.x = 1000
	questionTextTwo.alpha = 1

	sequenceNum = 1
	correctNum = 0
	totalNumAnswers = 0
	showAllCards = false
	flipped = 0
	
	-- if (#levelOrder ~= 0) then
		-- layout = levelOrder[1]
	-- else
		-- if (variation == 4 or variation == 7 and gameplayType == 2) then
			-- layout = math.random(1,8)
		-- elseif (variation == 5 or variation == 2 or variation == 7 and gameplayType == 1) then
			-- layout = math.random(9,17)
		-- end
	-- end
	numberOfMistakes = 0
	timeToComplete = 0


	turnedNum = 0
	turnedNum2 = 0
	
	currentBack = currentBack + 1
	if (currentBack > #cardBacks) then
		currentBack = 1
	end
	
	updateCurrentColorRGB()
	colorMorphTimer = timer.performWithDelay( 4, morphColor, 256 )
	
	
	
	chooseLayout()
	
	cardGroup.xScale = scaleCards
	cardGroup.yScale = scaleCards
	
	
	levelOptions = gameDetails["level" .. level]
	gameOptions = gameLevelDetails
	
	cardOptions = gameOptions.cards
	
	oldCardGroupX = cardGroup.x
	oldCardGroupY = cardGroup.y
	
	cardGroup.anchorChildren = true
	cardGroup.anchorX = 0.5
	cardGroup.anchorY = 0.5
	
	newCardGroupX = cardGroup.x
	newCardGroupY = cardGroup.y
	
	
	
	cardGroup.y = halfH
	if (layout == 13 or 17) then
		cardGroup.y = halfH + 10
	end
	
	if (gameplayMode == 2) then
		-- peekButton =  display.newImageRect("Images/UI/peekButton.png", 53, 59)
		-- peekButton.x, peekButton.y = screenEdgeX - 43, screenOriginY + 36
		-- peekButton.rotation = -15
		-- peekButton.alpha = 0
		-- peekButton:addEventListener( "touch", peek )
	end
	automaticPeek = true
	
	cardGroup.x = 1000
	local function backButtonTransition()
	
		if (myData.isFireTV or myData.isController) then 
			timer.performWithDelay( 700, makeButtonsActive )
		else
			makeButtonsActive()
		end
	
		for i = #cards, 1, -1 do
			cards[i]:addEventListener( "touch", MatchingTap )
		end
		
		if (myData.isFireTV or myData.isController) then 
		
			if (myData.isController) then
				Runtime:addEventListener( "key", MatchingTap )
			else
				Runtime:addEventListener( "onFTVKey", MatchingTap )
			end
			-- timer.performWithDelay( 700, makeButtonsActive )
		else
			-- transition.to( peekButton, { time=700, alpha=1, transition=easing.outExpo } )
			-- transition.to( backButton, { time=700, alpha=1, transition=easing.outExpo, onComplete=makeButtonsActive } )
		end
	end
	
	
	local levelOptions = gameDetails["level" .. level]
	local gameOptions = gameLevelDetails
	-- local details = levelDetails["level" .. level]
	local detailsTwo = gameOptions.cards
	
	cardGroup.targetX = halfW+detailsTwo.offsetX
	cardTrans = transition.to( cardGroup, { time=700, x=halfW+detailsTwo.offsetX, transition=easing.outExpo } )--edited for graphics 2.0 halfW/2 was halfW
	transition.to( questionText, { time=700, x=halfW, transition=easing.outExpo } )
	transition.to( questionTextTwo, { time=700, x=halfW, transition=easing.outExpo } )
	
	
	if (myData.isFireTV or myData.isController and version.appStore ~= "Chrome") then 
	
		-- timer.performWithDelay( 700, makeButtonsActive )
	else
		transition.to( peekButton, { time=700, alpha=1, transition=easing.outExpo } )
		
	end
	
	transition.to( backButton, { time=700, alpha=1, transition=easing.outExpo } )
	transition.to( instructionsReplayButton, { time=700, alpha=1, transition=easing.outExpo } )
	
	timer.performWithDelay( 550, backButtonTransition )
	
	
	if (gameplayMode == 1) then
		flipAll()
		showAllCards = true
	end
	
	
	

end

function AddEquation()

	local levelOptions = gameDetails["level" .. level]
	local gameOptions = gameLevelDetails
	local cardOptions = gameOptions.cards
	local questionOptions = gameOptions.question
	local equationOptions = gameOptions.equations

	questionText.x = 1000
	questionTextTwo.x = 1000
	if (questionOptions.line1 ~= "") then
		questionText.text = questionOptions.line1
		questionTextTwo.text = questionOptions.line2
	end
	
	--questionText:setReferencePoint(display.CenterReferencePoint) -- commented out for graphics 2.0 and replaced with:
        questionText.anchorX = 0.5
        questionText.anchorY = 0.5
		
	questionText.x = 1000
	questionText.alpha = 1
	--questionTextTwo:setReferencePoint(display.CenterReferencePoint) -- commented out for graphics 2.0 and replaced with:
        questionTextTwo.anchorX = 0.5
        questionTextTwo.anchorY = 0.5
		
	questionTextTwo.x = 1000
	questionTextTwo.alpha = 1


	if (gameOptions.gameType == "complex equation") then
		decideComplexEquation()
		decideComplexChoices()
	else
		decideEquation()
		decideChoices()
	end
	
	
	
	local function backButtonTransition()
	
		if (myData.isFireTV or myData.isController) then 
			timer.performWithDelay( 700, makeButtonsActive )
		else
			makeButtonsActive()
		end
	
		if (gameOptions.gameType == "complex equation") then
			for i = #cards, 1, -1 do
				cards[i]:addEventListener( "touch", ComplexChoiceTap )
			end
			--if (version.appStore == "Amazon" and system.getInfo ( "model" ) == "AFTB" or version.appStore == "Amazon FTV") then
			
			if (myData.isController) then
				Runtime:addEventListener( "key", ComplexChoiceTap )
			elseif (myData.isFireTV) then 
				Runtime:addEventListener( "onFTVKey", ComplexChoiceTap )
			end
		else
			for i = #cards, 1, -1 do
				cards[i]:addEventListener( "touch", ChoiceTap )
			end
			--if (version.appStore == "Amazon" and system.getInfo ( "model" ) == "AFTB" or version.appStore == "Amazon FTV") then
			
			if (myData.isController) then
				Runtime:addEventListener( "key", ChoiceTap )
			elseif (myData.isFireTV) then 
				Runtime:addEventListener( "onFTVKey", ChoiceTap )
			end
		end
	
		--if (version.appStore == "Amazon" and system.getInfo ( "model" ) == "AFTB" or version.appStore == "Amazon FTV") then
		-- if (myData.isFireTV or myData.isController) then 
			-- timer.performWithDelay( 700, makeButtonsActive )
		-- else
			-- transition.to( backButton, { time=700, alpha=1, transition=easing.outExpo, onComplete=makeButtonsActive } )
		-- end
	end
	
	
	-- local details = levelDetails["level" .. level]
	-- local detailsTwo = details.cards[currentWaypoint]
	cardGroup.targetX = halfW+cardOptions.offsetX
	cardTrans = transition.to( cardGroup, { time=700, x=halfW+cardOptions.offsetX, transition=easing.outExpo } )
	transition.to( questionText, { time=700, x=halfW, transition=easing.outExpo } )
	transition.to( questionTextTwo, { time=700, x=halfW, transition=easing.outExpo } )
	
	-- if (myData.isFireTV or myData.isController and version.appStore ~= "Chrome") then 
	-- else
		transition.to( backButton, { time=700, alpha=1, transition=easing.outExpo } )
		transition.to( instructionsReplayButton, { time=700, alpha=1, transition=easing.outExpo } )
	-- end
	
	timer.performWithDelay( 550, backButtonTransition )
	
	
	if (numOrGroup == "numbersDots") then
		dotsGroup.y = gameOptions.grayBGY + equationOptions.dotsOffsetY
		transition.to( dotsGroup, { time=700, x=halfW+ equationOptions.dotsOffsetX, transition=easing.outExpo } )
	end
	
	
	-- equationGroup.xScale = equationOptions.scale
	-- equationGroup.yScale = equationOptions.scale
	-- equationGroup.xScale, equationGroup.yScale = gameOptions.equation.scale, gameOptions.equation.scale
	    -- equationGroup.anchorChildren = true
		-- equationGroup.anchorX = 0.5
        -- equationGroup.anchorY = 0.5
		
	-- equationGroup.x = 900
	-- equationGroup.alpha = 1
	
	-- if system.getInfo( "platformName" ) == "Android" then
		-- equationGroup.y = equationGroup.y - 168
	-- end
	-- transition.to( equationGroup, { time=700, x=halfW, transition=easing.outExpo } )
	
	
	if (gameOptions.gameType == "equation") then
		equationGroup.xScale = equationOptions.scale
		equationGroup.yScale = equationOptions.scale
		equationGroup.xScale, equationGroup.yScale = gameOptions.equation.scale, gameOptions.equation.scale
		--equationGroup:setReferencePoint( display.CenterReferencePoint ) -- commented out for graphics 2.0 and replaced with:
			equationGroup.anchorChildren = true
			equationGroup.anchorX = 0.5
			equationGroup.anchorY = 0.5
			
		equationGroup.x = 1000
		equationGroup.alpha = 1
		
		if system.getInfo( "platformName" ) == "Android" then
			equationGroup.y = equationGroup.y - 168 - 22
		end
		transition.to( equationGroup, { time=700, x=halfW, transition=easing.outExpo } )
	else
		equationComplexGroup.xScale = equationOptions.scale
		equationComplexGroup.yScale = equationOptions.scale
		--equationGroup:setReferencePoint( display.CenterReferencePoint ) -- commented out for graphics 2.0 and replaced with:
			equationComplexGroup.anchorChildren = true
			equationComplexGroup.anchorX = 0.5
			equationComplexGroup.anchorY = 0.5
			
		equationComplexGroup.x = 1000
		equationComplexGroup.alpha = 1
		
		
		if system.getInfo( "platformName" ) == "Android" then
			-- equationComplexGroup.y = equationComplexGroup.y - 168
		end
		transition.to( equationComplexGroup, { time=700, x=halfW, transition=easing.outExpo } )
	end
	
	
	
	dotsGroup:toFront()
	
end

function AddCountingGame()

	local levelOptions = gameDetails["level" .. level]
	local gameOptions = gameLevelDetails
	local questionOptions = gameOptions.question
	local countingOptions = gameOptions.counting

	questionText.x = 1000
	questionTextTwo.x = 1000
	if (question == "PickEvenOdd") then
		questionText.text = "Pick the " .. isEvenOdd .. " numbers."
		questionTextTwo.text = ""
	else
		if (questionOptions.line1 ~= "") then
			questionText.text = questionOptions.line1
			questionTextTwo.text = questionOptions.line2
		else
			if (myData.isFireTV or myData.isController) then 
				questionText.text = "Pick the numbers in order."
			else
				questionText.text = "Touch the numbers in order."
			end
		end
	end
	
	--questionText:setReferencePoint(display.CenterReferencePoint) -- commented out for graphics 2.0 and replaced with:
        questionText.anchorX = 0.5
        questionText.anchorY = 0.5
		
	questionText.x = 1000
	questionText.alpha = 1
	--questionTextTwo:setReferencePoint(display.CenterReferencePoint) -- commented out for graphics 2.0 and replaced with:
        questionTextTwo.anchorX = 0.5
        questionTextTwo.anchorY = 0.5
		
	questionTextTwo.x = 1000
	questionTextTwo.alpha = 1

	local tempCardGroup = display.newGroup()

	randomNumbers = {}
	
	if (question == "PickEvenOdd" or question == "AllGreaterLessThan") then
		startRange = cardOptions.startRange
		endRange = cardOptions.endRange
	else
		startRange = math.random( startRange, endRange-(column*row)+1)
		endRange = startRange + (column*row) - 1
	end
	print("start:" .. startRange)
	print("end:" .. endRange)
	-- print(column*row)
	
	local countNumber = startNumber
	
	if (question == "PickEvenOdd") then
		numEvenOddAnswers = 0
		for i = 1, (row*column) do
			local tempNum
			local repeatedNum = false
			repeat
				repeatedNum = false
				
				tempNum = math.random(startRange, endRange)
				
				local hasAnAnswer = false
				for	k = #randomNumbers, 1, -1 do
					if (randomNumbers[k] == tempNum) then
						repeatedNum = true
					end
					if (isEvenOdd == "even" and randomNumbers[k] % 2 == 0 or
							isEvenOdd == "odd" and randomNumbers[k] % 2 ~= 0) then
						hasAnAnswer = true
					end
				end
				
				if (i == (row*column) and hasAnAnswer == false) then
					if (isEvenOdd == "even" and tempNum % 2 == 0 or
							isEvenOdd == "odd" and tempNum % 2 ~= 0) then
					else
						repeatedNum = true
					end
				end
			until repeatedNum == false
			
			if (isEvenOdd == "even" and tempNum % 2 == 0 or
				isEvenOdd == "odd" and tempNum % 2 ~= 0) then
				numEvenOddAnswers = numEvenOddAnswers + 1
			end
			randomNumbers[#randomNumbers+1] = tempNum
		end
	
	elseif (question == "AllGreaterLessThan") then
	
	
		repeat
			greaterLessThanAnswer = math.random(startRange+1, endRange-1)
		until prevGreaterLessThanAnswer ~= greaterLessThanAnswer
		
		prevGreaterLessThanAnswer = greaterLessThanAnswer
		
		
		numGreaterLessThanAnswers = 0
		for i = 1, (row*column) do
			local tempNum
			local repeatedNum = false
			
			
			repeat
				repeatedNum = false
				
				tempNum = math.random(startRange, endRange)
				
				local hasAnAnswer = false
				for	k = #randomNumbers, 1, -1 do
					if (randomNumbers[k] == tempNum) then
						repeatedNum = true
					end
					-- if (isGreaterLessThan == "greater than" and randomNumbers[k] > greaterLessThanAnswer or
							-- isGreaterLessThan == "less than" and randomNumbers[k] < greaterLessThanAnswer or
							-- isGreaterLessThan == "equal to" and randomNumbers[k] == greaterLessThanAnswer) then
						-- hasAnAnswer = true
					-- end
				end
				
				if (i == (row*column) and numGreaterLessThanAnswers < 1) then
					if (isGreaterLessThan == "greater than" and tempNum > greaterLessThanAnswer or
							isGreaterLessThan == "less than" and tempNum < greaterLessThanAnswer or
							isGreaterLessThan == "equal to" and tempNum == greaterLessThanAnswe) then
					else
						repeatedNum = true
					end
				end
			until repeatedNum == false
			
			if (isGreaterLessThan == "greater than" and tempNum > greaterLessThanAnswer or
					isGreaterLessThan == "less than" and tempNum < greaterLessThanAnswer or
					isGreaterLessThan == "equal to" and tempNum == greaterLessThanAnswer) then
				
				numGreaterLessThanAnswers = numGreaterLessThanAnswers + 1
			end
			
			randomNumbers[#randomNumbers+1] = tempNum
		end
	
	else
		for i = 1, (row*column) do
			randomNumbers[#randomNumbers+1] = countNumber
			countNumber = countNumber + countingOptions.skip
		end
	end
	
	if (choicesOrderRand == true) then
		randomizeTable( randomNumbers )
	end
	
	numChoices = #randomNumbers
	
	if (question == "PickEvenOdd" or question == "AllGreaterLessThan") then
		currentCountingNumber = 0
	else
		currentCountingNumber = startNumber
	end
	
	
	if (question == "AllGreaterLessThan") then
		questionText.text = "Pick the numbers that" --.. isGreaterLessThan .. " " .. greaterLessThanAnswer.. "."
		questionTextTwo.text = "are " .. isGreaterLessThan .. " " .. greaterLessThanAnswer.. "."
	end
	
	local scale = scaleCards

	
	for j = 1, column do
		for i = 1, row do
		
			if (gameplayMatch == 1) then
				dynamicNumberCard( #cards+1, tostring(randomNumbers[1]), scale )
				-- cards[#cards+1] =  display.newImageRect("Images/" .. firstImageSet[randomNumbers[1]] .. ".png", 79*scale, 99*scale)
				-- cards[#cards].sound = gameSounds[ firstImageSet[randomNumbers[1]] ]
			elseif (gameplayMatch == 3) then
				cards[#cards+1] =  display.newImageRect("Images/" .. fifthImageSet[randomNumbers[1]] .. ".png", 79*scale, 99*scale)
				cards[#cards].sound = gameSounds[ firstImageSet[randomNumbers[1]] ]
			else
				local randomSet
				if (gameplayMatch == 2) then
					randomSet = math.random(1,3)
				else
					randomSet = math.random(1,6)
				end
				if (randomSet == 1) then
					cards[#cards+1] =  display.newImageRect("Images/" .. fourthImageSet[randomNumbers[1]] .. ".png", 79*scale, 99*scale)
					cards[#cards].sound = gameSounds[ fourthImageSet[randomNumbers[1]] ]
				elseif (randomSet == 2) then
					cards[#cards+1] =  display.newImageRect("Images/" .. secondImageSet[randomNumbers[1]] .. ".png", 79*scale, 99*scale)
					cards[#cards].sound = gameSounds[ secondImageSet[randomNumbers[1]] ]
				elseif (randomSet == 3) then
					cards[#cards+1] =  display.newImageRect("Images/" .. thirdImageSet[randomNumbers[1]] .. ".png", 79*scale, 99*scale)
					cards[#cards].sound = gameSounds[ thirdImageSet[randomNumbers[1]] ]
				elseif (gameplayMatch == 4) then
					dynamicNumberCard( #cards+1, tostring(randomNumbers[1]), scale )
					-- cards[#cards+1] =  display.newImageRect("Images/" .. firstImageSet[randomNumbers[1]] .. ".png", 79*scale, 99*scale)
					-- cards[#cards].sound = gameSounds[ firstImageSet[randomNumbers[1]] ]
				end
				
			end
		
		
			cards[#cards].id = randomNumbers[1] -- Reference to the index of table
			cards[#cards].x = i * (cards[#cards].width+spacing)
			cards[#cards].y = j * (cards[#cards].height+spacing)
			cards[#cards].frame = 0
			--cards[#cards].row = 1
			-- if (numRows == 2) then
				-- cards[#cards].y = halfH - 50
			-- else
				-- cards[#cards].y = halfH
			-- end
			cards[#cards].initY = cards[#cards].y
			
			-- cards[#cards]:addEventListener( "touch", CheckCounting )
			tempCardGroup:insert(cards[#cards])
			
			
			if (cards[#cards].textGroup) then
				tempCardGroup:insert(cards[#cards].textGroup)
				cards[#cards].textGroup.anchorChildren = true
				cards[#cards].textGroup.anchorX, cards[#cards].textGroup.anchorY = 0.5, 0.5
				cards[#cards].textGroup.x, cards[#cards].textGroup.y = cards[#cards].x, cards[#cards].y
			
				cards[#cards].textGroup.x = cards[#cards].x
				cards[#cards].textGroup.y = cards[#cards].y
				
				dynamicNumberOffsets(#cards)
			end
			
			
			
			table.remove( randomNumbers, 1 )
		end
	end
	
	-- if (version.appStore == "Amazon" and system.getInfo ( "model" ) == "AFTB" or version.appStore == "Amazon FTV") then
		-- Runtime:addEventListener( "onFTVKey", CheckCounting )
	-- end
	
	
	cardGroup:insert( tempCardGroup )
	
	levelOptions = gameDetails["level" .. level]
	gameOptions = gameLevelDetails
	
	cardOptions = gameOptions.cards
	
	cardGroup.anchorChildren = true
	cardGroup.anchorX = 0.5
	cardGroup.anchorY = 0.5
	
	cardGroup.x = 1000
	
	local function backButtonTransition()
	
		if (myData.isFireTV or myData.isController) then 
			timer.performWithDelay( 700, makeButtonsActive )
		else
			makeButtonsActive()
		end
	
		for i = #cards, 1, -1 do
			cards[i]:addEventListener( "touch", CheckCounting )
		end
		
		if (myData.isFireTV or myData.isController) then 
		
			if (myData.isController) then
				Runtime:addEventListener( "key", CheckCounting )
			else
				Runtime:addEventListener( "onFTVKey", CheckCounting )
			end
			
			-- timer.performWithDelay( 700, makeButtonsActive )
		-- else
			-- transition.to( backButton, { time=700, alpha=1, transition=easing.outExpo, onComplete=makeButtonsActive } )
		end
	end
	cardGroup.targetX = halfW+cardOptions.offsetX
	cardTrans = transition.to( cardGroup, { time=700, x=halfW+cardOptions.offsetX, transition=easing.outExpo } )
	transition.to( questionText, { time=700, x=halfW, transition=easing.outExpo } )
	transition.to( questionTextTwo, { time=700, x=halfW, transition=easing.outExpo } )
	
	-- if (myData.isFireTV or myData.isController and version.appStore ~= "Chrome") then 
	-- else
		transition.to( backButton, { time=700, alpha=1, transition=easing.outExpo } )
		transition.to( instructionsReplayButton, { time=700, alpha=1, transition=easing.outExpo } )
	-- end
	
	timer.performWithDelay( 550, backButtonTransition )
	
end

function AddSequenceGame()

	local levelOptions = gameDetails["level" .. level]
	local gameOptions = gameLevelDetails
	local sequenceOptions = gameOptions.sequence
	
	questionText.x = 1000
	questionTextTwo.x = 1000
	if (questionOptions.line1 ~= "") then
		questionText.text = questionOptions.line1
		questionTextTwo.text = questionOptions.line2
	end
	
	sequenceCards()
	
	local function backButtonTransition()
	
		if (myData.isFireTV or myData.isController) then 
			timer.performWithDelay( 700, makeButtonsActive )
		else
			makeButtonsActive()
		end
	
		for i = #cards, 1, -1 do
			cards[i]:addEventListener( "touch", checkSequenceAnswer )
		end
		
		if (myData.isFireTV or myData.isController) then 
		
			if (myData.isController) then
				Runtime:addEventListener( "key", checkSequenceAnswer )
			else
				Runtime:addEventListener( "onFTVKey", checkSequenceAnswer )
			end
		
			-- timer.performWithDelay( 700, makeButtonsActive )
		-- else
			-- transition.to( backButton, { time=700, alpha=1, transition=easing.outExpo, onComplete=makeButtonsActive } )
		end
	end
	
	--questionText:setReferencePoint(display.CenterReferencePoint) -- commented out for graphics 2.0 and replaced with:
        questionText.anchorX = 0.5
        questionText.anchorY = 0.5
		
	questionText.x = 1000
	questionText.alpha = 1
	--questionTextTwo:setReferencePoint(display.CenterReferencePoint) -- commented out for graphics 2.0 and replaced with:
        questionTextTwo.anchorX = 0.5
        questionTextTwo.anchorY = 0.5
		
	questionTextTwo.x = 1000
	questionTextTwo.alpha = 1
	transition.to( questionText, { time=700, x=halfW, transition=easing.outExpo } )
	transition.to( questionTextTwo, { time=700, x=halfW, transition=easing.outExpo } )
	
	
	-- local details = levelDetails["level" .. level]
	local detailsTwo = gameOptions.cards
	
	transition.to( howManyBackground, { time=700, x=halfW, transition=easing.outExpo } )
	transition.to( howManyGroup, { time=700, x=halfW, transition=easing.outExpo } )
	cardGroup.targetX = halfW+detailsTwo.offsetX
	cardTrans = transition.to( cardGroup, { time=700, x=halfW+detailsTwo.offsetX, transition=easing.outExpo } )
	
	-- if (myData.isFireTV or myData.isController and version.appStore ~= "Chrome") then 
	-- else
		transition.to( backButton, { time=700, alpha=1, transition=easing.outExpo } )
		transition.to( instructionsReplayButton, { time=700, alpha=1, transition=easing.outExpo } )
	-- end
	
	timer.performWithDelay( 550, backButtonTransition )

end

function AddQuestionGame()

	local levelOptions = gameDetails["level" .. level]
	local gameOptions = gameLevelDetails
	local questionOptions = gameOptions.question
	local questionOptions2 = gameOptions.questions


	questionText.x = 1000
	questionTextTwo.x = 1000
	if (questionOptions.line1 ~= "") then
		questionText.text = questionOptions.line1
		questionTextTwo.text = questionOptions.line2
	
	elseif (questionOptions2.questionType2 == "GreaterLess" or questionOptions2.questionType2 == "Greater" or questionOptions2.questionType2 == "Less") then
		questionText.text = "Which number is " .. questionTwo .. "?"
		
	elseif (questionTwo == "least" or questionTwo == "most") then
		questionText.text = "Which card has the " .. questionTwo .. " items?"
		
	elseif (questionTwo == "first" or questionTwo == "last") then
		questionText.text = "Which number comes " .. questionTwo .. "?"
		
	elseif (question == "Which one is a") then
		-- if (numOrGroup == "shape" or numOrGroup == "shapeItem") then
		
			-- if (questionTwo == "oval" or questionTwo == "octagon") then
				
				-- question = "Which one is an"
				-- questionText.text = question .. " " .. questionTwo .. "?"
			-- else
				-- questionText.text = question .. " " .. questionTwo .. "?"
			-- end
		-- elseif (numOrGroup == "color" or numOrGroup == "colorItem") then
			-- questionText.text = "Which one is " .. questionTwo .. "?"
		-- end
		
		if (numAnswers > 1) then
			if (myData.isFireTV or myData.isController) then 
				if (numOrGroup == "colorItem" or numOrGroup == "shapeItem") then
					questionText.text = "Pick all the " .. questionTwo .. " items."
				else
					questionText.text = "Pick all the " .. questionTwo .. " cards."
				end
			else
				if (numOrGroup == "colorItem" or numOrGroup == "shapeItem") then
					questionText.text = "Touch all the " .. questionTwo .. " items."
				else
					questionText.text = "Touch all the " .. questionTwo .. " cards."
				end
			end
		else
			if (numOrGroup == "shape" or numOrGroup == "shapeItem") then
			
				if (questionTwo == "oval" or questionTwo == "octagon") then
					
					question = "Which one is an"
					questionText.text = question .. " " .. questionTwo .. "?"
				else
					question = "Which one is a"
					questionText.text = question .. " " .. questionTwo .. "?"
				end
			elseif (numOrGroup == "color" or numOrGroup == "colorItem") then
				questionText.text = "Which one is " .. questionTwo .. "?"
			end
		end
		
	elseif (question == "Which 2 numbers add up to") then
	
		if (numAnswers == 2) then
			questionText.text = question .. " " .. questionTwo .. "?"
		else
			questionText.text = "Which 3 numbers add up to" .. " " .. questionTwo .. "?"
		end	
	
	elseif (question == "Which is") then
		if (questionTwo == "more than") then
			questionText.text = "Which one is " .. groupSkip .. " more than " .. whichIsSecondNum .. "?"
		else
			questionText.text = "Which one is " .. groupSkip .. " less than " .. whichIsSecondNum .. "?"
		end
		
	elseif (question == "Which number is" or question == "Which item is") then
	
		if (questionTwo == "bigger") then
			if (numChoices > 2) then
				questionText.text = "Which one is biggest?"
			else
				questionText.text = "Which one is bigger?"
			end
		else
			if (numChoices > 2) then
				questionText.text = "Which one is smallest?"
			else
				questionText.text = "Which one is smaller?"
			end
		end
	
	elseif (question == "Word problem") then
	
		if (numOrGroup == "numbers") then
			
			questionText.text = "Solve the word problem."
			
		else
			
			questionText.text = "Which operation would you use"
			questionTextTwo.text = "to solve this problem?"
			
		end
		
	else
	
		questionText.text = question .. " " .. questionTwo .. "?"
	end
	
	-- if (numAnswers == 2) then
		-- decideChoices()
	-- elseif (numAnswers == 1) then
		-- randomCards()
	-- end
	
	print("Test 10")
	
	if (question == "Which 2 numbers add up to" and numAnswers == 2 or question == "Which 2 numbers add up to" and numAnswers == 3) then
		decideChoices()
	else
		randomCards()
	end
	
	print("Test 11")
	
	local function backButtonTransition()
	
		if (myData.isFireTV or myData.isController) then 
			timer.performWithDelay( 700, makeButtonsActive )
		else
			makeButtonsActive()
		end
	
		if (question == "Which 2 numbers add up to" and numAnswers == 2 or question == "Which 2 numbers add up to" and numAnswers == 3) then
			for i = #cards, 1, -1 do
				cards[i]:addEventListener( "touch", ChoiceTap )
			end
			
			
			if (myData.isController) then
				Runtime:addEventListener( "key", ChoiceTap )
			elseif (myData.isFireTV) then 
				Runtime:addEventListener( "onFTVKey", ChoiceTap )
			end
		else
			for i = #cards, 1, -1 do
				cards[i]:addEventListener( "touch", checkQuestionAnswer )
			end
			
			
			if (myData.isController) then
				Runtime:addEventListener( "key", checkQuestionAnswer )
			elseif (myData.isFireTV) then 
				Runtime:addEventListener( "onFTVKey", checkQuestionAnswer )
			end
		end
	
		
		-- if (myData.isFireTV or myData.isController) then 
			-- timer.performWithDelay( 700, makeButtonsActive )
		-- else
			-- transition.to( backButton, { time=700, alpha=1, transition=easing.outExpo, onComplete=makeButtonsActive } )
		-- end
	end
	
	if (question == "How many more apples do you need to make") then
		questionText.text = "How many more " .. appleGameImage .. " do "
		questionTextTwo.text = "you need to make " .. questionTwo .. " " .. appleGameImage .. "?"
	elseif (question == "How many apples do you need to take away to leave") then
		questionText.text = "How many " .. appleGameImage .. " do you need "
		if (questionTwo == 1) then
			if (appleGameImage == "apples") then
				questionTextTwo.text = "to take away to leave " .. questionTwo .. " apple?"
			else
				questionTextTwo.text = "to take away to leave " .. questionTwo .. " banana?"
			end
		else
			questionTextTwo.text = "to take away to leave " .. questionTwo .. " " .. appleGameImage .. "?"
		end
	end
	
	--questionText:setReferencePoint(display.CenterReferencePoint) -- commented out for graphics 2.0 and replaced with:
        questionText.anchorX = 0.5
        questionText.anchorY = 0.5
		
	questionText.x = 1000
	questionText.alpha = 1
	--questionTextTwo:setReferencePoint(display.CenterReferencePoint) -- commented out for graphics 2.0 and replaced with:
        questionTextTwo.anchorX = 0.5
        questionTextTwo.anchorY = 0.5
		
	questionTextTwo.x = 1000
	questionTextTwo.alpha = 1
	transition.to( questionText, { time=700, x=halfW, transition=easing.outExpo } )
	transition.to( questionTextTwo, { time=700, x=halfW, transition=easing.outExpo } )
	
	
	-- local details = levelDetails["level" .. level]
	local detailsTwo = gameOptions.cards
	
	if (question == "How many" or 
		question == "How many are" or
		question == "How many more apples do you need to make" or
		question == "How many apples do you need to take away to leave" or
		question == "TrueOrFalse" or
		question == "Word problem") then
		
		transition.to( howManyBackground, { time=700, x=halfW, transition=easing.outExpo } )
		transition.to( howManyGroup, { time=700, x=halfW, transition=easing.outExpo } )
	end
	cardGroup.targetX = halfW+detailsTwo.offsetX
	cardTrans = transition.to( cardGroup, { time=700, x=halfW+detailsTwo.offsetX, transition=easing.outExpo } )

	-- if (myData.isFireTV or myData.isController and version.appStore ~= "Chrome") then 
	-- else
		transition.to( backButton, { time=700, alpha=1, transition=easing.outExpo } )
		transition.to( instructionsReplayButton, { time=700, alpha=1, transition=easing.outExpo } )
	-- end
	
	timer.performWithDelay( 550, backButtonTransition )
	
	
end

function decideLevelOrder()

	for i = #levelOrder, 1, -1 do
		levelOrder[i] = nil
	end
	
	local set1, set2, set3, set4, set5
	-- print("version: " .. variation)
	
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
		-- print("Equation")
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
			-- startNumber = math.random(startRange, endRange - ((row*column)*countingOptions.skip)+1)
		
			repeat
				startNumber = math.random(startRange, endRange)
				-- startNumber = math.random(startRange, endRange - ((row*column)*countingOptions.skip)+1)
			until countingOptions.placeMatch == 0 or
					countingOptions.placeMatch ~= 0 and startNumber % countingOptions.placeMatch == 0
					
		
		end
		-- print("startNumber" .. startNumber)
		
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
			-- if (startRange > 10) then
				-- repeat
					-- startNumber = math.random(startRange, endRange) -- wasnt commented out
				-- until endRange - numChoices > startNumber
			-- else
				-- repeat
					-- startNumber = math.random(3, 5)
				-- until endRange - numChoices > startNumber
			-- end
			
			repeat
				startNumber = math.random(startRange, endRange)
			-- until endRange - numChoices > startNumber
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
		
			-- repeat
				-- randomImage = math.random(1, #howManyImageList)
			-- until prevImage ~= randomImage
			-- prevImage = randomImage
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
			-- if (curGame % 2 == 0) then
				-- local tempNum = math.random( 1, 6 )
				-- while tempNum == randomItem do
					-- tempNum = math.random( 1, 6 )
				-- end
				-- randomItem = tempNum
			-- else
				
				-- repeat
				
					-- if (questionOptions.showYellow == false and questionOptions.showGreen == true) then
						-- randomItem = math.random( 1, 6 )
					-- elseif (questionOptions.showYellow == false) then
						-- randomItem = math.random( 1, 5 )
					-- else
						-- randomItem = math.random( 1, 7 )
					-- end
				-- until prevItem ~= randomItem
				-- prevItem = randomItem
			-- end
			
			
			
			
			
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
			
			-- if (#prevHowManyAreItem > 3) then
				-- prevHowManyAreItem = {}
			-- end
			
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
					-- if (numChoices <= 2) then
						-- questionTwo = "greater" 
					-- else
						questionTwo = "greatest" 
					-- end
				else
					questionTwo = "bigger" 
				end
			else
				if (questionTwo == "FirstLast") then
					questionTwo = "first"
				elseif (questionTwo == "MostLeast") then
					questionTwo = "least"
				elseif (questionTwo == "GreaterLess") then
					-- if (numChoices <= 2) then
						-- questionTwo = "less" 
					-- else
						questionTwo = "least" 
					-- end
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
			
			-- startRange = 1
			-- endRange = 10
		
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
		
		
		-- if (question == "PickEvenOdd") then
			-- local randomEvenOdd = math.random(1, 2)
			-- if (randomEvenOdd == 1) then
				-- isEvenOdd = "even"
			-- else
				-- isEvenOdd = "odd"
			-- end
			
		-- end
		
		if (question == "PickEvenOdd" or question == "AllGreaterLessThan") then
			local randomEvenOdd = math.random(1, 2)
			-- if (question == "AllGreaterLessThan") then
				-- randomEvenOdd = math.random(1, 3)
			-- end
			
			if (randomEvenOdd == 1 and questionsOptions.questionType2 ~= "even" and
				questionsOptions.questionType2 ~= "odd" or
				questionsOptions.questionType2 == "even") then
				isEvenOdd = "even"
				isGreaterLessThan = "greater than"
			elseif (randomEvenOdd == 2 and questionsOptions.questionType2 ~= "odd" and
					questionsOptions.questionType2 ~= "even" or
					questionsOptions.questionType2 == "odd") then
			-- elseif (randomEvenOdd == 2) then
				isEvenOdd = "odd"
				isGreaterLessThan = "less than"
			-- else
				-- isGreaterLessThan = "equal to"
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
		-- gameOptions.gameType == "matching" and cardOptions.category == "shapeToShapeItem" or
		-- gameOptions.gameType == "matching" and cardOptions.category == "colorToColorItem" or
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
					if (myData.isFireTV or myData.isController) then 
						playReservedChannel(numbersAndGroupsInstructions2, 11, 0)
					else
						playReservedChannel(numbersAndGroupsInstructions, 11, 0)
					end
				end
			elseif (cardOptions.category == "groupsToGroups") then
				if savedData.enableSounds == true then
					-- if (myData.isFireTV or myData.isController) then 
						-- playReservedChannel(groupsAndGroupsInstructions2, 11, 0)
					-- else
						playReservedChannel(groupsAndGroupsInstructions, 11, 0)
					-- end
				end
			elseif (cardOptions.category == "shapeToShape" and isClassicMode == false) then
				if savedData.enableSounds == true then
				
					-- if (showMeMode and showMeMode == 2) then
					
						if (playingFirstPartShowMe == true) then
							if (gameplayMode == 2) then
								playReservedChannel(findThe, 11, 0)
							else
							-- elseif (myData.isFireTV or myData.isController) then 
								playReservedChannel(pickThe, 11, 0)
							-- else
								-- playReservedChannel(touchThe, 11, 0)
							end
						else
							if (gameplayMode == 2) then
								playReservedChannel(nowFindThe, 11, 0)
							else
							-- elseif (myData.isFireTV or myData.isController) then 
								playReservedChannel(nowPickThe, 11, 0)
							-- else
								-- playReservedChannel(nowTouchThe, 11, 0)
							end
						end
						
						local function partTwoAudio()
							if savedData.enableSounds == true then
								playReservedChannel(gameSounds[ showMeSelectOptionsPlural[1] ], 11, 0)
							end
							
							
							
							-- local function partThreeAudio()
								-- if savedData.enableSounds == true then
									-- playReservedChannel( cards2, 11, 0)
								-- end
							
							-- end
							-- if (questionAudioTimer) then
								-- timer.cancel( questionAudioTimer )
								-- questionAudioTimer = nil
							-- end
							-- questionAudioTimer = timer.performWithDelay( 800, partThreeAudio )
							
						
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
						
					-- else
						-- playReservedChannel(shapesMatchingInstructions, 11, 0)
					-- end
					
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
			
					-- if (showMeMode and showMeMode == 2) then
					
						if (playingFirstPartShowMe == true) then
							if (gameplayMode == 2) then
								playReservedChannel(findThe, 11, 0)
							else
							-- elseif (myData.isFireTV or myData.isController) then 
								playReservedChannel(pickThe, 11, 0)
							-- else
								-- playReservedChannel(touchThe, 11, 0)
							end
						else
							if (gameplayMode == 2) then
								playReservedChannel(nowFindThe, 11, 0)
							else
							-- elseif (myData.isFireTV or myData.isController) then 
								playReservedChannel(nowPickThe, 11, 0)
							-- else
								-- playReservedChannel(nowTouchThe, 11, 0)
							end
						end
						
						local function partTwoAudio()
							if savedData.enableSounds == true then
								playReservedChannel(gameSounds[ showMeSelectOptionsPlural[1] ], 11, 0)
							end
							
							
							
							-- local function partThreeAudio()
								-- if savedData.enableSounds == true then
									-- playReservedChannel( items, 11, 0)
								-- end
							
							-- end
							-- if (questionAudioTimer) then
								-- timer.cancel( questionAudioTimer )
								-- questionAudioTimer = nil
							-- end
							-- questionAudioTimer = timer.performWithDelay( 800, partThreeAudio )
							
						
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
						
					-- else
						-- if (myData.isFireTV or myData.isController) then 
							-- playReservedChannel(shapesAndItemsMatchingInstructions2, 11, 0)
						-- else
							-- playReservedChannel(shapesAndItemsMatchingInstructions, 11, 0)
						-- end
					-- end
					
				end
			elseif (cardOptions.category == "shapeToShapeItem" and matchingOptions.mode == "showme") then
				if savedData.enableSounds == true then
					if (myData.isFireTV or myData.isController) then 
						playReservedChannel(shapesAndItemsMatchingInstructions2, 11, 0)
					else
						playReservedChannel(shapesAndItemsMatchingInstructions, 11, 0)
					end
				end
			elseif (cardOptions.category == "shapeToShapeItem" and matchingOptions.mode == "memory") then
				if savedData.enableSounds == true then
					if (myData.isFireTV or myData.isController) then 
						playReservedChannel(shapesAndItemsMatchingInstructions2, 11, 0)
					else
						playReservedChannel(shapesMatchingInstructions, 11, 0)
					end
				end
			
			elseif (cardOptions.category == "shapeItemToShapeItem" and isClassicMode == false) then
				if savedData.enableSounds == true then
			
					-- if (showMeMode and showMeMode == 2) then
					
						if (playingFirstPartShowMe == true) then
							if (gameplayMode == 2) then
								playReservedChannel(findThe, 11, 0)
							else
							-- elseif (myData.isFireTV or myData.isController) then 
								playReservedChannel(pickThe, 11, 0)
							-- else
								-- playReservedChannel(touchThe, 11, 0)
							end
						else
							if (gameplayMode == 2) then
								playReservedChannel(nowFindThe, 11, 0)
							else
							-- elseif (myData.isFireTV or myData.isController) then 
								playReservedChannel(nowPickThe, 11, 0)
							-- else
								-- playReservedChannel(nowTouchThe, 11, 0)
							end
						end
						
						local function partTwoAudio()
							if savedData.enableSounds == true then
							
								playReservedChannel(gameSounds[ showMeSelectOptionsPlural[1] ], 11, 0)
							end
							
							
							
							-- local function partThreeAudio()
								-- if savedData.enableSounds == true then
									-- playReservedChannel( items, 11, 0)
								-- end
							
							-- end
							-- if (questionAudioTimer) then
								-- timer.cancel( questionAudioTimer )
								-- questionAudioTimer = nil
							-- end
							-- questionAudioTimer = timer.performWithDelay( 800, partThreeAudio )
							
						
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
						
					-- else
						-- if (myData.isFireTV or myData.isController) then 
							-- playReservedChannel(shapesAndItemsMatchingInstructions2, 11, 0)
						-- else
							-- playReservedChannel(shapesAndItemsMatchingInstructions, 11, 0)
						-- end
					-- end
					
				end
			elseif (cardOptions.category == "shapeItemToShapeItem" and matchingOptions.mode == "showme") then
				if savedData.enableSounds == true then
					if (myData.isFireTV or myData.isController) then 
						playReservedChannel(shapesAndItemsMatchingInstructions2, 11, 0)
					else
						playReservedChannel(shapesAndItemsMatchingInstructions, 11, 0)
					end
				end
			elseif (cardOptions.category == "shapeItemToShapeItem" and matchingOptions.mode == "memory") then
				if savedData.enableSounds == true then
					if (myData.isFireTV or myData.isController) then 
						playReservedChannel(shapesAndItemsMatchingInstructions2, 11, 0)
					else
						playReservedChannel(shapesMatchingInstructions, 11, 0)
					end
				end
			
			elseif (cardOptions.category == "colorToColor" and isClassicMode == false) then
				if savedData.enableSounds == true then
			
					-- if (showMeMode and showMeMode == 2) then
					
						if (playingFirstPartShowMe == true) then
							if (gameplayMode == 2) then
								playReservedChannel(findThe, 11, 0)
							else
							-- elseif (myData.isFireTV or myData.isController) then 
								playReservedChannel(pickThe, 11, 0)
							-- else
								-- playReservedChannel(touchThe, 11, 0)
							end
						else
							if (gameplayMode == 2) then
								playReservedChannel(nowFindThe, 11, 0)
							else
							-- elseif (myData.isFireTV or myData.isController) then 
								playReservedChannel(nowPickThe, 11, 0)
							-- else
								-- playReservedChannel(nowTouchThe, 11, 0)
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
						
					-- else
						-- playReservedChannel(colorsMatchingInstructions, 11, 0)
					-- end
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
			
					-- if (showMeMode and showMeMode == 2) then
					
						if (playingFirstPartShowMe == true) then
							if (gameplayMode == 2) then
								playReservedChannel(findThe, 11, 0)
							else
							-- elseif (myData.isFireTV or myData.isController) then 
								playReservedChannel(pickThe, 11, 0)
							-- else
								-- playReservedChannel(touchThe, 11, 0)
							end
						else
							if (gameplayMode == 2) then
								playReservedChannel(nowFindThe, 11, 0)
							else
							-- elseif (myData.isFireTV or myData.isController) then 
								playReservedChannel(nowPickThe, 11, 0)
							-- else
								-- playReservedChannel(nowTouchThe, 11, 0)
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
						
					-- else
						-- if (myData.isFireTV or myData.isController) then 
							-- playReservedChannel(colorsAndItemsMatchingInstructions2, 11, 0)
						-- else
							-- playReservedChannel(colorsAndItemsMatchingInstructions, 11, 0)
						-- end
					-- end
				
					
				end
			elseif (cardOptions.category == "colorToColorItem" and matchingOptions.mode == "showme") then
				if savedData.enableSounds == true then
					if (myData.isFireTV or myData.isController) then 
						playReservedChannel(colorsAndItemsMatchingInstructions, 11, 0)
					else
						playReservedChannel(colorsAndItemsMatchingInstructions, 11, 0)
					end
				end
			elseif 	(cardOptions.category == "colorToColorItem" and matchingOptions.mode == "memory") then
				if savedData.enableSounds == true then
					if (myData.isFireTV or myData.isController) then 
						playReservedChannel(colorsMatchingInstructions, 11, 0)
					else
						playReservedChannel(colorsMatchingInstructions, 11, 0)
					end
				end
			
			elseif (cardOptions.category == "colorItemToColorItem" and isClassicMode == false) then
				if savedData.enableSounds == true then
			
					-- if (showMeMode and showMeMode == 2) then
					
						if (playingFirstPartShowMe == true) then
							if (gameplayMode == 2) then
								playReservedChannel(findThe, 11, 0)
							else
							-- elseif (myData.isFireTV or myData.isController) then 
								playReservedChannel(pickThe, 11, 0)
							-- else
								-- playReservedChannel(touchThe, 11, 0)
							end
						else
							if (gameplayMode == 2) then
								playReservedChannel(nowFindThe, 11, 0)
							else
							-- elseif (myData.isFireTV or myData.isController) then 
								playReservedChannel(nowPickThe, 11, 0)
							-- else
								-- playReservedChannel(nowTouchThe, 11, 0)
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
						
					-- else
						-- if (myData.isFireTV or myData.isController) then 
							-- playReservedChannel(colorItemsMatchingInstructions2, 11, 0)
						-- else
							-- playReservedChannel(colorItemsMatchingInstructions, 11, 0)
						-- end
					-- end
				
					
				end
			elseif (cardOptions.category == "colorItemToColorItem" and matchingOptions.mode == "showme") then
				if savedData.enableSounds == true then
					if (myData.isFireTV or myData.isController) then 
						playReservedChannel(colorItemsMatchingInstructions2, 11, 0)
					else
						playReservedChannel(colorItemsMatchingInstructions, 11, 0)
					end
				end
			elseif (cardOptions.category == "colorItemToColorItem" and matchingOptions.mode == "memory") then
				if savedData.enableSounds == true then
					if (myData.isFireTV or myData.isController) then 
						playReservedChannel(colorsMatchingInstructions, 11, 0)
					else
						playReservedChannel(colorsMatchingInstructions, 11, 0)
					end
				end
			elseif (cardOptions.category == "numbersToNumbers" and isClassicMode == false) then
				if savedData.enableSounds == true then
			
					print("is first game")
				print(isMatchingCardsFirstPlay)
			
				-- if (showMeMode and showMeMode == 2) then
				
					-- gameplayMode == 2 is memory mode
				
					if (playingFirstPartShowMe == true) then
						if (gameplayMode == 2) then
							playReservedChannel(findThe, 11, 0)
						else
						-- elseif (myData.isFireTV or myData.isController) then 
							playReservedChannel(pickThe, 11, 0)
						-- else
							-- playReservedChannel(touchThe, 11, 0)
						end
					else
						if (gameplayMode == 2) then
							playReservedChannel(nowFindThe, 11, 0)
						else
						-- elseif (myData.isFireTV or myData.isController) then 
							playReservedChannel(nowPickThe, 11, 0)
						-- else
							-- playReservedChannel(nowTouchThe, 11, 0)
						end
					end
					
					local function partTwoAudio()
						if savedData.enableSounds == true then
							-- if (isMatchingCardsFirstPlay == true) then
								-- playReservedChannel(gameSounds[ showMeSelectOptions[1] ], 11, 0)
							-- else
							print("test sound")
							print(showMeSelectOptionsPlural[1])
								playReservedChannel(gameSounds[ showMeSelectOptionsPlural[1] ], 11, 0)
							-- end
						end
						
					
					end
					if (questionAudioTimer) then
						timer.cancel( questionAudioTimer )
						questionAudioTimer = nil
					end
					
					if (playingFirstPartShowMe == true) then
						if (isMatchingCardsFirstPlay == true) then
							questionAudioTimer = timer.performWithDelay( 818, partTwoAudio ) 
						elseif (gameplayMode == 2 or myData.isFireTV or myData.isController) then -- memory mode
							questionAudioTimer = timer.performWithDelay( 818, partTwoAudio ) --was 1000
						else
							questionAudioTimer = timer.performWithDelay( 818, partTwoAudio ) --was 700
						end
					else
						if (isMatchingCardsFirstPlay == true) then
							questionAudioTimer = timer.performWithDelay( 1290, partTwoAudio )
						elseif (gameplayMode == 2 or myData.isFireTV or myData.isController) then -- memory mode
							questionAudioTimer = timer.performWithDelay( 1290, partTwoAudio ) --was 1000
						else
							questionAudioTimer = timer.performWithDelay( 1290, partTwoAudio )
						end
					end
						
					-- else
						-- if (myData.isFireTV or myData.isController) then 
							-- playReservedChannel(colorItemsMatchingInstructions2, 11, 0)
						-- else
							-- playReservedChannel(colorItemsMatchingInstructions, 11, 0)
						-- end
					-- end
				
					
				end
			elseif (cardOptions.category == "numbersToNumbers" and matchingOptions.mode == "showme") then
				if savedData.enableSounds == true then
					if (myData.isFireTV or myData.isController) then 
						playReservedChannel(numbersAndNumbersInstructions, 11, 0)
					else
						playReservedChannel(numbersAndNumbersInstructions, 11, 0)
					end
				end
			elseif (cardOptions.category == "numbersToNumbers" and matchingOptions.mode == "memory") then
				if savedData.enableSounds == true then
					if (myData.isFireTV or myData.isController) then 
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
						if (myData.isFireTV or myData.isController) then 
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
				if (myData.isFireTV or myData.isController) then 
					playReservedChannel(countingSound2, 11, 0)
				else
					playReservedChannel(countingSound, 11, 0)
				end
			end
			
		elseif (gameOptions.gameType == "sequence") then
		
			-- print("test VO")
			-- print(prevSequenceVO)
			-- print(questionOptions.line1)
			-- print(currentSequenceVO)
		
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
					-- print("Sequence: " .. currentSequenceVO)
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
					-- print("Sequence: " .. currentSequenceVO)
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
				
				-- print("Sound: " .. questionTwo)
				
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
				
				-- if savedData.enableSounds == true then
					-- if (numOrGroup == "shape" or numOrGroup == "shapeItem") then
						-- if (questionTwo == "oval" or questionTwo == "octagon") then
							
							-- playReservedChannel(whichOneIsAnSound, 11, 0)
						-- else
							-- playReservedChannel(whichOneIsASound, 11, 0)
						-- end
					-- elseif (numOrGroup == "color" or numOrGroup == "colorItem") then
						-- playReservedChannel(whichOneIsSound, 11, 0)
					-- end
					
				-- end
				
				-- local function partTwoAudio()
					-- if savedData.enableSounds == true then
						-- playReservedChannel(gameSounds[ questionTwo ], 11, 0)
					-- end
				
				-- end
				-- if (questionAudioTimer) then
					-- timer.cancel( questionAudioTimer )
					-- questionAudioTimer = nil
				-- end
				-- questionAudioTimer = timer.performWithDelay( 1100, partTwoAudio )
				
				
				if savedData.enableSounds == true then
			
					if (numAnswers > 1) then
						
						if (myData.isFireTV or myData.isController) then 
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
									-- playReservedChannel(thisNumberSound, 11, 0)
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
						
							-- playReservedChannel(gameNumSounds[ questionTwo ], 11, 0)
						end
					
					end
					
					if (questionAudioTimer) then
						timer.cancel( questionAudioTimer )
						questionAudioTimer = nil
					end
					questionAudioTimer = timer.performWithDelay( 2300, partTwoAudio )
					
					
					-- local function partTwoAudio()
						-- if savedData.enableSounds == true then
							-- playReservedChannel(gameNumSounds[ greaterLessThanAnswer ], 11, 0)
						-- end
					-- end
					
					
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
						
						-- playReservedChannel(whichOneIsDifferentSound[math.random(1,#whichOneIsDifferentSound)], 11, 0)
						
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
	
		--if savedData.enableMusic == true then
			--audio.setVolume( 1, { channel=6 } )
			--if (reward == 0) then
				--audio.fade( { channel=2 , time=0 , volume=0  } )
			-- end
			-- if (reward == 0 or reward == 1) then
				-- audio.fade( { channel=3 , time=0 , volume=0  } )
			-- end
			-- if (reward == 0 or reward == 1 or reward == 2) then
				-- audio.fade( { channel=4 , time=0 , volume=0  } )
			-- end
		-- end
		
		-- local details = levelDetails["level" .. level]
		-- local detailsCards = details.cards[curGame]
		
		-- local detailsQuestion = details.questions[curGame]
		-- local detailsEquations = details.equations[curGame]
		-- print(detailsEquations)
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
		elseif (gameplayMode == 7) then -- wilson
			gamePuzzle = require("Scripts.gamePuzzle").new()
		elseif (gameplayMode == 8 or gameplayMode == 13 or gameplayMode == 14) then -- wilson
			gamePuzzle = require("Scripts.gameBasket").new()
		elseif (gameplayMode == 9) then -- wilson
			gamePuzzle = require("Scripts.gamePuzzleSlots").new()
		elseif (gameplayMode == 10) then -- wilson
			gamePuzzle = require("Scripts.gameCounting").new()
		elseif (gameplayMode == 11) then -- wilson
			gamePuzzle = require("Scripts.gameTouchTheNumber").new()
		elseif (gameplayMode == 12) then -- wilson
			gamePuzzle = require("Scripts.gameCountingBubble").new()
		elseif (gameplayMode == 15) then
			gamePuzzle = require("Scripts.gameCardSlots").new()
		else
			AddMatchCards()
		end
		
		local function addInstructionsListener()
			questionHitBox:addEventListener( "touch", instructionsTouch )
			instructionsReplayButton:addEventListener("touch", instructionsTouch)
			--if (version.appStore == "Amazon" and system.getInfo ( "model" ) == "AFTB" or version.appStore == "Amazon FTV") then
			
			if (myData.isController) then
				Runtime:addEventListener( "key", instructionsTouch )
			elseif (myData.isFireTV) then 
				Runtime:addEventListener( "onFTVKey", instructionsTouch )
			end
		end
		timer.performWithDelay( 700, addInstructionsListener )
		playInstructionsAudio(false)
		
		--cardGroup:setReferencePoint ( display.CenterReferencePoint ) -- commented out for graphics 2.0 and replaced with:
		--cardGroup.anchorX=0.5 
		--cardGroup.anchorY=0.5 
		
		-- cardGroup.x = halfW + cardOptions.offsetX
		cardGroup.y = halfH + cardOptions.offsetY
		
		-- print("Card group: " .. cardGroup.y)
		
		
		
		questionText.xScale = questionOptions.scale
		questionText.yScale = questionOptions.scale
		--questionText:setReferencePoint( display.CenterReferencePoint ) -- commented out for graphics 2.0 and replaced with:
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
		--questionTextTwo:setReferencePoint( display.CenterReferencePoint ) -- commented out for graphics 2.0 and replaced with:
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
			
			
			-- cursor.width = cards[currentCardSelected].contentWidth*1.16 -- Yellow Cursor
			-- cursor.height = cards[currentCardSelected].contentHeight*1.1
			-- cursor.x, cursor.y = cards[currentCardSelected]:localToContent( 0, 0 )
			
			-- cursor.width = cards[currentCardSelected].contentWidth*1.15 -- Black Cursor
			-- cursor.height = cards[currentCardSelected].contentHeight*1.09
			-- cursor.x, cursor.y = cards[currentCardSelected]:localToContent( 1, 1 )
			
			
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
		--if (version.appStore == "Amazon" and system.getInfo ( "model" ) == "AFTB" or version.appStore == "Amazon FTV" or
		--	gameplayMode == 4) then
		if (gameplayMode ~= 9 and gameplayMode ~= 15 and
			gameplayMode ~= 8 and gameplayMode ~= 13 and gameplayMode ~= 14) then
			if (myData.isFireTV or gameplayMode == 4 or myData.isController) then 
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
		-- { image = "IceCream", maskSet = { 11 }, w = 160, h = 236, slotW = 164, slotH = 240 },
		
		
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
				
		-- puzzles with holes in the black background or with antennae sticking out of slot
		-- { image = "Carrot", VO = "carrot", maskSet = { 15 }, w = 312, h = 120, slotW = 310, slotH = 120, puzzleOffsetX = 0, puzzleOffsetY = -22, slotOffsetX = 0, slotOffsetY = 0 },
		-- { image = "Tractor", VO = "greenTractor", maskSet = { 19 }, w = 196, h = 216, slotW = 200, slotH = 220, puzzleOffsetX = 0, puzzleOffsetY = 0, slotOffsetX = 0, slotOffsetY = 0 },
		-- { image = "Caterpillar", VO = "caterpillar", maskSet = { 18 }, w = 320, h = 168, slotW = 324, slotH = 144, puzzleOffsetX = 0, puzzleOffsetY = 0, slotOffsetX = 0, slotOffsetY = 13 },
		-- { image = "Bee", VO = "beeVO", maskSet = { 17, 19 }, w = 248, h = 196, slotW = 236, slotH = 200, puzzleOffsetX = 0, puzzleOffsetY = -10, slotOffsetX = 9, slotOffsetY = 0 },
		
		
		
		
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
	-- game2PrevMode = game2CurMode
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
			
		-- { mode = "choose", numbers = { 8 }, numChoices = 3, choicesRange = { 1, 9 }, randomOrder = false  }, -- for testing
		{ mode = "teachChoose", num = 1 },
		-- { mode = "choose", numbers = { 1 }, numChoices = 2, choicesRange = { 1, 3 }, randomOrder = false  },
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
		
		
		-- Level 8
		
		{ mode = "choose", numbers = { "random" }, numChoices = 4, choicesRange = { 6, 10 }, randomOrder = true },
		{ mode = "choose", numbers = { "random" }, numChoices = 3, choicesRange = { 11, 15 }, randomOrder = true },
		{ mode = "choose", numbers = { "random" }, numChoices = 4, choicesRange = { 14, 20 }, randomOrder = true },
		
		-- Level 12
		
		{ mode = "choose", numbers = { "random" }, numChoices = 4, choicesRange = { 10, 20 }, randomOrder = true },
		
		
		
		-- Loops forever (Use "game2LoopFourStart" variable)
		{ mode = "choose", numbers = { "random" }, numChoices = 3, choicesRange = { 5, 9 }, randomOrder = true },
		{ mode = "choose", numbers = { "random" }, numChoices = 3, choicesRange = { 2, 9 }, randomOrder = true },
	
		--22
		{ mode = "choose", numbers = { "random" }, numChoices = 3, choicesRange = { 3, 10 }, randomOrder = true  },
		--23
		{ mode = "choose", numbers = { 8,"random" }, numChoices = 3, choicesRange = { 4, 10 }, randomOrder = true  },
		--24
		{ mode = "choose", numbers = { "random" }, numChoices = 3, choicesRange = { 3, 10 }, randomOrder = true  },
		
		--25
		{ mode = "choose", numbers = { "random",7 }, numChoices = 3, choicesRange = { 2, 10 }, randomOrder = true  },
		--26
		{ mode = "choose", numbers = { "random" }, numChoices = 3, choicesRange = { 3, 5 }, randomOrder = false  },
		--27
		{ mode = "choose", numbers = { "random" }, numChoices = 3, choicesRange = { 1, 5 }, randomOrder = false  },
		
		--28
		{ mode = "choose", numbers = { "random" }, numChoices = 3, choicesRange = { 6, 7 }, randomOrder = false  },
		--29
		{ mode = "choose", numbers = { "random" }, numChoices = 3, choicesRange = { 8, 10 }, randomOrder = false  },
		--30
		{ mode = "choose", numbers = { "random" }, numChoices = 3, choicesRange = { 6, 10 }, randomOrder = false  },
		
		-- 31
		{ mode = "choose", numbers = { 1 }, numChoices = 2, choicesRange = { 1, 3 }, randomOrder = false  },
	
	
		-- Level 7 review
		{ mode = "choose", numbers = { "random" }, numChoices = 4, choicesRange = { 10, 14 }, randomOrder = true },
		{ mode = "choose", numbers = { "random" }, numChoices = 3, choicesRange = { 15, 20 }, randomOrder = true },
		{ mode = "choose", numbers = { "random" }, numChoices = 4, choicesRange = { 15, 20 }, randomOrder = true },
	
		{ mode = "teach", num = 1 },
	}
	
	colorfulNumbers = {
		-- tScale = teach number scale, cScale = choose number scale
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
	
		-- { id = "Bubble", w = 284, h = 280, numColors = 1, offsetX = 0, offsetY = 0 },
		-- { id = "Balloon", w = 264, h = 340, numColors = 2, offsetX = -1.5, offsetY = 34 },
		-- { id = "Cloud", w = 308, h = 300, numColors = 1, offsetX = -2.5, offsetY = -9 },
		
		{ id = "Bubble", w = 318, h = 314, numColors = 1, offsetX = 0, offsetY = 0 },
		{ id = "Balloon", w = 280, h = 361, numColors = 2, offsetX = -1.5, offsetY = 34 },
		{ id = "Cloud", w = 305, h = 297, numColors = 1, offsetX = -2.5, offsetY = -9 },
		
		-- { id = "Balloon", w = 280, h = 361, numColors = 2, offsetX = -1.5, offsetY = 34 },
		-- { id = "Balloon", w = 280, h = 361, numColors = 2, offsetX = -1.5, offsetY = 34 },
		-- { id = "Balloon", w = 280, h = 361, numColors = 2, offsetX = -1.5, offsetY = 34 },
		
		-- { id = "Cloud", w = 305, h = 297, numColors = 1, offsetX = -2.5, offsetY = -9 },
		-- { id = "Cloud", w = 305, h = 297, numColors = 1, offsetX = -2.5, offsetY = -9 },
		-- { id = "Cloud", w = 305, h = 297, numColors = 1, offsetX = -2.5, offsetY = -9 },
		
		-- { id = "Bubble", w = 318, h = 314, numColors = 1, offsetX = 0, offsetY = 0 },
		-- { id = "Bubble", w = 318, h = 314, numColors = 1, offsetX = 0, offsetY = 0 },
		-- { id = "Bubble", w = 318, h = 314, numColors = 1, offsetX = 0, offsetY = 0 },
		
		
	
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
                        
			-- audio.play( matchingDrumsSound, { channel = 6, loops = -1 }  )
			
			--audio.play( menuGroup[itemIndex+1].music, { channel = 2, loops = -1 }  )
			
			
			-- audio.play( matchingTriangleSound, { channel = 3, loops = -1 }  )
			-- audio.play( matchingInstrumentSound, { channel = 4, loops = -1 }  )
			
			
			--audio.fade( { channel=2 , time=0 , volume=0  } )
			--audio.fade( { channel=3 , time=0 , volume=0  } )
			--audio.fade( { channel=4 , time=0 , volume=0  } )
                        -- audio.setVolume( 1, { channel=2 } )
                        -- audio.setVolume( 0, { channel=3 } )
                        -- audio.setVolume( 0, { channel=4 } )
                        -- audio.setVolume( 0, { channel=6 } )
		end
	end
	timer.performWithDelay( 500-soundDelay, playBassMusicTimer )
	

	correctCount = 0
	
	--local backTemp = { 1, 2, 3, 4, 5, 6 }
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
	
	-- For layouts in matching
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
		-- { id = 1, xOffset = 0, yOffset = 0, numColor = { 255, 255, 255 }, showBasketBG = true }, 
		-- { id = 2, xOffset = -10, yOffset = 0, numColor = { 0, 0, 0 }, showBasketBG = false }, 
		{ id = 3, xOffset = 0, yOffset = 0, numColor = { 255, 255, 255 }, showBasketBG = true }, --round basket
		-- { id = 4, xOffset = 5, yOffset = 0, numColor = { 76, 59, 35 }, showBasketBG = true }, -- hamper
		-- { id = 5, xOffset = 5, yOffset = 0, numColor = { 255, 220, 100 }, showBasketBG = true }, -- toy box
		-- { id = 6, xOffset = 5, yOffset = 0, numColor = { 124, 76, 20 }, showBasketBG = true }, -- square basket
	}
	randomizeTable( basketOptions )
	
	basketItemOptions = {
		
		-- { id = "appleCount", name = "apple", plural = "apples", delayVO = 0, w = 144, h = 148, basket = 3, numColors = 1, numOffsetX = 0.5, numOffsetY = 0.6, qScale = .85, sound = "appleReward", soundTwo = "chomp", animation = { id = "balloon", particles = "juice", duration = 100, anchor = { 0.5, 0.5 }, particleOffset = { 0, 0 } } },
		-- { id = "watermelon", name = "watermelon", plural = "watermelon slices", pluralVO = "watermelonSlices", delayVO = 500, w = 166, h = 143, basket = 3,numColors = 1, numOffsetX = 0.5, numOffsetY = 0.49, numScale = .9, qScale = .7, sound = "foodCrunch", soundTwo = "chomp", animation = { id = "disappear", particles = "juice", duration = 110, anchor = { 0.5, 0.5 }, particleOffset = { 0, 0 } } },
		-- { id = "basketStrawberry", name = "strawberry", plural = "strawberries", delayVO = 0, w = 130, h = 182, basket = 3,numColors = 1, numOffsetX = 0.5, numOffsetY = 0.55, numScale = 1, qScale = .85, sound = "gulp", soundTwo = "chomp", animation = { id = "disappear", particles = "juice", duration = 110, anchor = { 0.5, 0.5 }, particleOffset = { 0, 0 } } },
		-- { id = "pepper", name = "pepper", plural = "peppers", delayVO = 0, w = 140, h = 166, basket = 3,numColors = 3, numOffsetX = 0.49, numOffsetY = 0.59, numScale = 1, qScale = .85, sound = "foodCrunch", soundTwo = "laughSillyB", animation = { id = "disappear", particles = "pepperSmoke", duration = 110, anchor = { 0.5, 0.5 }, particleOffset = { 0, 0 } } },
		-- { id = "raspberry", name = "raspberry", plural = "raspberries", delayVO = 0, w = 147, h = 167, basket = 3,numColors = 1, numOffsetX = 0.5, numOffsetY = 0.56, numScale = .9, qScale = .85, sound = "spin", soundTwo = "none", animation = { id = "spin", particles = "", duration = 870, anchor = { 0.5, 0.5 }, particleOffset = { 0, 0 } } },
		-- { id = "orangeCount", name = "orange", plural = "oranges", delayVO = 0, w = 150, h = 150, basket = 6,numColors = 1, numOffsetX = 0.5, numOffsetY = 0.5, numScale = 1, qScale = .85, sound = "gulp", soundTwo = "laughSilly3", animation = { id = "walkright", particles = "dust", duration = 1200, anchor = { 0.5, 0.5 }, particleOffset = { 0, 0 } } },
		-- { id = "heartCount", name = "heart", plural = "hearts", delayVO = 0, w = 150, h = 131, basket = 6, numColors = 1, numOffsetX = 0.5, numOffsetY = 0.5, qScale = .85, sound = "heartReward", soundTwo = "none", animation = { id = "balloon", particles = "none", duration = 700, anchor = { 0.5, 0.5 }, particleOffset = { 0, 0 } } },
		-- { id = "starCount", name = "star", plural = "stars", delayVO = 0, w = 150, h = 143, basket = 6, numColors = 1, numOffsetX = 0.5, numOffsetY = 0.55, qScale = .85, sound = "starReward", soundTwo = "none", animation = { id = "spin", particles = "none", duration = 1400, anchor = { 0.5, 0.5 }, particleOffset = { 0, 0 } } },

		{ id = "appleCount", name = "apple", plural = "apples", delayVO = 0, w = 144, h = 148, basket = 3, numColors = 1, numOffsetX = 0.015, numOffsetY = 0.13, qScale = .85, sound = "appleReward", soundTwo = "chomp", animation = { id = "balloon", particles = "juice", duration = 100, anchor = { 0.5, 0.5 }, particleOffset = { 0, 0 } } },
		
		-- { id = "watermelon", name = "watermelon", plural = "watermelon slices", pluralVO = "watermelonSlices", delayVO = 500, w = 166, h = 143, basket = 3,numColors = 1, numOffsetX = .015, numOffsetY = 0.09, numScale = .9, qScale = .7, sound = "foodCrunch", soundTwo = "chomp", animation = { id = "disappear", particles = "juice", duration = 110, anchor = { 0.5, 0.5 }, particleOffset = { 0, 0 } } },
		
		{ id = "basketStrawberry", name = "strawberry", plural = "strawberries", delayVO = 300, w = 130, h = 182, basket = 3,numColors = 1, numOffsetX = .015, numOffsetY = 0.14, numScale = 1, qScale = .85, sound = "gulp", soundTwo = "chomp", animation = { id = "disappear", particles = "juice", duration = 110, anchor = { 0.5, 0.5 }, particleOffset = { 0, 0 } } },
		
		{ id = "pepper", name = "pepper", plural = "peppers", delayVO = 0, w = 140, h = 166, basket = 3,numColors = 2, numOffsetX = .015, numOffsetY = 0.13, numScale = 1, qScale = .85, sound = "foodCrunch", soundTwo = "laughSillyB", animation = { id = "disappear", particles = "pepperSmoke", duration = 110, anchor = { 0.5, 0.5 }, particleOffset = { 0, 0 } } },
		
		{ id = "raspberry", name = "raspberry", plural = "raspberries", delayVO = 300, w = 147, h = 167, basket = 3,numColors = 1, numOffsetX = .015, numOffsetY = 0.11, numScale = .9, qScale = .85, sound = "spin", soundTwo = "none", animation = { id = "spin", particles = "", duration = 870, anchor = { 0.5, 0.5 }, particleOffset = { 0, 0 } } },
		
		{ id = "orangeCount", name = "orange", plural = "oranges", delayVO = 0, w = 150, h = 150, basket = 6,numColors = 1, numOffsetX = .015, numOffsetY = 0.1, numScale = 1, qScale = .85, sound = "gulp", soundTwo = "laughSilly3", animation = { id = "walkright", particles = "dust", duration = 1200, anchor = { 0.5, 0.5 }, particleOffset = { 0, 0 } } },
		
		{ id = "heartCount", name = "heart", plural = "hearts", delayVO = 0, w = 150, h = 131, basket = 6, numColors = 1, numOffsetX = .015, numOffsetY = 0, qScale = .85, sound = "heartReward", soundTwo = "none", animation = { id = "balloon", particles = "none", duration = 700, anchor = { 0.5, 0.5 }, particleOffset = { 0, 0 } } },
		
		{ id = "starCount", name = "star", plural = "stars", delayVO = 0, w = 150, h = 143, basket = 6, numColors = 1, numOffsetX = .015, numOffsetY = 0.1, qScale = .85, sound = "starReward", soundTwo = "none", animation = { id = "spin", particles = "none", duration = 1400, anchor = { 0.5, 0.5 }, particleOffset = { 0, 0 } } },

	
	
	}
	
	
	
	nextGame()

end





function showCursor()

	currentCardSelected = 1
	for i = 1, #cards do
		--if (gameplayMode == 4 and system.getInfo ( "model" ) ~= "AFTB" and version.appStore ~= "Amazon FTV" or
		--	gameplayMode == 4 and system.getInfo ( "model" ) == "AFTB" and currentCountingNumber == startNumber or
		--	gameplayMode == 4 and version.appStore == "Amazon FTV" and currentCountingNumber == startNumber) then
		if ((gameplayMode == 4 and myData.isFireTV == false and myData.isController == false) or 
			( myData.isFireTV and gameplayMode == 4 and currentCountingNumber == startNumber ) or
			( myData.isController and gameplayMode == 4 and currentCountingNumber == startNumber ) ) then 
			
			
			
		elseif (cards[i].y < screenEdgeY and cards[i].alpha ~= 0 and cards[i].rotation == 0) then

			-- cursor.x, cursor.y = cards[i]:localToContent( 0, 0 )
			-- cursor.x, cursor.y = cards[i]:localToContent( 1, 1 )
			cursor.x, cursor.y = cards[i]:localToContent( cards[i].contentWidth*0.37, cards[i].contentHeight*0.5 )
			cursor:toFront()
			targetCard = cards[i]
			currentCardSelected = i
			cursorTransition = transition.to( cursor, { time=100, alpha=1 } )
			break
		elseif (cards[i].y < screenEdgeY and cards[i].alpha ~= 0 and cards[i].rotation == 90) then

			-- cursor.x, cursor.y = cards[i]:localToContent( 0, 0 )
			-- cursor.x, cursor.y = cards[i]:localToContent( 1, 1 )
			cursor.x, cursor.y = cards[i]:localToContent( cards[i].contentWidth*0.41, cards[i].contentHeight*-0.52 )
			cursor:toFront()
			targetCard = cards[i]
			currentCardSelected = i
			cursorTransition = transition.to( cursor, { time=100, alpha=1 } )
		
			-- cursor.x, cursor.y = cards[currentCardSelected]:localToContent( cards[currentCardSelected].contentWidth*0.41, cards[currentCardSelected].contentHeight*-0.52 )
			
			break
			
		end
	end
	
	--if (gameplayMode == 4 and system.getInfo ( "model" ) ~= "AFTB" and version.appStore ~= "Amazon FTV" or
	--		gameplayMode == 4 and system.getInfo ( "model" ) == "AFTB" and currentCountingNumber == startNumber or
	--		gameplayMode == 4 and version.appStore == "Amazon FTV" and currentCountingNumber == startNumber) then
	if ((gameplayMode == 4 and myData.isFireTV == false and myData.isController == false) or 
	( myData.isFireTV and gameplayMode == 4 and currentCountingNumber == startNumber ) or
	( myData.isController and gameplayMode == 4 and currentCountingNumber == startNumber) )then  	
		
		
		for i = 1, #cards do
			if (cards[i].id < cards[currentCardSelected].id) then
				currentCardSelected = i
			end
		end
		
		cursor.x, cursor.y = cards[currentCardSelected]:localToContent( cards[currentCardSelected].contentWidth*0.37, cards[currentCardSelected].contentHeight*0.5 )
		cursor:toFront()
		targetCard = cards[currentCardSelected]
		cursorTransition = transition.to( cursor, { time=100, alpha=1 } )
	end
	
	buttonsActive = true

end

function controllerDirectionPressed(keyName)

	if (keyName and keyName == "right") then
		
		local cardNotFound = true
		if (puzzlePieces) then
			for i = 1, #puzzlePieces do
				if (puzzlePieces[i].slotX > puzzlePieces[currentCardSelected].slotX and 
						puzzlePieces[i].slotY == puzzlePieces[currentCardSelected].slotY and
						puzzlePieces[i].inSlot == false) then
					
					currentCardSelected = i
					cardNotFound = false
					break
				end
			end
		
		elseif (gameSlots or gameplayMode == 11 and gameNumbers) then
			if (currentSelected == "cards" and gameNumbers or
				gameplayMode == 11 and gameNumbers) then
			
				for i = 1, #gameNumbers do
					if (gameNumbers[i].x > gameNumbers[currentCardSelected].x and 
							gameNumbers[i].y >= gameNumbers[currentCardSelected].y - 30 and
							gameNumbers[i].y <= gameNumbers[currentCardSelected].y + 30 and
							gameNumbers[i].alpha ~= 0 and gameNumbers[i].inSlot == false) then
						
						currentCardSelected = i
						cardNotFound = false
						break
					end
				end
			else
				for i = 1, #gameSlots do
					if (gameSlots[i].x > gameSlots[currentCardSelected].x and 
							gameSlots[i].y == gameSlots[currentCardSelected].y and
							gameSlots[i].alpha ~= 0 and gameSlots[i].inSlot == false) then
						
						currentCardSelected = i
						cardNotFound = false
						break
					end
				end
			end
		elseif (gameplayMode == 12) then
			for i = 1, #gameGroups do
				if (gameGroups[i].x > gameGroups[currentCardSelected].x and 
						-- gameGroups[i].y == gameGroups[currentCardSelected].y and
						gameGroups[i].alpha ~= 0 and gameGroups[i].inBasket == false) then
					
					currentCardSelected = i
					cardNotFound = false
					break
				end
			end
		elseif (gameplayMode == 13 or gameplayMode == 14) then
			for i = 1, #gameImages do
				if (gameImages[i].x > gameImages[currentCardSelected].x and 
						-- gameImages[i].y == gameImages[currentCardSelected].y and
						gameImages[i].alpha ~= 0 and gameImages[i].inBasket == false) then
					
					currentCardSelected = i
					cardNotFound = false
					break
				end
			end
		elseif (gameplayMode == 8) then
			for i = 1, #gameImages do
				if (gameImages[i].x > gameImages[currentCardSelected].x and 
						gameImages[i].y >= gameImages[currentCardSelected].y - 40 and
						gameImages[i].y <= gameImages[currentCardSelected].y + 40 and
						gameImages[i].alpha ~= 0 and gameImages[i].inBasket == false) then
					
					currentCardSelected = i
					cardNotFound = false
					break
				end
			end
		elseif (gameplayMode == 10) then
			for i = 1, #gameImages do
				if (gameImages[i].x > gameImages[currentCardSelected].x and 
						gameImages[i].y >= gameImages[currentCardSelected].y - 30 and
						gameImages[i].y <= gameImages[currentCardSelected].y + 30 and
						gameImages[i].alpha ~= 0 and gameImages[i].inBasket == false) then
					
					currentCardSelected = i
					cardNotFound = false
					break
				end
			end
		
		else
			for i = 1, #cards do
				if (cards[i].x > cards[currentCardSelected].x and 
					cards[i].y == cards[currentCardSelected].y and 
					cards[i].alpha ~= 0 and cards[i].rotation == 0 or 
					cards[i].x > cards[currentCardSelected].x and 
					cards[i].y == cards[currentCardSelected].y and 
					cards[i].alpha ~= 0 and cards[i].rotation == 90) then
					
					currentCardSelected = i
					cardNotFound = false
					break
				end
			end
		end
		
		if (cardNotFound == true) then
			if (puzzlePieces) then
				for i = 1, #puzzlePieces do
					if (puzzlePieces[i].slotX < puzzlePieces[currentCardSelected].slotX and 
						puzzlePieces[i].slotY == puzzlePieces[currentCardSelected].slotY and 
						puzzlePieces[i].inSlot == false) then
						
						currentCardSelected = i
						cardNotFound = false
						break
					end
				end
			
			elseif (gameSlots or gameplayMode == 11 and gameNumbers) then
				if (currentSelected == "cards" and gameNumbers or
					gameplayMode == 11 and gameNumbers) then
					
					for i = 1, #gameNumbers do
						if (gameNumbers[i].x < gameNumbers[currentCardSelected].x and 
							gameNumbers[i].y >= gameNumbers[currentCardSelected].y - 30 and
							gameNumbers[i].y <= gameNumbers[currentCardSelected].y + 30 and
							gameNumbers[i].alpha ~= 0 and gameNumbers[i].inSlot == false) then
							
							currentCardSelected = i
							cardNotFound = false
							break
						end
					end
				else
					for i = 1, #gameSlots do
						if (gameSlots[i].x < gameSlots[currentCardSelected].x and 
							gameSlots[i].y == gameSlots[currentCardSelected].y and 
							gameSlots[i].alpha ~= 0 and gameSlots[i].inSlot == false) then
							
							currentCardSelected = i
							cardNotFound = false
							break
						end
					end
				end
			elseif (gameplayMode == 12) then
				for i = 1, #gameGroups do
					if (gameGroups[i].x < gameGroups[currentCardSelected].x and 
						-- gameGroups[i].y == gameGroups[currentCardSelected].y and 
						gameGroups[i].alpha ~= 0 and gameGroups[i].inBasket == false) then
						
						currentCardSelected = i
						cardNotFound = false
						break
					end
				end
			elseif (gameplayMode == 13 or gameplayMode == 14) then
				for i = 1, #gameImages do
					if (gameImages[i].x < gameImages[currentCardSelected].x and 
						-- gameImages[i].y == gameImages[currentCardSelected].y and 
						gameImages[i].alpha ~= 0 and gameImages[i].inBasket == false) then
						
						currentCardSelected = i
						cardNotFound = false
						break
					end
				end
			elseif (gameplayMode == 8) then
				for i = #gameImages, 1, -1 do
					if (gameImages[i].x < gameImages[currentCardSelected].x and 
							gameImages[i].y >= gameImages[currentCardSelected].y - 40 and
							gameImages[i].y <= gameImages[currentCardSelected].y + 40 and
							gameImages[i].alpha ~= 0 and gameImages[i].inBasket == false) then
						
						currentCardSelected = i
						cardNotFound = false
				end
			end
			elseif (gameplayMode == 10) then
				for i = 1, #gameImages do
					if (gameImages[i].x < gameImages[currentCardSelected].x and 
						gameImages[i].y >= gameImages[currentCardSelected].y - 30 and
						gameImages[i].y <= gameImages[currentCardSelected].y + 30 and
						gameImages[i].alpha ~= 0 and gameImages[i].inBasket == false) then
						
						currentCardSelected = i
						cardNotFound = false
						break
					end
				end
			
			else
				for i = 1, #cards do
					if (cards[i].x < cards[currentCardSelected].x and 
						cards[i].y == cards[currentCardSelected].y and 
						cards[i].alpha ~= 0 and cards[i].rotation == 0 or
						cards[i].x < cards[currentCardSelected].x and 
						cards[i].y == cards[currentCardSelected].y and 
						cards[i].alpha ~= 0 and cards[i].rotation == 90) then
						
						currentCardSelected = i
						cardNotFound = false
						break
					end
				end
			end
		end
		
		if (cardNotFound == true) then
			if (puzzlePieces) then
				for i = 1, #puzzlePieces do
					if (puzzlePieces[i].slotX > puzzlePieces[currentCardSelected].slotX and
						puzzlePieces[i].inSlot == false) then
						
						currentCardSelected = i
						break
					end
				end
			
			elseif (gameSlots or gameplayMode == 11 and gameNumbers) then
				if (currentSelected == "cards" and gameNumbers or
					gameplayMode == 11 and gameNumbers) then
					
					for i = 1, #gameNumbers do
						if (gameNumbers[i].x > gameNumbers[currentCardSelected].x and
							gameNumbers[i].alpha ~= 0 and gameNumbers[i].inSlot == false) then
							
							print("Test 12")
							currentCardSelected = i
							break
						end
					end
				else
					for i = 1, #gameSlots do
						if (gameSlots[i].x > gameSlots[currentCardSelected].x and
							gameSlots[i].alpha ~= 0 and gameSlots[i].inSlot == false) then
							
							currentCardSelected = i
							break
						end
					end
				end
			elseif (gameplayMode == 12) then
				for i = 1, #gameGroups do
					if (gameGroups[i].x > gameGroups[currentCardSelected].x and
						gameGroups[i].alpha ~= 0 and gameGroups[i].inBasket == false) then
						
						currentCardSelected = i
						break
					end
				end
			elseif (gameplayMode == 8 or gameplayMode == 13 or gameplayMode == 14) then
				for i = 1, #gameImages do
					if (gameImages[i].x > gameImages[currentCardSelected].x and
						gameImages[i].alpha ~= 0 and gameImages[i].inBasket == false) then
						
						currentCardSelected = i
						break
					end
				end
			elseif (gameplayMode == 10) then
			else
				for i = 1, #cards do
					if (cards[i].x > cards[currentCardSelected].x and
						cards[i].alpha ~= 0 and cards[i].rotation == 0 or
						cards[i].x > cards[currentCardSelected].x and
						cards[i].alpha ~= 0 and cards[i].rotation == 90) then
						
						currentCardSelected = i
						break
					end
				end
			end
		end
		
		playReservedChannel(shakeSound, currentCursorChannel, 0)
		currentCursorChannel = currentCursorChannel + 1
		if (currentCursorChannel > 27) then
			currentCursorChannel = 26
		end
		
	elseif (keyName and keyName == "left") then
	
		local cardNotFound = true
		if (puzzlePieces) then
			for i = #puzzlePieces, 1, -1 do
				if (puzzlePieces[i].slotX < puzzlePieces[currentCardSelected].slotX and 
					puzzlePieces[i].slotY == puzzlePieces[currentCardSelected].slotY and 
					puzzlePieces[i].inSlot == false) then
					
					currentCardSelected = i
					cardNotFound = false
					break
				end
			end
		elseif (gameSlots or gameplayMode == 11 and gameNumbers) then
			if (currentSelected == "cards" and gameNumbers or
				gameplayMode == 11 and gameNumbers) then
				
				for i = #gameNumbers, 1, -1 do
					if (gameNumbers[i].x < gameNumbers[currentCardSelected].x and 
						gameNumbers[i].y >= gameNumbers[currentCardSelected].y - 30 and
						gameNumbers[i].y <= gameNumbers[currentCardSelected].y + 30 and
						gameNumbers[i].alpha ~= 0 and gameNumbers[i].inSlot == false) then
						
						currentCardSelected = i
						cardNotFound = false
						break
					end
				end
			else
				for i = #gameSlots, 1, -1 do
					if (gameSlots[i].x < gameSlots[currentCardSelected].x and 
						gameSlots[i].y == gameSlots[currentCardSelected].y and 
						gameSlots[i].alpha ~= 0 and gameSlots[i].inSlot == false) then
						
						currentCardSelected = i
						cardNotFound = false
						break
					end
				end
			end
		elseif (gameplayMode == 12) then
			for i = #gameGroups, 1, -1 do
				if (gameGroups[i].x < gameGroups[currentCardSelected].x and 
					-- gameGroups[i].y == gameGroups[currentCardSelected].y and 
					gameGroups[i].alpha ~= 0 and gameGroups[i].inBasket == false) then
					
					currentCardSelected = i
					cardNotFound = false
					break
				end
			end
		elseif (gameplayMode == 13 or gameplayMode == 14) then
			for i = #gameImages, 1, -1 do
				if (gameImages[i].x < gameImages[currentCardSelected].x and 
					-- gameImages[i].y == gameImages[currentCardSelected].y and 
					gameImages[i].alpha ~= 0 and gameImages[i].inBasket == false) then
					
					currentCardSelected = i
					cardNotFound = false
					break
				end
			end
		elseif (gameplayMode == 8) then
			for i = #gameImages, 1, -1 do
				if (gameImages[i].x < gameImages[currentCardSelected].x and 
						gameImages[i].y >= gameImages[currentCardSelected].y - 40 and
						gameImages[i].y <= gameImages[currentCardSelected].y + 40 and
						gameImages[i].alpha ~= 0 and gameImages[i].inBasket == false) then
					
					currentCardSelected = i
					cardNotFound = false
					break
				end
			end
		elseif (gameplayMode == 10) then
			for i = #gameImages, 1, -1 do
				if (gameImages[i].x < gameImages[currentCardSelected].x and 
					gameImages[i].y >= gameImages[currentCardSelected].y - 30 and
					gameImages[i].y <= gameImages[currentCardSelected].y + 30 and
					gameImages[i].alpha ~= 0 and gameImages[i].inBasket == false) then
					
					currentCardSelected = i
					cardNotFound = false
					break
				end
			end
		
		else
			for i = #cards, 1, -1 do
				if (cards[i].x < cards[currentCardSelected].x and 
					cards[i].y == cards[currentCardSelected].y and 
					cards[i].alpha ~= 0 and cards[i].rotation == 0 or
					cards[i].x < cards[currentCardSelected].x and 
					cards[i].y == cards[currentCardSelected].y and 
					cards[i].alpha ~= 0 and cards[i].rotation == 90) then
					
					currentCardSelected = i
					cardNotFound = false
					break
				end
			end
		end
		
		if (cardNotFound == true) then
			if (puzzlePieces) then
				for i = #puzzlePieces, 1, -1 do
					if (puzzlePieces[i].slotX > puzzlePieces[currentCardSelected].slotX and 
						puzzlePieces[i].slotY == puzzlePieces[currentCardSelected].slotY and 
						puzzlePieces[i].inSlot == false) then
						
						currentCardSelected = i
						cardNotFound = false
						break
					end
				end
			elseif (gameSlots or gameplayMode == 11 and gameNumbers) then
				if (currentSelected == "cards" and gameNumbers or
					gameplayMode == 11 and gameNumbers) then
					
					for i = #gameNumbers, 1, -1 do
						if (gameNumbers[i].x > gameNumbers[currentCardSelected].x and 
							gameNumbers[i].y >= gameNumbers[currentCardSelected].y - 30 and
							gameNumbers[i].y <= gameNumbers[currentCardSelected].y + 30 and
							gameNumbers[i].alpha ~= 0 and gameNumbers[i].inSlot == false) then
							
							currentCardSelected = i
							cardNotFound = false
							break
						end
					end
				else
					for i = #gameSlots, 1, -1 do
						if (gameSlots[i].x > gameSlots[currentCardSelected].x and 
							gameSlots[i].y == gameSlots[currentCardSelected].y and 
							gameSlots[i].alpha ~= 0 and gameSlots[i].inSlot == false) then
							
							currentCardSelected = i
							cardNotFound = false
							break
						end
					end
				end
			elseif (gameplayMode == 12) then
				for i = #gameGroups, 1, -1 do
					if (gameGroups[i].x > gameGroups[currentCardSelected].x and 
						-- gameGroups[i].y == gameGroups[currentCardSelected].y and 
						gameGroups[i].alpha ~= 0 and gameGroups[i].inBasket == false) then
						
						currentCardSelected = i
						cardNotFound = false
						break
					end
				end
			elseif (gameplayMode == 13 or gameplayMode == 14) then
				for i = #gameImages, 1, -1 do
					if (gameImages[i].x > gameImages[currentCardSelected].x and 
						-- gameImages[i].y == gameImages[currentCardSelected].y and 
						gameImages[i].alpha ~= 0 and gameImages[i].inBasket == false) then
						
						currentCardSelected = i
						cardNotFound = false
						break
					end
				end
			elseif (gameplayMode == 8) then
				for i = 1, #gameImages do
					if (gameImages[i].x > gameImages[currentCardSelected].x and 
							gameImages[i].y >= gameImages[currentCardSelected].y - 40 and
							gameImages[i].y <= gameImages[currentCardSelected].y + 40 and
							gameImages[i].alpha ~= 0 and gameImages[i].inBasket == false) then
						
						currentCardSelected = i
						cardNotFound = false
					end
				end
			elseif (gameplayMode == 10) then
				for i = #gameImages, 1, -1 do
					if (gameImages[i].x > gameImages[currentCardSelected].x and 
						gameImages[i].y >= gameImages[currentCardSelected].y - 30 and
						gameImages[i].y <= gameImages[currentCardSelected].y + 30 and
						gameImages[i].alpha ~= 0 and gameImages[i].inBasket == false) then
						
						currentCardSelected = i
						cardNotFound = false
						break
					end
				end
			
			else
				for i = #cards, 1, -1 do
					if (cards[i].x > cards[currentCardSelected].x and 
						cards[i].y == cards[currentCardSelected].y and 
						cards[i].alpha ~= 0 and cards[i].rotation == 0 or
						cards[i].x > cards[currentCardSelected].x and 
						cards[i].y == cards[currentCardSelected].y and 
						cards[i].alpha ~= 0 and cards[i].rotation == 90) then
						
						currentCardSelected = i
						cardNotFound = false
						break
					end
				end
			end
		end
		
		if (cardNotFound == true) then
			if (puzzlePieces) then
				for i = 1, #puzzlePieces do
					if (puzzlePieces[i].slotX < puzzlePieces[currentCardSelected].slotX and
						puzzlePieces[i].inSlot == false) then
						
						currentCardSelected = i
						
						break
					end
				end
			elseif (gameSlots or gameplayMode == 11 and gameNumbers) then
				if (currentSelected == "cards" and gameNumbers or
					gameplayMode == 11 and gameNumbers) then
				
					for i = 1, #gameNumbers do
						if (gameNumbers[i].x < gameNumbers[currentCardSelected].x and
							gameNumbers[i].alpha ~= 0 and gameNumbers[i].inSlot == false) then
							
							currentCardSelected = i
							
							break
						end
					end
				else
					for i = 1, #gameSlots do
						if (gameSlots[i].x < gameSlots[currentCardSelected].x and
							gameSlots[i].alpha ~= 0 and gameSlots[i].inSlot == false) then
							
							currentCardSelected = i
							
							break
						end
					end
				end
			elseif (gameplayMode == 12) then
				for i = 1, #gameGroups do
					if (gameGroups[i].x < gameGroups[currentCardSelected].x and
						gameGroups[i].alpha ~= 0 and gameGroups[i].inBasket == false) then
						
						currentCardSelected = i
						
						break
					end
				end
			elseif (gameplayMode == 8 or gameplayMode == 13 or gameplayMode == 14) then
				for i = 1, #gameImages do
					if (gameImages[i].x < gameImages[currentCardSelected].x and
						gameImages[i].alpha ~= 0 and gameImages[i].inBasket == false) then
						
						currentCardSelected = i
						
						break
					end
				end
			elseif (gameplayMode == 10) then
			else
				for i = 1, #cards do
					if (cards[i].x < cards[currentCardSelected].x and
						cards[i].alpha ~= 0 and cards[i].rotation == 0 or
						cards[i].x < cards[currentCardSelected].x and
						cards[i].alpha ~= 0 and cards[i].rotation == 90) then
						
						currentCardSelected = i
						
						break
					end
				end
			end
		end
		
		playReservedChannel(shakeSound, currentCursorChannel, 0)
		currentCursorChannel = currentCursorChannel + 1
		if (currentCursorChannel > 27) then
			currentCursorChannel = 26
		end
	
	elseif (keyName and keyName == "down") then
	
		local cardNotFound = true
		if (puzzlePieces) then
			for i = 1, #puzzlePieces do
				if (puzzlePieces[i].slotY > puzzlePieces[currentCardSelected].slotY and 
					puzzlePieces[i].slotX == puzzlePieces[currentCardSelected].slotX and 
					puzzlePieces[i].inSlot == false or
					puzzlePieces[i].image == "Rectangle" and
					puzzlePieces[i].slotY > puzzlePieces[currentCardSelected].slotY and 
					puzzlePieces[i].slotX <= puzzlePieces[currentCardSelected].slotX + 100 and 
					puzzlePieces[i].slotX >= puzzlePieces[currentCardSelected].slotX - 100 and
					puzzlePieces[i].inSlot == false or
					puzzlePieces[i].image == "Square" and
					puzzlePieces[i].slotY > puzzlePieces[currentCardSelected].slotY and 
					puzzlePieces[i].slotX <= puzzlePieces[currentCardSelected].slotX + 100 and 
					puzzlePieces[i].slotX >= puzzlePieces[currentCardSelected].slotX - 100 or
					puzzlePieces[i].image == "Triangle" and
					puzzlePieces[i].slotY > puzzlePieces[currentCardSelected].slotY and 
					puzzlePieces[i].slotX >= puzzlePieces[currentCardSelected].slotX - 50 and
					puzzlePieces[i].slotX <= puzzlePieces[currentCardSelected].slotX + 50 and 
					puzzlePieces[i].inSlot == false) then
					
					currentCardSelected = i
					cardNotFound = false
					break
				end
			end
		elseif (gameSlots or gameplayMode == 11 and gameNumbers) then
			if (currentSelected == "cards" and gameNumbers or
				gameplayMode == 11 and gameNumbers) then
				for i = 1, #gameNumbers do
					if (gameNumbers[i].y > gameNumbers[currentCardSelected].y and 
						gameNumbers[i].x >= gameNumbers[currentCardSelected].x - 30 and
						gameNumbers[i].x <= gameNumbers[currentCardSelected].x + 30 and
						-- gameNumbers[i].x == gameNumbers[currentCardSelected].x and 
						gameNumbers[i].alpha ~= 0 and gameNumbers[i].inSlot == false) then
						
						currentCardSelected = i
						cardNotFound = false
						break
					end
				end
			else
				for i = 1, #gameSlots do
					if (gameSlots[i].y > gameSlots[currentCardSelected].y and 
						gameSlots[i].x == gameSlots[currentCardSelected].x and 
						gameSlots[i].alpha ~= 0 and gameSlots[i].inSlot == false) then
						
						currentCardSelected = i
						cardNotFound = false
						break
					end
				end
			end
		elseif (gameplayMode == 13 or gameplayMode == 14 or gameplayMode == 12) then
		elseif (gameplayMode == 8) then
			for i = 1, #gameImages do
				if (gameImages[i].y > gameImages[currentCardSelected].y and 
						gameImages[i].x >= gameImages[currentCardSelected].x - 60 and
						gameImages[i].x <= gameImages[currentCardSelected].x + 60 and
						gameImages[i].alpha ~= 0 and gameImages[i].inBasket == false) then
					
					currentCardSelected = i
					cardNotFound = false
				end
			end
		elseif (gameplayMode == 10) then
			for i = 1, #gameImages do
				if (gameImages[i].y > gameImages[currentCardSelected].y + 15 and 
					gameImages[i].x == gameImages[currentCardSelected].x and 
					gameImages[i].alpha ~= 0 and gameImages[i].inBasket == false) then
					
					currentCardSelected = i
					cardNotFound = false
					break
				end
			end
		
		else
			for i = 1, #cards do
				if (cards[i].y > cards[currentCardSelected].y and 
					cards[i].x == cards[currentCardSelected].x and 
					cards[i].alpha ~= 0 and cards[i].rotation == 0 or
					cards[i].y > cards[currentCardSelected].y and 
					cards[i].x == cards[currentCardSelected].x and 
					cards[i].alpha ~= 0 and cards[i].rotation == 90) then
					
					currentCardSelected = i
					cardNotFound = false
					break
				end
			end
		end
		
		if (cardNotFound == true) then
			if (puzzlePieces) then
				for i = 1, #puzzlePieces do
					if (puzzlePieces[i].image ~= 9 and puzzlePieces[i].image ~= "IceCream" and puzzlePieces[i].image ~= "RedBird" and puzzlePieces[i].slotY < puzzlePieces[currentCardSelected].slotY and 
						puzzlePieces[i].slotX <= puzzlePieces[currentCardSelected].slotX and 
						puzzlePieces[i].inSlot == false) then
						
						currentCardSelected = i
						cardNotFound = false
						break
					end
				end
			elseif (gameSlots or gameplayMode == 11 and gameNumbers) then
				if (currentSelected == "cards" and gameNumbers or
						gameplayMode == 11 and gameNumbers) then
					for i = 1, #gameNumbers do
						if (gameNumbers[i].y < gameNumbers[currentCardSelected].y and 
							gameNumbers[i].x >= gameNumbers[currentCardSelected].x - 30 and
							gameNumbers[i].x <= gameNumbers[currentCardSelected].x + 30 and
							-- gameNumbers[i].x == gameNumbers[currentCardSelected].x and 
							gameNumbers[i].alpha ~= 0 and gameNumbers[i].inSlot == false) then
							
							currentCardSelected = i
							cardNotFound = false
							break
						end
					end
				else
					for i = 1, #gameSlots do
						if (gameSlots[i].y < gameSlots[currentCardSelected].y and 
							gameSlots[i].x == gameSlots[currentCardSelected].x and 
							gameSlots[i].alpha ~= 0 and gameSlots[i].inSlot == false) then
							
							currentCardSelected = i
							cardNotFound = false
							break
						end
					end
				end
			elseif (gameplayMode == 13 or gameplayMode == 14 or gameplayMode == 12) then
			elseif (gameplayMode == 8) then
				for i = #gameImages, 1, -1 do
					if (gameImages[i].y < gameImages[currentCardSelected].y and 
							gameImages[i].x >= gameImages[currentCardSelected].x - 60 and
							gameImages[i].x <= gameImages[currentCardSelected].x + 60 and
							gameImages[i].alpha ~= 0 and gameImages[i].inBasket == false) then
						
						currentCardSelected = i
						cardNotFound = false
					end
				end
			elseif (gameplayMode == 10) then	
				for i = 1, #gameImages do
					if (gameImages[i].y < gameImages[currentCardSelected].y - 15 and 
						gameImages[i].x == gameImages[currentCardSelected].x and 
						gameImages[i].alpha ~= 0 and gameImages[i].inBasket == false) then
						
						currentCardSelected = i
						cardNotFound = false
						break	
					end
				end
			
			else
				for i = 1, #cards do
					if (cards[i].y < cards[currentCardSelected].y and 
						cards[i].x == cards[currentCardSelected].x and 
						cards[i].alpha ~= 0 and cards[i].rotation == 0 or
						cards[i].y < cards[currentCardSelected].y and 
						cards[i].x == cards[currentCardSelected].x and 
						cards[i].alpha ~= 0 and cards[i].rotation == 90) then
						
						currentCardSelected = i
						cardNotFound = false
						break
					end
				end
			end
		end
		
		
		if (cardNotFound == true) then
			if (puzzlePieces) then
				for i = 1, #puzzlePieces do
					if (puzzlePieces[i].inSlot == false and 
						puzzlePieces[i].slotY > puzzlePieces[currentCardSelected].slotY) then
						
						currentCardSelected = i
						cardNotFound = false
						break
					end
				end
			elseif (gameSlots or gameplayMode == 11 and gameNumbers) then
				if (currentSelected == "cards" and gameNumbers or
						gameplayMode == 11 and gameNumbers) then
					for i = 1, #gameNumbers do
						if (gameNumbers[i].alpha ~= 0 and gameNumbers[i].inSlot == false and 
							gameNumbers[i].y > gameNumbers[currentCardSelected].y) then
							
							currentCardSelected = i
							break
						end
					end
				else
					for i = 1, #gameSlots do
						if (gameSlots[i].alpha ~= 0 and gameSlots[i].inSlot == false and 
							gameSlots[i].y > gameSlots[currentCardSelected].y) then
							
							currentCardSelected = i
							break
						end
					end
				end
			elseif (gameplayMode == 8 or gameplayMode == 13 or gameplayMode == 14 or gameplayMode == 12) then
			elseif (gameplayMode == 10) then	
				local firstCheck = nil
				for i = 1, #gameImages do
					if (gameImages[i].alpha ~= 0 and gameImages[i].inBasket == false and 
						gameImages[i].y > gameImages[currentCardSelected].y + 15) then
						
						if (firstCheck == nil) then
							firstCheck = i
						else
							local diff1 = math.abs(gameImages[firstCheck].x - gameImages[currentCardSelected].x)
							local diff2 = math.abs(gameImages[i].x - gameImages[currentCardSelected].x)
						
							if (diff2 < diff1) then
								firstCheck = i
							end
						end
					end
				end
				if (firstCheck ~= nil) then
					currentCardSelected = firstCheck
				end
				
			else
				for i = 1, #cards do
					if (cards[i].alpha ~= 0 and cards[i].rotation == 0 and 
						cards[i].y > cards[currentCardSelected].y or
						cards[i].alpha ~= 0 and cards[i].rotation == 90 and 
						cards[i].y > cards[currentCardSelected].y) then
						
						currentCardSelected = i
						break
					end
				end
			end
		end
		
		
		if (cardNotFound == true) then
			if (puzzlePieces) then
				for i = 1, #puzzlePieces do
					if (puzzlePieces[i].image == 9 and puzzlePieces[i].slotY < puzzlePieces[currentCardSelected].slotY and 
						puzzlePieces[i].inSlot == false or
						puzzlePieces[i].image == "IceCream" and puzzlePieces[i].slotY < puzzlePieces[currentCardSelected].slotY and 
						puzzlePieces[i].inSlot == false or
						puzzlePieces[i].image == "RedBird" and puzzlePieces[i].slotY < puzzlePieces[currentCardSelected].slotY and 
						puzzlePieces[i].inSlot == false or
						puzzlePieces[i].image == "Rectangle" and puzzlePieces[i].slotY < puzzlePieces[currentCardSelected].slotY and 
						puzzlePieces[i].inSlot == false or
						puzzlePieces[i].image == "Square" and puzzlePieces[i].slotY < puzzlePieces[currentCardSelected].slotY and 
						puzzlePieces[i].inSlot == false) then
						
						currentCardSelected = i
						cardNotFound = false
						break
					end
				end
			end
		end
		
		playReservedChannel(shakeSound, currentCursorChannel, 0)
		currentCursorChannel = currentCursorChannel + 1
		if (currentCursorChannel > 27) then
			currentCursorChannel = 26
		end
		
	elseif (keyName and keyName == "up") then
	
		local cardNotFound = true
		if (puzzlePieces) then
			for i = #puzzlePieces, 1, -1 do
				if (puzzlePieces[i].slotY < puzzlePieces[currentCardSelected].slotY and 
					puzzlePieces[i].slotX == puzzlePieces[currentCardSelected].slotX and 
					puzzlePieces[i].inSlot == false) then
					
					currentCardSelected = i
					cardNotFound = false
					break
				end
			end
		elseif (gameSlots or gameplayMode == 11 and gameNumbers) then
			if (currentSelected == "cards" and gameNumbers or
						gameplayMode == 11 and gameNumbers) then
				for i = #gameNumbers, 1, -1 do
					if (gameNumbers[i].y < gameNumbers[currentCardSelected].y and 
						gameNumbers[i].x >= gameNumbers[currentCardSelected].x - 30 and
						gameNumbers[i].x <= gameNumbers[currentCardSelected].x + 30 and
						-- gameNumbers[i].x == gameNumbers[currentCardSelected].x and 
						gameNumbers[i].alpha ~= 0 and gameNumbers[i].inSlot == false) then
						
						currentCardSelected = i
						cardNotFound = false
						break
					end
				end
			else
				for i = #gameSlots, 1, -1 do
					if (gameSlots[i].y < gameSlots[currentCardSelected].y and 
						gameSlots[i].x == gameSlots[currentCardSelected].x and 
						gameSlots[i].alpha ~= 0 and gameSlots[i].inSlot == false) then
						
						currentCardSelected = i
						cardNotFound = false
						break
					end
				end
			end
		elseif (gameplayMode == 13 or gameplayMode == 14 or gameplayMode == 12) then
		elseif (gameplayMode == 8) then
			for i = #gameImages, 1, -1 do
				if (gameImages[i].y < gameImages[currentCardSelected].y and 
						gameImages[i].x >= gameImages[currentCardSelected].x - 60 and
						gameImages[i].x <= gameImages[currentCardSelected].x + 60 and
						gameImages[i].alpha ~= 0 and gameImages[i].inBasket == false) then
					
					currentCardSelected = i
					cardNotFound = false
				end
			end
		elseif (gameplayMode == 10) then
			for i = #gameImages, 1, -1 do
				if (gameImages[i].y < gameImages[currentCardSelected].y - 15 and 
					gameImages[i].x == gameImages[currentCardSelected].x and 
					gameImages[i].alpha ~= 0 and gameImages[i].inBasket == false) then
					
					currentCardSelected = i
					cardNotFound = false
					break
				end
			end
		
		else
			for i = #cards, 1, -1 do
				if (cards[i].y < cards[currentCardSelected].y and 
					cards[i].x == cards[currentCardSelected].x and 
					cards[i].alpha ~= 0 and cards[i].rotation == 0 or
					cards[i].y < cards[currentCardSelected].y and 
					cards[i].x == cards[currentCardSelected].x and 
					cards[i].alpha ~= 0 and cards[i].rotation == 90) then
					
					currentCardSelected = i
					cardNotFound = false
					break
				end
			end
		end
		
		if (cardNotFound == true) then
			if (puzzlePieces) then
				for i = #puzzlePieces, 1, -1 do
					if (puzzlePieces[i].image ~= 9 and puzzlePieces[i].image ~= "IceCream" and puzzlePieces[i].image ~= "RedBird" and puzzlePieces[i].slotY > puzzlePieces[currentCardSelected].slotY and 
						puzzlePieces[i].slotX == puzzlePieces[currentCardSelected].slotX and 
						puzzlePieces[i].inSlot == false) then
						
						currentCardSelected = i
						cardNotFound = false
						break
					end
				end
			elseif (gameSlots or gameplayMode == 11 and gameNumbers) then
				if (currentSelected == "cards" and gameNumbers or
						gameplayMode == 11 and gameNumbers) then
					for i = #gameNumbers, 1, -1 do
						if (gameNumbers[i].y > gameNumbers[currentCardSelected].y and 
							gameNumbers[i].x >= gameNumbers[currentCardSelected].x - 30 and
							gameNumbers[i].x <= gameNumbers[currentCardSelected].x + 30 and
							-- gameNumbers[i].x == gameNumbers[currentCardSelected].x and 
							gameNumbers[i].alpha ~= 0 and gameNumbers[i].inSlot == false) then
							
							currentCardSelected = i
							cardNotFound = false
							break
						end
					end
				else
					for i = #gameSlots, 1, -1 do
						if (gameSlots[i].y > gameSlots[currentCardSelected].y and 
							gameSlots[i].x == gameSlots[currentCardSelected].x and 
							gameSlots[i].alpha ~= 0 and gameSlots[i].inSlot == false) then
							
							currentCardSelected = i
							cardNotFound = false
							break
						end
					end
				end
			elseif (gameplayMode == 13 or gameplayMode == 14 or gameplayMode == 12) then
			elseif (gameplayMode == 8) then
				for i = 1, #gameImages do
					if (gameImages[i].y > gameImages[currentCardSelected].y and 
							gameImages[i].x >= gameImages[currentCardSelected].x - 60 and
							gameImages[i].x <= gameImages[currentCardSelected].x + 60 and
							gameImages[i].alpha ~= 0 and gameImages[i].inBasket == false) then
						
						currentCardSelected = i
						cardNotFound = false
					end
				end
			elseif (gameplayMode == 10) then	
				for i = #gameImages, 1, -1 do
					if (gameImages[i].y > gameImages[currentCardSelected].y + 15 and 
						gameImages[i].x == gameImages[currentCardSelected].x and 
						gameImages[i].alpha ~= 0 and gameImages[i].inBasket == false) then
						
						currentCardSelected = i
						cardNotFound = false
						break
					end
				end
			
			else
				for i = #cards, 1, -1 do
					if (cards[i].y > cards[currentCardSelected].y and 
						cards[i].x == cards[currentCardSelected].x and 
						cards[i].alpha ~= 0 and cards[i].rotation == 0 or
						cards[i].y > cards[currentCardSelected].y and 
						cards[i].x == cards[currentCardSelected].x and 
						cards[i].alpha ~= 0 and cards[i].rotation == 90) then
						
						currentCardSelected = i
						cardNotFound = false
						break
					end
				end
			end
		end
		
		if (cardNotFound == true) then
			if (puzzlePieces) then
				for i = #puzzlePieces, 1, -1 do
					if (puzzlePieces[i].inSlot == false and 
						puzzlePieces[i].slotY < puzzlePieces[currentCardSelected].slotY) then
						
						currentCardSelected = i
						cardNotFound = false
						break
					end
				end
			elseif (gameSlots or gameplayMode == 11 and gameNumbers) then
				if (currentSelected == "cards" and gameNumbers or
						gameplayMode == 11 and gameNumbers) then
					for i = 1, #gameNumbers do
						if (gameNumbers[i].alpha ~= 0 and gameNumbers[i].inSlot == false and 
							gameNumbers[i].y < gameNumbers[currentCardSelected].y) then
							
							currentCardSelected = i
							break
						end
					end
				else
					for i = 1, #gameSlots do
						if (gameSlots[i].alpha ~= 0 and gameSlots[i].inSlot == false and 
							gameSlots[i].y < gameSlots[currentCardSelected].y) then
							
							currentCardSelected = i
							break
						end
					end
				end
			elseif (gameImages) then
				if (gameplayMode == 10) then
					-- for i = 1, #gameImages do
						-- if (gameImages[i].alpha ~= 0 and gameImages[i].inBasket == false and 
							-- gameImages[i].y < gameImages[currentCardSelected].y) then
							
							-- currentCardSelected = i
							-- break
						-- end
					-- end
					
					local firstCheck = nil
					for i = 1, #gameImages do
						if (gameImages[i].alpha ~= 0 and gameImages[i].inBasket == false and 
							gameImages[i].y < gameImages[currentCardSelected].y - 15) then
							
							if (firstCheck == nil) then
								firstCheck = i
							else
								local diff1 = math.abs(gameImages[firstCheck].x - gameImages[currentCardSelected].x)
								local diff2 = math.abs(gameImages[i].x - gameImages[currentCardSelected].x)
							
								if (diff2 < diff1) then
									firstCheck = i
								end
							end
						end
					end
					
					if (firstCheck ~= nil) then
						currentCardSelected = firstCheck
					end
				end
			
			else
				for i = 1, #cards do
					if (cards[i].alpha ~= 0 and cards[i].rotation == 0 and 
						cards[i].y < cards[currentCardSelected].y or
						cards[i].alpha ~= 0 and cards[i].rotation == 90 and 
						cards[i].y < cards[currentCardSelected].y) then
						
						currentCardSelected = i
						break
					end
				end
			end
		end
		
		if (cardNotFound == true) then
			if (puzzlePieces) then
				for i = #puzzlePieces, 1, -1 do
					if (puzzlePieces[i].image == 9 and puzzlePieces[i].slotY > puzzlePieces[currentCardSelected].slotY and 
						puzzlePieces[i].inSlot == false or
						puzzlePieces[i].image == "IceCream" and puzzlePieces[i].slotY > puzzlePieces[currentCardSelected].slotY and 
						puzzlePieces[i].inSlot == false or
						puzzlePieces[i].image == "RedBird" and puzzlePieces[i].slotY > puzzlePieces[currentCardSelected].slotY and 
						puzzlePieces[i].inSlot == false or
						puzzlePieces[i].image == "Rectangle" and puzzlePieces[i].slotY > puzzlePieces[currentCardSelected].slotY and 
						puzzlePieces[i].inSlot == false or
						puzzlePieces[i].image == "Square" and puzzlePieces[i].slotY > puzzlePieces[currentCardSelected].slotY and 
						puzzlePieces[i].inSlot == false) then
						
						currentCardSelected = i
						cardNotFound = false
						break
					end
				end
			end
		end
		
		playReservedChannel(shakeSound, currentCursorChannel, 0)
		currentCursorChannel = currentCursorChannel + 1
		if (currentCursorChannel > 27) then
			currentCursorChannel = 26
		end
	end
	
	
	if (puzzlePieces) then
		if (puzzlePieces[currentCardSelected]) then
			-- cursor.x, cursor.y = gameSlots[currentCardSelected]:localToContent( 0, 0 )
			-- cursor.x, cursor.y = gameSlots[currentCardSelected]:localToContent( 1, 1 )
			local offsetX, offsetY = getCursorOffset( currentCardSelected )
			
			cursor.x, cursor.y = piecesGroup.x + puzzlePieces[currentCardSelected].slotX + offsetX, piecesGroup.y + puzzlePieces[currentCardSelected].slotY + offsetY
			cursor:toFront()
			-- targetCard = puzzlePieces[currentCardSelected]
		end
	-- elseif (gameSlots) then
		-- if (gameSlots[currentCardSelected]) then
			---- cursor.x, cursor.y = gameSlots[currentCardSelected]:localToContent( 0, 0 )
			---- cursor.x, cursor.y = gameSlots[currentCardSelected]:localToContent( 1, 1 )
			-- cursor.x, cursor.y = gameSlots[currentCardSelected]:localToContent( gameSlots[currentCardSelected].contentWidth*0.8, gameSlots[currentCardSelected].contentHeight*0.8 )
			-- cursor:toFront()
			-- targetCard = gameSlots[currentCardSelected]
		-- end
	elseif (gameplayMode == 11) then
		if (gameNumber) then
			print("test 1")
		else
			if (gameNumbers[currentCardSelected]) then
				-- cursor.x, cursor.y = gameNumbers[currentCardSelected]:localToContent( 0, 0 )
				-- cursor.x, cursor.y = gameNumbers[currentCardSelected]:localToContent( 1, 1 )
				if (#gameNumbers == 3 and gameNumbers[currentCardSelected].id ~= 20) then
					cursor.x, cursor.y = gameNumbers[currentCardSelected]:localToContent( gameNumbers[currentCardSelected].contentWidth*0.75, gameNumbers[currentCardSelected].contentHeight*0.75 )
				else
					cursor.x, cursor.y = gameNumbers[currentCardSelected]:localToContent( gameNumbers[currentCardSelected].contentWidth*1.1, gameNumbers[currentCardSelected].contentHeight*1.1 )
				end
				cursor:toFront()
				targetCard = gameNumbers[currentCardSelected]
			end
		end
	elseif (gameSlots) then
		if (puzzleOptions and puzzleOptions.imageSet == "Cards" or currentSelected == "cards" and puzzleOptions and puzzleOptions.imageSet == "CardsPutInOrder") then
			cursor.x, cursor.y = gameNumbers[currentCardSelected]:localToContent( gameNumbers[currentCardSelected].contentWidth*1.5, gameNumbers[currentCardSelected].contentHeight*1.5 )
			cursor:toFront()
			targetCard = gameNumbers[currentCardSelected]
		elseif (puzzleOptions and puzzleOptions.imageSet == "CardsClassic") then
			cursor.x, cursor.y = gameNumbers[currentCardSelected]:localToContent( gameNumbers[currentCardSelected].contentWidth*0.37, gameNumbers[currentCardSelected].contentHeight*0.5 )
			cursor:toFront()
			targetCard = gameNumbers[currentCardSelected]
		elseif (currentSelected == "cards" and gameNumbers) then
			if (gameplayMode == 9) then
				if (puzzleOptions.imageSet == "CardsPutInOrderClassic" or puzzleOptions.imageSet == "CardsPutInOrderClassicDifficult") then
					cursor.x, cursor.y = gameNumbers[currentCardSelected]:localToContent( gameNumbers[currentCardSelected].contentWidth*0.37, gameNumbers[currentCardSelected].contentHeight*0.5 )
					cursor:toFront()
					targetCard = gameNumbers[currentCardSelected]
				elseif (puzzleOptions.imageSet == "") then
					cursor.x, cursor.y = gameNumbers[currentCardSelected]:localToContent( gameNumbers[currentCardSelected].contentWidth*1.3, gameNumbers[currentCardSelected].contentHeight*1.3 )
					cursor:toFront()
					targetCard = gameNumbers[currentCardSelected]
				elseif (puzzleOptions.imageSet == "Num" or puzzleOptions.imageSet == "NumDifficult") then
					cursor.x, cursor.y = gameNumbers[currentCardSelected]:localToContent( gameNumbers[currentCardSelected].contentWidth*1.1, gameNumbers[currentCardSelected].contentHeight*1.1 )
					cursor:toFront()
					targetCard = gameNumbers[currentCardSelected]
				elseif (puzzleOptions.imageSet == "CardsNum"  or puzzleOptions.imageSet == "CardsNumDifficult") then
					cursor.x, cursor.y = gameNumbers[currentCardSelected]:localToContent( gameNumbers[currentCardSelected].contentWidth*0.5, gameNumbers[currentCardSelected].contentHeight*0.45 )
					cursor:toFront()
					targetCard = gameNumbers[currentCardSelected]
				else
					cursor.x, cursor.y = gameNumbers[currentCardSelected]:localToContent( gameNumbers[currentCardSelected].contentWidth*0.8, gameNumbers[currentCardSelected].contentHeight*0.8 )
					cursor:toFront()
					targetCard = gameNumbers[currentCardSelected]
				end
			elseif (gameNumbers[currentCardSelected]) then
				-- cursor.x, cursor.y = gameNumbers[currentCardSelected]:localToContent( 0, 0 )
				-- cursor.x, cursor.y = gameNumbers[currentCardSelected]:localToContent( 1, 1 )
				cursor.x, cursor.y = gameNumbers[currentCardSelected]:localToContent( gameNumbers[currentCardSelected].contentWidth*0.37, gameNumbers[currentCardSelected].contentHeight*0.5 )
				cursor:toFront()
				targetCard = gameNumbers[currentCardSelected]
			end
		else
			if (gameSlots[currentCardSelected]) then
				-- cursor.x, cursor.y = gameSlots[currentCardSelected]:localToContent( 0, 0 )
				-- cursor.x, cursor.y = gameSlots[currentCardSelected]:localToContent( 1, 1 )
				if (puzzleOptions.imageSet == "CardsNum" or puzzleOptions.imageSet == "CardsNumDifficult" or puzzleOptions.imageSet == "CardsPutInOrderClassic" or puzzleOptions.imageSet == "CardsPutInOrderClassicDifficult") then
					cursor.x, cursor.y = gameSlots[currentCardSelected]:localToContent( gameSlots[currentCardSelected].contentWidth*0.37, gameSlots[currentCardSelected].contentHeight*0.37 )
					cursor:toFront()
					targetCard = gameSlots[currentCardSelected]
				elseif (puzzleOptions.imageSet == "CardsPutInOrder") then
					cursor.x, cursor.y = gameSlots[currentCardSelected]:localToContent( gameSlots[currentCardSelected].contentWidth*0.8, gameSlots[currentCardSelected].contentHeight*0.7 ) -- both were 0.8
					cursor:toFront()
					targetCard = gameSlots[currentCardSelected]
				elseif (puzzleOptions.imageSet == "") then
					cursor.x, cursor.y = gameSlots[currentCardSelected]:localToContent( gameSlots[currentCardSelected].contentWidth*1, gameSlots[currentCardSelected].contentHeight*1 ) -- both were 0.8
					cursor:toFront()
					targetCard = gameSlots[currentCardSelected]
				else
					cursor.x, cursor.y = gameSlots[currentCardSelected]:localToContent( gameSlots[currentCardSelected].contentWidth*0.8, gameSlots[currentCardSelected].contentHeight*0.8 ) -- both were 0.8
					cursor:toFront()
					targetCard = gameSlots[currentCardSelected]
				end
			end
		end

	elseif (gameplayMode == 12) then
		if (gameGroups[currentCardSelected]) then
			-- cursor.x, cursor.y = gameGroups[currentCardSelected]:localToContent( 0, 0 )
			-- cursor.x, cursor.y = gameGroups[currentCardSelected]:localToContent( 1, 1 )
			
			if system.getInfo( "platformName" ) == "Android" then
				cursor.x, cursor.y = gameGroups[currentCardSelected]:localToContent( (gameGroups[currentCardSelected].contentWidth*0.8), (gameGroups[currentCardSelected].contentHeight*0.5) ) -- was -3 and -113
			else
				cursor.x, cursor.y = gameGroups[currentCardSelected]:localToContent( gameGroups[currentCardSelected].contentWidth*0.8, gameGroups[currentCardSelected].contentHeight*0.5 )
			end
				
			cursor:toFront()
			targetCard = gameGroups[currentCardSelected]
		end
	elseif (gameplayMode == 8 or gameplayMode == 10 or gameplayMode == 13 or gameplayMode == 14) then
		if (gameImages[currentCardSelected]) then
			-- cursor.x, cursor.y = gameImages[currentCardSelected]:localToContent( 0, 0 )
			-- cursor.x, cursor.y = gameImages[currentCardSelected]:localToContent( 1, 1 )
			
			
			if (gameplayMode == 10 and #gameImages < 4) then
				if system.getInfo( "platformName" ) == "Android" then
					cursor.x, cursor.y = gameImages[currentCardSelected]:localToContent( (gameImages[currentCardSelected].contentWidth*0.5), (gameImages[currentCardSelected].contentHeight*0.5) ) -- was -3 and -113
				else
					cursor.x, cursor.y = gameImages[currentCardSelected]:localToContent( gameImages[currentCardSelected].contentWidth*0.5, gameImages[currentCardSelected].contentHeight*0.5 )
				end
			else
				if system.getInfo( "platformName" ) == "Android" then
					if (gameplayMode == 13) then
						if (#gameImages <= 3) then
							cursor.x, cursor.y = gameImages[currentCardSelected]:localToContent( (gameImages[currentCardSelected].contentWidth*0.8), (gameImages[currentCardSelected].contentHeight*0.8) - 150 )
						elseif (#gameImages == 4) then
							cursor.x, cursor.y = gameImages[currentCardSelected]:localToContent( (gameImages[currentCardSelected].contentWidth*0.8), (gameImages[currentCardSelected].contentHeight*0.8) - 140 )
						elseif (#gameImages == 5) then
							cursor.x, cursor.y = gameImages[currentCardSelected]:localToContent( (gameImages[currentCardSelected].contentWidth*0.8), (gameImages[currentCardSelected].contentHeight*0.8) - 135 )
						elseif (#gameImages == 6) then
							cursor.x, cursor.y = gameImages[currentCardSelected]:localToContent( (gameImages[currentCardSelected].contentWidth*0.8), (gameImages[currentCardSelected].contentHeight*0.8) - 115 )
						elseif (#gameImages == 7) then
							cursor.x, cursor.y = gameImages[currentCardSelected]:localToContent( (gameImages[currentCardSelected].contentWidth*0.8), (gameImages[currentCardSelected].contentHeight*0.8) - 105 )
						elseif (#gameImages == 8) then
							cursor.x, cursor.y = gameImages[currentCardSelected]:localToContent( (gameImages[currentCardSelected].contentWidth*0.8), (gameImages[currentCardSelected].contentHeight*0.8) - 87 )
						elseif (#gameImages == 9) then
							cursor.x, cursor.y = gameImages[currentCardSelected]:localToContent( (gameImages[currentCardSelected].contentWidth*0.8), (gameImages[currentCardSelected].contentHeight*0.8) - 80 )
						else
							cursor.x, cursor.y = gameImages[currentCardSelected]:localToContent( (gameImages[currentCardSelected].contentWidth*0.8), (gameImages[currentCardSelected].contentHeight*0.8) - 100 )
						end
						-- cursor.x, cursor.y = gameImages[currentCardSelected]:localToContent( (gameImages[currentCardSelected].contentWidth*0.8) -3, (gameImages[currentCardSelected].contentHeight*0.8)- 143 ) -- was -3 and -113
					else
						if (basketItemOptions[currentImage].id == "heartCount" or basketItemOptions[currentImage].id == "starCount" or basketItemOptions[currentImage].id == "raspberry" or basketItemOptions[currentImage].id == "basketStrawberry" or basketItemOptions[currentImage].id == "watermelon") then
							cursor.x, cursor.y = gameImages[currentCardSelected]:localToContent( gameImages[currentCardSelected].contentWidth*0.6, gameImages[currentCardSelected].contentHeight*0.6 )
						else
							cursor.x, cursor.y = gameImages[currentCardSelected]:localToContent( (gameImages[currentCardSelected].contentWidth*0.8), (gameImages[currentCardSelected].contentHeight*0.8) ) -- was -3 and -113
						end
					end
				else
					if (basketItemOptions[currentImage].id == "heartCount" or basketItemOptions[currentImage].id == "starCount" or basketItemOptions[currentImage].id == "raspberry" or basketItemOptions[currentImage].id == "basketStrawberry" or basketItemOptions[currentImage].id == "watermelon") then
						cursor.x, cursor.y = gameImages[currentCardSelected]:localToContent( gameImages[currentCardSelected].contentWidth*0.6, gameImages[currentCardSelected].contentHeight*0.6 )
					else
						cursor.x, cursor.y = gameImages[currentCardSelected]:localToContent( gameImages[currentCardSelected].contentWidth*0.8, gameImages[currentCardSelected].contentHeight*0.8 )
					end
				end
			end
			cursor:toFront()
			targetCard = gameImages[currentCardSelected]
		end
	
	else
		if (cards[currentCardSelected]) then
			-- cursor.x, cursor.y = cards[currentCardSelected]:localToContent( 0, 0 )
			-- cursor.x, cursor.y = cards[currentCardSelected]:localToContent( 1, 1 )
			
			if (cards[currentCardSelected].rotation == 0) then
				cursor.x, cursor.y = cards[currentCardSelected]:localToContent( cards[currentCardSelected].contentWidth*0.37, cards[currentCardSelected].contentHeight*0.5 )
			else
				cursor.x, cursor.y = cards[currentCardSelected]:localToContent( cards[currentCardSelected].contentWidth*0.41, cards[currentCardSelected].contentHeight*-0.52 )
			end
			
			-- cursor.x, cursor.y = cards[currentCardSelected]:localToContent( cards[currentCardSelected].contentWidth*0.37, cards[currentCardSelected].contentHeight*0.5 )
			cursor:toFront()
			targetCard = cards[currentCardSelected]
		end
	end
	

end

function trackCursor( event )
        
	local keyName = event.keyName
	
       -- local alert = native.showAlert( "buttonAlert2", "2 - phase:"..event.phase.. " key:"..event.keyName )
	if (event.phase == "began" and buttonsActive == true and currentState == "game" or
		keyName and event.phase == "down" and buttonsActive and keyName ~= "menu" and currentState == "game")then
	
		if (event.keyName and event.keyName == "right") then
			
			controllerDirectionPressed("right")
			
		elseif (event.keyName and event.keyName == "left") then
		
			controllerDirectionPressed("left")
		
		elseif (event.keyName and event.keyName == "down") then
		
			controllerDirectionPressed("down")
			
		elseif (event.keyName and event.keyName == "up") then

			controllerDirectionPressed("up")
		
		end
		
		-- if (cards[currentCardSelected]) then
			-- cursor.x, cursor.y = cards[currentCardSelected]:localToContent( cards[currentCardSelected].contentWidth*0.37, cards[currentCardSelected].contentHeight*0.5 )
			-- cursor:toFront()
			-- targetCard = cards[currentCardSelected]
		-- end
	
	end

end

function trackCursorAxis( event )

	if (buttonsActive == true and currentState == "game" and version.appStore ~= "Chrome") then

		if event.normalizedValue > 0 then
			axisName = event.axis.type .. "+"
		else
			axisName = event.axis.type .. "-"
		end
		
		-- testText.text = axisName
		
		if math.abs(event.normalizedValue) >= controllerSensitivity then
			if (axisName == "leftX-" or axisName == "x-") then
				controllerDirectionPressed("left")
				Runtime:removeEventListener( "axis", trackCursorAxis )
				timer.performWithDelay( controllerAxisDelay, function()
					Runtime:addEventListener( "axis", trackCursorAxis )
				end )
			elseif (axisName == "leftX+" or axisName == "x+") then
				controllerDirectionPressed("right")
				Runtime:removeEventListener( "axis", trackCursorAxis )
				timer.performWithDelay( controllerAxisDelay, function()
					Runtime:addEventListener( "axis", trackCursorAxis )
				end )
			elseif (axisName == "leftY-" or axisName == "y-") then
				controllerDirectionPressed("up")
				Runtime:removeEventListener( "axis", trackCursorAxis )
				timer.performWithDelay( controllerAxisDelay, function()
					Runtime:addEventListener( "axis", trackCursorAxis )
				end )
			elseif (axisName == "leftY+" or axisName == "y+") then
				controllerDirectionPressed("down")
				Runtime:removeEventListener( "axis", trackCursorAxis )
				timer.performWithDelay( controllerAxisDelay, function()
					Runtime:addEventListener( "axis", trackCursorAxis )
				end )
			end
		end

	end

end


function startGame()	

	
	
	
	-- print("game started")
	-- transition.to( line1, { time=500, alpha=0, transition=easing.outExpo } )
	-- transition.to( line3, { time=500, alpha=0, transition=easing.outExpo } )
	-- transition.to( line5, { time=500, alpha=0, transition=easing.outExpo } )
	-- transition.to( bgWhite, { time=700, alpha = 0, transition=easing.outExpo } )

	local screenCapture = display.captureScreen()
	-- bgWhite.alpha = 1
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
	
	
	-- local details = levelDetails["level" .. level]
	local levelOptions = gameDetails["level" .. level]
	local bgImage = backgroundOptions[levelEditorDetails.levelSetting].image
	
	
	
	if (savedData.enableMusic == true) then
	
	
		----------OLD CODE-----------
        -- audio.stop( 3 )
		
		-- audio.play( bgOneMusic, { channel = 3, loops = -1 }  )
				-- audio.setVolume( 0, { channel=3 } )
		-- audio.setVolume( 1, { channel=3 } )
		
		-- audio.setVolume( 1, { channel=2 } )
		
		
		
		
		-- audio.stop( 2 )
		audio.stop( 3 )
		-- audio.stop( 4 )
		-- audio.stop( 5 )
		
		audio.play( musicOptions[levelEditorDetails.music], { channel = 3, loops = -1 }  )
		
		
		-- if (bgImage == "worldBG1") then
			-- audio.play( bgOneMusic, { channel = 2, loops = -1 }  )
		-- elseif (bgImage == "worldBG5") then
			-- audio.play( bgFiveMusic, { channel = 3, loops = -1 }  )
		-- elseif (bgImage == "worldBG6") then
			-- audio.play( bgSixMusic, { channel = 4, loops = -1 }  )
		-- elseif (bgImage == "worldBG7") then
			-- audio.play( bgSevenMusic, { channel = 5, loops = -1 }  )
		-- end
					-- audio.setVolume( 0, { channel=2 } )
					audio.setVolume( 0, { channel=3 } )
					-- audio.setVolume( 0, { channel=4 } )
					-- audio.setVolume( 0, { channel=5 } )
		-- if (bgImage == "worldBG1") then
			-- audio.setVolume( 1, { channel=2 } )
		-- elseif (bgImage == "worldBG5") then
			audio.setVolume( 1, { channel=3 } )
		-- elseif (bgImage == "worldBG6") then
			-- audio.setVolume( 1, { channel=4 } )
		-- elseif (bgImage == "worldBG7") then
			-- audio.setVolume( 1, { channel=5 } )
		-- end
		
		
	end
	
	-- audio.setVolume( 1, { channel=6 } )
	
	timer.performWithDelay( 500, setUpGameTimer )
	
	
	
	whichDifferentHSetsTable = {}
	
	randomizeTable( biggerSmaller )
	biggerSmallerCategory = 0
	
	
end

function loadBGItems()

	gamePathGroup.x = 0
	gamePathGroup.y = 0
	
	
	-- if (version.appStore == "Amazon" and system.getInfo ( "model" ) == "AFTB" or version.appStore == "Amazon FTV") then
	currentCardSelected = 1
	-- cursor = display.newImageRect("Images/UI/cursor.png", 94, 114)--381, 119 )
	-- cursor = display.newImageRect("Images/UI/cursor2.png", 85, 105)
	cursor = display.newImageRect("Images/UI/cursorHand.png", 59, 59)
	cursor.x = 0
	cursor.y = 0
	cursor.alpha = 0
	
	
	-- local details
	local levelOptions
	if (playingRandomGame == true) then
		-- details = levelDetails["level" .. charLevel]
		levelOptions = gameDetails["level" .. charLevel]
	else
		-- details = levelDetails["level" .. level]
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
	--gameBackground:setReferencePoint(display.BottomCenterReferencePoint) -- commented out for graphics 2.0 and replaced with:
        gameBackground.anchorX=0.5
        gameBackground.anchorY = 1
	gameBackground.x = halfW
	gameBackground.y = 270+(gameBackground.height/2)
	--gamePathGroup:insert( gameBackground )
	
	for i = 1, numGames do
		--gamePathText[#gamePathText+1] = display.newText( i, -400, 295, selectFont, 21 )
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
		
		--gamePathText[#gamePathText]:setTextColor(255, 255, 255)
		gamePathGroup:insert( gamePathText[#gamePathText] )
		
	
	end
	
	
	worldStar = display.newImageRect("Images/UI/worldStar.png", 15, 14 )
	--worldStar:setReferencePoint(display.centerReferencePoint) -- commented out for graphics 2.0 and replaced with:
        worldStar.anchorX = 0.5
        worldStar.anchorY = 0.5
		
	worldStar.x = waypointDetails[#waypointDetails].finish.x
	worldStar.y = waypointDetails[#waypointDetails].finish.y - 30
	worldStar.initY = worldStar.y
	worldStar.alpha = 1
	worldStar.frame = 0
	--gamePathGroup:insert( worldStar )
	
	Runtime:addEventListener( "enterFrame", worldStarFloat)
	
	
	
	local iconW, iconH
	-- if (display.pixelHeight == 960) then
		-- iconW = details.iconIphone4.width
		-- iconH = details.iconIphone4.height
	-- else
		iconW = iconDetails.width
		iconH = iconDetails.height
	-- end
	
	
	
	gameIcon = display.newImageRect("Images/UI/" .. iconDetails.image .. ".png", iconW, iconH )
	--gameIcon:setReferencePoint(display.centerReferencePoint) -- commented out for graphics 2.0 and replaced with:
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
	
	
	-- carGroup = display.newGroup()
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
	
	
	
	
	--gamePathGroup:insert( gameIcon )
	gamePathGroup.x = gamePathGroup.x + pathDetails.x
	gamePathGroup.y = gamePathGroup.y + pathDetails.y
	
	gameBackground.x = gameBackground.x + bgDetails.xOffset
	gameBackground.y = gameBackground.y + bgDetails.yOffset
	
	gameBackground.alpha = 1
	
	-- carGroup:toBack()
	-- dustGroupBack:toBack()
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
	-- print("system.getInfo "..system.getInfo( "targetAppStore" ))
	
	
	
	if (myData.isFireTV or myData.isController) then 
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
			
			
			-- print("test contentWidth")
			-- print(display.pixelWidth)
			-- print(screenGroup.width)
			
			-- testText = display.newText( "test", halfW, screenOriginY + 50, dynamicFont, 25 )
			-- testText:setFillColor( 0 )
			-- testText.text = "Test1 Display: " .. display.pixelWidth .. "  BG: " .. screenGroup.width
			
			-- if (screenGroup.width - 150 < display.pixelWidth) then
				-- testText.text = "Test2 Display: " .. display.pixelWidth .. "  BG: " .. screenGroup.width
			
				
				-- local newScale = (display.pixelWidth*1.3) / screenGroup.width
				-- local oldW, oldH = screenGroup.width, screenGroup.height
			
				-- screenGroup.width = screenGroup.width * newScale
				-- screenGroup.height = screenGroup.height * newScale
			-- end
			
			-- if (system.getInfo( "platformName" ) == "Android" ) then
				screenGroup.xScale, screenGroup.yScale = androidScale, androidScale
			-- else
				-- screenGroup.xScale, screenGroup.yScale = chromeScale, chromeScale
			-- end
			
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
	
	
	-- local details
	-- if (playingRandomGame == true) then
		-- details = levelDetails["level" .. charLevel]
	-- else
		-- details = levelDetails["level" .. level]
	-- end
	
	-- local detailsInstructions = details.instructions
	
	
	if (playingRandomGame == true and randomLevelDetails["random" .. randomLevelChallenge] and randomLevelDetails["random" .. randomLevelChallenge].showTime ~= "") then
		timer.performWithDelay( randomLevelDetails["random" .. randomLevelChallenge].showTime, startGame, 1 ) --was 1700
	else
		timer.performWithDelay( levelEditorDetails.levelIntroShowTime, startGame, 1 ) --was 1700
	end
	
	-- timer.performWithDelay( detailsInstructions.showTime, startGame, 1 ) --was 1700
	
	local function transAnim()
		removeCharAnim("fade")
	end
	-- timer.performWithDelay( detailsInstructions.showTime, transAnim ) --was 1700
	
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
	
	-- if (oniPhoneX == true) then
		-- bgSunGroup.x = screenEdgeX - 15 - 7
		-- bgSunGroup.y = screenOriginY + 8 + 7
	-- else
		-- bgSunGroup.x = screenEdgeX - 15
		-- bgSunGroup.y = screenOriginY + 8
	-- end
	
	if (oniPhoneX == true) then
		bgSunGroup.x = screenEdgeX - safeScreenDistX - 24
		bgSunGroup.y = safeScreenOriginY + 29
	else
		bgSunGroup.x = screenEdgeX - safeScreenDistX - 15
		bgSunGroup.y = safeScreenOriginY + 8
	end
	
	--- Sun position on all non iPhoneX platforms
	-- bgSunGroup.x = display.safeActualContentWidth + safeScreenOriginX - 15
	-- bgSunGroup.y = safeScreenOriginY + 8
	
	--- Sun position on iPhoneX only
	-- bgSunGroup.x = display.safeActualContentWidth + safeScreenOriginX - 24
	-- bgSunGroup.y = safeScreenOriginY + 29
	
	
	
	-- bgSunGroup.alpha = 0
	bgCloudsOneGroup.alpha = 0
	bgCloudsTwoGroup.alpha = 0
	
	gameCornerCloud1.alpha = 1
	-- gameCornerCloud2.alpha = 1
	
	if (myData.isFireTV or myData.isController) then 
		bgSunGroup.alpha = 0	
	end
	
	sun.alpha = 0
	sunTwo.alpha = 1
	
	-- backButton:setFillColor(9/255,196/255,236/255)
	
	
	if (playingRandomGame == true) then
		-- levelEditorDetails = levelEditor[charLevel]
	else
		-- levelEditorDetails = levelEditor[level]
		-- tweak lighter bg
		if (
			-- level == 9 or 
			-- level == 10 or 
			-- level == 12 or 
			-- level == 13 or
			-- level == 15 or
			-- level == 17 or
			-- level == 28
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
	
	

	-- local function playInstructionSound(event)
		-- if gameplayMatch == 1 then -- numbers to numbers
			-- playReservedChannel(colorsPicturesInstructionSound, 13, 0)
		-- elseif (gameplayMatch == 2) then -- groups to numbers
			-- playReservedChannel(picturesAndWordsInstructionSound, 13, 0)
		-- elseif (gameplayMatch == 3) then -- groups to groups
			-- playReservedChannel(colorsInstructionSound, 13, 0)
		-- elseif (gameplayMatch == 4) then -- pictures to pictures
			-- playReservedChannel(shapesInstructionSound, 13, 0)
		-- elseif (gameplayMatch == 5) then -- color to color
			-- playReservedChannel(picturesAndShapesInstructionSound, 13, 0)
		-- elseif (gameplayMatch == 6) then -- color to color
			-- playReservedChannel(shapesPicturesInstructionSound, 13, 0)
		-- end
	-- end
	
	
	instructions.anchorX=0.5
    instructions.anchorY=0.5 
	instructions.x = 0
	instructions.y = 0
	
	
	-- local details
	-- if (playingRandomGame == true) then
		-- details = levelDetails["level" .. charLevel]
	-- else
		-- details = levelDetails["level" .. level]
	-- end
	
	
	-- local detailsInstructions = details.instructions
	
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
	
	
	-- line1.text = detailsInstructions.line1
	-- line3.text = detailsInstructions.line2
	-- line5.text = detailsInstructions.line3
	-- line1.size = detailsInstructions.scale
	-- line3.size = detailsInstructions.scale
	-- line5.size = detailsInstructions.scale
	
	
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
		
	--line1:setReferencePoint( display.CenterLeftReferencePoint ) -- commented out for graphics 2.0 and replaced with:
        -- line1.anchorX=0
        -- line1.anchorY=0.5
	line1.x, line1.y = 0,  halfH + 24
	--line3:setReferencePoint( display.CenterLeftReferencePoint ) -- commented out for graphics 2.0 and replaced with:
	    -- line3.anchorX=0
        -- line3.anchorY=0.5
	-- line3.x, line3.y = 0, line1.y + detailsInstructions.spacing
	--line5:setReferencePoint( display.CenterLeftReferencePoint ) -- commented out for graphics 2.0 and replaced with:
        -- line5.anchorX=0
        -- line5.anchorY=0.5
	-- line5.x, line5.y = 0, line1.y + (detailsInstructions.spacing*2)
	
	
	if (playingRandomGame == true and randomLevelDetails["random" .. randomLevelChallenge] and randomLevelDetails["random" .. randomLevelChallenge].spacing ~= "") then
		line5.x, line5.y = 0, line1.y + (randomLevelDetails["random" .. randomLevelChallenge].spacing*2)
	else
		line5.x, line5.y = 0, line1.y + levelEditorDetails.levelIntroTextSpacing
	end
	
	
	
	if system.getInfo( "platformName" ) == "Android" then
		line1.y = halfH - 180 --60
		
		-- check 11, 26, 29
		if (level == 11 or level == 22 or level == 23 or level == 44) then
			line5.y = halfH - 152 --115 --130
		else
			line5.y = halfH - 140 --115 --130
		end
	end
	
	
	--instructions:setReferencePoint( display.CenterRightReferencePoint ) -- commented out for graphics 2.0 and replaced with:
	-- instructions.anchorChildren = true
	-- instructions.anchorX=0
    -- instructions.anchorY=0.5 
	
	
	-- instructions.x = screenEdgeX - ((screenEdgeX-(screenOriginX*3))/8  ) - 55 + detailsInstructions.offsetX
	-- instructions.x = halfW
	
	-- instructions.x = (display.viewableContentWidth/0.81)/2 + detailsInstructions.offsetX -- updated for graphics 2.0 conversion
	
	
	speechBubble.x = halfW + 130
	speechBubble.y = halfH - 90
	
	
	--instructions.xScale, instructions.yScale = levelEditorDetails.levelIntroTextSize, levelEditorDetails.levelIntroTextSize
	instructions.anchorX, instructions.anchorY = 0.5, 0.5
	
	instructions.y = speechBubble.y - 10 + levelEditorDetails.levelIntroTextYOffset
	instructions.x = speechBubble.x + levelEditorDetails.levelIntroTextXOffset
	
	-- if (playingRandomGame == true and randomLevelDetails["random" .. randomLevelChallenge] and randomLevelDetails["random" .. randomLevelChallenge].offsetX ~= "") then
		-- instructions.x = (display.viewableContentWidth/0.81)/2 + randomLevelDetails["random" .. randomLevelChallenge].offsetX
	-- else
		-- instructions.x = (display.viewableContentWidth/0.81)/2 + levelEditorDetails.levelIntroTextXOffset -- updated for graphics 2.0 conversion
	-- end
	
	-- instructions.y = halfH + levelEditorDetails.levelIntroTextYOffset-- updated for graphics 2.0 conversion
	if system.getInfo( "platformName" ) == "Android" then
		--instructions.y = halfH + levelEditorDetails.levelIntroTextYOffset - 50
		instructions.y = instructions.y - 37
	end
	
	line1:setFillColor(64/255,64/255,64/255) -- colored here when converting to graphics 2.0 (did not find text coloring, if code redundant, remove)
	line3:setFillColor(64/255,64/255,64/255) -- colored here when converting to graphics 2.0 (did not find text coloring, if code redundant, remove)
	line5:setFillColor(64/255,64/255,64/255) -- colored here when converting to graphics 2.0 (did not find text coloring, if code redundant, remove)
	
	
	-- startCharAnim( (screenEdgeX+(screenOriginX*3))/5 + 55 )
	-- startCharAnim( display.viewableContentWidth/3.1 )
	
	speechBubble:toFront()
	line1:toFront()
	line3:toFront()
	line5:toFront()
	instructions:toFront()
	
	-- timer.performWithDelay( 1300, gameStartAnim2, 1 )
	--timer.soundPerformWithDelay( 1600-soundDelay, playSoundTimer, { sound=touchAsManySound, reservedChannel=22, loopNumber=0 } )
	
	
	
	
	if (sceneSkip == 0) then
	
		startCharAnim( display.viewableContentWidth/3.1 )
	
		-- transition.to( speechBubble, { time=600, alpha=.9, transition=easing.outExpo } )
	
		transition.to( speechBubble, { time=600, alpha=.9, transition=easing.outExpo } )
	
		transition.to( line1, { time=1200, alpha=1, transition=easing.outExpo } )
	
		-- timer.performWithDelay( 1300, showTextTwo )
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
