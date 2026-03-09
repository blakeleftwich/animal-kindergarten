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
    --local levelDetails = levelDetails["level" .. level]
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
	local tblBasket = gameOptions.questions
	local tblCards = gameOptions.cards
	local gameGroup, gameBasketGroup
	local gameBasketBox, gameBasketBack, gameBasketFront
	local itemStartTouched = false
	local currentItem = 0
	local floaters = {}
	gameImages = {}
	local gameItemNumbers = {}
	local gameNumbers = {}
	local randomNumbers = {}
	local currentCount = 1
	local isEndGame = false
	local closingGame = false
	local floatRangeItem = 1.5
	local gameTime = 0
	local checkTimeNum = 0
	local numRequiredImages = 0
	local currentBasketAnswersNum = 0
	local startRange, endRange = tblCards.startRange, tblCards.endRange
	local numStartRange, numEndRange = tblCards.numStartRange, tblCards.numEndRange
	local numCorrectAnswersMin, numCorrectAnswersMax = tblCards.numCorrectMin, tblCards.numCorrectMax
	local startingBasketYAndroid
	
	
	
	if (prevBasketItems == nil) then
		prevBasketItems = {}
	elseif (question == "basketEvenOdd" and #prevBasketItems >= endRange - startRange + 1 or
			question == "basketGreaterLessThan" and #prevBasketItems >= endRange - startRange + 1 or
		question ~= "basketEvenOdd" and question ~= "basketGreaterLessThan" and #prevBasketItems >= endRange - startRange + 1) then
		for i = #prevBasketItems-2, 1, -1 do
			table.remove( prevBasketItems, i )
		end
	end
	
	local diffRange = endRange - startRange + 1
	
	print("test 1")
	print(#prevBasketItems)
	print(diffRange)
	print(startRange)
	print(endRange)
	
	local repeatednum = false
	repeat
		repeatednum = false
		
		-- if (question == "basketEvenOdd" or question == "basketGreaterLessThan") then
			-- numRequiredImages = math.random( numStartRange, numEndRange )
		-- else
			numRequiredImages = math.random( startRange, endRange )
		-- end
		
		for i = #prevBasketItems, 1, -1 do
			if (prevBasketItems[i] == numRequiredImages) then
				repeatednum = true
			end
		end
		
	until repeatednum == false or #prevBasketItems > diffRange or startRange == endRange
	prevBasketItems[#prevBasketItems+1] = numRequiredImages
	
	print("basket 1")
	
	local showMoreRandom = math.random( 1, 2 )
	-- if (showMoreRandom == 1) then
		-- numImages = numRequiredImages + math.random( 0, 10-numRequiredImages)
		-- checkTimeNum = 500
	-- else
		numImages = numRequiredImages
		checkTimeNum = 0
	-- end
	
	
	
	if (currentImage == nil) then
		currentImage = 0
		randomizeTable( basketItemOptions )
	end
	currentImage = currentImage + 1
	if (currentImage > #basketItemOptions) then
		currentImage = 1
		randomizeTable( basketItemOptions )
	end
	
	local randomBasket = 1
	if (basketItemOptions[currentImage].basket == 0) then
		randomBasket = math.random( 1, #basketOptions )
	else
		for i = 1, #basketOptions do
			if (basketOptions[i].id == basketItemOptions[currentImage].basket) then
				randomBasket = i
				break
			end
		end
	end
	
	
	
	local gameBasketScale = { -- scale, text y offset, basket y offset
		{ 1.5, 0, -20 },
		{ 1.5, 0, -20 },
		{ 1.5, 0, -20 },
		{ 1.5, 0, -20 },
		{ 1.3, 0, -10 },
		{ 1.2, 0, -10 },
		{ 1.2, 0, -10 },
		{ 1.2, 0, -10 },
		{ 1.2, 0, -10 },
		{ 1.2, 0, -10 },
	}
	
	local gameImageScale = { 
		{ 0.6, 0.6 }, 
		{ 0.6, 0.6 }, 
		{ 0.6, 0.6 }, 
		{ 0.57, 0.57 }, 
		{ 0.54, 0.54 }, 
		{ 0.49, 0.49 }, 
		{ 0.45, 0.45 }, 
		{ 0.39, 0.39 }, 
		{ 0.39, 0.39 }, 
		{ 0.39, 0.39 },
	}

	local gameImagePositions = {
	
		-- X offset, Y offset, rotation, if image flip (0 = no, 1 = yes)
	
		{ { { -10, 15, -2, 0 }, }, },
		{ { { -53, math.random(14,18), -5, 0 }, { 53, math.random(13,18), 5, 1 }, },},
		{ { { -105,  math.random(0,20), 9, 0 }, { 95, math.random(0,20), 4, 1 }, { -5,  math.random(8,20), 5, 1 }, },},
		{ { { -150, math.random(0, 20), -3, 0 }, { 36, math.random(5, 20), 0, 1 }, { -57, math.random(0, 20), 3, 1 }, { 129, math.random(5, 20), -2, 0 } },},
		{ { { -180, 35, 3, 1 }, { -16, 29, -4, 0 }, { 150, 35, -2, 1 }, { -99, 5, -3, 0 }, { 67, 8, 2, 1 } }, },
		{ { { -110, 5, 3, 1 }, { -40, 40, -4, 0 }, { 30, 5, -2, 1 }, { 100, 40, -3, 0 }, { -180, 40, 2, 1 }, { 170, 5, -3, 1 } },},
		{ { { -64, 44, -3, 0 }, { -121, -6, 3, 1 }, { -10, -9, 0, 0 }, { 44, 50, -3, 1 }, { 100, -3, 0, 0 }, { -170, 58, 3, 1 }, { 150, 59, -3, 0 } },},
		{ { { -101, -10, 0, 1 }, { -33.5, -8.5, 3, 0 }, { 33.5, -14, -3, 1 }, { 101, -8, 0, 0 }, { -101, 59, -3, 1 }, { -33.5, 60, 0, 0 }, { 33.5, 55.5, 3, 1 }, { 101, 60, -3, 0 } },},
		{ { { -105, -2, -3, 1 }, { -5, 56, 3, 0 }, { 101, -9, -3, 1 }, { -75, 60, 0, 0 }, { 65, 50, -3, 1 }, { -37, -3, 0, 0 }, { 32, -13, 0, 0 }, { -145, 55, -3, 1 }, { 135, 60, 0, 0 } },},
		{ { { -70, -5, 0, 1 }, { 0, -10, 0, 0 }, { 70, -5, 0, 1 }, { -140, -8, 0, 0 }, { 140, -8, 0, 1 }, { -134, 64, 0, 0 }, { 134, 60, 0, 1 }, { -70, 66, 0, 1 }, { 0, 58, 0, 0 }, { 70, 65, 0, 1 } },},
	}
		
	
	
	
	basketItemScale = { 1, 0.7, 0.65, 0.6, 0.58, 0.58, 0.55, 0.5, 0.5, 0.5 } -- iPhone 5 Ratio
	
	function getRandomRotation()
		return math.random(-12,12)
	end
	
	basketItemPositions = {
	
		
		-- 1 card
		{ 
			-- { { 0, -50, getRandomRotation(), 0 }, },  --x,y,rotation
			{ { 0, -45, getRandomRotation(), 0 }, },  --x,y,rotation
		},
		-- 2 cards
		{ 
			-- { { -40, -60, getRandomRotation(), 0 }, { 40, -70, getRandomRotation(), 1 }, },
			-- { { -40, -50, getRandomRotation(), 0 }, { 40, -60, getRandomRotation(), 1 }, },
			{ { -40, -45, getRandomRotation(), 0 }, { 40, -55, getRandomRotation(), 1 }, },
		},
		-- 3 cards
		{ 
			-- { { -52, -65, getRandomRotation(), 0 }, { 52, -60, getRandomRotation(), 1 }, { 0, -80, getRandomRotation(), 1 }, }
			-- { { -52, -55, getRandomRotation(), 0 }, { 52, -50, getRandomRotation(), 1 }, { 0, -70, getRandomRotation(), 1 }, }
			{ { -52, -50, getRandomRotation(), 0 }, { 52, -45, getRandomRotation(), 1 }, { 0, -65, getRandomRotation(), 1 }, }
			
		},
		-- 4 cards
		{ 
			-- { { -55, -50, getRandomRotation(), 0 }, { 20, -70,getRandomRotation(), 1 }, { -30, -80, getRandomRotation(), 1 }, { 55, -60, getRandomRotation(), 0 } },
			-- { { -55, -40, getRandomRotation(), 0 }, { 20, -60,getRandomRotation(), 1 }, { -30, -68, getRandomRotation(), 1 }, { 55, -50, getRandomRotation(), 0 } },
			{ { -55, -35, getRandomRotation(), 0 }, { 20, -55,getRandomRotation(), 1 }, { -30, -65, getRandomRotation(), 1 }, { 55, -45, getRandomRotation(), 0 } },
			
		},
		-- 5 cards
		{
			-- { { -60, -50, getRandomRotation(), 1 }, { -30, -70, getRandomRotation(), 0 }, { 0, -81, getRandomRotation(), 1 }, { 30, -72, getRandomRotation(), 0 }, { 60, -63, getRandomRotation(), 1 } },
			-- { { -60, -36, getRandomRotation(), 1 }, { -30, -56, getRandomRotation(), 0 }, { 0, -64, getRandomRotation(), 1 }, { 30, -58, getRandomRotation(), 0 }, { 60, -49, getRandomRotation(), 1 } },
			{ { -60, -35, getRandomRotation(), 1 }, { -30, -55, getRandomRotation(), 0 }, { 0, -65, getRandomRotation(), 1 }, { 30, -57, getRandomRotation(), 0 }, { 60, -48, getRandomRotation(), 1 } },
			
		},
		-- 6 cards
		{
			-- { { -60, -60, getRandomRotation(), 0 }, { -20, -80, getRandomRotation(), 1 }, { 40, -65, getRandomRotation(), 0 }, { -40, -67, getRandomRotation(), 1 }, { 20, -75, getRandomRotation(), 0 }, { 60, -60, getRandomRotation(), 1 } },
			-- { { -60, -45, getRandomRotation(), 0 }, { -20, -63, getRandomRotation(), 1 }, { 40, -50, getRandomRotation(), 0 }, { -40, -52, getRandomRotation(), 1 }, { 20, -64, getRandomRotation(), 0 }, { 60, -4, getRandomRotation(), 1 } },
			{ { -60, -45, getRandomRotation(), 0 }, { -20, -65, getRandomRotation(), 1 }, { 40, -50, getRandomRotation(), 0 }, { -40, -52, getRandomRotation(), 1 }, { 20, -60, getRandomRotation(), 0 }, { 60, -45, getRandomRotation(), 1 } },
			
		},
		-- 7 cards
		{
			-- { { -60, -60, getRandomRotation(), 0 }, { -45, -70, getRandomRotation(), 1 }, { -30, -65, getRandomRotation(), 0 }, { -10, -80, getRandomRotation(), 1 }, { 25, -70, getRandomRotation(), 0 }, { 40, -60, getRandomRotation(), 1 }, { 60, -55, getRandomRotation(), 0 } }, -- iPhone 5 Ratio
			-- { { -60, -50, getRandomRotation(), 0 }, { -45, -63, getRandomRotation(), 1 }, { -30, -55, getRandomRotation(), 0 }, { -10, -65, getRandomRotation(), 1 }, { 25, -60, getRandomRotation(), 0 }, { 40, -50, getRandomRotation(), 1 }, { 60, -45, getRandomRotation(), 0 } }, -- iPhone 5 Ratio
			{ { -60, -45, getRandomRotation(), 0 }, { -45, -55, getRandomRotation(), 1 }, { -30, -50, getRandomRotation(), 0 }, { -10, -65, getRandomRotation(), 1 }, { 25, -55, getRandomRotation(), 0 }, { 40, -45, getRandomRotation(), 1 }, { 60, -40, getRandomRotation(), 0 } }, -- iPhone 5 Ratio
			
		},
		-- 8 cards
		{
			-- { { -60, -55, getRandomRotation(), 1 }, { -40, -60, getRandomRotation(), 0 }, { -20, -70, getRandomRotation(), 1 }, { -6, -50, getRandomRotation(), 0 }, { 3, -80, getRandomRotation(), 1 }, { 20, -75, getRandomRotation(), 0 }, { 40, -60, getRandomRotation(), 1 }, { 66, -55, getRandomRotation(), 0 } }, -- iPhone 5 Ratio
			-- { { -60, -45, getRandomRotation(), 1 }, { -40, -50, getRandomRotation(), 0 }, { -20, -60, getRandomRotation(), 1 }, { -6, -40, getRandomRotation(), 0 }, { 3, -60, getRandomRotation(), 1 }, { 20, -55, getRandomRotation(), 0 }, { 40, -50, getRandomRotation(), 1 }, { 66, -45, getRandomRotation(), 0 } }, -- iPhone 5 Ratio
			{ { -60, -40, getRandomRotation(), 1 }, { -40, -45, getRandomRotation(), 0 }, { -20, -55, getRandomRotation(), 1 }, { -6, -35, getRandomRotation(), 0 }, { 3, -62, getRandomRotation(), 1 }, { 20, -60, getRandomRotation(), 0 }, { 40, -45, getRandomRotation(), 1 }, { 66, -40, getRandomRotation(), 0 } }, -- iPhone 5 Ratio
			
		},
		-- 9 cards
		{
			-- { { -60, -55, getRandomRotation(), 1 }, { -40, -60, getRandomRotation(), 0 }, { -20, -70, getRandomRotation(), 1 }, { -6, -50, getRandomRotation(), 0 }, { 3, -80, getRandomRotation(), 1 }, { 20, -75, getRandomRotation(), 0 }, { 40, -60, getRandomRotation(), 1 }, { 66, -55, getRandomRotation(), 0 }, { 0, -55, getRandomRotation(), 0 } }, -- iPhone 5 Ratio
			-- { { -60, -45, getRandomRotation(), 1 }, { -40, -50, getRandomRotation(), 0 }, { -20, -60, getRandomRotation(), 1 }, { -6, -40, getRandomRotation(), 0 }, { 3, -63, getRandomRotation(), 1 }, { 20, -61, getRandomRotation(), 0 }, { 40, -50, getRandomRotation(), 1 }, { 66, -45, getRandomRotation(), 0 }, { 0, -45, getRandomRotation(), 0 } }, -- iPhone 5 Ratio
			{ { -60, -40, getRandomRotation(), 1 }, { -40, -45, getRandomRotation(), 0 }, { -20, -55, getRandomRotation(), 1 }, { -6, -35, getRandomRotation(), 0 }, { 3, -60, getRandomRotation(), 1 }, { 20, -55, getRandomRotation(), 0 }, { 40, -45, getRandomRotation(), 1 }, { 66, -40, getRandomRotation(), 0 }, { 0, -40, getRandomRotation(), 0 } }, -- iPhone 5 Ratio
			
		},
		-- 10 cards
		{
			-- { { -60, -55, getRandomRotation(), 1 }, { -40, -60, getRandomRotation(), 0 }, { -20, -70, getRandomRotation(), 1 }, { -6, -50, getRandomRotation(), 0 }, { 3, -80, getRandomRotation(), 1 }, { 20, -75, getRandomRotation(), 0 }, { 40, -60, getRandomRotation(), 1 }, { 66, -55, getRandomRotation(), 0 }, { -15, -55, getRandomRotation(), 0 }, { 15, -55, getRandomRotation(), 0 } }, -- iPhone 5 Ratio 
			-- { { -60, -45, getRandomRotation(), 1 }, { -40, -50, getRandomRotation(), 0 }, { -20, -60, getRandomRotation(), 1 }, { -6, -40, getRandomRotation(), 0 }, { 3, -60, getRandomRotation(), 1 }, { 20, -63, getRandomRotation(), 0 }, { 40, -50, getRandomRotation(), 1 }, { 66, -45, getRandomRotation(), 0 }, { -15, -45, getRandomRotation(), 0 }, { 15, -45, getRandomRotation(), 0 } }, -- iPhone 5 Ratio 
			{ { -60, -40, getRandomRotation(), 1 }, { -40, -45, getRandomRotation(), 0 }, { -20, -55, getRandomRotation(), 1 }, { -6, -35, getRandomRotation(), 0 }, { 3, -60, getRandomRotation(), 1 }, { 20, -58, getRandomRotation(), 0 }, { 40, -45, getRandomRotation(), 1 }, { 66, -40, getRandomRotation(), 0 }, { -15, -40, getRandomRotation(), 0 }, { 15, -40, getRandomRotation(), 0 } }, -- iPhone 5 Ratio 
			
		},
	
	}
	
	
	
	local randomColors = {}
	local randomColor
	for i = 1, basketItemOptions[currentImage].numColors do
	
		randomColors[i] = i
	
	end
	if (#randomColors > 1) then
		randomColor = math.random( 1, #randomColors )
	end
	
	
	
	if (question == "basketEvenOdd") then
	
	
		numEvenOddAnswers = 0
		for i = 1, numImages do
			local tempNum
			local repeatedNum = false
			repeat
				repeatedNum = false
				
				tempNum = math.random(numStartRange, numEndRange)
				
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
				
				if (i == numImages and hasAnAnswer == false) then
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
		
		
		print("basket 2")
	elseif (question == "basketGreaterLessThan") then
	
		repeat
			if (numCorrectAnswersMin == 0 and numCorrectAnswersMax == 0) then
				if (isGreaterLessThan == "greater than") then
					greaterLessThanAnswer = math.random(numStartRange+1, numEndRange-1-numImages)
				else
					greaterLessThanAnswer = math.random(numStartRange+1+numImages, numEndRange-1)
				end
			else
				greaterLessThanAnswer = math.random(numStartRange+1+numImages, numEndRange-1-numImages)
			end
		until prevGreaterLessThanAnswer ~= greaterLessThanAnswer
		
		prevGreaterLessThanAnswer = greaterLessThanAnswer
		
		
		local numCorrect
		
		print("basket crash")
		print(greaterLessThanAnswer)
		print(numImages)
		print(numCorrectAnswersMax)
		
		if (numCorrectAnswersMin == 0 and numCorrectAnswersMax == 0) then
			numCorrect = numImages
		elseif (numImages >= numCorrectAnswersMax) then
			numCorrect = math.random(numCorrectAnswersMin, numCorrectAnswersMax)
		else
			numCorrect = math.random(numCorrectAnswersMin, numImages)
		end
		
		repeat
		
			numGreaterLessThanAnswers = 0
			
			for i = #randomNumbers, 1, -1 do
				randomNumbers[i] = nil
			end
		
			for i = 1, numImages do
				local tempNum
				local repeatedNum = false
				
				
				repeat
					repeatedNum = false
					
					tempNum = math.random(numStartRange, numEndRange)
					
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
					
					if (i == numImages and numGreaterLessThanAnswers < 1) then
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
		
		until numGreaterLessThanAnswers == numCorrect
		
		
	end
	
	
	
	
	
	function readBasketVO(touched)
	
	
		local function basketWiggle()
						
			if (itemStartTouched == false and closingGame == false) then
			
				gameBasketGroup.animationInfo = gameBasketGroup.balloonAnim
				animateStart( gameBasketGroup )
			
			end
			
			local function resetBasketAnchor()
			
				if (itemStartTouched == false and closingGame == false) then
				
					gameBasketGroup.anchorX, gameBasketGroup.anchorY = 0.5, 0.5
					
					gameBasketGroup.x = gameBasketGroup.origX
					gameBasketGroup.y = gameBasketGroup.origY
					
					gameBasketGroup.initX = gameBasketGroup.x
					gameBasketGroup.initY = gameBasketGroup.y
				
				end
				
				makeButtonsActive()
			
			end
			timerNumVO3 = timer.performWithDelay( gameBasketGroup.wiggleAnim.duration + 5, resetBasketAnchor )
		
		end
	
	
		if (question == "basketEvenOdd") then
			if savedData.enableSounds == true then
				if (isEvenOdd == "even") then
					playReservedChannel( putTheEvenNumsIntoTheBasket, 11, 0 )
				else
					playReservedChannel( putTheOddNumsIntoTheBasket, 11, 0 )
				end
					
				-- currentGameChannel = currentGameChannel + 1
				-- if (currentGameChannel > 25) then
					-- currentGameChannel = 20
				-- end
			end
			
		elseif (question == "basketGreaterLessThan") then

			if savedData.enableSounds == true then
			
			
				if (isGreaterLessThan == "greater than") then
					playReservedChannel( putTheNumbersGreaterThan, 11, 0 )
				else
					playReservedChannel( putTheNumbersLessThan, 11, 0 )
				end
					
				-- currentGameChannel = currentGameChannel + 1
				-- if (currentGameChannel > 25) then
					-- currentGameChannel = 20
				-- end
			end
			
		elseif (currentCount == 1 or touched == true) then
			if savedData.enableSounds == true then
				if (myData.isFireTV or myData.isController) then 
					playReservedChannel( putSound, 11, 0 )
				elseif (randomVO == 1 or currentGame == 1) then
					playReservedChannel( canYouDragSound, 11, 0 )
					dragVOChoice = 1
				else
					playReservedChannel( dragSound, 11, 0 )
					dragVOChoice = 2
				end
				-- currentGameChannel = currentGameChannel + 1
				-- if (currentGameChannel > 25) then
					-- currentGameChannel = 20
				-- end
			end
		end
		
		
		local function playItemNumberVO()
	
			print("playItemNum")
	
			if (itemStartTouched == false and closingGame == false or touched == true) then
				if savedData.enableSounds == true then
				
					if (question == "basketGreaterLessThan") then
					
						if (greaterLessThanAnswer <= 100) then
							playReservedChannel( gameNumSounds[greaterLessThanAnswer], 29, 0 )
						else
							local function partFiveAudio()
								local numTemp
								if (greaterLessThanAnswer < 110) then
									numTemp = tonumber( tostring(greaterLessThanAnswer):sub(3, 3) )
								else
									numTemp = tonumber( tostring(greaterLessThanAnswer):sub(2, 3) )
								end
								playReservedChannel(gameNumSounds[ numTemp ], 28, 0)
							end
						
							playReservedChannel(hundredSounds[ tonumber(tostring(greaterLessThanAnswer):sub(1, 1)) ], 29, 0)
						
						
							if (questionAudioTimer) then
								timer.cancel( questionAudioTimer )
								questionAudioTimer = nil
							end
							questionAudioTimer = timer.performWithDelay( 900, partFiveAudio )
							
						end
					
					
					else
				
					-- if (question == "basketGreaterLessThan") then
						-- playReservedChannel( gameNumSounds[greaterLessThanAnswer], currentGameChannel, 0 )
					-- else
						playReservedChannel( gameNumSounds[numRequiredImages], 28, 0 )
					end
					-- currentGameChannel = currentGameChannel + 1
					-- if (currentGameChannel > 25) then
						-- currentGameChannel = 20
					-- end
				end
			end
			
			
			local function playItemNameVO()
				if (currentCount == 1 or touched == true) then
					
					
					if (itemStartTouched == false and closingGame == false or touched == true) then
					
						if savedData.enableSounds == true then
						
							if (question == "basketGreaterLessThan") then
								playReservedChannel( intoTheBasket, 11, 0 )
							else
								if (numRequiredImages > 1) then
									if (basketItemOptions[currentImage].pluralVO) then
										playReservedChannel( gameSounds[basketItemOptions[currentImage].pluralVO], 11, 0 )
									else
										playReservedChannel( gameSounds[basketItemOptions[currentImage].plural], 11, 0 )
									end
								else
									playReservedChannel( gameSounds[basketItemOptions[currentImage].name], 11, 0 )
								end
							end
							-- currentGameChannel = currentGameChannel + 1
							-- if (currentGameChannel > 25) then
								-- currentGameChannel = 20
							-- end
						end
					
					end
					
					
					local function toTheBasketVO()
					
						if (itemStartTouched == false and closingGame == false or touched == true) then
					
							if savedData.enableSounds == true then
					
								if (myData.isFireTV or myData.isController) then
									playReservedChannel( intoTheBasket, 11, 0 )
								elseif (dragVOChoice == 1) then
									if (basketOptions[randomBasket].id == 4) then
										playReservedChannel( toTheHamper2, 11, 0 )
									elseif (basketOptions[randomBasket].id == 5) then
										playReservedChannel( toTheToyBox2, 11, 0 )
									else
										playReservedChannel( toTheBasket2, 11, 0 )
									end
								else
									if (basketOptions[randomBasket].id == 4) then
										playReservedChannel( toTheHamper, 11, 0 )
									elseif (basketOptions[randomBasket].id == 5) then
										playReservedChannel( toTheToyBox, 11, 0 )
									else
										playReservedChannel( toTheBasket, 11, 0 )
									end
								end
								
								-- currentGameChannel = currentGameChannel + 1
								-- if (currentGameChannel > 25) then
									-- currentGameChannel = 20
								-- end
							
							end
						
						end
					
					end
					
					if (question == "basketGreaterLessThan") then
						timerNumVO3 = timer.performWithDelay( 0, basketWiggle )
					else
						timerNumVO2 = timer.performWithDelay( 850 + basketItemOptions[currentImage].delayVO, toTheBasketVO )
						
						timerNumVO3 = timer.performWithDelay( 1100, basketWiggle )
					end
					
				end
			end
			
			if (question == "basketGreaterLessThan" and greaterLessThanAnswer > 100) then
				timerNumVO = timer.performWithDelay( 2000, playItemNameVO )
			else
				timerNumVO = timer.performWithDelay( 750, playItemNameVO )
			end
		
		end
		
		
		if (question == "basketEvenOdd") then
			timerNumVO3 = timer.performWithDelay( 1700, basketWiggle )
		else
			if (question == "basketGreaterLessThan") then
				timerNumVO = timer.performWithDelay( 1600, playItemNumberVO )
			elseif (myData.isFireTV or myData.isController) then 
				timerNumVO = timer.performWithDelay( 400, playItemNumberVO )
			elseif (dragVOChoice == 1) then
				timerNumVO = timer.performWithDelay( 750, playItemNumberVO )
			else
				timerNumVO = timer.performWithDelay( 650, playItemNumberVO )
			end
		end
	
	end
	
	---------------------------------------    
    -- update function
    ---------------------------------------  
	function this.enterFrame(e)
	
		if (gameImages) then
			for i = 1, #gameImages do
				gameImages[i].isFloating = false
			end
		end
		
		if (floaters) then
			for k = #floaters, 1, -1 do
				for i = 1, #gameImages do

					if (floaters[k] == gameImages[i].id) then
						gameImages[i].frame = gameImages[i].frame + 1
						gameImages[i].y =  gameImages[i].initY + floatRangeItem * math.sin(gameImages[i].frame/30)
						gameImages[i].isFloating = true
					end
					
				end
			end
		end
		
		if (currentItem and currentItem ~= 0) then
			if system.getInfo("model") == "iPad" then
				currentItem.x = (currentItemX - currentItem.x) * .25 + currentItem.x 
				currentItem.y = (currentItemY - currentItem.y) * .25 + currentItem.y	
			elseif (display.pixelHeight == 960) then
				currentItem.x = (currentItemX - currentItem.x) * .25 + currentItem.x
				currentItem.y = (currentItemY - currentItem.y) * .25 + currentItem.y
			else
				currentItem.x = ((currentItemX - currentItem.x) * .25 + currentItem.x) - 8.2
				currentItem.y = ((currentItemY - currentItem.y) * .25 + currentItem.y)
			end
		end
		
		
		if (gameBasketGroup and gameBasketFront) then
		
			local basketBackX, basketBackY = gameBasketBack:localToContent( 0, 0 )
		
			-- if system.getInfo("model") == "iPad" then
				-- gameBasketFront.x = basketBackX
				-- gameBasketFront.y = basketBackY
			-- elseif (display.pixelHeight == 960) then
				gameBasketFront.x = basketBackX
				gameBasketFront.y = basketBackY
			-- else
				-- gameBasketFront.x = basketBackX - 34.5
				-- gameBasketFront.y = basketBackY + 0.6
			-- end
			
			gameBasketFront.rotation = gameBasketGroup.rotation
			gameBasketFront.xScale = gameBasketGroup.xScale
			gameBasketFront.yScale = gameBasketGroup.yScale
			
			--gameBasketNum.y = gameBasketFront.y
			if (system.getInfo( "platformName" ) == "Android"  ) then
				if (gameBasketNum) then
					if (question == "basketEvenOdd") then
						gameBasketNum.y = 25-145+gameBasketScale[numImages][2] + 25
					end
				end
			end
			
			if (gameNumbers) then
				for i = #gameNumbers, 1, -1 do
					gameNumbers[i].x = gameBasketFront.x + 4
					gameNumbers[i].y = gameBasketFront.y + ((25+gameBasketScale[numImages][2])*gameBasketFront.yScale)
					
					if (system.getInfo( "platformName" ) == "Android"  ) then
						gameNumbers[i].y = gameBasketFront.y + ((25-145+gameBasketScale[numImages][2])*gameBasketFront.yScale)
					end
					
					gameNumbers[i].rotation = gameBasketFront.rotation
					gameNumbers[i].xScale = gameBasketFront.xScale/1.4
					gameNumbers[i].yScale = gameBasketFront.yScale/1.4
				end
			end
			
		end
		

		-- gameTime = gameTime + 1
		-- if (gameTime > playInstructionsTime) then
			-- if (currentItem == 0 or currentItem == nil) then
				-- if (isEndGame == false or isEndGame == nil) then
					-- startInstructions()
				-- end
			-- end
			-- gameTime = 0
		-- end
	
	end
    
	
	
	
	local function squashBasket()

		print("squash basket")
		isEndGame = true
		
		if (system.getInfo( "platformName" ) == "Android"  ) then
			gameBasketGroup.origY = gameBasketGroup.initY
		end
		
		resetItemAnim( gameBasketGroup )
		
		for m = #gameImages, 1, -1 do
			if (gameImages[m].inBasket ~= true) then
				transition.to( gameImages[m], { time=500 , alpha = 0, transition=easing.outExpo} )
			end
		end

		
		gameBasketGroup.anchorY = 1

		local anchorYDiff
		if (gameBasketGroup.anchorY < 0.5) then
			anchorYDiff = (gameBasketGroup.contentHeight*0.5) - (gameBasketGroup.contentHeight*gameBasketGroup.anchorY)
			gameBasketGroup.y = gameBasketGroup.origY +  (gameBasketGroup.contentHeight*0.5)
		else
			anchorYDiff = (gameBasketGroup.contentHeight*gameBasketGroup.anchorY) - (gameBasketGroup.contentHeight*0.5)
			gameBasketGroup.y = gameBasketGroup.origY + anchorYDiff
		end
		
		
		gameBasketGroup.initX = gameBasketGroup.x
		gameBasketGroup.initY = gameBasketGroup.y
		

		transition.to( gameBasketGroup, { time=200, xScale = gameBasketGroup.origScale + (gameBasketGroup.origScale*0.2), yScale = gameBasketGroup.origScale * 0.8 } )
		

		local function basketBounceUp()
		
		
			gameBasketGroup.anchorX, gameBasketGroup.anchorY = 0.5, 0.5
			
			gameBasketGroup.x = gameBasketGroup.origX
			gameBasketGroup.y = gameBasketGroup.origY
			
			gameBasketGroup.initX = gameBasketGroup.x
			gameBasketGroup.initY = gameBasketGroup.y
			
			local newX
			
			-- if system.getInfo("model") == "iPad" then
				-- newX = halfW + 10
				-- newY = halfH + 30
			-- elseif (display.pixelHeight == 960) then
				newX = halfW
				newY = halfH - 20
			-- else
				-- newX = halfW + 10
				-- newY = halfH + 30
			-- end
			
			if (system.getInfo( "platformName" ) == "Android"  ) then
				if (question == "basketEvenOdd") then
					newY = halfH - 75 - 25
				elseif (question == "basketGreaterLessThan") then
					newY = halfH - 75 - 15
				else
					newY = halfH - 75 + 45
				end
			end
			
			local halfBasketY = gameBasketGroup.y - halfH
			transition.to( gameBasketGroup, { time=100, xScale = gameBasketGroup.origScale*0.9, yScale = gameBasketGroup.origScale + (gameBasketGroup.origScale * 0.1), y = halfH + halfBasketY } )
			transition.to( gameBasketGroup, { delay = 100, time=100, xScale = gameBasketGroup.bounceScale, yScale = gameBasketGroup.bounceScale, x = newX, y = newY } )

			
			
			local function playRewardVO()
				
				-- if savedData.enableSounds == true then
					-- playReservedChannel(shortClapSound, currOtherMainChannel, 0)
					-- currOtherMainChannel = currOtherMainChannel + 1
					-- if (currOtherMainChannel > 17) then
						-- currOtherMainChannel = 15
					-- end
				-- end
		
				-- if (basketItemOptions[currentImage].sound) then
					-- playReservedChannel( gameSounds[basketItemOptions[currentImage].sound], sAudio.gameReward.c, sAudio.gameReward.l, "sound" )
				-- else
				
					-- local randomRewardVO = math.random( 1, #randomRewardSounds )
					
					-- playReservedChannel( gameSounds[randomRewardSounds[randomRewardVO]], sAudio.gameReward.c, sAudio.gameReward.l, "sound" )
				
				-- end
				
				-- if (basketItemOptions[currentImage].soundTwo) then
					-- playReservedChannel( gameSounds[basketItemOptions[currentImage].soundTwo], sAudio.gameReward2.c, sAudio.gameReward2.l, "sound" )
				-- end
				
				if (basketItemOptions[currentImage].sound) then
				
					print("test basket")
					print(basketItemOptions[currentImage].sound)
					playReservedChannel( gameSounds[basketItemOptions[currentImage].sound], currentGameChannel, 0 )
				-- else
				
					-- local randomRewardVO = math.random( 1, #randomRewardSounds )
					
					-- playReservedChannel( gameSounds[randomRewardSounds[randomRewardVO]],currentGameChannel, 0 )
				
				end
				currentGameChannel = currentGameChannel + 1
				if (currentGameChannel > 25) then
					currentGameChannel = 20
				end
				
				
				if (basketItemOptions[currentImage].soundTwo) then
					playReservedChannel( gameSounds[basketItemOptions[currentImage].soundTwo], currentGameChannel, 0 )
					currentGameChannel = currentGameChannel + 1
					if (currentGameChannel > 25) then
						currentGameChannel = 20
					end
				end
				
				
				gameBasketGroup.initScale = gameBasketGroup.xScale
				gameBasketGroup.initX = gameBasketGroup.x
				gameBasketGroup.initY = gameBasketGroup.y
				gameBasketGroup.initR = gameBasketGroup.rotation
				
				gameBasketFront.initScale = gameBasketFront.xScale
				gameBasketFront.initX = gameBasketFront.x
				gameBasketFront.initY = gameBasketFront.y
				gameBasketFront.initR = gameBasketFront.rotation
				
				
				
				gameBasketGroup.animationInfo = basketItemOptions[currentImage].animation
				gameBasketFront.animationInfo = basketItemOptions[currentImage].animation
				
				
				if (gameBasketGroup.animation) then
				else
				
					gameBasketNum.alpha = 1
				
					for i = #gameNumbers, 1, -1 do
						gameNumbers[i].alpha = 0
						-- if (gameNumbers[i].alpha > 0) then
							-- gameNumbers[i].initScale = gameNumbers[i].xScale
							-- gameNumbers[i].initX = gameNumbers[i].x
							-- gameNumbers[i].initY = gameNumbers[i].y
							-- gameNumbers[i].initR = gameNumbers[i].rotation
							
							-- gameNumbers[i].animationInfo = basketItemOptions[currentImage].animation
							
							-- animateStart( gameNumbers[i] )
						-- end
					end
					
					animateStart( gameBasketGroup )
					animateStart( gameBasketFront )
				end
				
				local function hideGameScreen()
				
					if savedData.enableSounds == true then
						playReservedChannel(shortClapSound, currOtherMainChannel, 0)
						currOtherMainChannel = currOtherMainChannel + 1
						if (currOtherMainChannel > 17) then
							currOtherMainChannel = 15
						end
					end
				
					transition.to( gameGroup, { time=700, alpha=0, transition=easing.outExpo } )
					timer.performWithDelay( 300, goodJobSequence ) -- was 0
				end
				rewardTimer = timer.performWithDelay( 1000, hideGameScreen )
				
			
			end
			


			local function playTotalCountVO()
		
				if savedData.enableSounds == true then
					if (question == "basketEvenOdd" or question == "basketGreaterLessThan") then
						-- playReservedChannel( gameNumSounds[greaterLessThanAnswer], currentGameChannel, 0 )
					else
						playReservedChannel( gameNumSounds[numRequiredImages], currentGameChannel, 0 )
					end
					currentGameChannel = currentGameChannel + 1
					if (currentGameChannel > 25) then
						currentGameChannel = 20
					end
				end
				
				local function playItemNameVO()
				
					if savedData.enableSounds == true then
						-- if (numRequiredImages > 1) then
							-- playReservedChannel( gameSounds[basketItemOptions[currentImage].id], currentGameChannel, 0 )
						-- else
							-- playReservedChannel( gameSoundsSingular[basketItemOptions[currentImage].id], currentGameChannel, 0 )
						-- end
						
						if (question == "basketEvenOdd" or question == "basketGreaterLessThan") then
						elseif (numRequiredImages > 1) then
							if (basketItemOptions[currentImage].pluralVO) then
								playReservedChannel( gameSounds[basketItemOptions[currentImage].pluralVO], currentGameChannel, 0 )
							else
								playReservedChannel( gameSounds[basketItemOptions[currentImage].plural], currentGameChannel, 0 )
							end
						else
							playReservedChannel( gameSounds[basketItemOptions[currentImage].name], currentGameChannel, 0 )
						end
						
						currentGameChannel = currentGameChannel + 1
						if (currentGameChannel > 25) then
							currentGameChannel = 20
						end
					end
				
				
					local function playRewardVO()
				
						-- if savedData.enableSounds == true then
							-- playReservedChannel(shortClapSound, currOtherMainChannel, 0)
							-- currOtherMainChannel = currOtherMainChannel + 1
							-- if (currOtherMainChannel > 17) then
								-- currOtherMainChannel = 15
							-- end
						-- end
				
						-- if (basketItemOptions[currentImage].sound) then
							-- playReservedChannel( gameSounds[basketItemOptions[currentImage].sound], sAudio.gameReward.c, sAudio.gameReward.l, "sound" )
						-- else
						
							-- local randomRewardVO = math.random( 1, #randomRewardSounds )
							
							-- playReservedChannel( gameSounds[randomRewardSounds[randomRewardVO]], sAudio.gameReward.c, sAudio.gameReward.l, "sound" )
						
						-- end
						
						-- if (basketItemOptions[currentImage].soundTwo) then
							-- playReservedChannel( gameSounds[basketItemOptions[currentImage].soundTwo], sAudio.gameReward2.c, sAudio.gameReward2.l, "sound" )
						-- end
						
						if (basketItemOptions[currentImage].sound) then
							playReservedChannel( gameSounds[basketItemOptions[currentImage].sound], currentGameChannel, 0 )
						-- else
						
							-- local randomRewardVO = math.random( 1, #randomRewardSounds )
							
							-- playReservedChannel( gameSounds[randomRewardSounds[randomRewardVO]],currentGameChannel, 0 )
						
						end
						currentGameChannel = currentGameChannel + 1
						if (currentGameChannel > 25) then
							currentGameChannel = 20
						end
						
						
						if (basketItemOptions[currentImage].soundTwo) then
							playReservedChannel( gameSounds[basketItemOptions[currentImage].soundTwo], currentGameChannel, 0 )
							currentGameChannel = currentGameChannel + 1
							if (currentGameChannel > 25) then
								currentGameChannel = 20
							end
						end
						
						
						gameBasketGroup.initScale = gameBasketGroup.xScale
						gameBasketGroup.initX = gameBasketGroup.x
						gameBasketGroup.initY = gameBasketGroup.y
						gameBasketGroup.initR = gameBasketGroup.rotation
						
						gameBasketFront.initScale = gameBasketFront.xScale
						gameBasketFront.initX = gameBasketFront.x
						gameBasketFront.initY = gameBasketFront.y
						gameBasketFront.initR = gameBasketFront.rotation
						
						
						
						gameBasketGroup.animationInfo = basketItemOptions[currentImage].animation
						gameBasketFront.animationInfo = basketItemOptions[currentImage].animation
						
						
						if (gameBasketGroup.animation) then
						else
						
							gameBasketNum.alpha = 1
						
							for i = #gameNumbers, 1, -1 do
								gameNumbers[i].alpha = 0
								-- if (gameNumbers[i].alpha > 0) then
									-- gameNumbers[i].initScale = gameNumbers[i].xScale
									-- gameNumbers[i].initX = gameNumbers[i].x
									-- gameNumbers[i].initY = gameNumbers[i].y
									-- gameNumbers[i].initR = gameNumbers[i].rotation
									
									-- gameNumbers[i].animationInfo = basketItemOptions[currentImage].animation
									
									-- animateStart( gameNumbers[i] )
								-- end
							end
							
							animateStart( gameBasketGroup )
							animateStart( gameBasketFront )
						end
						
						local function hideGameScreen()
						
							if savedData.enableSounds == true then
								playReservedChannel(shortClapSound, currOtherMainChannel, 0)
								currOtherMainChannel = currOtherMainChannel + 1
								if (currOtherMainChannel > 17) then
									currOtherMainChannel = 15
								end
							end
						
							transition.to( gameGroup, { time=700, alpha=0, transition=easing.outExpo } )
							timer.performWithDelay( 0, goodJobSequence )
						end
						rewardTimer = timer.performWithDelay( 1000, hideGameScreen )
						
					
					end
					
					rewardTimer = timer.performWithDelay( 1300, playRewardVO )
					
					
					
					
					
				
				end
				rewardTimer = timer.performWithDelay( 550, playItemNameVO )
				
			end
			
			
			if (question == "basketEvenOdd" or question == "basketGreaterLessThan") then
				rewardTimer = timer.performWithDelay( 1150, playRewardVO )
			else
				rewardTimer = timer.performWithDelay( 500, playTotalCountVO )
			end
		
		
		end
		
		rewardTimer = timer.performWithDelay( 200, basketBounceUp )
		
	end
	
    ---------------------------------------    
    -- touch function
    ---------------------------------------    
	
	local function numberButtonTouched( event )


		local target = event.target
		local keyName = event.keyName
		
		if (target == nil) then
			target = targetCard
		end

		if (buttonsActive == true) then
			
			if (event.phase == "began") then
	
			end
	
		end
	
	end
	
	
	local function moveCurrentItemToBasket( currentItem )
		
		print("Test basket touch")
		
		if (timerNumVO) then
			timer.cancel( timerNumVO )
			timerNumVO = nil
		end
		if (timerNumVO2) then
			timer.cancel( timerNumVO2 )
			timerNumVO2 = nil
		end
		if (timerNumVO3) then
			timer.cancel( timerNumVO3 )
			timerNumVO3 = nil
		end
		
		if (gameBasketGroup.animation) then
			resetItemAnim( gameBasketGroup )
		end
	
		for k = #floaters, 1, -1 do
			if (floaters[k] == currentItem.id) then
				currentItem.bounceY = currentItem.y
				table.remove( floaters, k )
			end
		end
	
		if (checkTimer) then
			timer.cancel( checkTimer )
			checkTimer = nil
		end
		
		gameBasketGroup:toFront()
		currentItem:toFront()
		gameBasketFront:toFront()
		for i = #gameNumbers, 1, -1 do
			if (question ~= "basketEvenOdd") then
				gameNumbers[i]:toFront()
			end
		end
	
	
		
		
		if (currentCount == numRequiredImages+1 and isEndGame == false) then
		
			gameBasketBox:removeEventListener("touch", numberButtonTouched)
			bg:removeEventListener("touch", this)

		
			currentItem.inBasket = false
			isEndGame = true
			
			if (checkTimer) then
				timer.cancel( checkTimer )
				checkTimer = nil
			end
		
			local function resetItem( obj )
		
				rewardTimer = timer.performWithDelay( 1000, squashBasket )
				
			end
			transition.to( currentItem, { time=300 , x = currentItem.initX, y = currentItem.initY, transition=easing.outExpo, onComplete = resetItem } )
		
		
		else
		
			currentItem.inBasket = true
			
			currentBasketAnswersNum = currentBasketAnswersNum + 1
			
			local randomBasketPos = math.random( 1, #basketItemPositions[numImages][1] )
			
		
			local function endTransToBasket()
			
				
				gameBasketGroup:insert( currentItem )
				
				if (system.getInfo( "platformName" ) == "Android"  ) then
					if (question == "basketEvenOdd" or question == "basketGreaterLessThan") then
						gameBasketGroup.y = gameBasketGroup.origY - 45
					-- else
						-- gameBasketGroup.y = gameBasketGroup.origY - 45
					end
					gameBasketGroup.initY = gameBasketGroup.y
				end
				
				if (question == "basketEvenOdd" or question == "basketGreaterLessThan") then
					for i = #gameNumbers, 1, -1 do
						if (gameNumbers[i]) then
							if (question ~= "basketEvenOdd") then
								gameNumbers[i]:toFront()
							end
						end
					end
				else
				
					for i = #gameNumbers, 1, -1 do
						if (gameNumbers[i]) then
							gameNumbers[i].alpha = 0
						end
					end
					
					if (gameNumbers[currentCount-1] and gameBasketFront) then
						gameNumbers[currentCount-1].x = gameBasketFront.x
						gameNumbers[currentCount-1].y = gameBasketFront.y + ((37+gameBasketScale[numImages][2])*gameBasketFront.yScale)
						
						if (system.getInfo( "platformName" ) == "Android"  ) then
							gameNumbers[currentCount-1].y = gameBasketFront.y + ((37-145+gameBasketScale[numImages][2])*gameBasketFront.yScale)
						end
						
						if (question ~= "basketEvenOdd") then
							gameNumbers[currentCount-1].alpha = 1
						end
					end
				
				end
				
				
				
				currentItem.xScale, currentItem.yScale = basketItemScale[numImages], basketItemScale[numImages]
				currentItem.x = gameBasketBack.x + basketItemPositions[numImages][1][randomBasketPos][1]
				currentItem.y = gameBasketBack.y + basketItemPositions[numImages][1][randomBasketPos][2]
				currentItem.rotation = basketItemPositions[numImages][1][randomBasketPos][3]
				
				table.remove( basketItemPositions[numImages][1], randomBasketPos )
				
				if (question ~= "basketEvenOdd" and gameNumbers[currentCount-1]) then
					gameNumbers[currentCount-1]:toFront()
				end
				
				if savedData.enableSounds == true then
				
					if (question ~= "basketEvenOdd" and question ~= "basketGreaterLessThan" and currentCount-1 <= 100) then
						playReservedChannel( gameNumSounds[currentCount-1], 29, 0 )
					elseif (question == "basketEvenOdd" and currentItem.answerID <= 100 or
							question == "basketGreaterLessThan" and currentItem.answerID <= 100) then
						playReservedChannel( gameNumSounds[currentItem.answerID], 29, 0 )
					else
					
						local tempCurrentCount = currentCount-1
						
						if (question == "basketEvenOdd" or question == "basketGreaterLessThan") then
							tempCurrentCount = currentItem.answerID
						end
					
						local function partFiveAudio()
							local numTemp
							if (tempCurrentCount < 110) then
								numTemp = tonumber( tostring(tempCurrentCount):sub(3, 3) )
							else
								numTemp = tonumber( tostring(tempCurrentCount):sub(2, 3) )
							end
							playReservedChannel(gameNumSounds[ numTemp ], 28, 0)
						end
						
					
						playReservedChannel(hundredSounds[ tonumber(tostring(tempCurrentCount):sub(1, 1)) ], 29, 0)
					
					
						if (questionAudioTimer) then
							timer.cancel( questionAudioTimer )
							questionAudioTimer = nil
						end
						questionAudioTimer = timer.performWithDelay( 900, partFiveAudio )
						
					end
				
					-- playReservedChannel( gameNumSounds[currentCount-1], currentGameChannel, 0 )
					currentGameChannel = currentGameChannel + 1
					if (currentGameChannel > 25) then
						currentGameChannel = 20
					end
				end
				
				-- if (isEndGame == false) then
					gameBasketGroup.animationInfo = gameBasketGroup.balloonAnim
					animateStart( gameBasketGroup )
				-- end

			end
			
			
			local newX, newY = gameBasketFront.x, gameBasketFront.y + basketItemPositions[numImages][1][randomBasketPos][2]
			local newScaleX, newScaleY = gameBasketGroup.xScale * basketItemScale[numImages], gameBasketGroup.yScale * basketItemScale[numImages]
			local newRotation = basketItemPositions[numImages][1][randomBasketPos][3]
			
			transition.to( currentItem, { time=300 , x = newX, y = newY, xScale = newScaleX, yScale = newScaleY, rotation = newRotation, transition=easing.outExpo, onComplete = endTransToBasket } )
			
			
			
		end
	
	
	
		local function checkCounting()
		
			currentCount = currentCount + 1
			
			if (question == "basketEvenOdd" and currentBasketAnswersNum >= numEvenOddAnswers or
					question == "basketGreaterLessThan" and currentBasketAnswersNum >= numGreaterLessThanAnswers or
					question ~= "basketEvenOdd" and question ~= "basketGreaterLessThan" and currentCount > numRequiredImages) then
					
			
			-- if (currentCount > numRequiredImages) then
			
				if (myData.isFireTV or myData.isController) then 
					transition.to( cursor, { time=100, alpha=0 } )
					buttonsActive = false
				end
			
				local function checkTime()
				
					if (isEndGame == false) then
				
						if (checkTimer) then
							timer.cancel( checkTimer )
							checkTimer = nil
						end
						
						gameBasketBox:removeEventListener("touch", numberButtonTouched)
						bg:removeEventListener("touch", this)

						isEndGame = true
				
						rewardTimer = timer.performWithDelay( 1000, squashBasket )
					
					end
					
				end
				
				if (question == "basketEvenOdd" and currentBasketAnswersNum >= numEvenOddAnswers or
					question == "basketGreaterLessThan" and currentBasketAnswersNum >= numGreaterLessThanAnswers or
					question ~= "basketEvenOdd" and question ~= "basketGreaterLessThan" and currentCount > numImages) then
					
				-- if (currentCount > numImages) then
					checkTime()
				elseif (currentCount-1 == numRequiredImages) then
					timer.performWithDelay( 200, makeButtonsActive )
					
					if (checkTimer) then
						timer.cancel( checkTimer )
						checkTimer = nil
					end
					checkTimer = timer.performWithDelay( 200 + checkTimeNum, checkTime )
				end
				
			else
			
				-- local repeated = false
				-- repeat
					-- repeated = false
					
					-- currentCardSelected = math.random( 1, #gameImages)
					
					-- if (gameImages[currentCardSelected].inBasket == true) then
						-- repeated = true
					-- end
				-- until repeated == false
				
				-- currentCardSelected = currentCardSelected + 1
				-- targetCard = gameImages[currentCardSelected]
				
				
				local function showCursor()

					cursor.xScale = cardOptions.scale -- Hand Cursor
					cursor.yScale = cardOptions.scale
					cursor:toFront()
					
					currentCardSelected = 1
					
					if (gameImages and #gameImages > 0) then
						for i = 1, #gameImages do
							if (gameImages[i].inBasket == false) then
								currentCardSelected = i
							end
						end
						for i = 1, #gameImages do
							if (gameImages[i].x < gameImages[currentCardSelected].x and gameImages[i].inBasket == false) then
								currentCardSelected = i
							end
						end
						
						if system.getInfo( "platformName" ) == "Android" then
						
							if (question == "basketEvenOdd" and #gameImages <= 3) then
							
								cursor.x, cursor.y = gameImages[currentCardSelected]:localToContent( (gameImages[currentCardSelected].contentWidth*0.8), (gameImages[currentCardSelected].contentHeight*0.8) - 150 )
							elseif (question == "basketEvenOdd" and #gameImages == 4) then
								cursor.x, cursor.y = gameImages[currentCardSelected]:localToContent( (gameImages[currentCardSelected].contentWidth*0.8), (gameImages[currentCardSelected].contentHeight*0.8) - 140 )
							elseif (question == "basketEvenOdd" and #gameImages == 5) then
								cursor.x, cursor.y = gameImages[currentCardSelected]:localToContent( (gameImages[currentCardSelected].contentWidth*0.8), (gameImages[currentCardSelected].contentHeight*0.8) - 135 )
							elseif (question == "basketEvenOdd" and #gameImages == 6) then
								cursor.x, cursor.y = gameImages[currentCardSelected]:localToContent( (gameImages[currentCardSelected].contentWidth*0.8), (gameImages[currentCardSelected].contentHeight*0.8) - 115 )
							elseif (question == "basketEvenOdd" and #gameImages == 7) then
								cursor.x, cursor.y = gameImages[currentCardSelected]:localToContent( (gameImages[currentCardSelected].contentWidth*0.8), (gameImages[currentCardSelected].contentHeight*0.8) - 105 )
							elseif (question == "basketEvenOdd" and #gameImages == 8) then
								cursor.x, cursor.y = gameImages[currentCardSelected]:localToContent( (gameImages[currentCardSelected].contentWidth*0.8), (gameImages[currentCardSelected].contentHeight*0.8) - 87 )
							elseif (question == "basketEvenOdd" and #gameImages == 9) then
								cursor.x, cursor.y = gameImages[currentCardSelected]:localToContent( (gameImages[currentCardSelected].contentWidth*0.8), (gameImages[currentCardSelected].contentHeight*0.8) - 80 )
					
							elseif (question == "basketEvenOdd" or question == "basketGreaterLessThan") then
								cursor.x, cursor.y = gameImages[currentCardSelected]:localToContent( (gameImages[currentCardSelected].contentWidth*0.8), (gameImages[currentCardSelected].contentHeight*0.8) - 100 )
							else
								if (basketItemOptions[currentImage].id == "heartCount" or basketItemOptions[currentImage].id == "starCount" or basketItemOptions[currentImage].id == "raspberry" or basketItemOptions[currentImage].id == "basketStrawberry" or basketItemOptions[currentImage].id == "watermelon") then
									cursor.x, cursor.y = gameImages[currentCardSelected]:localToContent( gameImages[currentCardSelected].contentWidth*0.6, gameImages[currentCardSelected].contentHeight*0.6 )
								else
									cursor.x, cursor.y = gameImages[currentCardSelected]:localToContent( (gameImages[currentCardSelected].contentWidth*0.8), (gameImages[currentCardSelected].contentHeight*0.8) )
								end
							end
						else
							if (basketItemOptions[currentImage].id == "heartCount" or basketItemOptions[currentImage].id == "starCount" or basketItemOptions[currentImage].id == "raspberry" or basketItemOptions[currentImage].id == "basketStrawberry" or basketItemOptions[currentImage].id == "watermelon") then
								cursor.x, cursor.y = gameImages[currentCardSelected]:localToContent( gameImages[currentCardSelected].contentWidth*0.6, gameImages[currentCardSelected].contentHeight*0.6 )
							else
								cursor.x, cursor.y = gameImages[currentCardSelected]:localToContent( gameImages[currentCardSelected].contentWidth*0.8, gameImages[currentCardSelected].contentHeight*0.8 )
							end
						end
					
						targetCard = gameImages[currentCardSelected]
						-- cursorTransition = transition.to( cursor, { time=700, alpha=1 } )
					
					end
					
				end
				

				cursorTransition = timer.performWithDelay( 0, showCursor ) -- 700
				
				
				
				timer.performWithDelay( 310, makeButtonsActive ) -- 200
			end
			
		end
		timer.performWithDelay( 0, checkCounting ) -- 330
	
	end
	
	
    function this:touch(event)
        if not self.isLive or not self.isTouchEnable then return end

        local target = event.target
		
		gameTime = 0
        -- Key pressed --
        if(event.phase == "began") then
            display.getCurrentStage():setFocus(target)
            target._isFocus = true
            
			
			
			if (itemStartTouched == false) then
				gameBasketGroup.anchorX, gameBasketGroup.anchorY = 0.5, 0.5
				
				gameBasketGroup.x = gameBasketGroup.origX
				gameBasketGroup.y = gameBasketGroup.origY
				
				gameBasketGroup.initX = gameBasketGroup.x
				gameBasketGroup.initY = gameBasketGroup.y
				
			end
			
			basketStartTouch = true
			
			beganTouchX = event.x
			beganTouchY = event.y
			
			if (currentItem == 0) then
			
				for i = #gameImages, 1, -1 do
					
					local itemX, itemY = gameImages[i]:localToContent( 0, 0 )
			
					if (event.x > itemX - (gameImages[i].contentWidth*0.5) and
								event.x < itemX + (gameImages[i].contentWidth*0.5) and
								event.y > itemY - (gameImages[i].contentHeight*0.5) and
								event.y < itemY + (gameImages[i].contentHeight*0.5)) then
							
						if (gameImages[i].inBasket == false) then
							
							if (timerNumVO) then
								timer.cancel( timerNumVO )
								timerNumVO = nil
							end
							if (timerNumVO2) then
								timer.cancel( timerNumVO2 )
								timerNumVO2 = nil
							end
							if (timerNumVO3) then
								timer.cancel( timerNumVO3 )
								timerNumVO3 = nil
							end
							
							if (gameBasketGroup.animation) then
								resetItemAnim( gameBasketGroup )
							end
						
							for k = #floaters, 1, -1 do
								if (floaters[k] == gameImages[i].id) then
									gameImages[i].bounceY = gameImages[i].y
									table.remove( floaters, k )
								end
							end
						
							if (checkTimer) then
								timer.cancel( checkTimer )
								checkTimer = nil
							end
							
							
							currentItem = gameImages[i]
							gameBasketGroup:toFront()
							currentItem:toFront()
							gameBasketFront:toFront()
							for i = #gameNumbers, 1, -1 do
								if (question ~= "basketEvenOdd") then
									gameNumbers[i]:toFront()
								end
							end
							
							currentItemX = event.x
							currentItemY = event.y
							
						
							break
						
						end
						
					end
				
				end
			
			end

        elseif(event.phase == "moved") then
			if target._isFocus then
				if (currentItem ~= 0) then
					
					local newX = event.x - beganTouchX
					local newY = event.y - beganTouchY
				
					currentItemX = event.x
					currentItemY = event.y
				
				end
			end
        -- Key released --
        elseif(event.phase == "ended" or event.phase == "cancelled") then
            if target._isFocus then
                target._isFocus = false
                display.getCurrentStage():setFocus(nil)
				
			if (currentItem ~= 0) then
			
				local currentX, currentY = currentItem:localToContent( 0, 0 )
				local basketX, basketY = gameBasketBox:localToContent( 0, 0 )
				
				local evenOddCorrect = false
				if (question == "basketEvenOdd") then
					if (isEvenOdd == "even" and currentItem.answerID % 2 == 0) then
						evenOddCorrect = true
					elseif (isEvenOdd == "odd" and currentItem.answerID % 2 ~= 0) then
						evenOddCorrect = true
					end
				elseif (question == "basketGreaterLessThan") then
					if (isGreaterLessThan == "greater than" and currentItem.answerID > greaterLessThanAnswer) then
						evenOddCorrect = true
					elseif (isGreaterLessThan == "less than" and currentItem.answerID < greaterLessThanAnswer) then
						evenOddCorrect = true
					elseif (isGreaterLessThan == "equal to" and currentItem.answerID == greaterLessThanAnswer) then
						evenOddCorrect = true
					end
				end
				
				if (question == "basketEvenOdd" and evenOddCorrect == true or 
					question == "basketGreaterLessThan" and evenOddCorrect == true or
					question ~= "basketEvenOdd" and question ~= "basketGreaterLessThan" and 
						currentX < basketX + (gameBasketBox.contentWidth*0.5) and 
						currentX > basketX - (gameBasketBox.contentWidth*0.5) and 
						currentY < basketY + (gameBasketBox.contentHeight*0.5) and 
						currentY > basketY - (gameBasketBox.contentHeight*0.5) + 30) then
						
					print("test 1")
						
					if (question ~= "basketEvenOdd" and question ~= "basketGreaterLessThan" and currentCount == numRequiredImages+1 and isEndGame == false) then
					
					
						gameBasketBox:removeEventListener("touch", numberButtonTouched)
						bg:removeEventListener("touch", this)
			
					
						currentItem.inBasket = false
						isEndGame = true
						
						if (checkTimer) then
							timer.cancel( checkTimer )
							checkTimer = nil
						end
					
						local function resetItem( obj )
					
							rewardTimer = timer.performWithDelay( 1000, squashBasket )
							
						end
						transition.to( currentItem, { time=300 , x = currentItem.initX, y = currentItem.initY, transition=easing.outExpo, onComplete = resetItem } )
					
					
					else
					
						currentItem.inBasket = true
						
						currentBasketAnswersNum = currentBasketAnswersNum + 1
						
						gameBasketGroup:insert( currentItem )
						
						if (question == "basketEvenOdd" or question == "basketGreaterLessThan") then
						
							for i = #gameNumbers, 1, -1 do
								if (gameNumbers[i]) then
									if (question ~= "basketEvenOdd") then
										gameNumbers[i]:toFront()
									end
								end
							end
						
						else
						
							for i = #gameNumbers, 1, -1 do
								if (gameNumbers[i]) then
									gameNumbers[i].alpha = 0
								end
							end
							
							if (gameNumbers[currentCount] and gameBasketFront) then
								gameNumbers[currentCount].x = gameBasketFront.x
								gameNumbers[currentCount].y = gameBasketFront.y + ((37+gameBasketScale[numImages][2])*gameBasketFront.yScale)
								
								if (system.getInfo( "platformName" ) == "Android"  ) then
									gameNumbers[currentCount].y = gameBasketFront.y + ((37-145+gameBasketScale[numImages][2])*gameBasketFront.yScale)
								end
								
								if (question ~= "basketEvenOdd") then
									gameNumbers[currentCount].alpha = 1
								end
							end
						
						end
						
						
						local randomBasketPos = math.random( 1, #basketItemPositions[numImages][1] )
						
						currentItem.xScale, currentItem.yScale = basketItemScale[numImages], basketItemScale[numImages]
						currentItem.x = gameBasketBack.x + basketItemPositions[numImages][1][randomBasketPos][1]
						currentItem.y = gameBasketBack.y + basketItemPositions[numImages][1][randomBasketPos][2]
						currentItem.rotation = basketItemPositions[numImages][1][randomBasketPos][3]
						
						table.remove( basketItemPositions[numImages][1], randomBasketPos )
						
						if (question ~= "basketEvenOdd") then
							gameNumbers[currentCount]:toFront()
						end
						
						
						if savedData.enableSounds == true then
							if (question == "basketEvenOdd" or question == "basketGreaterLessThan") then
							
								local tempAnswerID = currentItem.answerID
								
								print(tempAnswerID)
							
								if (tempAnswerID <= 100) then
									playReservedChannel( gameNumSounds[tempAnswerID], 29, 0 )
								else
									local function partFiveAudio()
										local numTemp
										if (tempAnswerID < 110) then
											numTemp = tonumber( tostring(tempAnswerID):sub(3, 3) )
										else
											numTemp = tonumber( tostring(tempAnswerID):sub(2, 3) )
										end
										playReservedChannel(gameNumSounds[ numTemp ], 28, 0)
									end
								
									playReservedChannel(hundredSounds[ tonumber(tostring(tempAnswerID):sub(1, 1)) ], 29, 0)
								
								
									if (questionAudioTimer) then
										timer.cancel( questionAudioTimer )
										questionAudioTimer = nil
									end
									questionAudioTimer = timer.performWithDelay( 900, partFiveAudio )
									
								end
							
								-- playReservedChannel( gameNumSounds[currentItem.answerID], currentGameChannel, 0 )
							else
								playReservedChannel( gameNumSounds[currentCount], currentGameChannel, 0 )
							end
							currentGameChannel = currentGameChannel + 1
							if (currentGameChannel > 25) then
								currentGameChannel = 20
							end
						end
						
						if (system.getInfo( "platformName" ) == "Android"  ) then
							if (question == "basketEvenOdd" or question == "basketGreaterLessThan") then
								if (currentItem.answerID ~= nil and currentItem.answerID > 99) then
									gameBasketGroup.initY = startingBasketYAndroid - 32
								else
									if (question == "basketEvenOdd") then
										if (basketItemOptions[currentImage].id == "starCount") then
											gameBasketGroup.initY = startingBasketYAndroid - 55
										else
											gameBasketGroup.initY = startingBasketYAndroid - 50
										end
									else
										if (basketItemOptions[currentImage].id == "appleCount" or
												basketItemOptions[currentImage].id == "pepper" or
												basketItemOptions[currentImage].id == "orangeCount") then
											gameBasketGroup.initY = startingBasketYAndroid - 50
										else
											gameBasketGroup.initY = startingBasketYAndroid - 45
										end
									end
								end
								
							end
							
							gameBasketGroup.origY = gameBasketGroup.initY
							gameBasketGroup.y = gameBasketGroup.initY
							
							
						end
						
						gameBasketGroup.animationInfo = gameBasketGroup.balloonAnim
						animateStart( gameBasketGroup )
		
					end
					
					
					
					currentCount = currentCount + 1
					if (question == "basketEvenOdd" and currentBasketAnswersNum >= numEvenOddAnswers or
						question == "basketGreaterLessThan" and currentBasketAnswersNum >= numGreaterLessThanAnswers or
						question ~= "basketEvenOdd" and question ~= "basketGreaterLessThan" and currentCount > numRequiredImages) then
					
					
					
						local function checkTime()
						
							if (isEndGame == false) then
						
								if (checkTimer) then
									timer.cancel( checkTimer )
									checkTimer = nil
								end
								
								gameBasketBox:removeEventListener("touch", numberButtonTouched)
								bg:removeEventListener("touch", this)
			
								isEndGame = true
								gameCompleted = true
						
								rewardTimer = timer.performWithDelay( 1000, squashBasket )
							
							end
							
						end
						
						if (question == "basketEvenOdd" or 
							question == "basketGreaterLessThan" or
							currentCount > numImages) then
							checkTime()
						elseif (currentCount-1 == numRequiredImages) then
							timer.performWithDelay( 200, makeButtonsActive )
							
							if (checkTimer) then
								timer.cancel( checkTimer )
								checkTimer = nil
							end
							checkTimer = timer.performWithDelay( 200 + checkTimeNum, checkTime )
						end
						
					else
						timer.performWithDelay( 200, makeButtonsActive )
					end
					
					
				else
				
				
					local function resetItem( obj )
					
						obj.inBasket = false
						floaters[#floaters+1] = obj.id
						
						if (currentCount > numRequiredImages) then
						
							-- makeButtonsActive()
					
							local function checkTime()
								
								if (isEndGame == false) then
								
									if (checkTimer) then
										timer.cancel( checkTimer )
										checkTimer = nil
									end
									
									isEndGame = true
							
									rewardTimer = timer.performWithDelay( 1000, squashBasket )
								
								end
								
							end
							
							if (checkTimer) then
								timer.cancel( checkTimer )
								checkTimer = nil
							end
							checkTimer = timer.performWithDelay( checkTimeNum, checkTime )
						
						end
					
					end
					transition.to( currentItem, { time=300 , x = currentItem.initX, y = currentItem.initY, transition=easing.outExpo, onComplete = resetItem } )
					
					
					
				end
				
				currentItem = 0
				
			end
                
                -- if obj.name == chooseGameAnswer then
                    -- self.isTouchEnable = false
                    
					
            end -- if obj._isFocus then
        end -- touch began, moved, ended, cancelled

        return true
    end
    
	
	
	function basketTap( event )

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
		
				-- if (myData.isFireTV or myData.isController) then 
					-- transition.to( cursor, { time=100, alpha=0 } )
					-- buttonsActive = false
				-- end
				buttonsActive = false
				
			
			
				-- local levelOptions = gameDetails["level" .. level]
				-- local gameOptions = levelOptions["game" .. curGame]
				-- local questionOptions = gameOptions.question
				-- local countingOptions = gameOptions.counting
				
				
				-- if (cardTrans) then
					-- transition.cancel( cardTrans )
					-- cardTrans = nil
				-- end
				-- cardGroup.x = cardGroup.targetX
				
				
				local evenOddCorrect = false
				if (question == "basketEvenOdd") then
					if (isEvenOdd == "even" and gameImages[currentCardSelected].answerID % 2 == 0) then
						evenOddCorrect = true
					elseif (isEvenOdd == "odd" and gameImages[currentCardSelected].answerID % 2 ~= 0) then
						evenOddCorrect = true
					end
				elseif (question == "basketGreaterLessThan") then
					if (isGreaterLessThan == "greater than" and gameImages[currentCardSelected].answerID > greaterLessThanAnswer) then
						evenOddCorrect = true
					elseif (isGreaterLessThan == "less than" and gameImages[currentCardSelected].answerID < greaterLessThanAnswer) then
						evenOddCorrect = true
					elseif (isGreaterLessThan == "equal to" and gameImages[currentCardSelected].answerID == greaterLessThanAnswer) then
						evenOddCorrect = true
					end
				end
				
				
				if (question == "basketEvenOdd" and evenOddCorrect == true or 
					question == "basketGreaterLessThan" and evenOddCorrect == true or
					question ~= "basketEvenOdd" and question ~= "basketGreaterLessThan") then 
				
					-- if (myData.isFireTV or myData.isController) then 
						-- transition.to( cursor, { time=100, alpha=0 } )
					-- end
				
					moveCurrentItemToBasket( target )
				
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
	
	
	
	local function showBasket()
	
		for i = 1, #gameImages do
		
			local function scaleGameImageBack( obj )
				transition.to( obj, { time=100 , xScale = obj.initScale, yScale = obj.initScale, transition=easing.outExpo} )
			
				if savedData.enableSounds == true then
					playReservedChannel(popSounds[math.random(1,3)], currentPopChannel, 0)
				end
				currentPopChannel = currentPopChannel + 1
				if currentPopChannel > 26 then
					currentPopChannel = 27
				end
				
				if (i == #gameImages) then
					
					
					local function scaleBasketBack( obj )
					
						if (question == "basketEvenOdd") then
							print("test basket")
							gameNumbers[1].alpha = 1
						end
					
						transition.to( obj, { time=100 , xScale = obj.initScale, yScale = obj.initScale, transition=easing.outExpo} )
			
						if savedData.enableSounds == true then
							playReservedChannel(popSounds[math.random(1,3)], currentPopChannel, 0)
						end
						currentPopChannel = currentPopChannel + 1
						if currentPopChannel > 26 then
							currentPopChannel = 27
						end
			
					end
					
					basketTrans = transition.to( gameBasketGroup, { delay = 200, time=100 , alpha = 1, xScale = gameImages[i].initScale+0.4, yScale = gameImages[i].initScale+0.4, transition=easing.inExpo, onComplete = scaleBasketBack} )
					transition.to( gameBasketFront, { delay = 200, time=100 , alpha = 1, transition=easing.inExpo} )
					
					
				end
				
			end
			
			
			gameImages[i].showTrans = transition.to( gameImages[i], { delay = 100 + (i * 100), time=100 , alpha = 1, xScale = gameImages[i].initScale+0.4, yScale = gameImages[i].initScale+0.4, transition=easing.inExpo, onComplete = scaleGameImageBack} )
		end
	
		randomVO = math.random( 1, 2 )
		dragVOChoice = 1
		
		readBasketVO(false)
		
		questionText.x = 1000
		-- if (dragVOChoice == 1) then
			-- questionText.text = "Can you drag " .. numRequiredImages
		-- else
		if (myData.isFireTV or myData.isController) then
			questionText.text = "Put " .. numRequiredImages
		else
			questionText.text = "Drag " .. numRequiredImages
		end
		-- end
		
		if (numRequiredImages > 1) then
			questionText.text = questionText.text .. " " .. basketItemOptions[currentImage].plural
		else
			questionText.text = questionText.text .. " " .. basketItemOptions[currentImage].name
		end
		
		-- if (dragVOChoice == 1) then
			-- if (basketOptions[randomBasket].id == 4) then
				-- questionText.text = questionText.text .. " to the hamper?"
			-- elseif (basketOptions[randomBasket].id == 5) then
				-- questionText.text = questionText.text .. " to the toy box?"
			-- else
				-- questionText.text = questionText.text .. " to the basket?"
			-- end
		-- else
			if (myData.isFireTV or myData.isController) then
				questionText.text = questionText.text .. " into the basket."
			elseif (basketOptions[randomBasket].id == 4) then
				questionText.text = questionText.text .. " to the hamper."
			elseif (basketOptions[randomBasket].id == 5) then
				questionText.text = questionText.text .. " to the toy box."
			else
				questionText.text = questionText.text .. " to the basket."
			end
		-- end
		
		
		if (question == "basketEvenOdd") then
			questionText.text = "Put the " .. isEvenOdd .. " numbers into the basket."
			questionTextTwo.text = ""
		elseif (question == "basketGreaterLessThan") then
			questionText.text = "Put numbers " .. isGreaterLessThan
			questionTextTwo.text = greaterLessThanAnswer .. " into the basket."
		else
			questionTextTwo.text = ""
		end
		
		-- if system.getInfo( "platformName" ) == "Android" then
			-- questionText.y = questionText.y + 8
		-- end
		
		
		questionText.anchorX = 0.5
		questionText.anchorY = 0.5
		questionText.x = 1000
		questionText.alpha = 1
		
		questionTextTwo.anchorX = 0.5
		questionTextTwo.anchorY = 0.5
		questionTextTwo.x = 1000
		questionTextTwo.alpha = 1
	
		-- cardTrans = transition.to( cardGroup, { time=700, x=halfW+cardOptions.offsetX, transition=easing.outExpo } )
		transition.to( questionText, { time=700, x=halfW, transition=easing.outExpo } )
		transition.to( questionTextTwo, { time=700, x=halfW, transition=easing.outExpo } )
	
	
	
		local function addGameListeners()
			bg:addEventListener("touch", this)
			Runtime:addEventListener("enterFrame", this)
		
		
			local function comparePosition( a, b )
				return a.x < b.x
			end
			table.sort( gameImages, comparePosition )
			
			for i = 1, #gameImages do
				print("Test")
				print(gameImages[i].x)
				print(gameImages[i].y)
			end
			
			local lowestY = gameImages[1]
			for i = 2, #gameImages do
				if (gameImages[i].y < lowestY.y) then
					lowestY = gameImages[i]
				end
			end
			
			local spacingAmount = 20
			if (#gameImages == 5 or #gameImages == 6) then
				spacingAmount = 60
			end
			local addGameImagesToEnd = {}
			local currentImageIndex = 1
			for i = 1, #gameImages do
				local isRemoved = false
				if (gameImages[currentImageIndex].y > lowestY.y + spacingAmount) then
					addGameImagesToEnd[#addGameImagesToEnd+1] = gameImages[currentImageIndex]
					table.remove( gameImages, currentImageIndex )
					isRemoved = true
				end
				
				if (isRemoved == false) then
					currentImageIndex = currentImageIndex + 1
				end
			end
			
			for i = 1, #addGameImagesToEnd do
				gameImages[#gameImages+1] = addGameImagesToEnd[i]
			end
			
			print("Next")
			
			for i = 1, #gameImages do
				print("Test")
				print(gameImages[i].x)
				print(gameImages[i].y)
			end
		
			currentCardSelected = 1
			targetCard = gameImages[currentCardSelected]
			
		
			-- gameBasketBox:addEventListener("touch", numberButtonTouched)
	
		end
		timer.performWithDelay( 500, addGameListeners )
		
		
		local function showCursor()

			cursor.xScale = cardOptions.scale -- Hand Cursor
			cursor.yScale = cardOptions.scale
			cursor:toFront()
			
			currentCardSelected = 1
			
			if (gameImages and #gameImages > 0) then
				for i = 1, #gameImages do
					if (gameImages[i].x < gameImages[currentCardSelected].x) then
						currentCardSelected = i
					end
				end
				
				if system.getInfo( "platformName" ) == "Android" then
				
					if (question == "basketEvenOdd" and #gameImages <= 3) then
							
						cursor.x, cursor.y = gameImages[currentCardSelected]:localToContent( (gameImages[currentCardSelected].contentWidth*0.8), (gameImages[currentCardSelected].contentHeight*0.8) - 150 )
					elseif (question == "basketEvenOdd" and #gameImages == 4) then
						cursor.x, cursor.y = gameImages[currentCardSelected]:localToContent( (gameImages[currentCardSelected].contentWidth*0.8), (gameImages[currentCardSelected].contentHeight*0.8) - 140 )
					elseif (question == "basketEvenOdd" and #gameImages == 5) then
						cursor.x, cursor.y = gameImages[currentCardSelected]:localToContent( (gameImages[currentCardSelected].contentWidth*0.8), (gameImages[currentCardSelected].contentHeight*0.8) - 135 )
					elseif (question == "basketEvenOdd" and #gameImages == 6) then
						cursor.x, cursor.y = gameImages[currentCardSelected]:localToContent( (gameImages[currentCardSelected].contentWidth*0.8), (gameImages[currentCardSelected].contentHeight*0.8) - 115 )
					elseif (question == "basketEvenOdd" and #gameImages == 7) then
						cursor.x, cursor.y = gameImages[currentCardSelected]:localToContent( (gameImages[currentCardSelected].contentWidth*0.8), (gameImages[currentCardSelected].contentHeight*0.8) - 105 )
					elseif (question == "basketEvenOdd" and #gameImages == 8) then
						cursor.x, cursor.y = gameImages[currentCardSelected]:localToContent( (gameImages[currentCardSelected].contentWidth*0.8), (gameImages[currentCardSelected].contentHeight*0.8) - 87 )
					elseif (question == "basketEvenOdd" and #gameImages == 9) then
						cursor.x, cursor.y = gameImages[currentCardSelected]:localToContent( (gameImages[currentCardSelected].contentWidth*0.8), (gameImages[currentCardSelected].contentHeight*0.8) - 80 )
					
					elseif (question == "basketEvenOdd") then
						cursor.x, cursor.y = gameImages[currentCardSelected]:localToContent( (gameImages[currentCardSelected].contentWidth*0.8), (gameImages[currentCardSelected].contentHeight*0.8) - 100 )
					elseif (question == "basketGreaterLessThan") then
						cursor.x, cursor.y = gameImages[currentCardSelected]:localToContent( (gameImages[currentCardSelected].contentWidth*0.8)- 3, (gameImages[currentCardSelected].contentHeight*0.8) - 143 )
					else
						if (basketItemOptions[currentImage].id == "heartCount" or basketItemOptions[currentImage].id == "starCount" or basketItemOptions[currentImage].id == "raspberry" or basketItemOptions[currentImage].id == "basketStrawberry" or basketItemOptions[currentImage].id == "watermelon") then
							cursor.x, cursor.y = gameImages[currentCardSelected]:localToContent( gameImages[currentCardSelected].contentWidth*0.6, gameImages[currentCardSelected].contentHeight*0.6 )
						else
							cursor.x, cursor.y = gameImages[currentCardSelected]:localToContent( (gameImages[currentCardSelected].contentWidth*0.8), (gameImages[currentCardSelected].contentHeight*0.8) )
						end
					end
				else
					if (basketItemOptions[currentImage].id == "heartCount" or basketItemOptions[currentImage].id == "starCount" or basketItemOptions[currentImage].id == "raspberry" or basketItemOptions[currentImage].id == "basketStrawberry" or basketItemOptions[currentImage].id == "watermelon") then
						cursor.x, cursor.y = gameImages[currentCardSelected]:localToContent( gameImages[currentCardSelected].contentWidth*0.6, gameImages[currentCardSelected].contentHeight*0.6 )
					else
						cursor.x, cursor.y = gameImages[currentCardSelected]:localToContent( gameImages[currentCardSelected].contentWidth*0.8, gameImages[currentCardSelected].contentHeight*0.8 )
					end
				end
			
				targetCard = gameImages[currentCardSelected]
				cursorTransition = transition.to( cursor, { time=700, alpha=1 } )
			
			end
			
			
			
			if (myData.isController) then
				Runtime:addEventListener( "key", basketTap )
			elseif (myData.isFireTV) then
				Runtime:addEventListener( "onFTVKey", basketTap )
			end
		
			
		end
		
		if (myData.isFireTV or myData.isController) then 
			cursorTransition = timer.performWithDelay( (#gameImages * 100) + 300, showCursor )
		end
	
	
	end
	
	local function setUpBasket()
	
		gameGroup = display.newGroup()
	
		for i = 1, numImages do
	
			gameImages[#gameImages+1] = display.newGroup()
	
			local gameBasketImage
	
			if (#randomColors < 2) then
				gameBasketImage = display.newImageRect("Images/" .. basketItemOptions[currentImage].id .. ".png", basketItemOptions[currentImage].w, basketItemOptions[currentImage].h )
			else
				gameBasketImage = display.newImageRect("Images/" .. basketItemOptions[currentImage].id .. randomColors[randomColor] .. ".png", basketItemOptions[currentImage].w, basketItemOptions[currentImage].h )
			end
			
			gameImages[#gameImages]:insert( gameBasketImage )
			
			-- print("test scale")
			-- print(numImages)
			-- print(gameImageScale[numImages])
			-- print(gameImageScale[numImages][1])
			-- print(gameImageScale[numImages][2])
			local newScale = math.random( gameImageScale[numImages][1] * 100, gameImageScale[numImages][2] * 100 ) / 100
			
			gameImages[#gameImages].xScale, gameImages[#gameImages].yScale = newScale, newScale
			
			
			if (question == "basketEvenOdd" or question == "basketGreaterLessThan") then
			
				if (randomNumbers[i] < 10) then
				
					-- gameItemNumbers[#gameItemNumbers+1] = display.newImageRect("Images/" .. i .. "Digit.png", 50, 50 )
					gameItemNumbers[#gameItemNumbers+1] = display.newText(randomNumbers[i], 0, 0, dynamicFont, 75 )
					-- gameItemNumbers[#gameItemNumbers]:setFillColor( basketOptions[randomBasket].numColor[1]/255, basketOptions[randomBasket].numColor[2]/255, basketOptions[randomBasket].numColor[3]/255 )
					-- gameItemNumbers[#gameItemNumbers].alpha = 0
					gameImages[#gameImages]:insert( gameItemNumbers[#gameItemNumbers] )
				
				
					local offsetX = gameBasketImage.width * basketItemOptions[currentImage].numOffsetX
					local offsetY = gameBasketImage.height * basketItemOptions[currentImage].numOffsetY
					
					
					gameItemNumbers[#gameItemNumbers].x = gameBasketImage.x + offsetX
					gameItemNumbers[#gameItemNumbers].y = gameBasketImage.y + offsetY
				
					if system.getInfo( "platformName" ) == "Android" then
						
						-- if (tempNum > 99) then
							-- gameItemNumbers[#gameItemNumbers].y = gameBasketImage.y + offsetY - 136
						-- else
							-- gameItemNumbers[#gameItemNumbers].y = gameBasketImage.y + offsetY - 155
						-- end
						
						if (question == "basketEvenOdd") then
							gameItemNumbers[#gameItemNumbers].y = gameBasketImage.y + offsetY - 155 - 40
						else
						
							gameItemNumbers[#gameItemNumbers].y = gameBasketImage.y + offsetY - 155 - 10
						
						end
					
					end
				
				
					gameItemNumbers[#gameItemNumbers].xScale, gameItemNumbers[#gameItemNumbers].yScale = 1, 1
					
				
				else
				
				
					local tempNum = randomNumbers[i]
				
				
					gameItemNumbers[#gameItemNumbers+1] = display.newGroup()
					
					-- local num1 = display.newImageRect("Images/" .. tostring(tempNum):sub(1, 1) .. "Digit.png", 50, 50 )
					local num1 = display.newText(tostring(tempNum):sub(1, 1), 0, 0, dynamicFont, 85 )
					-- num1:setFillColor( basketOptions[randomBasket].numColor[1]/255, basketOptions[randomBasket].numColor[2]/255, basketOptions[randomBasket].numColor[3]/255 )
					gameItemNumbers[#gameItemNumbers]:insert( num1 )
					
					-- local num2 = display.newImageRect("Images/" .. tostring(tempNum):sub(2, 2) .. "Digit.png", 50, 50 )
					local num2 = display.newText(tostring(tempNum):sub(2, 2), 0, 0, dynamicFont, 85 )
					num2.x = num1.x + (num1.contentWidth*0.4) + (num2.contentWidth*0.4) + 7
					-- num2:setFillColor( basketOptions[randomBasket].numColor[1]/255, basketOptions[randomBasket].numColor[2]/255, basketOptions[randomBasket].numColor[3]/255 )
					gameItemNumbers[#gameItemNumbers]:insert( num2 )
					
					
					
					if (randomNumbers[i] > 99) then
					
						-- local num3 = display.newImageRect("Images/" .. tostring(tempNum):sub(2, 2) .. "Digit.png", 50, 50 )
						local num3 = display.newText(tostring(tempNum):sub(3, 3), 0, 0, dynamicFont, 90 )
						num3.x = num2.x + (num2.contentWidth*0.4) + (num3.contentWidth*0.4) + 7
						-- num3:setFillColor( basketOptions[randomBasket].numColor[1]/255, basketOptions[randomBasket].numColor[2]/255, basketOptions[randomBasket].numColor[3]/255 )
						gameItemNumbers[#gameItemNumbers]:insert( num3 )
					end
					
					
					if (randomNumbers[i] > 99) then
						gameItemNumbers[#gameItemNumbers].xScale, gameItemNumbers[#gameItemNumbers].yScale = 0.65, 0.65
					else
						gameItemNumbers[#gameItemNumbers].xScale, gameItemNumbers[#gameItemNumbers].yScale = .75, .75
					end
					
					
					gameItemNumbers[#gameItemNumbers].anchorChildren = true
					gameItemNumbers[#gameItemNumbers].anchorX, gameItemNumbers[#gameItemNumbers].anchorY = 0.5, 0.5
					
					-- gameItemNumbers[#gameItemNumbers].alpha = 0
					gameImages[#gameImages]:insert( gameItemNumbers[#gameItemNumbers] )
				
					local offsetX = gameImages[#gameImages].width * basketItemOptions[currentImage].numOffsetX
					local offsetY = gameImages[#gameImages].height * basketItemOptions[currentImage].numOffsetY
					
					
					-- gameItemNumbers[#gameItemNumbers].x = gameBasketImage.x + offsetX
					-- gameItemNumbers[#gameItemNumbers].y = gameBasketImage.y + offsetY
					
					gameItemNumbers[#gameItemNumbers].x = gameImages[#gameImages].x + offsetX
					gameItemNumbers[#gameItemNumbers].y = gameImages[#gameImages].y + offsetY
					
					
					if system.getInfo( "platformName" ) == "Android" then
						
						-- if (tempNum > 99) then
							-- gameItemNumbers[#gameItemNumbers].y = gameBasketImage.y + offsetY - 136
						-- else
							-- gameItemNumbers[#gameItemNumbers].y = gameBasketImage.y + offsetY - 155
						-- end
						
						if (tempNum > 99) then
							gameItemNumbers[#gameItemNumbers].y = gameBasketImage.y + offsetY - 136
						else
							if (question == "basketEvenOdd") then
								gameItemNumbers[#gameItemNumbers].y = gameBasketImage.y + offsetY - 155 - 15
							else
								if (basketItemOptions[currentImage].id == "orangeCount") then
									gameItemNumbers[#gameItemNumbers].y = gameBasketImage.y + offsetY - 155 - 15
								elseif (basketItemOptions[currentImage].id == "heartCount") then
									gameItemNumbers[#gameItemNumbers].y = gameBasketImage.y + offsetY - 155 + 6
								else
									gameItemNumbers[#gameItemNumbers].y = gameBasketImage.y + offsetY - 155 - 20
								end
							end
						end
						
					
					end
					
					
					
				
				end
			
			end
			
			
			local randomPosSet = math.random( 1, #gameImagePositions[numImages] )
			
			gameImages[#gameImages].x = halfW + 5 + gameImagePositions[numImages][randomPosSet][i][1] -- was + 55
			gameImages[#gameImages].y = halfH - 105 + gameImagePositions[numImages][randomPosSet][i][2] -- was - 30
			gameImages[#gameImages].rotation = gameImagePositions[numImages][randomPosSet][i][3]
			gameImages[#gameImages].frame = math.random( 1 , 300 )
			gameImages[#gameImages].initX = gameImages[#gameImages].x
			gameImages[#gameImages].initY = gameImages[#gameImages].y
			gameImages[#gameImages].initR = gameImages[#gameImages].rotation
			gameImages[#gameImages].id = #gameImages
			gameImages[#gameImages].answerID = randomNumbers[i]
			gameImages[#gameImages].animationInfo = basketItemOptions[currentImage].animation
			gameImages[#gameImages].bounceY = gameImages[#gameImages].y
			gameImages[#gameImages].inBasket = false
		
			-- gameImages[#gameImages].xScale = math.random( (gameImages[#gameImages].xScale - 0.05)*100, (gameImages[#gameImages].xScale + 0.05)*100 ) / 100
			-- gameImages[#gameImages].yScale = gameImages[#gameImages].xScale
		
			if (gameImagePositions[numImages][randomPosSet][i][3] == 1) then
				gameImages[#gameImages].xScale = -gameImages[#gameImages].xScale
			end
			gameImages[#gameImages].initScale = gameImages[#gameImages].xScale
			
			gameImages[#gameImages].alpha = 0
			
			floaters[#floaters+1] = #gameImages
			
			gameGroup:insert( gameImages[#gameImages] )
		
		
		
			
			if (question == "basketEvenOdd") then
			
				gameNumbers[#gameNumbers+1] = display.newText(isEvenOdd, 0, 0, dynamicFont, 70 )
				gameNumbers[#gameNumbers]:setFillColor( basketOptions[randomBasket].numColor[1]/255, basketOptions[randomBasket].numColor[2]/255, basketOptions[randomBasket].numColor[3]/255 )
				
				gameNumbers[#gameNumbers].alpha = 0
				gameGroup:insert( gameNumbers[#gameNumbers] )
				
			elseif (question == "basketGreaterLessThan") then
			
				local greaterLessThanSign = ""
				
				if (isGreaterLessThan == "greater than") then
					greaterLessThanSign = ">"
				else
					greaterLessThanSign = "<"
				end
			
				gameNumbers[#gameNumbers+1] = display.newText(greaterLessThanSign .. greaterLessThanAnswer, 0, 0, dynamicFont, 70 )
				gameNumbers[#gameNumbers]:setFillColor( basketOptions[randomBasket].numColor[1]/255, basketOptions[randomBasket].numColor[2]/255, basketOptions[randomBasket].numColor[3]/255 )
				
				gameNumbers[#gameNumbers].alpha = 0
				gameGroup:insert( gameNumbers[#gameNumbers] )
			
			else
			
				if (i < 10) then
				
					-- gameNumbers[#gameNumbers+1] = display.newImageRect("Images/" .. i .. "Digit.png", 50, 50 )
					gameNumbers[#gameNumbers+1] = display.newText(i, 0, 0, dynamicFont, 90 )
					gameNumbers[#gameNumbers]:setFillColor( basketOptions[randomBasket].numColor[1]/255, basketOptions[randomBasket].numColor[2]/255, basketOptions[randomBasket].numColor[3]/255 )
					gameNumbers[#gameNumbers].alpha = 0
					gameGroup:insert( gameNumbers[#gameNumbers] )
				
				
				else
				
				
					local tempNum = i
				
				
					gameNumbers[#gameNumbers+1] = display.newGroup()
					
					-- local num1 = display.newImageRect("Images/" .. tostring(tempNum):sub(1, 1) .. "Digit.png", 50, 50 )
					local num1 = display.newText(tostring(tempNum):sub(1, 1), 0, 0, dynamicFont, 90 )
					num1:setFillColor( basketOptions[randomBasket].numColor[1]/255, basketOptions[randomBasket].numColor[2]/255, basketOptions[randomBasket].numColor[3]/255 )
					gameNumbers[#gameNumbers]:insert( num1 )
					
					-- local num2 = display.newImageRect("Images/" .. tostring(tempNum):sub(2, 2) .. "Digit.png", 50, 50 )
					local num2 = display.newText(tostring(tempNum):sub(2, 2), 0, 0, dynamicFont, 90 )
					num2.x = num1.x + (num1.contentWidth*0.4) + (num2.contentWidth*0.4) + 7
					num2:setFillColor( basketOptions[randomBasket].numColor[1]/255, basketOptions[randomBasket].numColor[2]/255, basketOptions[randomBasket].numColor[3]/255 )
					gameNumbers[#gameNumbers]:insert( num2 )
					
					
					gameNumbers[#gameNumbers].anchorChildren = true
					gameNumbers[#gameNumbers].anchorX, gameNumbers[#gameNumbers].anchorY = 0.5, 0.5
					
					gameNumbers[#gameNumbers].alpha = 0
					gameGroup:insert( gameNumbers[#gameNumbers] )
				
				
				end
			
			end
			
			
			if (randomColor) then
				randomColor = randomColor + 1
				if (randomColor > #randomColors) then
					randomColor = 1
				end
			end
		
		
		end
		randomizeTable( gameImages )
		
		
		
		
		
		gameBasketGroup = display.newGroup()
	
		-- if system.getInfo("model") == "iPad" then
			-- gameBasketBox = display.newRect( 0, 0, 350, 280 )
		-- elseif (display.pixelHeight == 960) then
			gameBasketBox = display.newRect( 0, 0, 350, 250 )
		-- else
			-- gameBasketBox = display.newRect( 0, 0, 350, 280 )
		-- end
		gameBasketBox.id = "basket"
		gameBasketBox.alpha = 0
		gameBasketBox.isHitTestable = true
		gameBasketGroup:insert( gameBasketBox )
		
		if (basketOptions[randomBasket].showBasketBG == false) then
			gameBasketBack = display.newRect( 0, 0, 248, 164 )
			gameBasketBack.alpha = 0
		else
			gameBasketBack = display.newImageRect("Images/basket" .. basketOptions[randomBasket].id .. "BG.png", 248, 164 )
		end
		gameBasketGroup:insert( gameBasketBack )
		
		gameGroup:insert( gameBasketGroup )
		
		
		gameBasketGroup.anchorChildren = true
		
		
		gameBasketGroup.x = halfW + basketOptions[randomBasket].xOffset --90
		gameBasketGroup.y = 245 + basketOptions[randomBasket].yOffset + gameBasketScale[numImages][3] -- for iPad Layouts, was 100
		gameBasketGroup.xScale, gameBasketGroup.yScale = 0.45 * gameBasketScale[numImages][1], 0.45 * gameBasketScale[numImages][1]
		gameBasketGroup.origScale = gameBasketGroup.xScale
		gameBasketGroup.popScale = gameBasketGroup.origScale + 0.1
		gameBasketGroup.bounceScale = gameBasketGroup.origScale + 0.3
		
		-- if system.getInfo("model") == "iPad" then
			-- gameBasketGroup.x = halfW + basketOptions[randomBasket].xOffset --90
			-- gameBasketGroup.y = halfH + 110 + basketOptions[randomBasket].yOffset -- for iPad Layouts, was 100
			-- gameBasketGroup.xScale, gameBasketGroup.yScale = 0.8, 0.8
			-- gameBasketGroup.origScale = gameBasketGroup.xScale
			-- gameBasketGroup.popScale = gameBasketGroup.origScale + 0.3
			-- gameBasketGroup.bounceScale = gameBasketGroup.origScale + 0.3
		-- elseif (display.pixelHeight == 960) then
			-- gameBasketGroup.x = halfW + basketOptions[randomBasket].xOffset --90
			-- gameBasketGroup.y = halfH + 35 + basketOptions[randomBasket].yOffset -- for iPad Layouts, was 100
			-- gameBasketGroup.xScale, gameBasketGroup.yScale = 0.45, 0.45
			-- gameBasketGroup.origScale = gameBasketGroup.xScale
			-- gameBasketGroup.popScale = gameBasketGroup.origScale + 0.1
			-- gameBasketGroup.bounceScale = gameBasketGroup.origScale + 0.1
		-- else
			-- if (basketOptions[randomBasket].id == 3) then
				-- gameBasketGroup.x = halfW + 6 + basketOptions[randomBasket].xOffset --90
				-- gameBasketGroup.y = halfH + 110 + basketOptions[randomBasket].yOffset -- for iPad Layouts, was 100
			-- elseif (basketOptions[randomBasket].id == 3) then
				-- gameBasketGroup.x = halfW + 38 + basketOptions[randomBasket].xOffset --90
				-- gameBasketGroup.y = halfH + 110 + basketOptions[randomBasket].yOffset -- for iPad Layouts, was 100
			-- else
				-- gameBasketGroup.x = halfW + 25 + basketOptions[randomBasket].xOffset --90
				-- gameBasketGroup.y = halfH + 110 + basketOptions[randomBasket].yOffset -- for iPad Layouts, was 100
			-- end
			-- gameBasketGroup.xScale, gameBasketGroup.yScale = 0.8, 0.8
			-- gameBasketGroup.origScale = gameBasketGroup.xScale
			-- gameBasketGroup.popScale = gameBasketGroup.origScale + 0.3
			-- gameBasketGroup.bounceScale = gameBasketGroup.origScale + 0.3
		-- end
		
		gameBasketGroup.origX = gameBasketGroup.x
		gameBasketGroup.origY = gameBasketGroup.y
		gameBasketGroup.initScale = gameBasketGroup.xScale
		gameBasketGroup.initR = gameBasketGroup.rotation
		gameBasketGroup.wiggleAnim = { id = "basketShake", particles = "", duration = 700, anchor = { 0.5, 0.5 }, particleOffset = { 0, 0 } }
		gameBasketGroup.balloonAnim = { id = "springy", particles = "", duration = 800, anchor = { 0.5, 0.5 }, particleOffset = { 0, 0 } }
		
		-- local randomRewardAnim = math.random( 1, #game4RewardAnim )
		-- gameBasketGroup.rewardAnim = game4RewardAnim[randomRewardAnim]
		-- gameBasketGroup.alpha = 0
		
		gameBasketGroup.xScale, gameBasketGroup.yScale = 0.01, 0.01
		gameBasketGroup.initX = gameBasketGroup.x
		gameBasketGroup.initY = gameBasketGroup.y
		gameBasketGroup.alpha = 0
		
		
		local gameBasketX, gameBasketY = gameBasketGroup:localToContent( 0, 0 )
		
		
		gameBasketFront = display.newGroup()
		
		basketFront = display.newImageRect("Images/basket" .. basketOptions[randomBasket].id .. ".png", 248, 164 )
		gameBasketFront:insert( basketFront )
		
		if (question == "basketEvenOdd") then
			
			gameBasketNum = display.newGroup()
			
			local num = display.newText(isEvenOdd, 0, 0, dynamicFont, 70 )
			num:setFillColor( basketOptions[randomBasket].numColor[1]/255, basketOptions[randomBasket].numColor[2]/255, basketOptions[randomBasket].numColor[3]/255 )
			gameBasketNum:insert( num )
			
			gameBasketNum.anchorChildren = true
			gameBasketNum.anchorX, gameBasketNum.anchorY = 0.5, 0.5
			
			-- gameBasketNum.alpha = 0
			gameBasketFront:insert( gameBasketNum )
			
		elseif (question == "basketGreaterLessThan") then
			
			gameBasketNum = display.newGroup()
			
			local greaterLessThanSign = ""
				
			if (isGreaterLessThan == "greater than") then
				greaterLessThanSign = ">"
			else
				greaterLessThanSign = "<"
			end
			
			
			local sign = display.newText(greaterLessThanSign, 0, 0, dynamicFont, 55 )
			sign:setFillColor( basketOptions[randomBasket].numColor[1]/255, basketOptions[randomBasket].numColor[2]/255, basketOptions[randomBasket].numColor[3]/255 )
			gameBasketNum:insert( sign )
			
			if (system.getInfo( "platformName" ) == "Android"  ) then
				sign.y = sign.y + 36
			end
			
			local num = display.newText(greaterLessThanAnswer, 0, 0, dynamicFont, 70 )
			num:setFillColor( basketOptions[randomBasket].numColor[1]/255, basketOptions[randomBasket].numColor[2]/255, basketOptions[randomBasket].numColor[3]/255 )
			num.x = sign.x + ((num.contentWidth*0.5) + (sign.contentWidth*0.5) + 4) -- + 6 moves the greater/less symbol to the LEFT a little
			gameBasketNum:insert( num )
			
			num.y = 3
			
			gameBasketNum.anchorChildren = true
			gameBasketNum.anchorX, gameBasketNum.anchorY = 0.5, 0.5
			
			-- gameBasketNum.alpha = 0
			gameBasketFront:insert( gameBasketNum )
			
		else
			
			if (numImages < 10) then
			
				gameBasketNum = display.newGroup()
			
				local num = display.newText(numImages, 0, 0, dynamicFont, 90 )
				num:setFillColor( basketOptions[randomBasket].numColor[1]/255, basketOptions[randomBasket].numColor[2]/255, basketOptions[randomBasket].numColor[3]/255 )
				gameBasketNum:insert( num )
				
				gameBasketNum.anchorChildren = true
				gameBasketNum.anchorX, gameBasketNum.anchorY = 0.5, 0.5
				
				gameBasketNum.alpha = 0
				gameBasketFront:insert( gameBasketNum )
			
			
			else
			
			
				local tempNum = numImages
			
			
				gameBasketNum = display.newGroup()
				
				local num1 = display.newText(tostring(tempNum):sub(1, 1), 0, 0, dynamicFont, 90 )
				num1:setFillColor( basketOptions[randomBasket].numColor[1]/255, basketOptions[randomBasket].numColor[2]/255, basketOptions[randomBasket].numColor[3]/255 )
				gameBasketNum:insert( num1 )
				
				local num2 = display.newText(tostring(tempNum):sub(2, 2), 0, 0, dynamicFont, 90 )
				num2.x = num1.x + (num1.contentWidth*0.4) + (num2.contentWidth*0.4) + 7
				num2:setFillColor( basketOptions[randomBasket].numColor[1]/255, basketOptions[randomBasket].numColor[2]/255, basketOptions[randomBasket].numColor[3]/255 )
				gameBasketNum:insert( num2 )
				
				
				gameBasketNum.anchorChildren = true
				gameBasketNum.anchorX, gameBasketNum.anchorY = 0.5, 0.5
				
				gameBasketNum.alpha = 0
				gameBasketFront:insert( gameBasketNum )
			
			
			end
			
		
		end
		
		
		if (question == "basketEvenOdd") then
		
			gameBasketNum.x = -1
			gameBasketNum.y = 20+gameBasketScale[numImages][2]
			
			if (system.getInfo( "platformName" ) == "Android"  ) then
				gameBasketNum.y = 25-145+gameBasketScale[numImages][2] + 5
			end
			
			-- gameBasketNum.rotation = basketFront.rotation
			gameBasketNum.xScale = basketFront.xScale/1.4
			gameBasketNum.yScale = basketFront.yScale/1.4
		
		elseif (question == "basketGreaterLessThan") then
			gameBasketNum.x = -gameBasketNum[1].contentWidth + 30
			gameBasketNum.y = 25+gameBasketScale[numImages][2] - 3.5
			
			if (system.getInfo( "platformName" ) == "Android"  ) then
				gameBasketNum.y = 25-145+gameBasketScale[numImages][2] - 4 + 44 - 6
			end
			
			-- gameBasketNum.rotation = basketFront.rotation
			
			if (greaterLessThanAnswer > 99) then
				gameBasketNum.xScale = basketFront.xScale/1.6
				gameBasketNum.yScale = basketFront.yScale/1.6
			elseif (greaterLessThanAnswer > 9) then
				gameBasketNum.xScale = basketFront.xScale/1.5
				gameBasketNum.yScale = basketFront.yScale/1.5
			else
				gameBasketNum.xScale = basketFront.xScale/1.4
				gameBasketNum.yScale = basketFront.yScale/1.4
			end
		else
			gameBasketNum.x = 4
			gameBasketNum.y = 25+gameBasketScale[numImages][2]
			
			if (system.getInfo( "platformName" ) == "Android"  ) then
				gameBasketNum.y = 25-145+gameBasketScale[numImages][2]
			end
			
			-- gameBasketNum.rotation = basketFront.rotation
			gameBasketNum.xScale = basketFront.xScale/1.4
			gameBasketNum.yScale = basketFront.yScale/1.4
		end
		
		
		
		
		gameBasketFront.xScale, gameBasketFront.yScale = gameBasketGroup.initScale, gameBasketGroup.initScale
		gameBasketFront.x = gameBasketGroup.x
		gameBasketFront.y = gameBasketGroup.y
		gameBasketFront.initX = gameBasketFront.x
		gameBasketFront.initY = gameBasketFront.y
		gameBasketFront.initScale = gameBasketFront.xScale
		gameBasketFront.xScale, gameBasketFront.yScale = 0.01, 0.01
		gameBasketFront.alpha = 0
		gameGroup:insert( gameBasketFront )
		
		
		
		
		if (question == "basketGreaterLessThan") then
			
			local offsetY = 20
			
			gameBasketGroup.y = gameBasketGroup.y + offsetY
			gameBasketGroup.initY = gameBasketGroup.y
			gameBasketGroup.origY = gameBasketGroup.y
			
			for i = #gameImages, 1, -1 do
				gameImages[i].y = gameImages[i].y + offsetY
				gameImages[i].initY = gameImages[i].y
			end
		
		elseif (question == "basketEvenOdd") then
		else
		
		end
		
		
		startingBasketYAndroid = gameBasketGroup.y
		
		-- this:insert( gameGroup )
		
		showBasket()
		
	end
	setUpBasket()
	
    ----------------------
    -- Destroy function --
    ----------------------
    function this:destroy()
        if self.isLive then
            print("game object destroyed.")
            self.isLive = false
			
			if (myData.isController) then
				Runtime:removeEventListener( "key", basketTap )
			elseif (myData.isFireTV) then
				Runtime:removeEventListener( "onFTVKey", basketTap )
			end
            
			Runtime:removeEventListener("enterFrame", this)
			bg:removeEventListener("touch", this)
			
			gameBasketBox:removeEventListener("touch", numberButtonTouched)
	
			for i = #gameImages, 1, -1 do
				resetItemAnim( gameImages[i] )
			end
			for i = #gameNumbers, 1, -1 do
				resetItemAnim( gameNumbers[i] )
			end
			
			resetItemAnim( gameBasketGroup )
			resetItemAnim( gameBasketFront )
	
			if (numTimer) then
				timer.cancel( numTimer )
				numTimer = nil
			end
			if (rewardTimer) then
				timer.cancel( rewardTimer )
				rewardTimer = nil
			end
			if (timerNumVO) then
				timer.cancel( timerNumVO )
				timerNumVO = nil
			end
			if (timerNumVO2) then
				timer.cancel( timerNumVO2 )
				timerNumVO2 = nil
			end
			if (timerNumVO3) then
				timer.cancel( timerNumVO3 )
				timerNumVO3 = nil
			end
			if (basketTrans) then
				transition.cancel( basketTrans )
				basketTrans = nil
			end
			if (basketTrans2) then
				transition.cancel( basketTrans2 )
				basketTrans2 = nil
			end
			if (checkTimer) then
				timer.cancel( checkTimer )
				checkTimer = nil
			end
			
			isEndGame = true
			
			if (gameBasketGroup.animation) then
				resetItemAnim( gameBasketGroup )
			end
			
			for i = #gameImages, 1, -1 do
				if (gameImages[i].showTrans) then
					transition.cancel( gameImages[i].showTrans )
					gameImages[i].showTrans = nil
				end
			end
			
			
			if (gameGroup) then
				for i = gameGroup.numChildren, 1, -1 do
					if (gameGroup[i]) then
						gameGroup[i]:removeSelf()
						gameGroup[i] = nil
					end
				end
				gameGroup:removeSelf()
				gameGroup = nil
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
