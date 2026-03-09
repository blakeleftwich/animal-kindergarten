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
	local tblBasket = gameOptions.questions
	local tblCards = gameOptions.cards
	local gameGroup
	local floaters = {}
	local gameImages = {}
	local gameNumbers = {}
	local currentCount = 1
	local isEndGame = false
	local closingGame = false
	local floatRangeItem = 1.5
	local gameTime = 0
	local startRange, endRange = tblCards.startRange, tblCards.endRange
	
	
	
	if (prevNumImagesOne == nil) then
		prevNumImagesOne = {}
	elseif (#prevNumImagesOne >= endRange - startRange + 1) then
		for i = #prevNumImagesOne, 1, -1 do
			table.remove( prevNumImagesOne, i )
		end
	end
	
	local repeatednum = false
	repeat
		repeatednum = false
		
		numImages = math.random( startRange, endRange )
		
		for i = #prevNumImagesOne, 1, -1 do
			if (prevNumImagesOne[i] == numImages) then
				repeatednum = true
			end
		end
		
	until repeatednum == false
	prevNumImagesOne[#prevNumImagesOne+1] = numImages
	
	
	
	if (currentImage == nil) then
		currentImage = 0
		randomizeTable( countingImageOptions )
	end
	currentImage = currentImage + 1
	if (currentImage > #countingImageOptions) then
		currentImage = 1
		randomizeTable( countingImageOptions )
	end
	
	
	
	
	local gameImageScale = { 
		{ 1, 1 }, 
		{ .9, .9 }, 
		{ 0.7, 0.7 }, 
		{ 0.55, 0.55}, 
		{ 0.5, 0.5 }, 
		{ 0.5, 0.5 }, 
		{ 0.5, 0.5 }, 
		{ 0.5, 0.5 }, 
		{ 0.5, 0.5 }, 
		{ 0.5, 0.5 },
	}

	local gameImagePositions = {
	
		-- X offset, Y offset, rotation, if image flip (0 = no, 1 = yes)
	
		{ { { 0, 15, -2, 0 }, }, },
		{ { { -85, math.random(1,20), -5, 0 }, { 85, math.random(1,20), 5, 1 }, },},
		{ { { -120,  math.random(-20,30), 9, 0 }, { 120, math.random(-20,30), 4, 1 }, { 0,  math.random(-20,30), 5, 1 }, },},
		{ { { -120, math.random(-32, -27), -3, 0 }, { 36, math.random(-25, -20), 0, 1 }, { -44, math.random(37, 42), 3, 1 }, { 120, math.random(30, 35), -2, 0 } },},
		{ { { -149, 30, 3, 1 }, { 0, 29, -4, 0 }, { 149, 35, -2, 1 }, { -75, -25, -3, 0 }, { 75, -22, 2, 1 } }, },
		{ { { -90, -35, 0, 1 }, { 0, -28, 3, 0 }, { 90, -30, 0, 0 }, { -90, 52, -3, 1 }, { 0, 58, 0, 0 }, { 90, 54, -3, 0 } },},
		{ { { -54, 40, -3, 0 }, { -110, -35, 3, 1 }, { 0, -40, 0, 0 }, { 54, 40, -3, 1 }, { 110, -35, 0, 0 }, { -160, 45, 3, 1 }, { 160, 45, -3, 0 } },},
		{ { { -130, -35, 0, 1 }, { -42.5, -28, 3, 0 }, { 42.5, -39, -3, 1 }, { 130, -30, 0, 0 }, { -130, 52, -3, 1 }, { -42.5, 58, 0, 0 }, { 42.5, 49, 3, 1 }, { 130, 54, -3, 0 } },},
		{ { { -170, 40, -3, 1 }, { 0, 50, 3, 0 }, { 86, 60, -3, 1 }, { -86, 60, 0, 0 }, { 170, 45, -3, 1 }, { -130, -35, 0, 1 }, { -42.5, -28, 3, 0 }, { 42.5, -39, -3, 1 }, { 130, -30, 0, 0 } },},
		{ { { -170, 45, -3, 1 }, { 0, 50, 3, 0 }, { 86, 60, -3, 1 }, { -86, 60, 0, 0 }, { 170, 45, -3, 1 }, { -170, -40, -3, 1 }, { 0, -35, 3, 0 }, { 86, -30, -3, 1 }, { -86, -30, 0, 0 }, { 170, -40, -3, 1 } },},
	}
	
	
	
	local randomColors = {}
	local randomColor
	for i = 1, countingImageOptions[currentImage].numColors do
	
		randomColors[i] = i
	
	end
	if (#randomColors > 1) then
		randomColor = math.random( 1, #randomColors )
	end
	
	
	
	
	function readCountingVO(touched)
	
		if savedData.enableSounds == true then
			if (currentCount == 1 or touched == true) then
				playReservedChannel( howManySound, currentGameChannel, 0 )
			else
				playReservedChannel( countTheSound, currentGameChannel, 0 )
			end
			currentGameChannel = currentGameChannel + 1
			if (currentGameChannel > 25) then
				currentGameChannel = 22
			end
		end
	
		
		local function playItemNameVO()
			if (currentCount == 1 or touched == true) then
			
				if savedData.enableSounds == true then
					-- if (numImages > 1) then
						if (countingImageOptions[currentImage].pluralVO) then
							playReservedChannel( gameSounds[countingImageOptions[currentImage].pluralVO], currentGameChannel, 0 )
						else
							playReservedChannel( gameSounds[countingImageOptions[currentImage].plural], currentGameChannel, 0 )
						end
					-- else
						-- playReservedChannel(  gameSounds[countingImageOptions[currentImage].id], currentGameChannel, 0 )
					-- end
					currentGameChannel = currentGameChannel + 1
					if (currentGameChannel > 25) then
						currentGameChannel = 22
					end
				end
				
			end
		end
		itemNameVOTimer = timer.performWithDelay( 750, playItemNameVO )
	
	
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
			
			if (gameNumbers) then
				for i = #gameNumbers, 1, -1 do
					-- gameNumbers[i].x = gameBasketFront.x
					-- gameNumbers[i].y = gameBasketFront.y + ((37+gameBasketScale[numImages][2])*gameBasketFront.yScale)
					-- if (system.getInfo( "platformName" ) == "Android"  ) then
						-- gameNumbers[i].y = gameBasketFront.y + ((37+gameBasketScale[numImages][2])*gameBasketFront.yScale) - 100
					-- end
					
					-- gameNumbers[i].rotation = gameBasketFront.rotation
					-- gameNumbers[i].xScale = gameBasketFront.xScale
					-- gameNumbers[i].yScale = gameBasketFront.yScale
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
	
	local function scaleCurrentCountingItem( target )
	
		target:removeEventListener("touch", this)
		target.hasBeenSelected = true
		
		
	
		for i = #floaters, 1, -1 do
			if (floaters[i] == target.id) then
				target.bounceY = target.y
				table.remove( floaters, i )
			end
		end
		
		-- playReservedChannel( numSounds[currentCount], gameButtonCurr, sAudio.gameButton1.l, "sound" )
		
		if savedData.enableSounds == true then
			playReservedChannel( gameNumSounds[currentCount], currentGameChannel, 0 )
			currentGameChannel = currentGameChannel + 1
			if (currentGameChannel > 25) then
				currentGameChannel = 22
			end
		end
		
		target[1]:setFillColor( .76, .76, .76)
		
		target:insert( gameNumbers[currentCount] )
		
		gameNumbers[currentCount]:toFront()
		
		
		local offsetX = target.width * countingImageOptions[currentImage].numOffsetX
		local offsetY = target.height * countingImageOptions[currentImage].numOffsetY
		
		
		gameNumbers[currentCount].x = target[1].x + offsetX
		gameNumbers[currentCount].y = target[1].y + offsetY
		
		-- local offsetX = target.contentWidth * countingImageOptions[currentImage].numOffsetX
		-- local offsetY = target.contentHeight * countingImageOptions[currentImage].numOffsetY
		
		
		-- if (currentCount == 10) then
			-- gameNumbers[currentCount].x = target.x - 1 - (target.contentWidth*0.5) + offsetX
		-- else
			-- gameNumbers[currentCount].x = target.x - (target.contentWidth*0.5) + offsetX
		-- end
		
		-- gameNumbers[currentCount].y = target.y - (target.contentHeight*0.5) + offsetY
		
		if (system.getInfo( "platformName" ) == "Android"  ) then
		
			local offsetYAndroid = target.height * countingImageOptions[currentImage].numOffsetYAndroid
		
		
			gameNumbers[currentCount].y = target[1].y - 200 + offsetYAndroid
		
			-- offsetX = target.width * countingImageOptions[currentImage].numOffsetX
			-- offsetY = target.height * countingImageOptions[currentImage].numOffsetY
		
			-- if (currentCount == 10) then
				-- gameNumbers[currentCount].x = target.x - 1 - (target.width*0.5) + offsetX
			-- else
				-- gameNumbers[currentCount].x = target.x - (target.width*0.5) + offsetX
			-- end
		
			-- if (currentCount == 10) then
				-- gameNumbers[currentCount].x = target.x - 1
			-- else
				-- gameNumbers[currentCount].x = target.x
			-- end
		
			-- gameNumbers[currentCount].y = target.y - (95*target.yScale)
		end
		
		-- gameNumbers[currentCount].rotation = target.rotation
		-- gameNumbers[currentCount].xScale, gameNumbers[currentCount].yScale = math.abs(target.xScale) * countingImageOptions[currentImage].numScale, math.abs(target.yScale) * countingImageOptions[currentImage].numScale
		-- gameNumbers[currentCount].origScale = gameNumbers[currentCount].xScale
		-- gameNumbers[currentCount].popScale = gameNumbers[currentCount].origScale + 0.2
		-- gameNumbers[currentCount].initScale = gameNumbers[currentCount].xScale
		-- gameNumbers[currentCount].initX = gameNumbers[currentCount].x
		-- gameNumbers[currentCount].initY = gameNumbers[currentCount].y
		-- gameNumbers[currentCount].initR = gameNumbers[currentCount].rotation
		-- gameNumbers[currentCount].rewardAnim = countingImageOptions[currentImage].animation
		-- gameNumbers[currentCount].bounceY = gameNumbers[currentCount].y
		
		transition.to( gameNumbers[currentCount], { delay = 0, time=50 , alpha = 1, transition=easing.inExpo } )
		
		
		
		
		
		target.initX = target.x
		target.initY = target.y
		target.initR = target.rotation
		target.initXScale = target.xScale
		target.initYScale = target.yScale
		target.springAnim = { id = "springy", particles = "", duration = 800, anchor = { 0.5, 0.5 }, particleOffset = { 0, 0 } }
		target.animationInfo = target.springAnim
		animateStart( target )
		
		-- gameNumbers[currentCount].initX = gameNumbers[currentCount].x
		-- gameNumbers[currentCount].initY = gameNumbers[currentCount].y
		-- gameNumbers[currentCount].initR = gameNumbers[currentCount].rotation
		-- gameNumbers[currentCount].initScale = gameNumbers[currentCount].xScale
		-- gameNumbers[currentCount].springAnim = { id = "springy", particles = "", duration = 800, anchor = { 0.5, 0.5 }, particleOffset = { 0, 0 } }
		-- gameNumbers[currentCount].animationInfo = gameNumbers[currentCount].springAnim
		-- animateStart( gameNumbers[currentCount] )
		
		
		currentCount = currentCount + 1
		if (currentCount > #gameImages) then
			currentCount = #gameImages
			
			isEndGame = true
			
			-- for i = 1, #gameImages do
				-- gameImages[i]:removeEventListener("touch", this)
			-- end
			
			local function playTotalCountVO()
		
				-- playReservedChannel( numSounds[currentCount], gameButtonCurr, sAudio.gameButton1.l, "sound" )
			
				if savedData.enableSounds == true then
					playReservedChannel( gameNumSounds[currentCount], currentGameChannel, 0 )
					currentGameChannel = currentGameChannel + 1
					if (currentGameChannel > 25) then
						currentGameChannel = 22
					end
				end
			
				local function playItemNameVO()
				
					-- if (currentCount > 1) then
						-- playReservedChannel( gameSounds[countingImageOptions[currentImage].id], gameSoundFXCurr, sAudio.gameSoundFX1.l, "sound" )
					-- else
						-- playReservedChannel( gameSoundsSingular[countingImageOptions[currentImage].id], gameSoundFXCurr, sAudio.gameSoundFX1.l, "sound" )
					-- end
			
					-- gameSoundFXCurr = gameSoundFXCurr + 1
					-- if (gameSoundFXCurr > sAudio.gameSoundFX3.c) then
						-- gameSoundFXCurr = sAudio.gameSoundFX1.c
					-- end
					
					if savedData.enableSounds == true then
						if (numImages > 1) then
							if (countingImageOptions[currentImage].pluralVO) then
								playReservedChannel( gameSounds[countingImageOptions[currentImage].pluralVO], currentGameChannel, 0 )
							else
								playReservedChannel( gameSounds[countingImageOptions[currentImage].plural], currentGameChannel, 0 )
							end
						else
							playReservedChannel(  gameSounds[countingImageOptions[currentImage].name], currentGameChannel, 0 )
						end
						
						currentGameChannel = currentGameChannel + 1
						if (currentGameChannel > 25) then
							currentGameChannel = 22
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
			
						if (countingImageOptions[currentImage].sound) then
							playReservedChannel( gameSounds[countingImageOptions[currentImage].sound], currentGameChannel, 0 )
						-- else
						
							-- local randomRewardVO = math.random( 1, #randomRewardSounds )
							
							-- playReservedChannel( gameSounds[randomRewardSounds[randomRewardVO]],currentGameChannel, 0 )
						
						end
						currentGameChannel = currentGameChannel + 1
						if (currentGameChannel > 25) then
							currentGameChannel = 22
						end
						
						
						if (countingImageOptions[currentImage].soundTwo) then
							playReservedChannel( gameSounds[countingImageOptions[currentImage].soundTwo], currentGameChannel, 0 )
							currentGameChannel = currentGameChannel + 1
							if (currentGameChannel > 25) then
								currentGameChannel = 22
							end
						end
						
						
						
						for i = 1, #gameImages do
							gameImages[i].animationInfo = gameImages[i].rewardAnim
							-- gameNumbers[i].animationInfo = gameNumbers[i].rewardAnim
							if (gameImages[i].animation) then
							else
								animateStart( gameImages[i] )
							end
							-- if (gameNumbers[i].animation) then
							-- else
								-- animateStart( gameNumbers[i] )
							-- end
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
			rewardTimer = timer.performWithDelay( 1000, playTotalCountVO )
			
		else
			-- local repeated = false
			-- repeat
				-- repeated = false
				
				-- currentCardSelected = math.random( 1, #gameImages)
				
				-- if (gameImages[currentCardSelected].hasBeenSelected == true) then
					-- repeated = true
				-- end
			-- until repeated == false
			
			currentCardSelected = currentCardSelected + 1
			targetCard = gameImages[currentCardSelected]
		
			makeButtonsActive()
		end
	
	end
	
	
    function this:touch(event)
		print("touch")
	
        if not self.isLive or not self.isTouchEnable then return end

        local target = event.target
		
		gameTime = 0
        -- Key pressed --
        if(event.phase == "began") then
            -- display.getCurrentStage():setFocus(target)
            -- target._isFocus = true
            
			print(currentCount)
			
			scaleCurrentCountingItem( target )
			
			
        end -- touch began, moved, ended, cancelled

        return true
    end
    
	
	
	function countingTap( event )

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
					transition.to( cursor, { time=100, alpha=0 } )
					buttonsActive = false
				end
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
				
				scaleCurrentCountingItem( target )
				
				
			end
			
		end
		
	end
	
	
	
	
	local function showCounting()
	
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
					-- for k = #gameImages, 1, -1 do
						-- gameImages[k]:addEventListener("touch", this)
					-- end
					
					
				end
				
			end
			
			
			gameImages[i].showTrans = transition.to( gameImages[i], { delay = 100 + (i * 100), time=100 , alpha = 1, xScale = gameImages[i].initScale+0.4, yScale = gameImages[i].initScale+0.4, transition=easing.inExpo, onComplete = scaleGameImageBack} )
		end
	
	
		-- local randomVO = math.random( 1, 2 )
	
		-- if (currentCount == 1) then
			-- if (randomVO == 1 and #gameImages > 1) then
				-- playReservedChannel( gameSounds.howMany, sAudio.gameInstructions1.c, sAudio.gameInstructions1.l, "sound" )
			-- else
				-- playReservedChannel( gameSounds.countThe, sAudio.gameInstructions1.c, sAudio.gameInstructions1.l, "sound" )
			-- end
		-- end
		
		
		readCountingVO(false)
		
		
		
		print("num images")
		print(numImages)
		questionText.x = 1000
		if (numImages > 1 or currentCount == 1) then
			questionText.text = "How many " .. countingImageOptions[currentImage].plural .. "?"
		else
			questionText.text = "How many " .. countingImageOptions[currentImage].name .. "?"
		end
		
		
		if system.getInfo( "platformName" ) == "Android" then
			questionText.y = questionText.y  - 25
		end
		
		
		questionText.anchorX = 0.5
		questionText.anchorY = 0.5
		questionText.x = 1000
		questionText.alpha = 1
	
		-- cardTrans = transition.to( cardGroup, { time=700, x=halfW+cardOptions.offsetX, transition=easing.outExpo } )
		transition.to( questionText, { time=700, x=halfW, transition=easing.outExpo } )
		transition.to( questionTextTwo, { time=700, x=halfW, transition=easing.outExpo } )
	
	
	
		local function addGameListeners()
			-- bg:addEventListener("touch", this)
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
			if (#gameImages == 3 or #gameImages == 5 or #gameImages == 6) then
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
		
		
			for k = #gameImages, 1, -1 do
				gameImages[k]:addEventListener("touch", this)
				gameImages.hasBeenSelected = false
			end
			
			currentCardSelected = 1
			targetCard = gameImages[currentCardSelected]
			
			if (myData.isController) then
				Runtime:addEventListener( "key", countingTap )
			elseif (myData.isFireTV) then
				Runtime:addEventListener( "onFTVKey", countingTap )
			end
		
			-- gameBasketBox:addEventListener("touch", numberButtonTouched)
	
		end
		timer.performWithDelay( 500, addGameListeners )
	
	
	end
	
	local function setUpCounting()
	
		gameGroup = display.newGroup()
	
		for i = 1, numImages do
	
			gameImages[#gameImages+1] = display.newGroup()
	
			local gameCountImage
	
			if (#randomColors < 2) then
				gameCountImage = display.newImageRect("Images/" .. countingImageOptions[currentImage].id .. ".png", countingImageOptions[currentImage].w, countingImageOptions[currentImage].h )
			else
				gameCountImage = display.newImageRect("Images/" .. countingImageOptions[currentImage].id .. randomColors[randomColor] .. ".png", countingImageOptions[currentImage].w, countingImageOptions[currentImage].h )
			end
			gameImages[#gameImages]:insert( gameCountImage )
			
			local newScale = math.random( gameImageScale[numImages][1] * 100, gameImageScale[numImages][2] * 100 ) / 100
			
			gameImages[#gameImages].xScale, gameImages[#gameImages].yScale = newScale, newScale
			
			
			local randomPosSet = math.random( 1, #gameImagePositions[numImages] )
			
			gameImages[#gameImages].x = halfW + 5 + gameImagePositions[numImages][randomPosSet][i][1] -- was + 55
			gameImages[#gameImages].y = halfH - 60 + gameImagePositions[numImages][randomPosSet][i][2] -- was - 30
			gameImages[#gameImages].rotation = gameImagePositions[numImages][randomPosSet][i][3]
			gameImages[#gameImages].frame = math.random( 1 , 300 )
			gameImages[#gameImages].initX = gameImages[#gameImages].x
			gameImages[#gameImages].initY = gameImages[#gameImages].y
			gameImages[#gameImages].initR = gameImages[#gameImages].rotation
			gameImages[#gameImages].id = #gameImages
			gameImages[#gameImages].animationInfo = countingImageOptions[currentImage].animation
			gameImages[#gameImages].rewardAnim = countingImageOptions[currentImage].animation
			gameImages[#gameImages].bounceY = gameImages[#gameImages].y
		
			-- gameImages[#gameImages].xScale = math.random( (gameImages[#gameImages].xScale - 0.05)*100, (gameImages[#gameImages].xScale + 0.05)*100 ) / 100
			-- gameImages[#gameImages].yScale = gameImages[#gameImages].xScale
		
			if (gameImagePositions[numImages][randomPosSet][i][3] == 1) then
				gameImages[#gameImages].xScale = -gameImages[#gameImages].xScale
			end
			gameImages[#gameImages].initXScale = gameImages[#gameImages].xScale
			gameImages[#gameImages].initYScale = gameImages[#gameImages].yScale
		
			
			gameImages[#gameImages].initScale = gameImages[#gameImages].xScale
			
			gameImages[#gameImages].alpha = 0
			
			floaters[#floaters+1] = #gameImages
			
			gameGroup:insert( gameImages[#gameImages] )
		
			
			
			if (i < 10) then
			
				-- gameNumbers[#gameNumbers+1] = display.newImageRect("Images/" .. i .. "Digit.png", 50, 50 )
				gameNumbers[#gameNumbers+1] = display.newText(i, 0, 0, dynamicFont, 80 )
				-- gameNumbers[#gameNumbers]:setFillColor( basketOptions[randomBasket].numColor[1]/255, basketOptions[randomBasket].numColor[2]/255, basketOptions[randomBasket].numColor[3]/255 )
				gameNumbers[#gameNumbers].alpha = 0
				gameGroup:insert( gameNumbers[#gameNumbers] )
			
			
			else
			
			
				local tempNum = i
			
			
				gameNumbers[#gameNumbers+1] = display.newGroup()
				
				-- local num1 = display.newImageRect("Images/" .. tostring(tempNum):sub(1, 1) .. "Digit.png", 50, 50 )
				local num1 = display.newText(tostring(tempNum):sub(1, 1), 0, 0, dynamicFont, 80 )
				-- num1:setFillColor( basketOptions[randomBasket].numColor[1]/255, basketOptions[randomBasket].numColor[2]/255, basketOptions[randomBasket].numColor[3]/255 )
				gameNumbers[#gameNumbers]:insert( num1 )
				
				-- local num2 = display.newImageRect("Images/" .. tostring(tempNum):sub(2, 2) .. "Digit.png", 50, 50 )
				local num2 = display.newText(tostring(tempNum):sub(2, 2), 0, 0, dynamicFont, 80 )
				num2.x = num1.x + (num1.contentWidth*0.4) + (num2.contentWidth*0.4) + 7
				-- num2:setFillColor( basketOptions[randomBasket].numColor[1]/255, basketOptions[randomBasket].numColor[2]/255, basketOptions[randomBasket].numColor[3]/255 )
				gameNumbers[#gameNumbers]:insert( num2 )
				
				
				gameNumbers[#gameNumbers].anchorChildren = true
				gameNumbers[#gameNumbers].anchorX, gameNumbers[#gameNumbers].anchorY = 0.5, 0.5
				
				gameNumbers[#gameNumbers].alpha = 0
				gameGroup:insert( gameNumbers[#gameNumbers] )
			
			
			end
			
			
			
			if (randomColor) then
				randomColor = randomColor + 1
				if (randomColor > #randomColors) then
					randomColor = 1
				end
			end
		
		
		end
		randomizeTable( gameImages )
		
		
		-- this:insert( gameGroup )
		
		showCounting()
		
	end
	setUpCounting()
	
    ----------------------
    -- Destroy function --
    ----------------------
    function this:destroy()
        if self.isLive then
            print("game object destroyed.")
            self.isLive = false
            
			if (myData.isController) then
				Runtime:removeEventListener( "key", countingTap )
			elseif (myData.isFireTV) then
				Runtime:removeEventListener( "onFTVKey", countingTap )
			end
			
			Runtime:removeEventListener("enterFrame", this)
			-- bg:removeEventListener("touch", this)
			
			for i = #gameImages, 1, -1 do
				resetItemAnim( gameImages[i] )
			end
			for i = #gameNumbers, 1, -1 do
				resetItemAnim( gameNumbers[i] )
			end
	
	
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
			if (checkTimer) then
				timer.cancel( checkTimer )
				checkTimer = nil
			end
			
			isEndGame = true
			
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
