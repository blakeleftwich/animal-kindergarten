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
	local tblCards = gameOptions.cards
	-- local equationOptions = gameOptions.equations
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
	local turnOffEndVO = true
	local floaters = {}
	gameSlots = {}
	gameNumbers = {}
	local numberOptions = {}
	
	local startRange, endRange = tblPuzzle.minRand, tblPuzzle.maxRand
	local startNumStartRange, startNumEndRange = tblCards.startRange, tblCards.endRange
	local numSlots = math.random( 2, 4 )
	local incorrectChoices = tblPuzzle.incorrectChoices
	local answerRange = tblCards.answerRange
	local puzzleNum = 0
	local placeMatch = tblQuestion.placeMatch
	
	local puzzleRotationRange = .06 --higher number creates a larger rotation area, .05 is nice and subtle
	local puzzleRotationRate = 35 --higher number takes longer to rotate, 60 is nice and subtle
	
	local fireTVMultiCardOption = false
	if (myData.isFireTV or myData.isController) then 
		if (tblPuzzle.imageSet == "Shapes" or tblPuzzle.imageSet == "ShapesDifficult") then
		else
			fireTVMultiCardOption = true
		end
	end
	
	if (tblPuzzle.imageSet == "Num" or tblPuzzle.imageSet == "NumDifficult" or 
		tblPuzzle.imageSet == "CardsNum" or tblPuzzle.imageSet == "CardsNumDifficult") then
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
			
			until numRepeated == false
		else
			repeat
				puzzleNum = math.random( startRange, endRange )
			until puzzleNum ~= prevSlotNum or endRange-startRange+1 <= 1
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
		
		prevSlotNum = puzzleNum
	elseif (tblPuzzle.imageSet == "CardsEquation") then
		numSlots = 5
	else
		if (tblQuestion.numAnswers == "random") then
			numSlots = math.random( 2, 4 )
		else
			numSlots = tblQuestion.numAnswers
		end
	end
	
	-- if (tblPuzzle.turnOffEndVO) then
		-- turnOffEndVO = tblPuzzle.turnOffEndVO
	-- end
	
	local numToPutInSlots
	local totalNumToPutInSlots
	local blankSpotIndex
	
	if (tblPuzzle.imageSet == "CardsPutInOrder" or tblPuzzle.imageSet == "CardsPutInOrderClassic" or tblPuzzle.imageSet == "CardsPutInOrderClassicDifficult" or tblPuzzle.imageSet == "CardsEquation" and tblPuzzle.minSlotNum == 0 and tblPuzzle.maxSlotNum == 0) then
		numToPutInSlots = numSlots
	else
		numToPutInSlots = 1
	end
	totalNumToPutInSlots = numToPutInSlots
	
	
	-- if (numSlots == 3) then
		-- incorrectChoices = math.random( 0, 1 )
	-- elseif (numSlots == 2) then
		-- incorrectChoices = 2
	-- else
		-- incorrectChoices = math.random( 0, 2 )
	-- end
	
	-- startRange, endRange = 11, 11
	
	local slotOptions, choiceOptions
	local slotYOffset, choiceYOffset
	local slotNumbers, sharkNumbers
	
	
	
	
	if (tblPuzzle.imageSet == "Cards" or tblPuzzle.imageSet == "CardsClassic" or tblPuzzle.imageSet == "CardsPutInOrder" or tblPuzzle.imageSet == "CardsPutInOrderClassic" or tblPuzzle.imageSet == "CardsPutInOrderClassicDifficult" or tblPuzzle.imageSet == "CardsEquation") then
		
		blankSpotIndex = math.random(tblPuzzle.minSlotNum, tblPuzzle.maxSlotNum)
	
		print("blank spot")
		print(blankSpotIndex)
		print(tblPuzzle.minSlotNum)
		print(tblPuzzle.maxSlotNum)
	
		sharkNumbers = {
			-- tScale = teach number scale, cScale = choose number scale
			{ id = 1, w = 88, h = 180, tScale = 1, cScale = 0.45 },
			{ id = 2, w = 136, h = 172, tScale = 1, cScale = 0.45 },
			{ id = 3, w = 128, h = 176, tScale = 1, cScale = 0.45 },
			{ id = 4, w = 164, h = 180, tScale = 1, cScale = 0.45 },
			{ id = 5, w = 136, h = 176, tScale = 1, cScale = 0.45 },
			{ id = 6, w = 160, h = 180, tScale = 1, cScale = 0.45 },
			{ id = 7, w = 148, h = 172, tScale = 1, cScale = 0.45 },
			{ id = 8, w = 156, h = 176, tScale = 1, cScale = 0.45 },
			{ id = 9, w = 160, h = 180, tScale = 1, cScale = 0.45 },
			{ id = 10, w = 268, h = 180, tScale = 0.75, cScale = 0.35 },
			{ id = 11, w = 212, h = 180, tScale = 0.75, cScale = 0.35 },
			{ id = 12, w = 236, h = 180, tScale = 0.75, cScale = 0.35 },
			{ id = 13, w = 224, h = 180, tScale = 0.75, cScale = 0.35 },
			{ id = 14, w = 264, h = 180, tScale = 0.75, cScale = 0.35 },
			{ id = 15, w = 236, h = 180, tScale = 0.75, cScale = 0.35 },
			{ id = 16, w = 260, h = 180, tScale = 0.75, cScale = 0.35 },
			{ id = 17, w = 248, h = 180, tScale = 0.75, cScale = 0.35 },
			{ id = 18, w = 252, h = 180, tScale = 0.75, cScale = 0.35 },
			{ id = 19, w = 260, h = 180, tScale = 0.75, cScale = 0.35 },
			{ id = 20, w = 300, h = 176, tScale = 0.73, cScale = 0.33 },
			{ id = 0, w = 168, h = 180, tScale = 1, cScale = 0.45 },
		
		}
		
		slotNumbers = {
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
			{ id = 10, w = 272, h = 184, scale = 0.5 },
			{ id = 0, w = 168, h = 180, scale = 0.5 },
		
		}
	
	else
	
		sharkNumbers = {
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
	
		slotNumbers = {
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
	
	end
	
	
	if (tblPuzzle.imageSet == "CardsClassic" or tblPuzzle.imageSet == "CardsPutInOrderClassic" or tblPuzzle.imageSet == "CardsPutInOrderClassicDifficult") then
	
		slotYOffset = -85
		choiceYOffset = 38
	
		slotOptions = {
			-- spacing, scale per num slots
			{ 15, 1 },
			{ 20, 1 },
			{ 4, 1.75 },
			{ 5, 1.6},
			{ 5, 1 }, -- was 15
			{ 10, 0.9 },
			{ 10, 0.9 },
			{ 10, 0.9 },
			{ 10, 0.9 },
			{ 10, 0.9 },
		}
		
		if (tblPuzzle.imageSet == "CardsPutInOrderClassic" or tblPuzzle.imageSet == "CardsPutInOrderClassicDifficult") then
			choiceOptions = {
				-- spacing, scale per num choices
				{ -9, 1 },
				{ -9, 1.2 },
				{ -9, 1.2 },
				{ -9, 1.2 },
				{ -9, 1.2 },
				{ -9, 1.2 },
				{ -9, 0.9 },
				{ -9, 0.9 },
				{ -9, 0.9 },
				{ -9, 0.9 },
			}
		else
			choiceOptions = {
				-- spacing, scale per num choices
				{ 10, 1 },
				{ 10, 1.2 },
				{ 10, 1.2 },
				{ 10, 1.2 },
				{ 10, 1.2 },
				{ 10, 1.2 },
				{ 10, 0.9 },
				{ 10, 0.9 },
				{ 10, 0.9 },
				{ 10, 0.9 },
			}
		end
	
	elseif (tblPuzzle.imageSet == "Cards" or tblPuzzle.imageSet == "CardsPutInOrder" or tblPuzzle.imageSet == "CardsPutInOrderClassicDifficult" or tblPuzzle.imageSet == "CardsEquation") then
	
		slotYOffset = -92
		choiceYOffset = 25
	
		slotOptions = {
			-- spacing, scale per num slots
			{ 15, 1 },
			{ 20, 1 },
			{ 4, 1.75 },
			{ 5, 1.6},
			{ 5, 1 }, -- was 15
			{ 10, 0.9 },
			{ 10, 0.9 },
			{ 10, 0.9 },
			{ 10, 0.9 },
			{ 10, 0.9 },
		}
		choiceOptions = {
			-- spacing, scale per num choices
			{ 15, 1 },
			{ 20, 1.33 },
			{ 15, 1.2 },
			{ 10, 1.33 },
			{ 15, 1 },
			{ 10, 0.9 },
			{ 10, 0.9 },
			{ 10, 0.9 },
			{ 10, 0.9 },
			{ 10, 0.9 },
		}
	
	elseif (tblPuzzle.imageSet == "Shapes" or tblPuzzle.imageSet == "ShapesDifficult") then
	
		slotYOffset = -97
		choiceYOffset = 23
	
		slotOptions = {
			-- spacing, scale per num slots
			{ 15, 1 },
			{ 20, 1.33 },
			{ 15, 1.33 },
			{ 10, 1.33 },
			{ 15, 1 },
			{ 10, 0.9 },
			{ 10, 0.9 },
			{ 10, 0.9 },
			{ 10, 0.9 },
			{ 10, 0.9 },
		}
		choiceOptions = {
			-- spacing, scale per num choices
			{ 15, 1 },
			{ 20, 1.33 },
			{ 15, 1.33 },
			{ 10, 1.33 },
			{ 10, 1.33 },
			{ 10, 0.9 },
			{ 10, 0.9 },
			{ 10, 0.9 },
			{ 10, 0.9 },
			{ 10, 0.9 },
		}
	
	elseif (tblPuzzle.imageSet == "Num" or tblPuzzle.imageSet == "NumDifficult" or 
			tblPuzzle.imageSet == "CardsNum" or tblPuzzle.imageSet == "CardsNumDifficult") then
	
		if (tblPuzzle.imageSet == "Num" or tblPuzzle.imageSet == "NumDifficult") then
			slotYOffset = -90 -- Tweak slot Y pos
			choiceYOffset = 30
		elseif (tblPuzzle.imageSet == "CardsNum" or tblPuzzle.imageSet == "CardsNumDifficult") then
			slotYOffset = -85
			choiceYOffset = 37
		end
	
	--tweaked these for build the number game 1/10/2019 -Blake
	
		slotOptions = {
			-- spacing, scale per num slots
			{ 15, 1 },
			{ 26, 1 },
			{ 26, 1 },
			{ 26, 1 },
			{ 15, 1 },
			{ 10, 0.9 },
			{ 10, 0.9 },
			{ 10, 0.9 },
			{ 10, 0.9 },
			{ 10, 0.9 },
		}
		
		if (myData.isFireTV and tblPuzzle.imageSet == "CardsNum" or 
						myData.isController and tblPuzzle.imageSet == "CardsNum" or 
						myData.isFireTV and tblPuzzle.imageSet == "CardsNumDifficult" or 
						myData.isController and tblPuzzle.imageSet == "CardsNumDifficult") then
						
			
			choiceOptions = {
				-- spacing, scale per num choices
				{ -3, 1 },
				{ -3, 1 },
				{ -3, 1 },
				{ -3, 1 },
				{ -3, 1 },
				{ -3, 0.9 },
				{ -3, 0.9 },
				{ 10, 0.9 },
				{ 10, 0.9 },
				{ 10, 0.9 },
			}
		
		else
		
		
			choiceOptions = {
				-- spacing, scale per num choices
				{ 6, 1 },
				{ 6, 1 },
				{ 6, 1 },
				{ 6, 1 },
				{ 6, 1 },
				{ 10, 0.9 },
				{ 10, 0.9 },
				{ 10, 0.9 },
				{ 10, 0.9 },
				{ 10, 0.9 },
			}
		end
		
	else
	
		slotYOffset = -90 + 10
		choiceYOffset = 20 + 10
	
	--tweaked these for build the number game 1/10/2019 -Blake
	
		slotOptions = {
			-- spacing, scale per num slots
			{ 15, 1 },
			{ 26, 1 },
			{ 26, 1 },
			{ 26, 1 },
			{ 15, 1 },
			{ 10, 0.9 },
			{ 10, 0.9 },
			{ 10, 0.9 },
			{ 10, 0.9 },
			{ 10, 0.9 },
		}
		choiceOptions = {
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
	
	end
	
	local rewardAnims = { 
		{ id = "shake", particles = "", duration = 4000, anchor = { 0.5, 0.5 }, particleOffset = { 0, 0 } }, 
		{ id = "spin", particles = "", duration = 700, anchor = { 0.5, 0.5 }, particleOffset = { 0, 0 } },
		{ id = "balloon", particles = "", duration = 4000, anchor = { 0.5, 0.5 }, particleOffset = { 0, 0 } },
		-- { id = "float", particles = "", duration = 4000, anchor = { 0.5, 0.5 }, particleOffset = { 0, 0 } },
	}
	
	
	
	
	if (tblPuzzle.imageSet == "Cards" or tblPuzzle.imageSet == "CardsClassic" or tblPuzzle.imageSet == "CardsPutInOrder" or tblPuzzle.imageSet == "CardsPutInOrderClassic" or tblPuzzle.imageSet == "CardsPutInOrderClassicDifficult") then
	
		local randomNumbersTable = {}
		local startingNum = tblQuestion.startNum
		local skipIncrement = tblQuestion.skipPattern
		local sequenceSkip = tblQuestion.skip
		local sequenceOrder = tblQuestion.order
		
		slotsSkipAmount = 1
		
		if (tblQuestion.skip == "random") then
			
			local randomSkip = math.random(1, 3)
			
			if (randomSkip == 1) then
				slotsSkipAmount = 2
			elseif (randomSkip == 2) then
				slotsSkipAmount = 5
			else
				slotsSkipAmount = 10
			end
			
			sequenceSkip = slotsSkipAmount
			
			placeMatch = sequenceSkip
		end
		
		
		if (startingNum == "") then
			repeat
				startingNum = math.random( startNumStartRange, startNumEndRange )
			until tblQuestion.skip == "none" or
					tblQuestion.skip ~= "random" and tblQuestion.skip == 1 or
					tblQuestion.skip ~= "random" and tblQuestion.skip > 1 and placeMatch == 0 or
					tblQuestion.skip ~= "random" and tblQuestion.skip > 1 and placeMatch ~= 0 and startingNum % placeMatch == 0 or
					tblQuestion.skip == "random" and startingNum % sequenceSkip == 0
		end
		
		
		numberOptions[#numberOptions+1] = startingNum
		
		print("test 2")
	
		
		for i = 1, numSlots-1 do
			
			if (tblQuestion.skip == "none") then
				sequenceSkip = math.random(1, 20)
			end
			
			if (sequenceOrder == "ascending") then
				numberOptions[#numberOptions+1] = numberOptions[#numberOptions] + sequenceSkip
			else
				numberOptions[#numberOptions+1] = numberOptions[#numberOptions] - sequenceSkip
			end
			
			if (skipIncrement == "+") then
				sequenceSkip = sequenceSkip + 1
			end
			
		end
	
	elseif (tblPuzzle.imageSet == "Shapes" or tblPuzzle.imageSet == "ShapesDifficult") then
	
	
		for i = 1, numSlots do
		
			local repeated = false
			local randomNum = 1
		
		
			repeat
				repeated = false
				
				if (tblPuzzle.number ~= "random") then
					randomNum = tblPuzzle.number[i]
				elseif (endRange-startRange+1 >= numSlots and endRange <= #shapeSets) then
					randomNum = math.random(startRange, endRange)
					print("start end range")
				elseif (#shapeSets-startRange >= numSlots) then
					randomNum = math.random(startRange, #shapeSets)
					print("start end range 2")
				else
					randomNum = math.random(1, #shapeSets)
					print("start end range 3")
				end
				
				for k = #numberOptions, 1, -1 do
					if (numberOptions[k] == randomNum) then
						repeated = true
					end
				end
			until repeated == false
			
			numberOptions[#numberOptions+1] = randomNum
		
		end
		
	
	
	elseif (tblPuzzle.imageSet == "Num" or tblPuzzle.imageSet == "NumDifficult" or 
			tblPuzzle.imageSet == "CardsNum" or tblPuzzle.imageSet == "CardsNumDifficult") then
		
		for i = 1, string.len(tostring(puzzleNum)) do
			numberOptions[#numberOptions+1] = tonumber(tostring(puzzleNum):sub( i, i ))
		end
	
	
	elseif (tblPuzzle.imageSet == "CardsEquation") then
	
	
		local firstNum, secondNum, answerNum
		
		repeat
			answerNum = math.random(startNumStartRange, startNumEndRange)
		until prevSlotsEquationAnswer ~= answerNum and answerNum > 2
		
		prevSlotsEquationAnswer = answerNum
		
		
		repeat
			firstNum = math.random(1, answerNum - 1)
		until firstNum >= math.floor(answerNum/2.8) and firstNum <= math.floor(answerNum/1.2) or 
					answerNum < 20
		
		
		secondNum = answerNum - firstNum
		
		if (equationSign == "-") then
			answerNum, firstNum = firstNum, answerNum
		end
		
		
		numberOptions[#numberOptions+1] = firstNum
		numberOptions[#numberOptions+1] = equationSign
		numberOptions[#numberOptions+1] = secondNum
		numberOptions[#numberOptions+1] = "="
		numberOptions[#numberOptions+1] = answerNum
		
		print("equation nums")
		print(firstNum)
		print(secondNum)
		print(answerNum)
		
		
	else
	
		local randomNumbersTable = {}
		for i = startRange, endRange do
			randomNumbersTable[#randomNumbersTable+1] = i
		end
		-- randomizeTable( randomNumbersTable )
		-- randomizeTable( randomNumbersTable )
	
		for i = 1, numSlots do
			
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
	
	
	for i = 1, incorrectChoices do
	
	
		if (tblPuzzle.imageSet == "CardsPutInOrder" or tblPuzzle.imageSet == "CardsPutInOrderClassic" or tblPuzzle.imageSet == "CardsPutInOrderClassicDifficult") then
		
			local numChoice
			local numberRepeated = false
			repeat
				numberRepeated = false
				
				numChoice = math.random( 1, 1000 )
				
				for k = #numberOptions, 1, -1 do
					if (numChoice == numberOptions[k]) then
						numberRepeated = true
					end
				end
				
			until numberRepeated == false and numChoice <= numberOptions[1] + answerRange and
														numChoice >= numberOptions[1] - answerRange
		
		
			
			numberOptions[#numberOptions+1] = numChoice
		
		
		elseif (tblPuzzle.imageSet == "CardsEquation" or tblPuzzle.imageSet == "CardsClassic") then
		
			local numChoice
			local numberRepeated = false
			
			print("test 3")
			
			if (type(numberOptions[blankSpotIndex]) ~= "string") then
			
				print("test 4")
				print(numberOptions[blankSpotIndex])
				print(answerRange)
			
				repeat
					numberRepeated = false
					
					numChoice = math.random( 1, 1000 )
					
					for k = #numberOptions, 1, -1 do
						if (numChoice == numberOptions[k]) then
							numberRepeated = true
						end
					end
					
				until numberRepeated == false and placeMatch == 0 and 
															numChoice <= numberOptions[blankSpotIndex] + answerRange and
															numChoice >= numberOptions[blankSpotIndex] - answerRange or
					numberRepeated == false and placeMatch ~= 0 and numChoice % placeMatch == 0 and
															numChoice <= numberOptions[blankSpotIndex] + (answerRange * placeMatch) and
															numChoice >= numberOptions[blankSpotIndex] - (answerRange * placeMatch)
			
			
				
				numberOptions[#numberOptions+1] = numChoice
			
			else
			
				print("test 5")
			
				repeat
					numberRepeated = false
					
					numChoice = math.random( 1, 4 )
					
					if (numChoice == 1) then
						numChoice = "="
					elseif (numChoice == 2) then
						numChoice = "+"
					else
						numChoice = "-"
					end
					
					for k = #numberOptions, numSlots, -1 do
						if (numChoice == numberOptions[k] or numChoice == numberOptions[blankSpotIndex]) then
							numberRepeated = true
						end
					end
					
				until numberRepeated == false
			
				numberOptions[#numberOptions+1] = numChoice
			
			end
			
			print("test 6")
		
		elseif (tblPuzzle.imageSet == "Num" or tblPuzzle.imageSet == "NumDifficult"  or 
			tblPuzzle.imageSet == "CardsNum" or tblPuzzle.imageSet == "CardsNumDifficult") then
	
	
			-- local randomNumbersTable = {}
			-- if (endRange - startRange + 1 <= numSlots) then
				-- for i = startRange-1, endRange+1 do
					-- if (i > 0 and i < 11) then
						-- randomNumbersTable[#randomNumbersTable+1] = i
					-- end
				-- end
			-- else
				-- for i = startRange, endRange do
					-- if (i > 0 and i < 11) then
						-- randomNumbersTable[#randomNumbersTable+1] = i
					-- end
				-- end
			-- end
			-- randomizeTable( randomNumbersTable )
			-- randomizeTable( randomNumbersTable )
			
			-- numberOptions[#numberOptions+1] = randomNumbersTable[i]
			
			local numChoice
			local numberRepeated = false
			repeat
				numberRepeated = false
				
				numChoice = math.random( 1, 10 )
				
				for k = #numberOptions, 1, -1 do
					if (numChoice == numberOptions[k]) then
						numberRepeated = true
					end
				end
				
			until numberRepeated == false and numChoice > 0 and numChoice < 10
		
		
			
			numberOptions[#numberOptions+1] = numChoice
		
		else
		
			print("test 3")
			print(startRange)
			print(endRange)
			print(tblPuzzle.imageSet)
			print(#numberOptions)
		
			local numChoice
			local numberRepeated = false
			repeat
				numberRepeated = false
				
				
				if (tblPuzzle.imageSet == "Cards" or tblPuzzle.imageSet == "CardsClassic") then
					
					numChoice = math.random( numberOptions[numSlots], numberOptions[numSlots] + incorrectChoices ) --tblCards
					
					if (numChoice == numberOptions[1]) then
						numberRepeated = true
					end
					for k = #numberOptions, #numberOptions-incorrectChoices, -1 do
						if (numChoice == numberOptions[k]) then
							numberRepeated = true
						end
					end
				else
				
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
				end
				
			until tblPuzzle.imageSet ~= "Cards" and numberRepeated == false and numChoice > 0 and numChoice < 10 or
					tblPuzzle.imageSet == "Cards" and numberRepeated == false and numChoice > 0 and numChoice < 21 or
					tblPuzzle.imageSet == "CardsClassic" and numberRepeated == false and numChoice > 0
		
			print("test 4")
			
			numberOptions[#numberOptions+1] = numChoice
		
		end
		
		
		
	end
	
	
	
	
	
	function readPuzzleSlotsVO()
	
		if savedData.enableSounds == true then
		
		
			if (tblPuzzle.imageSet == "Cards" or tblPuzzle.imageSet == "CardsClassic") then
		
		
				if (tblQuestion.questionType1 == "What comes next?") then
					playReservedChannel( whatComesNextSound[1], 28, 0 )
				elseif (tblQuestion.questionType1 == "What's missing?") then
					playReservedChannel( whatsMissingSound[1], 28, 0 )
				else
					if (blankSpotIndex == numSlots) then
						playReservedChannel( whatComesNextSound[1], 28, 0 )
					else
						playReservedChannel( whatsMissingSound[1], 28, 0 )
					end
				end
		
			elseif (tblPuzzle.imageSet == "CardsPutInOrder" or tblPuzzle.imageSet == "CardsPutInOrderClassic" or tblPuzzle.imageSet == "CardsPutInOrderClassicDifficult") then
			
				playReservedChannel( putTheNumbersInOrder, 28, 0 )
			
			elseif(tblPuzzle.imageSet == "CardsEquation") then
			
				playReservedChannel( buildTheEquation, 28, 0 )
		
			elseif (tblPuzzle.imageSet == "Shapes" or tblPuzzle.imageSet == "ShapesDifficult") then
		
				local randomSound = math.random( 1, 2 )
				if (randomSound == 1) then
					playReservedChannel( canYouPutShapesBack, 28, 0 )
				else
					playReservedChannel( putTheShapesBack, 28, 0 )
				end
		
			elseif (tblPuzzle.imageSet == "Num" or tblPuzzle.imageSet == "NumDifficult" or 
					tblPuzzle.imageSet == "CardsNum" or tblPuzzle.imageSet == "CardsNumDifficult") then
				
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
					
						if (puzzleNum <= 100) then
							playReservedChannel( gameNumSounds[puzzleNum], 29, 0 )
						else
							local function partFiveAudio()
								local numTemp
								if (puzzleNum < 110) then
									numTemp = tonumber( tostring(puzzleNum):sub(3, 3) )
								else
									numTemp = tonumber( tostring(puzzleNum):sub(2, 3) )
								end
								playReservedChannel(gameNumSounds[ numTemp ], 28, 0)
							end
						
							playReservedChannel(hundredSounds[ tonumber(tostring(puzzleNum):sub(1, 1)) ], 29, 0)
						
						
							if (questionAudioTimer) then
								timer.cancel( questionAudioTimer )
								questionAudioTimer = nil
							end
							questionAudioTimer = timer.performWithDelay( 900, partFiveAudio )
								
						end
						
					end
					timerNumVO = timer.performWithDelay( 1100, buildNumVO )
				
				-- end
				
			else
			
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
		end
	
	end
	
	---------------------------------------    
    -- update function
    ---------------------------------------  
	function this.enterFrame(e)
	
		if (currentItem and currentItem ~= 0) then
			if (tblPuzzle.imageSet == "CardsNum" or tblPuzzle.imageSet == "CardsNumDifficult" or tblPuzzle.imageSet == "CardsPutInOrder" or tblPuzzle.imageSet == "CardsPutInOrderClassic" or tblPuzzle.imageSet == "CardsPutInOrderClassicDifficult") then
				currentItem.x = currentItemX
				currentItem.y = currentItemY
			else
			
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
		end
			
		if (floaters) then
			for k = #floaters, 1, -1 do
			
				for i = 1, #gameNumbers do
				
					if (floaters[k] == gameNumbers[i].index and gameNumbers[i].isDragging == false) then
						gameNumbers[i].frame = gameNumbers[i].frame + 1
						gameNumbers[i].y =  gameNumbers[i].initY + 1.5 * math.sin(gameNumbers[i].frame/25)
						gameNumbers[i].rotation = gameNumbers[i].rotation + puzzleRotationRange * math.cos(gameNumbers[i].frame/puzzleRotationRate)
					end
					
				end
				
			end
		end
		
		if (showSlotBG == true and myData.isFireTV or showSlotBG == true and myData.isController) then 
			
			for i = 1, #gameSlots do
			
				if (gameSlots[i].bg) then
					if (gameSlots[i] == gameSlots[currentCardSelected] and currentSelected == "slots") then
						gameSlots[i].bg:setFillColor( 0 )
						gameSlots[i].bg.alpha = gameSlots[i].bg.initAlpha + (0.125 * cursor.alpha)
					else
						gameSlots[i].bg:setFillColor( 0, 0, 0 )
						gameSlots[i].bg.alpha = gameSlots[i].bg.initAlpha
					end
					
					if (tblPuzzle.imageSet == "CardsNum" or tblPuzzle.imageSet == "CardsNumDifficult" or tblPuzzle.imageSet == "CardsPutInOrderClassic" or tblPuzzle.imageSet == "CardsPutInOrderClassicDifficult") then
						gameSlots[i].bg:toBack()
					end
				end
			
				-- if (cursor.alpha > 0) then
					
				-- end
			end
		end
	
	
		for i = 1, #gameNumbers do
		
			if (gameNumbers[i].shadow) then
				gameNumbers[i].shadow.xScale = gameNumbers[i].xScale
				gameNumbers[i].shadow.yScale = gameNumbers[i].yScale
			
				gameNumbers[i].shadow.x = gameNumbers[i].x + shadowOffsetX
				gameNumbers[i].shadow.y = gameNumbers[i].y + shadowOffsetY
				
			end
		
		end
	
	end
    
	local function startWindAnim()
	
		print("start wind anim slots puzzle")
		
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
		
		if (currentItem.scaleTrans) then
			transition.cancel( currentItem.scaleTrans )
			currentItem.scaleTrans = nil
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
		
		numToPutInSlots = numToPutInSlots - 1
		currentCount = currentCount + 1
		
		if (tblPuzzle.imageSet == "Cards" and currentItem.shadowImg) then
			currentItem.shadowImg.alpha = 0
		end
		
		
		local function finishTransToSlot()
			
			if (tblPuzzle.imageSet ~= "CardsClassic" and tblPuzzle.imageSet ~= "CardsNum" and tblPuzzle.imageSet ~= "CardsNumDifficult" and tblPuzzle.imageSet ~= "CardsPutInOrder" and tblPuzzle.imageSet ~= "CardsPutInOrderClassic" and tblPuzzle.imageSet ~= "CardsPutInOrderClassicDifficult" and tblPuzzle.imageSet ~= "CardsEquation") then
				currentItem[1].alpha = 0
			end
			
			-- slotsGroup:insert( currentItem )
			-- currentItem.x = currentItem.x + (choicesGroup.x - slotsGroup.x)
			-- currentItem.y = currentItem.y + (choicesGroup.y - slotsGroup.y)
			
			
			-- transition.to( currentItem, { delay = 0, time=50 , x = currentSlot.x - (choicesGroup.x - slotsGroup.x), y = currentSlot.y - (choicesGroup.y - slotsGroup.y), xScale = currentSlot.xScale, yScale = currentSlot.yScale, rotation = currentSlot.rotation, transition=easing.inExpo } )
			
			-- if (myData.isFireTV or myData.isController) then 
			
			
			
			if (tblPuzzle.imageSet ~= "Cards" and tblPuzzle.imageSet ~= "CardsClassic" and tblPuzzle.imageSet ~= "CardsPutInOrder" and tblPuzzle.imageSet ~= "CardsPutInOrderClassic" and tblPuzzle.imageSet ~= "CardsPutInOrderClassicDifficult" and tblPuzzle.imageSet ~= "CardsEquation") then
				currentItem.origScale = currentSlot.xScale
			else
				
				-- currentItem.origScale = currentItem.initScale
			end
			
			local function finishPoppingOnSlot()
				if (tblPuzzle.imageSet == "CardsPutInOrder" or tblPuzzle.imageSet == "CardsClassic") then
					currentSlot:insert(currentItem)
					
					currentItem.x = 0
					currentItem.y = 0
				end
			end
			
			
			transition.to( currentItem, { delay = 50, time=50 , xScale = currentItem.popScale, yScale = currentItem.popScale, transition=easing.inExpo } )
			transition.to( currentItem, { delay = 100, time=50 , xScale = currentItem.origScale, yScale = currentItem.origScale, transition=easing.outExpo, onComplete = finishPoppingOnSlot} )

			
			-- currentSlot:removeEventListener("touch", numberTouched)
			currentSlot:toFront()
			
			
			if (tblPuzzle.imageSet ~= "Cards" and tblPuzzle.imageSet ~= "CardsClassic" and tblPuzzle.imageSet ~= "CardsEquation" and tblPuzzle.imageSet ~= "CardsPutInOrder" and tblPuzzle.imageSet ~= "CardsPutInOrderClassic" and tblPuzzle.imageSet ~= "CardsPutInOrderClassicDifficult") then
				transition.to( currentSlot, { delay = 50, time=50 , alpha = 0, transition=easing.outExpo } )
				transition.to( currentSlot.bg, { delay = 50, time=50 , alpha = 0, transition=easing.outExpo } )
			else
				if (tblPuzzle.imageSet == "CardsClassic" or tblPuzzle.imageSet == "CardsEquation" or tblPuzzle.imageSet == "CardsPutInOrderClassic" or tblPuzzle.imageSet == "CardsPutInOrderClassicDifficult") then
					transition.to( currentSlot[1], { delay = 50, time=50 , alpha = 0, transition=easing.outExpo } )
					transition.to( currentSlot.bg, { delay = 50, time=50 , alpha = 0, transition=easing.outExpo } )
				end
			
				currentItem:toFront()
			end
			
			
			local slotX, slotY = currentSlot:localToContent(0, 0)
			
			Particles:newEmitter(explosions,"fireworks", "Images/starParticle.png", 32, 32, 10, slotX, slotY, -4, 4, -16, 6, 252,234,27)--altRgb[1], altRgb[2], altRgb[3])
			explosions:toFront()
			
			if savedData.enableSounds == true then
				playReservedChannel(popSounds[math.random(1,3)], currentPopChannel, 0)
			end
			currentPopChannel = currentPopChannel + 1
			if currentPopChannel > 26 then
				currentPopChannel = 27
			end
			
			if savedData.enableSounds == true then
			
				local tempSayOver100 = false
				
				-- for i = #gameNumbers, 1, -1 do
					-- if (type(gameNumbers[i].id) ~= "string" and gameNumbers[i].id >= 100) then
						-- tempSayOver100 = true
					-- end
				-- end
				
				
				
				if (tblPuzzle.imageSet == "Num" or tblPuzzle.imageSet == "NumDifficult" or 
					tblPuzzle.imageSet == "CardsNum" or tblPuzzle.imageSet == "CardsNumDifficult") then
			
					local tempCurrentItemID = currentItem.id
					
					
					local function partFiveAudio()
					
						if (puzzleNum > 99 and currentSlot.index == 1) then
						
							if (tonumber( tostring(tempCurrentItemID):sub(1, 1)) == 1) then
								playReservedChannel(gameSounds.hundredPlace, 28, 0)
							else
								playReservedChannel(gameSounds.hundredsPlace, 28, 0)
							end
						elseif (puzzleNum > 9 and puzzleNum < 100 and currentSlot.index == 1 or
								puzzleNum > 99 and currentSlot.index == 2) then
							
							if (tonumber( tostring(tempCurrentItemID):sub(1, 1)) == 1) then
								playReservedChannel(gameSounds.tenPlace, 28, 0)
							else
								playReservedChannel(gameSounds.tensPlace, 28, 0)
							end
						else
							if (tonumber( tostring(tempCurrentItemID):sub(1, 1)) == 1) then
								playReservedChannel(gameSounds.onePlace, 28, 0)
							else
								playReservedChannel(gameSounds.onesPlace, 28, 0)
							end
						end
					end
				
					if (currentItem.id == 0) then
						playReservedChannel( gameSounds.zero, currentGameChannel, 0 )
					else
						playReservedChannel(gameNumSounds[tempCurrentItemID], 29, 0)
					end
				
				
					if (questionAudioTimer) then
						timer.cancel( questionAudioTimer )
						questionAudioTimer = nil
					end
					
					-- Tweak time between number and its place value
					questionAudioTimer = timer.performWithDelay( 700, partFiveAudio )
					
					
				
					
			
				elseif (tblPuzzle.imageSet == "Shapes" or tblPuzzle.imageSet == "ShapesDifficult") then
					playReservedChannel( gameSounds[shapeSets[currentItem.id].VO], currentGameChannel, 0 )
				elseif (tblPuzzle.imageSet == "Num" and currentItem.id == 0 or 
						tblPuzzle.imageSet == "NumDifficult" and currentItem.id == 0 or 
						tblPuzzle.imageSet == "CardsNum" and currentItem.id == 0 or 
						tblPuzzle.imageSet == "CardsNumDifficult" and currentItem.id == 0) then
					playReservedChannel( gameSounds.zero, currentGameChannel, 0 )
				else
				
					if (type(currentItem.id) == "string") then
					
						if (tostring(currentItem.id) == "=") then
							playReservedChannel( gameSounds["equal"], 29, 0 )
						elseif (tostring(currentItem.id) == "+") then
							playReservedChannel( gameSounds["plus"], 29, 0 )
						elseif (tostring(currentItem.id) == "-") then
							playReservedChannel( gameSounds["minus"], 29, 0 )
						else
							playReservedChannel( gameSounds[currentItem.id], 29, 0 )
						end
					
					elseif (tempSayOver100 == true) then
					
						-- local overHundredSound
						-- repeat
							-- overHundredSound = math.random( 1, #overHundredSounds )
						-- until prevOverHundredSound ~= overHundredSound
						-- prevOverHundredSound = overHundredSound
					
						-- playReservedChannel(overHundredSounds[ overHundredSound ], 29, 0)
						
					elseif (currentItem.id <= 100) then
						playReservedChannel( gameNumSounds[currentItem.id], 29, 0 )
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
			
			local function numbersAnim()
			
				for i = #gameSlots, 1, -1 do
					if (gameSlots[i].bg) then
						gameSlots[i].bg:removeSelf()
						gameSlots[i].bg = nil
					end
				end
				
				if (tblPuzzle.imageSet ~= "CardsClassic" and tblPuzzle.imageSet ~= "CardsNum" and tblPuzzle.imageSet ~= "CardsNumDifficult" and tblPuzzle.imageSet ~= "CardsPutInOrder" and tblPuzzle.imageSet ~= "CardsPutInOrderClassic" and tblPuzzle.imageSet ~= "CardsPutInOrderClassicDifficult" and tblPuzzle.imageSet ~= "CardsEquation") then
				
					for i = #gameNumbers, 1, -1 do
						gameNumbers[i][1]:removeSelf()
						gameNumbers[i][1] = nil
					end
				end
			
				-- if savedData.enableSounds == true then
					-- playReservedChannel(shortClapSound, currOtherMainChannel, 0)
					-- currOtherMainChannel = currOtherMainChannel + 1
					-- if (currOtherMainChannel > 17) then
						-- currOtherMainChannel = 15
					-- end
				-- end
			
				if (tblPuzzle.imageSet == "Num" or tblPuzzle.imageSet == "NumDifficult" or 
					tblPuzzle.imageSet == "CardsNum" or tblPuzzle.imageSet == "CardsNumDifficult") then
					
					isPutNumTogetherFirstPlay = false
				else
					isPutNumOrderFirstPlay = false
				end
			
				-- local randomRewardVO = math.random( 1, #randomRewardSounds )
				
				-- playReservedChannel( gameSounds[randomRewardSounds[randomRewardVO]], sAudio.gameReward.c, sAudio.gameReward.l, "sound" )
		
				if savedData.enableSounds == true then
					if (tblPuzzle.imageSet == "Num" or 
							tblPuzzle.imageSet == "NumDifficult" or 
							tblPuzzle.imageSet == "CardsNum" or 
							tblPuzzle.imageSet == "CardsNumDifficult") then
						
						-- playReservedChannel( gameNumSounds[puzzleNum], currentGameChannel, 0 )
						
						if (puzzleNum <= 100) then
							playReservedChannel( gameNumSounds[puzzleNum], currentGameChannel, 0 )
						else
							local function partFiveAudio()
								local numTemp
								if (puzzleNum < 110) then
									numTemp = tonumber( tostring(puzzleNum):sub(3, 3) )
								else
									numTemp = tonumber( tostring(puzzleNum):sub(2, 3) )
								end
								playReservedChannel(gameNumSounds[ numTemp ], 28, 0)
							end
						
							playReservedChannel(hundredSounds[ tonumber(tostring(puzzleNum):sub(1, 1)) ], currentGameChannel, 0)
						
						
							if (questionAudioTimer) then
								timer.cancel( questionAudioTimer )
								questionAudioTimer = nil
							end
							questionAudioTimer = timer.performWithDelay( 900, partFiveAudio )
							
						end
					-- else
						-- playReservedChannel( gameNumSounds[currentItem.id], currentGameChannel, 0 )
					end
					currentGameChannel = currentGameChannel + 1
					if (currentGameChannel > 25) then
						currentGameChannel = 20
					end
				end
				
				
				
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
					
					-- for k = 1, #gameNumbers do
						-- gameGroup:insert(gameNumbers[k])
					-- end
					
					for k = 1, #gameNumbers do
						transition.to( gameNumbers[k], { time=700, alpha=0, transition=easing.outExpo } )
					end
					
					transition.to( gameGroup, { time=700, alpha=0, transition=easing.outExpo } )
					
					local function hideQuestion()
						for k = 1, #gameNumbers do
							gameGroup:insert(gameNumbers[k])
						end
					
						questionText.alpha = 0
						questionTextTwo.alpha = 0
					end
					transition.to( questionText, { time=700, alpha = 0, transition=easing.outExpo, onComplete = hideQuestion } )
					transition.to( questionTextTwo, { time=700, alpha = 0, transition=easing.outExpo } )
					
					timer.performWithDelay( 0, goodJobSequence )
				end
				
		
				
				if (tblPuzzle.imageSet == "Cards" and turnOffEndVO ~= true or tblPuzzle.imageSet == "CardsClassic" and turnOffEndVO ~= true) then
				
					local function readNumbersInOrder()
					
						local readNums
						
						if (tblPuzzle.imageSet == "Cards") then
							readNums = #gameSlots-1
						else
							readNums = #gameSlots
						end
					
						for m = 1, readNums do
						
							local function scaleGameImageBack( obj )
							
								transition.to( obj, { time=100 , xScale = obj.initScale, yScale = obj.initScale, transition=easing.outExpo} )
						
								if savedData.enableSounds == true then
									if (tblPuzzle.imageSet ~= "Num" and tblPuzzle.imageSet ~= "NumDifficult" and 
										tblPuzzle.imageSet ~= "CardsNum" and tblPuzzle.imageSet ~= "CardsNumDifficult" or
											m == #gameSlots-1) then
										playReservedChannel(popSounds[math.random(1,3)], currentPopChannel, 0)
									end
								end
								currentPopChannel = currentPopChannel + 1
								if currentPopChannel > 26 then
									currentPopChannel = 27
								end
								
								if savedData.enableSounds == true then
									
									if (obj.id <= 100) then
										playReservedChannel( gameNumSounds[obj.id], 29, 0 )
									else
										local function partFiveAudio()
											local numTemp
											if (obj.id < 110) then
												numTemp = tonumber( tostring(obj.id):sub(3, 3) )
											else
												numTemp = tonumber( tostring(obj.id):sub(2, 3) )
											end
											playReservedChannel(gameNumSounds[ numTemp ], 28, 0)
										end
									
										playReservedChannel(hundredSounds[ tonumber(tostring(obj.id):sub(1, 1)) ], 29, 0)
									
									
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
								
							
							end
						
							local function playRewardAnim()
						
								
								local randomRewardVO = math.random( 1, #randomRewardSounds )
				
				
								if savedData.enableSounds == true then
									playReservedChannel( gameSounds[randomRewardSounds[randomRewardVO]], currentGameChannel, 0 )
									currentGameChannel = currentGameChannel + 1
									if (currentGameChannel > 25) then
										currentGameChannel = 20
									end
								end
								-- playReservedChannel( gameSounds[randomRewardSounds[randomRewardVO]], sAudio.gameReward.c, sAudio.gameReward.l, "sound" )
					
								local tempNumGameSlots = #gameSlots-1
								
								if (tblPuzzle.imageSet == "CardsClassic") then
									tempNumGameSlots = #gameSlots
								end
							
								for k = tempNumGameSlots, 1, -1 do
									
									gameSlots[k].initX = gameSlots[k].x
									gameSlots[k].initY = gameSlots[k].y
									gameSlots[k].initR = gameSlots[k].rotation
									gameSlots[k].initScale = gameSlots[k].xScale
									gameSlots[k].origX = gameSlots[k].x
									gameSlots[k].origY = gameSlots[k].y
								
									gameSlots[k].animationInfo = gameSlots[k].finishAnim
									
									if (gameSlots[k].animation) then
									else
										animateStart( gameSlots[k] )
									end
								end
								
								
								
								rewardTimer = timer.performWithDelay( 1200, hideGameScreen )
							
							end
						
						
							if (tblPuzzle.imageSet == "Cards" or tblPuzzle.imageSet == "CardsClassic") then
								if (gameSlots[m].id >= 100 or gameSlots[1].id >= 100) then
									transition.to( gameSlots[m], { delay = 0 + (m * 2000), time=100 , alpha = 1, xScale = gameSlots[m].initScale+0.4, yScale = gameSlots[m].initScale+0.4, transition=easing.inExpo, onComplete = scaleGameImageBack} )
								elseif (gameSlots[m].id > 20 or gameSlots[1].id > 20) then
									transition.to( gameSlots[m], { delay = 0 + (m * 1000), time=100 , alpha = 1, xScale = gameSlots[m].initScale+0.4, yScale = gameSlots[m].initScale+0.4, transition=easing.inExpo, onComplete = scaleGameImageBack} )
								else
									transition.to( gameSlots[m], { delay = 0 + (m * 700), time=100 , alpha = 1, xScale = gameSlots[m].initScale+0.4, yScale = gameSlots[m].initScale+0.4, transition=easing.inExpo, onComplete = scaleGameImageBack} )
								end
							else
							
								for i = 1, #gameNumbers do
								
								
									if (gameNumbers[i].id == gameSlots[m].id) then
							
										-- if (gameSlots[m].id >= 100) then
											-- transition.to( gameNumbers[i], { delay = 800 + ((m-1) * 2000), time=100 , alpha = 1, xScale = gameNumbers[i].initScale+0.4, yScale = gameNumbers[i].initScale+0.4, transition=easing.inExpo, onComplete = scaleGameImageBack} )
										-- elseif (gameSlots[m].id >= 10) then
											-- transition.to( gameNumbers[i], { delay = 0 + ((m-1) * 1200), time=100 , alpha = 1, xScale = gameNumbers[i].initScale+0.4, yScale = gameNumbers[i].initScale+0.4, transition=easing.inExpo, onComplete = scaleGameImageBack} )
										-- else
											transition.to( gameNumbers[i], { delay = 0 + (m * 700), time=100 , alpha = 1, xScale = gameNumbers[i].initScale+0.4, yScale = gameNumbers[i].initScale+0.4, transition=easing.inExpo, onComplete = scaleGameImageBack} )
										-- end
									end
								end
								
							end
						
							if (m == readNums) then
								-- if (m == #gameSlots-1) then
									if (gameSlots[m].id >= 100 or gameSlots[1].id >= 100) then
										timer.performWithDelay(0 + (m * 2000) + 1000, playRewardAnim) --3000
									elseif (gameSlots[m].id > 20 or gameSlots[1].id > 20) then
										timer.performWithDelay(0 + (m * 1200) + 1000, playRewardAnim) --2000
									else
										timer.performWithDelay(0 + (m * 700) + 1000, playRewardAnim)
									end
								-- end
							end
						
						end
					
					end
				
					print("slots num")
					print(#gameSlots)
					if (#gameSlots == 5 or #gameSlots == 6) then
						transition.to( slotsGroup, { delay = 100, time=100, xScale = 1.08, yScale = 1.08, x = halfW, y = halfH - 45 } )
					else
						transition.to( slotsGroup, { delay = 100, time=100, xScale = 1.3, yScale = 1.3, x = halfW, y = halfH - 45 } )
					end
				
					timer.performWithDelay( 200, readNumbersInOrder )
				
				elseif (tblPuzzle.imageSet == "Num" or tblPuzzle.imageSet == "NumDifficult" or 
						tblPuzzle.imageSet == "CardsNum" or tblPuzzle.imageSet == "CardsNumDifficult") then
				
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
					
					
					local randomRewardVO = math.random( 1, #randomRewardSounds )
				
				
					if savedData.enableSounds == true then
						-- if (tblPuzzle.imageSet ~= "CardsNum" and
								-- tblPuzzle.imageSet ~= "CardsNumDifficult") then
							
							-- playReservedChannel( gameSounds[randomRewardSounds[randomRewardVO]], currentGameChannel, 0 )
							-- currentGameChannel = currentGameChannel + 1
							-- if (currentGameChannel > 25) then
								-- currentGameChannel = 20
							-- end
						-- end
					end
					
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
							currentGameChannel = 20
						end
					end
					-- playReservedChannel( gameSounds[randomRewardSounds[randomRewardVO]], sAudio.gameReward.c, sAudio.gameReward.l, "sound" )
		
				
					if (tblPuzzle.imageSet == "CardsPutInOrder") then
					
						for k = #gameSlots, 1, -1 do
							
							gameSlots[k].initX = gameSlots[k].x
							gameSlots[k].initY = gameSlots[k].y
							gameSlots[k].initR = gameSlots[k].rotation
							gameSlots[k].initScale = gameSlots[k].xScale
						
							gameSlots[k].animationInfo = gameSlots[k].finishAnim
							
							if (gameSlots[k].animation) then
							else
								animateStart( gameSlots[k] )
							end
						end
					
					else
				
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
				
				end
				-- rewardTimer = timer.performWithDelay( 1000, fillMeter )
				
				
				
				if (tblPuzzle.imageSet == "Cards" and turnOffEndVO ~= true or tblPuzzle.imageSet == "CardsClassic" and turnOffEndVO ~= true) then
				
				else
				
					-- Tweak end reward hide game screen
					rewardTimer = timer.performWithDelay( 1700, hideGameScreen )
				end
				
			end
			
			
			
			if (currentCount > #gameSlots or 
				tblPuzzle.imageSet == "Cards" and numToPutInSlots <= 0 or
				tblPuzzle.imageSet == "CardsClassic" and numToPutInSlots <= 0 or
				tblPuzzle.imageSet == "CardsEquation" and numToPutInSlots <= 0) then
			
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
			
				-- instructionsBox:removeEventListener("touch", instructionsButtonTouched)
				
				-- bgSky:removeEventListener("touch", gameButtonTouched)

				-- for i = 1, #gameSlots do
					-- gameSlots[i]:removeEventListener("touch", numberTouched)
				-- end
			
				-- currentCount = #gameNumbers
				
				for k = 1, #gameNumbers do
					if (gameNumbers[k].inSlot == true) then
					else
						transition.to( gameNumbers[k], { time=400 , alpha = 0, transition=easing.outExpo} )
					end
				end
				
				-- Tweak completed number vo timer
				rewardTimer = timer.performWithDelay( 2000, numbersAnim )
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
										-- cursor.x, cursor.y = gameSlots[i]:localToContent( gameSlots[i].contentWidth*0.37, gameSlots[i].contentHeight*0.5 )
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
					
					
					if (fireTVMultiCardOption == false) then
						numTimer = timer.performWithDelay( 900, scatterNumbers )
						
						
						rewardTimer = timer.performWithDelay( 900, startWindAnim )
					else
					
						
						timer.performWithDelay( 200, makeButtonsActive )
					
					end
				
				else
					timer.performWithDelay( 200, makeButtonsActive )
				end
			end
			
			
		end
		
		
		if (tblPuzzle.imageSet == "Cards" or tblPuzzle.imageSet == "CardsClassic" or tblPuzzle.imageSet == "CardsEquation" and numSlots ~= totalNumToPutInSlots) then
		
			local prevX, prevY = currentItem:localToContent( 0, 0 )
			currentSlot:insert( currentItem )
			
			local newX, newY = currentItem:localToContent( 0, 0 )
			
			local diffX, diffY = prevX - newX, prevY - newY
			
			currentItem.x = currentItem.x + (diffX / currentSlot.xScale)
			currentItem.y = currentItem.y + (diffY / currentSlot.yScale)
			
			currentItem.xScale = currentItem.xScale / currentSlot.xScale
			currentItem.yScale = currentItem.yScale / currentSlot.xScale
			
			if (myData.isFireTV or myData.isController) then 
				currentItem.x = 0
				currentItem.y = 0
			else
				transition.to( currentItem, { delay = 0, time=50 , x = 0, y = 0, xScale = currentItem.origScale, yScale = currentItem.origScale, rotation = currentSlot.rotation, transition=easing.inExpo } )
			end
			
			finishTransToSlot()
		elseif (tblPuzzle.imageSet == "CardsClassic" or tblPuzzle.imageSet == "CardsPutInOrder" or tblPuzzle.imageSet == "CardsPutInOrderClassic" or tblPuzzle.imageSet == "CardsPutInOrderClassicDifficult" or tblPuzzle.imageSet == "CardsEquation") then
			transition.to( currentItem, { delay = 0, time=50 , x = currentSlot.x, y = currentSlot.y, xScale = currentItem.origScale, yScale = currentItem.origScale, rotation = currentSlot.rotation, transition=easing.inExpo } )
			finishTransToSlot()
		elseif (myData.isFireTV or myData.isController) then 
			transition.to( currentItem, { delay = 0, time=350 , x = currentSlot.x, y = currentSlot.y, xScale = currentSlot.xScale, yScale = currentSlot.yScale, rotation = currentSlot.rotation, transition=easing.outExpo } )
			timer.performWithDelay( 351, finishTransToSlot )
		else
			transition.to( currentItem, { delay = 0, time=50 , x = currentSlot.x, y = currentSlot.y, xScale = currentSlot.xScale, yScale = currentSlot.yScale, rotation = currentSlot.rotation, transition=easing.inExpo } )
			finishTransToSlot()
		end
		
		
		if (myData.isFireTV or myData.isController) then 
			if (fireTVMultiCardOption == true) then
			
				print("test 1")
				print(currentCount)
				print(#gameSlots)
				print(numToPutInSlots)
				print(tblPuzzle.imageSet)
			
				if (currentCount > #gameSlots or 
					tblPuzzle.imageSet == "Cards" and numToPutInSlots <= 0 or
					tblPuzzle.imageSet == "CardsClassic" and numToPutInSlots <= 0 or
					tblPuzzle.imageSet == "CardsEquation" and numToPutInSlots <= 0) then
				else
					print("show cursor")
					local function showCursor()

						-- cursor.xScale = cardOptions.scale -- Hand Cursor
						-- cursor.yScale = cardOptions.scale
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
							
							if (tblPuzzle.imageSet == "Num" or tblPuzzle.imageSet == "NumDifficult") then
								cursor.x, cursor.y = gameNumbers[currentCardSelected]:localToContent( gameNumbers[currentCardSelected].contentWidth*1.35, gameNumbers[currentCardSelected].contentHeight*1 )
							elseif (tblPuzzle.imageSet == "CardsPutInOrder") then
								cursor.x, cursor.y = gameNumbers[currentCardSelected]:localToContent( gameNumbers[currentCardSelected].origContentWidth*1.35, gameNumbers[currentCardSelected].origContentWidth*1 )
							elseif (tblPuzzle.imageSet == "") then
								cursor.x, cursor.y = gameNumbers[currentCardSelected]:localToContent( gameNumbers[currentCardSelected].origContentWidth*1.1, gameNumbers[currentCardSelected].origContentHeight*1.1 )
							elseif (tblPuzzle.imageSet == "CardsNum" or tblPuzzle.imageSet == "CardsNumDifficult") then
								cursor.x, cursor.y = gameNumbers[currentCardSelected]:localToContent( gameNumbers[currentCardSelected].contentWidth*0.5, gameNumbers[currentCardSelected].contentHeight*0.45 )
							else
								cursor.x, cursor.y = gameNumbers[currentCardSelected]:localToContent( gameNumbers[currentCardSelected].contentWidth*0.37, gameNumbers[currentCardSelected].contentHeight*0.5 )
							end
						
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
            
			print("test touch")
            
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
						
							display.getCurrentStage():setFocus(obj)
							obj._isFocus = true
						
							for k = #floaters, 1, -1 do
								if (floaters[k] == gameNumbers[i].index) then
									table.remove( floaters, k )
								end
							end
							
							beganItemX = event.x
							beganItemY = event.y
							
							currentItemX = event.x
							currentItemY = event.y
						
							currentItem = gameNumbers[i]
							currentItem:toFront()
							
							currentItem.isDragging = true
							
							if (currentItem.shadow == nil and tblPuzzle.imageSet ~= "Num"  and tblPuzzle.imageSet ~= "Cards" and tblPuzzle.imageSet ~= "NumDifficult" and tblPuzzle.imageSet ~= "Shapes" and tblPuzzle.imageSet ~= "ShapesDifficult" and tblPuzzle.imageSet ~= "CardsPutInOrder" and tblPuzzle.imageSet ~= "") then
					
								if (tblPuzzle.imageSet == "CardsPutInOrderClassic" or tblPuzzle.imageSet == "CardsPutInOrderClassicDifficult" or tblPuzzle.imageSet == "CardsNum" or tblPuzzle.imageSet == "CardsNumDifficult" or tblPuzzle.imageSet == "CardsClassic") then
									currentItem.shadow = display.newImageRect("Images/cardShadow.png", 92*1, 110*1)
								else
									currentItem.shadow = display.newImageRect("Images/cardShadow.png", 92*1.1, 110*1.1)
								end
								if (currentItem.shadow) then
									currentItem.shadow.x = currentItem.x + shadowOffsetX
									currentItem.shadow.y = currentItem.y + shadowOffsetY
									currentItem.shadow.alpha = .75
									currentItem.shadow.rotation = currentItem.rotation
									if (tblPuzzle.imageSet ~= "CardsClassic") then
										gameGroup:insert(currentItem.shadow)
									else
										choicesGroup:insert(currentItem.shadow)
									end
									currentItem.shadow:toFront()
								end
							elseif (tblPuzzle.imageSet == "Cards" and currentItem.shadowImg) then
							
								currentItem.shadowImg.alpha = currentItem.shadowImg.initAlpha
							end
							currentItem:toFront()
							
							local slotK = 1
							if (tblPuzzle.imageSet ~= "Cards" and tblPuzzle.imageSet ~= "CardsEquation" or 
									tblPuzzle.imageSet == "CardsEquation" and numSlots == totalNumToPutInSlots) then
							
								local hasSlot = false
								
								for k = #gameSlots, 1, -1 do
									if (currentItem.id == gameSlots[k].id) then
										-- if (currentItem.scaleTrans) then
											-- transition.cancel( currentItem.scaleTrans )
											-- currentItem.scaleTrans = nil
										-- end
										hasSlot = true
										
										slotK = k
										
										
									end
								end
							
							end
							
							
							if (currentItem.scaleTrans) then
								transition.cancel( currentItem.scaleTrans )
								currentItem.scaleTrans = nil
							end
							
							
							if (tblPuzzle.imageSet == "CardsPutInOrder" or tblPuzzle.imageSet == "Cards") then
							
							elseif (tblPuzzle.imageSet == "CardsPutInOrderClassic" and numSlots == totalNumToPutInSlots) then
								currentItem.scaleTrans = transition.to( currentItem, { time=400 , xScale = currentItem.origScale*1.1, yScale = currentItem.origScale*1.1, rotation = 0, transition=easing.outExpo } )
							elseif (tblPuzzle.imageSet == "CardsEquation" and numSlots == totalNumToPutInSlots or 
										-- tblPuzzle.imageSet == "CardsPutInOrderClassic" and numSlots == totalNumToPutInSlots or
										tblPuzzle.imageSet == "CardsPutInOrderClassicDifficult" and numSlots == totalNumToPutInSlots) then
							
								currentItem.scaleTrans = transition.to( currentItem, { time=400 , xScale = currentItem.origScale, yScale = currentItem.origScale, rotation = 0, transition=easing.outExpo } )
							elseif (tblPuzzle.imageSet == "CardsClassic") then
								currentItem.scaleTrans = transition.to( currentItem, { time=400 , xScale = gameSlots[slotK].xScale * 1.2, yScale = gameSlots[slotK].xScale * 1.2, rotation = 0, transition=easing.outExpo } )
							else
								currentItem.scaleTrans = transition.to( currentItem, { time=400 , xScale = gameSlots[slotK].xScale, yScale = gameSlots[slotK].yScale, rotation = gameSlots[slotK].rotation, transition=easing.outExpo } )
							end
							
							
							if (hasSlot == false) then
								-- if (currentItem.scaleTrans) then
									-- transition.cancel( currentItem.scaleTrans )
									-- currentItem.scaleTrans = nil
								-- end
								
								-- if (tblPuzzle.imageSet == "CardsPutInOrder" or tblPuzzle.imageSet == "CardsEquation" and numSlots == totalNumToPutInSlots) then
									-- currentItem.scaleTrans = transition.to( currentItem, { time=400 , xScale = currentItem.origScale, yScale = currentItem.origScale, transition=easing.outExpo } )
								-- else
									-- currentItem.scaleTrans = transition.to( currentItem, { time=400 , xScale = gameSlots[1].xScale, yScale = gameSlots[1].yScale, transition=easing.outExpo } )
								-- end
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
					
					local newX = beganTouchX - event.x
					local newY = beganTouchY - event.y
				
				
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
				
				if (currentItem.shadow) then
					currentItem.shadow:removeSelf()
					currentItem.shadow = nil
				end
				
				
				for i = #gameSlots, 1, -1 do
			
					local itemX, itemY = currentItem:localToContent( 0, 0 )
					local slotX, slotY = gameSlots[i]:localToContent( 0, 0 )
					
					-- Default Collision box size:
					-- if (itemX < slotX + (gameSlots[i].contentWidth*0.5 + 0) and
							-- itemX > slotX - (gameSlots[i].contentWidth*0.5 - 0) and 
							-- itemY < slotY + (gameSlots[i].contentHeight*0.5 + 0) and 
							-- itemY > slotY - (gameSlots[i].contentHeight*0.5 - 0) and
							
					-- Pre-K collision box is made much larger:		
						if (itemX < slotX + (gameSlots[i].contentWidth) and
								itemX > slotX - (gameSlots[i].contentWidth) and 
								itemY < slotY + (gameSlots[i].contentHeight) and 
								itemY > slotY - (gameSlots[i].contentHeight) and
								currentItem.id == gameSlots[i].id and gameSlots[i].inSlot == false or 
								
								tblPuzzle.imageSet == "CardsEquation" and
								itemX < slotX + (gameSlots[i].contentWidth) and
								itemX > slotX - (gameSlots[i].contentWidth) and 
								itemY < slotY + (gameSlots[i].contentHeight) and 
								itemY > slotY - (gameSlots[i].contentHeight) and
								currentItem.secondID == gameSlots[i].id and gameSlots[i].inSlot == false) then
							
							
						checkSlot( currentItem, gameSlots[i] )
						
						break
						
					end
				
				end
				
				if (currentItem.inSlot == false) then
					
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
						
						obj.isDragging = false
						
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
					
					if (tblPuzzle.imageSet == "Cards" and currentItem.shadowImg) then
						currentItem.shadowImg.alpha = 0
					end
					
					-- floaters[#floaters+1] = currentItem.id
					
					local newX = event.x - beganTouchX
					local newY = event.y - beganTouchY
					if (newX < 3 and newX > -3 and newY < 3 and newY > -3) then
					
						transition.to( currentItem, { delay = 0, time=50 , alpha = 1, xScale = currentItem.popScale, yScale = currentItem.popScale, transition=easing.inExpo } )
						transition.to( currentItem, { delay = 50, time=50 , alpha = 1, xScale = currentItem.origScale, yScale = currentItem.origScale, transition=easing.outExpo} )
	
	
						
						if savedData.enableSounds == true then
							
							if (tblPuzzle.imageSet == "Shapes" or tblPuzzle.imageSet == "ShapesDifficult") then
								print(currentItem.id)
								print(shapeSets[currentItem.id].VO)
								playReservedChannel( gameSounds[shapeSets[currentItem.id].VO], currentGameChannel, 0 )
					
							elseif (tblPuzzle.imageSet == "Num" and currentItem.id == 0 or 
									tblPuzzle.imageSet == "NumDifficult" and currentItem.id == 0 or 
									tblPuzzle.imageSet == "CardsNum" and currentItem.id == 0 or 
									tblPuzzle.imageSet == "CardsNumDifficult" and currentItem.id == 0) then
								playReservedChannel( gameSounds.zero, currentGameChannel, 0 )
							else
								
								local tempCurrentItem = currentItem.id
								
								if (type(tempCurrentItem) == "string") then
								
									if (tostring(tempCurrentItem) == "=") then
										playReservedChannel( gameSounds["equal"], 29, 0 )
									elseif (tostring(tempCurrentItem) == "+") then
										playReservedChannel( gameSounds["plus"], 29, 0 )
									elseif (tostring(tempCurrentItem) == "-") then
										playReservedChannel( gameSounds["minus"], 29, 0 )
									else
										playReservedChannel( gameSounds[tempCurrentItem], 29, 0 )
									end
								
									
								elseif (tempCurrentItem <= 100) then
									playReservedChannel( gameNumSounds[tempCurrentItem], 29, 0 )
								else
									local function partFiveAudio()
										local numTemp
										if (tempCurrentItem < 110) then
											numTemp = tonumber( tostring(tempCurrentItem):sub(3, 3) )
										else
											numTemp = tonumber( tostring(tempCurrentItem):sub(2, 3) )
										end
										playReservedChannel(gameNumSounds[ numTemp ], 28, 0)
									end
								
									playReservedChannel(hundredSounds[ tonumber(tostring(tempCurrentItem):sub(1, 1)) ], 29, 0)
								
								
									if (questionAudioTimer) then
										timer.cancel( questionAudioTimer )
										questionAudioTimer = nil
									end
									questionAudioTimer = timer.performWithDelay( 900, partFiveAudio )
									
								end
								
								-- playReservedChannel( gameNumSounds[currentItem.id], currentGameChannel, 0 )
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
				
				currentItem = 0
				
			end
                
                -- if obj.name == chooseGameAnswer then
                    -- self.isTouchEnable = false
                    
					
            end -- if obj._isFocus then
        end -- touch began, moved, ended, cancelled

        return true
    end
	
	
	
	local onSlots = false
	local function showCursor()

		-- cursor.xScale = cardOptions.scale -- Hand Cursor
		-- cursor.yScale = cardOptions.scale
		cursor:toFront()
		
		-- currentSelectedTV = currentCardSelected
		-- currentCardSelected = 1
		
		if (onSlots == true) then
			currentSelected = "cards"
		else
			currentSelected = "slots"
		end
		
		local numTotalSlots
		if (tblPuzzle.imageSet == "Cards" or tblPuzzle.imageSet == "CardsClassic") then
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
				
				if (tblPuzzle.imageSet == "Num" or tblPuzzle.imageSet == "NumDifficult") then
					cursor.x, cursor.y = gameNumbers[currentCardSelected]:localToContent( gameNumbers[currentCardSelected].contentWidth*0.75, gameNumbers[currentCardSelected].contentHeight*0.75 )
				elseif (tblPuzzle.imageSet == "CardsPutInOrder") then
					cursor.x, cursor.y = gameNumbers[currentCardSelected]:localToContent( gameNumbers[currentCardSelected].origContentWidth*1, gameNumbers[currentCardSelected].origContentWidth*0.7 )
				elseif (tblPuzzle.imageSet == "CardsPutInOrderClassic" or puzzleOptions.imageSet == "CardsPutInOrderClassicDifficult") then
					cursor.x, cursor.y = gameNumbers[currentCardSelected]:localToContent( gameNumbers[currentCardSelected].origContentWidth*0.37, gameNumbers[currentCardSelected].origContentHeight*0.37 )
				elseif (tblPuzzle.imageSet == "") then
					cursor.x, cursor.y = gameNumbers[currentCardSelected]:localToContent( gameNumbers[currentCardSelected].origContentWidth*0.85, gameNumbers[currentCardSelected].origContentHeight*0.77 )
				elseif (tblPuzzle.imageSet == "CardsNum" or tblPuzzle.imageSet == "CardsNumDifficult") then
					cursor.x, cursor.y = gameNumbers[currentCardSelected]:localToContent( gameNumbers[currentCardSelected].origContentWidth*0.4, gameNumbers[currentCardSelected].origContentHeight*0.35 )
				else
					cursor.x, cursor.y = gameNumbers[currentCardSelected]:localToContent( gameNumbers[currentCardSelected].origContentWidth*0.37, gameNumbers[currentCardSelected].origContentHeight*0.5 )
				end
			
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
				
				-- cursor.x, cursor.y = gameSlots[currentCardSelected]:localToContent( gameSlots[currentCardSelected].contentWidth*0.37, gameSlots[currentCardSelected].contentHeight*0.5 )
				
				if (tblPuzzle.imageSet == "CardsPutInOrderClassic" or puzzleOptions.imageSet == "CardsPutInOrderClassicDifficult" or tblPuzzle.imageSet == "CardsNum"  or tblPuzzle.imageSet == "CardsNumDifficult") then
					cursor.x, cursor.y = gameSlots[currentCardSelected]:localToContent( gameSlots[currentCardSelected].contentWidth*0.37, gameSlots[currentCardSelected].contentHeight*0.37 )
				elseif (tblPuzzle.imageSet == "") then
					cursor.x, cursor.y = gameSlots[currentCardSelected]:localToContent( gameSlots[currentCardSelected].contentWidth*1, gameSlots[currentCardSelected].contentHeight*1 )
				else
					cursor.x, cursor.y = gameSlots[currentCardSelected]:localToContent( gameSlots[currentCardSelected].contentWidth*0.8, gameSlots[currentCardSelected].contentHeight*0.8 )
				end
			
				targetCard = gameSlots[currentCardSelected]
				cursorTransition = transition.to( cursor, { time=700, alpha=1 } )
			
			end
		end
		
		
		
	end
				
	
	local function pressedDownOnSlot()
	
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
				
				if (puzzleOptions.imageSet == "" or puzzleOptions.imageSet == "CardsPutInOrderClassic" or puzzleOptions.imageSet == "CardsPutInOrderClassicDifficult" or tblPuzzle.imageSet == "CardsPutInOrder" or puzzleOptions.imageSet == "Num" or puzzleOptions.imageSet == "NumDifficult" or puzzleOptions.imageSet == "CardsNum" or puzzleOptions.imageSet == "CardsNumDifficult") then
					transition.to( gameNumbers[currentSelectedTV], { time=100, rotation=0, y=gameNumbers[currentSelectedTV].initY, xScale = gameNumbers[currentSelectedTV].initScale, yScale = gameNumbers[currentSelectedTV].initScale, transition=easing.outExpo } )
				else
					transition.to( gameNumbers[currentSelectedTV], { time=100, rotation=0, y=gameNumbers[currentSelectedTV].initY, xScale = gameNumbers[currentSelectedTV].origScale, yScale = gameNumbers[currentSelectedTV].origScale, transition=easing.outExpo } )
				end
				
				currentCardSelected = currentSelectedTV
			
				onSlots = true
				cursorTransition = timer.performWithDelay( 0, showCursor ) -- 100
			
			end
		end
	
	end
	
	
	function puzzleSlotsTap( event )

		print("test 1")

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
													-- event.keyName ~= "down" and 
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
				
				
				
				
				if (event.keyName ~= "down" and currentSelected == "cards") then
				
				
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
				
					if (tblPuzzle.imageSet == "Cards" or tblPuzzle.imageSet == "CardsClassic") then
					
					
						if (tblPuzzle.imageSet == "Cards" and gameNumbers[currentCardSelected].id == gameSlots[#gameSlots - 1].id) then
							checkSlot( gameNumbers[currentCardSelected], gameSlots[#gameSlots - 1] )
						elseif (tblPuzzle.imageSet == "CardsClassic" and gameNumbers[currentCardSelected].id == gameSlots[blankSpotIndex].id) then
							checkSlot( gameNumbers[currentCardSelected], gameSlots[blankSpotIndex] )
						else
							if savedData.enableSounds == true then
								playReservedChannel(wrongSound, currentWrongChannel, 0)
							end
							currentWrongChannel = currentWrongChannel + 1
							if currentWrongChannel > 20 then
								currentWrongChannel = 19
							end
							
							makeButtonsActive()
						end
					
					else
				
						currentSelectedTV = currentCardSelected
						
						local function scalePop( obj )
						
							if (tblPuzzle.imageSet == "" or tblPuzzle.imageSet == "Num" or tblPuzzle.imageSet == "NumDifficult") then
								transition.to( obj, { time=100 , xScale = 0.61, yScale = 0.61, transition=easing.outExpo } )
							elseif (tblPuzzle.imageSet == "CardsPutInOrder") then
								transition.to( obj, { time=100 , xScale = 0.45, yScale = 0.45, transition=easing.outExpo } )
							elseif (puzzleOptions.imageSet == "CardsPutInOrderClassic" or puzzleOptions.imageSet == "CardsPutInOrderClassicDifficult") then
								transition.to( obj, { time=100 , xScale = 1.25, yScale = 1.25, transition=easing.outExpo } )
							elseif (tblPuzzle.imageSet == "CardsNum" or tblPuzzle.imageSet == "CardsNumDifficult") then
								transition.to( obj, { time=100 , xScale = 1.25, yScale = 1.25, transition=easing.outExpo } )
							else
								transition.to( obj, { time=100 , xScale = 1.15, yScale = 1.15, transition=easing.outExpo } )
							end
						
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
						
						if (tblPuzzle.imageSet == "" or tblPuzzle.imageSet == "Num" or tblPuzzle.imageSet == "NumDifficult") then
							transition.to(gameNumbers[currentCardSelected], {time=100, xScale = 0.9, yScale = 0.9, onComplete = scalePop, transition=easing.inExpo} )
						elseif (tblPuzzle.imageSet == "CardsPutInOrder") then
							transition.to(gameNumbers[currentCardSelected], {time=100, xScale = 0.6, yScale = 0.6, onComplete = scalePop, transition=easing.inExpo} )
						else
							transition.to(gameNumbers[currentCardSelected], {time=100, xScale = 1.5, yScale = 1.5, onComplete = scalePop, transition=easing.inExpo} )
						end
					
						currentCardSelected = 1
					
						onSlots = false
						cursorTransition = timer.performWithDelay( 0, showCursor ) -- 100
						
					end
				
				elseif (event.keyName ~= "down" and fireTVMultiCardOption == false and gameNumbers[currentIndex].id == gameSlots[currentCardSelected].id or
						event.keyName ~= "down" and fireTVMultiCardOption == true and gameNumbers[currentSelectedTV].id == gameSlots[currentCardSelected].id) then
					
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
				
					if (event.keyName ~= "down" or
							 event.keyName == "down" and currentSelected == "slots") then
					
						pressedDownOnSlot()
						
						if (event.keyName ~= "down") then
					
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
							
						end
						
					
					end
					
					makeButtonsActive()
					
				end
				
			end
			
			
		end
		
		
	end
	
	
	
	function trackCursorAxisSlots( event )

		if (buttonsActive == true and currentState == "game" and version.appStore ~= "Chrome") then

			local axisNameSlots = ""

			if event.normalizedValue > 0 then
				axisNameSlots = event.axis.type .. "+"
			else
				axisNameSlots = event.axis.type .. "-"
			end
			
			if math.abs(event.normalizedValue) >= controllerSensitivity then
				if (axisNameSlots == "leftY+" or axisNameSlots == "y+") then
				
					pressedDownOnSlot()
				
					Runtime:removeEventListener( "axis", trackCursorAxisSlots )
					timer.performWithDelay( controllerAxisDelay, function()
						Runtime:addEventListener( "axis", trackCursorAxisSlots )
					end )
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
			
			
			local numTotalSlots
			if (tblPuzzle.imageSet == "Cards") then
				numTotalSlots = #gameSlots - 1
			else
				numTotalSlots = #gameSlots
			end
			
			local cardsTransitionInTime = 0
			
			local currentSlotNum = 0
			for m = 1, numTotalSlots do
				for i = 1, #gameNumbers do
					if (gameSlots[m].selected == false and gameNumbers[i].selected == false and gameNumbers[i].id == gameSlots[m].id) then
						-- local slotFound = false
						-- local slotPosX, slotPosY
						-- for k = 1, #gameSlots do
							-- if (gameNumbers[i].id == gameSlots[k].id) then
								-- slotFound = true
								
							-- end
						-- end
						gameSlots[m].selected = true
						
						gameNumbers[i].selected = true
						
						
						if (tblPuzzle.imageSet ~= "Cards" and tblPuzzle.imageSet ~= "CardsClassic" and tblPuzzle.imageSet ~= "CardsEquation" or
							tblPuzzle.imageSet == "Cards" and m ~= blankSpotIndex or
							tblPuzzle.imageSet == "CardsClassic" and m ~= blankSpotIndex or
							tblPuzzle.imageSet == "CardsEquation" and numSlots ~= totalNumToPutInSlots and m ~= blankSpotIndex) then
							
							slotPosX, slotPosY = gameSlots[m].x, gameSlots[m].y
							
							gameNumbers[i].hasSlot = m
							
							gameNumbers[i].x = slotPosX
							gameNumbers[i].y = slotPosY
							
						end
						-- gameNumbers[i].initX = gameNumbers[i].x
						-- gameNumbers[i].initY = gameNumbers[i].y
						
						-- if (slotFound == true) then
							-- gameNumbers[i].x = slotPosX - (choicesGroup.x - slotsGroup.x)
							-- gameNumbers[i].y = slotPosY - (choicesGroup.y - slotsGroup.y)
							
							
						-- else
							-- gameNumbers[i].x = math.random( -50, 50 )
							-- gameNumbers[i].y = screenEdgeY + 100
						-- end
						
						
						if (tblPuzzle.imageSet == "Cards" and m ~= blankSpotIndex or
							tblPuzzle.imageSet == "CardsClassic" and m ~= blankSpotIndex or
							tblPuzzle.imageSet == "CardsEquation" and numSlots ~= totalNumToPutInSlots and m ~= blankSpotIndex) then
						
							gameNumbers[i].inSlot = true
						
							gameNumbers[i].startedInSlots = true
						
							gameSlots[m]:insert( gameNumbers[i] )
							
							if (tblPuzzle.imageSet == "CardsClassic") then
								gameSlots[m][1].alpha = 0
							end
							
							gameNumbers[i].x = 0
							gameNumbers[i].y = 0
							
							gameNumbers[i].alpha = 1
						end
						
						
						local function startNumFloat()
						
							for k = 1, #gameNumbers do
								
								if (tblPuzzle.imageSet ~= "Cards" and tblPuzzle.imageSet ~= "CardsClassic" and tblPuzzle.imageSet ~= "CardsEquation" or
									tblPuzzle.imageSet == "Cards" and gameNumbers[k].startedInSlots == false or
									tblPuzzle.imageSet == "CardsClassic" and gameNumbers[k].startedInSlots == false or
									tblPuzzle.imageSet == "CardsEquation" and gameNumbers[k].startedInSlots == false) then
									
									gameNumbers[k].origY = gameNumbers[k].initY
									gameNumbers[k].origX = gameNumbers[k].initX
								end
							end
						
							local function showCursor()

								-- cursor.xScale = cardOptions.scale -- Hand Cursor
								-- cursor.yScale = cardOptions.scale
								
								if (tblPuzzle.imageSet == "CardsPutInOrderClassicDifficult") then
									cursor.xScale = 1
									cursor.yScale = 1
								end
								cursor:toFront()
								
								currentCardSelected = 1
								if (fireTVMultiCardOption == false and tblPuzzle.imageSet ~= "Cards" and tblPuzzle.imageSet ~= "CardsClassic") then
									currentSelected = "slots"
									
									if (gameSlots and numTotalSlots > 0) then
										for i = 1, numTotalSlots do
											if (gameSlots[i].x < gameSlots[currentCardSelected].x) then
												currentCardSelected = i
											end
										end
										
										-- cursor.x, cursor.y = gameSlots[currentCardSelected]:localToContent( gameSlots[currentCardSelected].contentWidth*0.37, gameSlots[currentCardSelected].contentHeight*0.5 )
										cursor.x, cursor.y = gameSlots[currentCardSelected]:localToContent( gameSlots[currentCardSelected].contentWidth*0.8, gameSlots[currentCardSelected].contentHeight*0.8 )
									
										targetCard = gameSlots[currentCardSelected]
										cursorTransition = transition.to( cursor, { time=700, alpha=1 } )
									
									end
								else
									currentSelected = "cards"
									
									if (gameNumbers and #gameNumbers > 0) then
									
										currentCardSelected = 0
										repeat
											currentCardSelected = currentCardSelected + 1
										until gameNumbers[currentCardSelected].startedInSlots == false
									
										for i = 1, #gameNumbers do
											if (gameNumbers[i].x < gameNumbers[currentCardSelected].x and gameNumbers[i].startedInSlots == false) then
												currentCardSelected = i
											end
										end
										
										if (tblPuzzle.imageSet == "Cards" or tblPuzzle.imageSet == "CardsPutInOrder") then
											cursor.x, cursor.y = gameNumbers[currentCardSelected]:localToContent( gameNumbers[currentCardSelected].contentWidth*1.5, gameNumbers[currentCardSelected].contentHeight*1.5 )
										elseif (tblPuzzle.imageSet == "") then
											cursor.x, cursor.y = gameNumbers[currentCardSelected]:localToContent( gameNumbers[currentCardSelected].contentWidth*1.3, gameNumbers[currentCardSelected].contentHeight*1.3 )
										elseif (tblPuzzle.imageSet == "Num" or tblPuzzle.imageSet == "NumDifficult") then
											cursor.x, cursor.y = gameNumbers[currentCardSelected]:localToContent( gameNumbers[currentCardSelected].contentWidth*1.15, gameNumbers[currentCardSelected].contentHeight*1.1 )
										elseif (tblPuzzle.imageSet == "CardsNum" or tblPuzzle.imageSet == "CardsNumDifficult") then
											cursor.x, cursor.y = gameNumbers[currentCardSelected]:localToContent( gameNumbers[currentCardSelected].contentWidth*0.5, gameNumbers[currentCardSelected].contentHeight*0.45 )
										else
											cursor.x, cursor.y = gameNumbers[currentCardSelected]:localToContent( gameNumbers[currentCardSelected].contentWidth*0.37, gameNumbers[currentCardSelected].contentHeight*0.5 )
										end
									
										targetCard = gameNumbers[currentCardSelected]
										cursorTransition = transition.to( cursor, { time=700, alpha=1 } )
									
									end
								end
								
								
								
								
								if (myData.isController) then
									Runtime:addEventListener( "key", puzzleSlotsTap )
									Runtime:addEventListener( "axis", trackCursorAxisSlots )
								elseif (myData.isFireTV) then
									Runtime:addEventListener( "onFTVKey", puzzleSlotsTap )
								end
								
							end
							
							if (myData.isFireTV or myData.isController) then 
								cursorTransition = timer.performWithDelay( 700, showCursor )
							end
						
							if (gameNumbers and fireTVMultiCardOption == false) then
								for i = #gameNumbers, 1, -1 do
									if (tblPuzzle.imageSet ~= "Cards" and tblPuzzle.imageSet ~= "CardsClassic" and tblPuzzle.imageSet ~= "CardsEquation" or
										tblPuzzle.imageSet == "Cards" and gameNumbers[i].startedInSlots == false or
										tblPuzzle.imageSet == "CardsClassic" and gameNumbers[i].startedInSlots == false or
										tblPuzzle.imageSet == "CardsEquation" and gameNumbers[i].startedInSlots == false) then
										
										if (currentItem ~= gameNumbers[i]) then
											floaters[#floaters+1] = gameNumbers[i].index
										end
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
								
								print("test 2")
								
								readPuzzleSlotsVO()
								
								questionText:toFront()
								questionTextTwo:toFront()
								transition.to( questionText, { time=700, x=halfW, transition=easing.outExpo } )
								transition.to( questionTextTwo, { time=700, x=halfW, transition=easing.outExpo } )

								if (tblPuzzle.imageSet == "Cards" or tblPuzzle.imageSet == "CardsClassic" or tblPuzzle.imageSet == "CardsEquation" and numSlots ~= totalNumToPutInSlots) then
									cardTrans = transition.to( choicesGroup, { delay = 100, time=700, x=halfW+cardOptions.offsetX, transition=easing.outExpo } )
								end
				
							
							end
							timerVO = timer.performWithDelay( 0, playCanPutNumVO ) -- 1500
						
							-- makeButtonsActive()
						
						end
						
						
				
						local function scaleGameImageBack( obj )
						
							-- transition.to( obj, { time=100 , xScale = obj.startScale, yScale = obj.startScale, transition=easing.outExpo} )
							
							if (tblPuzzle.imageSet == "CardsNum") then
								transition.to( obj, { time=100 , xScale = gameSlots[1].xScale, yScale = gameSlots[1].yScale, transition=easing.outExpo} )
							elseif (tblPuzzle.imageSet == "" or tblPuzzle.imageSet == "CardsClassic" or tblPuzzle.imageSet == "CardsPutInOrderClassic" or tblPuzzle.imageSet == "Num" or tblPuzzle.imageSet == "NumDifficult") then
								transition.to( obj, { time=100 , xScale = obj.origScale, yScale = obj.origScale, transition=easing.outExpo} )
							else
								transition.to( obj, { time=100 , xScale = obj.initScale, yScale = obj.initScale, transition=easing.outExpo} )
							end
						
							if (gameSlots) then
							
								if (m > numTotalSlots) then
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
												m == numTotalSlots) then
											playReservedChannel(popSounds[math.random(1,3)], currentPopChannel, 0)
										end
									end
									currentPopChannel = currentPopChannel + 1
									if currentPopChannel > 26 then
										currentPopChannel = 27
									end
									
									if savedData.enableSounds == true and tblPuzzle.imageSet ~= "CardsNum" and tblPuzzle.imageSet ~= "CardsNumDifficult" and tblPuzzle.imageSet ~= "CardsPutInOrder" and tblPuzzle.imageSet ~= "CardsPutInOrderClassic" and tblPuzzle.imageSet ~= "CardsPutInOrderClassicDifficult" and tblPuzzle.imageSet ~= "CardsEquation" then
										if (tblPuzzle.imageSet == "Cards" and m == blankSpotIndex or
												tblPuzzle.imageSet == "CardsClassic" and m == blankSpotIndex) then
											playReservedChannel( uhOhSound, 13, 0 )
										elseif (tblPuzzle.imageSet == "Shapes" or tblPuzzle.imageSet == "ShapesDifficult") then
											print(shapeSets[obj.id].VO)
											playReservedChannel( gameSounds[shapeSets[obj.id].VO], 13, 0 )
										
										elseif (tblPuzzle.imageSet == "Num" or tblPuzzle.imageSet == "NumDifficult") then
											if (m == numTotalSlots and hasPlayedVO == false) then
											
												if (puzzleNum <= 100) then
													playReservedChannel( gameNumSounds[puzzleNum], 13, 0 )
												else
													local function partFiveAudio()
														local numTemp
														if (puzzleNum < 110) then
															numTemp = tonumber( tostring(puzzleNum):sub(3, 3) )
														else
															numTemp = tonumber( tostring(puzzleNum):sub(2, 3) )
														end
														playReservedChannel(gameNumSounds[ numTemp ], 28, 0)
													end
												
													playReservedChannel(hundredSounds[ tonumber(tostring(puzzleNum):sub(1, 1)) ], 29, 0)
												
												
													if (questionAudioTimer) then
														timer.cancel( questionAudioTimer )
														questionAudioTimer = nil
													end
													questionAudioTimer = timer.performWithDelay( 900, partFiveAudio )
												end
												hasPlayedVO = true
											end
											
											
										else
											
											if (type(obj.id) == "string") then
												playReservedChannel( gameSounds[obj.id], 29, 0 )
											
											elseif (obj.id <= 100) then
												playReservedChannel( gameNumSounds[obj.id], 29, 0 )
											else
												local function partFiveAudio()
													local numTemp
													if (obj.id < 110) then
														numTemp = tonumber( tostring(obj.id):sub(3, 3) )
													else
														numTemp = tonumber( tostring(obj.id):sub(2, 3) )
													end
													playReservedChannel(gameNumSounds[ numTemp ], 28, 0)
												end
											
												playReservedChannel(hundredSounds[ tonumber(tostring(obj.id):sub(1, 1)) ], 29, 0)
											
											
												if (questionAudioTimer) then
													timer.cancel( questionAudioTimer )
													questionAudioTimer = nil
												end
												questionAudioTimer = timer.performWithDelay( 900, partFiveAudio )
													
											end
											
										end
										currentGameChannel = currentGameChannel + 1
										if (currentGameChannel > 25) then
											currentGameChannel = 20
										end
									end
								end
								
								if (m == numTotalSlots) then
								
								
									if (tblPuzzle.imageSet == "Cards" or tblPuzzle.imageSet == "CardsClassic" or tblPuzzle.imageSet == "CardsEquation" and numSlots ~= totalNumToPutInSlots) then
							
										if (myData.isFireTV and tblPuzzle.imageSet ~= "Cards" and tblPuzzle.imageSet ~= "CardsClassic" or 
												myData.isController and tblPuzzle.imageSet ~= "Cards" and tblPuzzle.imageSet ~= "CardsClassic") then
										
										else
										
											choicesGroup = display.newGroup()
											
										
											local tempIndex = 1
											
											for p = 1, #gameNumbers do
												if (gameNumbers[p].startedInSlots == false) then
													tempIndex = p
													
													gameNumbers[p].alpha = 1
													
													choicesGroup:insert( gameNumbers[p] )
													break
												end
											end
										
											local prevIndex = tempIndex
											for p = tempIndex+1, #gameNumbers do
												if (gameNumbers[p].startedInSlots == false) then
												
													gameNumbers[p].x = gameNumbers[prevIndex].x + (gameNumbers[p].contentWidth*0.5) + (gameNumbers[prevIndex].contentWidth*0.5) + choiceOptions[#numberOptions][1]
													gameNumbers[p].initX = gameNumbers[p].x
													
													gameNumbers[p].alpha = 1
													
													choicesGroup:insert( gameNumbers[p] )
													
													prevIndex = p
												end
											end
											
											choicesGroup.anchorChildren = true
											choicesGroup.anchorX, choicesGroup.anchorY = 0.5, 0.5
											choicesGroup.x, choicesGroup.y = 1000, halfH + choiceYOffset
											
											
											
											numTimer = timer.performWithDelay( 500, startNumFloat )
											
											-- questionText:toFront()
											-- questionTextTwo:toFront()
											-- transition.to( questionText, { delay = 100, time=700, x=halfW, transition=easing.outExpo } )
											-- transition.to( questionTextTwo, { delay = 100, time=700, x=halfW, transition=easing.outExpo } )
				
											-- readPuzzleSlotsVO()
											
											-- for i = choicesGroup.numChildren, 1, -1 do
												-- local tempItem = choicesGroup[i]
												-- local initX, initY = tempItem:localToContent(0,0)
												-- gameGroup:insert( choicesGroup[i] )
												-- tempItem.x, tempItem.y = initX, initY
												
												-- tempItem.initX = tempItem.x
												-- tempItem.initY = tempItem.y
											-- end
											
											-- choicesGroup:removeSelf()
											-- choicesGroup = nil
											
											
										end
										
									end
								
									
									local function scatterNumbers()
									
										showSlotBG = true
									
										local transTime = 0
										
										
										local lastEquationNum = 0
										for k = 1, #gameNumbers do
										
											if (tblPuzzle.imageSet == "CardsEquation" and gameNumbers[k].startedInSlots == false) then
												lastEquationNum = k
											end
										
										end
										
										local isOutOfSlots = nil
										
										for k = 1, #gameNumbers do
										
											if (tblPuzzle.imageSet ~= "Cards" and tblPuzzle.imageSet ~= "CardsClassic" and tblPuzzle.imageSet ~= "CardsEquation" or
												tblPuzzle.imageSet == "Cards" and gameNumbers[k].startedInSlots == false or
												tblPuzzle.imageSet == "CardsClassic" and gameNumbers[k].startedInSlots == false or
												tblPuzzle.imageSet == "CardsEquation" and gameNumbers[k].startedInSlots == false) then
										
												gameNumbers[k]:toFront()
												if (tblPuzzle.imageSet == "NumDifficult" or tblPuzzle.imageSet == "ShapesDifficult" or tblPuzzle.imageSet == "Cards" or tblPuzzle.imageSet == "CardsClassic" or tblPuzzle.imageSet == "CardsNumDifficult" or tblPuzzle.imageSet == "CardsPutInOrder" or tblPuzzle.imageSet == "CardsPutInOrderClassicDifficult" or tblPuzzle.imageSet == "CardsEquation") then
													gameNumbers[k].x = screenOriginX - 100
												elseif (gameNumbers[k].hasSlot) then
													transition.to( gameSlots[gameNumbers[k].hasSlot], { time=400 , alpha = 1, transition=easing.inExpo} )
													if (gameSlots[gameNumbers[k].hasSlot].bg) then
														transition.to( gameSlots[gameNumbers[k].hasSlot].bg, { time=400 , alpha = gameSlots[gameNumbers[k].hasSlot].bg.initAlpha, transition=easing.inExpo} )
													end
												else
													gameNumbers[k].x = screenOriginX - 100
												end
												
												if (isOutOfSlots == nil) then
													isOutOfSlots = k
												end
											
												local spinAmount = math.random( -8, 8 )
												if spinAmount < 1 or spinAmount > 1 then spinAmount = 1 end
												gameNumbers[k].rotation = gameNumbers[k].rotation + (spinAmount*360)
												randomDelay = math.random(1,100)
												local randomTime = math.random(1300,1400)
												
												gameNumbers[k].origY = gameNumbers[k].initY
												gameNumbers[k].origX = gameNumbers[k].initX
												
												if (k ~= currentIndex and myData.isFireTV and fireTVMultiCardOption == false or k ~= currentIndex and myData.isController and fireTVMultiCardOption == false) then
													transition.to( gameNumbers[k], {delay = randomDelay, time=randomTime-randomDelay, alpha = 1, x = screenEdgeX + 100, y = gameNumbers[k].initY, rotation = gameNumbers[k].initR, xScale = gameNumbers[k].initScale, yScale = gameNumbers[k].initScale, transition=easing.inOutQuad } )
												else
													transition.to( gameNumbers[k], {delay = randomDelay, time=randomTime-randomDelay, alpha = 1, x = gameNumbers[k].initX, y = gameNumbers[k].initY, rotation = gameNumbers[k].initR, xScale = gameNumbers[k].initScale, yScale = gameNumbers[k].initScale, transition=easing.inOutQuad } )
												end
											
												transition.to( gameNumbers[k][1], { delay = randomDelay, time= randomTime-randomDelay, alpha=gameNumbers[k][1].initAlpha, transition=easing.inExpo } )
						
											
												if (randomDelay + randomTime > transTime) then
													transTime = randomDelay + randomTime
												end
											
												if (k == #gameNumbers or tblPuzzle.imageSet == "CardsEquation" and k == lastEquationNum) then
													
													local function playUhOhVO()
													
														-- playReservedChannel( uhOhSound, currentGameChannel, 0 )
														-- currentGameChannel = currentGameChannel + 1
														-- if (currentGameChannel > 25) then
															-- currentGameChannel = 20
														-- end
														
														print("play")
														
														
														if savedData.enableSounds == true then
															local dontPlayVO = math.random(1,3)
														
															if (dontPlayVO > 1) then
																if (gameNumbers[isOutOfSlots].x < 0) then
																	playReservedChannel( whoaSound, currentGameChannel, 0 )
																else
																	playReservedChannel( uhOhSound, currentGameChannel, 0 )
																end
																
																currentGameChannel = currentGameChannel + 1
																if (currentGameChannel > 25) then
																	currentGameChannel = 20
																end
															end
														end
														
														
														local function addGameListeners()
															bg:removeEventListener("touch", this)
															bg:addEventListener("touch", this)
														end
														timer.performWithDelay( 600, addGameListeners )
														
													end
													timerVO = timer.performWithDelay( 500, playUhOhVO )
													
													
													
													numTimer = timer.performWithDelay( transTime + 1, startNumFloat )
													
													
												end
											
											end
										
										end
									
									end
									
									
									print("Testing")
									print(tblPuzzle.imageSet)
									
									if (tblPuzzle.imageSet ~= "Cards" and tblPuzzle.imageSet ~= "CardsClassic" and tblPuzzle.imageSet ~= "CardsEquation" or 
										tblPuzzle.imageSet == "CardsEquation" and numSlots == totalNumToPutInSlots) then
										numTimer = timer.performWithDelay( 900, scatterNumbers )
										rewardTimer = timer.performWithDelay( 900, startWindAnim )
									else
										
										local function addGameListeners()
											bg:removeEventListener("touch", this)
											bg:addEventListener("touch", this)
										end
										timer.performWithDelay( 600, addGameListeners )
										
									
									end
									
								end
								
							end
							
						end
						
						-- if (i > #gameSlots) then
							-- gameNumbers[i].showTrans = transition.to( gameNumbers[i], { delay = 100 + (#gameSlots * 700) + i, time=0 , alpha = 1, xScale = gameNumbers[i].initScale, yScale = gameNumbers[i].initScale, transition=easing.inExpo, onComplete = scaleGameImageBack} )
						-- else 
						
						 
						if (tblPuzzle.imageSet == "Cards" or tblPuzzle.imageSet == "CardsClassic" or tblPuzzle.imageSet == "CardsNumDifficult" or tblPuzzle.imageSet == "CardsPutInOrder" or tblPuzzle.imageSet == "CardsEquation" or tblPuzzle.imageSet == "ShapesDifficult") then
							
							if (tblPuzzle.imageSet == "CardsPutInOrder" or tblPuzzle.imageSet == "ShapesDifficult") then
								gameNumbers[i].showTrans = transition.to( gameSlots[m], { delay = 0 + (currentSlotNum * 700), time=100 , alpha = 1, xScale = gameSlots[m].initScale+0.4, yScale = gameSlots[m].initScale+0.4, transition=easing.inExpo, onComplete = scaleGameImageBack} )
							elseif (gameSlots[m].id >= 100 and m ~= blankSpotIndex and tblPuzzle.imageSet == "CardsClassic" or
									gameSlots[m].id >= 100 and tblPuzzle.imageSet ~= "CardsClassic") then
								gameNumbers[i].showTrans = transition.to( gameSlots[m], { delay = cardsTransitionInTime, time=100 , alpha = 1, xScale = gameSlots[m].origScale+0.4, yScale = gameSlots[m].origScale+0.4, transition=easing.inExpo, onComplete = scaleGameImageBack} )
							
								cardsTransitionInTime = cardsTransitionInTime + 2000
							elseif (gameSlots[m].id > 20) then
								gameNumbers[i].showTrans = transition.to( gameSlots[m], { delay = cardsTransitionInTime, time=100 , alpha = 1, xScale = gameSlots[m].origScale+0.4, yScale = gameSlots[m].origScale+0.4, transition=easing.inExpo, onComplete = scaleGameImageBack} )
							
								cardsTransitionInTime = cardsTransitionInTime + 1000
							else
								gameNumbers[i].showTrans = transition.to( gameSlots[m], { delay = cardsTransitionInTime, time=100 , alpha = 1, xScale = gameSlots[m].origScale+0.4, yScale = gameSlots[m].origScale+0.4, transition=easing.inExpo, onComplete = scaleGameImageBack} )
							
								cardsTransitionInTime = cardsTransitionInTime + 700
							end
							
							if (tblPuzzle.imageSet == "Shapes" or tblPuzzle.imageSet == "ShapesDifficult") then
								if (gameSlots[m].bg) then
									transition.to( gameSlots[m].bg, { delay = 0 + (currentSlotNum * 700), time=100 , alpha = gameSlots[m].bg.initAlpha, transition=easing.inExpo} )
								end
							end
							
						elseif (tblPuzzle.imageSet == "CardsNum") then
							gameNumbers[i].showTrans = transition.to( gameNumbers[i], { delay = 0 + (0 * 700), time=100 , alpha = 1, xScale = gameSlots[m].xScale+0.4, yScale = gameSlots[m].yScale+0.4, transition=easing.inExpo, onComplete = scaleGameImageBack} )
						elseif (tblPuzzle.imageSet == "Num") then
							gameNumbers[i].showTrans = transition.to( gameNumbers[i], { delay = 0 + (0 * 700), time=100 , alpha = 1, xScale = gameNumbers[i].origScale+0.4, yScale = gameNumbers[i].origScale+0.4, transition=easing.inExpo, onComplete = scaleGameImageBack} )
						elseif (tblPuzzle.imageSet == "NumDifficult") then
							gameNumbers[i].showTrans = transition.to( gameSlots[m], { delay = 0 + (0 * 700), time=100 , alpha = 1, xScale = gameSlots[m].origScale+0.4, yScale = gameSlots[m].origScale+0.4, transition=easing.inExpo, onComplete = scaleGameImageBack} )
							
							if (gameSlots[m].bg) then
								transition.to( gameSlots[m].bg, { delay = 0 + (0 * 700), time=100 , alpha = gameSlots[m].bg.initAlpha, transition=easing.inExpo} )
							end
						elseif (tblPuzzle.imageSet == "CardsPutInOrderClassicDifficult") then
							gameNumbers[i].showTrans = transition.to( gameSlots[m], { delay = 0 + (0 * 700), time=100 , alpha = 1, xScale = gameSlots[m].initScale+0.4, yScale = gameSlots[m].initScale+0.4, transition=easing.inExpo, onComplete = scaleGameImageBack} )
							
							if (gameSlots[m].bg) then
								transition.to( gameSlots[m].bg, { delay = 0 + (0 * 700), time=100 , alpha = gameSlots[m].bg.initAlpha, transition=easing.inExpo} )
							end
						else
							if (tblPuzzle.imageSet == "CardsPutInOrderClassic" or tblPuzzle.imageSet == "") then
								gameNumbers[i].showTrans = transition.to( gameNumbers[i], { delay = 0 + (currentSlotNum * 700), time=100 , alpha = 1, xScale = gameNumbers[i].origScale+0.4, yScale = gameNumbers[i].origScale+0.4, transition=easing.inExpo, onComplete = scaleGameImageBack} )
							else
								gameNumbers[i].showTrans = transition.to( gameNumbers[i], { delay = 0 + (currentSlotNum * 700), time=100 , alpha = 1, xScale = gameNumbers[i].initScale+0.4, yScale = gameNumbers[i].initScale+0.4, transition=easing.inExpo, onComplete = scaleGameImageBack} )
							end
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
						currentGameChannel = 20
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
							currentGameChannel = 20
						end
					end
					
					local function numberVO()
						if savedData.enableSounds == true then
							playReservedChannel( gameNumSounds[currentNumber], currentGameChannel, 0 )
							currentGameChannel = currentGameChannel + 1
							if (currentGameChannel > 25) then
								currentGameChannel = 20
							end
						end
					end
					timer.performWithDelay( 500, numberVO )
				end
				timer.performWithDelay( 500, isVO )
				
			end
			-- timer.performWithDelay( 700, thisIsVO )
			
			
			
			if (tblPuzzle.imageSet == "Cards" or tblPuzzle.imageSet == "CardsClassic") then
			
				if (tblQuestion.questionType1 == "What comes next?" or
					tblQuestion.questionType1 == "What's missing?") then
				
					questionText.text = tblQuestion.questionType1
				else
					if (blankSpotIndex == numTotalSlots) then
						questionText.text = "What comes next?"
					else
						questionText.text = "What's missing?"
					end
				end
			
			elseif (tblPuzzle.imageSet == "Shapes" or tblPuzzle.imageSet == "ShapesDifficult") then
		
				questionText.text = "Put the shapes where they belong."
			
			elseif (tblPuzzle.imageSet == "Num" or tblPuzzle.imageSet == "NumDifficult" or 
						tblPuzzle.imageSet == "CardsNum" or tblPuzzle.imageSet == "CardsNumDifficult") then
				
				questionText.text = "Build the number."
				if (display.pixelHeight == 960) then
					questionText.xScale = 0.75
					questionText.yScale = 0.75
				else
					questionText.xScale = 1
					questionText.yScale = 1
				end
				-- questionText.y = questionText.initY
				if (display.pixelHeight == 960) then
					questionText.y = questionText.initY + questionOptions.offsetY + 10 - 25
				else
					questionText.y = questionText.initY - 65
				end
				
				if system.getInfo( "platformName" ) == "Android" then
					questionText.y = questionText.y - 58 -- - 61
				end
				
				questionHitBox.y = questionText.y - 10
				
			elseif (tblPuzzle.imageSet == "CardsPutInOrder" or tblPuzzle.imageSet == "CardsPutInOrderClassic" or tblPuzzle.imageSet == "CardsPutInOrderClassicDifficult") then
				questionText.text = "Put the numbers in order."
			
				if (display.pixelHeight == 960) then
					questionText.y = questionText.initY + questionOptions.offsetY + 10 - 25
				else
					questionText.y = questionText.initY - 65
				end
			
				if system.getInfo( "platformName" ) == "Android" then
					questionText.y = questionText.y - 54 -- + 15 -- 50
				end
				
			elseif(tblPuzzle.imageSet == "CardsEquation") then
			
				questionText.text = "Build the equation."
			
				if (display.pixelHeight == 960) then
					questionText.y = questionText.initY + questionOptions.offsetY + 10 - 25
				else
					questionText.y = questionText.initY - 65
				end
			
				print("test this game 1")
			
				if system.getInfo( "platformName" ) == "Android" then
					questionText.y = questionText.y + 15
				end
				
			else
				questionText.text = "Put the numbers where they belong."
			
				if (display.pixelHeight == 960) then
					questionText.y = questionText.initY + questionOptions.offsetY + 10 - 25
				else
					questionText.y = questionText.initY - 65
				end
			
				if system.getInfo( "platformName" ) == "Android" then
					questionText.y = questionText.y - 54 -- + 15
				end
			end
			questionText.anchorX = 0.5
			questionText.anchorY = 0.5
			questionText.x = 1000
			questionText.alpha = 1
		
			if (tblPuzzle.imageSet == "Cards") then
				-- cardTrans = transition.to( choicesGroup, { time=700, x=halfW+cardOptions.offsetX, transition=easing.outExpo } )
				-- transition.to( questionText, { time=700, x=halfW, transition=easing.outExpo } )
			end
			-- transition.to( questionTextTwo, { time=700, x=halfW, transition=easing.outExpo } )
		
			
			local function addGameListeners()
				-- bg:removeEventListener("touch", this)
				Runtime:removeEventListener("enterFrame", this)
				-- bg:addEventListener("touch", this)
				Runtime:addEventListener("enterFrame", this)
			end
			timer.performWithDelay( 500, addGameListeners )
		
		end
		
		
	end
	
	local function setUpPuzzle()
	
		
		if (newSlotsPuzzle) then
		else
		
			newSlotsPuzzle = true
	
			
	
			for i = 1, numSlots do
			
				-- local setSlotsScale = gameSlotsPositions[numSlots][randomPosSet][i][4] * slotNumbers[numberOption].scale
				-- print(slotNumbers[numberOption])
				-- print(numberOption)
				-- print(slotNumbers[numberOption].scale)
				-- print(slotOptions[numSlots][2])
				
				local numberOption = numberOptions[i]
				if (numberOption == 0) then
					numberOption = 11
				end
				
				print("Test")
				print(i)
				print(numberOption)
				
				local setSlotsScale
				local slotImage
				
				gameSlots[#gameSlots+1] = display.newGroup()
				
				
				if (tblPuzzle.imageSet == "CardsNum" or tblPuzzle.imageSet == "CardsNumDifficult" or 
						tblPuzzle.imageSet == "CardsPutInOrder" or tblPuzzle.imageSet == "CardsEquation") then
					setSlotsScale = tblCards.scale
				elseif (tblPuzzle.imageSet == "CardsClassic" or tblPuzzle.imageSet == "CardsPutInOrderClassic" or tblPuzzle.imageSet == "CardsPutInOrderClassicDifficult") then
					setSlotsScale = tblCards.scale * 0.95
				elseif (tblPuzzle.imageSet == "Shapes" or tblPuzzle.imageSet == "ShapesDifficult") then
					
					setSlotsScale = shapeSets[numberOption].puzzleSlotsScale * slotOptions[numSlots][2]
				
				elseif (tblPuzzle.imageSet == "Cards") then
					setSlotsScale = 0.8
					
				elseif (tblPuzzle.imageSet == "Num" or tblPuzzle.imageSet == "NumDifficult") then
					setSlotsScale = (slotNumbers[numberOption].scale * slotOptions[numSlots][2]) * 1.15 -- tweak the scale of slot with the 1
				else
				
					setSlotsScale = slotNumbers[numberOption].scale * slotOptions[numSlots][2]
				end
				
				
				if (tblPuzzle.imageSet == "Cards" or tblPuzzle.imageSet == "CardsPutInOrder") then
					slotImage = display.newImageRect("Images/blankCard.png", 108, 132 )
				elseif (tblPuzzle.imageSet == "CardsClassic") then
					slotImage = display.newImageRect("Images/UI/blankCard.png", 65 * 1.2, 79 * 1.2)
				elseif (tblPuzzle.imageSet == "CardsNum" or tblPuzzle.imageSet == "CardsNumDifficult" or 
						tblPuzzle.imageSet == "CardsPutInOrder" or tblPuzzle.imageSet == "CardsPutInOrderClassic" or tblPuzzle.imageSet == "CardsPutInOrderClassicDifficult" or tblPuzzle.imageSet == "CardsEquation") then
					slotImage = display.newImageRect("Images/UI/blankCard.png", 65, 79)
				elseif (tblPuzzle.imageSet == "Shapes" or tblPuzzle.imageSet == "ShapesDifficult") then
					print(shapeSets[numberOptions[i]].image)
					print(shapeSets[numberOptions[i]].w)
					slotImage = display.newImageRect("Images/slot" .. shapeSets[numberOptions[i]].image .. ".png", shapeSets[numberOption].slotW, shapeSets[numberOption].slotH )
				else
					slotImage = display.newImageRect("Images/slot" .. numberOptions[i] .. ".png", slotNumbers[numberOption].w, slotNumbers[numberOption].h )
				end
				
				
					gameSlots[#gameSlots]:insert(slotImage)
				
				
					gameSlots[#gameSlots].xScale, gameSlots[#gameSlots].yScale = setSlotsScale, setSlotsScale
					-- gameSlots[#gameSlots].x = halfW + 90 + gameSlotsPositions[numSlots][randomPosSet][i][1]
					-- gameSlots[#gameSlots].y = halfH + gameSlotsPositions[numSlots][randomPosSet][i][2]
					-- gameSlots[#gameSlots].rotation = gameSlotsPositions[numSlots][randomPosSet][i][3]
				
				if (#gameSlots ~= 1) then
					if (tblPuzzle.imageSet == "Num" or tblPuzzle.imageSet == "NumDifficult") then
						gameSlots[#gameSlots].x = gameSlots[#gameSlots-1].x + (gameSlots[#gameSlots].contentWidth*0.5) + (gameSlots[#gameSlots-1].contentWidth*0.5) + slotOptions[numSlots][1] - 22 -- Tweak spacing between slots
					
					elseif (tblPuzzle.imageSet == "CardsNum" or tblPuzzle.imageSet == "CardsNumDifficult") then
					
						gameSlots[#gameSlots].x = gameSlots[#gameSlots-1].x + (gameSlots[#gameSlots].contentWidth*0.5) + (gameSlots[#gameSlots-1].contentWidth*0.5) + slotOptions[numSlots][1] - 8 - 12
					
					elseif (tblPuzzle.imageSet == "CardsClassic") then
						gameSlots[#gameSlots].x = gameSlots[#gameSlots-1].x + (gameSlots[#gameSlots].contentWidth*0.5) + (gameSlots[#gameSlots-1].contentWidth*0.5) + slotOptions[numSlots][1] + 10
					
					elseif (tblPuzzle.imageSet == "CardsPutInOrderClassic" or tblPuzzle.imageSet == "CardsPutInOrderClassicDifficult") then
						gameSlots[#gameSlots].x = gameSlots[#gameSlots-1].x + (gameSlots[#gameSlots].contentWidth*0.5) + (gameSlots[#gameSlots-1].contentWidth*0.5) + slotOptions[numSlots][1] + 10
					else
						gameSlots[#gameSlots].x = gameSlots[#gameSlots-1].x + (gameSlots[#gameSlots].contentWidth*0.5) + (gameSlots[#gameSlots-1].contentWidth*0.5) + slotOptions[numSlots][1]
					end
				end
				
				gameSlots[#gameSlots].y = halfH + slotYOffset
				
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
				
				
				local randomRewardAnim = math.random( 1, #rewardAnims )
				
				gameSlots[#gameSlots].wiggleAnim = { id = "shake", particles = "", duration = 600, anchor = { 0.5, 0.5 }, particleOffset = { 0, 0 } }
				gameSlots[#gameSlots].finishAnim = rewardAnims[randomRewardAnim]
				slotsGroup:insert( gameSlots[#gameSlots] )
				
				
				if (tblPuzzle.imageSet ~= "Cards" and tblPuzzle.imageSet ~= "CardsClassic" and tblPuzzle.imageSet ~= "CardsPutInOrder" and tblPuzzle.imageSet ~= "CardsEquation") then
				
					if (tblPuzzle.imageSet == "Shapes" or tblPuzzle.imageSet == "ShapesDifficult") then
						gameSlots[#gameSlots].bg = display.newImageRect("Images/puzzle" .. shapeSets[numberOptions[i]].image .. ".png", shapeSets[numberOption].w, shapeSets[numberOption].h )
					elseif (tblPuzzle.imageSet == "CardsNum" or tblPuzzle.imageSet == "CardsNumDifficult" or tblPuzzle.imageSet == "CardsPutInOrderClassic" or tblPuzzle.imageSet == "CardsPutInOrderClassicDifficult") then
						gameSlots[#gameSlots].bg = display.newImageRect("Images/bigBlankCard.png", 155*0.39, 194*0.39)
					else
						gameSlots[#gameSlots].bg = display.newImageRect("Images/puzzle" .. numberOptions[i] .. ".png", sharkNumbers[numberOption].w, sharkNumbers[numberOption].h )
					end
					
					gameSlots[#gameSlots].bg.x, gameSlots[#gameSlots].bg.y = gameSlots[#gameSlots].x, gameSlots[#gameSlots].y
					gameSlots[#gameSlots].bg.xScale, gameSlots[#gameSlots].bg.yScale = gameSlots[#gameSlots].xScale, gameSlots[#gameSlots].yScale
					gameSlots[#gameSlots].bg.initAlpha = 0.075
					gameSlots[#gameSlots].bg:setFillColor( 0, 0, 0 )
					gameSlots[#gameSlots].bg.alpha = 0
					
					
					
					slotsGroup:insert( gameSlots[#gameSlots].bg )
					
					
					if (tblPuzzle.imageSet == "CardsNum" or tblPuzzle.imageSet == "CardsNumDifficult" or tblPuzzle.imageSet == "CardsPutInOrderClassic" or tblPuzzle.imageSet == "CardsPutInOrderClassicDifficult") then
						gameSlots[#gameSlots].bg:toBack()
					end
					
				
				end
				
				
				gameSlots[#gameSlots]:toFront()
				
			end
			
			if (tblPuzzle.imageSet == "Cards") then
				
				local diffCardsX = gameSlots[#gameSlots].x - gameSlots[1].x
				
				gameSlots[#gameSlots+1] = display.newGroup()
			
				local tempSlot1 = display.newImageRect("Images/blankCard.png", 108, 132 )
				local tempSlot2 = display.newImageRect("Images/blankCard.png", 108, 132 )
			
				tempSlot1.x = (diffCardsX*0.5) - 200
				tempSlot2.x = (diffCardsX*0.5) + 200
				tempSlot1.y = gameSlots[1].y
				tempSlot2.y = gameSlots[1].y
				
				tempSlot1.alpha = 0
				tempSlot2.alpha = 0
			
				gameSlots[#gameSlots]:insert( tempSlot1 )
				gameSlots[#gameSlots]:insert( tempSlot2 )
				
			
				slotsGroup:insert( gameSlots[#gameSlots] )
			end
			
			if (tblPuzzle.imageSet ~= "CardsEquation") then
				randomizeTable(numberOptions)
				randomizeTable(numberOptions)
				randomizeTable(numberOptions)
			end
			
			if (numberOptions[1] == gameSlots[1].id and #numberOptions ~= 1) then
				local randomOption = math.random( 2, #numberOptions)
				numberOptions[1], numberOptions[randomOption] = numberOptions[randomOption], numberOptions[1]
			end
			-- if (#numberOptions == 2 and numberOptions[1] == gameSlots[1].id) then
				-- numberOptions[1], numberOptions[2] = numberOptions[2], numberOptions[1]
			-- else
				-- repeat
				
				print("test 1")
			for i = 1, #numberOptions do
				print(numberOptions[i])
			end
				
				if (tblPuzzle.imageSet == "Num" or tblPuzzle.imageSet == "NumDifficult"
						-- tblPuzzle.imageSet == "CardsNum" or tblPuzzle.imageSet == "CardsNumDifficult"
						) then
					randomizeTable(numberOptions)
				end
				-- until numberOptions[1] ~= gameSlots[1].id or #numberOptions == 1 or #numberOptions == 2 and numberOptions[1] == numberOptions[2]
			-- end
			
			print("test 2")
			for i = 1, #numberOptions do
				print(numberOptions[i])
			end
			
			for i = 1, #numberOptions do
				
				-- local randomNumPosition = math.random( 1, #gameNumbersPositions[numSlots][randomPosSet][randomNumSet] )
				
				-- local setNumbersScale = gameNumbersPositions[numSlots][randomPosSet][randomNumSet][randomNumPosition][4] * slotNumbers[numberOption].scale
				
				local numberOption = numberOptions[i]
				if (numberOption == 0) then
					numberOption = 11
				end
				
				local setNumbersScale
				
				
				if (myData.isFireTV and tblPuzzle.imageSet == "CardsNum" or 
						myData.isController and tblPuzzle.imageSet == "CardsNum" or 
						myData.isFireTV and tblPuzzle.imageSet == "CardsNumDifficult" or 
						myData.isController and tblPuzzle.imageSet == "CardsNumDifficult") then
					setNumbersScale = tblCards.scale * 1
				elseif (tblPuzzle.imageSet == "CardsNum" or tblPuzzle.imageSet == "CardsNumDifficult" or tblPuzzle.imageSet == "CardsEquation") then
					setNumbersScale = tblCards.scale * .75
				elseif (tblPuzzle.imageSet == "CardsClassic" or tblPuzzle.imageSet == "CardsPutInOrderClassic" or tblPuzzle.imageSet == "CardsPutInOrderClassicDifficult") then
					setNumbersScale = tblCards.scale * 0.93
				elseif(tblPuzzle.imageSet == "CardsPutInOrder") then
					setNumbersScale = tblCards.scale * .5
				elseif (tblPuzzle.imageSet == "Cards") then
					setNumbersScale = sharkNumbers[numberOption].cScale
					-- setNumbersScale = (slotNumbers[numberOption].scale * choiceOptions[#numberOptions][2]) * sharkNumbers[numberOptions[i]].tScale
				elseif (tblPuzzle.imageSet == "Shapes" or tblPuzzle.imageSet == "ShapesDifficult") then
					setNumbersScale = shapeSets[numberOption].puzzleSlotsScale * choiceOptions[#numberOptions][2]
				elseif (tblPuzzle.imageSet == "Num" or tblPuzzle.imageSet == "NumDifficult") then
					setNumbersScale = (slotNumbers[numberOption].scale * choiceOptions[#numberOptions][2]) * 1.15 -- tweak the scale of choices
					
				else
					setNumbersScale = slotNumbers[numberOption].scale * choiceOptions[#numberOptions][2]
				end
				
				
				
				gameNumbers[#gameNumbers+1] = display.newGroup()
				
				local puzzlePiece
				local puzzleShadow
				
				if (tblPuzzle.imageSet == "CardsClassic" or tblPuzzle.imageSet == "CardsNum" or tblPuzzle.imageSet == "CardsNumDifficult" or 
						tblPuzzle.imageSet == "CardsEquation" or tblPuzzle.imageSet == "CardsPutInOrderClassic" or tblPuzzle.imageSet == "CardsPutInOrderClassicDifficult") then
					
					if (tostring(numberOptions[i]) == "=") then
						puzzlePiece = display.newImageRect("Images/equal.png", 80, 100 )
					elseif (tostring(numberOptions[i]) == "+") then
						puzzlePiece = display.newImageRect("Images/plusCard.png", 80, 100 )
					elseif (tostring(numberOptions[i]) == "-") then
						puzzlePiece = display.newImageRect("Images/minusCard.png", 80, 100 )
					else
						puzzlePiece = dynamicNumberCardSlots( tostring(numberOptions[i]), 1, 1 )
					end
				elseif (tblPuzzle.imageSet == "Shapes" or tblPuzzle.imageSet == "ShapesDifficult") then
					puzzlePiece = display.newImageRect("Images/puzzle" .. shapeSets[numberOptions[i]].image .. ".png", shapeSets[numberOption].w, shapeSets[numberOption].h )
					puzzleShadow = display.newImageRect("Images/puzzle" .. shapeSets[numberOptions[i]].image .. ".png", shapeSets[numberOption].w, shapeSets[numberOption].h )
				else
					puzzlePiece = display.newImageRect("Images/puzzle" .. numberOptions[i] .. ".png", sharkNumbers[numberOption].w, sharkNumbers[numberOption].h )
					puzzleShadow = display.newImageRect("Images/puzzle" .. numberOptions[i] .. ".png", sharkNumbers[numberOption].w, sharkNumbers[numberOption].h )
				end
				
				
				if (puzzleShadow) then
					puzzleShadow:setFillColor( 0 )
					puzzleShadow.alpha = 0
					puzzleShadow.initAlpha = 0.2
					
					puzzleShadow.x = puzzlePiece.x + 1.5
					puzzleShadow.y = puzzlePiece.y + 5
					
					gameNumbers[#gameNumbers]:insert( puzzleShadow )
				end
				
				
				
				gameNumbers[#gameNumbers]:insert( puzzlePiece )
				if (puzzleShadow) then
					gameNumbers[#gameNumbers].shadowImg = puzzleShadow
				end
				
				
				
				gameNumbers[#gameNumbers].anchorChildren = true
				gameNumbers[#gameNumbers].anchorX, gameNumbers[#gameNumbers].anchorY = 0.5, 0.5
				
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
				
				gameNumbers[#gameNumbers].y = halfH + choiceYOffset
				
				if (tblPuzzle.imageSet == "CardsPutInOrderClassic" or tblPuzzle.imageSet == "CardsPutInOrderClassicDifficult") then
					gameNumbers[#gameNumbers].initScale = tblCards.scale * .75
				elseif (
						myData.isFireTV and tblPuzzle.imageSet == "" or 
						myData.isController and tblPuzzle.imageSet == "" or
						myData.isFireTV and tblPuzzle.imageSet == "Num" or 
						myData.isController and tblPuzzle.imageSet == "Num" or
							myData.isFireTV and tblPuzzle.imageSet == "NumDifficult" or
							myData.isController and tblPuzzle.imageSet == "NumDifficult" or
							myData.isFireTV and tblPuzzle.imageSet == "CardsNum" or 
						myData.isController and tblPuzzle.imageSet == "CardsNum" or
							myData.isFireTV and tblPuzzle.imageSet == "CardsNumDifficult" or
							myData.isController and tblPuzzle.imageSet == "CardsNumDifficult" or
							myData.isFireTV and tblPuzzle.imageSet == "CardsPutInOrder" or
							myData.isController and tblPuzzle.imageSet == "CardsPutInOrder") then
					
					gameNumbers[#gameNumbers].initScale = gameNumbers[#gameNumbers].xScale * 0.85
				else
					gameNumbers[#gameNumbers].initScale = gameNumbers[#gameNumbers].xScale
				end
				gameNumbers[#gameNumbers].initX = gameNumbers[#gameNumbers].x
				gameNumbers[#gameNumbers].initY = gameNumbers[#gameNumbers].y
				gameNumbers[#gameNumbers].initR = gameNumbers[#gameNumbers].rotation
				
				gameNumbers[#gameNumbers].origScale = gameNumbers[#gameNumbers].xScale
				
				if (tblPuzzle.imageSet == "CardsPutInOrder") then
					if (numberOption > 9) then
						gameNumbers[#gameNumbers].origScale = tblCards.scale * 0.43
					else
						gameNumbers[#gameNumbers].origScale = tblCards.scale * 0.55
					end
				elseif (tblPuzzle.imageSet == "CardsEquation") then
					gameNumbers[#gameNumbers].origScale = tblCards.scale * 0.8
				else
					gameNumbers[#gameNumbers].origScale = gameNumbers[#gameNumbers].xScale
				end
				gameNumbers[#gameNumbers].popScale = gameNumbers[#gameNumbers].origScale + 0.2
				
				
				gameNumbers[#gameNumbers].id = numberOptions[i]
				
				if (tblPuzzle.imageSet == "CardsEquation" and numSlots == totalNumToPutInSlots) then
				
					local largeNum = 0
					
					for k = 1, #numberOptions do
						if (type(numberOptions[k]) ~= "string" and numberOptions[k] > largeNum) then
							largeNum = numberOptions[k]
						end
					end
					
					for k = 1, #numberOptions do
						if (type(numberOptions[k]) ~= "string" and numberOptions[k] ~= largeNum and numberOptions[k] ~= gameNumbers[#gameNumbers].id) then
							gameNumbers[#gameNumbers].secondID = numberOptions[k]
						end
					end
					
				end
				
				gameNumbers[#gameNumbers].index = #gameNumbers
				gameNumbers[#gameNumbers].inSlot = false
				gameNumbers[#gameNumbers].alpha = 0
				gameNumbers[#gameNumbers].frame = 0
				gameNumbers[#gameNumbers].selected = false
				gameNumbers[#gameNumbers].isDragging = false
				
				gameNumbers[#gameNumbers].startedInSlots = false
				
				
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
			slotsGroup.x, slotsGroup.y = halfW, halfH + slotYOffset
			
			slotsGroupX, slotsGroupY = slotsGroup.x, slotsGroup.y
			
			choicesGroup.anchorChildren = true
			choicesGroup.anchorX, choicesGroup.anchorY = 0.5, 0.5
			choicesGroup.x, choicesGroup.y = halfW, halfH + choiceYOffset
			
			if (tblPuzzle.imageSet ~= "Cards" and tblPuzzle.imageSet ~= "CardsClassic" and tblPuzzle.imageSet ~= "CardsEquation" or 
					tblPuzzle.imageSet == "CardsEquation" and numSlots == totalNumToPutInSlots) then
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
			end
			
			if (tblPuzzle.imageSet ~= "Cards" and tblPuzzle.imageSet ~= "CardsClassic" and tblPuzzle.imageSet ~= "CardsEquation" or 
					tblPuzzle.imageSet == "CardsEquation" and numSlots == totalNumToPutInSlots) then
				slotsGroup:removeSelf()
				slotsGroup = nil
				
				choicesGroup:removeSelf()
				choicesGroup = nil
			end
			
			
			
			for i = #gameNumbers, 1, -1 do
				gameNumbers[i]:toFront()
				
				gameNumbers[i].origContentWidth = gameNumbers[i].contentWidth
				gameNumbers[i].origContentHeight = gameNumbers[i].contentHeight
				
			end
		
		
			if (tblPuzzle.imageSet == "Cards" or tblPuzzle.imageSet == "CardsClassic" or tblPuzzle.imageSet == "CardsEquation" and numSlots ~= totalNumToPutInSlots) then
				gameGroup:insert( slotsGroup )
				gameGroup:insert( choicesGroup )
			end
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
		
            self.isLive = false
			display.getCurrentStage():setFocus(nil)
            
			Runtime:removeEventListener("enterFrame", this)
			bg:removeEventListener("touch", this)
			
			if (myData.isController) then
				Runtime:removeEventListener( "key", puzzleSlotsTap )
				Runtime:removeEventListener( "axis", trackCursorAxisSlots )
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
    -- if (myData.isFireTV or myData.isController and version.appStore ~= "Chrome") then 
    -- else
        transition.to( backButton, { time=700, alpha=1, transition=easing.outExpo } )
		transition.to( instructionsReplayButton, { time=700, alpha=1, transition=easing.outExpo } )
    -- end
    timer.performWithDelay( 550, backButtonTransition )
    
    ----------------------
    return this
end

return M
