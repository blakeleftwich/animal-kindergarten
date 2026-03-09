-- Equation game logic extracted from game.lua
local myData = require("Scripts.myData")

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

