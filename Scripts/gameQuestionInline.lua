-- Question game logic extracted from game.lua
local myData = require("Scripts.myData")

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
	
			if (myData.isTV) then 
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
				
				if (myData.isTV) then 
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
				
					
				
					if (myData.isTV) then 
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
			if (myData.isTV) then 
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
	
		if (myData.isTV) then 
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
	
		
		-- if (myData.isTV) then 
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

	-- if (myData.isTV and version.appStore ~= "Chrome") then 
	-- else
		transition.to( backButton, { time=700, alpha=1, transition=easing.outExpo } )
		transition.to( instructionsReplayButton, { time=700, alpha=1, transition=easing.outExpo } )
	-- end
	
	timer.performWithDelay( 550, backButtonTransition )
	
	
end

