-- Counting game logic (inline) extracted from game.lua
local myData = require("Scripts.myData")

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
											
			
			if (myData.isTV) then 
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
					
					if (myData.isTV) then 
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
				
				
				if (myData.isTV) then 
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
				
				
				if (myData.isTV) then 
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
			if (myData.isTV) then 
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
	
		if (myData.isTV) then 
			timer.performWithDelay( 700, makeButtonsActive )
		else
			makeButtonsActive()
		end
	
		for i = #cards, 1, -1 do
			cards[i]:addEventListener( "touch", CheckCounting )
		end
		
		if (myData.isTV) then 
		
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
	
	-- if (myData.isTV and version.appStore ~= "Chrome") then 
	-- else
		transition.to( backButton, { time=700, alpha=1, transition=easing.outExpo } )
		transition.to( instructionsReplayButton, { time=700, alpha=1, transition=easing.outExpo } )
	-- end
	
	timer.performWithDelay( 550, backButtonTransition )
	
end

