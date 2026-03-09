local myData = require("Scripts.myData")


function gateShakeRight()

	gateShakeNum = gateShakeNum + 1

	if (gateShakeNum < 7) then
		transition.to( parentalGateGroup, { time=70, x= 0 + 5, transition=easing.outExpo, onComplete = gateShakeLeft } )
	else
		transition.to( parentalGateGroup, { time=40, x= 0, transition=easing.outExpo } )
		local function clearText()
			gateNumbers[1].text = ""
			gateNumbers[2].text = ""
			gateNumbers[3].text = ""
		end
		timer.performWithDelay( 40, clearText )
	end
	
end

function gateShakeLeft()

	if (gateShakeNum == 1) then
		transition.to( parentalGateGroup, { time=40, x= 0 - 5, transition=easing.outExpo, onComplete = gateShakeRight } )
	else
		transition.to( parentalGateGroup, { time=70, x= 0 - 5, transition=easing.outExpo, onComplete = gateShakeRight } )
	end
	
end



function gateControllerDirectionPressed(keyName)

	if (keyName and keyName == "left") then
		
		if (currentCursorSelect == 0) then
			currentCursorSelect = 9
		elseif (currentCursorSelect == 1) then
			currentCursorSelect = 5
		elseif (currentCursorSelect == 6) then
			currentCursorSelect = 0
		else
			currentCursorSelect = currentCursorSelect - 1
		end
		
	elseif (keyName and keyName == "right") then
	
		if (currentCursorSelect == 9) then
			currentCursorSelect = 0
		elseif (currentCursorSelect == 5) then
			currentCursorSelect = 1
		elseif (currentCursorSelect == 0) then
			currentCursorSelect = 6
		else
			currentCursorSelect = currentCursorSelect + 1
		end
	
	elseif (keyName and keyName == "up") then
	
		if (currentCursorSelect == 0) then
			currentCursorSelect = 5
		elseif (currentCursorSelect == 5) then
			currentCursorSelect = 0
		elseif (currentCursorSelect < 6) then
			currentCursorSelect = currentCursorSelect + 5
		else
			currentCursorSelect = currentCursorSelect - 5
		end
	
	elseif (keyName and keyName == "down") then
		
		if (currentCursorSelect == 5) then
			currentCursorSelect = 0
		elseif (currentCursorSelect == 0) then
			currentCursorSelect = 5
		elseif (currentCursorSelect > 5) then
			currentCursorSelect = currentCursorSelect - 5
		else
			currentCursorSelect = currentCursorSelect + 5
		end
		
	end
	
	local nextCursor = 1
	for i = 1, #gateNumberButtons do
		if (gateNumberButtons[i].name == currentCursorSelect) then
			nextCursor = i
		end
	end
	
	gateCursor.x = gateNumberButtons[nextCursor].x + gateCursorOffsetX
	gateCursor.y = gateNumberButtons[nextCursor].y + gateCursorOffsetY
	
	playReservedChannel(shakeSound, currentCursorChannel, 0)
	currentCursorChannel = currentCursorChannel + 1
	if (currentCursorChannel > 27) then
		currentCursorChannel = 26
	end		
	
end

function trackGateCursor( event )
        
		
       -- local alert = native.showAlert( "buttonAlert2", "2 - phase:"..event.phase.. " key:"..event.keyName )
	if (event.phase == "began" and buttonsActive == true and event.keyName ~= "menu" or
			event.phase == "down" and buttonsActive == true and event.keyName ~= "menu") then
	
		if (event.keyName and event.keyName == "left") then
		
			gateControllerDirectionPressed("left")
			
		elseif (event.keyName and event.keyName == "right") then
			
			gateControllerDirectionPressed("right")
			
		elseif (event.keyName and event.keyName == "up") then
		
			gateControllerDirectionPressed("up")
			
		elseif (event.keyName and event.keyName == "down") then
			
			gateControllerDirectionPressed("down")
			
		end
		
	end
	
	gateBG:toFront()
	parentalGateGroup:toFront()	
	
end

