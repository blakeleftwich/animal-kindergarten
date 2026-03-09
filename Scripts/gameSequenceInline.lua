-- Sequence game logic extracted from game.lua
local myData = require("Scripts.myData")

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
												
		
			if (myData.isTV) then 
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
				
				if (myData.isTV) then 
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
	
		if (myData.isTV) then 
			timer.performWithDelay( 700, makeButtonsActive )
		else
			makeButtonsActive()
		end
	
		for i = #cards, 1, -1 do
			cards[i]:addEventListener( "touch", checkSequenceAnswer )
		end
		
		if (myData.isTV) then 
		
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
	
	-- if (myData.isTV and version.appStore ~= "Chrome") then 
	-- else
		transition.to( backButton, { time=700, alpha=1, transition=easing.outExpo } )
		transition.to( instructionsReplayButton, { time=700, alpha=1, transition=easing.outExpo } )
	-- end
	
	timer.performWithDelay( 550, backButtonTransition )

end

