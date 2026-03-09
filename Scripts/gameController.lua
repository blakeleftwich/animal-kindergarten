-- Controller/cursor logic extracted from game.lua
local myData = require("Scripts.myData")

function showCursor()

	currentCardSelected = 1
	for i = 1, #cards do
		--if (gameplayMode == 4 and system.getInfo ( "model" ) ~= "AFTB" and version.appStore ~= "Amazon FTV" or
		--	gameplayMode == 4 and system.getInfo ( "model" ) == "AFTB" and currentCountingNumber == startNumber or
		--	gameplayMode == 4 and version.appStore == "Amazon FTV" and currentCountingNumber == startNumber) then
		if ((gameplayMode == 4 and myData.isTV == false) or
			( myData.isTV and gameplayMode == 4 and currentCountingNumber == startNumber ) ) then
			
			
			
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
	if ((gameplayMode == 4 and myData.isTV == false) or
	( myData.isTV and gameplayMode == 4 and currentCountingNumber == startNumber ) )then
		
		
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
