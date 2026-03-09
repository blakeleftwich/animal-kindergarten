local M = {}

local _W   = display.contentWidth
local _H   = display.contentHeight
local _CX  = display.contentCenterX
local _CY  = display.contentCenterY
local _TOP = display.screenOriginY
local _BTM = display.contentHeight - display.screenOriginY
local _RHT = display.contentWidth - display.screenOriginX
local _LFT = display.screenOriginX
local _WIDTH = _RHT - _LFT
local _HEIGHT = _BTM - _TOP

local myData = require("Scripts.myData")


-------------------------------------------------
-- This is a global init function
-------------------------------------------------
local function backButtonTransition()
    if (myData.isFireTV or myData.isController) then 
        timer.performWithDelay( 700, makeButtonsActive )
    else
        makeButtonsActive()
    end
--    if (myData.isController) then
--        Runtime:addEventListener( "key", ChoiceTap )
--    elseif (myData.isFireTV) then
--        Runtime:addEventListener( "onFTVKey", ChoiceTap )
--    end
end

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
    local levelOptions = gameDetails["level" .. level]
    local gameOptions  = gameLevelDetails
    
	print("new puzzle")
	
    -- generate objects
    local this = display.newGroup()
    this.isLive = true
    this.isTouchEnable = true
    
    ---------------------------
    -- Image pop up function --
    ---------------------------
    local function imgPop(obj, upTime, downTime, scale, alpha)
        if obj.isPopping then return end
        obj.isPopping = true
        
        obj.xScale = scale or 1
        obj.yScale = scale or 1
        obj.alpha = alpha or 1

        local function func()
            transition.to(obj, { time = downTime or 400 , xScale = 1, yScale = 1, transition=easing.outExpo,
            onComplete = function()
               obj.isPopping = false 
            end})
        end
        transition.to(obj, {time = upTime or 150, alpha = 1, xScale = 1.5, yScale = 1.5, transition=easing.inExpo,
            onComplete = func})
    end
    
    -----------------------------
    -- Image floating function --
    -----------------------------
    local function imgFloat(obj)
        local posY = obj.y
        local transTime = 1500
        local transShift = 2
        local func1, func2
        function func1()
            if not this.isLive then return end
            local r = math.random(80, 120)*0.01
            transition.to(obj, { time=transTime*r , y=posY+transShift*r, transition=easing.inOutSine, onComplete=func2 } )
        end
        function func2()
            if not this.isLive then return end
            local r = math.random(80, 120)*0.01
            transition.to(obj, { time=transTime*r , y=posY-transShift*r, transition=easing.inOutSine, onComplete=func1 } )
        end
        func2()
    end
    
    
    -- copy game details...
    local tblQuestion = gameOptions.questions
	local tblPuzzle = gameOptions.puzzle
	local gameGroup = display.newGroup()
	local slotsGroup = display.newGroup()
	local choicesGroup = display.newGroup()
	local itemStartTouched = false
	local isEndGame = false
	local currentCount = 1
	local currentIndex = 1
	local currentItem = 0
	local showSlotBG = false
	local floaters = {}
	gameSlots = {}
	local gameNumbers = {}
	local numberOptions = {}
	
	local sRange, eRange = gameOptions.cards.startRange, gameOptions.cards.endRange
	local startRange, endRange = tblPuzzle.minRand, tblPuzzle.maxRand
	local numSlots = math.random( 2, 4 )
	local incorrectChoices = tblPuzzle.incorrectChoices
	local puzzleNum = 0
	if (tblPuzzle.imageSet == "Num" or tblPuzzle.imageSet == "NumDifficult") then
		if (#usedSlotPuzzleNums > 5) then
			for i = #usedSlotPuzzleNums, 1, -1 do
				table.remove( usedSlotPuzzleNums, i )
			end
		end
		if (#usedSlotPuzzleNums < (endRange-startRange+1)) then
			local numRepeated = false
			repeat
				numRepeated = false
				puzzleNum = math.random( startRange, endRange )
				
				for i = #usedSlotPuzzleNums, 1, -1 do
					if (usedSlotPuzzleNums[i] == puzzleNum) then
						numRepeated = true
					end
				end
			
			until numRepeated == false and puzzleNum ~= 11
		else
			puzzleNum = math.random( startRange, endRange )
		end
		numSlots = string.len(tostring(puzzleNum))
		
		local usedNum = false
		for i = #usedSlotPuzzleNums, 1, -1 do
			if (usedSlotPuzzleNums[i] == puzzleNum) then
				usedNum = true
			end
		end
		if (usedNum == false) then
			usedSlotPuzzleNums[#usedSlotPuzzleNums+1] = puzzleNum
		end
	else
		if (tblQuestion.numAnswers == "random") then
			numSlots = math.random( 2, 4 )
		else
			numSlots = tblQuestion.numAnswers
		end
	end
	
	print(puzzleNum)
	print(numSlots)
	-- if (numSlots == 3) then
		-- incorrectChoices = math.random( 0, 1 )
	-- elseif (numSlots == 2) then
		-- incorrectChoices = 2
	-- else
		-- incorrectChoices = math.random( 0, 2 )
	-- end
	
	-- startRange, endRange = 11, 11
	
	
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
	
	local rewardAnims = { 
		{ id = "shake", particles = "", duration = 4000, anchor = { 0.5, 0.5 }, particleOffset = { 0, 0 } }, 
		{ id = "spin", particles = "", duration = 700, anchor = { 0.5, 0.5 }, particleOffset = { 0, 0 } },
		{ id = "balloon", particles = "", duration = 4000, anchor = { 0.5, 0.5 }, particleOffset = { 0, 0 } },
		-- { id = "float", particles = "", duration = 4000, anchor = { 0.5, 0.5 }, particleOffset = { 0, 0 } },
	}
	
	
	print("current game")
	print(curGame)
	
	if (tblPuzzle.imageSet == "Num" or tblPuzzle.imageSet == "NumDifficult") then
		for i = 1, string.len(tostring(puzzleNum)) do
			numberOptions[#numberOptions+1] = tonumber(tostring(puzzleNum):sub( i, i ))
		end
	else
	
		local randomNumbersTable = {}
		for i = startRange, endRange do
			randomNumbersTable[#randomNumbersTable+1] = i
		end
		-- randomizeTable( randomNumbersTable )
		-- randomizeTable( randomNumbersTable )
	
		local startOption = math.random(1, endRange-numSlots)
	
		for i = startOption, startOption-1+numSlots do
			
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
	end
	
	
	print(tblPuzzle.imageSet)
	print(#numberOptions)
	
	print("Test")
	print(startRange)
	print(endRange)
	print(numSlots)
	
	
	for i = 1, incorrectChoices do
	
		if (tblPuzzle.imageSet == "Num" or tblPuzzle.imageSet == "NumDifficult") then
	
			local randomNumbersTable = {}
			local isANumOption = false
	
			repeat
	
				for k = #randomNumbersTable, 1, -1 do
					randomNumbersTable[k] = nil
				end
				
				isANumOption = false
			
				if (eRange - sRange + 1 <= numSlots) then
					for k = sRange-1, eRange+1 do
						if (k > 0 and k < 11) then
							randomNumbersTable[#randomNumbersTable+1] = k
						end
					end
				else
					for k = sRange, eRange do
						if (k > 0 and k < 11) then
							randomNumbersTable[#randomNumbersTable+1] = k
						end
					end
				end
				randomizeTable( randomNumbersTable )
				randomizeTable( randomNumbersTable )
				
				print("choices")
				print(randomNumbersTable[i])
				
				for m = #numberOptions, 1, -1 do
					if (randomNumbersTable[i] == numberOptions[m]) then
						isANumOption = true
					end
				end
				
			until isANumOption == false
			
			numberOptions[#numberOptions+1] = randomNumbersTable[i]
		
		else
		
			local numChoice
			local numberRepeated = false
			repeat
				numberRepeated = false
				
				if (endRange - startRange + 1 <= numSlots) then
					numChoice = math.random( startRange-1, endRange+1 )
				else
					numChoice = math.random( startRange, endRange )
				end
				
				for k = #numberOptions, 1, -1 do
					if (numChoice == numberOptions[k]) then
						numberRepeated = true
					end
				end
				
			until numberRepeated == false and numChoice > 0 and numChoice < 10
		
			
			numberOptions[#numberOptions+1] = numChoice
		
		end
		
		
		
	end
	
	
	
	
	
	function readPuzzleSlotsVO()
	
		if savedData.enableSounds == true then
		
			if (tblPuzzle.imageSet == "Num" or tblPuzzle.imageSet == "NumDifficult") then
				
				-- if (isPutNumTogetherFirstPlay == true) then
					-- playReservedChannel( putTheNumberBack, currentGameChannel, 0 )
				-- else
				
					local randomSound = math.random( 1, 2 )
					if (randomSound == 1) then
						playReservedChannel( buildTheNumber1, 28, 0 )
					else
						playReservedChannel( buildTheNumber2, 28, 0 )
					end
					
					local function buildNumVO()
						playReservedChannel( gameNumSounds[puzzleNum], 29, 0 )
						currentGameChannel = currentGameChannel + 1
						if (currentGameChannel > 25) then
							currentGameChannel = 22
						end
					end
					timerNumVO = timer.performWithDelay( 1100, buildNumVO )
				
				-- end
				
			else
				print("isFirst")
				print(isPutNumOrderFirstPlay)
			
				if (isPutNumOrderFirstPlay == true) then
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
			end
			currentGameChannel = currentGameChannel + 1
			if (currentGameChannel > 25) then
				currentGameChannel = 22
			end
		end
	
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
			
				if (gameSlots[i].bg) then
					if (gameSlots[i] == gameSlots[currentCardSelected]) then
						gameSlots[i].bg:setFillColor( 0 )
						gameSlots[i].bg.alpha = gameSlots[i].bg.initAlpha + (0.125 * cursor.alpha)
					else
						gameSlots[i].bg:setFillColor( 0, 0, 0 )
						gameSlots[i].bg.alpha = gameSlots[i].bg.initAlpha
					end
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
				currentGameChannel = 22
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
		
		
		
		local function finishTransToSlot()
			
			currentItem[1].alpha = 0
			
			-- slotsGroup:insert( currentItem )
			-- currentItem.x = currentItem.x + (choicesGroup.x - slotsGroup.x)
			-- currentItem.y = currentItem.y + (choicesGroup.y - slotsGroup.y)
			
			
			-- transition.to( currentItem, { delay = 0, time=50 , x = currentSlot.x - (choicesGroup.x - slotsGroup.x), y = currentSlot.y - (choicesGroup.y - slotsGroup.y), xScale = currentSlot.xScale, yScale = currentSlot.yScale, rotation = currentSlot.rotation, transition=easing.inExpo } )
			
			-- if (myData.isFireTV or myData.isController) then 
			
			
			currentItem.origScale = currentSlot.xScale
			
			transition.to( currentItem, { delay = 50, time=50 , xScale = currentItem.popScale, yScale = currentItem.popScale, transition=easing.inExpo } )
			transition.to( currentItem, { delay = 100, time=50 , xScale = currentItem.origScale, yScale = currentItem.origScale, transition=easing.outExpo} )

			
			-- currentSlot:removeEventListener("touch", numberTouched)
			currentSlot:toFront()
			
			transition.to( currentSlot, { delay = 50, time=50 , alpha = 0, transition=easing.outExpo } )
			transition.to( currentSlot.bg, { delay = 50, time=50 , alpha = 0, transition=easing.outExpo } )
			
			Particles:newEmitter(explosions,"fireworks", "Images/starParticle.png", 32, 32, 10, currentSlot.x, currentSlot.y, -4, 4, -16, 6, 252,234,27)--altRgb[1], altRgb[2], altRgb[3])
			explosions:toFront()
			
			if savedData.enableSounds == true then
				playReservedChannel(popSounds[math.random(1,3)], currentPopChannel, 0)
			end
			currentPopChannel = currentPopChannel + 1
			if currentPopChannel > 26 then
				currentPopChannel = 27
			end
			
			if savedData.enableSounds == true then
				if (tblPuzzle.imageSet == "Num" and currentItem.id == 0 or 
						tblPuzzle.imageSet == "NumDifficult" and currentItem.id == 0) then
					playReservedChannel( gameSounds.zero, currentGameChannel, 0 )
				else
					playReservedChannel( gameNumSounds[currentItem.id], currentGameChannel, 0 )
				end
				currentGameChannel = currentGameChannel + 1
				if (currentGameChannel > 25) then
					currentGameChannel = 22
				end
			end

			
			for m = 1, #gameNumbers do
				if (gameNumbers[m].inSlot == false) then
					gameNumbers[m]:toFront()
				end
			end
			
			local function numbersAnim()
			
				for i = #gameSlots, 1, -1 do
					gameSlots[i].bg:removeSelf()
					gameSlots[i].bg = nil
				end
				for i = #gameNumbers, 1, -1 do
					gameNumbers[i][1]:removeSelf()
					gameNumbers[i][1] = nil
				end
			
				-- if savedData.enableSounds == true then
					-- playReservedChannel(shortClapSound, currOtherMainChannel, 0)
					-- currOtherMainChannel = currOtherMainChannel + 1
					-- if (currOtherMainChannel > 17) then
						-- currOtherMainChannel = 15
					-- end
				-- end
			
				if (tblPuzzle.imageSet == "Num" or tblPuzzle.imageSet == "NumDifficult") then
					isPutNumTogetherFirstPlay = false
				else
					isPutNumOrderFirstPlay = false
				end
			
				-- local randomRewardVO = math.random( 1, #randomRewardSounds )
				
				-- playReservedChannel( gameSounds[randomRewardSounds[randomRewardVO]], sAudio.gameReward.c, sAudio.gameReward.l, "sound" )
		
				if savedData.enableSounds == true then
					if (tblPuzzle.imageSet == "Num" or 
							tblPuzzle.imageSet == "NumDifficult") then
						playReservedChannel( gameNumSounds[puzzleNum], currentGameChannel, 0 )
					-- else
						-- playReservedChannel( gameNumSounds[currentItem.id], currentGameChannel, 0 )
					end
					currentGameChannel = currentGameChannel + 1
					if (currentGameChannel > 25) then
						currentGameChannel = 22
					end
				end
		
				if (tblPuzzle.imageSet == "Num" or tblPuzzle.imageSet == "NumDifficult") then
				
					local gameNumbersGroup = display.newGroup()
					this:insert( gameNumbersGroup )
					for k = #gameNumbers, 1, -1 do
						if (gameNumbers[k].alpha > 0) then
							gameNumbersGroup:insert( gameNumbers[k] )
						end
					end
					
					-- local origNumX, origNumY = gameNumbers[1]:localToContent(0,0)
					
					gameNumbersGroup.anchorChildren = true
					gameNumbersGroup.anchorX, gameNumbersGroup.anchorY = 0.5, 0.5
					gameNumbersGroup.x, gameNumbersGroup.y = slotsGroupX, slotsGroupY
					
					-- local newNumX, newNumY = gameNumbers[1]:localToContent(0,0)
					
					
					
					
					gameNumbersGroup.initX = gameNumbersGroup.x
					gameNumbersGroup.initY = gameNumbersGroup.y
					gameNumbersGroup.initR = gameNumbersGroup.rotation
					gameNumbersGroup.initScale = gameNumbersGroup.xScale
				
					gameNumbersGroup.animationInfo = gameNumbers[1].finishAnim
					
					animateStart( gameNumbersGroup )
				
				else
				
					local randomRewardVO = math.random( 1, #randomRewardSounds )
				
					if savedData.enableSounds == true then
						playReservedChannel( gameSounds[randomRewardSounds[randomRewardVO]], currentGameChannel, 0 )
						currentGameChannel = currentGameChannel + 1
						if (currentGameChannel > 25) then
							currentGameChannel = 22
						end
					end
					-- playReservedChannel( gameSounds[randomRewardSounds[randomRewardVO]], sAudio.gameReward.c, sAudio.gameReward.l, "sound" )
		
				
					for k = #gameNumbers, 1, -1 do
						
						gameNumbers[k].initX = gameNumbers[k].x
						gameNumbers[k].initY = gameNumbers[k].y
						gameNumbers[k].initR = gameNumbers[k].rotation
						gameNumbers[k].initScale = gameNumbers[k].xScale
					
						gameNumbers[k].animationInfo = gameNumbers[k].finishAnim
						
						if (gameNumbers[k].animation) then
						else
							animateStart( gameNumbers[k] )
						end
					end
				
				end
				-- rewardTimer = timer.performWithDelay( 1000, fillMeter )
				
				local function hideGameScreen()
				
					if savedData.enableSounds == true then
						playReservedChannel(shortClapSound, currOtherMainChannel, 0)
						currOtherMainChannel = currOtherMainChannel + 1
						if (currOtherMainChannel > 17) then
							currOtherMainChannel = 15
						end
					end
				
					if (slotsGroup) then
						gameGroup:insert( slotsGroup )
					end
					if (choicesGroup) then
						gameGroup:insert( choicesGroup )
					end
					for i = #gameNumbers, 1, -1 do
						transition.to( gameNumbers[i], { time=700, alpha=0, transition=easing.outExpo } )
					end
					
					if (gameNumbersGroup) then
						gameGroup:insert( gameNumbersGroup )
					end
					transition.to( gameGroup, { time=700, alpha=0, transition=easing.outExpo } )
					timer.performWithDelay( 0, goodJobSequence )
				end
				rewardTimer = timer.performWithDelay( 1200, hideGameScreen )
			
				
			end
			
			
			
			
			
			currentCount = currentCount + 1
			if (currentCount > #gameSlots) then
			
				isEndGame = true
				buttonsActive = false
				
				bg:removeEventListener("touch", this)
			
				-- instructionsBox:removeEventListener("touch", instructionsButtonTouched)
				
				-- bgSky:removeEventListener("touch", gameButtonTouched)

				-- for i = 1, #gameSlots do
					-- gameSlots[i]:removeEventListener("touch", numberTouched)
				-- end
			
				currentCount = #gameNumbers
				
				for k = 1, #gameNumbers do
					if (gameNumbers[k].inSlot == true) then
					else
						transition.to( gameNumbers[k], { time=400 , alpha = 0, transition=easing.outExpo} )
					end
				end
				
				rewardTimer = timer.performWithDelay( 1000, numbersAnim )
			else
				
				
				if (myData.isFireTV or myData.isController) then 
					
					local function scatterNumbers()
					
						transTime = 0
					
						for i = #floaters, 1, -1 do
							floaters[i] = nil
						end
					
						repeat
							currentIndex = currentIndex + 1
						until gameNumbers[currentIndex].isAnAnswer == true
						
						gameNumbers[currentIndex]:toFront()
						gameNumbers[currentIndex].y = gameSlots[1].y
						gameNumbers[currentIndex].x = screenOriginX - 100
					
						local spinAmount = math.random( -8, 8 )
						if spinAmount < 1 or spinAmount > 1 then spinAmount = 1 end
						gameNumbers[currentIndex].rotation = gameNumbers[currentIndex].rotation + (spinAmount*360)
						randomDelay = math.random(1,100)
						local randomTime = math.random(1300,1400)
						
						gameNumbers[currentIndex].origY = gameNumbers[currentIndex].initY
						gameNumbers[currentIndex].origX = gameNumbers[currentIndex].initX
						
						transition.to( gameNumbers[currentIndex], {delay = randomDelay, time=randomTime-randomDelay, alpha = 1, x = gameNumbers[currentIndex].initX, y = gameNumbers[currentIndex].initY, rotation = gameNumbers[currentIndex].initR, xScale = gameNumbers[currentIndex].initScale, yScale = gameNumbers[currentIndex].initScale, transition=easing.inOutQuad } )
					
						transition.to( gameNumbers[currentIndex][1], { delay = randomDelay, time= randomTime-randomDelay, alpha=gameNumbers[currentIndex][1].initAlpha, transition=easing.inExpo } )
						
						
						if (randomDelay + randomTime > transTime) then
							transTime = randomDelay + randomTime
						end
					
						local function startNumFloat()
						
							local function showCursor()
								for i = 1, #gameSlots do
									if (gameSlots[i].inSlot == false) then
										cursor.x, cursor.y = gameSlots[i]:localToContent( gameSlots[i].contentWidth*0.8, gameSlots[i].contentHeight*0.8 )
										cursor:toFront()
										targetCard = gameSlots[i]
										currentCardSelected = i
										cursorTransition = transition.to( cursor, { time=100, alpha=1 } )
										makeButtonsActive()
										break
									end
								end
							end
							timer.performWithDelay( 100, showCursor )
						
							floaters[#floaters+1] = gameNumbers[currentIndex].index
							
						end
						numTimer = timer.performWithDelay( transTime + 1, startNumFloat )
						
						
					end
					numTimer = timer.performWithDelay( 900, scatterNumbers )
					
					
					rewardTimer = timer.performWithDelay( 900, startWindAnim )
				
				else
					timer.performWithDelay( 200, makeButtonsActive )
				end
			end
			
			
		end
		
		if (myData.isFireTV or myData.isController) then 
			transition.to( currentItem, { delay = 0, time=350 , x = currentSlot.x, y = currentSlot.y, xScale = currentSlot.xScale, yScale = currentSlot.yScale, rotation = currentSlot.rotation, transition=easing.outExpo } )
			timer.performWithDelay( 351, finishTransToSlot )
		else
			transition.to( currentItem, { delay = 0, time=50 , x = currentSlot.x, y = currentSlot.y, xScale = currentSlot.xScale, yScale = currentSlot.yScale, rotation = currentSlot.rotation, transition=easing.inExpo } )
			finishTransToSlot()
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
							for k = #gameSlots, 1, -1 do
								if (currentItem.id == gameSlots[k].id) then
									if (currentItem.scaleTrans) then
										transition.cancel( currentItem.scaleTrans )
										currentItem.scaleTrans = nil
									end
									hasSlot = true
									currentItem.scaleTrans = transition.to( currentItem, { time=400 , xScale = gameSlots[k].xScale, yScale = gameSlots[k].yScale, rotation = gameSlots[k].rotation, transition=easing.outExpo } )
								end
							end
							
							if (hasSlot == false) then
								if (currentItem.scaleTrans) then
									transition.cancel( currentItem.scaleTrans )
									currentItem.scaleTrans = nil
								end
								currentItem.scaleTrans = transition.to( currentItem, { time=400 , xScale = gameSlots[1].xScale, yScale = gameSlots[1].yScale, transition=easing.outExpo } )
							end
							
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
            if obj._isFocus then
                obj._isFocus = false
                display.getCurrentStage():setFocus(nil)
				
			if (currentItem ~= 0 and gameSlots) then
				
				for i = #gameSlots, 1, -1 do
			
					local itemX, itemY = currentItem:localToContent( 0, 0 )
					local slotX, slotY = gameSlots[i]:localToContent( 0, 0 )
			
					if (itemX < slotX + (gameSlots[i].contentWidth*0.5) and 
							itemX > slotX - (gameSlots[i].contentWidth*0.5) and 
							itemY < slotY + (gameSlots[i].contentHeight*0.5) and 
							itemY > slotY - (gameSlots[i].contentHeight*0.5) and
							currentItem.id == gameSlots[i].id and gameSlots[i].inSlot == false) then
							
							
						checkSlot( currentItem, gameSlots[i] )
						
						break
						
					end
				
				end
				
				if (currentItem.inSlot == false) then
					
					if (currentItem.x > screenEdgeX - (currentItem.contentWidth*0.5)) then
						currentItem.x = screenEdgeX - (currentItem.contentWidth*0.5)
					elseif (currentItem.x < screenOriginX + (currentItem.contentWidth*0.5)) then
						currentItem.x = screenOriginX + (currentItem.contentWidth*0.5)
					elseif (currentItem.y > screenEdgeY - (currentItem.contentHeight*0.5)) then
						currentItem.y = screenEdgeY - (currentItem.contentHeight*0.5)
					elseif (currentItem.y < screenOriginY + (currentItem.contentHeight*0.5))then
						currentItem.y = screenOriginY + (currentItem.contentHeight*0.5)
					end
					
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
							
							if (tblPuzzle.imageSet == "Num" and currentItem.id == 0 or 
									tblPuzzle.imageSet == "NumDifficult" and currentItem.id == 0) then
								playReservedChannel( gameSounds.zero, currentGameChannel, 0 )
							else
								-- playReservedChannel( gameNumSounds[currentItem.id], gameButtonCurr, sAudio.gameButton1.l, "sound" )
								playReservedChannel( gameNumSounds[currentItem.id], currentGameChannel, 0 )
							end
							currentGameChannel = currentGameChannel + 1
							if (currentGameChannel > 25) then
								currentGameChannel = 22
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
				
				currentItem = 0
				
			end
                
                -- if obj.name == chooseGameAnswer then
                    -- self.isTouchEnable = false
                    
					
            end -- if obj._isFocus then
        end -- touch began, moved, ended, cancelled

        return true
    end
	
	
	function puzzleSlotsTap( event )

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
													keyName ~= "menu" or
													event.keyName == nil) then
		
				if (myData.isFireTV or myData.isController) then 
					-- transition.to( cursor, { time=100, alpha=0 } )
					buttonsActive = false
				end
				buttonsActive = false
				
				
				if (gameNumbers[currentIndex].id == gameSlots[currentCardSelected].id) then
					
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
					
					for k = #floaters, 1, -1 do
						if (floaters[k] == gameNumbers[currentIndex].index) then
							table.remove( floaters, k )
						end
					end
					
					checkSlot( gameNumbers[currentIndex], gameSlots[currentCardSelected] )
				
				else
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
    
	
	
	local function showPuzzle()
	
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
			
			
			local currentSlotNum = 0
			for m = 1, #gameSlots do
				for i = 1, #gameNumbers do
					if (gameSlots[m].selected == false and gameNumbers[i].id == gameSlots[m].id) then
						-- local slotFound = false
						-- local slotPosX, slotPosY
						-- for k = 1, #gameSlots do
							-- if (gameNumbers[i].id == gameSlots[k].id) then
								-- slotFound = true
								slotPosX, slotPosY = gameSlots[m].x, gameSlots[m].y
							-- end
						-- end
						gameSlots[m].selected = true
						
						gameNumbers[i].hasSlot = m
						-- gameNumbers[i].initX = gameNumbers[i].x
						-- gameNumbers[i].initY = gameNumbers[i].y
						
						-- if (slotFound == true) then
							-- gameNumbers[i].x = slotPosX - (choicesGroup.x - slotsGroup.x)
							-- gameNumbers[i].y = slotPosY - (choicesGroup.y - slotsGroup.y)
							
							gameNumbers[i].x = slotPosX
							gameNumbers[i].y = slotPosY
						-- else
							-- gameNumbers[i].x = math.random( -50, 50 )
							-- gameNumbers[i].y = screenEdgeY + 100
						-- end
				
						local function scaleGameImageBack( obj )
						
							-- transition.to( obj, { time=100 , xScale = obj.startScale, yScale = obj.startScale, transition=easing.outExpo} )
							transition.to( obj, { time=100 , xScale = obj.initScale, yScale = obj.initScale, transition=easing.outExpo} )
						
							if (gameSlots) then
							
								if (m > #gameSlots) then
								else
								
									-- playReservedChannel( mainSounds.pop[math.random(1,#mainSounds.pop)], gameSoundFXCurr, sAudio.gameSoundFX1.l, "sound" )
								
									-- gameSoundFXCurr = gameSoundFXCurr + 1
									-- if (gameSoundFXCurr > sAudio.gameSoundFX3.c) then
										-- gameSoundFXCurr = sAudio.gameSoundFX1.c
									-- end
								
									-- playReservedChannel( numSounds[obj.id], gameSoundFXCurr, sAudio.gameSoundFX1.l, "sound" )
									
									-- gameSoundFXCurr = gameSoundFXCurr + 1
									-- if (gameSoundFXCurr > sAudio.gameSoundFX3.c) then
										-- gameSoundFXCurr = sAudio.gameSoundFX1.c
									-- end
									
									if savedData.enableSounds == true then
										if (tblPuzzle.imageSet ~= "Num" and tblPuzzle.imageSet ~= "NumDifficult" or
												m == #gameSlots) then
											playReservedChannel(popSounds[math.random(1,3)], currentPopChannel, 0)
										end
									end
									currentPopChannel = currentPopChannel + 1
									if currentPopChannel > 26 then
										currentPopChannel = 27
									end
									
									if savedData.enableSounds == true then
										if (tblPuzzle.imageSet == "Num" or tblPuzzle.imageSet == "NumDifficult") then
											if (m == #gameSlots and hasPlayedVO == false) then
												playReservedChannel( gameNumSounds[puzzleNum], 13, 0 )
												hasPlayedVO = true
											end
										else
											playReservedChannel( gameNumSounds[obj.id], currentGameChannel, 0 )
										end
										currentGameChannel = currentGameChannel + 1
										if (currentGameChannel > 25) then
											currentGameChannel = 22
										end
									end
								end
								
								if (m == #gameSlots) then
								
									
									
									local function scatterNumbers()
									
										showSlotBG = true
									
										local transTime = 0
										for k = 1, #gameNumbers do
										
											gameNumbers[k]:toFront()
											if (tblPuzzle.imageSet == "NumDifficult") then
												gameNumbers[k].x = screenOriginX - 100
											elseif (gameNumbers[k].hasSlot) then
												transition.to( gameSlots[gameNumbers[k].hasSlot], { time=400 , alpha = 1, transition=easing.inExpo} )
												transition.to( gameSlots[gameNumbers[k].hasSlot].bg, { time=400 , alpha = gameSlots[gameNumbers[k].hasSlot].bg.initAlpha, transition=easing.inExpo} )
											else
												gameNumbers[k].x = screenOriginX - 100
											end
											
										
											local spinAmount = math.random( -8, 8 )
											if spinAmount < 1 or spinAmount > 1 then spinAmount = 1 end
											gameNumbers[k].rotation = gameNumbers[k].rotation + (spinAmount*360)
											randomDelay = math.random(1,100)
											local randomTime = math.random(1300,1400)
											
											gameNumbers[k].origY = gameNumbers[k].initY
											gameNumbers[k].origX = gameNumbers[k].initX
											
											if (k ~= currentIndex and myData.isFireTV or k ~= currentIndex and myData.isController) then
												transition.to( gameNumbers[k], {delay = randomDelay, time=randomTime-randomDelay, alpha = 1, x = screenEdgeX + 100, y = gameNumbers[k].initY, rotation = gameNumbers[k].initR, xScale = gameNumbers[k].initScale, yScale = gameNumbers[k].initScale, transition=easing.inOutQuad } )
											else
												transition.to( gameNumbers[k], {delay = randomDelay, time=randomTime-randomDelay, alpha = 1, x = gameNumbers[k].initX, y = gameNumbers[k].initY, rotation = gameNumbers[k].initR, xScale = gameNumbers[k].initScale, yScale = gameNumbers[k].initScale, transition=easing.inOutQuad } )
											end
										
											transition.to( gameNumbers[k][1], { delay = randomDelay, time= randomTime-randomDelay, alpha=gameNumbers[k][1].initAlpha, transition=easing.inExpo } )
					
										
											if (randomDelay + randomTime > transTime) then
												transTime = randomDelay + randomTime
											end
										
											if (k == #gameNumbers) then
												
												local function playUhOhVO()
												
													-- playReservedChannel( uhOhSound, currentGameChannel, 0 )
													-- currentGameChannel = currentGameChannel + 1
													-- if (currentGameChannel > 25) then
														-- currentGameChannel = 20
													-- end
													
													if savedData.enableSounds == true then
														playReservedChannel( uhOhSound, currentGameChannel, 0 )
														currentGameChannel = currentGameChannel + 1
														if (currentGameChannel > 25) then
															currentGameChannel = 22
														end
													end
												
												end
												timerVO = timer.performWithDelay( 500, playUhOhVO )
												
												
												local function startNumFloat()
												
													local function showCursor()
		
														cursor.xScale = cardOptions.scale -- Hand Cursor
														cursor.yScale = cardOptions.scale
														cursor:toFront()
														
														currentCardSelected = 1
														
														if (gameSlots and #gameSlots > 0) then
															for i = 1, #gameSlots do
																if (gameSlots[i].x < gameSlots[currentCardSelected].x) then
																	currentCardSelected = i
																end
															end
															
															cursor.x, cursor.y = gameSlots[currentCardSelected]:localToContent( gameSlots[currentCardSelected].contentWidth*0.8, gameSlots[currentCardSelected].contentHeight*0.8 )
															
														
															targetCard = gameSlots[currentCardSelected]
															cursorTransition = transition.to( cursor, { time=700, alpha=1 } )
														
														end
														
														if (myData.isController) then
															Runtime:addEventListener( "key", puzzleSlotsTap )
														elseif (myData.isFireTV) then
															Runtime:addEventListener( "onFTVKey", puzzleSlotsTap )
														end
														
													end
													
													if (myData.isFireTV or myData.isController) then 
														cursorTransition = timer.performWithDelay( 700, showCursor )
													end
												
													if (gameNumbers) then
														for i = #gameNumbers, 1, -1 do
															if (currentItem ~= gameNumbers[i]) then
																floaters[#floaters+1] = gameNumbers[i].index
															end
														end
													end
													
													
													local function playCanPutNumVO()
														
														-- if (currentGame == 1) then
															-- playReservedChannel( gameSounds.canPutBackNumOrder, sAudio.gameInstructions1.c, sAudio.gameInstructions1.l, "sound" )
														-- else
															-- local randomSound = math.random( 1, 5 )
															-- if (randomSound == 1) then
																-- playReservedChannel( gameSounds.canPutBackNum, sAudio.gameInstructions1.c, sAudio.gameInstructions1.l, "sound" )
															-- elseif (randomSound == 2) then
																-- playReservedChannel( gameSounds.canPutBackNumBelong, sAudio.gameInstructions1.c, sAudio.gameInstructions1.l, "sound" )
															-- elseif (randomSound == 3) then
																-- playReservedChannel( gameSounds.letsDoIt, sAudio.gameInstructions1.c, sAudio.gameInstructions1.l, "sound" )
															-- end
														-- end
														
														readPuzzleSlotsVO()
														
														questionText:toFront()
														questionTextTwo:toFront()
														transition.to( questionText, { time=700, x=halfW, transition=easing.outExpo } )
														transition.to( questionTextTwo, { time=700, x=halfW, transition=easing.outExpo } )
			
										
													
													end
													timerVO = timer.performWithDelay( 0, playCanPutNumVO ) -- 1500
												
													-- makeButtonsActive()
												
												end
												numTimer = timer.performWithDelay( transTime + 1, startNumFloat )
												
												
											end
										
										end
									
									end
									
									numTimer = timer.performWithDelay( 900, scatterNumbers )
									
									
									
									rewardTimer = timer.performWithDelay( 900, startWindAnim )
				
									
								end
								
							end
							
						end
						
						-- if (i > #gameSlots) then
							-- gameNumbers[i].showTrans = transition.to( gameNumbers[i], { delay = 100 + (#gameSlots * 700) + i, time=0 , alpha = 1, xScale = gameNumbers[i].initScale, yScale = gameNumbers[i].initScale, transition=easing.inExpo, onComplete = scaleGameImageBack} )
						-- else
						
						if (tblPuzzle.imageSet == "Num") then
							gameNumbers[i].showTrans = transition.to( gameNumbers[i], { delay = 0 + (0 * 700), time=100 , alpha = 1, xScale = gameNumbers[i].initScale+0.4, yScale = gameNumbers[i].initScale+0.4, transition=easing.inExpo, onComplete = scaleGameImageBack} )
						elseif (tblPuzzle.imageSet == "NumDifficult") then
							gameNumbers[i].showTrans = transition.to( gameSlots[m], { delay = 0 + (0 * 700), time=100 , alpha = 1, xScale = gameSlots[m].initScale+0.4, yScale = gameSlots[m].initScale+0.4, transition=easing.inExpo, onComplete = scaleGameImageBack} )
							transition.to( gameSlots[m].bg, { delay = 0 + (0 * 700), time=100 , alpha = gameSlots[m].bg.initAlpha, transition=easing.inExpo} )
						else
							gameNumbers[i].showTrans = transition.to( gameNumbers[i], { delay = 0 + (currentSlotNum * 700), time=100 , alpha = 1, xScale = gameNumbers[i].initScale+0.4, yScale = gameNumbers[i].initScale+0.4, transition=easing.inExpo, onComplete = scaleGameImageBack} )
						end
						currentSlotNum = currentSlotNum + 1
					end	
				end
			end
		
		
		
			-- transition.to( puzzleBGFinished, { time=700, alpha=1, transition=easing.inExpo } )
			-- for i = #puzzlePieces, 1, -1 do
				-- transition.to( puzzlePieces[i], { delay = 699, time=0, alpha=1, transition=easing.inExpo } )
			-- end
		
		
			local function thisIsVO()
				
				
				if savedData.enableSounds == true then
					playReservedChannel( thisSound, currentGameChannel, 0 )
					currentGameChannel = currentGameChannel + 1
					if (currentGameChannel > 25) then
						currentGameChannel = 22
					end
				end
				
				local function isVO()
				
					if savedData.enableSounds == true then
						-- if (currentNumber == "A" or currentNumber == "E" or currentNumber == "I" or currentNumber == "O") then
							-- playReservedChannel( isAnSound, currentGameChannel, 0 )
						-- else
							playReservedChannel( isASound, currentGameChannel, 0 )
						-- end
						currentGameChannel = currentGameChannel + 1
						if (currentGameChannel > 25) then
							currentGameChannel = 22
						end
					end
					
					local function numberVO()
						if savedData.enableSounds == true then
							playReservedChannel( gameNumSounds[currentNumber], currentGameChannel, 0 )
							currentGameChannel = currentGameChannel + 1
							if (currentGameChannel > 25) then
								currentGameChannel = 22
							end
						end
					end
					timer.performWithDelay( 500, numberVO )
				end
				timer.performWithDelay( 500, isVO )
				
			end
			-- timer.performWithDelay( 700, thisIsVO )
			
			
			
			if (tblPuzzle.imageSet == "Num" or tblPuzzle.imageSet == "NumDifficult") then
				questionText.text = "Build the number."
				if (display.pixelHeight == 960) then
					questionText.xScale = 0.75
					questionText.yScale = 0.75
				else
					questionText.xScale = 1
					questionText.yScale = 1
				end
				-- questionText.y = questionText.initY
				-- if (display.pixelHeight == 960) then
					-- questionText.y = questionText.initY + questionOptions.offsetY + 10
				-- else
					-- questionText.y = questionText.initY - 30
				-- end
				
				-- if system.getInfo( "platformName" ) == "Android" then
					-- questionText.y = questionText.y - 55
				-- end
				
				-- questionHitBox.y = questionText.y - 10
			else
				questionText.text = "Put the numbers where they belong."
			
				if system.getInfo( "platformName" ) == "Android" then
					questionText.y = questionText.y + 15
				end
			end
			questionText.anchorX = 0.5
			questionText.anchorY = 0.5
			questionText.x = 900
			questionText.alpha = 1
		
			-- cardTrans = transition.to( cardGroup, { time=700, x=halfW+cardOptions.offsetX, transition=easing.outExpo } )
			-- transition.to( questionText, { time=700, x=halfW, transition=easing.outExpo } )
			-- transition.to( questionTextTwo, { time=700, x=halfW, transition=easing.outExpo } )
		
			print("slots game")
			
			local function addGameListeners()
				bg:removeEventListener("touch", this)
				Runtime:removeEventListener("enterFrame", this)
				bg:addEventListener("touch", this)
				Runtime:addEventListener("enterFrame", this)
			end
			timer.performWithDelay( 500, addGameListeners )
		
		end
		
		
	end
	
	local function setUpPuzzle()
	
		print("slots")
		print(numSlots)
		
		if (newSlotsPuzzle) then
		else
		
			newSlotsPuzzle = true
	
			for i = 1, numSlots do
			
				-- local setSlotsScale = gameSlotsPositions[numSlots][randomPosSet][i][4] * slotNumbers[numberOption].scale
				-- print(slotNumbers[numberOption])
				-- print(numberOption)
				-- print(slotNumbers[numberOption].scale)
				-- print(slotOptions[numSlots][2])
				print(numberOptions[i])
				local numberOption = numberOptions[i]
				if (numberOption == 0) then
					numberOption = 11
				end
				
				local setSlotsScale = slotNumbers[numberOption].scale * slotOptions[numSlots][2]
				
				gameSlots[#gameSlots+1] = display.newImageRect("Images/slot" .. numberOptions[i] .. ".png", slotNumbers[numberOption].w, slotNumbers[numberOption].h )
				
				
					gameSlots[#gameSlots].xScale, gameSlots[#gameSlots].yScale = setSlotsScale, setSlotsScale
					-- gameSlots[#gameSlots].x = halfW + 90 + gameSlotsPositions[numSlots][randomPosSet][i][1]
					-- gameSlots[#gameSlots].y = halfH + gameSlotsPositions[numSlots][randomPosSet][i][2]
					-- gameSlots[#gameSlots].rotation = gameSlotsPositions[numSlots][randomPosSet][i][3]
				
				if (#gameSlots ~= 1) then
					if (tblPuzzle.imageSet == "Num" or tblPuzzle.imageSet == "NumDifficult") then
						gameSlots[#gameSlots].x = gameSlots[#gameSlots-1].x + (gameSlots[#gameSlots].contentWidth*0.5) + (gameSlots[#gameSlots-1].contentWidth*0.5) + slotOptions[numSlots][1] - 8
					else
						gameSlots[#gameSlots].x = gameSlots[#gameSlots-1].x + (gameSlots[#gameSlots].contentWidth*0.5) + (gameSlots[#gameSlots-1].contentWidth*0.5) + slotOptions[numSlots][1]
					end
				end
				
				gameSlots[#gameSlots].y = halfH - 90
				
				gameSlots[#gameSlots].initScale = gameSlots[#gameSlots].xScale
				gameSlots[#gameSlots].initX = gameSlots[#gameSlots].x
				gameSlots[#gameSlots].initY = gameSlots[#gameSlots].y
				gameSlots[#gameSlots].initR = gameSlots[#gameSlots].rotation
				gameSlots[#gameSlots].origScale = gameSlots[#gameSlots].xScale
				gameSlots[#gameSlots].popScale = gameSlots[#gameSlots].origScale + 0.2
				gameSlots[#gameSlots].id = numberOptions[i]
				gameSlots[#gameSlots].index = #gameSlots
				gameSlots[#gameSlots].alpha = 0
				gameSlots[#gameSlots].inSlot = false
				gameSlots[#gameSlots].selected = false
				gameSlots[#gameSlots].frame = math.random( 1 , 300 )
				gameSlots[#gameSlots].wiggleAnim = { id = "shake", particles = "", duration = 600, anchor = { 0.5, 0.5 }, particleOffset = { 0, 0 } }
				slotsGroup:insert( gameSlots[#gameSlots] )
				
				
				gameSlots[#gameSlots].bg = display.newImageRect("Images/puzzle" .. numberOptions[i] .. ".png", sharkNumbers[numberOption].w, sharkNumbers[numberOption].h )
				gameSlots[#gameSlots].bg.x, gameSlots[#gameSlots].bg.y = gameSlots[#gameSlots].x, gameSlots[#gameSlots].y
				gameSlots[#gameSlots].bg.xScale, gameSlots[#gameSlots].bg.yScale = gameSlots[#gameSlots].xScale, gameSlots[#gameSlots].yScale
				gameSlots[#gameSlots].bg.initAlpha = 0.075
				gameSlots[#gameSlots].bg:setFillColor( 0, 0, 0 )
				gameSlots[#gameSlots].bg.alpha = 0
				
				
				slotsGroup:insert( gameSlots[#gameSlots].bg )
				
				
				
				gameSlots[#gameSlots]:toFront()
				
			end
			
			randomizeTable(numberOptions)
			randomizeTable(numberOptions)
			randomizeTable(numberOptions)
			if (numberOptions[1] == gameSlots[1].id and #numberOptions ~= 1) then
				local randomOption = math.random( 2, #numberOptions)
				numberOptions[1], numberOptions[randomOption] = numberOptions[randomOption], numberOptions[1]
			end
			-- if (#numberOptions == 2 and numberOptions[1] == gameSlots[1].id) then
				-- numberOptions[1], numberOptions[2] = numberOptions[2], numberOptions[1]
			-- else
				-- repeat
					-- randomizeTable(numberOptions)
				-- until numberOptions[1] ~= gameSlots[1].id or #numberOptions == 1 or #numberOptions == 2 and numberOptions[1] == numberOptions[2]
			-- end
			
			for i = 1, #numberOptions do
				
				-- local randomNumPosition = math.random( 1, #gameNumbersPositions[numSlots][randomPosSet][randomNumSet] )
				
				-- local setNumbersScale = gameNumbersPositions[numSlots][randomPosSet][randomNumSet][randomNumPosition][4] * slotNumbers[numberOption].scale
				
				local numberOption = numberOptions[i]
				if (numberOption == 0) then
					numberOption = 11
				end
				
				local setNumbersScale = slotNumbers[numberOption].scale * choiceOptions[#numberOptions][2]
				
				gameNumbers[#gameNumbers+1] = display.newGroup()
				
				local puzzlePiece = display.newImageRect("Images/puzzle" .. numberOptions[i] .. ".png", sharkNumbers[numberOption].w, sharkNumbers[numberOption].h )
				local puzzleShadow = display.newImageRect("Images/puzzle" .. numberOptions[i] .. ".png", sharkNumbers[numberOption].w, sharkNumbers[numberOption].h )
				
				
				puzzleShadow:setFillColor( 0 )
				puzzleShadow.alpha = 0
				puzzleShadow.initAlpha = 0.2
				
				puzzleShadow.x = puzzlePiece.x + 1.5
				puzzleShadow.y = puzzlePiece.y + 5
				
				
				
				gameNumbers[#gameNumbers]:insert( puzzleShadow )
				gameNumbers[#gameNumbers]:insert( puzzlePiece )
				
				
				
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
				
				if (myData.isFireTV or myData.isController) then
				else
					if (#gameNumbers ~= 1) then
						gameNumbers[#gameNumbers].x = gameNumbers[#gameNumbers-1].x + (gameNumbers[#gameNumbers].contentWidth*0.5) + (gameNumbers[#gameNumbers-1].contentWidth*0.5) + choiceOptions[#numberOptions][1]
					end
				end
				
				gameNumbers[#gameNumbers].y = halfH + 20
				
				gameNumbers[#gameNumbers].initScale = gameNumbers[#gameNumbers].xScale
				gameNumbers[#gameNumbers].initX = gameNumbers[#gameNumbers].x
				gameNumbers[#gameNumbers].initY = gameNumbers[#gameNumbers].y
				gameNumbers[#gameNumbers].initR = gameNumbers[#gameNumbers].rotation
				gameNumbers[#gameNumbers].origScale = gameNumbers[#gameNumbers].xScale
				gameNumbers[#gameNumbers].popScale = gameNumbers[#gameNumbers].origScale + 0.2
				gameNumbers[#gameNumbers].id = numberOptions[i]
				gameNumbers[#gameNumbers].index = #gameNumbers
				gameNumbers[#gameNumbers].inSlot = false
				gameNumbers[#gameNumbers].alpha = 0
				gameNumbers[#gameNumbers].frame = 0
				
				gameNumbers[#gameNumbers].isAnAnswer = false
				for k = 1, #gameSlots do
					if (gameSlots[k].id == gameNumbers[#gameNumbers].id) then
						gameNumbers[#gameNumbers].isAnAnswer = true
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
			choicesGroup.x, choicesGroup.y = halfW, halfH + 20
			
			for i = slotsGroup.numChildren, 1, -1 do
				local tempItem = slotsGroup[i]
				local initX, initY = tempItem:localToContent(0,0)
				gameGroup:insert( slotsGroup[i] )
				tempItem.x, tempItem.y = initX, initY
			end
			for i = choicesGroup.numChildren, 1, -1 do
				local tempItem = choicesGroup[i]
				local initX, initY = tempItem:localToContent(0,0)
				gameGroup:insert( choicesGroup[i] )
				tempItem.x, tempItem.y = initX, initY
				
				tempItem.initX = tempItem.x
				tempItem.initY = tempItem.y
			end
			slotsGroup:removeSelf()
			slotsGroup = nil
			choicesGroup:removeSelf()
			choicesGroup = nil
			
			
			for i = #gameNumbers, 1, -1 do
				gameNumbers[i]:toFront()
			end
		
		
			-- gameGroup:insert( slotsGroup )
			-- gameGroup:insert( choicesGroup )
			this:insert( gameGroup )
			
			
			timer.performWithDelay( 1, showPuzzle )
		
		end
		
	end
	setUpPuzzle()
	
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
				Runtime:removeEventListener( "key", puzzleSlotsTap )
			elseif (myData.isFireTV) then
				Runtime:removeEventListener( "onFTVKey", puzzleSlotsTap )
			end
			
			newSlotsPuzzle = nil
			showSlotsPuzzle = nil
			
			for i = #gameNumbers, 1, -1 do
				resetItemAnim( gameNumbers[i] )
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
    if (myData.isFireTV or myData.isController and version.appStore ~= "Chrome") then 
    else
        transition.to( backButton, { time=700, alpha=1, transition=easing.outExpo } )
		transition.to( instructionsReplayButton, { time=700, alpha=1, transition=easing.outExpo } )
    end
    timer.performWithDelay( 550, backButtonTransition )
    
    ----------------------
    return this
end

return M