function gateTrackCursorAxis( event )

	if (buttonsActive == true and version.appStore ~= "Chrome") then

		if event.normalizedValue > 0 then
			axisName = event.axis.type .. "+"
		else
			axisName = event.axis.type .. "-"
		end
		
		-- testText.text = axisName
		
		if math.abs(event.normalizedValue) >= controllerSensitivity then
			if (axisName == "leftX-" or axisName == "x-") then
				gateControllerDirectionPressed("left")
				Runtime:removeEventListener( "axis", gateTrackCursorAxis )
				timer.performWithDelay( controllerAxisDelay, function()
					Runtime:addEventListener( "axis", gateTrackCursorAxis )
				end )
			elseif (axisName == "leftX+" or axisName == "x+") then
				gateControllerDirectionPressed("right")
				Runtime:removeEventListener( "axis", gateTrackCursorAxis )
				timer.performWithDelay( controllerAxisDelay, function()
					Runtime:addEventListener( "axis", gateTrackCursorAxis )
				end )
			elseif (axisName == "leftY-" or axisName == "y-") then
				gateControllerDirectionPressed("up")
				Runtime:removeEventListener( "axis", gateTrackCursorAxis )
				timer.performWithDelay( controllerAxisDelay, function()
					Runtime:addEventListener( "axis", gateTrackCursorAxis )
				end )
			elseif (axisName == "leftY+" or axisName == "y+") then
				gateControllerDirectionPressed("down")
				Runtime:removeEventListener( "axis", gateTrackCursorAxis )
				timer.performWithDelay( controllerAxisDelay, function()
					Runtime:addEventListener( "axis", gateTrackCursorAxis )
				end )
			end
		end

	end

end


