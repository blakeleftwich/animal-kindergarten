local M = {}

local base = require("Scripts.gameModuleBase")
local _W, _H, _CX, _CY = base._W, base._H, base._CX, base._CY
local _TOP, _BTM, _RHT, _LFT = base._TOP, base._BTM, base._RHT, base._LFT
local _WIDTH, _HEIGHT = base._WIDTH, base._HEIGHT
local myData = require("Scripts.myData")

-------------------------------------------------
-------------------------------------------------
-------------------------------------------------
-- New Game object function
-------------------------------------------------
function M.new()
    ----------------------
    -- global variables --
    ----------------------
    -- local levelDetails = levelDetails["level" .. level]
    --local levelOptions = gameDetails["level" .. level]
    local gameOptions  = gameLevelDetails
	local detailsBG = gameOptions.grayBGY
    
	print("new puzzle")
	
    -- generate objects
    local this = display.newGroup()
    this.isLive = true
    this.isTouchEnable = true
    
    -- copy game details...
    local tblQuestion = gameOptions.questions
	local questionOptions = gameOptions.question
	local tblCards = gameOptions.cards
	local gameGroup = display.newGroup()
	local slotsGroup = display.newGroup()
	local choicesGroup = display.newGroup()
	local itemStartTouched = false
	local isEndGame = false
	local currentCount = 1
	local currentIndex = 1
	local currentItem = 0
	local currentSelectedTV = nil
	local showSlotBG = false
	local floaters = {}
	gameSlots = {}
	cards = {}
	gameNumbers = {}
	local numberOptions = {}
	
	local startRange, endRange = tblCards.startRange, tblCards.endRange
	local numSlots = math.random( 2, 4 )
	local puzzleNum = 0
	local sign = tblQuestion.sign
	local equationAnswer
	local equationAlternatives = {}
	
	local fireTVMultiCardOption = false
	if (myData.isFireTV or myData.isController) then 
		fireTVMultiCardOption = true
	end
	
	if (sign ~= "+" and sign ~= "-") then
		local randomSign = math.random(1,2)
		
		if (randomSign == 1) then
			sign = "+"
		else
			sign = "-"
		end
	end
	
	if (tblQuestion.isEquation == true) then
		numSlots = 3
	else
		numSlots = math.random( tblQuestion.minSlotsNum, tblQuestion.maxSlotsNum )
	end
	
	
	local sharkNumbers = {
		-- tScale = teach number scale, cScale = choose number scale
		{ id = 1, w = 88, h = 180, tScale = 1.05, cScale = 0.45 },
		{ id = 2, w = 136, h = 172, tScale = 1.05, cScale = 0.45 },
		{ id = 3, w = 128, h = 176, tScale = 1.05, cScale = 0.45 },
		{ id = 4, w = 164, h = 180, tScale = 1, cScale = 0.45 },
		{ id = 5, w = 136, h = 176, tScale = 1, cScale = 0.45 },
		{ id = 6, w = 160, h = 180, tScale = 1, cScale = 0.45 },
		{ id = 7, w = 148, h = 172, tScale = 1, cScale = 0.45 },
		{ id = 8, w = 156, h = 176, tScale = 1, cScale = 0.45 },
		{ id = 9, w = 160, h = 180, tScale = 1, cScale = 0.45 },
		{ id = 10, w = 268, h = 180, tScale = 0.8, cScale = 0.45 },
		{ id = 0, w = 168, h = 180, tScale = 1.05, cScale = 0.45 },
	
	}
	
	local slotNumbers = {
		-- tScale = teach number scale, cScale = choose number scale
		{ id = 1, w = 92, h = 184, scale = 0.5 },
		{ id = 2, w = 140, h = 176, scale = 0.5 },
		{ id = 3, w = 132, h = 180, scale = 0.5 },
		{ id = 4, w = 168, h = 184, scale = 0.5 },
		{ id = 5, w = 140, h = 180, scale = 0.5 },
		{ id = 6, w = 168, h = 188, scale = 0.5 },
		{ id = 7, w = 152, h = 176, scale = 0.5 },
		{ id = 8, w = 160, h = 180, scale = 0.5 },
		{ id = 9, w = 164, h = 184, scale = 0.5 },
		{ id = 10, w = 272, h = 184, scale = 0.4 },
		{ id = 0, w = 168, h = 180, scale = 0.5 },
	
	}
	
	local slotOptions = {
		-- spacing, scale per num slots
		{ 15, 1 },
		{ 15, 1 },
		{ 15, 1 },
		{ 15, 1 },
		{ 15, 1 },
		{ 10, 0.9 },
		{ 10, 0.9 },
		{ 10, 0.9 },
		{ 10, 0.9 },
		{ 10, 0.9 },
	}
	local choiceOptions = {
		-- spacing, scale per num choices
		{ 10, .95 },
		{ 10, .95 },
		{ 10, .95 },
		{ 10, 0.85 },
		{ 10, 0.85 },
		{ 10, 0.85 },
		{ 10, 0.85 },
		{ 10, 0.85 },
		{ 10, 0.85 },
		{ 10, 0.85 },
	}
	
	local rewardAnims = { 
		{ id = "shake", particles = "", duration = 4000, anchor = { 0.5, 0.5 }, particleOffset = { 0, 0 } }, 
		{ id = "spin", particles = "", duration = 700, anchor = { 0.5, 0.5 }, particleOffset = { 0, 0 } },
		{ id = "balloon", particles = "", duration = 4000, anchor = { 0.5, 0.5 }, particleOffset = { 0, 0 } },
		-- { id = "float", particles = "", duration = 4000, anchor = { 0.5, 0.5 }, particleOffset = { 0, 0 } },
	}
	
	
	print("current game")
	print(curGame)
	
	
	local randomNumbersTable = {}
	
	local startNum = 1
	
	
	if (tblQuestion.isEquation) then
	
		
		local equationAnswer = math.random(startRange, endRange)
	
	
		if (sign == "-") then
			randomNumbersTable[#randomNumbersTable+1] = equationAnswer
		end
		
		
		local percDiffStart = equationAnswer * .2
		local percDiffEnd = equationAnswer * .8
		local newFirstAnswer = math.random(percDiffStart, percDiffEnd)
		
		randomNumbersTable[#randomNumbersTable+1] = newFirstAnswer
		
		equationAlternatives[#equationAlternatives+1] = newFirstAnswer
		
		randomNumbersTable[#randomNumbersTable+1] = equationAnswer - newFirstAnswer
		
		equationAlternatives[#equationAlternatives+1] = equationAnswer - newFirstAnswer
		
		if (sign == "+") then
			randomNumbersTable[#randomNumbersTable+1] = equationAnswer
		end
	
		for i = 1, tblQuestion.numExtraChoices do
			local repeated = false
			local extraAnswer
			
			repeat
				repeated = false
				
				extraAnswer = math.random( 1, equationAnswer )
				
				for k = #randomNumbersTable, 1, -1 do
					if (randomNumbersTable[k] == extraAnswer) then
						repeated = true
					end
				end
				
				for m = 1, #randomNumbersTable do
					for n = 1, #randomNumbersTable do
						if (extraAnswer + randomNumbersTable[m] == randomNumbersTable[n]) then
							repeated = true
						end
					end
				end
				for m = 1, #randomNumbersTable do
					for n = 1, #randomNumbersTable do
						if (randomNumbersTable[m] + randomNumbersTable[n] == extraAnswer) then
							repeated = true
						end
					end
				end
				
			until repeated == false
			
			randomNumbersTable[#randomNumbersTable+1] = extraAnswer
		end
	
	
	
	elseif (tblQuestion.randomOrder) then
	
		for i = 1, numSlots do
			
			local repeated = false
			local randomAnswer
			
			repeat
			
				repeated = false
				
				randomAnswer = math.random(startRange, endRange)
				
				for i = #randomNumbersTable, 1, -1 do
					if (randomNumbersTable[i] == randomAnswer) then
						repeated = true
					end
				end
			
			until repeated == false
			
			randomNumbersTable[#randomNumbersTable+1] = randomAnswer
			
		end
		
		if (tblQuestion.ascending == true) then
			table.sort(randomNumbersTable, compare)
		else
			table.sort(randomNumbersTable, compareDesc)
		end
		
		
	else
	
		print(startRange)
		print(endRange)
		print(numSlots)
	
		repeat
			startNum = math.random(startRange, endRange)
		until startNum + (numSlots * tblQuestion.skip) < 1000
	
		for i = startNum, endRange do
			randomNumbersTable[#randomNumbersTable+1] = startNum + (#randomNumbersTable * tblQuestion.skip)
		end
		
		if (tblQuestion.ascending == true) then
			table.sort(randomNumbersTable, compare)
		else
			table.sort(randomNumbersTable, compareDesc)
		end
	end
	
	
	-- randomizeTable( randomNumbersTable )
	-- randomizeTable( randomNumbersTable )

	for i = 1, #randomNumbersTable do
		
		-- local numChoice
		-- local numberRepeated = false
		-- repeat
			-- numberRepeated = false
			
			-- numChoice = math.random( startRange, endRange )
			
			-- for k = #numberOptions, 1, -1 do
				-- if (numChoice == numberOptions[k]) then
					-- numberRepeated = true
				-- end
			-- end
			
		-- until numberRepeated == false
	
		-- numberOptions[#numberOptions+1] = numChoice
		
		numberOptions[#numberOptions+1] = randomNumbersTable[i]
		
	end
	
	
	
	
	
	
	function readCardSlotsVO()
	
		if savedData.enableSounds == true then
		
			if (tblQuestion.isEquation) then
			
				playReservedChannel( buildTheEquation, 28, 0 )
			
			elseif (isPutNumOrderFirstPlay == true) then
				playReservedChannel( canPutBackNumBelong, 28, 0 )
			else
				local randomSound = math.random( 1, 2 )
				if (randomSound == 1) then
					playReservedChannel( canPutBackNum, 28, 0 )
				elseif (randomSound == 2) then
					playReservedChannel( putTheNumbersBelong, 28, 0 )
				-- elseif (randomSound == 3) then
					-- playReservedChannel( letsDoIt, currentGameChannel, 0 )
				end
			end
				
			-- currentGameChannel = currentGameChannel + 1
			-- if (currentGameChannel > 25) then
				-- currentGameChannel = 20
			-- end
		end
	
	end
	
	local function numbersAnim()
			
		-- for i = #gameNumbers, 1, -1 do
			-- gameNumbers[i][1]:removeSelf()
			-- gameNumbers[i][1] = nil
		-- end
	
	

		
		local function hideGameScreen()
		
			if savedData.enableSounds == true then
				playReservedChannel(shortClapSound, currOtherMainChannel, 0)
				currOtherMainChannel = currOtherMainChannel + 1
				if (currOtherMainChannel > 17) then
					currOtherMainChannel = 15
				end
			end
		
			-- if (slotsGroup) then
				-- gameGroup:insert( slotsGroup )
			-- end
			-- if (choicesGroup) then
				-- gameGroup:insert( choicesGroup )
			-- end
			
			if (howManyBackground) then
				transition.to( howManyBackground, { time=700, x=-1000, transition=easing.outExpo } )
			end
			-- if (howManyGroup) then
				-- transition.to( howManyGroup, { time=700, x=-900, transition=easing.outExpo } )
			-- end
			-- if (slotsGroup) then
				-- transition.to( slotsGroup, { time=700, x=900, transition=easing.outExpo } )
			-- end
			-- if (choicesGroup) then
				-- transition.to( choicesGroup, { time=700, x=900, transition=easing.outExpo } )
			-- end
			
			for i = #gameNumbers, 1, -1 do
				transition.to( gameNumbers[i], { time=700, x=1000, transition=easing.outExpo } )
			end
			
			-- transition.to( slotsGroup, { time=700, alpha=0, transition=easing.outExpo } )
			-- transition.to( choicesGroup, { time=700, alpha=0, transition=easing.outExpo } )
			transition.to( gameGroup, { time=700, alpha=0, transition=easing.outExpo } )
			
			local function hideQuestion()
				questionText.alpha = 0
				questionTextTwo.alpha = 0
			end
			transition.to( questionText, { time=700, alpha = 0, transition=easing.outExpo, onComplete = hideQuestion } )
			transition.to( questionTextTwo, { time=700, alpha = 0, transition=easing.outExpo } )
			
			
			timer.performWithDelay( 0, goodJobSequence )
		end
		rewardTimer = timer.performWithDelay( 1200, hideGameScreen )
	
		
	end
	
	function readFullEquationVO()
	
		local orderOfEquation = {}
	
		local firstNum
		for k = 1, #gameNumbers do
			if (gameNumbers[k].inSlot == true) then
				if (firstNum == nil or gameNumbers[k].x < gameNumbers[firstNum].x) then
					firstNum = k
				end
			end
		end
		
		local secondNum
		for k = 1, #gameNumbers do
			if (gameNumbers[k].inSlot == true and k ~= firstNum) then
				if (secondNum == nil or gameNumbers[k].x < gameNumbers[secondNum].x) then
					secondNum = k
				end
			end
		end
		
		local thirdNum
		for k = 1, #gameNumbers do
			if (gameNumbers[k].inSlot == true and k ~= firstNum and k ~= secondNum) then
				if (thirdNum == nil or gameNumbers[k].x < gameNumbers[thirdNum].x) then
					thirdNum = k
				end
			end
		end
	
	
	
		local function playPartTwoEquation()
		
			local function playPartThreeEquation()
		
				local function playPartFourEquation()
			
					local function playPartFiveEquation()
				
						if savedData.enableSounds == true then
						
							if (gameNumbers[thirdNum].id <= 100) then
								playReservedChannel( gameNumSounds[gameNumbers[thirdNum].id], currentGameChannel, 0 )
							else
							
								local function partFiveAudio()
									local numTemp
									if (gameNumbers[thirdNum].id < 110) then
										numTemp = tonumber( tostring(gameNumbers[thirdNum].id):sub(3, 3) )
									else
										numTemp = tonumber( tostring(gameNumbers[thirdNum].id):sub(2, 3) )
									end
									playReservedChannel(gameNumSounds[ numTemp ], 28, 0)
								end
							
								playReservedChannel(hundredSounds[ tonumber(tostring(gameNumbers[thirdNum].id):sub(1, 1)) ], 29, 0)
							
							
								if (questionAudioTimer) then
									timer.cancel( questionAudioTimer )
									questionAudioTimer = nil
								end
								questionAudioTimer = timer.performWithDelay( 900, partFiveAudio )
							
							end
							
							currentGameChannel = currentGameChannel + 1
							if (currentGameChannel > 25) then
								currentGameChannel = 20
							end
						end
						
						if (gameNumbers[thirdNum].id > 100) then
							rewardTimer = timer.performWithDelay( 500, numbersAnim )
						elseif (gameNumbers[thirdNum].id > 10) then
							rewardTimer = timer.performWithDelay( 750, numbersAnim )
						else
							rewardTimer = timer.performWithDelay( 1000, numbersAnim )
						end
				
					end
				
					if savedData.enableSounds == true then
						playReservedChannel( gameSounds.equals, currentGameChannel, 0 )
						
						currentGameChannel = currentGameChannel + 1
						if (currentGameChannel > 25) then
							currentGameChannel = 20
						end
					end
				
					-- was 500
					rewardTimer = timer.performWithDelay( 700, playPartFiveEquation )
			
		
			
				end
			
				if savedData.enableSounds == true then
				
					if (gameNumbers[secondNum].id <= 100) then
						playReservedChannel( gameNumSounds[gameNumbers[secondNum].id], currentGameChannel, 0 )
					else
					
						local function partFiveAudio()
							local numTemp
							if (gameNumbers[secondNum].id < 110) then
								numTemp = tonumber( tostring(gameNumbers[secondNum].id):sub(3, 3) )
							else
								numTemp = tonumber( tostring(gameNumbers[secondNum].id):sub(2, 3) )
							end
							playReservedChannel(gameNumSounds[ numTemp ], 28, 0)
						end
					
						playReservedChannel(hundredSounds[ tonumber(tostring(gameNumbers[secondNum].id):sub(1, 1)) ], 29, 0)
					
					
						if (questionAudioTimer) then
							timer.cancel( questionAudioTimer )
							questionAudioTimer = nil
						end
						questionAudioTimer = timer.performWithDelay( 900, partFiveAudio )
					
					end
					
					currentGameChannel = currentGameChannel + 1
					if (currentGameChannel > 25) then
						currentGameChannel = 20
					end
				end
				
				
				
				local signTimerNum
	
				if (signSound == "+") then
					if (tonumber(gameNumbers[secondNum].id) <= 10) then
						signTimerNum = 570
					elseif (tonumber(gameNumbers[secondNum].id) <= 20) then
						signTimerNum = 720
					elseif (tonumber(gameNumbers[secondNum].id) <= 99) then
						signTimerNum = 900
					else
						signTimerNum = 1700
					end
				else
					if (tonumber(gameNumbers[secondNum].id) <= 10) then
						signTimerNum = 570
					elseif (tonumber(gameNumbers[secondNum].id) <= 20) then
						signTimerNum = 720
					elseif (tonumber(gameNumbers[secondNum].id) <= 99) then
						signTimerNum = 900
					else
						signTimerNum = 1700
					end
				end
			
				rewardTimer = timer.performWithDelay( signTimerNum, playPartFourEquation )
			
		
		
			end
		
			if savedData.enableSounds == true then
			
				if (sign == "+") then
					playReservedChannel( gameSounds.plus, currentGameChannel, 0 )
				else
					playReservedChannel( gameSounds.minus, currentGameChannel, 0 )
				end
				
				currentGameChannel = currentGameChannel + 1
				if (currentGameChannel > 25) then
					currentGameChannel = 20
				end
			end
			
			
		
			rewardTimer = timer.performWithDelay( 500, playPartThreeEquation )
			
		
		end
	
	
	
		
		if savedData.enableSounds == true then
		
			if (gameNumbers[firstNum].id <= 100) then
				playReservedChannel( gameNumSounds[gameNumbers[firstNum].id], currentGameChannel, 0 )
			else
			
				local function partFiveAudio()
					local numTemp
					if (gameNumbers[firstNum].id < 110) then
						numTemp = tonumber( tostring(gameNumbers[firstNum].id):sub(3, 3) )
					else
						numTemp = tonumber( tostring(gameNumbers[firstNum].id):sub(2, 3) )
					end
					playReservedChannel(gameNumSounds[ numTemp ], 28, 0)
				end
			
				playReservedChannel(hundredSounds[ tonumber(tostring(gameNumbers[firstNum].id):sub(1, 1)) ], 29, 0)
			
			
				if (questionAudioTimer) then
					timer.cancel( questionAudioTimer )
					questionAudioTimer = nil
				end
				questionAudioTimer = timer.performWithDelay( 900, partFiveAudio )
			
			end
			
			
			currentGameChannel = currentGameChannel + 1
			if (currentGameChannel > 25) then
				currentGameChannel = 20
			end
		end
	
	
		local signTimerNum
	
		if (signSound == "+") then
			if (tonumber(gameNumbers[firstNum].id) <= 10) then
				signTimerNum = 570
			elseif (tonumber(gameNumbers[firstNum].id) <= 20) then
				signTimerNum = 720
			elseif (tonumber(gameNumbers[firstNum].id) <= 99) then
				signTimerNum = 900
			else
				signTimerNum = 1700
			end
		else
			if (tonumber(gameNumbers[firstNum].id) <= 10) then
				signTimerNum = 570
			elseif (tonumber(gameNumbers[firstNum].id) <= 20) then
				signTimerNum = 720
			elseif (tonumber(gameNumbers[firstNum].id) <= 99) then
				signTimerNum = 900
			else
				signTimerNum = 1700
			end
		end
		print("read equation vo")
		print(signTimerNum)
	
	
		rewardTimer = timer.performWithDelay( signTimerNum, playPartTwoEquation )
	
	end
	
	---------------------------------------    
    -- update function
    ---------------------------------------  
	function this.enterFrame(e)
	
	
		if (currentItem and currentItem ~= 0) then
			local itemX, itemY = currentItem:localToContent( 0, 0 )
			if system.getInfo("model") == "iPad" then
				currentItem.x = (currentItemX - itemX) * .25 + currentItem.x 
				currentItem.y = (currentItemY - itemY) * .25 + currentItem.y	
			elseif (display.pixelHeight == 960) then
				currentItem.x = (currentItemX - itemX) * .25 + currentItem.x 
				currentItem.y = (currentItemY - itemY) * .25 + currentItem.y	
			else
				currentItem.x = ((currentItemX - itemX) * .25 + currentItem.x) - 8
				currentItem.y = ((currentItemY - itemY) * .25 + currentItem.y) - 2
			end
		end
			
		if (floaters) then
			for k = #floaters, 1, -1 do
			
				for i = 1, #gameNumbers do
				
					if (floaters[k] == gameNumbers[i].index) then
						gameNumbers[i].frame = gameNumbers[i].frame + 1
						gameNumbers[i].y =  gameNumbers[i].initY + 1.5 * math.sin(gameNumbers[i].frame/30)
					end
					
				end
				
			end
		end
		
		if (showSlotBG == true and myData.isFireTV or showSlotBG == true and myData.isController) then 
			
			for i = 1, #gameSlots do
			
				if (gameSlots[i] == gameSlots[currentCardSelected]) then
					gameSlots[i].bg:setFillColor( 0 )
					gameSlots[i].bg.alpha = gameSlots[i].bg.initAlpha + (0.125 * cursor.alpha)
				else
					gameSlots[i].bg:setFillColor( 0, 0, 0 )
					gameSlots[i].bg.alpha = gameSlots[i].bg.initAlpha
				end
			
				-- if (cursor.alpha > 0) then
					
				-- end
			end
		end
	
	end
    
	local function startWindAnim()
		
		if savedData.enableSounds == true then
			playReservedChannel( windSound, currentGameChannel, 0 )
			currentGameChannel = currentGameChannel + 1
			if (currentGameChannel > 25) then
				currentGameChannel = 20
			end
		end
	
		explosions:toFront()
		gameGroup.animationInfo = { id = "none", particles = "kiteClouds", duration = 1000, anchor = { 0.5, 0.5 }, particleOffset = { 0, 0 } } --was 3100
		
		if (gameGroup) then
			animateStart( gameGroup )
		end
	
	end
	
    ---------------------------------------    
    -- touch function
    ---------------------------------------  
	

	local function checkSlot( currentItem, currentSlot )
		
		if (timerVO) then
			timer.cancel( timerVO )
			timerVO = nil
		end
		if (timerNumVO) then
			timer.cancel( timerNumVO )
			timerNumVO = nil
		end
		
		audio.stop( 28 )
		audio.stop( 29 )
	
		-- audio.stop( sAudio.gameInstructions1.c )
		-- audio.stop( sAudio.gameInstructions2.c )
		-- audio.stop( sAudio.gameInstructions3.c )
		
		
		-- playReservedChannel( gameSounds.bubblesSmallSound, gameSoundFXCurr, sAudio.gameSoundFX1.l, "sound" )

		-- gameSoundFXCurr = gameSoundFXCurr + 1
		-- if (gameSoundFXCurr > sAudio.gameSoundFX3.c) then
			-- gameSoundFXCurr = sAudio.gameSoundFX1.c
		-- end
		
		-- local slotX, slotY = currentSlot:localToContent( 0, 0 )
		-- Particles:newEmitter(explosionsGroup,"bubbles", "Images/Particles/sharkBubble.png", 48, 48, 8, slotX, slotY, -3, 3, -2, 4, 255,255,255, math.random())
		
		currentItem.inSlot = true
		currentSlot.inSlot = true
		
		currentCount = currentCount + 1
		
		local function finishTransToSlot()
			
			-- currentItem[1].alpha = 0
			
			-- slotsGroup:insert( currentItem )
			-- currentItem.x = currentItem.x + (choicesGroup.x - slotsGroup.x)
			-- currentItem.y = currentItem.y + (choicesGroup.y - slotsGroup.y)
			
			
			-- transition.to( currentItem, { delay = 0, time=50 , x = currentSlot.x - (choicesGroup.x - slotsGroup.x), y = currentSlot.y - (choicesGroup.y - slotsGroup.y), xScale = currentSlot.xScale, yScale = currentSlot.yScale, rotation = currentSlot.rotation, transition=easing.inExpo } )
			
			-- if (myData.isFireTV or myData.isController) then 
			
			
			currentItem.origScale = currentSlot.xScale * 0.9
			
			local function onCompleteScale( obj )
				transition.to( currentItem, { delay = 100, time=50 , xScale = currentItem.origScale, yScale = currentItem.origScale, transition=easing.outExpo} )
			end
			
			transition.to( currentItem, { delay = 50, time=50 , xScale = currentItem.popScale, yScale = currentItem.popScale, onComplete = onCompleteScale, transition=easing.inExpo } )
			

			
			-- currentSlot:removeEventListener("touch", numberTouched)
			currentSlot:toFront()
			
			transition.to( currentSlot, { delay = 50, time=50 , alpha = 0, transition=easing.outExpo } )
			transition.to( currentSlot.bg, { delay = 50, time=50 , alpha = 0, transition=easing.outExpo } )
			
			local particleX, particleY = currentSlot:localToContent(0, 0)
			
			Particles:newEmitter(explosions,"fireworks", "Images/starParticle.png", 32, 32, 10, particleX, particleY, -4, 4, -16, 6, 252,234,27)--altRgb[1], altRgb[2], altRgb[3])
			explosions:toFront()
			
			if savedData.enableSounds == true then
				playReservedChannel(popSounds[math.random(1,3)], currentPopChannel, 0)
			end
			currentPopChannel = currentPopChannel + 1
			if currentPopChannel > 26 then
				currentPopChannel = 27
			end
			
			if savedData.enableSounds == true then
				--playReservedChannel( gameNumSounds[currentItem.id], currentGameChannel, 0 )
				
				
				if (currentItem.id <= 100) then
					playReservedChannel( gameNumSounds[currentItem.id], currentGameChannel, 0 )
				else
				
					local function partFiveAudio()
						local numTemp
						if (currentItem.id < 110) then
							numTemp = tonumber( tostring(currentItem.id):sub(3, 3) )
						else
							numTemp = tonumber( tostring(currentItem.id):sub(2, 3) )
						end
						playReservedChannel(gameNumSounds[ numTemp ], 28, 0)
					end
				
					playReservedChannel(hundredSounds[ tonumber(tostring(currentItem.id):sub(1, 1)) ], 29, 0)
				
				
					if (questionAudioTimer) then
						timer.cancel( questionAudioTimer )
						questionAudioTimer = nil
					end
					questionAudioTimer = timer.performWithDelay( 900, partFiveAudio )
				
				end
				
				
				currentGameChannel = currentGameChannel + 1
				if (currentGameChannel > 25) then
					currentGameChannel = 20
				end
			end

			
			for m = 1, #gameNumbers do
				if (gameNumbers[m].inSlot == false) then
					gameNumbers[m]:toFront()
				end
			end
			
			
			
			
			
			
			
			
			if (currentCount > numSlots) then
			
				isEndGame = true
				buttonsActive = false
			
				bg:removeEventListener("touch", this)
				
				if (myData.isFireTV or myData.isController) then 
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
			
				currentCount = #gameNumbers
				
				for k = 1, #gameNumbers do
					if (gameNumbers[k].inSlot == true) then
					else
						transition.to( gameNumbers[k], { time=400 , alpha = 0, transition=easing.outExpo} )
					end
				end
				
				print("read VO")
				if (tblQuestion.isEquation) then
					rewardTimer = timer.performWithDelay( 1000, readFullEquationVO )
					print("test 1")
				else
					rewardTimer = timer.performWithDelay( 1000, numbersAnim )
					print("test 2")
				end
			
			else
				
				
				if (myData.isFireTV or myData.isController) then 
					if (fireTVMultiCardOption == false) then
						-- numTimer = timer.performWithDelay( 900, scatterNumbers )
						
						
						-- rewardTimer = timer.performWithDelay( 900, startWindAnim )
					else
					
						
						timer.performWithDelay( 200, makeButtonsActive )
					
					end
				else
					timer.performWithDelay( 200, makeButtonsActive )
				end
			end
			
			
		end
		
		if (myData.isFireTV or myData.isController) then 
			local newX, newY = currentSlot:localToContent(0, 0)
			local newX2, newY2 = currentItem:localToContent(0, 0)
			local differenceX, differenceY = newX - newX2, newY - newY2
			local origX, origY = currentItem.x, currentItem.y
			transition.to( currentItem, { delay = 0, time=350 , x = origX + differenceX, y = origY + differenceY, rotation = currentSlot.rotation, transition=easing.outExpo } )
			timer.performWithDelay( 1, finishTransToSlot )
		else
			local newX, newY = currentSlot:localToContent(0, 0)
			local newX2, newY2 = currentItem:localToContent(0, 0)
			local differenceX, differenceY = newX - newX2, newY - newY2
			local origX, origY = currentItem.x, currentItem.y
			transition.to( currentItem, { delay = 0, time=50 , x = origX + differenceX, y = origY + differenceY, rotation = currentSlot.rotation, transition=easing.inExpo } )
			timer.performWithDelay( 1, finishTransToSlot )
		end
		
		
		if (myData.isFireTV or myData.isController) then 
			if (fireTVMultiCardOption == true) then
				if (currentCount > numSlots) then
				else
				
					local function showCursor()

						cursor.xScale = cardOptions.scale -- Hand Cursor
						cursor.yScale = cardOptions.scale
						cursor:toFront()
						
						currentCardSelected = 1
						currentSelected = "cards"
						
						if (gameNumbers and #gameNumbers > 0) then
							for i = 1, #gameNumbers do
								if (gameNumbers[i].inSlot == false) then
									currentCardSelected = i
								end
							end
							for i = 1, #gameNumbers do
								if (gameNumbers[i].x < gameNumbers[currentCardSelected].x and gameNumbers[i].inSlot == false) then
									currentCardSelected = i
								end
							end
							
							cursor.x, cursor.y = gameNumbers[currentCardSelected]:localToContent( gameNumbers[currentCardSelected].contentWidth*0.37, gameNumbers[currentCardSelected].contentHeight*0.5 )
							
						
							targetCard = gameNumbers[currentCardSelected]
							cursorTransition = transition.to( cursor, { time=700, alpha=1 } )
						
						end
						
					end
					
					cursorTransition = timer.performWithDelay( 0, showCursor ) -- 700
				
				end
			
			end
			
		end
		
		
	end

	
    function this:touch(event)
        if not self.isLive or not self.isTouchEnable then return end

        local obj = event.target
        -- Key pressed --
        if(event.phase == "began") then
            display.getCurrentStage():setFocus(obj)
            obj._isFocus = true
            
			itemStartTouched = true
			
			beganTouchX = event.x
			beganTouchY = event.y
			
			if (currentItem == 0) then
			
				for i = #gameNumbers, 1, -1 do
					
					local itemX, itemY = gameNumbers[i]:localToContent( 0, 0 )
				
					if (event.x > itemX - (gameNumbers[i].contentWidth*0.5) and
							event.x < itemX + (gameNumbers[i].contentWidth*0.5) and
							event.y > itemY - (gameNumbers[i].contentHeight*0.5) and
							event.y < itemY + (gameNumbers[i].contentHeight*0.5)) then
						
						if (gameNumbers[i].inSlot == false) then
						
							for k = #floaters, 1, -1 do
								if (floaters[k] == gameNumbers[i].index) then
									table.remove( floaters, k )
								end
							end
							
							currentItemX = event.x
							currentItemY = event.y
						
							currentItem = gameNumbers[i]
							currentItem:toFront()
							
							local hasSlot = false
							local tempI = 1
							for k = #gameSlots, 1, -1 do
								if (gameSlots[k].id) then
									for m = #gameSlots[k].id, 1, -1 do
										if (currentItem.id == gameSlots[k].id[m]) then
											-- if (currentItem.scaleTrans) then
												-- transition.cancel( currentItem.scaleTrans )
												-- currentItem.scaleTrans = nil
											-- end
											hasSlot = true
											
											tempI = k
											
											-- currentItem.scaleTrans = transition.to( currentItem, { time=400 , xScale = gameSlots[k].xScale, yScale = gameSlots[k].yScale, rotation = gameSlots[k].rotation, transition=easing.outExpo } )
										end
									end
								end
								
							end
							
							print("test card slots")
							-- for k = #gameSlots, 1, -1 do
							
								if (currentItem.scaleTrans) then
									transition.cancel( currentItem.scaleTrans )
									currentItem.scaleTrans = nil
								end
								currentItem.scaleTrans = transition.to( currentItem, { time=400 , xScale = gameSlots[tempI].xScale, yScale = gameSlots[tempI].yScale, rotation = gameSlots[tempI].rotation, transition=easing.outExpo } )
							
							-- end
							
							
							
							-- if (hasSlot == false) then
								-- if (currentItem.scaleTrans) then
									-- transition.cancel( currentItem.scaleTrans )
									-- currentItem.scaleTrans = nil
								-- end
								-- currentItem.scaleTrans = transition.to( currentItem, { time=400 , xScale = gameSlots[1].xScale, yScale = gameSlots[1].yScale, transition=easing.outExpo } )
							-- end
							
							-- playReservedChannel( gameSounds.shake, gameButtonCurr, sAudio.gameButton1.l, "sound" )
		
							-- gameButtonCurr = gameButtonCurr + 1
							-- if (gameButtonCurr > sAudio.gameButton3.c) then
								-- gameButtonCurr = sAudio.gameButton1.c
							-- end
							
							break
						end
						
						
					end
				end
			
			end

        elseif(event.phase == "moved") then
			if obj._isFocus then
				if (currentItemTouch ~= 0) then
					
					local newX = event.x - beganTouchX
					local newY = event.y - beganTouchY
				
					currentItemX = event.x
					currentItemY = event.y
					
				end
			end
        -- Key released --
        elseif(event.phase == "ended" or event.phase == "cancelled") then
            
			
			local function resetObj()
			
				-- if (currentItem.x > screenEdgeX - (currentItem.contentWidth*0.5)) then
					-- currentItem.x = screenEdgeX - (currentItem.contentWidth*0.5)
				-- elseif (currentItem.x < screenOriginX + (currentItem.contentWidth*0.5)) then
					-- currentItem.x = screenOriginX + (currentItem.contentWidth*0.5)
				-- elseif (currentItem.y > screenEdgeY - (currentItem.contentHeight*0.5)) then
					-- currentItem.y = screenEdgeY - (currentItem.contentHeight*0.5)
				-- elseif (currentItem.y < screenOriginY + (currentItem.contentHeight*0.5))then
					-- currentItem.y = screenOriginY + (currentItem.contentHeight*0.5)
				-- end
				
				currentItem.initX = currentItem.x
				currentItem.initY = currentItem.y
				currentItem.inSlot = false
				-- floaters[#floaters+1] = currentItem.id
				
				
				if (currentItem.scaleTrans) then
					transition.cancel( currentItem.scaleTrans )
					currentItem.scaleTrans = nil
				end
				local function finishedItemTrans( obj )
					
					obj.initY = obj.origY
					obj.frame = 0
					local isFloating = false
					for i = #floaters, 1, -1 do
						if (floaters[i] == obj.index) then
							isFloating = true
						end
					end
					if (isFloating == false) then
						floaters[#floaters+1] = obj.index
					end
					
				end
				currentItem.scaleTrans = transition.to( currentItem, { time=400 , x = currentItem.origX, y = currentItem.origY, xScale = currentItem.initScale, yScale = currentItem.initScale, rotation = currentItem.initR, transition=easing.outExpo, onComplete = finishedItemTrans } )
				
				-- floaters[#floaters+1] = currentItem.id
				
				local newX = event.x - beganTouchX
				local newY = event.y - beganTouchY
				if (math.abs(newX) < 3 and math.abs(newY) < 3) then
				
					transition.to( currentItem, { delay = 0, time=50 , alpha = 1, xScale = currentItem.popScale, yScale = currentItem.popScale, transition=easing.inExpo } )
					transition.to( currentItem, { delay = 50, time=50 , alpha = 1, xScale = currentItem.origScale, yScale = currentItem.origScale, transition=easing.outExpo} )

					
					if savedData.enableSounds == true then
						
						--playReservedChannel( gameNumSounds[currentItem.id], currentGameChannel, 0 )
						
						
						if (currentItem.id <= 100) then
							playReservedChannel( gameNumSounds[currentItem.id], currentGameChannel, 0 )
						else
							local tempNum = currentItem.id
						
							local function partFiveAudio()
								local numTemp
								if (tempNum < 110) then
									numTemp = tonumber( tostring(tempNum):sub(3, 3) )
								else
									numTemp = tonumber( tostring(tempNum):sub(2, 3) )
								end
								playReservedChannel(gameNumSounds[ numTemp ], 28, 0)
							end
						
							playReservedChannel(hundredSounds[ tonumber(tostring(tempNum):sub(1, 1)) ], 29, 0)
						
						
							if (questionAudioTimer) then
								timer.cancel( questionAudioTimer )
								questionAudioTimer = nil
							end
							questionAudioTimer = timer.performWithDelay( 900, partFiveAudio )
						
						end
						
						currentGameChannel = currentGameChannel + 1
						if (currentGameChannel > 25) then
							currentGameChannel = 20
						end
					end
					
					
				else
				
					-- currentItem.initR = currentItem.rotation
					-- currentItem.initScale = currentItem.xScale
					
					-- playReservedChannel( gameSounds.shake, gameButtonCurr, sAudio.gameButton1.l, "sound" )
		
					-- gameButtonCurr = gameButtonCurr + 1
					-- if (gameButtonCurr > sAudio.gameButton3.c) then
						-- gameButtonCurr = sAudio.gameButton1.c
					-- end
				
					-- currentItem.animationInfo = currentItem.shakeAnim
					-- animateStart( currentItem )
				
				end
			
			end
			
			
			if obj._isFocus then
                obj._isFocus = false
                display.getCurrentStage():setFocus(nil)
				
				if (currentItem ~= 0 and gameSlots) then
					
					for i = #gameSlots, 1, -1 do
				
				
						if (gameSlots[i].id) then
						
							for m = #gameSlots[i].id, 1, -1 do
					
								local itemX, itemY = currentItem:localToContent( 0, 0 )
								local slotX, slotY = gameSlots[i]:localToContent( 0, 0 )
						
								if (itemX < slotX + (gameSlots[i].contentWidth*0.5) and 
										itemX > slotX - (gameSlots[i].contentWidth*0.5) and 
										itemY < slotY + (gameSlots[i].contentHeight*0.5) and 
										itemY > slotY - (gameSlots[i].contentHeight*0.5) and
										currentItem.id == gameSlots[i].id[m] and gameSlots[i].inSlot == false) then
										
										
									checkSlot( currentItem, gameSlots[i] )
									
									break
									
								end
							
							end
						
						end
					
					end
					
					if (currentItem.inSlot == false) then
						
						print("reset obj pos")
						resetObj()
						
						
					end
					
					currentItem = 0
				
				end
                
                -- if obj.name == chooseGameAnswer then
                    -- self.isTouchEnable = false
                    
					
            end -- if obj._isFocus then
        end -- touch began, moved, ended, cancelled

        return true
    end
	
	
	function cardSlotsTap( event )

		local target = event.target
		keyName = event.keyName
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
					buttonsActive = false
				end
				buttonsActive = false
				
				
				
				local onSlots = false
				local function showCursor()

					cursor.xScale = cardOptions.scale -- Hand Cursor
					cursor.yScale = cardOptions.scale
					cursor:toFront()
					
					-- currentSelectedTV = currentCardSelected
					-- currentCardSelected = 1
					
					if (onSlots == true) then
						currentSelected = "cards"
					else
						currentSelected = "slots"
					end
					
					local numTotalSlots
					if (tblQuestion.imageSet == "Cards") then
						numTotalSlots = #gameSlots - 1
					else
						numTotalSlots = #gameSlots
					end
					
					if (onSlots == true) then
						if (gameNumbers and #gameNumbers > 0) then
							-- for i = 1, #gameNumbers do
								-- if (gameNumbers[i].inSlot == false) then
									-- currentCardSelected = i
								-- end
							-- end
							-- for i = 1, #gameNumbers do
								-- if (gameNumbers[i].x < gameNumbers[currentCardSelected].x and gameNumbers[i].inSlot == false) then
									-- currentCardSelected = i
								-- end
							-- end
							
							cursor.x, cursor.y = gameNumbers[currentCardSelected]:localToContent( gameNumbers[currentCardSelected].origContentWidth*0.37, gameNumbers[currentCardSelected].origContentHeight*0.5 )
							
							print("test equation card game")
						
							targetCard = gameNumbers[currentCardSelected]
							cursorTransition = transition.to( cursor, { time=700, alpha=1 } )
						
						end
					else
						if (gameSlots and numTotalSlots > 0) then
							for i = 1, numTotalSlots do
								if (gameSlots[i].inSlot == false) then
									currentCardSelected = i
								end
							end
							for i = 1, numTotalSlots do
								if (gameSlots[i].x < gameSlots[currentCardSelected].x and gameSlots[i].inSlot == false) then
									currentCardSelected = i
								end
							end
							
							cursor.x, cursor.y = gameSlots[currentCardSelected]:localToContent( gameSlots[currentCardSelected].contentWidth*0.37, gameSlots[currentCardSelected].contentHeight*0.5 )
							
						
							targetCard = gameSlots[currentCardSelected]
							cursorTransition = transition.to( cursor, { time=700, alpha=1 } )
						
						end
					end
					
					
					
				end
				
				
				
				
				
				local isCorrectSlot = false
				
				if (gameSlots[currentCardSelected].id) then
					for m = #gameSlots[currentCardSelected].id, 1, -1 do
					
						if (fireTVMultiCardOption == false and gameNumbers[currentIndex].id == gameSlots[currentCardSelected].id[m] or
								fireTVMultiCardOption == true and currentSelectedTV ~= nil and gameNumbers[currentSelectedTV].id == gameSlots[currentCardSelected].id[m]) then
							isCorrectSlot = true
						end
					
					end
				end
				
				
				if (currentSelected == "cards") then
				
					if (myData.isFireTV or myData.isController) then 
						if (cursorTimer) then
							timer.cancel( cursorTimer )
							cursorTimer = nil
						end
						if (cursorTransition) then
							transition.cancel( cursorTransition )
							cursorTransition = nil
						end
						-- transition.to( cursor, { time=100, alpha=0 } )
					end
				
					currentSelectedTV = currentCardSelected
					
					local function scalePop( obj )
					
						transition.to( obj, { time=100 , xScale = 1.15, yScale = 1.15, transition=easing.outExpo } )
				
						if savedData.enableSounds == true then
							playReservedChannel(flipSound, 14, 0)
						end
				
				
						local function sendCardToFloat()
						
							
							floaters[#floaters+1] = obj.index
							if (#floaters < 2) then
								Runtime:removeEventListener( "enterFrame", cardFloat)
								Runtime:addEventListener( "enterFrame", cardFloat)
							end
							
							makeButtonsActive()
						end
				
						timer.performWithDelay( 100, sendCardToFloat )
					
					end
					
					transition.to(gameNumbers[currentCardSelected], {time=100, xScale = 1.5, yScale = 1.5, onComplete = scalePop, transition=easing.inExpo} )
				
					currentCardSelected = 1
				
					onSlots = false
					cursorTransition = timer.performWithDelay( 0, showCursor ) -- 100
				
				elseif (isCorrectSlot == true) then
					
					if (myData.isFireTV or myData.isController) then 
						if (cursorTimer) then
							timer.cancel( cursorTimer )
							cursorTimer = nil
						end
						if (cursorTransition) then
							transition.cancel( cursorTransition )
							cursorTransition = nil
						end
						-- transition.to( cursor, { time=100, alpha=0 } )
					end
					
					if (fireTVMultiCardOption == true) then
						currentIndex = currentSelectedTV
					end
					
					for k = #floaters, 1, -1 do
						if (floaters[k] == gameNumbers[currentIndex].index) then
							table.remove( floaters, k )
						end
					end
					
					checkSlot( gameNumbers[currentIndex], gameSlots[currentCardSelected] )
				
				else
				
					if (myData.isFireTV or myData.isController) then 
						if (fireTVMultiCardOption == true) then
						
							if (cursorTimer) then
								timer.cancel( cursorTimer )
								cursorTimer = nil
							end
							if (cursorTransition) then
								transition.cancel( cursorTransition )
								cursorTransition = nil
							end
							-- transition.to( cursor, { time=100, alpha=0 } )
						
							for k = #floaters, 1, -1 do
								if (floaters[k] == gameNumbers[currentSelectedTV].index) then
									table.remove( floaters, k )
								end
							end
							
							transition.to( gameNumbers[currentSelectedTV], { time=100, rotation=0, y=gameNumbers[currentSelectedTV].initY, xScale = gameNumbers[currentSelectedTV].origScale, yScale = gameNumbers[currentSelectedTV].origScale, transition=easing.outExpo } )
							
							currentCardSelected = currentSelectedTV
						
							onSlots = true
							cursorTransition = timer.performWithDelay( 0, showCursor ) -- 100
						
						end
					end
				
					if savedData.enableSounds == true then
						-- for i = #cards, 1, -1 do
							-- if (target == cards[i]) then
								playReservedChannel(wrongSound, currentWrongChannel, 0)
							-- end
						-- end
					end
					currentWrongChannel = currentWrongChannel + 1
					if currentWrongChannel > 20 then
						currentWrongChannel = 19
					end
					
					makeButtonsActive()
				end
				
			end
			
			
		end
		
		
	end
    
	
	
	local function showCardsSlots()
	
		if (showSlotsPuzzle) then
		else
		
			showSlotsPuzzle = true
			hasPlayedVO = false
			
			
			for i = 1, #gameNumbers do
				if (gameNumbers[i].isAnAnswer == true) then
					currentIndex = i
					break
				end
			end
			
			transition.to( howManyBackground, { time=700, x=halfW, transition=easing.outExpo } )
			transition.to( howManyGroup, { time=700, x=halfW, transition=easing.outExpo } )
	
			cardTrans = transition.to( choicesGroup, { time=700, x=halfW+tblCards.offsetX, transition=easing.outExpo } )
	
		
			
			if (tblQuestion.isEquation) then
				questionText.text = "Build the equation."
			
				print("test this game 2")
			elseif (tblQuestion.ascending == true) then
				questionText.text = "Put the numbers in order."
			else
				questionText.text = "Put the numbers in descending order."
			end
			questionText.anchorX = 0.5
			questionText.anchorY = 0.5
			questionText.x = 1000
			
			if (tblQuestion.isEquation) then
				if system.getInfo( "platformName" ) == "Android" then
					questionText.y = questionText.initY + questionOptions.offsetY - androidTextOffsetY
				end
			end
			
			questionText.alpha = 1
		
			transition.to( questionText, { time=700, x=halfW, transition=easing.outExpo } )
			transition.to( questionTextTwo, { time=700, x=halfW, transition=easing.outExpo } )
	
			readCardSlotsVO()
		
		
			print("slots game")
			
			local function addGameListeners()
				bg:removeEventListener("touch", this)
				Runtime:removeEventListener("enterFrame", this)
				bg:addEventListener("touch", this)
				Runtime:addEventListener("enterFrame", this)
			end
			timer.performWithDelay( 500, addGameListeners )
			
			
			
			local function showCursor()

				cursor.xScale = cardOptions.scale -- Hand Cursor
				cursor.yScale = cardOptions.scale
				cursor:toFront()
				
				currentCardSelected = 1
				if (fireTVMultiCardOption == false) then
					currentSelected = "slots"
					
					if (gameSlots and numTotalSlots > 0) then
						for i = 1, numTotalSlots do
							if (gameSlots[i].x < gameSlots[currentCardSelected].x) then
								currentCardSelected = i
							end
						end
						
						cursor.x, cursor.y = gameSlots[currentCardSelected]:localToContent( gameSlots[currentCardSelected].contentWidth*0.37, gameSlots[currentCardSelected].contentHeight*0.5 )
						
					
						targetCard = gameSlots[currentCardSelected]
						cursorTransition = transition.to( cursor, { time=700, alpha=1 } )
					
					end
				else
					currentSelected = "cards"
					
					if (gameNumbers and #gameNumbers > 0) then
						for i = 1, #gameNumbers do
							if (gameNumbers[i].x < gameNumbers[currentCardSelected].x) then
								currentCardSelected = i
							end
						end
						
						cursor.x, cursor.y = gameNumbers[currentCardSelected]:localToContent( gameNumbers[currentCardSelected].contentWidth*0.37, gameNumbers[currentCardSelected].contentHeight*0.5 )
						
					
						targetCard = gameNumbers[currentCardSelected]
						cursorTransition = transition.to( cursor, { time=700, alpha=1 } )
					
					end
				end
				
				
				
				
				if (myData.isController) then
					Runtime:addEventListener( "key", cardSlotsTap )
				elseif (myData.isFireTV) then
					Runtime:addEventListener( "onFTVKey", cardSlotsTap )
				end
				
			end
			
			if (myData.isFireTV or myData.isController) then 
				cursorTransition = timer.performWithDelay( 700, showCursor )
			end
		
		end
		
		
	end
	
	local function setUpCardsSlots()
	
		print("slots")
		print(numSlots)
		
		if (newSlotsCards) then
		else
		
			newSlotsCards = true
			
			
			howManyBackground = display.newImageRect("Images/UI/messageBG.png", 1000, 110 )
			howManyBackground.x = -1000
			howManyBackground.y = detailsBG
			
			howManyGroup = display.newGroup()
			
			
			local index = 1
			
			local numGameSlots = numSlots
			
			if (tblQuestion.isEquation == true) then
				numGameSlots = numGameSlots + 2
			end
			
			for i = 1, numGameSlots do
			
			
			
				if (tblQuestion.isEquation == true and i == 2 or
					tblQuestion.isEquation == true and i == 4) then
			
					if (i == 2) then
						if (sign == "+") then
							gameSlots[#gameSlots+1] = display.newImageRect("Images/plus.png", 50, 50)
						else
							gameSlots[#gameSlots+1] = display.newImageRect("Images/minus.png", 50, 50)
						end
					else
						gameSlots[#gameSlots+1] = display.newImageRect("Images/equals.png", 50, 50)
					end
					
					gameSlots[#gameSlots].xScale, gameSlots[#gameSlots].yScale = setSlotsScale, setSlotsScale
					
					if (#gameSlots ~= 1) then
						gameSlots[#gameSlots].x = gameSlots[#gameSlots-1].x + (gameSlots[#gameSlots].contentWidth*0.5) + (gameSlots[#gameSlots-1].contentWidth*0.5) + slotOptions[numSlots][1]
					end
					
					gameSlots[#gameSlots].y = halfH - 90
				
					gameSlots[#gameSlots]:toFront()
				
				else
			
					local numberOption = numberOptions[index]
					if (numberOption == 0) then
						numberOption = 11
					end
					
					local setSlotsScale = slotOptions[numSlots][2]
					
					gameSlots[#gameSlots+1] = display.newImageRect("Images/UI/blankCard.png", 65, 79)
					
					
					gameSlots[#gameSlots].xScale, gameSlots[#gameSlots].yScale = setSlotsScale, setSlotsScale
						
						
					if (#gameSlots ~= 1) then
						gameSlots[#gameSlots].x = gameSlots[#gameSlots-1].x + (gameSlots[#gameSlots].contentWidth*0.5) + (gameSlots[#gameSlots-1].contentWidth*0.5) + slotOptions[numSlots][1]
					end
					
					gameSlots[#gameSlots].y = halfH - 90
					
					gameSlots[#gameSlots].initScale = gameSlots[#gameSlots].xScale
					gameSlots[#gameSlots].initX = gameSlots[#gameSlots].x
					gameSlots[#gameSlots].initY = gameSlots[#gameSlots].y
					gameSlots[#gameSlots].initR = gameSlots[#gameSlots].rotation
					gameSlots[#gameSlots].origScale = gameSlots[#gameSlots].xScale
					gameSlots[#gameSlots].popScale = gameSlots[#gameSlots].origScale + 0.2
					
					
					if (tblQuestion.isEquation == true and sign == "+" and i == 1 or
						tblQuestion.isEquation == true and sign == "+" and i == 3 or
						tblQuestion.isEquation == true and sign == "-" and i == 3 or 
						tblQuestion.isEquation == true and sign == "-" and i == 5) then
						gameSlots[#gameSlots].id = equationAlternatives
					else
						gameSlots[#gameSlots].id = { numberOptions[index] }
					end
					gameSlots[#gameSlots].index = #gameSlots
					-- gameSlots[#gameSlots].alpha = 0
					gameSlots[#gameSlots].inSlot = false
					gameSlots[#gameSlots].selected = false
					gameSlots[#gameSlots].frame = math.random( 1 , 300 )
					gameSlots[#gameSlots].wiggleAnim = { id = "shake", particles = "", duration = 600, anchor = { 0.5, 0.5 }, particleOffset = { 0, 0 } }
					-- slotsGroup:insert( gameSlots[#gameSlots] )
					
					gameSlots[#gameSlots]:toFront()
					
					
					index = index + 1
					
				end
				
				
				howManyGroup:insert( gameSlots[#gameSlots] )
				
				
				
				
				
			end
			
			
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
					howManyGroup.y = detailsBG -- 143
				end
			end
			
			
			
			randomizeTable(numberOptions)
			randomizeTable(numberOptions)
			randomizeTable(numberOptions)
			
			if (gameSlots[1].id) then
				for m = #gameSlots[1].id, 1, -1 do
					if (numberOptions[1] == gameSlots[1].id[m] and #numberOptions ~= 1) then
						local randomOption = math.random( 2, #numberOptions)
						numberOptions[1], numberOptions[randomOption] = numberOptions[randomOption], numberOptions[1]
					end
				end
			end
			
			for i = 1, #numberOptions do
				
				-- local randomNumPosition = math.random( 1, #gameNumbersPositions[numSlots][randomPosSet][randomNumSet] )
				
				-- local setNumbersScale = gameNumbersPositions[numSlots][randomPosSet][randomNumSet][randomNumPosition][4] * slotNumbers[numberOption].scale
				
				local numberOption = numberOptions[i]
				if (numberOption == 0) then
					numberOption = 11
				end
				
				print("test")
				print(#numberOptions)
				print(choiceOptions[#numberOptions])
				print(choiceOptions[#numberOptions][2])
				local setNumbersScale = choiceOptions[#numberOptions][2]
				
				gameNumbers[#gameNumbers+1] = display.newGroup()
				
				
				-- local puzzlePiece
				
				-- local puzzlePiece = display.newImageRect("Images/puzzle" .. numberOptions[i] .. ".png", sharkNumbers[numberOption].w, sharkNumbers[numberOption].h )
				
				--dynamicNumberCard( #cards+1, tostring(numberOptions[i]), slotOptions[numSlots][2] )
				
				cards[#cards+1] =  dynamicNumberCardSlots( tostring(numberOptions[i]), slotOptions[numSlots][2], 1 )
				
				print(gameNumbers)
				print(cards)
				print(#cards)
				
				gameNumbers[#gameNumbers]:insert( cards[#cards] )
				--gameNumbers[#gameNumbers]:insert( cards[#cards].textGroup )
				
				
				gameNumbers[#gameNumbers].anchorChildren = true
				
				gameNumbers[#gameNumbers].xScale, gameNumbers[#gameNumbers].yScale = setNumbersScale, setNumbersScale
				
				
				-- gameNumbers[#gameNumbers].x = halfW + 90 + gameNumbersPositions[numSlots][randomPosSet][randomNumSet][randomNumPosition][1]
				-- gameNumbers[#gameNumbers].y = halfH + gameNumbersPositions[numSlots][randomPosSet][randomNumSet][randomNumPosition][2]
				
				-- local rotationDirection = math.random( 1, 2 )
				
				-- if (rotationDirection == 1) then
					-- gameNumbers[#gameNumbers].rotation = math.random( -5, -3 )
				-- else
					-- gameNumbers[#gameNumbers].rotation = math.random( 3, 5 )
				-- end
				
				-- gameNumbers[#gameNumbers].rotation = gameNumbersPositions[numSlots][randomPosSet][randomNumSet][randomNumPosition][3]
				
				if (myData.isFireTV and fireTVMultiCardOption == false or 
					myData.isController and fireTVMultiCardOption == false) then
				else
					if (#gameNumbers ~= 1) then
						gameNumbers[#gameNumbers].x = gameNumbers[#gameNumbers-1].x + (gameNumbers[#gameNumbers].contentWidth*0.5) + (gameNumbers[#gameNumbers-1].contentWidth*0.5) + choiceOptions[#numberOptions][1]
					end
				end
				
				gameNumbers[#gameNumbers].y = halfH + 70
				
				gameNumbers[#gameNumbers].initScale = gameNumbers[#gameNumbers].xScale
				gameNumbers[#gameNumbers].initX = gameNumbers[#gameNumbers].x
				gameNumbers[#gameNumbers].initY = gameNumbers[#gameNumbers].y
				gameNumbers[#gameNumbers].origX = gameNumbers[#gameNumbers].x
				gameNumbers[#gameNumbers].origY = gameNumbers[#gameNumbers].y
				gameNumbers[#gameNumbers].initR = gameNumbers[#gameNumbers].rotation
				gameNumbers[#gameNumbers].origScale = gameNumbers[#gameNumbers].xScale
				gameNumbers[#gameNumbers].popScale = gameNumbers[#gameNumbers].origScale + 0.2
				gameNumbers[#gameNumbers].id = numberOptions[i]
				gameNumbers[#gameNumbers].index = #gameNumbers
				gameNumbers[#gameNumbers].inSlot = false
				-- gameNumbers[#gameNumbers].alpha = 0
				gameNumbers[#gameNumbers].frame = 0
				
				
				gameNumbers[#gameNumbers].isAnAnswer = false
				for k = 1, #gameSlots do
					if (gameSlots[k].id) then
						for m = #gameSlots[k].id, 1, -1 do
							if (gameSlots[k].id[m] == gameNumbers[#gameNumbers].id) then
								gameNumbers[#gameNumbers].isAnAnswer = true
							end
						end
					end
				end
				
				local randomRewardAnim = math.random( 1, #rewardAnims )
				gameNumbers[#gameNumbers].finishAnim = rewardAnims[randomRewardAnim]
				gameNumbers[#gameNumbers].shakeAnim = { id = "shake", particles = "", duration = 600, anchor = { 0.5, 0.5 }, particleOffset = { 0, 0 } }
				choicesGroup:insert( gameNumbers[#gameNumbers] )
				
				-- table.remove( gameNumbersPositions[numSlots][randomPosSet][randomNumSet], randomNumPosition )
				
				-- gameNumbers[#gameNumbers].xScale = gameSlots[#gameSlots].xScale
				-- gameNumbers[#gameNumbers].yScale = gameSlots[#gameSlots].yScale
				-- gameNumbers[#gameNumbers].startScale = gameNumbers[#gameNumbers].xScale
				-- local gameSlotX, gameSlotY = gameSlots[#gameSlots]:localToContent( 0, 0 )
				-- gameNumbers[#gameNumbers].x = gameSlotX
				-- gameNumbers[#gameNumbers].y = gameSlotY
				-- gameNumbers[#gameNumbers].rotation = gameSlots[#gameSlots].rotation
				
			end
			
			
			
			slotsGroup.anchorChildren = true
			slotsGroup.anchorX, slotsGroup.anchorY = 0.5, 0.5
			slotsGroup.x, slotsGroup.y = halfW, halfH - 90
			
			slotsGroupX, slotsGroupY = slotsGroup.x, slotsGroup.y
			
			choicesGroup.anchorChildren = true
			choicesGroup.anchorX, choicesGroup.anchorY = 0.5, 0.5
			choicesGroup.x, choicesGroup.y = halfW, halfH + 35
			
			for i = slotsGroup.numChildren, 1, -1 do
				local tempItem = slotsGroup[i]
				local initX, initY = tempItem:localToContent(0,0)
				gameGroup:insert( slotsGroup[i] )
				tempItem.x, tempItem.y = initX, initY
			end
			-- for i = choicesGroup.numChildren, 1, -1 do
				-- local tempItem = choicesGroup[i]
				-- local initX, initY = tempItem:localToContent(0,0)
				-- gameGroup:insert( choicesGroup[i] )
				-- tempItem.x, tempItem.y = initX, initY
				
				-- tempItem.initX = tempItem.x
				-- tempItem.initY = tempItem.y
			-- end
			slotsGroup:removeSelf()
			slotsGroup = nil
			-- choicesGroup:removeSelf()
			-- choicesGroup = nil
			
			choicesGroup.x = 1000
			
			
			for i = #gameNumbers, 1, -1 do
				gameNumbers[i]:toFront()
				
				gameNumbers[i].origContentWidth = gameNumbers[i].contentWidth
				gameNumbers[i].origContentHeight = gameNumbers[i].contentHeight
				
			end
		
		
			gameGroup:insert(howManyBackground)
			gameGroup:insert(howManyGroup)
		
			-- gameGroup:insert( slotsGroup )
			-- gameGroup:insert( choicesGroup )
			this:insert( gameGroup )
			
			
			timer.performWithDelay( 1, showCardsSlots )
		
		end
		
	end
	setUpCardsSlots()
	
    ----------------------
    -- Destroy function --
    ----------------------
    function this:destroy()
        if self.isLive then
            print("game object destroyed.")
            self.isLive = false
            
			Runtime:removeEventListener("enterFrame", this)
			bg:removeEventListener("touch", this)
			
			if (myData.isController) then
				Runtime:removeEventListener( "key", cardSlotsTap )
			elseif (myData.isFireTV) then
				Runtime:removeEventListener( "onFTVKey", cardSlotsTap )
			end
			
			newSlotsCards = nil
			showSlotsPuzzle = nil
			
			for i = #gameNumbers, 1, -1 do
				resetItemAnim( gameNumbers[i] )
			end
			for i = #cards, 1, -1 do
				resetItemAnim( cards[i] )
			end
			resetItemAnim( gameGroup )
			
			
			if (rewardTimer) then
				timer.cancel( rewardTimer )
				rewardTimer = nil
			end
			if (numTimer) then
				timer.cancel( numTimer )
				numTimer = nil
			end
			if (timerVO) then
				timer.cancel( timerVO )
				timerVO = nil
			end
			
			
			if (gameNumbers) then
				for i = #gameNumbers, 1, -1 do
					if (gameNumbers[i]) then
						gameNumbers[i]:removeSelf()
						gameNumbers[i] = nil
					end
				end
				gameNumbers = nil
			end
			if (gameSlots) then
				for i = #gameSlots, 1, -1 do
					if (gameSlots[i]) then
						gameSlots[i]:removeSelf()
						gameSlots[i] = nil
					end
				end
				gameSlots = nil
			end
			
            self:removeSelf()
            self = nil
        end
    end
    
    ----------------------
    -- global functions --
    ----------------------
    -- if (myData.isFireTV or myData.isController and version.appStore ~= "Chrome") then 
    -- else
        transition.to( backButton, { time=700, alpha=1, transition=easing.outExpo } )
		transition.to( instructionsReplayButton, { time=700, alpha=1, transition=easing.outExpo } )
    -- end
    timer.performWithDelay( 550, base.backButtonTransition )
    
    ----------------------
    return this
end

return M
