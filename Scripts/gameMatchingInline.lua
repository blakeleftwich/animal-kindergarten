-- Matching game logic extracted from game.lua
local myData = require("Scripts.myData")

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