function parentalGateTouched(event)

	local thisButton = event.target
	local keyName = event.keyName
	if (thisButton) then
		print ("Button: " .. thisButton.name)
	else
		for i = 1, #gateNumberButtons do
			if (gateNumberButtons[i].name == currentCursorSelect) then
				thisButton = gateNumberButtons[i]
			end
		end
	end
	-- backButton:toFront()
	
	
	if event.phase == "began" and buttonsActive or
		keyName and event.phase == "down" and buttonsActive then

		
		if thisButton and thisButton.name == "gateExit" and currentState == "parentalGate" or
				keyName and keyName == "menu" and system.getInfo ("model") == "Apple TV" and currentState == "parentalGate" or
				keyName and keyName == "buttonB" and currentState == "parentalGate" or
				keyName and keyName == "b" and currentState == "parentalGate" or
				keyName and keyName == "deleteBack" and currentState == "parentalGate" or
				keyName and keyName == "back" and currentState == "parentalGate"then
		
			if (event.x and event.x > halfW + 140 or event.x and event.y < halfH - 130 or 
						event.x and event.x < halfW - 150 or event.x and event.y > halfH + 140 or
						keyName == "menu" or keyName == "buttonB" or keyName == "back" or keyName == "b" or keyName == "deleteBack") then
				
				buttonsActive = false
				
				if savedData.enableSounds == true then
					playReservedChannel(clickSound, 8, 0)
				end
				
				parentalGateFlurry(nextScene, "exit")
				
				if (nextScene == "selectableChar" or nextScene == "iapChar" or nextScene == "restoreChar" or nextScene == "rateChar" or
					nextScene == "iapCharWeekly" or nextScene == "iapCharMonthly" or nextScene == "iapCharYearly") then
					transition.to( menuGroup[1+itemIndex], { time=700, alpha=1, transition=easing.outExpo } )
					
					if (prevState == "select") then
						if (myData.isFireTV ) then 
							Runtime:addEventListener( "onFTVKey", touchedMenu )
						elseif (myData.isController) then
							Runtime:addEventListener("key", touchedMenu)
							Runtime:addEventListener( "axis", touchedMenuAxis )
						end
					end
					
					timer.performWithDelay( 400, makeButtonsActive )
				elseif (nextScene == "upfrontIAP") then
					transition.to( upfrontGroup, { time=1100, alpha=1, transition=easing.outExpo } )
					transition.to( upfrontScrollGroup, { time=1100, alpha=1, transition=easing.outExpo, onComplete = makeButtonsActive } )
					Runtime:addEventListener( "enterFrame", upfrontScrollAnim)
				else
				
					if (prevState == "select") then
						if (myData.isFireTV ) then 
							Runtime:addEventListener( "onFTVKey", touchedMenu )
						elseif (myData.isController) then
							Runtime:addEventListener("key", touchedMenu)
							Runtime:addEventListener( "axis", touchedMenuAxis )
						end
					end
				
					timer.performWithDelay( 400, makeButtonsActive )
				end
				
				closeParentalGate()
				currentState, prevState = prevState, currentState
				
				
				
			end
		
		
		elseif (event.keyName == nil or event.keyName and event.keyName ~= "back" and event.keyName ~= "b" and event.keyName ~= "deleteBack" and event.keyName ~= "right" and event.keyName ~= "left" and event.keyName ~= "down" and event.keyName ~= "up" and event.keyName ~= "buttonZ") then
		
			if (gateNumbers[1].text == "" or gateNumbers[2].text == "" or gateNumbers[3].text == "") then
				if savedData.enableSounds == true then
					playReservedChannel(clickSound, 8, 0)
				end
			end
		
			if (gateNumbers[1].text == "") then
				buttonsActive = false
				gateNumbers[1].text = thisButton.name
				timer.performWithDelay( 300, makeButtonsActive )
			elseif (gateNumbers[2].text == "") then
				buttonsActive = false
				gateNumbers[2].text = thisButton.name
				timer.performWithDelay( 300, makeButtonsActive )
			elseif (gateNumbers[3].text == "") then
				gateNumbers[3].text = thisButton.name
				
				if (gateRandomNumbers[1] == tonumber(gateNumbers[1].text) and
					gateRandomNumbers[2] == tonumber(gateNumbers[2].text) and
					gateRandomNumbers[3] == tonumber(gateNumbers[3].text) ) then
				
					if savedData.enableSounds == true then
						playReservedChannel(correctGateSound, 10, 0)
					end
				
					closeParentalGate()
					local function callSceneFunction()
						goToScene(nextScene)
					end
					timer.performWithDelay( 500, callSceneFunction )
				
				else
				
					if savedData.enableSounds == true then
						playReservedChannel(wrongGateSound, 10, 0)
					end
					
					parentalGateFlurry(nextScene, "wrong")
				
					-- gateNumbers[1].text = ""
					-- gateNumbers[2].text = ""
					-- gateNumbers[3].text = ""
					
					gateShakeNum = 1
					gateShakeLeft()					
				end
				
				
			end
		
		
		
		
		end
		
		
	end
	

end


function closeParentalGate()

	
	gateBG:removeEventListener("touch", parentalGateTouched )
	for i = #gateNumberButtons, 1, -1 do
		gateNumberButtons[i]:removeEventListener("touch", parentalGateTouched )
	end
	
	if (myData.isTV) then 
		Runtime:removeEventListener( "key", trackGateCursor )
		Runtime:removeEventListener( "axis", gateTrackCursorAxis )
		Runtime:removeEventListener( "onFTVKey", trackGateCursor )
		
		Runtime:removeEventListener( "key", parentalGateTouched )
		Runtime:removeEventListener( "onFTVKey", parentalGateTouched )
	
		if (gateCursor) then
			transition.to( gateCursor, { time=400, alpha=0, transition=easing.outExpo } )
		end
	end

	buttonsActive = false

	transition.to( gateBG, { time=1100, alpha=0, transition=easing.outExpo } )
	transition.to( parentalGateGroup, { time=1100, alpha=0, transition=easing.outExpo } )

	

end

