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
    local levelOptions = gameDetails["level" .. level]
    local gameOptions  = gameLevelDetails
    
	-- print("new puzzle")
	
    -- generate objects
    local this = display.newGroup()
    this.isLive = true
    this.isTouchEnable = true
    
    -- copy game details...
    local tblQuestion = gameOptions.questions
	local tblBasket = gameOptions.questions
	local tblCards = gameOptions.cards
	local gameGroup
	local floaters = {}
	local gameImages = {}
	gameNumbers = {}
	gameNumber = nil
	local currentCount = 1
	local isEndGame = false
	local closingGame = false
	local floatRangeItem = 1.5
	local gameTime = 0
	local startRange, endRange = tblCards.startRange, tblCards.endRange
	local randomInstructionVO
	local canReadInstructions = false
	
	local teachNumberGroupXOffset = -37
	local teachNumberGroupYOffset = -40
	local chooseNumberGroupXOffset = 0
	local chooseNumberGroupYOffset = -20
	
	if (teachModeRepeating == true) then
	else
		touchTheNumberOption = math.random(startRange, endRange)
	end
	
	
	
	
	function readTouchTheNumVO(touched)
	
		if (touched == false or canReadInstructions == true) then
	
			if (gameModeTimer) then
				timer.cancel( gameModeTimer )
				gameModeTimer = nil
			end
			if (timerVO) then
				timer.cancel( timerVO )
				timerVO = nil
			end
	
			if (touchTheNumberOptions[touchTheNumberOption].mode == "teach" or touchTheNumberOptions[touchTheNumberOption].mode == "teachChoose") then
				
				if savedData.enableSounds == true then
					if (myData.isFireTV or myData.isController) then
						playReservedChannel( pickThe, 28, 0 )
					else
						playReservedChannel( touchThe, 28, 0 )
					end
				end
				
				local function numberVO()
				
					if savedData.enableSounds == true then
						playReservedChannel( gameNumSounds[numberCount], 28, 0 )
					end
					
				end
				gameModeTimer = timer.performWithDelay( 800, numberVO )
				
			else
				
				local function numberVO()
					if savedData.enableSounds == true then
						playReservedChannel( gameNumSounds[numberCount], 28, 0 )
					end
				end
				
				
				if (myData.isFireTV or myData.isController) then
					questionText.text = "Pick the " .. numberWords[numberCount+1] .. "."
					
					
					if savedData.enableSounds == true then
						playReservedChannel( pickThe, 28, 0 )
					end
				
					timerVO = timer.performWithDelay( 800, numberVO )
				elseif (randomInstructionVO == 1) then
				
					questionText.text = "Can you pick the " .. numberWords[numberCount+1] .. "?"
					
				
					if savedData.enableSounds == true then
						playReservedChannel( canYouPickThe, 28, 0 )
					end
				
					timerVO = timer.performWithDelay( 1100, numberVO )
				else
				
					questionText.text = "Pick the " .. numberWords[numberCount+1] .. "."
					
					
					if savedData.enableSounds == true then
						playReservedChannel( pickThe, 28, 0 )
					end
				
					timerVO = timer.performWithDelay( 800, numberVO )
				end
				
			end
		
		end
	
	end
	
	
	---------------------------------------    
    -- update function
    ---------------------------------------  
	
	local function itemFloat( event )


		if (floaters) then
			for k = #floaters, 1, -1 do
				if (gameNumber and floaters[k] == gameNumber.id) then
					gameNumber.frame = gameNumber.frame + 1
					gameNumber.y =  gameNumber.initY + floatRangeItem * math.sin(gameNumber.frame/30)
				end
				for i = 1, #gameNumbers do

					if (floaters[k] == gameNumbers[i].id) then
						gameNumbers[i].frame = gameNumbers[i].frame + 1
						gameNumbers[i].y =  gameNumbers[i].initY + floatRangeItem * math.sin(gameNumbers[i].frame/30)
					end
				end
			end
		end
		
		for i = 1, #gameNumbers do

			if (gameNumbers[i].pointInc and gameNumbers[i].pointInc < 1.01) then
				gameNumbers[i].x, gameNumbers[i].y = gameNumbers[i].curve(gameNumbers[i].pointInc)
				gameNumbers[i].pointInc = gameNumbers[i].pointInc + gameNumbers[i].speed
			end
			
		end
		
		if (gameNumber and gameNumber.pointInc and gameNumber.pointInc < 1.01) then
			gameNumber.x, gameNumber.y = gameNumber.curve(gameNumber.pointInc)
			gameNumber.pointInc = gameNumber.pointInc + gameNumber.speed
		end
		
		
		-- gameTime = gameTime + 1
		-- if (gameTime > playInstructionsTime) then
			-- if (instructionsTouched == false) then
				-- if (isEndGame == false or isEndGame == nil) then
					-- if (teachModeRepeating == true or touchTheNumberOptions[touchTheNumberOption].mode == "choose" or touchTheNumberOptions[touchTheNumberOption].mode == "teachChoose") then
						-- startInstructions()
					-- end
				-- end
			-- end
			-- gameTime = 0
		-- end
		
	end
	
	
    ---------------------------------------    
    -- touch function
    ---------------------------------------    
	
	
	function touchTheNumberTap( event )

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
		
				 
				if (cursorTransition2) then
					transition.cancel( cursorTransition2 )
					cursorTransition2 = nil
				end
		
				if (myData.isFireTV or myData.isController) then 
					-- transition.to( cursor, { time=100, alpha=0 } )
					buttonsActive = false
				end
				buttonsActive = false
				
				
				if (backButtonTimer) then
					timer.cancel( backButtonTimer )
					backButtonTimer = nil
				end
			
				if (timerVO) then
					timer.cancel( timerVO )
					timerVO = nil
				end
				
				if (gameModeTimer) then
					timer.cancel( gameModeTimer )
					gameModeTimer = nil
				end
				if (gameModeTrans) then
					transition.cancel( gameModeTrans )
					gameModeTrans = nil
				end
				
				gameTime = 0
			
				print("Test target")
				print(target.id)
			
			
				if (target.id == numberCount or touchTheNumberOptions[touchTheNumberOption].mode == "teach" or touchTheNumberOptions[touchTheNumberOption].mode == "teachChoose") then
			
					if (myData.isFireTV or myData.isController) then 
						transition.to( cursor, { time=100, alpha=0 } )
					end
			
			
					if (currentNumberCount) then
				
						if (itemNumberVOTimer) then
							timer.cancel( itemNumberVOTimer )
							itemNumberVOTimer = nil
						end
						if (rewardTimer) then
							timer.cancel( rewardTimer )
							rewardTimer = nil
						end
						
					end
					
					-- if (secondGameCount == nil or numberCount == secondGameCount) then
						
						for i = 1, #gameNumbers do
							gameNumbers[i]:removeEventListener("touch", touchTheNumberTap)
						end
						-- if (gameNumber) then
							-- gameNumber:removeEventListener("touch", gameButtonTouched)
						-- end
					
					-- end
				
				
				
					if (target.animation) then
					
						target.initX = target.x
						target.initY = target.y
						target.initR = target.rotation
						target.initScale = target.xScale
					
						resetItemAnim( target )
						
						target:toFront()
						
						target.x = target.initX
						target.y = target.initY
						target.rotation = target.origR
					end
				
					if (touchTheNumberOptions[touchTheNumberOption].mode == "teach") then
					
						-- audio.stop( sAudio.gameInstructions1.c )
						-- audio.stop( sAudio.gameInstructions2.c )
						-- audio.stop( sAudio.gameInstructions3.c )
						-- audio.stop( sAudio.gameButton1.c )
						-- audio.stop( sAudio.gameButton2.c )
						-- audio.stop( sAudio.gameButton3.c )
						-- audio.stop( sAudio.gameSoundFX1.c )
						-- audio.stop( sAudio.gameSoundFX2.c )
						-- audio.stop( sAudio.gameSoundFX3.c )
					
					end
					
					
					print("reward 1")
					
					
					if savedData.enableSounds == true then
						playReservedChannel( correct, currentGameChannel, 0 )
					end
					
					currentGameChannel = currentGameChannel + 1
					if (currentGameChannel > 25) then
						currentGameChannel = 20
					end
					
					
					if (floaters) then
						for k = #floaters, 1, -1 do
							floaters[k] = nil
							table.remove( floaters, k )
						end
					end
					
					
			
					local function startAnim()
			
						target.initX = target.x
						target.initY = target.y
						target.initR = target.rotation
						target.initScale = target.xScale
				
						target.animationInfo = target.correctAnim
						animateStart( target )
			
					end
					animTimer = timer.performWithDelay( 5, startAnim )
					
					local function playRewardVO()
					
						
						
						
					
						print("reward 2")
					
						local randomRewardVO = math.random( 1, #randomRewardSounds )
						
						-- if (target.rewardAnim.sound ~= "") then
							playReservedChannel( gameSounds[randomRewardSounds[randomRewardVO]], currentGameChannel, 0 )
						-- end
						currentGameChannel = currentGameChannel + 1
						if (currentGameChannel > 25) then
							currentGameChannel = 20
						end
						
					
						target.initX = target.x
						target.initY = target.y
						target.initR = target.rotation
						target.initScale = target.xScale
						target.animationInfo = target.rewardAnim
						
						if (target.animation)then
						else
							animateStart( target )
						end
						
						
						
						if (target.rewardAnim.sound ~= "") then
							playReservedChannel( gameSounds[target.rewardAnim.sound], currentGameChannel, 0 )
						
						end
						currentGameChannel = currentGameChannel + 1
						if (currentGameChannel > 25) then
							currentGameChannel = 20
						end
						
						
					
						if (numberCount == secondGameCount) then
							secondGameCount = nil
						end
						
						if (touchTheNumberOptions[touchTheNumberOption].mode == "choose" and currentNumberCount < #touchTheNumberOptions[touchTheNumberOption].numbers or
								touchTheNumberOptions[touchTheNumberOption].mode == "choose" and touchTheNumberOptions[touchTheNumberOption].numbers[1] == "random" and secondGameCount) then
						
							
						
							local function startNextCountNumber()
							
								currentNumberCount = currentNumberCount + 1
						
								numberCount = secondGameCount
								
								for i = #gameNumbers, 1, -1 do
									if (gameNumbers[i] ~= target) then
										transition.to( gameNumbers[i], { delay = 200, time=500 , alpha = 1, transition=easing.inExpo} )
									end
									floaters[#floaters+1] = gameNumbers[i].id
								end
								
								target.initX = target.origTouchX
								target.initY = target.origTouchY
								target.initR = target.origR
								target.initScale = target.origScale
								transition.to( target, { time=300 , x = target.origTouchX, y = target.origTouchY, rotation = target.origR, xScale = target.origScale, yScale = target.origScale, transition=easing.inOutExpo } )
								
								-- if (myData.isFireTV or myData.isController) then
									questionText.text = "Now pick the " .. numberWords[numberCount+1] .. "."
				
									
									if savedData.enableSounds == true then
										playReservedChannel( nowPickThe, 28, 0 )
									end
								-- else
									-- questionText.text = "Now touch the " .. numberWords[numberCount+1] .. "."
			
									
									-- if savedData.enableSounds == true then
										-- playReservedChannel( nowTouchThe, 28, 0 )
									-- end
								-- end
								
								local function numberVO()
								
									for i = #gameNumbers, 1, -1 do
										if (gameNumbers[i] ~= nil) then
											gameNumbers[i]:removeEventListener("touch", touchTheNumberTap)
											gameNumbers[i]:addEventListener("touch", touchTheNumberTap)
										end
									end
							
									if savedData.enableSounds == true then
										playReservedChannel( gameNumSounds[numberCount], currentGameChannel, 0 )
									end
									
									currentGameChannel = currentGameChannel + 1
									if (currentGameChannel > 25) then
										currentGameChannel = 20
									end
									print("secondNum")
									makeButtonsActive()
									
									instructionsTouched = false
									
									
				
								end
								rewardTimer = timer.performWithDelay( 1200, numberVO )
							
								local function showCursor()

									cursor.xScale = cardOptions.scale -- Hand Cursor
									cursor.yScale = cardOptions.scale
									cursor:toFront()
									
									currentCardSelected = 1
									
									if (gameNumbers) then
										for i = 1, #gameNumbers do
											if (gameNumbers[i].y < gameNumbers[currentCardSelected].y) then
												currentCardSelected = i
											end
										end
										for i = 1, #gameNumbers do
											if (gameNumbers[i].x < gameNumbers[currentCardSelected].x and 
													gameNumbers[i].y > gameNumbers[currentCardSelected].y - 20 and
													gameNumbers[i].y < gameNumbers[currentCardSelected].y + 20) then
												currentCardSelected = i
											end
										end
										
										if (#gameNumbers == 3 and gameNumbers[currentCardSelected].id ~= 20) then
											cursor.x, cursor.y = gameNumbers[currentCardSelected]:localToContent( gameNumbers[currentCardSelected].contentWidth*0.75, gameNumbers[currentCardSelected].contentHeight*0.75 )
										else
											cursor.x, cursor.y = gameNumbers[currentCardSelected]:localToContent( gameNumbers[currentCardSelected].contentWidth*1.1, gameNumbers[currentCardSelected].contentHeight*1.1 )
										end
									
										targetCard = gameNumbers[currentCardSelected]
										cursorTransition2 = transition.to( cursor, { time=700, alpha=1 } )
									
									end
									
									if (myData.isController) then
										Runtime:removeEventListener( "key", touchTheNumberTap )
									elseif (myData.isFireTV) then
										Runtime:removeEventListener( "onFTVKey", touchTheNumberTap )
									end
									if (myData.isController) then
										Runtime:addEventListener( "key", touchTheNumberTap )
									elseif (myData.isFireTV) then
										Runtime:addEventListener( "onFTVKey", touchTheNumberTap )
									end
									
								end
								
								if (myData.isFireTV or myData.isController) then 
									cursorTransition = timer.performWithDelay( 700, showCursor )
								end
							
							
							end
							rewardTimer = timer.performWithDelay( 1200, startNextCountNumber )
							
						
						else
						
							currentNumberCount = 1
							
							isEndGame = true
							
							instructionsTouched = true
							
							if (touchTheNumberOptions[touchTheNumberOption].mode == "teach" or touchTheNumberOptions[touchTheNumberOption].mode == "teachChoose") then
							
								
								touchTheNumberOption = touchTheNumberOption + 1
								
								if (touchTheNumberOption >= prevTouchTheNumberOptions) then
									prevTouchTheNumberOptions = touchTheNumberOption
								
								end
								
								
								if (teachModeRepeating == true) then
									touchTheNumberOption = game2PrevMode-1
									
									wasIncorrectAnswer = true
									
									nextWaypoint = false
								end
								teachModeRepeating = false
								
								
								
								-- transition.to( gameNumber, { time=700, alpha=0 } )
						
							else
							
								if (game2LoopingOne >= game2LoopFourStart and game2LoopingTwo > 0) then
								
									game2LoopingTwo = game2LoopingTwo + 1
								
									touchTheNumberOption = #touchTheNumberOptions
								
								elseif (game2LoopingOne < game2LoopFourStart and game2LoopingOne > 0) then
								
									touchTheNumberOption = #touchTheNumberOptions-1
									
									game2LoopingOne = game2LoopingOne + 1
								
								else
								
									touchTheNumberOption = touchTheNumberOption + 1
									
									
									if (touchTheNumberOption == #touchTheNumberOptions-1 and game2LoopingOne == 0) then
										game2LoopingOne = 1
									end
									if (game2LoopingOne >= game2LoopFourStart and touchTheNumberOption == #touchTheNumberOptions and game2LoopingTwo == 0) then
										game2LoopingTwo = 1
									end
									if (game2LoopingOne <  game2LoopFourStart and game2LoopingOne > 0) then
										
										touchTheNumberOption = #touchTheNumberOptions-1
									elseif (game2LoopingTwo > 0) then
									
										touchTheNumberOption = #touchTheNumberOptions
									end
								
								end
								
								
								
								
							
							end
							
							
							
							
							
							local function doEndAnim()
							
								if (nextWaypoint == true) then
									if savedData.enableSounds == true then
										playReservedChannel(shortClapSound, 30, 0)
									end
								end
							
								for i = #gameNumbers, 1, -1 do
									transition.to( gameNumbers[i], { time=700, alpha=0, transition=easing.outExpo } )
								end
								
								transition.to( questionText, { time=700, alpha = 0, transition=easing.outExpo } )
								transition.to( questionTextTwo, { time=700, alpha = 0, transition=easing.outExpo } )
								
								transition.to( gameGroup, { time=700, alpha=0, transition=easing.outExpo } )
								
								if (backButtonTimer) then
									timer.cancel( backButtonTimer )
									backButtonTimer = nil
								end
								
								goodJobSequenceTimer = timer.performWithDelay( 0, goodJobSequence )
							
							end
							
							goodJobSequenceTimer = timer.performWithDelay( target.animationInfo.duration, doEndAnim )
						
						end
					
					
					end
					
					
					
					
					
					
					local targetX, targetY = target:localToContent( 0, 0 )
					-- Particles:newEmitter(explosions,"bubbles", "Images/Particles/sharkBubble.png", 48, 48, 8, targetX, targetY, -3, 3, -2, 4, 255,255,255, math.random())
					Particles:newEmitter(explosions,"fireworks", "Images/starParticle.png", 32, 32, 10, targetX, targetY, -4, 4, -16, 6, 252,234,27)--altRgb[1], altRgb[2], altRgb[3])
					
					
					
					-- if (gameNumber) then
						-- gameNumber:removeEventListener("touch", gameButtonTouched)
					-- end
					if (gameNumbers) then
						for i = #gameNumbers, 1, -1 do
							gameNumbers[i]:removeEventListener("touch", touchTheNumberTap)
						end
					end
					
					if (touchTheNumberOptions[touchTheNumberOption].mode == "choose") then
					
						local function fadeChoices()
						
							if savedData.enableSounds == true then
								playReservedChannel( cardHopSound, currentGameChannel, 0 )
							end
							
							currentGameChannel = currentGameChannel + 1
							if (currentGameChannel > 25) then
								currentGameChannel = 20
							end
						
							
							for i = #gameNumbers, 1, -1 do
								if (gameNumbers[i] ~= target) then
									transition.to( gameNumbers[i], { time=500 , alpha = 0, transition=easing.outExpo} )
								end
							end
							
							
							
							local teachXOffset, teachYOffset
							if (numberCount  == 3 or numberCount  == 4 or 
									numberCount  == 5 or numberCount  == 6 or 
									numberCount  == 7 or numberCount  == 8 or
									numberCount  == 9) then
									
								teachXOffset = 10
								teachYOffset = 0
							else
								teachXOffset = 0
								teachYOffset = 0
							end
							
							
							print("Testing 100")
							-- if (currentChar == "shark") then
								-- transition.to( target, { delay = 660, time=300 , x = halfW + teachNumberGroupXOffset + teachXOffset, y = halfH + teachNumberGroupYOffset + teachYOffset, xScale = sharkNumbers[numberCount].tScale, yScale = sharkNumbers[numberCount].tScale, transition=easing.inOutExpo } )
							-- else
								-- transition.to( target, { delay = 660, time=300 , x = halfW + teachNumberGroupXOffset + teachXOffset, y = halfH + teachNumberGroupYOffset + teachYOffset, xScale = colorfulNumbers[numberCount].tScale, yScale = colorfulNumbers[numberCount].tScale, transition=easing.inOutExpo } )
							-- end
							
							print(gameGroup.x)
							print(gameGroup.y)
							
							print(target.x)
							print(target.y)
							
							local currentTargetPositionX, currentTargetPositionY = target:localToContent(0,0)
							
							print(currentTargetPositionX)
							print(currentTargetPositionY)
							
							display.currentStage:insert(target, false)
							
							target.x = currentTargetPositionX
							target.y = currentTargetPositionY
							
							
							target.origTouchX = target.x
							target.origTouchY = target.y
							
							-- local currentTargetPositionX, currentTargetPositionY = target:localToContent(0,0)
							-- local diffX = halfW - currentTargetPositionX
							-- local diffY = halfH - currentTargetPositionY
							
							transition.to( target, { delay = 660, time=300 , x = halfW, y = halfH + teachNumberGroupYOffset + teachYOffset, xScale = colorfulNumbers[numberCount].tScale, yScale = colorfulNumbers[numberCount].tScale, transition=easing.inOutExpo } )
							-- transition.to( target, { delay = 660, time=300 , x = halfW, y = halfH + teachNumberGroupYOffset + teachYOffset, xScale = colorfulNumbers[numberCount].tScale, yScale = colorfulNumbers[numberCount].tScale, transition=easing.inOutExpo } )
							
							local function playNumSound()
								
								if savedData.enableSounds == true then
									playReservedChannel( gameNumSounds[numberCount], currentGameChannel, 0 )
								end
								
								currentGameChannel = currentGameChannel + 1
								if (currentGameChannel > 25) then
									currentGameChannel = 20
								end
								
								rewardTimer = timer.performWithDelay( 1300, playRewardVO )
								
							end
							rewardTimer = timer.performWithDelay( 300, playNumSound )
							
						end
						
						
						rewardTimer = timer.performWithDelay( 850, fadeChoices ) -- 150
						
						
						
					else
					
						
						if savedData.enableSounds == true then
							playReservedChannel( gameNumSounds[numberCount], currentGameChannel, 0 )
						end
						
						currentGameChannel = currentGameChannel + 1
						if (currentGameChannel > 25) then
							currentGameChannel = 20
						end
					
						rewardTimer = timer.performWithDelay( 1300, playRewardVO )
						
					end
					
					
					
					
				else
				
				
				
					if savedData.enableSounds == true then
						playReservedChannel(wrongSound, currentWrongChannel, 0)
					end
					currentWrongChannel = currentWrongChannel + 1
					if currentWrongChannel > 20 then
						currentWrongChannel = 19
					end
					
					makeButtonsActive()
				
					-- if savedData.enableSounds == true then
						-- playReservedChannel( incorrect, currentGameChannel, 0 )
					-- end
					
					-- currentGameChannel = currentGameChannel + 1
					-- if (currentGameChannel > 25) then
						-- currentGameChannel = 20
					-- end
				
					
					-- if (touchTheNumberOption == 1) then
					-- else
					
						-- for i = 1, #touchTheNumberOptions do
						
							-- if (touchTheNumberOptions[i].mode == "teach" and touchTheNumberOptions[i].num == numberCount) then
							
								-- game2PrevMode = touchTheNumberOption
								-- touchTheNumberOption = i
								-- teachModeRepeating = true
								
								-- prevnumberCount = nil
								-- prevSecondGameCount = nil
								
								-- wasIncorrectAnswer = true
								-- gameWasTeachMode = true
								-- nextWaypoint = false
								
								-- buttonsActive = false
								
								-- transition.to( questionText, { time=700, alpha = 0, transition=easing.outExpo } )
								-- transition.to( questionTextTwo, { time=700, alpha = 0, transition=easing.outExpo } )
								
								-- transition.to( gameGroup, { time=700, alpha=0, transition=easing.outExpo } )
								
								-- if (backButtonTimer) then
									-- timer.cancel( backButtonTimer )
									-- backButtonTimer = nil
								-- end
								
								-- goodJobSequenceTimer = timer.performWithDelay( 0, goodJobSequence )
							
							-- end
						
						-- end
					-- end
				
				
				end
			
			
			
			
				
				
			end
			
		end
		
	end
	
	
	
	
	
	function startChooseMode()

		randomInstructionVO = math.random( 1, 2 )

		readTouchTheNumVO(false)
		
		canReadInstructions = true
		
		transition.to( questionText, { time=700, x=halfW, transition=easing.outExpo } )
		transition.to( questionTextTwo, { time=700, x=halfW, transition=easing.outExpo } )
	
		
		print ("choose mode start")
		makeButtonsActive()

		for i = 1, #gameNumbers do
		
			
			local function scaleGameImageBack( obj )
				transition.to( obj, { time=100 , xScale = obj.initScale, yScale = obj.initScale, transition=easing.outExpo} )
			
				
				if savedData.enableSounds == true then
					playReservedChannel(popSounds[math.random(1,3)], currentPopChannel, 0)
				end
				currentPopChannel = currentPopChannel + 1
				if currentPopChannel > 26 then
					currentPopChannel = 27
				end
				
				gameNumbers[i]:removeEventListener("touch", touchTheNumberTap)
				gameNumbers[i]:addEventListener("touch", touchTheNumberTap)
				
			end
			gameModeTrans = transition.to( gameNumbers[i], { delay = 100 + (i * 100), time=100 , alpha = 1, xScale = gameNumbers[i].initScale+0.4, yScale = gameNumbers[i].initScale+0.4, transition=easing.inExpo, onComplete = scaleGameImageBack} )
		
		end
		
		
		local function showCursor()

			cursor.xScale = cardOptions.scale -- Hand Cursor
			cursor.yScale = cardOptions.scale
			cursor:toFront()
			
			currentCardSelected = 1
			
			if (gameNumbers) then
				-- for i = 1, #gameNumbers do
					-- if (gameNumbers[i].x < gameNumbers[currentCardSelected].x) then
						-- currentCardSelected = i
					-- end
				-- end
				for i = 1, #gameNumbers do
					if (gameNumbers[i].y < gameNumbers[currentCardSelected].y) then
						currentCardSelected = i
					end
				end
				for i = 1, #gameNumbers do
					if (gameNumbers[i].x < gameNumbers[currentCardSelected].x and 
							gameNumbers[i].y > gameNumbers[currentCardSelected].y - 20 and
							gameNumbers[i].y < gameNumbers[currentCardSelected].y + 20) then
						currentCardSelected = i
					end
				end
				
				if (#gameNumbers == 3 and gameNumbers[currentCardSelected].id ~= 20) then
					cursor.x, cursor.y = gameNumbers[currentCardSelected]:localToContent( gameNumbers[currentCardSelected].contentWidth*0.75, gameNumbers[currentCardSelected].contentHeight*0.75 )
				else
					cursor.x, cursor.y = gameNumbers[currentCardSelected]:localToContent( gameNumbers[currentCardSelected].contentWidth*1.1, gameNumbers[currentCardSelected].contentHeight*1.1 )
				end
			
				targetCard = gameNumbers[currentCardSelected]
				cursorTransition2 = transition.to( cursor, { time=700, alpha=1 } )
			
			end
			
			if (myData.isController) then
				Runtime:removeEventListener( "key", touchTheNumberTap )
			elseif (myData.isFireTV) then
				Runtime:removeEventListener( "onFTVKey", touchTheNumberTap )
			end
			if (myData.isController) then
				Runtime:addEventListener( "key", touchTheNumberTap )
			elseif (myData.isFireTV) then
				Runtime:addEventListener( "onFTVKey", touchTheNumberTap )
			end
			
		end
		
		if (myData.isFireTV or myData.isController) then 
			cursorTransition = timer.performWithDelay( 700, showCursor )
		end
		

	end
	
	
	
	function startTeachMode()

		local function scaleBackNumber()

			local function thisIsVO()
			
				if savedData.enableSounds == true then
					playReservedChannel( thisIsA, 28, 0 )
				end
			
				floaters[#floaters+1] = gameNumber.id
				
				local function thisIsNumVO()
				
					if savedData.enableSounds == true then
						playReservedChannel( gameNumSounds[numberCount], 28, 0 )
					end
				
					if (gameNumber) then
						gameNumber.initX = gameNumber.x
						gameNumber.initY = gameNumber.y
						gameNumber.initR = gameNumber.rotation
						gameNumber.initScale = gameNumber.xScale
					
						gameNumber.animationInfo = gameNumber.wiggleAnim
						animateStart( gameNumber )
					end
				
					local function fadeNum()
						
						gameWasTeachMode = true
						
						buttonsActive = false
						
						teachModeRepeating = false
						
						nextWaypoint = false
						
						-- gameModeTrans = transition.to( gameNumber, { time=500, alpha=0, transition=easing.outExpo, onComplete = game.callCloseGame } )
						
						transition.to( questionText, { time=700, alpha = 0, transition=easing.outExpo } )
						transition.to( questionTextTwo, { time=700, alpha = 0, transition=easing.outExpo } )
						
						transition.to( gameGroup, { time=700, alpha=0, transition=easing.outExpo } )
						
						
						if (backButtonTimer) then
							timer.cancel( backButtonTimer )
							backButtonTimer = nil
						end
						
						goodJobSequenceTimer = timer.performWithDelay( 0, goodJobSequence )
						
					end
					
					
					local function startTouchTheVO()
					
						if (myData.isFireTV or myData.isController) then
							questionText.text = "Pick the " .. numberWords[numberCount+1] .. "."
						else
							questionText.text = "Touch the " .. numberWords[numberCount+1] .. "."
						end
						
						transition.to( questionText, { time=700, x=halfW, transition=easing.outExpo } )
						transition.to( questionTextTwo, { time=700, x=halfW, transition=easing.outExpo } )
	
						
						readTouchTheNumVO(false)
						
						canReadInstructions = true
		
					end
					
					
					
					
					if (teachModeRepeating == false and touchTheNumberOptions[touchTheNumberOption].mode == "teach") then
						
						gameModeTimer = timer.performWithDelay( 1200, fadeNum )
					else
						gameModeTimer = timer.performWithDelay( 1200, startTouchTheVO )
					
						local function showCursor()

							cursor.xScale = cardOptions.scale -- Hand Cursor
							cursor.yScale = cardOptions.scale
							cursor:toFront()
							
							currentCardSelected = 1
							
							if (gameNumber) then
								
								cursor.x, cursor.y = gameNumber:localToContent( gameNumber.contentWidth*1.1, gameNumber.contentHeight*1.1 )
								
							
								targetCard = gameNumber
								cursorTransition2 = transition.to( cursor, { time=700, alpha=1 } )
							
							end
							
							if (myData.isController) then
								Runtime:removeEventListener( "key", touchTheNumberTap )
							elseif (myData.isFireTV) then
								Runtime:removeEventListener( "onFTVKey", touchTheNumberTap )
							end
							if (myData.isController) then
								Runtime:addEventListener( "key", touchTheNumberTap )
							elseif (myData.isFireTV) then
								Runtime:addEventListener( "onFTVKey", touchTheNumberTap )
							end
							
						end
						
						if (myData.isFireTV or myData.isController) then 
							cursorTransition = timer.performWithDelay( 1201, showCursor )
						end
					end
				
				end
				gameModeTimer = timer.performWithDelay( 900, thisIsNumVO )
			
				print("game mode timer")
				if (isEndGame ~= true) then
					-- makeButtonsActive()
				end
			
			end
			
			
			gameModeTrans = transition.to( gameNumber, { time=50 , alpha = 1, xScale = gameNumber.origScale, yScale = gameNumber.origScale, transition=easing.outExpo, onComplete = thisIsVO} )
		
		end
		gameModeTrans = transition.to( gameNumber, { time=50 , alpha = 1, xScale = gameNumber.popScale, yScale = gameNumber.popScale, transition=easing.inExpo, onComplete = scaleBackNumber } )
		
		

	end
	
	
	
	
	local function showTouchTheNumber()
	
		
		
		-- print("num images")
		-- print(numImages)
		questionText.x = 1000
		-- if (numImages > 1 or currentCount == 1) then
			-- questionText.text = "How many " .. countingImageOptions[currentImage].plural .. "?"
		-- else
			-- questionText.text = "How many " .. countingImageOptions[currentImage].name .. "?"
		-- end
		
		-- if (touchTheNumberOptions[touchTheNumberOption].mode == "teach" or touchTheNumberOptions[touchTheNumberOption].mode == "teachChoose") then
			-- questionText.text = "This is a " .. numberCount .. ". Touch the " .. numberCount
		-- else
			-- questionText.text = "Touch the " .. numberCount .. "."
		-- end
		
		
		if system.getInfo( "platformName" ) == "Android" then
			questionText.y = questionText.y  - 25
		end
		
		
		questionText.anchorX = 0.5
		questionText.anchorY = 0.5
		questionText.x = 1000
		questionText.alpha = 1
		
	
		-- cardTrans = transition.to( cardGroup, { time=700, x=halfW+cardOptions.offsetX, transition=easing.outExpo } )
		-- transition.to( questionText, { time=700, x=halfW, transition=easing.outExpo } )
		-- transition.to( questionTextTwo, { time=700, x=halfW, transition=easing.outExpo } )
	
	
		if (teachModeRepeating == true or touchTheNumberOptions[touchTheNumberOption].mode == "teachChoose") then
			gameNumber:removeEventListener("touch", touchTheNumberTap)
			gameNumber:addEventListener("touch", touchTheNumberTap)
		end
	
	
		if (touchTheNumberOptions[touchTheNumberOption].mode == "teach" or touchTheNumberOptions[touchTheNumberOption].mode == "teachChoose") then
			if (touchTheNumberOption == 1 and teachModeRepeating == false) then
				isTeaching = true
				gameModeTimer = timer.performWithDelay( 500, startTeachMode ) --was 2000
			else
				isTeaching = true
				startTeachMode()
			end
		else
			startChooseMode()
		end
	
	
		local function addGameListeners()
		
			Runtime:addEventListener( "enterFrame", itemFloat)
		
	
		end
		addGameListenersTimer = timer.performWithDelay( 500, addGameListeners )
	
	
	end
	
	local function setUpTouchTheNumber()
	
		buttonsActive = false
	
		canReadInstructions = false
	
		gameGroup = display.newGroup()
		
	
		print("Test touch the num")
	
		if (touchTheNumberOptions[touchTheNumberOption].mode == "teach" or touchTheNumberOptions[touchTheNumberOption].mode == "teachChoose") then
	
			floatRangeItem = 3
		
			numberCount = touchTheNumberOptions[touchTheNumberOption].num
			
			local teachXOffset, teachYOffset
			if (numberCount  == 3 or numberCount  == 4 or 
					numberCount  == 5 or numberCount  == 6 or 
					numberCount  == 7 or numberCount  == 8 or
					numberCount  == 9) then
					
				teachXOffset = 0
				teachYOffset = 0
			else
				teachXOffset = 0
				teachYOffset = 0
			end
			
		
			gameNumber = display.newImageRect("Images/puzzle" .. numberCount .. ".png", colorfulNumbers[numberCount].w, colorfulNumbers[numberCount].h )
			gameNumber.xScale, gameNumber.yScale = colorfulNumbers[numberCount].tScale, colorfulNumbers[numberCount].tScale
			
			gameNumber.rotation = math.random( -3, 3 )
			gameNumber.x = halfW + teachNumberGroupXOffset + teachXOffset
			gameNumber.y = halfH + teachNumberGroupYOffset + teachYOffset
			gameNumber.initScale = gameNumber.xScale
			gameNumber.initX = gameNumber.x
			gameNumber.initY = gameNumber.y
			gameNumber.initR = gameNumber.rotation
			gameNumber.origX = gameNumber.x
			gameNumber.origY = gameNumber.y
			gameNumber.origR = gameNumber.rotation
			gameNumber.alpha = 0
			gameNumber.origScale = gameNumber.xScale
			gameNumber.popScale = gameNumber.origScale + 0.2
			gameNumber.xScale, gameNumber.yScale = 0.01, 0.01
			gameNumber.frame = 0
			gameNumber.id = "teachNum" .. numberCount
			gameNumber.correctAnim = { id = "springy", particles = "", duration = 800, anchor = { 0.5, 0.5 }, particleOffset = { 0, 0 } }
			gameNumber.wiggleAnim = { id = "shake", sound = "", particles = "", duration = 600, anchor = { 0.5, 0.5 }, particleOffset = { 0, 0 } }
			
			local randomRewardAnim = math.random( 1, #touchTheNumberTeachAnim )
			gameNumber.rewardAnim = touchTheNumberTeachAnim[randomRewardAnim]
			
			gameGroup:insert( gameNumber )
			
			
		
		else
		
		
			floatRangeItem = 1.5
			
			secondGameCount = nil
			
			
			if (#touchTheNumberOptions[touchTheNumberOption].numbers == 1 and
					touchTheNumberOptions[touchTheNumberOption].numbers[1] == "random") then
				if (touchTheNumberOptions[touchTheNumberOption].choicesRange[1] == "random") then
					repeat
						numberCount = math.random( 1, 20 )
					until prevnumberCount == nil or prevnumberCount ~= numberCount
					prevnumberCount = numberCount
				else
					if (touchTheNumberOptions[touchTheNumberOption].choicesRange[2] - touchTheNumberOptions[touchTheNumberOption].choicesRange[1] < 3) then
						numberCount = math.random( touchTheNumberOptions[touchTheNumberOption].choicesRange[1], touchTheNumberOptions[touchTheNumberOption].choicesRange[2] )
					else
						repeat
							numberCount = math.random( touchTheNumberOptions[touchTheNumberOption].choicesRange[1], touchTheNumberOptions[touchTheNumberOption].choicesRange[2] )
						until prevnumberCount == nil or prevnumberCount ~= numberCount
						prevnumberCount = numberCount
					end
				end
				local hasSecondNum = math.random( 1, 2 )
				if (hasSecondNum == 1) then
					repeat
						if (touchTheNumberOptions[touchTheNumberOption].choicesRange[1] == "random") then
							repeat
								secondGameCount = math.random( 1, 20 )
							until prevSecondGameCount == nil or prevSecondGameCount ~= secondGameCount
							prevSecondGameCount = secondGameCount
						else
							if (touchTheNumberOptions[touchTheNumberOption].choicesRange[2] - touchTheNumberOptions[touchTheNumberOption].choicesRange[1] < 3) then
								secondGameCount = math.random( touchTheNumberOptions[touchTheNumberOption].choicesRange[1], touchTheNumberOptions[touchTheNumberOption].choicesRange[2] )
							else
								repeat
									secondGameCount = math.random( touchTheNumberOptions[touchTheNumberOption].choicesRange[1], touchTheNumberOptions[touchTheNumberOption].choicesRange[2] )
								until prevSecondGameCount == nil or prevSecondGameCount ~= secondGameCount
								prevSecondGameCount = secondGameCount
							end
						end
					until secondGameCount ~= numberCount
				end
				
			elseif (#touchTheNumberOptions[touchTheNumberOption].numbers == 2 and
					touchTheNumberOptions[touchTheNumberOption].numbers[1] == "random") then
				secondGameCount = touchTheNumberOptions[touchTheNumberOption].numbers[currentNumberCount+1]
			
				repeat
					if (touchTheNumberOptions[touchTheNumberOption].choicesRange[1] == "random") then
						repeat
							numberCount = math.random( 1, 20 )
						until prevnumberCount == nil or prevnumberCount ~= numberCount
						prevnumberCount = numberCount
					else
						
						if (touchTheNumberOptions[touchTheNumberOption].choicesRange[2] - touchTheNumberOptions[touchTheNumberOption].choicesRange[1] < 3) then
							numberCount = math.random( touchTheNumberOptions[touchTheNumberOption].choicesRange[1], touchTheNumberOptions[touchTheNumberOption].choicesRange[2] )
						else
							repeat
								numberCount = math.random( touchTheNumberOptions[touchTheNumberOption].choicesRange[1], touchTheNumberOptions[touchTheNumberOption].choicesRange[2] )
							until prevnumberCount == nil or prevnumberCount ~= numberCount
							prevnumberCount = numberCount
						end
					end
				until secondGameCount ~= numberCount
			
			elseif (#touchTheNumberOptions[touchTheNumberOption].numbers == 2 and
					touchTheNumberOptions[touchTheNumberOption].numbers[2] == "random") then
					
				numberCount = touchTheNumberOptions[touchTheNumberOption].numbers[currentNumberCount]
				repeat
					if (touchTheNumberOptions[touchTheNumberOption].choicesRange[1] == "random") then
						repeat
							secondGameCount = math.random( 1, 20 )
						until prevSecondGameCount == nil or prevSecondGameCount ~= secondGameCount
						prevSecondGameCount = secondGameCount
					else
						if (touchTheNumberOptions[touchTheNumberOption].choicesRange[2] - touchTheNumberOptions[touchTheNumberOption].choicesRange[1] < 3) then
							secondGameCount = math.random( touchTheNumberOptions[touchTheNumberOption].choicesRange[1], touchTheNumberOptions[touchTheNumberOption].choicesRange[2] )
						else
							repeat
								secondGameCount = math.random( touchTheNumberOptions[touchTheNumberOption].choicesRange[1], touchTheNumberOptions[touchTheNumberOption].choicesRange[2] )
							until prevSecondGameCount == nil or prevSecondGameCount ~= secondGameCount
							prevSecondGameCount = secondGameCount
						end
					end
				until secondGameCount ~= numberCount
				
			else
				numberCount = touchTheNumberOptions[touchTheNumberOption].numbers[currentNumberCount]
				if (#touchTheNumberOptions[touchTheNumberOption].numbers > 1) then
					print("second game count")
					secondGameCount = touchTheNumberOptions[touchTheNumberOption].numbers[currentNumberCount+1]
				end
			end
			
			
			
			gameImageScale = { 1.5, 0.78, 0.78, 0.53 }
		
		
			-- Tweak number positions
			gameImagePositions = {
			
				-- num xOffset, yOffset, rotation, isFlipped
				-- Last three numbers are for 10 xOffset, yOffset and scale --
			 
				-- 1 image
				{ 
					{ { 0, 0, 0, 0, 0, 0, 1 }, }, --x,y,
				},
				-- 2 images
				{ 
					-- { { -56, -65, 5, 0, 0, 0, 1 }, { 10, 83, -5, 1, 0, 0, 1 }, },
					{ { -100, -35, 5, 0, 0, 0, 1 }, { 35, -35, -5, 1, 0, 0, 1 }, },
				},
				-- 3 images
				{ 
					-- { { 0, -90, 5, 1 }, { -70, 80, -5, 0 }, { 80, 70, 5, 1 }, }, 
					{ { -170, -37, -5, 0, -20, 0, 1 }, { -45, -36, 5, 1, 0, 0, 1 }, { 100, -38, 5, 1, 0, 0, 1 }, }, 
					-- { { 0, 90, 5, 1 }, { -80, -80, -5, 0 }, { 70, -70, 5, 1 }, }, 
					-- { { -70, 90, 5, 1 }, { -80, -80, -5, 0 }, { 70, 0, 5, 1 }, }, 
				},
				-- 4 images
				{ 
					{ { -64, -73, 0, 0, 5, 0, 1.2 }, { 64, -73, 0, 1, 0, 0, 1.2 }, { -64, 46, 0, 1, 0, -20, 1.2 }, { 64, 46, 0, 1, 0, -20,  1.2 }, }, 
					-- { { -55, -70, -5, 0 }, { 55, -70, 5, 1 }, { -55, 70, 0, 1 }, { 55, 70, 0, 1 }, }, 
				},
			}
			
			
			
			
			if (touchTheNumberOptions[touchTheNumberOption].numChoices == "random") then
				numImages = math.random( 3, 4 )
			else
				numImages = touchTheNumberOptions[touchTheNumberOption].numChoices
			end
			
			
			numberOptions = {}
			numberOptions[#numberOptions+1] = numberCount
			if (secondGameCount) then
				print("add second game count")
				numberOptions[#numberOptions+1] = secondGameCount
			end
			
			print("test")
			print(numberCount)
			print(secondGameCount)
			
			
			for i = 1, numImages-#numberOptions do
				
				local numRepeated = false
				local randomNum
				repeat
				
					numRepeated = false
					
					if (touchTheNumberOptions[touchTheNumberOption].choicesRange[1] == "random") then
						if (secondGameCount) then
							if (numberOptions[1] < numberOptions[2]) then
								if (numberOptions[1] == 1) then
									randomNum = math.random( numberOptions[1], numberOptions[2] + 3)
								elseif (numberOptions[2] >= 10) then
									randomNum = math.random( numberOptions[1] - 3, numberOptions[2])
								else
									randomNum = math.random( numberOptions[1] - 2, numberOptions[2] + 2)
								end
							else
								if (numberOptions[2] == 1) then
									randomNum = math.random( numberOptions[2], numberOptions[1] + 3)
								elseif (numberOptions[1] >= 10) then
									randomNum = math.random( numberOptions[2] - 3, numberOptions[1])
								else
									randomNum = math.random( numberOptions[2] - 2, numberOptions[1] + 2)
								end
							end
						else
							if (numberOptions[1] == 1) then
								randomNum = math.random( numberOptions[1], numberOptions[1] + 4)
							elseif (numberOptions[1] == 2) then
								randomNum = math.random( numberOptions[1] - 1, numberOptions[1] + 3)
							elseif (numberOptions[1] == 9) then
								randomNum = math.random( numberOptions[1] - 3, numberOptions[1] + 1)
							elseif (numberOptions[1] >= 10) then
								randomNum = math.random( numberOptions[1] - 4, numberOptions[1])
							else
								randomNum = math.random( numberOptions[1] - 2, numberOptions[1] + 2)
							end
						end
					else
					
						local range = touchTheNumberOptions[touchTheNumberOption].choicesRange
						randomNum = math.random( range[1], range[2] )
						
					end
					
					for k = 1, #numberOptions do
						if (numberOptions[k] == randomNum) then
							numRepeated = true
						end
					end
				
				until numRepeated == false and randomNum > 0 and randomNum < 21
				
				numberOptions[#numberOptions+1] = randomNum
				
			end
			
			
			
			if (touchTheNumberOptions[touchTheNumberOption].randomOrder == true) then
				randomizeTable( numberOptions )
				
			else
			
				table.sort( numberOptions, compare )
				
			end
			
			
			-- check if 10
			for i = 1, #numberOptions do
				if (numberOptions[i] == 10) then
					table.remove( numberOptions, i )
					if (#numberOptions == 3) then
						local randomPos = math.random( 1, 2 )
						if (randomPos == 1) then
							table.insert( numberOptions, 1, 10 )
						else
							table.insert( numberOptions, 2, 10 )
						end
					else
						local randomPos = math.random( 1, 2 )
						if (randomPos == 1) then
							table.insert( numberOptions, 1, 10 )
						else
							table.insert( numberOptions, 2, 10 )
						end
					end
				end
			end
			---------------------------------
			
			
			local randomPosSet = math.random( 1, #gameImagePositions[numImages] )
			
			
			for i = 1, numImages do
			
				local setScale
				
				print(numberOptions[i])
				
				if (numberOptions[i] == 20) then
					if (numImages == 3) then
						setScale = (gameImageScale[numImages] * colorfulNumbers[numberOptions[i]].cScale) * 0.85
					else
						setScale = (gameImageScale[numImages] * colorfulNumbers[numberOptions[i]].cScale) * 1
					end
				elseif (numberOptions[i] >= 10) then
					setScale = (gameImageScale[numImages] * colorfulNumbers[numberOptions[i]].cScale) * gameImagePositions[numImages][randomPosSet][i][7]
				else
					setScale = gameImageScale[numImages] * colorfulNumbers[numberOptions[i]].cScale
				end
				gameNumbers[#gameNumbers+1] = display.newImageRect("Images/puzzle" .. numberOptions[i] .. ".png", colorfulNumbers[numberOptions[i]].w, colorfulNumbers[numberOptions[i]].h )
				
				
				gameNumbers[#gameNumbers].xScale, gameNumbers[#gameNumbers].yScale = setScale, setScale
				
				if (numberOptions[i] >= 10) then
					gameNumbers[#gameNumbers].x = halfW + chooseNumberGroupXOffset + gameImagePositions[numImages][randomPosSet][i][1] + gameImagePositions[numImages][randomPosSet][i][5]
					gameNumbers[#gameNumbers].y = halfH + chooseNumberGroupYOffset + gameImagePositions[numImages][randomPosSet][i][2] + gameImagePositions[numImages][randomPosSet][i][6]
				else
					if (numImages == 4 and i == 1 and numberOptions[2] < 10) then
						gameNumbers[#gameNumbers].x = halfW + chooseNumberGroupXOffset + gameImagePositions[numImages][randomPosSet][3][1]
					else
						gameNumbers[#gameNumbers].x = halfW + chooseNumberGroupXOffset + gameImagePositions[numImages][randomPosSet][i][1]
					end
					gameNumbers[#gameNumbers].y = halfH + chooseNumberGroupYOffset + gameImagePositions[numImages][randomPosSet][i][2]
				end
				
				gameNumbers[#gameNumbers].rotation = gameImagePositions[numImages][randomPosSet][i][3]
				gameNumbers[#gameNumbers].initScale = gameNumbers[#gameNumbers].xScale
				gameNumbers[#gameNumbers].initX = gameNumbers[#gameNumbers].x
				gameNumbers[#gameNumbers].initY = gameNumbers[#gameNumbers].y
				gameNumbers[#gameNumbers].initR = gameNumbers[#gameNumbers].rotation
				gameNumbers[#gameNumbers].origX = gameNumbers[#gameNumbers].x
				gameNumbers[#gameNumbers].origY = gameNumbers[#gameNumbers].y
				gameNumbers[#gameNumbers].origR = gameNumbers[#gameNumbers].rotation
				gameNumbers[#gameNumbers].origScale = gameNumbers[#gameNumbers].xScale
				gameNumbers[#gameNumbers].popScale = gameNumbers[#gameNumbers].origScale + 0.2
				gameNumbers[#gameNumbers].id = numberOptions[i]
				gameNumbers[#gameNumbers].alpha = 0
				gameNumbers[#gameNumbers].frame = math.random( 1 , 300 )
				gameNumbers[#gameNumbers].correctAnim = { id = "springy", particles = "", duration = 800, anchor = { 0.5, 0.5 }, particleOffset = { 0, 0 } }
				gameNumbers[#gameNumbers].wiggleAnim = { id = "shake", sound = "", particles = "", duration = 600, anchor = { 0.5, 0.5 }, particleOffset = { 0, 0 } }
				gameNumbers[#gameNumbers].inSlot = false
				
				
				local randomRewardAnim = math.random( 1, #touchTheNumberChooseAnim )
				gameNumbers[#gameNumbers].rewardAnim = touchTheNumberChooseAnim[randomRewardAnim]
				gameGroup:insert( gameNumbers[#gameNumbers] )
				
				floaters[#floaters+1] = gameNumbers[#gameNumbers].id
			
			
			
			end
			
			if (myData.isFireTV or myData.isController) then 
			else
				if (touchTheNumberOptions[touchTheNumberOption].randomOrder == true) then
					randomizeTable( gameNumbers )
				end
			end
			
			
			
			
			
		end
		
		
		
		
		gameGroup.anchorChildren = true
		gameGroup.anchorX, gameGroup.anchorY = 0.5, 0.5
		
		
		if (numImages == 4) then
			gameGroup.x = halfW
			gameGroup.y = halfH - 30
		else
			gameGroup.x = halfW
			gameGroup.y = halfH - 50
		end
		
		-- if system.getInfo("model") == "iPad" then
			
			-- gameGroup.x = 35
			-- gameGroup.y = 5
			
		-- elseif (display.pixelHeight == 960) then
		
			-- gameGroup.xScale = 0.82
			-- gameGroup.yScale = 0.82
			-- gameGroup.x = 55
			-- gameGroup.y = 35
		
		-- else
		
			-- gameGroup.xScale = 1
			-- gameGroup.yScale = 1
			-- gameGroup.x = 35
			-- gameGroup.y = 5
		
		-- end
		
		
		
		
		-- this:insert( gameGroup )
		
		showTouchTheNumber()
		
	end
	setUpTouchTheNumber()
	
    ----------------------
    -- Destroy function --
    ----------------------
    function this:destroy()
        if self.isLive then
		
			buttonsActive = false
		
            self.isLive = false
			display.getCurrentStage():setFocus(nil)
            
			if (myData.isController) then
				Runtime:removeEventListener( "key", touchTheNumberTap )
			elseif (myData.isFireTV) then
				Runtime:removeEventListener( "onFTVKey", touchTheNumberTap )
			end
			
			Runtime:removeEventListener( "enterFrame", itemFloat)
			-- Runtime:removeEventListener("enterFrame", this)
			-- bg:removeEventListener("touch", this)
			
			if (gameNumber) then
				gameNumber:removeSelf()
				gameNumber = nil
			end
			
			if (floaters) then
				for i = #floaters, 1, -1 do
					floaters[i] = nil
				end
				floaters = nil
			end
			for i = #gameImages, 1, -1 do
				resetItemAnim( gameImages[i] )
			end
			for i = #gameNumbers, 1, -1 do
				resetItemAnim( gameNumbers[i] )
			end
			for i = #gameNumbers, 1, -1 do
				gameGroup:insert(gameNumbers[i], false)
			end
	
			if (numberOptions) then
				for i = #numberOptions, 1, -1 do
					table.remove( numberOptions, i )
				end
				numberOptions = nil
			end
			if (gameImageScale) then
				for i = #gameImageScale, 1, -1 do
					gameImageScale[i] = nil
				end
				gameImageScale = nil
			end
			if (gameImagePositions) then
				for i = #gameImagePositions, 1, -1 do
					gameImagePositions[i] = nil
				end
				gameImagePositions = nil
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
			if (backButtonTimer) then
				timer.cancel( backButtonTimer )
				backButtonTimer = nil
			end
			if (gameModeTimer) then
				timer.cancel( gameModeTimer )
				gameModeTimer = nil
			end
			if (addGameListenersTimer) then
				timer.cancel( addGameListenersTimer )
				addGameListenersTimer = nil
			end
			if (goodJobSequenceTimer) then
				timer.cancel( goodJobSequenceTimer )
				goodJobSequenceTimer = nil
			end
			if (timerVO) then
				timer.cancel( timerVO )
				timerVO = nil
			end
			if (animTimer) then
				timer.cancel( animTimer )
				animTimer = nil
			end
			
			if (gameModeTrans) then
				transition.cancel( gameModeTrans )
				gameModeTrans = nil
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
    backButtonTimer = timer.performWithDelay( 550, base.backButtonTransition )
    
    ----------------------
    return this
end

return M