function openParentalGate()

	prevState = currentState
	currentState = "parentalGate"
	
	

	gateRandomNumbers = { math.random( 0, 9 ), math.random( 0, 9 ), math.random( 0, 9 ) }

	gateNumberWords.text = ""
	if (gateRandomNumbers[1] == 0) then
		-- gateNumberWords[1].text = gateStrings[10]
		gateNumberWords.text = gateStrings[10]
	else
		-- gateNumberWords[1].text = gateStrings[gateRandomNumbers[1]]
		gateNumberWords.text = gateStrings[gateRandomNumbers[1]]
	end
	if (gateRandomNumbers[2] == 0) then
		-- gateNumberWords[2].text = gateStrings[10]
		gateNumberWords.text = gateNumberWords.text .. " " .. gateStrings[10]
	else
		-- gateNumberWords[2].text = gateStrings[gateRandomNumbers[2]]
		gateNumberWords.text = gateNumberWords.text .. " " .. gateStrings[gateRandomNumbers[2]]
	end
	if (gateRandomNumbers[3] == 0) then
		-- gateNumberWords[3].text = gateStrings[10]
		gateNumberWords.text = gateNumberWords.text .. " " .. gateStrings[10]
	else
		-- gateNumberWords[3].text = gateStrings[gateRandomNumbers[3]]
		gateNumberWords.text = gateNumberWords.text .. " " .. gateStrings[gateRandomNumbers[3]]
	end
	
	print(gateNumberWords.text)
	
	-- gateNumberWords[2].x = gateNumberWords[1].x + (gateNumberWords[2].contentWidth*0.5) + (gateNumberWords[1].contentWidth*0.5) + 8
	-- gateNumberWords[3].x = gateNumberWords[2].x + (gateNumberWords[3].contentWidth*0.5) + (gateNumberWords[2].contentWidth*0.5) + 8

	
	gateNumbers[1].text = ""
	gateNumbers[2].text = ""
	gateNumbers[3].text = ""
	
	
	-- gateWordsGroup.anchorChildren = true
	-- gateWordsGroup.anchorX, gateWordsGroup.anchorY = 0.5, 0.5
	-- gateWordsGroup.x = halfW
	-- gateWordsGroup.y = halfH - 46
	
	gateBG:addEventListener("touch", parentalGateTouched )
	for i = #gateNumberButtons, 1, -1 do
		gateNumberButtons[i]:addEventListener("touch", parentalGateTouched )
	end
	
	gateBG:toFront()
	parentalGateGroup:toFront()
	transition.to( gateBG, { time=1100, alpha=1, transition=easing.outExpo } )
	transition.to( parentalGateGroup, { time=1100, alpha=1, transition=easing.outExpo } )

	
	
	gateCursorOffsetX = -25
	gateCursorOffsetY = 25
	
	if (myData.isTV) then 
		currentCursorSelect = 1
		
		gateCursor.x = gateNumberButtons[1].x + gateCursorOffsetX
		gateCursor.y = gateNumberButtons[1].y + gateCursorOffsetY
			
		if (myData.isController) then
			Runtime:addEventListener( "key", trackGateCursor )
			Runtime:addEventListener( "axis", gateTrackCursorAxis )
			
			Runtime:addEventListener( "key", parentalGateTouched )
		elseif (myData.isFireTV) then
			Runtime:addEventListener( "onFTVKey", trackGateCursor )
			
			Runtime:addEventListener( "onFTVKey", parentalGateTouched )
		end
		
		
		gateCursor:toFront()
		transition.to( gateCursor, { time=700, alpha=1, transition=easing.outExpo, onComplete = makeButtonsActive } )
	
	else
	
		timer.performWithDelay( 700, makeButtonsActive )
	
	end
	
	
end


function initParentalGate()


	gateStrings = { "ONE", "TWO", "THREE", "FOUR", "FIVE", "SIX", "SEVEN", "EIGHT", "NINE", "ZERO" }

	gateNumbersGroup = display.newGroup()
	gateWordsGroup = display.newGroup()
	
	gateNumberButtons = {}
	gateNumberText = {}
	gateNumbers = {}



	gateBG = display.newImageRect("Images/UI/iapMenuBG.png", 900, 384 )
	gateBG.x = halfW
	gateBG.y = halfH
	-- gateBG:addEventListener("touch", parentalGateTouched )
	gateBG.name = "gateExit"
	-- parentalGateGroup:insert( gateBG )
	
	
	
	
	gateBack = display.newImageRect("Images/UI/parentalGateFrame.png", 344, 312 )
	gateBack.x = halfW
	gateBack.y = halfH
	gateBack:setFillColor( 241/255, 103/255, 69/255 )
	parentalGateGroup:insert( gateBack )
	
	gateFrontOne = display.newImageRect("Images/UI/parentalGateBackground.png", 344, 312 )
	gateFrontOne.x = halfW
	gateFrontOne.y = halfH
	gateFrontOne:setFillColor( 255/255, 198/255, 93/255 )
	parentalGateGroup:insert( gateFrontOne )
	
	
	
	if (myData.isTV) then 
	else
		gateExitBack = display.newImageRect("Images/UI/parentalGateButton.png", 52, 52 )
		gateExitBack.xScale, gateExitBack.yScale = 0.75, 0.75
		gateExitBack.x = halfW + 160
		gateExitBack.y = halfH - 144
		gateExitBack:setFillColor( 255/255, 0/255, 0/255 )
		parentalGateGroup:insert( gateExitBack )
	
		gateExit = display.newImageRect( "Images/UI/upfrontXButtonX.png", 20, 20 )
		gateExit.xScale, gateExit.yScale = 1,1 --2.2, 2.2
		gateExit.x = gateExitBack.x
		gateExit.y = gateExitBack.y - 1
		parentalGateGroup:insert( gateExit )
	end
	
	
	
	gateFrontTextBox = display.newImageRect("Images/UI/parentalGateTextbox.png", 224, 52 )
	gateFrontTextBox.x = halfW
	gateFrontTextBox.y = halfH - 15
	parentalGateGroup:insert( gateFrontTextBox )
	
	
	gateFrontUnderlines = display.newImageRect("Images/UI/parentalGateTextboxUnderlines.png", 144, 8 )
	gateFrontUnderlines.x = gateFrontTextBox.x
	gateFrontUnderlines.y = gateFrontTextBox.y + 16
	gateFrontUnderlines:setFillColor( 3/255, 119/255, 250/255 ) --( 147/255, 1/255, 128/255 )
	parentalGateGroup:insert( gateFrontUnderlines )
	
	
	
	
	gateTopTextBig = display.newText( "PARENTS ONLY", halfW, halfH - 116, dynamicFont, 25 )
	gateTopTextBig:setFillColor( 241/255, 103/255, 69/255 )
	if (system.getInfo( "platformName" ) == "Android"  ) then
		gateTopTextBig.y = halfH - 176
	end
	parentalGateGroup:insert( gateTopTextBig )
	
	gateTopTextSmall = display.newText( "ENTER THE NUMBERS BELOW", halfW, halfH - 90.5, dynamicFont, 17 )
	gateTopTextSmall:setFillColor( 241/255, 103/255, 69/255 )
	if (system.getInfo( "platformName" ) == "Android"  ) then
		gateTopTextSmall.y = halfH - 131
	end
	parentalGateGroup:insert( gateTopTextSmall )
	
	
	
	-- for i = 1, 3 do
	
		-- gateNumberWords[#gateNumberWords+1] = display.newText( "", halfW, halfH - 44.5, dynamicFont, 18 )
		-- gateNumberWords[#gateNumberWords]:setFillColor( 64/255, 139/255, 255/255 )
		-- gateWordsGroup:insert( gateNumberWords[#gateNumberWords] )
	
	-- end
	
	-- parentalGateGroup:insert( gateWordsGroup )
	
	local textOptions = 
	{
		text = "Test",     
		x = halfW,
		y = halfH - 61,
		width = 400, --required for multi-line and alignment
		font = dynamicFont,   
		fontSize = 24,
		align = "center"
	}
	
	gateNumberWords = display.newText( textOptions )
	gateNumberWords:setFillColor( 3/255, 119/255, 250/255 ) --( 147/255, 1/255, 128/255 )
	if (system.getInfo( "platformName" ) == "Android"  ) then
		gateNumberWords.y = halfH - 116
	end
	parentalGateGroup:insert( gateNumberWords )
	
	
	
	for i = 1, 3 do
	
		gateNumbers[#gateNumbers+1] = display.newText( "2", halfW, halfH - 17, dynamicFont, 30 )
		if (i == 1) then
			gateNumbers[#gateNumbers].x = halfW - 50
		elseif (i == 2) then
			gateNumbers[#gateNumbers].x = halfW + 2
		else
			gateNumbers[#gateNumbers].x = halfW + 54
		end
		if (system.getInfo( "platformName" ) == "Android"  ) then
			gateNumbers[#gateNumbers].y = halfH - 85
		end
		
		gateNumbers[#gateNumbers]:setFillColor( 3/255, 119/255, 250/255 ) --( 147/255, 1/255, 128/255 )
		parentalGateGroup:insert( gateNumbers[#gateNumbers] )
	
	end
	
	
	for i = 1, 10 do
	
		gateNumberButtons[#gateNumberButtons+1] = display.newImageRect("Images/UI/parentalGateButton.png", 52, 52 )
		
		if (i < 6) then
			gateNumberButtons[#gateNumberButtons].x = halfW - 114 + (i*54)
			gateNumberButtons[#gateNumberButtons].y = halfH + 55
		else
			gateNumberButtons[#gateNumberButtons].x = halfW - 114 + ((i-5)*54)
			gateNumberButtons[#gateNumberButtons].y = halfH + 109
		end
		gateNumberButtons[#gateNumberButtons]:setFillColor( 3/255, 119/255, 250/255 ) --( 147/255, 1/255, 128/255 )
		if (i ~= 10) then
			gateNumberButtons[#gateNumberButtons].name = i
		else
			gateNumberButtons[#gateNumberButtons].name = 0
		end
		-- gateNumberButtons[#gateNumberButtons]:addEventListener("touch", parentalGateTouched )
		gateNumbersGroup:insert( gateNumberButtons[#gateNumberButtons] )
		
		
		gateNumberText[#gateNumberText+1] = display.newText( "", halfW, halfH - 84.5, dynamicFont, 32 )
		gateNumberText[#gateNumberText]:setFillColor(1)
		if (i ~= 10) then
			gateNumberText[#gateNumberText].text = i
		else
			gateNumberText[#gateNumberText].text = 0
		end
		
		if (i == 2 or i == 3) then
			gateNumberText[#gateNumberText].x = gateNumberButtons[#gateNumberButtons].x + 1.5
			gateNumberText[#gateNumberText].y = gateNumberButtons[#gateNumberButtons].y + 1
		elseif (i == 5) then
			gateNumberText[#gateNumberText].x = gateNumberButtons[#gateNumberButtons].x + 2
			gateNumberText[#gateNumberText].y = gateNumberButtons[#gateNumberButtons].y + 1
		elseif (i == 7) then
			gateNumberText[#gateNumberText].x = gateNumberButtons[#gateNumberButtons].x + 1.7
			gateNumberText[#gateNumberText].y = gateNumberButtons[#gateNumberButtons].y + 2.2
		else
			gateNumberText[#gateNumberText].x = gateNumberButtons[#gateNumberButtons].x + 0.5
			gateNumberText[#gateNumberText].y = gateNumberButtons[#gateNumberButtons].y + 1
		end
		
		if (system.getInfo( "platformName" ) == "Android"  ) then
			gateNumberText[#gateNumberText].y = gateNumberText[#gateNumberText].y - 72
		end
		
		gateNumbersGroup:insert( gateNumberText[#gateNumberText] )
		
	
	end
	
	gateNumbersGroup.anchorChildren = true
	gateNumbersGroup.anchorX, gateNumbersGroup.anchorY = 0.5, 0.5
	gateNumbersGroup.x = halfW
	gateNumbersGroup.y = halfH + 78.5
	if (system.getInfo( "platformName" ) == "Android"  ) then
		gateNumbersGroup.y  = gateNumbersGroup.y - 72
	end
	
	parentalGateGroup:insert( gateNumbersGroup )
	
	
	
	gateCursor = display.newImageRect("Images/UI/cursorHand.png", 59, 59)
	gateCursor.x = 0
	gateCursor.y = 0
	gateCursor.alpha = 0
	parentalGateGroup:insert( gateCursor )
	
	
	
	gateBG.alpha = 0
	gateBG:toFront()
	parentalGateGroup.alpha = 0
	parentalGateGroup:toFront()	

end