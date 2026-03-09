--////////////////////////////////////////////////////////////////////////
--BEGIN Menu
--////////////////////////////////////////////////////////////////////////
menu = {}

local myData = require("Scripts.myData")

    --local menuGroup 
    itemIndex = 0
	local title
	local description
    local callback
    local touchOffsetX = 0
    local menuV = 0
    -- local spacing = display.contentCenterX + 50
	local spacing = (display.contentWidth * 0.5) + 50
    local origX = 0
	local textIndex
	local pressedSelectDown = false
	local pressedSelectDownAppleTV = false
    prevItemIndex = -1

    local function menuItemTouched(event)
        local target = event.target
        if event.phase == "ended" then --finger up
            --print("menuTouched: "..target.code)
            --callback(target.code)
        end
        return true
    end

	
	function changeBackground()
	
	
		if (currentWorld ~= menuGroup[1+itemIndex].world) then
			
		
					if (currentWorld == "World1") then
						transition.to( bg, { time=500, alpha = 0, transition=easing.outExpo } )
					elseif (currentWorld == "World2") then
						transition.to( bgTwo, { time=500, alpha = 0, transition=easing.outExpo } )
					elseif (currentWorld == "World3") then
						transition.to( bgThree, { time=500, alpha = 0, transition=easing.outExpo } )
					end
					if (menuGroup[1+itemIndex].world == "World1") then
						transition.to( bg, { time=500, alpha = 1, transition=easing.outExpo } )
					elseif (menuGroup[1+itemIndex].world == "World2") then
						transition.to( bgTwo, { time=500, alpha = 1, transition=easing.outExpo } )
					elseif (menuGroup[1+itemIndex].world == "World3") then
						transition.to( bgThree, { time=500, alpha = 1, transition=easing.outExpo } )
					end
					if (currentWorld == "World1" and menuGroup[1+itemIndex].world == "World2" or
						currentWorld == "World3" and menuGroup[1+itemIndex].world == "World2") then
						transition.to( sun, { time=500, alpha = 0, transition=easing.outExpo } )
						transition.to( sunTwo, { time=500, alpha = 1, transition=easing.outExpo } )
					elseif (currentWorld == "World2" and menuGroup[1+itemIndex].world == "World1" or
						currentWorld == "World2" and menuGroup[1+itemIndex].world == "World3") then
						transition.to( sun, { time=500, alpha = 1, transition=easing.outExpo } )
						transition.to( sunTwo, { time=500, alpha = 0, transition=easing.outExpo } )
					end
					-- if (currentWorld == "World1" and menuGroup[1+itemIndex].world == "World3" or
						-- currentWorld == "World2" and menuGroup[1+itemIndex].world == "World3") then
						
						-- transition.to( bgCloudsOneGroup, { time=500, alpha = 0, transition=easing.outExpo } )
						-- transition.to( bgCloudsTwoGroup, { time=500, alpha = 1, transition=easing.outExpo } )
						-- transition.to( bird, { time=500, alpha = 0, transition=easing.outExpo } )
						-- transition.to( ufo, { time=500, alpha = 1, transition=easing.outExpo } )
						-- questionText:setFillColor(255/255,255/255,255/255)
						-- questionTextTwo:setFillColor(255/255,255/255,255/255)
						-- for i = 1, totalLevels do
							-- menuGroup[i].z1:setFillColor(255/255,255/255,255/255)
							-- menuGroup[i].z2:setFillColor(255/255,255/255,255/255)
							-- menuGroup[i].z3:setFillColor(255/255,255/255,255/255)
						-- end
						-- lockMessage:setFillColor(255/255,255/255,255/255)
						-- message:setFillColor(255/255,255/255,255/255)
						-- unlockMessage:setFillColor(255/255,255/255,255/255)
						-- unlockBar:setFillColor(64/255,64/255,64/255)
						
					-- elseif (currentWorld == "World3" and menuGroup[1+itemIndex].world == "World1" or
							-- currentWorld == "World3" and menuGroup[1+itemIndex].world == "World2") then
							
						-- transition.to( bgCloudsOneGroup, { time=500, alpha = 1, transition=easing.outExpo } )
						-- transition.to( bgCloudsTwoGroup, { time=500, alpha = 0, transition=easing.outExpo } )
						-- transition.to( bird, { time=500, alpha = 1, transition=easing.outExpo } )
						-- transition.to( ufo, { time=500, alpha = 0, transition=easing.outExpo } )
						-- questionText:setFillColor(64/255,64/255,64/255)
						-- questionTextTwo:setFillColor(64/255,64/255,64/255)
						-- for i = 1, totalLevels do
							-- menuGroup[i].z1:setFillColor(64/255,64/255,64/255)
							-- menuGroup[i].z2:setFillColor(64/255,64/255,64/255)
							-- menuGroup[i].z3:setFillColor(64/255,64/255,64/255)
						-- end
						-- lockMessage:setFillColor(64/255,64/255,64/255)
						-- message:setFillColor(64/255,64/255,64/255)
						-- unlockMessage:setFillColor(64/255,64/255,64/255)
						-- unlockBar:setFillColor(255/255)
					-- end
					
					if (currentWorld == "World1") then
						questionText:setFillColor(255/255,255/255,255/255)
						questionTextTwo:setFillColor(255/255,255/255,255/255)
						-- backButton:setFillColor(255/255,255/255,255/255)
						for i = 1, totalLevels do
							menuGroup[i].z1:setFillColor(255/255,255/255,255/255)
							menuGroup[i].z2:setFillColor(255/255,255/255,255/255)
							menuGroup[i].z3:setFillColor(255/255,255/255,255/255)
						end
						lockMessage:setFillColor(255/255,255/255,255/255)
						message:setFillColor(255/255,255/255,255/255)
						unlockMessage:setFillColor(255/255,255/255,255/255)
						unlockBar:setFillColor(64/255,64/255,64/255)
					else
						questionText:setFillColor(5/255,78/255,124/255)
						questionTextTwo:setFillColor(5/255,78/255,124/255)
						-- backButton:setFillColor(64/255,64/255,64/255)
						for i = 1, totalLevels do
							menuGroup[i].z1:setFillColor(64/255,64/255,64/255)
							menuGroup[i].z2:setFillColor(64/255,64/255,64/255)
							menuGroup[i].z3:setFillColor(64/255,64/255,64/255)
						end
						lockMessage:setFillColor(64/255,64/255,64/255)
						message:setFillColor(64/255,64/255,64/255)
						unlockMessage:setFillColor(64/255,64/255,64/255)
						unlockBar:setFillColor(255/255)
					end
					
					currentWorld = menuGroup[1+itemIndex].world
					
				 end
	end
    
    function itemCentered(event)
			-- if ((math.abs(menuGroup[1+textIndex].x-256+menuGroup.x)) <= 30 and onLevelSelectScreen == true) then
				 
				 print("Test center 1")
				 
				 if onLevelSelectScreen == false and 1+textIndex == itemIndex+1 and savedData.enableSounds == true and charSoundTrasitioning == false and currentState ~= "title" and menuGroup[1+textIndex].levelID ~= rateChar or
					onLevelSelectScreen == true and savedData.enableSounds == true and charSoundTrasitioning == false and currentState ~= "title" and menuGroup[1+textIndex].levelID ~= rateChar then
					
					print("Test center 2")
					print(menuGroup[1+textIndex].sound)
					print(currentCharNameChannel)
					playReservedChannel(menuGroup[1+textIndex].sound, currentCharNameChannel, 0)
				 end
				 Runtime:removeEventListener( "enterFrame", itemCentered )
				 
				 currentCharNameChannel = currentCharNameChannel + 1
				 if (currentCharNameChannel > 10) then
					currentCharNameChannel = 9
				 end
			-- end
		return true
	end
	
	
	function zAnim(event)
	
		for i = 0, 2 do
		
			if (menuGroup[i+textIndex] and menuGroup[textIndex+i].levelID) then
				
				--print("test " .. i .. " " .. levels[menuGroup[textIndex+i].levelID+100])
			
				if (i+textIndex > totalLevels - repeatedLevelsNum and levels[300].repeatedLevels[i+textIndex-subFromRepeatLevels] and levels[300].repeatedLevels[i+textIndex-subFromRepeatLevels].locked == "locked" and menuGroup[textIndex+i].levelID ~= selectableChar and menuGroup[textIndex+i].levelID ~= iapChar and menuGroup[textIndex+i].levelID ~= rateChar or 
					i+textIndex > totalLevels - repeatedLevelsNum and i == 2 and levels[300].repeatedLevels[i+textIndex-subFromRepeatLevels] and levels[300].repeatedLevels[i+textIndex-subFromRepeatLevels].locked == "not locked" and endOfGame == true and levels[300].repeatedLevels[i+textIndex-subFromRepeatLevels].completed ~= "completed" and nextCharLocked == true and menuGroup[textIndex+i].levelID ~= selectableChar and menuGroup[textIndex+i].levelID ~= iapChar and menuGroup[textIndex+i].levelID ~= rateChar or
					i+textIndex <= totalLevels - repeatedLevelsNum and levels[menuGroup[textIndex+i].levelID+100] == "locked" and menuGroup[textIndex+i].levelID ~= selectableChar and menuGroup[textIndex+i].levelID ~= iapChar and menuGroup[textIndex+i].levelID ~= rateChar or 
					i+textIndex <= totalLevels - repeatedLevelsNum and i == 2 and levels[menuGroup[textIndex+i].levelID+100] == "not locked" and endOfGame == true and levels[menuGroup[textIndex+i].levelID] ~= "completed" and nextCharLocked == true and menuGroup[textIndex+i].levelID ~= selectableChar and menuGroup[textIndex+i].levelID ~= iapChar and menuGroup[textIndex+i].levelID ~= rateChar) then
			
			
			menuGroup[i+textIndex].z1.frame = menuGroup[i+textIndex].z1.frame + 1
			menuGroup[i+textIndex].z1.x =  menuGroup[i+textIndex].z1.initX + floatRangeZ * math.sin(menuGroup[i+textIndex].z1.frame/30)
			if (menuGroup[i+textIndex].z1.alpha - alphaAmount >= 0) then
				menuGroup[i+textIndex].z1.alpha = menuGroup[i+textIndex].z1.alpha - alphaAmount
			end
			menuGroup[i+textIndex].z1.xScale = menuGroup[i+textIndex].z1.xScale + scalingAmount
			menuGroup[i+textIndex].z1.yScale = menuGroup[i+textIndex].z1.yScale + scalingAmount
			menuGroup[i+textIndex].z1.y = menuGroup[i+textIndex].z1.y - floatSpeed
			if (menuGroup[i+textIndex].z1.y < menuGroup[i+textIndex].zInitY - floatHeight and endZZZ == false) then
				menuGroup[i+textIndex].z1.y = menuGroup[i+textIndex].zInitY
				menuGroup[i+textIndex].z1.alpha = 1
				menuGroup[i+textIndex].z1.xScale = initScale
				menuGroup[i+textIndex].z1.yScale = initScale
			end
			
			menuGroup[i+textIndex].z2.frame = menuGroup[i+textIndex].z2.frame + 1
			menuGroup[i+textIndex].z2.x =  menuGroup[i+textIndex].z2.initX - floatRangeZ * math.sin(menuGroup[i+textIndex].z2.frame/30)
			if (menuGroup[i+textIndex].z2.alpha - alphaAmount >= 0) then
				menuGroup[i+textIndex].z2.alpha = menuGroup[i+textIndex].z2.alpha - alphaAmount
			end
			menuGroup[i+textIndex].z2.xScale = menuGroup[i+textIndex].z2.xScale + scalingAmount
			menuGroup[i+textIndex].z2.yScale = menuGroup[i+textIndex].z2.yScale + scalingAmount
			menuGroup[i+textIndex].z2.y = menuGroup[i+textIndex].z2.y - floatSpeed
			if (menuGroup[i+textIndex].z2.y < menuGroup[i+textIndex].zInitY - floatHeight and endZZZ == false) then
				menuGroup[i+textIndex].z2.y = menuGroup[i+textIndex].zInitY
				menuGroup[i+textIndex].z2.alpha = 1
				menuGroup[i+textIndex].z2.xScale = initScale
				menuGroup[i+textIndex].z2.yScale = initScale
			end
			
			menuGroup[i+textIndex].z3.frame = menuGroup[i+textIndex].z3.frame + 1
			menuGroup[i+textIndex].z3.x =  menuGroup[i+textIndex].z3.initX + floatRangeZ * math.sin(menuGroup[i+textIndex].z3.frame/30)
			if (menuGroup[i+textIndex].z3.alpha - alphaAmount >= 0) then
				menuGroup[i+textIndex].z3.alpha = menuGroup[i+textIndex].z3.alpha - alphaAmount
			end
			menuGroup[i+textIndex].z3.xScale = menuGroup[i+textIndex].z3.xScale + scalingAmount
			menuGroup[i+textIndex].z3.yScale = menuGroup[i+textIndex].z3.yScale + scalingAmount
			menuGroup[i+textIndex].z3.y = menuGroup[i+textIndex].z3.y - floatSpeed
			if (menuGroup[i+textIndex].z3.y < menuGroup[i+textIndex].zInitY - floatHeight and endZZZ == false) then
				menuGroup[i+textIndex].z3.y = menuGroup[i+textIndex].zInitY
				menuGroup[i+textIndex].z3.alpha = 1
				menuGroup[i+textIndex].z3.xScale = initScale
				menuGroup[i+textIndex].z3.yScale = initScale
			end
				
				
				end
			end
		end
		
		return true
	end
	
	
	
	function sleepingCharAnim(event)
	
		
	
		if (textIndex > totalLevels - repeatedLevelsNum and menuGroup[textIndex] and menuGroup[textIndex].levelID and levels[300].repeatedLevels[textIndex-subFromRepeatLevels] and levels[300].repeatedLevels[textIndex-subFromRepeatLevels].locked == "locked" and menuGroup[textIndex].levelID ~= selectableChar and menuGroup[textIndex].levelID ~= iapChar and menuGroup[textIndex].levelID ~= rateChar or
			textIndex <= totalLevels - repeatedLevelsNum and menuGroup[textIndex] and menuGroup[textIndex].levelID and levels[menuGroup[textIndex].levelID+100] == "locked" and menuGroup[textIndex].levelID ~= selectableChar and menuGroup[textIndex].levelID ~= iapChar and menuGroup[textIndex].levelID ~= rateChar) then
			
			local function scaleCharUp(obj)
				local function scaleCharDown(obj2)
					char1Transition = transition.to( obj2, { time=1500, xScale=.95, yScale=.95,transition=easing.outExpo, onComplete=scaleCharUp  } )
				end
				char1Transition = transition.to( obj, { time=1500, xScale=1, yScale=1,transition=easing.outExpo, onComplete=scaleCharDown  } )
			end
			char1Transition = transition.to( menuGroup[textIndex], { time=1500, xScale=.95, yScale=.95,transition=easing.outExpo, onComplete=scaleCharUp  } )
		end
		if (textIndex+1 > totalLevels - repeatedLevelsNum and menuGroup[textIndex+1] and menuGroup[textIndex+1].levelID and levels[300].repeatedLevels[textIndex+1-subFromRepeatLevels] and levels[300].repeatedLevels[textIndex+1-subFromRepeatLevels].locked == "locked" and menuGroup[textIndex+1].levelID ~= selectableChar and menuGroup[textIndex+1].levelID ~= iapChar and menuGroup[textIndex+1].levelID ~= rateChar or
			textIndex+1 <= totalLevels - repeatedLevelsNum and menuGroup[textIndex+1] and menuGroup[textIndex+1].levelID and levels[menuGroup[textIndex+1].levelID+100] == "locked" and menuGroup[textIndex+1].levelID ~= selectableChar and menuGroup[textIndex+1].levelID ~= iapChar and menuGroup[textIndex+1].levelID ~= rateChar) then
			
			if (onLevelSelectScreen == true or onLevelSelectScreen == false and 1+textIndex == itemIndex+1) then
			
				local function scaleCharUp(obj)
					local function scaleCharDown(obj2)
						if savedData.enableSounds == true and charSoundTrasitioning == false then
							playReservedChannel(obj.snoreOne, 11, 0)
						end
						char2Transition = transition.to( obj2, { time=1500, xScale=.95, yScale=.95,transition=easing.outExpo, onComplete=scaleCharUp  } )
					end
					if savedData.enableSounds == true and charSoundTrasitioning == false then
						playReservedChannel(obj.snoreTwo, 12, 0)
					end
					char2Transition = transition.to( obj, { time=1500, xScale=1, yScale=1,transition=easing.outExpo, onComplete=scaleCharDown  } )
				end
				if savedData.enableSounds == true and charSoundTrasitioning == false then
					playReservedChannel(menuGroup[1+textIndex].snoreOne, 11, 0)
				end
				char2Transition = transition.to( menuGroup[1+textIndex], { time=1500, xScale=.95, yScale=.95,transition=easing.outExpo, onComplete=scaleCharUp  } )
			
			end
			
			
		end
		if (textIndex+2 > totalLevels - repeatedLevelsNum and menuGroup[textIndex+2] and menuGroup[textIndex+2].levelID and levels[300].repeatedLevels[textIndex+2-subFromRepeatLevels] and levels[300].repeatedLevels[textIndex+2-subFromRepeatLevels].locked == "locked" and menuGroup[textIndex+2].levelID ~= selectableChar and menuGroup[textIndex+2].levelID ~= iapChar and menuGroup[textIndex+2].levelID ~= rateChar
			or textIndex+2 > totalLevels - repeatedLevelsNum and menuGroup[textIndex+2] and menuGroup[textIndex+2].levelID and levels[300].repeatedLevels[textIndex+2-subFromRepeatLevels] and levels[300].repeatedLevels[textIndex+2-subFromRepeatLevels].locked == "not locked" and endOfGame == true and levels[300].repeatedLevels[textIndex+2-subFromRepeatLevels].completed ~= "completed" and nextCharLocked == true and menuGroup[textIndex+2].levelID ~= selectableChar and menuGroup[textIndex+2].levelID ~= iapChar and menuGroup[textIndex+2].levelID ~= rateChar or
			textIndex+2 <= totalLevels - repeatedLevelsNum and menuGroup[textIndex+2] and menuGroup[textIndex+2].levelID and levels[menuGroup[textIndex+2].levelID+100] == "locked" and menuGroup[textIndex+2].levelID ~= selectableChar and menuGroup[textIndex+2].levelID ~= iapChar and menuGroup[textIndex+2].levelID ~= rateChar
			or textIndex+2 <= totalLevels - repeatedLevelsNum and menuGroup[textIndex+2] and menuGroup[textIndex+2].levelID and levels[menuGroup[textIndex+2].levelID+100] == "not locked" and endOfGame == true and levels[menuGroup[textIndex+2].levelID] ~= "completed" and nextCharLocked == true and menuGroup[textIndex+2].levelID ~= selectableChar and menuGroup[textIndex+2].levelID ~= iapChar and menuGroup[textIndex+2].levelID ~= rateChar) then
			
			local function scaleCharUp(obj)
				local function scaleCharDown(obj2)
					char3Transition = transition.to( obj2, { time=1500, xScale=.95, yScale=.95,transition=easing.outExpo, onComplete=scaleCharUp  } )
				end
				char3Transition = transition.to( obj, { time=1500, xScale=1, yScale=1,transition=easing.outExpo, onComplete=scaleCharDown  } )
			end
			char3Transition = transition.to( menuGroup[2+textIndex], { time=1500, xScale=.95, yScale=.95,transition=easing.outExpo, onComplete=scaleCharUp  } )
		end
		Runtime:removeEventListener( "enterFrame", sleepingCharAnim )
		
		return true
	end
    
	
    
    function positionMenu(event)
	
	
       if menuGroup.numChildren > 0 then 
            local xDiff

            if (touchOffsetX~=0) then 
                menuGroup.x = touchOffsetX - (itemIndex*spacing) 
             --   xDiff = -((math.round(-menuGroup.x/spacing)*spacing)+menuGroup.x)
            else           
                xDiff = -((itemIndex*spacing)+menuGroup.x)
                if math.abs(menuV) < 2 and math.abs(xDiff) < 2 then
                    menuV = 0
                    menuGroup.x = menuGroup.x + xDiff
                else
                    menuV = .82*menuV + .04*xDiff
                    menuGroup.x = menuGroup.x + menuV
                end           
				
            end
			

				for i = 1, menuGroup.numChildren do
					if (i > totalLevels - repeatedLevelsNum and menuGroup[i] and menuGroup[i].levelID and levels[300].repeatedLevels[i-subFromRepeatLevels] and levels[300].repeatedLevels[i-subFromRepeatLevels].locked == "not locked" or
						i <= totalLevels - repeatedLevelsNum and menuGroup[i] and menuGroup[i].levelID and levels[menuGroup[i].levelID+100] == "not locked") then
						
						if (menuGroup[i]) then
						
							
							if (endOfGame == false or 
								endOfGame == true and variation == 4 and unlockedEverything == false and unlockedWeeklySub == false and unlockedMonthlySub == false and unlockedYearlySub == false
									and menuGroup[i].levelID ~= unlockedLevels[textIndex+1] and levels[unlockedLevels[textIndex+1]] ~= "completed" or
								endOfGame == true and variation == 5 and codeIndexStart == (levelsNum-1) and i ~= level+1 and levels[level+1] ~= "completed" or
								endOfGame == true and variation == 5 and codeIndexStart == levelsNum and i < codeIndexStart and i ~= level+1 and levels[level+1] ~= "completed" or
								endOfGame == true and variation == 5 and codeIndexStart == levelsNum and i > codeIndexStart-1 and i-1 ~= level+1 and levels[level+1] ~= "completed" or
								endOfGame == true and unlockedEverything == true and codeIndexStart == (levelsNum-1) and i ~= level+1 and levels[level+1] ~= "completed" or
								endOfGame == true and unlockedEverything == true and codeIndexStart == levelsNum and i < codeIndexStart and i ~= level+1 and levels[level+1] ~= "completed" or
								endOfGame == true and unlockedEverything == true and codeIndexStart == levelsNum and i > codeIndexStart-1 and i-1 ~= level+1 and levels[level+1] ~= "completed" or
								endOfGame == true and unlockedWeeklySub == true and codeIndexStart == (levelsNum-1) and i ~= level+1 and levels[level+1] ~= "completed" or
								endOfGame == true and unlockedWeeklySub == true and codeIndexStart == levelsNum and i < codeIndexStart and i ~= level+1 and levels[level+1] ~= "completed" or
								endOfGame == true and unlockedWeeklySub == true and codeIndexStart == levelsNum and i > codeIndexStart-1 and i-1 ~= level+1 and levels[level+1] ~= "completed" or
								endOfGame == true and unlockedMonthlySub == true and codeIndexStart == (levelsNum-1) and i ~= level+1 and levels[level+1] ~= "completed" or
								endOfGame == true and unlockedMonthlySub == true and codeIndexStart == levelsNum and i < codeIndexStart and i ~= level+1 and levels[level+1] ~= "completed" or
								endOfGame == true and unlockedMonthlySub == true and codeIndexStart == levelsNum and i > codeIndexStart-1 and i-1 ~= level+1 and levels[level+1] ~= "completed" or
								endOfGame == true and unlockedYearlySub == true and codeIndexStart == (levelsNum-1) and i ~= level+1 and levels[level+1] ~= "completed" or
								endOfGame == true and unlockedYearlySub == true and codeIndexStart == levelsNum and i < codeIndexStart and i ~= level+1 and levels[level+1] ~= "completed" or
								endOfGame == true and unlockedYearlySub == true and codeIndexStart == levelsNum and i > codeIndexStart-1 and i-1 ~= level+1 and levels[level+1] ~= "completed") then
								
								menuGroup[i].eyelids.alpha = 0
								menuGroup[i].z1.alpha = 0
								menuGroup[i].z2.alpha = 0
								menuGroup[i].z3.alpha = 0
							end
						end
					end
					
					
					if (menuGroup[i] and menuGroup[i].levelID == selectableChar) then
						menuGroup[i].xScale = 1
						menuGroup[i].yScale = 1
					end
				end
				
				
			
			-- for i = 1, totalLevels do
				-- for j = 1, #lockedLevels do
					-- if (lockedLevels[j] == menuGroup[i].levelID and menuGroup[i].levelID ~= selectableChar and menuGroup[i].levelID ~= iapChar and menuGroup[i].levelID ~= rateChar) then
						-- menuGroup[i].lock.alpha = 1
					-- end
				-- end
			  -- end
			for i = 1, totalLevels do
				local isInLockedLevels = false
				for j = 1, #lockedLevels do
					if (lockedLevels[j] == menuGroup[i].levelID and menuGroup[i].levelID ~= selectableChar and menuGroup[i].levelID ~= iapChar and menuGroup[i].levelID ~= rateChar) then
						isInLockedLevels = true
					end
				end
				if (menuGroup[i].lock) then
					if (isInLockedLevels == true) then
						menuGroup[i].lock.alpha = 1
					else
						menuGroup[i].lock.alpha = 0
					end
				end
			  end
			if (variation == 5 or unlockedEverything == true or unlockedWeeklySub == true or unlockedMonthlySub == true or unlockedYearlySub == true) then
				for i = #menuGroup, 1, -1 do
					menuGroup[i].lock.alpha = 0
				end
			end


			if (currentState ~= "select") then
				pressedSelectDownAppleTV = false
			end

           -- local alpha = math.abs(1-((menuGroup.x+(.25*spacing))%spacing)/spacing)
            --alpha = math.abs(((xDiff+(.5*spacing))%spacing)/spacing)
           -- print(alpha)
           -- title.alpha = alpha
             textIndex = math.round(-menuGroup.x/spacing)
			 
			 if (textIndex+1 > totalLevels - repeatedLevelsNum and menuGroup[textIndex+1] and menuGroup[textIndex+1].text and levels[300].repeatedLevels[textIndex+1-subFromRepeatLevels] and levels[300].repeatedLevels[textIndex+1-subFromRepeatLevels].completed == "completed" and levelCompleted == false and menuGroup[textIndex+1].levelID ~= selectableChar and menuGroup[textIndex+1].levelID ~= iapChar and menuGroup[textIndex+1].levelID ~= rateChar or
				textIndex+1 <= totalLevels - repeatedLevelsNum and menuGroup[textIndex+1] and menuGroup[textIndex+1].text and levels[menuGroup[textIndex+1].levelID] == "completed" and levelCompleted == false and menuGroup[textIndex+1].levelID ~= selectableChar and menuGroup[textIndex+1].levelID ~= iapChar and menuGroup[textIndex+1].levelID ~= rateChar) then
					star.alpha = 1
					-- star.x = halfW - (title.width/2) - 3 --was-5
					-- star.x = signText.x - 50
					--description.text = " " .. menuGroup[1+textIndex].text
				 elseif (textIndex+1 > totalLevels - repeatedLevelsNum and menuGroup[textIndex+1] and menuGroup[textIndex+1].text and levelCompleted == true and levelNotCompleted == true and levels[300].repeatedLevels[textIndex+1-subFromRepeatLevels].completed ~= "completed" and menuGroup[itemIndex+1].levelID ~= selectableChar and menuGroup[itemIndex+1].levelID ~= iapChar and menuGroup[itemIndex+1].levelID ~= rateChar or
						textIndex+1 <= totalLevels - repeatedLevelsNum and menuGroup[textIndex+1] and menuGroup[textIndex+1].text and levelCompleted == true and levelNotCompleted == true and levels[menuGroup[itemIndex+1].levelID] ~= "completed" and menuGroup[itemIndex+1].levelID ~= selectableChar and menuGroup[itemIndex+1].levelID ~= iapChar and menuGroup[itemIndex+1].levelID ~= rateChar) then
					---description.text = " " .. menuGroup[1+textIndex].text
					star.alpha = 0
				 elseif (textIndex+1 > totalLevels - repeatedLevelsNum and menuGroup[textIndex+1] and menuGroup[textIndex+1].text and levelCompleted == true and levelNotCompleted == false and levels[300].repeatedLevels[textIndex+1-subFromRepeatLevels].completed == "completed" and menuGroup[itemIndex+1].levelID ~= selectableChar and menuGroup[itemIndex+1].levelID ~= iapChar and menuGroup[itemIndex+1].levelID ~= rateChar or
						textIndex+1 <= totalLevels - repeatedLevelsNum and menuGroup[textIndex+1] and menuGroup[textIndex+1].text and levelCompleted == true and levelNotCompleted == false and levels[menuGroup[itemIndex+1].levelID] == "completed" and menuGroup[itemIndex+1].levelID ~= selectableChar and menuGroup[itemIndex+1].levelID ~= iapChar and menuGroup[itemIndex+1].levelID ~= rateChar) then
					star.alpha = 1
					-- star.x = halfW - (title.width/2) - 3 --was-5
					-- star.x = signText.x - 50
					--description.text = " " .. menuGroup[1+textIndex].text
				 else
					star.alpha = 0
					
					
				 end
				 
				 if (star.alpha == 1) then
					description.x = description.initX + 5
				 end
				 star.x = description.x - (description.width*0.5) + star.offsetX
			 
			 changeBackground()
			 
			 
			 if (currentState == "parentalGate" or menuGroup[textIndex+1] and menuGroup[1+textIndex].levelID == selectableChar or 
					menuGroup[textIndex+1] and menuGroup[textIndex+1].levelID == iapChar or 
					menuGroup[textIndex+1] and menuGroup[textIndex+1].levelID == rateChar) then
				
				if (currentState == "parentalGate") then
					title.alpha = 0
					description.alpha = 0
				else
					title.alpha = 1
					description.alpha = 1
				end
				selectSign.alpha = 0
				selectSignText.alpha = 0
			else
				title.alpha = 1
				description.alpha = 1
				selectSignText.alpha = 1
				selectSign.alpha = 1
			 end
			 
             if textIndex > menuGroup.numChildren-1 then 
                 textIndex = menuGroup.numChildren-1
             end
             if textIndex < 0 then 
                 textIndex = 0
             end
             if prevItemIndex ~= textIndex or 
					fromMenu == true then 
				
				
				local levelEditorDetails
				
				if (menuGroup[1+textIndex].levelID) then
					levelEditorDetails = levelEditor["Level" .. tostring(menuGroup[1+textIndex].levelID)]
				end
				
				
				selectSign.x = halfW
				
				
                 title.text = menuGroup[1+textIndex].text
				 title.align = "center"
				 -- title.x = halfW + menuGroup[1+textIndex].textOffsetX
				 
				 
				 if (levelEditorDetails == nil) then
					 title.x = title.origX
					 title.y = title.origY
					 title.fontSize = title.origSize
				 else
					 title.x = title.origX + levelEditorDetails.selectScreenNameTextXOffset
					 title.y = title.origY + levelEditorDetails.selectScreenNameTextYOffset
					 title.fontSize = title.origSize + levelEditorDetails.selectScreenNameTextSizeOffset
				 end
				 
				  title:setFillColor(255/255,254/255,240/255)
				 -- print(title.width)
				 
				 -- if (levels[textIndex+1] == "completed") then
					-- star.alpha = 1
					-- star.x = halfW - (title.width/2) - 10
					-- title.text = " " .. menuGroup[1+textIndex].text
				 -- elseif (levelCompleted == true) then
					-- title.text = " " .. menuGroup[1+textIndex].text
					-- star.alpha = 0
				 -- else
					-- star.alpha = 0
				 -- end
				 -- print("StarX: " .. star.x)
				 -- print("StarY: " .. star.y)
				 description.text = menuGroup[1+textIndex].text2
				 description.align = "center"
				 -- description.x = halfW
				 
				 if (levelEditorDetails == nil) then
					 description.x = description.origX
					 description.y = description.origY
					 description.fontSize = description.origSize
				 else
					 description.x = description.origX + levelEditorDetails.selectScreenSubtitleTextXOffset
					 description.y = description.origY + levelEditorDetails.selectScreenSubtitleTextYOffset
					 description.fontSize = description.origSize + levelEditorDetails.selectScreenSubtitleTextSizeOffset
				 end
                 
				 description:setFillColor(255/255,254/255,240/255)
				 
				 selectSignText.text = menuGroup[1+textIndex].selectSignText
				 selectSignText.align = "center"
				 
				 selectSignText.x = halfW + menuGroup[1+textIndex].signTextOffsetX
				 selectSignText.y = title.y + menuGroup[1+textIndex].signTextOffsetY
				 
				 if system.getInfo( "platformName" ) == "Android" then
					selectSignText.y = title.y + menuGroup[1+textIndex].signTextOffsetY + 34
				 end
				 
				 selectSignText:setFillColor(255/255,254/255,240/255)
				 
				 -- if (description.text == "") then
					-- selectSign.alpha = 0
					-- selectSignText.text = ""
				 -- end
				 
				 
				 Runtime:removeEventListener( "enterFrame", sleepingCharAnim )
				 Runtime:removeEventListener( "enterFrame", zAnim )
				 if (char1Transition) then
					transition.cancel(char1Transition)
					char1Transition = nil
				 end
				 if (char2Transition) then
					transition.cancel(char2Transition)
					char2Transition = nil
				 end
				 if (char3Transition) then
					transition.cancel(char3Transition)
					char3Transition = nil
				 end
				 
				 if (menuGroup[prevItemIndex-1]) then
					menuGroup[prevItemIndex-1].xScale, menuGroup[prevItemIndex-1].yScale = 1, 1
				 end
				 if (menuGroup[prevItemIndex]) then
					menuGroup[prevItemIndex].xScale, menuGroup[prevItemIndex].yScale = 1, 1
				 end
				 if (menuGroup[prevItemIndex]) then
					menuGroup[prevItemIndex+1].xScale, menuGroup[prevItemIndex+1].yScale = 1, 1
				 end
				  -- transition.to( menuGroup[prevItemIndex], { time=500, xScale=1, yScale=1,transition=easing.outExpo  } )
				  -- transition.to( menuGroup[1+prevItemIndex], { time=500, xScale=1, yScale=1,transition=easing.outExpo  } )
				  -- transition.to( menuGroup[2+prevItemIndex], { time=500, xScale=1, yScale=1,transition=easing.outExpo  } )
				 
				 -- if (menuGroup[textIndex] and levels[menuGroup[textIndex].levelID+100] == "locked" 
					-- or menuGroup[textIndex+1] and levels[menuGroup[textIndex+1].levelID+100] == "locked" 
					-- or menuGroup[textIndex+2] and levels[menuGroup[textIndex+2].levelID+100] == "locked" 
					-- or endOfGame == true) then
					
					Runtime:addEventListener( "enterFrame", sleepingCharAnim )
					Runtime:addEventListener( "enterFrame", zAnim )
				 -- end
				 
				 
				 
				 if (prevGoToIndex and textIndex == itemIndex and prevGoToIndex < itemIndex + 3 or
					textIndex == itemIndex and prevItemIndex == textIndex - 1 or
					textIndex == itemIndex and prevItemIndex == textIndex + 1) then
					
					sleepCharTouched = false
				 end
				 prevItemIndex = textIndex
				 
				 if (fromMenu == true) then
					fromMenu = false
				end
				if (fromGame == true) then
					fromGame = false
				elseif (menuUnload == true) then
				-- elseif (loadingMenu == true) then
					-- loadingMenu = false
				elseif (sleepCharTouched == true) then
				 else
					Runtime:addEventListener( "enterFrame", itemCentered )
				 end
				
             end
			 
			 
			 
			 if (menuGroup[1+textIndex].levelID == iapChar) then
			 
			 
				-- for i = 1, #menuGroup[1+textIndex].scrollImages do
					-- menuGroup[1+textIndex].scrollImages[i].x = menuGroup[1+textIndex].scrollImages[i].x - .5
					-- menuGroup[1+textIndex].scrollImages[i].maskX = menuGroup[1+textIndex].scrollImages[i].maskX + .5
					
					-- if (menuGroup[1+textIndex].scrollImages[i].x < (menuGroup[1+textIndex].item.x - (menuGroup[1+textIndex].item.width*0.5) - (menuGroup[1+textIndex].scrollImages[i].width*0.5) ) ) then
						-- if (i ~= 1) then
							-- local oldX = menuGroup[1+textIndex].scrollImages[i].x
							-- menuGroup[1+textIndex].scrollImages[i].x = menuGroup[1+textIndex].scrollImages[i-1].x + menuGroup[1+textIndex].scrollImages[i].width - 1
							-- local newX = menuGroup[1+textIndex].scrollImages[i].x
							-- menuGroup[1+textIndex].scrollImages[i].maskX = menuGroup[1+textIndex].scrollImages[i].maskX - (newX - oldX)
						-- else
							-- local oldX = menuGroup[1+textIndex].scrollImages[i].x
							-- menuGroup[1+textIndex].scrollImages[i].x = menuGroup[1+textIndex].scrollImages[#scrollImages].x + menuGroup[1+textIndex].scrollImages[i].width - 1
							-- local newX = menuGroup[1+textIndex].scrollImages[i].x
							-- menuGroup[1+textIndex].scrollImages[i].maskX = menuGroup[1+textIndex].scrollImages[i].maskX - (newX - oldX)
						-- end
					-- end
				-- end
			 
			 end
			 
			 
			 if (menuGroup[1+textIndex].priceText) then
				if (iap_getProductPrice("monthly") ~= "" and menuGroup[1+textIndex].priceText.text == "GET!") then
					menuGroup[1+textIndex].priceText.text = iap_getProductPrice("monthly")
				end
			end
			if (menuGroup[1+textIndex].priceTextAll) then
				-- if (version.appStore == "Google Play") then
					-- if (iap_getProductPrice(version.unlockItems.AllLimited) ~= "" and menuGroup[1+textIndex].priceTextAll.text == "GET!") then
						-- menuGroup[1+textIndex].priceTextAll.text = iap_getProductPrice(version.unlockItems.AllLimited)
					-- end
				-- else
					if (iap_getProductPrice(version.unlockItems.All) ~= "" and menuGroup[1+textIndex].priceTextAll.text == "GET!") then
						menuGroup[1+textIndex].priceTextAll.text = iap_getProductPrice(version.unlockItems.All)
					end
				-- end
			end
			if (menuGroup[1+textIndex].saleText) then
				if (iap_getProductPrice(version.unlockItems.All) ~= "" and menuGroup[1+textIndex].saleText.text == "GET!") then
					-- menuGroup[1+textIndex].saleText.text = iap_getProductPrice(version.unlockItems.AllLimited)
					menuGroup[1+textIndex].saleText.text = iap_getProductPrice(version.unlockItems.All)
				end
			end
			-- if (menuGroup[1+textIndex].salePercent) then
				-- if (menuGroup[1+textIndex].salePercent.text == "GET!") then
					-- menu.calcPercent()
					-- if (roundDownNum ~= "GET!") then
						-- menuGroup[1+textIndex].salePercent.text = roundDownNum .. "%"
					-- end
				-- end
			-- end
			 
			 
			 if (startNextLevel == true) then
				
				startNextLevel = false
				
				local unlockedIAP = true
				for i = 1, #lockedLevels do
					if (menuGroup[1+textIndex] and lockedLevels[i] == menuGroup[1+textIndex].levelID and menuGroup[1+textIndex].levelID ~= selectableChar and menuGroup[1+textIndex].levelID ~= iapChar and menuGroup[1+textIndex].levelID ~= rateChar) then
						unlockedIAP = false
					end
				end
				
					
					if (textIndex+1 > totalLevels - repeatedLevelsNum and menuGroup[1+textIndex] and unlockedIAP == true and levels[300].repeatedLevels[1+textIndex-subFromRepeatLevels].locked == "not locked" and menuGroup[1+textIndex].levelID ~= selectableChar and menuGroup[1+textIndex].levelID ~= iapChar and menuGroup[1+textIndex].levelID ~= rateChar or
						textIndex+1 <= totalLevels - repeatedLevelsNum and menuGroup[1+textIndex] and unlockedIAP == true and levels[menuGroup[1+textIndex].levelID+100] == "not locked" and menuGroup[1+textIndex].levelID ~= selectableChar and menuGroup[1+textIndex].levelID ~= iapChar and menuGroup[1+textIndex].levelID ~= rateChar) then
						
								
								if (menuGroup[1+textIndex].code >= repeatedCharStart) then
									playingRandomGame = true
									
									randomLevelChallenge = savedData[textIndex+1-subFromRepeatLevels .. "randomLevelSelect"]
									randomLevelChallenge = tostring(randomLevelChallenge)
									level = randomLevelDetails["random" .. randomLevelChallenge].character
									
									charLevel = menuGroup[1+textIndex].levelID
								else
									playingRandomGame = false
									
									level = menuGroup[1+textIndex].levelID
								end
								
								currentLevel = 1+itemIndex
								
								
								levelOptions = gameDetails["level" .. level]
								gameOptions = levelOptions["game" .. curGame]
								
								
								if (menuGroup[1+textIndex].text) then
									-- Flurry 2019
									-- logAnalyticEvent(menuGroup[1+textIndex].text .. " opened automatically")
								end
								
									-- local gameMode = gameOptions.mode
								-- if (gameType == "matching") then
									-- if (gameMode == "showMe") then
										-- gameplayMode = 1
									-- else
										-- gameplayMode = 2
									-- end
								-- elseif (gameType == "equation") then
									-- gameplayMode = 3
								-- end
								
								if (menuGroup[textIndex]) then
									menuGroup[textIndex].xScale, menuGroup[textIndex].yScale = 1, 1
								 end
								 if (menuGroup[2+textIndex]) then
									menuGroup[2+textIndex].xScale, menuGroup[2+textIndex].yScale = 1, 1
								 end
								 -- if (char1Transition) then
									-- transition.cancel(char1Transition)
									-- char1Transition = nil
								 -- end
								 -- if (char2Transition) then
									-- transition.cancel(char2Transition)
									-- char2Transition = nil
								 -- end
								 -- if (char3Transition) then
									-- transition.cancel(char3Transition)
									-- char3Transition = nil
								 -- end
								
								currentState = "game"
								
								menu.unload()
								bgWhite:toFront()
								line1:toFront()
								line3:toFront()
								line5:toFront()
								transition.to( backButton, { time=700, alpha = 0, transition=easing.outExpo } )
								transition.to( menuGroup[1+textIndex], { time=700, xScale=1.5, yScale=1.5 , transition=easing.outExpo } )
								transition.to( menuGroup[1+textIndex], { delay=700, time=1, xScale=1, yScale=1 , transition=easing.outExpo } )
								transition.to( mainContainer, { delay=710, time=900, alpha = 0, x=((1+textIndex)*256)+2000 , transition=easing.outExpo } )
								transition.to( bgWhite, { time=700, alpha = 1, transition=easing.outExpo, onComplete=gameStartAnim1  } )
								-- transition.to( bgWhite, { delay=3900, time=700, alpha = 0, transition=easing.outExpo } )
								transition.to( title, { time=700, alpha=0, transition=easing.outExpo} )
								transition.to( description, { time=700, alpha=0, transition=easing.outExpo} )
								transition.to( selectSign, { time=700, alpha=0, transition=easing.outExpo} )
								transition.to( selectSignText, { time=700, alpha=0, transition=easing.outExpo} )
								transition.to( star, { time=700, alpha=0, transition=easing.outExpo} )
								
								audio.fade( { channel=1 , time=1000 , volume=0  } )
								audio.fade( { channel=2 , time=1000 , volume=0  } )
								audio.fade( { channel=12 , time=1000 , volume=0  } )
								
								endOfGame = false
								endZZZ = false
								closeEyes = false
								
								menuGroup[textIndex+1].eyelids.alpha = 0
								menuGroup[textIndex+1].z1.alpha = 0
								menuGroup[textIndex+1].z2.alpha = 0
								menuGroup[textIndex+1].z3.alpha = 0
								
								if savedData.enableSounds == true then
									playReservedChannel(harpTransitionSound, 18, 0)
								end
								
								-- Runtime:removeEventListener( "enterFrame", sleepingCharAnim )
								-- Runtime:removeEventListener( "enterFrame", zAnim )
								
								if (endGameTimer) then
									timer.cancel( endGameTimer )
									endGameTimer = nil
								end
								if (endGameTransition) then
									transition.cancel( endGameTransition )
									endGameTransition = nil
								end
						end
				
			 end
			 
       end
    end
	
	
	
	function nextItem()
	
		if (levels[300].repeatedLevels[itemIndex+3-subFromRepeatLevels] == nil) then
			levels[300].repeatedLevels[itemIndex+3-subFromRepeatLevels] = {}
			levels[300].repeatedLevels[itemIndex+3-subFromRepeatLevels].completed = "not completed"
			levels[300].repeatedLevels[itemIndex+3-subFromRepeatLevels].locked = "locked"
			
		end
		
		if (menuGroup[1+itemIndex+1].code >= repeatedCharStart) then
			
			if (savedData[1+itemIndex+1-subFromRepeatLevels .. "randomLevelSelect"]) then
			
			else						
				local numRandomLevels = 0

				for i = 1, 100 do
					if (randomLevelDetails["random" .. tostring(i)]) then
						numRandomLevels = numRandomLevels + 1
					end
				end
				repeat
					savedData[1+itemIndex+1-subFromRepeatLevels .. "randomLevelSelect"] = math.random( 1, numRandomLevels )
				until savedData[1+itemIndex+1-subFromRepeatLevels-1 .. "randomLevelSelect"] ~= savedData[1+itemIndex+1-subFromRepeatLevels .. "randomLevelSelect"] and
						savedData[1+itemIndex+1-subFromRepeatLevels-2 .. "randomLevelSelect"] ~= savedData[1+itemIndex+1-subFromRepeatLevels .. "randomLevelSelect"] and
						savedData[1+itemIndex+1-subFromRepeatLevels-3 .. "randomLevelSelect"] ~= savedData[1+itemIndex+1-subFromRepeatLevels .. "randomLevelSelect"] or
						numRandomLevels < 5
			
				save()
			end
			
			
			local tempLevelDet = savedData[1+itemIndex+1-subFromRepeatLevels .. "randomLevelSelect"]
			
			menuGroup[1+itemIndex+1].text2 = randomLevelDetails["random" .. tempLevelDet].text
			
		end
		
		if (itemIndex >= menuGroup.numChildren - 2) then
		
			local tempRect = display.newRect( 0, 0, 1, 1 )
			tempRect.alpha = 0
			menuGroup:insert( tempRect )
			
			for i = 1, (repeatedLevelsNum-1) do
				menuGroup[menuGroup.numChildren-(repeatedLevelsNum-1)]:toFront()
			end
			
			
			menuGroup[menuGroup.numChildren-repeatedLevelsNum]:toFront()
			
			menuGroup[menuGroup.numChildren].x = halfW + (spacing*(menuGroup.numChildren-1))
			
			if (levels[300].repeatedLevels[menuGroup.numChildren-subFromRepeatLevels].locked == "not locked") then
				menuGroup[menuGroup.numChildren].eyelids.alpha = 0
			else
				menuGroup[menuGroup.numChildren].eyelids.alpha = 1
			end
			
			
			
			if (menuGroup[menuGroup.numChildren].code >= repeatedCharStart) then
			
				if (savedData[menuGroup.numChildren-subFromRepeatLevels .. "randomLevelSelect"]) then
				
					local tempLevelDet = savedData[menuGroup.numChildren-subFromRepeatLevels .. "randomLevelSelect"]
				
					menuGroup[menuGroup.numChildren].text2 = randomLevelDetails["random" .. tempLevelDet].text
					
				
				end
			
			end
			
		end
		
	
	end
	
	function previousItem()
	
	
		-- WAS itemIndex > totalLevels + 5
		if (itemIndex >= totalLevels - 2 and itemIndex <= menuGroup.numChildren - 2) then
			
			menuGroup[menuGroup.numChildren].x = halfW + (spacing*(menuGroup.numChildren-(repeatedLevelsNum+1)))
			
			
			menuGroup[menuGroup.numChildren-repeatedLevelsNum]:removeSelf();
		
			for i = 1, (repeatedLevelsNum-1) do
				menuGroup[menuGroup.numChildren-(repeatedLevelsNum-1)]:toFront()
			end
			
			
			if (levels[300].repeatedLevels[menuGroup.numChildren-(repeatedLevelsNum-1)-subFromRepeatLevels] and levels[300].repeatedLevels[menuGroup.numChildren-(repeatedLevelsNum-1)-subFromRepeatLevels].locked == "not locked") then
				menuGroup[menuGroup.numChildren-(repeatedLevelsNum-1)].eyelids.alpha = 0
			else
				menuGroup[menuGroup.numChildren-(repeatedLevelsNum-1)].eyelids.alpha = 1
			end
			
			
			if (menuGroup[menuGroup.numChildren-(repeatedLevelsNum-1)].code >= repeatedCharStart) then
			
				if (savedData[menuGroup.numChildren-(repeatedLevelsNum-1)-subFromRepeatLevels .. "randomLevelSelect"]) then
				
					local tempLevelDet = savedData[menuGroup.numChildren-(repeatedLevelsNum-1)-subFromRepeatLevels .. "randomLevelSelect"]
				
					menuGroup[menuGroup.numChildren-(repeatedLevelsNum-1)].text2 = randomLevelDetails["random" .. tempLevelDet].text
					
				
				end
			
			end
			
			
		end
	
	end
	
	
	
    
    function touchedMenu(event)
		local keyName = event.keyName
		
		
		
		
		
		if (buttonsActive == true and currentState == "select") then
	
			local unlockedIAP = true
			-- print(lockedLevels)
			
			if (variation == 5 or unlockedEverything == true or unlockedWeeklySub == true or unlockedMonthlySub == true or unlockedYearlySub == true or 
			variation == 4 and unlockedEverything == false and unlockedWeeklySub == false and unlockedMonthlySub == false and unlockedYearlySub == false and menuGroup[1+textIndex].levelID <= #lockedLevels + #unlockedLevels) then
			
				for i = 1, #lockedLevels do
				
					if (menuGroup[1+textIndex] and lockedLevels[i] == menuGroup[1+textIndex].levelID and menuGroup[1+textIndex].levelID ~= selectableChar and menuGroup[1+textIndex].levelID ~= iapChar and menuGroup[1+textIndex].levelID ~= rateChar) then
						unlockedIAP = false
					end
				end
				
			else
			
				unlockedIAP = false
			
			end
			
			
			if (system.getInfo ("model") == "Apple TV" and event.phase == "down" and keyName == "buttonA") then
				pressedSelectDownAppleTV = true
			elseif (system.getInfo ("model") == "Apple TV" and event.phase == "up" and keyName == "buttonA") then
				pressedSelectDownAppleTV = false
			end
			
			
			if (system.getInfo ("model") == "Apple TV" and event.phase == "down" and keyName == "buttonA") then
				pressedSelectDown = false
			end
			
			
			if event.phase=="began" or 
				keyName and event.phase == "down" and buttonsActive and keyName ~= "menu" and keyName ~= "buttonZ" then
				
				if (unlockedIAP == false and event.x and event.x < screenEdgeX - 90 and event.x > screenOriginX + 90 and 
					event.y > halfH - 100 and event.y < halfH + 100 and savedData.enableIAP or
					event.keyName and event.keyName ~= "back" and event.keyName ~= "right" and event.keyName ~= "left" and event.keyName ~= "down" and event.keyName ~= "up" and
					unlockedIAP == false and savedData.enableIAP or
					menuGroup[1+textIndex].levelID == selectableChar or
					menuGroup[1+textIndex].levelID == rateChar or
					menuGroup[1+textIndex].levelID == iapChar and savedData.enableIAP == true) then
					
					
					
					
					if (menuGroup[1+textIndex].levelID == selectableChar) then
						
						if (promos[1]) then
							-- Flurry 2019
							-- logAnalyticEvent("promoTouchStart-"..promos[1])
						end
						
					elseif (menuGroup[1+textIndex].levelID == iapChar) then
						
						-- logAnalyticEvent("Touched IAP inline")
						if (showingSaleIAP == true) then
							-- logAnalyticEvent("Test 1 - Today Only Inline Touched")
							-- Flurry 2019
							-- logAnalyticEvent("Test 1 - 50% Off Touched")
						else
							-- Flurry 2019
							-- logAnalyticEvent("Test 1 - Normal Price Touched")
							-- if (showNewIAP == true) then
								-- logAnalyticEvent("Test 1 - New Inline Touched")
							-- else
								-- logAnalyticEvent("Test 1 - Old Inline Touched")
							-- end
						end
						
					elseif (menuGroup[1+textIndex].levelID == rateChar) then
						
						-- Flurry 2019
						-- logAnalyticEvent("inlineTouchStart-rate")
						
					else
					
						if (menuGroup[1+textIndex].text) then
							-- Flurry 2019
							-- logAnalyticEvent("Touched "..menuGroup[1+textIndex].text .. "'s IAP popup")
						end
						
					end
					
					local function onHoldTimer()
						if (hold ==  true) then
							if (holdTimer) then
								timer.cancel(holdTimer)
								holdTimer = nil
							end
							hold = false
							
							
							if (menuGroup[1+textIndex].levelID == selectableChar) then
							
								if (promos[1]) then
									-- Flurry 2019
									-- logAnalyticEvent("promo-"..promos[1])
								end
							
								openAppStoreURL(promoLinks[1])
								
								nextScene = "selectableChar"
								openParentalGate()
								
							elseif (menuGroup[1+textIndex].levelID == iapChar) then
							
								nextScene = "iapChar"
								openParentalGate()
							
								buttonsActive = false
								charSoundTrasitioning = true
								transition.to( backButton, { time=700, alpha=0, transition=easing.outExpo } )
								
								Runtime:removeEventListener( "onFTVKey", touchedMenu )
								Runtime:removeEventListener("touch",touchedMenu)
								Runtime:removeEventListener("key", touchedMenu)
								
								buyIAP(version.unlockItems.All)
								
								
							elseif (menuGroup[1+textIndex].levelID == rateChar) then
								
								nextScene = "rateChar"
								openParentalGate()
								
								savedData.rateInlineTouched = true
								save()
								
								
								itemIndex = 0
								changeBackground()
								
								if (char1Transition) then
									transition.cancel(char1Transition)
									char1Transition = nil
								 end
								 if (char2Transition) then
									transition.cancel(char2Transition)
									char2Transition = nil
								 end
								 if (char3Transition) then
									transition.cancel(char3Transition)
									char3Transition = nil
								 end
								
								local function resetSelectScreen()
									menu.unload()
									menu.reset()
									loadScrollMenu()
								end
								timer.performWithDelay( 100, resetSelectScreen )
								
								
								goToTitle()
								buttonsActive = false
								currentState = "title"
								
								-- Flurry 2019
								-- logAnalyticEvent("inline-rate")
								
								local openURL =  promoKit.settings.links.rateThisAppURL
								print("opening link "..tostring(openURL))
								system.openURL( openURL )
								
								
								
							else
							
								if (menuGroup[textIndex]) then
									menuGroup[textIndex].xScale, menuGroup[textIndex].yScale = 1, 1
								 end
								 if (menuGroup[2+textIndex]) then
									menuGroup[2+textIndex].xScale, menuGroup[2+textIndex].yScale = 1, 1
								 end
								
								Runtime:removeEventListener( "onFTVKey", touchedMenu )
								Runtime:removeEventListener("touch",touchedMenu)
								Runtime:removeEventListener("key", touchedMenu)
								
								Runtime:removeEventListener( "enterFrame", positionMenu )
								Runtime:removeEventListener( "onFTVKey", touchedMenu )
								
								buttonsActive = false
								charSoundTrasitioning = true
								transition.to( backButton, { time=700, alpha=0, transition=easing.outExpo } )
								
								Runtime:removeEventListener( "enterFrame", positionMenu )
								
								buyIAP(version.unlockItems.All)
							
							
							end
							
							
							if savedData.enableSounds == true then
								if version.appStore=="Google Play" or version.appStore=="Amazon" or version.appStore=="Samsung" then
									media.playSound( clickSound, stopButtonSound )
								else
									playReservedChannel(clickSound, 8, 0)
								end
							end
							fadeOutUnlockMessage()
						end
					end
					
					
					-- if (myData.isFireTV == true) then
						-- hold = true
					
						-- if (holdMessageTrans) then
							-- transition.cancel( holdMessageTrans )
							-- holdMessageTrans = nil
						-- end
						-- if (holdImageTrans) then
							-- transition.cancel( holdImageTrans )
							-- holdImageTrans = nil
						-- end
						-- if (settingsLua.parentsButtonDelay == true) then
							-- fadeInUnlockMessage("hold for 3 seconds", false)
						-- end
						
						-- holdTimer = timer.performWithDelay( parentsHold, onHoldTimer)
					-- end
					
				end
			end
			if event.phase=="moved" then
				touchOffsetX = event.x-event.xStart       

				if (math.abs(touchOffsetX) > 50) then
					hold = false
					if (holdTimer) then
						timer.cancel(holdTimer)
						holdTimer = nil
					end
					fadeOutUnlockMessage()
					if (fadeTitle) then
						transition.cancel( fadeTitle )
						fadeTitle = nil
					end
					if (fadeDescription) then
						transition.cancel( fadeDescription )
						fadeDescription = nil
					end
					if (fadeStar) then
						transition.cancel( fadeStar )
						fadeStar = nil
					end
					---- fadeTitle = transition.to( title, { time=500, alpha=0 } )
					---- fadeDescription = transition.to( description, { time=500, alpha=0 } )
					-- if (menuGroup[textIndex+1] and levels[menuGroup[textIndex+1].levelID] == "completed" and menuGroup[textIndex+1].levelID ~= selectableChar) then
						-- fadeStar = transition.to( star, { time=500, alpha=0 } )
					 -- else
						star.alpha = 0
					 -- end
				else
					if (fadeTitle) then
						transition.cancel( fadeTitle )
						fadeTitle = nil
					end
					if (fadeDescription) then
						transition.cancel( fadeDescription )
						fadeDescription = nil
					end
					if (fadeStar) then
						transition.cancel( fadeStar )
						fadeStar = nil
					end
					---- fadeTitle = transition.to( title, { time=500, alpha=1 } )
					---- fadeDescription = transition.to( description, { time=500, alpha=1 } )
					-- if (menuGroup[textIndex+1] and levels[menuGroup[textIndex+1].levelID] == "completed" and menuGroup[textIndex+1].levelID ~= selectableChar) then
						-- fadeStar = transition.to( star, { time=500, alpha=1 } )
					 -- else
						star.alpha = 0
					 -- end
				end
				return true
			elseif event.phase == "ended" or keyName and event.phase == "down" and buttonsActive and keyName == "buttonA" or
					keyName and event.phase == "up" and buttonsActive and keyName ~= "menu" then --finger up
					-- print("ended")
					
					hold = false
					if (holdTimer) then
						timer.cancel(holdTimer)
						holdTimer = nil
					end
					fadeOutUnlockMessage()
					
					if (math.abs(touchOffsetX) < 10) then
					
						
					
						if (event.keyName and event.keyName == "right" or 
							event.x and event.x > screenEdgeX - 90 and event.y > halfH - 100 and event.y < halfH + 100) then
								
							itemIndex = itemIndex + 1
							
							nextItem()
							
						elseif (event.keyName and event.keyName == "left" or 
									event.x and event.x < screenOriginX + 90 and event.y > halfH - 100 and event.y < halfH + 100) then
							
							itemIndex = itemIndex - 1
							
							previousItem()
							
						elseif (textIndex+1 > totalLevels - repeatedLevelsNum and unlockedIAP == true and event.keyName and event.keyName ~= "back" and event.keyName ~= "right" and event.keyName ~= "left" and event.keyName ~= "down" and event.keyName ~= "up" and menuGroup[1+textIndex] and levels[300].repeatedLevels[1+textIndex-subFromRepeatLevels].locked == "locked" and menuGroup[1+textIndex].levelID ~= selectableChar and menuGroup[1+textIndex].levelID ~= iapChar and menuGroup[1+textIndex].levelID ~= rateChar or
									textIndex+1 > totalLevels - repeatedLevelsNum and unlockedIAP == true and event.y and event.y > halfH - 100 and event.y < halfH + 100 and menuGroup[1+textIndex] and levels[300].repeatedLevels[1+textIndex-subFromRepeatLevels].locked == "locked" and menuGroup[1+textIndex].levelID ~= selectableChar and menuGroup[1+textIndex].levelID ~= iapChar and menuGroup[1+textIndex].levelID ~= rateChar or
									textIndex+1 <= totalLevels - repeatedLevelsNum and unlockedIAP == true and event.keyName and event.keyName ~= "back" and event.keyName ~= "right" and event.keyName ~= "left" and event.keyName ~= "down" and event.keyName ~= "up" and menuGroup[1+textIndex] and levels[menuGroup[1+textIndex].levelID+100] == "locked" and menuGroup[1+textIndex].levelID ~= selectableChar and menuGroup[1+textIndex].levelID ~= iapChar and menuGroup[1+textIndex].levelID ~= rateChar or
									textIndex+1 <= totalLevels - repeatedLevelsNum and unlockedIAP == true and event.y and event.y > halfH - 100 and event.y < halfH + 100 and menuGroup[1+textIndex] and levels[menuGroup[1+textIndex].levelID+100] == "locked" and menuGroup[1+textIndex].levelID ~= selectableChar and menuGroup[1+textIndex].levelID ~= iapChar and menuGroup[1+textIndex].levelID ~= rateChar) then	
							
							
							
							if (system.getInfo ("model") == "Apple TV" and keyName == "buttonA") then
								pressedSelectDown = true
							end
							
							
							Runtime:removeEventListener( "enterFrame", sleepingCharAnim )
							 Runtime:removeEventListener( "enterFrame", zAnim )
							 if (char1Transition) then
								transition.cancel(char1Transition)
								char1Transition = nil
							 end
							 if (char2Transition) then
								transition.cancel(char2Transition)
								char2Transition = nil
							 end
							 if (char3Transition) then
								transition.cancel(char3Transition)
								char3Transition = nil
							 end
							 Runtime:addEventListener( "enterFrame", sleepingCharAnim )
							Runtime:addEventListener( "enterFrame", zAnim )
							
							charWakeUp = true
							
							
							
							if (textIndex+1 > totalLevels - repeatedLevelsNum) then
								levels[300].repeatedLevels[1+textIndex-subFromRepeatLevels].locked = "not locked"
							else
								levels[menuGroup[1+textIndex].levelID+100] = "not locked"
							end
							saveLevelData()
							
							local function scaleCharDown()
								transition.to( menuGroup[1+textIndex].eyelids, {time=250, alpha = 0, transition=easing.outExpo} )
								transition.to( menuGroup[1+textIndex], { time=100 , xScale = 1, yScale = 1, transition=easing.inExpo } )
								
							end
							if savedData.enableSounds == true then
								playReservedChannel(completedSound, 16, 0)
							end
							transition.to( menuGroup[1+textIndex], {time=100, xScale = 1.3, yScale = 1.3, onComplete = scaleCharDown, transition=easing.outExpo} )
							
							-- prevGoToIndex = itemIndex
							-- local goToIndex
							-- for i = itemIndex, 0, -1 do
								-- if (levels[menuGroup[1+i].levelID+100] == "not locked") then
									
									-- goToIndex = i
									-- if (levels[menuGroup[2+i].levelID+100] == "locked") then
										-- break
									-- end
								-- end
							-- end
							-- itemIndex = goToIndex
							-- sleepCharTouched = true
							
							
							
							
						elseif (pressedSelectDown == false and textIndex+1 > totalLevels - repeatedLevelsNum and unlockedIAP == true and event.keyName and event.keyName ~= "back" and event.keyName ~= "right" and event.keyName ~= "left" and event.keyName ~= "down" and event.keyName ~= "up" and menuGroup[1+textIndex] and levels[300].repeatedLevels[1+textIndex-subFromRepeatLevels].locked == "not locked" and menuGroup[1+textIndex].levelID ~= selectableChar and menuGroup[1+textIndex].levelID ~= iapChar and menuGroup[1+textIndex].levelID ~= rateChar or
									pressedSelectDown == false and textIndex+1 > totalLevels - repeatedLevelsNum and unlockedIAP == true and event.y and event.y > halfH - 100 and event.y < halfH + 100 and menuGroup[1+textIndex] and levels[300].repeatedLevels[1+textIndex-subFromRepeatLevels].locked == "not locked" and menuGroup[1+textIndex].levelID ~= selectableChar and menuGroup[1+textIndex].levelID ~= iapChar and menuGroup[1+textIndex].levelID ~= rateChar or
									pressedSelectDown == false and textIndex+1 <= totalLevels - repeatedLevelsNum and unlockedIAP == true and event.keyName and event.keyName ~= "back" and event.keyName ~= "right" and event.keyName ~= "left" and event.keyName ~= "down" and event.keyName ~= "up" and menuGroup[1+textIndex] and levels[menuGroup[1+textIndex].levelID+100] == "not locked" and menuGroup[1+textIndex].levelID ~= selectableChar and menuGroup[1+textIndex].levelID ~= iapChar and menuGroup[1+textIndex].levelID ~= rateChar or
									pressedSelectDown == false and textIndex+1 <= totalLevels - repeatedLevelsNum and unlockedIAP == true and event.y and event.y > halfH - 100 and event.y < halfH + 100 and menuGroup[1+textIndex] and levels[menuGroup[1+textIndex].levelID+100] == "not locked" and menuGroup[1+textIndex].levelID ~= selectableChar and menuGroup[1+textIndex].levelID ~= iapChar and menuGroup[1+textIndex].levelID ~= rateChar) then
						
								Runtime:removeEventListener( "onFTVKey", touchedMenu )
								Runtime:removeEventListener("key", touchedMenu)
								Runtime:removeEventListener( "axis", touchedMenuAxis )
								
								if (menuGroup[1+textIndex].code >= repeatedCharStart) then
									playingRandomGame = true
									
									randomLevelChallenge = savedData[textIndex+1-subFromRepeatLevels .. "randomLevelSelect"]
									
									randomLevelChallenge = tostring(randomLevelChallenge)
									
									level = randomLevelDetails["random" .. randomLevelChallenge].character
									
									charLevel = menuGroup[1+textIndex].levelID
								else
									playingRandomGame = false
									
									level = menuGroup[1+textIndex].levelID
								end
								
								
								
								print("level ID " .. menuGroup[1+textIndex].levelID)
								currentLevel = 1+itemIndex
								
								print("open level:" .. level)
								-- logAnalyticEvent("levelID",{levelID = level})
								
								if (menuGroup[1+textIndex].text) then
									-- Flurry 2019
									-- logAnalyticEvent("Opened "..menuGroup[1+textIndex].text)
								end
								
								levelOptions = gameDetails["level" .. level]
								gameOptions = levelOptions["game" ..curGame]
								
								-- local gameMode
								-- if (gameOptions.gameType == "matching") then
									-- gameMode = gameOptions.mode
								-- end
								-- if (gameType == "matching") then
									-- if (gameMode == "showMe") then
										-- gameplayMode = 1
									-- else
										-- gameplayMode = 2
									-- end
								-- elseif (gameType == "equation") then
									-- gameplayMode = 3
								-- end
								
								if (menuGroup[textIndex]) then
									menuGroup[textIndex].xScale, menuGroup[textIndex].yScale = 1, 1
								 end
								 if (menuGroup[2+textIndex]) then
									menuGroup[2+textIndex].xScale, menuGroup[2+textIndex].yScale = 1, 1
								 end
								 -- if (char1Transition) then
									-- transition.cancel(char1Transition)
									-- char1Transition = nil
								 -- end
								 -- if (char2Transition) then
									-- transition.cancel(char2Transition)
									-- char2Transition = nil
								 -- end
								 -- if (char3Transition) then
									-- transition.cancel(char3Transition)
									-- char3Transition = nil
								 -- end
								
								currentState = "game"
								buttonsActive = false
								
								pressedSelectDownAppleTV = false
								
								audio.stop( 12 )
								
								
								menu.unload()
								-- removeSelectScreen()
								
								bgWhite:toFront()
								line1:toFront()
								line3:toFront()
								line5:toFront()
								transition.to( backButton, { time=700, alpha = 0, transition=easing.outExpo } )
								transition.to( menuGroup[1+textIndex], { time=700, xScale=1.5, yScale=1.5 , transition=easing.outExpo } )
								transition.to( menuGroup[1+textIndex], { delay=700, time=1, xScale=1, yScale=1 , transition=easing.outExpo } )
								transition.to( mainContainer, { delay=710, time=700, alpha = 0, x=((1+textIndex)*256)+2000 , transition=easing.outExpo } )
								transition.to( bgWhite, { time=700, alpha = 1, transition=easing.outExpo, onComplete=gameStartAnim1  } )
								-- transition.to( bgWhite, { delay=3900, time=700, alpha = 0, transition=easing.outExpo } )
								transition.to( title, { time=700, alpha=0, transition=easing.outExpo} )
								transition.to( description, { time=700, alpha=0, transition=easing.outExpo} )
								transition.to( selectSign, { time=700, alpha=0, transition=easing.outExpo} )
								transition.to( selectSignText, { time=700, alpha=0, transition=easing.outExpo} )
								transition.to( star, { time=700, alpha=0, transition=easing.outExpo} )
								
								audio.fade( { channel=1 , time=1000 , volume=0  } )
								audio.fade( { channel=2 , time=1000 , volume=0  } )
								
								if (titleAddCarsTimer) then
									timer.cancel( titleAddCarsTimer )
									titleAddCarsTimer = nil
								end
								
								local function removeTitleCars()
									for i = #titleCarsFront, 1, -1 do
										if (titleCarsFront[i]) then
											carTemp = titleCarsFront[i]
											if (titleCarsFront[i].carTrans) then
												transition.cancel( titleCarsFront[i].carTrans )
												titleCarsFront[i].carTrans = nil
											end
											table.remove( titleCarsFront, i )
										
											carTemp:removeSelf()
											carTemp = nil
										end
									end
									for i = #titleCarsBack, 1, -1 do
										if (titleCarsBack[i]) then
											carTemp = titleCarsBack[i]
											if (titleCarsBack[i].carTrans) then
												transition.cancel( titleCarsBack[i].carTrans )
												titleCarsBack[i].carTrans = nil
											end
											table.remove( titleCarsBack, i )
											
											carTemp:removeSelf()
											carTemp = nil
										end
									end
								end
								timer.performWithDelay( 1400, removeTitleCars )
								
								
								if savedData.enableSounds == true then
									if version.appStore=="Google Play" or version.appStore=="Amazon" or version.appStore=="Samsung" then
										media.playSound( clickSound, stopButtonSound )
									else
										playReservedChannel(clickSound, 8, 0)
									end
								end
								
								if savedData.enableSounds == true then
									playReservedChannel(harpTransitionSound, 18, 0)
								end
								
								endOfGame = false
								endZZZ = false
								closeEyes = false
								
								-- menuGroup[textIndex+1].eyelids.alpha = 0
								-- menuGroup[textIndex+1].z1.alpha = 0
								-- menuGroup[textIndex+1].z2.alpha = 0
								-- menuGroup[textIndex+1].z3.alpha = 0
								
								-- Runtime:removeEventListener( "enterFrame", sleepingCharAnim )
								-- Runtime:removeEventListener( "enterFrame", zAnim )
								
								if (endGameTimer) then
									timer.cancel( endGameTimer )
									endGameTimer = nil
								end
								if (endGameTransition) then
									transition.cancel( endGameTransition )
									endGameTransition = nil
								end
								
								
								
						elseif (menuGroup[1+textIndex].levelID == selectableChar or menuGroup[1+textIndex].levelID == iapChar or menuGroup[1+textIndex].levelID == rateChar) then
								
							if savedData.enableSounds == true then
								if version.appStore=="Google Play" or version.appStore=="Amazon" or version.appStore=="Samsung" then
									media.playSound( clickSound, stopButtonSound )
								else
									playReservedChannel(clickSound, 8, 0)
								end
							end
							
							if (menuGroup[1+textIndex].levelID == selectableChar) then
							
								transition.to( menuGroup[1+textIndex], { time=700, alpha=0, transition=easing.outExpo } )
								
								-- if (promos[1]) then
									-- logAnalyticEvent("promo-"..promos[1])
								-- end
							
								-- openAppStoreURL(promoLinks[1])
								
								nextScene = "selectableChar"
								openParentalGate()
								
							elseif (menuGroup[1+textIndex].levelID == iapChar) then
							
								--transition.to( menuGroup[1+textIndex], { time=700, alpha=0, transition=easing.outExpo } )
								
							
								-- nextScene = "iapChar"
								-- openParentalGate()
								
								-- if (myData.isTV) then 
									-- nextScene = "iapChar"
									-- openParentalGate()
								-- elseif (event.y > halfH + 75) then
									
									-- nextScene = "restoreChar"
									-- openParentalGate()
								-- else
									
									-- nextScene = "iapChar"
									-- openParentalGate()
								-- end
							
							
								-- logAnalyticEvent("Opened IAP inline")
							
								-- buttonsActive = false
								-- charSoundTrasitioning = true
								-- transition.to( backButton, { time=700, alpha=0, transition=easing.outExpo } )
								
								-- Runtime:removeEventListener( "onFTVKey", touchedMenu )
								-- Runtime:removeEventListener("touch",touchedMenu)
								-- Runtime:removeEventListener("key", touchedMenu)
								
								-- buyIAP("unlockeverything")
								
								if (savedData.enableIAP == false) then
										buttonsActive = false
									
										local function onOKComplete( event )
											if "clicked" == event.action then
												makeButtonsActive()
											end
										end
										local alert = native.showAlert( "", "In-app purchases have been turned off. You can turn them back on in the 'for parents' menu found on the first screen of this app.", { "OK" }, onOKComplete )
									
								else
								
									if (event.y < halfH + 77 and event.y > halfH + 15 and event.x > halfW - 160 and event.x < halfW + 160) then
										
										if (iapInlineTrans) then
											transition.cancel(iapInlineTrans)
											iapInlineTrans = nil
										end
									
										iapInlineTrans = transition.to( menuGroup[1+textIndex], { time=700, alpha=0, transition=easing.outExpo } )
										
										nextScene = "iapCharMonthly"
										openParentalGate()
										
									elseif (event.y < halfH + 140 and event.y > halfH + 77 and event.x > halfW - 160 and event.x < halfW + 160) then
										
										if (iapInlineTrans) then
											transition.cancel(iapInlineTrans)
											iapInlineTrans = nil
										end
									
										iapInlineTrans = transition.to( menuGroup[1+textIndex], { time=700, alpha=0, transition=easing.outExpo } )
										
										nextScene = "iapChar"
										
										openParentalGate()
									elseif (event.y < halfH + 180 and event.y > halfH + 140 and event.x > halfW + 30 and event.x < halfW + 130) then
										
										if (iapInlineTrans) then
											transition.cancel(iapInlineTrans)
											iapInlineTrans = nil
										end
									
										iapInlineTrans = transition.to( menuGroup[1+textIndex], { time=700, alpha=0, transition=easing.outExpo } )
										
										 buyIAP("restore")
									else
										-- nextScene = "iapChar"
										
										-- openParentalGate()
									end
								
								end
								
							elseif (menuGroup[1+textIndex].levelID == rateChar) then
								
								
								transition.to( menuGroup[1+textIndex], { time=700, alpha=0, transition=easing.outExpo } )
								
								nextScene = "rateChar"
								openParentalGate()
								
								-- savedData.rateInlineTouched = true
								-- save()
								
								
								-- itemIndex = 0
								-- changeBackground()
								
								-- if (char1Transition) then
									-- transition.cancel(char1Transition)
									-- char1Transition = nil
								 -- end
								 -- if (char2Transition) then
									-- transition.cancel(char2Transition)
									-- char2Transition = nil
								 -- end
								 -- if (char3Transition) then
									-- transition.cancel(char3Transition)
									-- char3Transition = nil
								 -- end
								
								-- local function resetSelectScreen()
									-- menu.unload()
									-- menu.reset()
									-- loadScrollMenu()
								-- end
								-- timer.performWithDelay( 100, resetSelectScreen )
								
								
								-- goToTitle()
								-- buttonsActive = false
								-- currentState = "title"
								
								
								-- logAnalyticEvent("inline-rate")
								
								-- local openURL =  promoKit.settings.links.rateThisAppURL
								-- print("opening link "..tostring(openURL))
								-- system.openURL( openURL )
								
								
								
							else
							
								-- nextScene = "characterIAP"
								-- openParentalGate()
								
							end
							
						elseif (unlockedIAP == false and event.y and event.y > halfH - 100 and event.y < halfH + 100 or
									unlockedIAP == false and event.keyName and event.keyName ~= "back" and event.keyName ~= "right" and event.keyName ~= "left" and event.keyName ~= "down" and event.keyName ~= "up") then
						
							-- if (myData.isFireTV == false and version.appStore ~= "Ouya") then
						
								-- buttonsActive = false
						
								-- if savedData.enableSounds == true then
									-- if version.appStore=="Google Play" or version.appStore=="Amazon" or version.appStore=="Samsung" then
										-- media.playSound( clickSound, stopButtonSound )
									-- else
										-- playReservedChannel(clickSound, 8, 0)
									-- end
								-- end
								
								-- local lowerCharacters = string.lower( menuGroup[1+textIndex].text:sub(2, string.len(menuGroup[1+textIndex].text) ) )
								
								-- characterSelected = menuGroup[1+textIndex].text:sub(1,1) .. lowerCharacters
							
								-- nextScene = "characterIAP"
								-- openParentalGate()
								
								if (savedData.enableIAP == false) then
								buttonsActive = false
							
								local function onOKComplete( event )
									if "clicked" == event.action then
										makeButtonsActive()
									end
								end
								local alert = native.showAlert( "", "In-app purchases have been turned off. You can turn them back on in the 'for parents' menu found on the first screen of this app.", { "OK" }, onOKComplete )
							
							else
						
								buttonsActive = false
						
						
								if (savedData.enablePromo == true) then
									
									transitioningSelectItems = true
									
									local tempIndex = 1
									for i = 0, menuGroup.numChildren-1, 1 do
										if (menuGroup[i+1].levelID == iapChar) then
											tempIndex = i
											break
										end
									end
									itemIndex = tempIndex
									
									
									local function scrolledToChar()
										transitioningSelectItems = false
										makeButtonsActive()
									end
									timer.performWithDelay( 600, scrolledToChar )
									
								else
								
									
						
									if savedData.enableSounds == true then
										if version.appStore=="Google Play" or version.appStore=="Amazon" or version.appStore=="Samsung" then
											media.playSound( clickSound, stopButtonSound )
										else
											playReservedChannel(clickSound, 8, 0)
										end
									end
								
									nextScene = "characterIAP"
									openParentalGate()
								
								end
								
							end
						
							-- end
						
						end
					else
						if touchOffsetX > 70 then
                            itemIndex = itemIndex - 1 
							
							previousItem()
                        elseif touchOffsetX < -70 then
                            itemIndex = itemIndex + 1    

							nextItem()
                        else
                            itemIndex = math.round(-menuGroup.x/spacing)
                        end
						-- itemIndex = math.round(-menuGroup.x/spacing)
						
						if (fadeTitle) then
							transition.cancel( fadeTitle )
							fadeTitle = nil
						end
						if (fadeDescription) then
							transition.cancel( fadeDescription )
							fadeDescription = nil
						end
						if (fadeStar) then
							transition.cancel( fadeStar )
							fadeStar = nil
						end
						---- fadeTitle = transition.to( title, { time=500, alpha=1 } )
						---- fadeDescription = transition.to( description, { time=500, alpha=1 } )
						-- if (menuGroup[textIndex] and levels[menuGroup[textIndex+1].levelID] == "completed" and menuGroup[textIndex+1].levelID ~= selectableChar) then
							-- fadeStar = transition.to( star, { time=500, alpha=1 } )
						-- else
							star.alpha = 0
						-- end
					end
					
					touchOffsetX = 0
					
					if itemIndex > menuGroup.numChildren-1 then 
						--itemIndex = menuGroup.numChildren-1
					end
					if itemIndex < 0 then 
						itemIndex = 0
					end
					return true
			end
		
		
		end
	
	end
	
	
	function touchedMenuAxis( event )
	
	
		if (buttonsActive and currentState == "select" and version.appStore ~= "Chrome") then
	
			if (system.getInfo ("model") ~= "Apple TV" or system.getInfo ("model") == "Apple TV" and pressedSelectDownAppleTV == false) then
		
				if event.normalizedValue > 0 then
					axisName = event.axis.type .. "+"
				else
					axisName = event.axis.type .. "-"
				end
				
				
				if math.abs(event.normalizedValue) >= controllerSensitivity then
					if (axisName == "leftX-" or axisName == "x-") then
						itemIndex = itemIndex - 1
						
						previousItem()
						
						Runtime:removeEventListener( "axis", touchedMenuAxis )
						timer.performWithDelay( controllerAxisDelay, function()
							Runtime:addEventListener( "axis", touchedMenuAxis )
						end )
					elseif (axisName == "leftX+" or axisName == "x+") then
						itemIndex = itemIndex + 1
						
						nextItem()
						
						Runtime:removeEventListener( "axis", touchedMenuAxis )
						timer.performWithDelay( controllerAxisDelay, function()
							Runtime:addEventListener( "axis", touchedMenuAxis )
						end )
					end
				end
			
				if itemIndex > menuGroup.numChildren-1 then 
					itemIndex = menuGroup.numChildren-1
				end
				if itemIndex < 0 then 
					itemIndex = 0
				end
				
			end
			
		end
	
	end
	
	
	
	menu.calcPercent = function()
		if (iap_getProductPrice(version.unlockItems.All) and iap_getProductPrice(version.unlockItems.AllLimited) and
				iap_getProductPrice(version.unlockItems.All) ~= "" and
				iap_getProductPrice(version.unlockItems.AllLimited) ~= "") then
		
			
		
			local miniPriceString = iap_getProductPrice(version.unlockItems.AllLimited)
			local premPriceString = iap_getProductPrice(version.unlockItems.All)
			
			-- print(miniPriceString)
			-- print(premPriceString)
			
			local miniPriceNum = tonumber(miniPriceString:sub( 2, string.len(miniPriceString) ))
			local premPriceNum = tonumber(premPriceString:sub( 2, string.len(premPriceString) ))
			
			
			local totalStagesPrice, totalDiff, totalDiffPercent
			if (miniPriceNum ~= nil and premPriceNum ~= nil) then
				-- totalStagesPrice = miniPriceNum * 6
				
				-- totalDiff = totalStagesPrice - premPriceNum
				
				-- totalDiffPercent = math.floor( (totalDiff / totalStagesPrice) * 100 )
				
				-- roundDownNum = totalDiffPercent - (totalDiffPercent % 5)
				
				totalStagesPrice = premPriceNum
				totalDiff = totalStagesPrice - miniPriceNum
				totalDiffPercent = math.floor( (totalDiff / totalStagesPrice) * 100 )
				roundDownNum = totalDiffPercent - (totalDiffPercent % 5)
			
			else
				roundDownNum = 40
			end
			
		else
		
			roundDownNum = "GET!"
		
		end
		
		roundDownNum = 50
	end
	
    menu.addMenuItem = function(world,fileName,width,height,offsetX,offsetY,levelID,text,text2,lockOffsetX,lockOffsetY,lockScale,levelMusic,itemSound,zInitX,zInitY,eyelids,eWidth,eHeight,eOffsetX,eOffsetY,selectSignText,signTextOffsetX,signTextOffsetY, flipChar)
       local items = display.newGroup()
       
	   local code = menuGroup.numChildren + 1 -- codeID
	   
	   
	   -- items.x = display.contentCenterX + (spacing*menuGroup.numChildren)
	   -- items.y = display.contentCenterY
	   
	   items.x = halfW + (spacing*menuGroup.numChildren)
	   items.y = halfH
	   
	   items.world = world
	   
	   if (system.getInfo( "platformName" ) == "Android"  ) then
			dynamicFont = "BigSky_1"
		else
			dynamicFont = "Big Sky"
		end
	   
	   if (fileName == "iap") then
	   
			
			if (fileName == "old iap") then
				print("show new iap")
				print(showNewIAP)
				
				if (showingSaleIAP == true) then
					-- logAnalyticEvent("Test 1 - Today Only Inline Chosen")
					-- Flurry 2019
					-- logAnalyticEvent("Test 1 - 50% Off Chosen")
				else
					-- Flurry 2019
					-- logAnalyticEvent("Test 1 - Normal Price Chosen")
					-- if (showNewIAP == true) then
						-- logAnalyticEvent("Test 1 - New Inline Chosen")
					-- else
						-- logAnalyticEvent("Test 1 - Old Inline Chosen")
					-- end
				end
				
				if (showingSaleIAP == true or showNewIAP == true) then
			
					items.itemBack = display.newImageRect("Images/UI/inlineBG.png", 252, 232 )
					items.itemBack.x = 0
					items.itemBack.y = 0
					items:insert( items.itemBack )
			   
					-- if (showingSaleIAP == true) then
						-- items.item = display.newImageRect("Images/UI/iapMenuUnlockSaleButton.png", 340, 292 )
					-- else
						-- items.item = display.newImageRect("Images/UI/iapMenuUnlockButtonV2.png", 340, 292 )
					-- end
					
					if (myData.isTV) then 
						items.item = display.newImageRect("Images/UI/iapMenuUnlockButtonV2Sale.png", 340, 292 )
					elseif (showingSaleIAP == true) then
						-- items.item = display.newImageRect("Images/UI/iapMenuUnlockButtonV2Sale.png", 340, 292 )
						items.item = display.newImageRect("Images/UI/iapMenuUnlockSaleButton.png", 340, 292 )
					else
						items.item = display.newImageRect("Images/UI/iapMenuUnlockButtonV2.png", 340, 292 )
					end
					
					-- items.item = display.newImageRect("Images/UI/iapMenuUnlockButton.png", 227, 207 )
					items.item.x = 0
					items.item.y = 0
					items:insert( items.item )
					
					-- items.itemTwo = display.newImageRect("Images/UI/iapMenuUnlockButtonAlt.png", 228, 37 )
					-- items.itemTwo.x = 0
					-- items.itemTwo.y = 85.5
					-- items:insert( items.itemTwo )
					
					
					menu.calcPercent()
					
					
					
					-- if (testText) then
						-- testText.text = testText.text .. "\nTest IAP\n"
					-- end
					
					if (showingSaleIAP == false) then
						local options = 
						{
							text = "GET!",     
							x = 0,
							y = 73.5,
							width = 150,
							font = textFont,   
							fontSize = 30,
							align = "center"  -- Alignment parameter
						}
									
						items.priceText = display.newText( options )
						items.priceText:setFillColor( 255/255, 83/255, 20/255 )
						-- items.priceText.text = iap_getProductPrice(version.unlockItems.All)
						items.priceText.text = iap_getProductPrice(version.unlockItems.All)
						
					else
					
						local options = 
						{
							text = "GET!",     
							x = 0,
							y = 61,
							width = 150,
							font = textFont,   
							fontSize = 15,
							align = "center"  -- Alignment parameter
						}
					
						items.priceText = display.newText( options )
						items.priceText:setFillColor( 171/255, 171/255, 171/255 )
						-- items.priceText.text = iap_getProductPrice(version.unlockItems.All)
						items.priceText.text = iap_getProductPrice(version.unlockItems.All)
					
						items.priceText.alpha = 0
					end
					

					-- if ( system.getInfo( "platformName" ) == "Android" ) then
						-- items.priceText.text = "$2.99"
					-- else
						-- items.priceText.text = iap_getProductPrice(version.unlockItems.All)
						if (items.priceText.text == "") then
							items.priceText.text = "GET!"
						end
					-- end
					items:insert( items.priceText )
					
					
					
					local options2 = 
					{
						text = "GET!",     
						x = 0,
						y = 73.5, -- 80.5
						width = 150,
						font = textFont,   
						fontSize = 30, -- 23.5
						align = "center"  -- Alignment parameter
					}
					
					items.saleText = display.newText( options2 )
					items.saleText:setFillColor( 255/255, 83/255, 20/255 )
					-- if ( system.getInfo( "platformName" ) == "Android" ) then
						-- items.saleText.text = "$2.99"
					-- else
						-- items.saleText.text = iap_getProductPrice(version.unlockItems.AllLimited)
						-- items.saleText.text = iap_getProductPrice("unlockeverythinglimitedtime")
						items.saleText.text = iap_getProductPrice(version.unlockItems.All)
						if (items.saleText.text == "") then
							items.saleText.text = "GET!"
						end
						
						
					-- end
					if (showingSaleIAP == false) then
						items.saleText.alpha = 0
					end
					items:insert( items.saleText )
					
					
					
					
					items.saleLine = display.newRect( 0, 0, 40, 2 )
					items.saleLine:setFillColor( 171/255, 171/255, 171/255 )
					items.saleLine.x, items.saleLine.y = items.priceText.x, items.priceText.y
					-- if (showingSaleIAP == false) then
						items.saleLine.alpha = 0
					-- end
					items:insert( items.saleLine )
					
					
					
					
					items.salePercent = display.newText( "GET!", 126, -108, textFont, 20 )
					items.salePercent:setFillColor( 255/255, 85/255, 22/255 )
					-- if ( system.getInfo( "platformName" ) == "Android" ) then
						-- items.saleText.text = "$2.99"
					-- else
						-- if (items.saleText.text == "") then
							-- items.salePercent.text = "GET!"
						-- end
					-- end
					-- if (roundDownNum ~= "GET!") then
						items.salePercent.text = roundDownNum .. "%"
					-- end
					
					items.salePercent.rotation = 13
					if (showingSaleIAP == false) then
						items.salePercent.alpha = 0
					end
					items:insert( items.salePercent )
					
					
					-- items.topText = display.newText( "UNLOCK ALL!", 0, -84.5, dynamicFont, 27 )
					-- items.topText:setFillColor( 255/255, 255/255, 255/255 )
					-- items:insert( items.topText )
					
					-- items.bottomText = display.newText( "Includes EVERYTHING!", 0, 85.5, dynamicFont, 15 )
					-- items.bottomText:setFillColor( 255/255, 255/255, 255/255 )
					-- items:insert( items.bottomText )
					
					
					if system.getInfo( "platformName" ) == "Android" then
						items.priceText.y = 74.5
						-- items.topText.y = -145.3
						-- items.bottomText.y = 52.5
					end
					
					
					local suffix = display.imageSuffix
					if (display.imageSuffix == nil) then
						suffix = ""
					end
					print(suffix)
					-- puzzlePiece:setMask( graphics.newMask( "Images/UI/newUpfrontMask" .. suffix .. ".jpg" ) )
					
					
					-- items.iapMask = graphics.newMask( "Images/UI/newUpfrontMask.jpg" )

					items.scrollImages = {}
					items.scollNum = 1

					for i = 0, 5 do
						items.scrollImages[#items.scrollImages+1] = display.newImageRect("Images/UI/iapScreen" .. i+1 .. ".png", 143, 81 )
						items.scrollImages[#items.scrollImages].x = 0
						items.scrollImages[#items.scrollImages].y = -1.7
						items:insert( items.scrollImages[#items.scrollImages] )
						
						items.scrollImages[#items.scrollImages]:setMask( graphics.newMask( "Images/UI/newUpfrontMask" .. suffix .. ".jpg" ) )
						
						if (suffix == "@4x") then
							items.scrollImages[#items.scrollImages].maskScaleX, items.scrollImages[#items.scrollImages].maskScaleY = 0.25, 0.25
						elseif (suffix == "@2x") then
							items.scrollImages[#items.scrollImages].maskScaleX, items.scrollImages[#items.scrollImages].maskScaleY = 0.5, 0.5
						end
						
						items.scrollImages[#items.scrollImages].maskX = -2
						items.scrollImages[#items.scrollImages].maskY = 0
						
						if (i ~= 0) then
							items.scrollImages[#items.scrollImages].x = (-70.3) + (143 * i) - 1
							items.scrollImages[#items.scrollImages].maskX = items.scrollImages[#items.scrollImages].maskX - (143 * i) + 71.9
						else
							items.scrollImages[#items.scrollImages].x = (-70.3) + (143 * i)
							items.scrollImages[#items.scrollImages].maskX = items.scrollImages[#items.scrollImages].maskX - (143 * i) + 70.9
						end
						
					end
					
					
					items.itemLines = display.newImageRect("Images/UI/iapMenuUnlockButtonV2Lines.png", 252, 91 )
					items.itemLines.x = -1.5
					items.itemLines.y = -1
					items:insert( items.itemLines )
			
			
				else
			   
					items.itemBack = display.newImageRect("Images/UI/inlineBG.png", 252, 232 )
					items.itemBack.x = 0
					items.itemBack.y = 0
					items:insert( items.itemBack )
			   
					items.item = display.newImageRect("Images/UI/iapMenuUnlockButton.png", 227, 207 )
					items.item.x = 0
					items.item.y = 0
					items:insert( items.item )
					
					items.itemTwo = display.newImageRect("Images/UI/iapMenuUnlockButtonAlt.png", 228, 37 )
					items.itemTwo.x = 0
					items.itemTwo.y = 85.5
					items:insert( items.itemTwo )
					
					items.priceText = display.newText( "GET!", 0, 41.5, dynamicFont, 35 )
					items.priceText:setFillColor( 255/255, 255/255, 255/255 )
					-- items.priceText.text = iap_getProductPrice(version.unlockItems.All)
					-- if (system.getInfo( "platformName" ) == "Android" and version.appStore ~= "Google Play") then
						-- items.priceText.text = "$2.99"
					-- else
						items.priceText.text = iap_getProductPrice(version.unlockItems.All) --"$3.99"
					-- end
					if (items.priceText.text == "") then
						items.priceText.text = "GET!"
					end
					items:insert( items.priceText )
					
					items.topText = display.newText( "UNLOCK ALL!", 0, -84.5, dynamicFont, 27 )
					items.topText:setFillColor( 255/255, 255/255, 255/255 )
					items:insert( items.topText )
					
					items.bottomText = display.newText( "Includes EVERYTHING!", 0, 85.5, dynamicFont, 15 )
					items.bottomText:setFillColor( 255/255, 255/255, 255/255 )
					items:insert( items.bottomText )
					
					
					if system.getInfo( "platformName" ) == "Android" then
						items.priceText.y = -37
						items.topText.y = -145.3
						items.bottomText.y = 52.5
					end
					
					
					items.iapMask = graphics.newMask( "Images/UI/iapScreenMask.png" )

					items.scrollImages = {}
					items.scollNum = 1

					for i = 0, 5 do
						items.scrollImages[#items.scrollImages+1] = display.newImageRect("Images/UI/iapScreen" .. i+1 .. ".png", 143, 81 )
						items.scrollImages[#items.scrollImages].x = 0
						items.scrollImages[#items.scrollImages].y = -29
						items:insert( items.scrollImages[#items.scrollImages] )
						
						items.scrollImages[#items.scrollImages]:setMask( items.iapMask )
						items.scrollImages[#items.scrollImages].maskX = 0
						items.scrollImages[#items.scrollImages].maskY = 0
						
						if (i ~= 0) then
							items.scrollImages[#items.scrollImages].x = (-70.3) + (143 * i) - 1
							items.scrollImages[#items.scrollImages].maskX = items.scrollImages[#items.scrollImages].maskX - (143 * i) + 71.9
						else
							items.scrollImages[#items.scrollImages].x = (-70.3) + (143 * i)
							items.scrollImages[#items.scrollImages].maskX = items.scrollImages[#items.scrollImages].maskX - (143 * i) + 70.9
						end
						
					end
					
					
				end
				
			else
			
				items.itemBack = display.newImageRect("Images/UI/inlineBG.png", 252, 232 )
				items.itemBack.x = 0
				items.itemBack.y = 0
				items:insert( items.itemBack )
				
				
				items.item = display.newImageRect("Images/UI/iap-subscription-menu.png", 735/2.25, 781/2.25 )
				items.item.x = -5
				items.item.y = 30
				items:insert( items.item )
				
				
				local options = 
				{
					text = "GET!",     
					x = 32,
					y = 135,
					width = 150,
					font = newFont5,   
					fontSize = 16,
					align = "right"  -- Alignment parameter
				}
				items.priceTextAll = display.newText( options )
				--items.priceTextAll = display.newText( "GET!", 105, 117, newFont4, 18 )
				items.priceTextAll:setFillColor( 255/255, 255/255, 255/255 )
				
				items.priceTextAll.text = iap_getProductPrice(version.unlockItems.All)
				if (items.priceTextAll.text == "") then
					items.priceTextAll.text = "GET!"
				end
				items:insert( items.priceTextAll )
				
				
				
				--items.priceText = display.newText( "GET!", 99, -100.5, newFont4, 15 )
				local options2 = 
				{
					text = "GET!",     
					x = 32,
					y = 72,
					width = 150,
					font = newFont5,   
					fontSize = 16,
					align = "right"  -- Alignment parameter
				}
				items.priceText = display.newText( options2 )
				--items.priceText = display.newText( "GET!", 105, 45, newFont4, 18 )
				items.priceText:setFillColor( 255/255, 255/255, 255/255 )
				
				
				-- if (currentAnimalMath == "PreK") then
					-- items.priceText.text = iap_getProductPrice(version.unlockItems.PreK)
				-- elseif (currentAnimalMath == "Kindergarten") then
					-- items.priceText.text = iap_getProductPrice(version.unlockItems.Kindergarten)
				-- elseif (currentAnimalMath == "First") then
					-- items.priceText.text = iap_getProductPrice(version.unlockItems.First)
				-- elseif (currentAnimalMath == "Second") then
					-- items.priceText.text = iap_getProductPrice(version.unlockItems.Second)
				-- else
					-- items.priceText.text = iap_getProductPrice(version.unlockItems.All)
				-- end
				
				items.priceText.text = iap_getProductPrice("monthly")
				if (items.priceText.text == "") then
					items.priceText.text = "GET!"
				end
				items:insert( items.priceText )
				
				end
				
			elseif (fileName == "rate") then
				
				items.itemBack = display.newImageRect("Images/UI/inlineBG.png", 252, 232 )
				items.itemBack.x = 0
				items.itemBack.y = 0
				items:insert( items.itemBack )
		   
				items.item = display.newImageRect("Images/UI/upfrontBG.png", 228, 208 )
				items.item.x = 0
				items.item.y = 0
				items.item:setFillColor( 0 )
				items:insert( items.item )
				
				items.itemTwo = display.newImageRect("Images/UI/upfrontPriceButton.png", 210, 58 )
				items.itemTwo.x = 0
				items.itemTwo.y = 65
				items.itemTwo:setFillColor( 0/255, 180/255, 255/255 )
				items:insert( items.itemTwo )
				
				
				local textOptions = 
				{
					text = "Dear teachers and parents,\n\nTaking a few seconds to rate Animal Kindergarten Math Games is very important to us. It allows us to continually improve the app and helps others make an informed decision.\n\nHow about telling us what you think?",     
					x = 4,
					y = -28,
					width = 200, --required for multi-line and alignment
					font = dynamicFont,   
					fontSize = 10,
					align = "Left"
				}
				items.topText = display.newText( textOptions )
				
				-- items.topText = display.newText( "Dear teachers and parents,\n\nTaking a few seconds to rate Animal\nMath Games is very important to us.\nIt allows us to continually improve\nthe app and helps others make an\ninformed decision.\n\nHow about telling us what you think?", 4, -28, dynamicFont, 10 )
				items.topText:setFillColor( 255/255, 255/255, 255/255 )
				items:insert( items.topText )
				
				items.bottomText = display.newText( "Sure, I'll rate", 0, items.itemTwo.y, dynamicFont, 27 )
				items.bottomText:setFillColor( 255/255, 255/255, 255/255 )
				items:insert( items.bottomText )
				
				
				if system.getInfo( "platformName" ) == "Android" then
					items.topText.y = -53
					items.bottomText.y = 5
				end
			
			
			
	   else
			if (flipChar == true) then
				items.item = display.newImageRect(fileName, -width, height)
			else
				items.item = display.newImageRect(fileName, width, height)
			end
			items.item.x, items.item.y= 0,0
			items:insert( items.item )
	   end
       
	   
	   items.zInitX = zInitX
	   items.zInitY = zInitY
	   
	   items.z1 = display.newImageRect("Images/UI/z.png", 28, 25)
	   if (flipChar == true) then
			items.z1.x, items.z1.y = items.item.x - zInitX, items.item.y + zInitY
	   else
			items.z1.x, items.z1.y = items.item.x + zInitX, items.item.y + zInitY
	   end
	   items.z1.frame = 0
	   items.z1.initX = items.z1.x
	   items.z1.xScale, items.z1.yScale = initScale, initScale
	   if (world == "World1" or "World2") then
			items.z1:setFillColor(64/255,64/255,64/255)
	   else
			items.z1:setFillColor(255/255,255/255,255/255)
	   end
	   items:insert( items.z1 )
	   
	   items.z2 = display.newImageRect("Images/UI/z.png", 28, 25)
	   if (flipChar == true) then
			items.z2.x, items.z2.y = items.item.x - zInitX, items.item.y + zInitY - 30
	   else
			items.z2.x, items.z2.y = items.item.x + zInitX, items.item.y + zInitY - 30
	   end
	   items.z2.frame = 0
	   items.z2.initX = items.z2.x
	   items.z2.xScale, items.z2.yScale = initScale+.3, initScale+.3
	   items.z2.alpha = .6
	   if (world == "World1" or "World2") then
			items.z2:setFillColor(64/255,64/255,64/255)
	   else
			items.z2:setFillColor(255/255,255/255,255/255)
	   end
	   items:insert( items.z2 )
	   
	   items.z3 = display.newImageRect("Images/UI/z.png", 28, 25)
	   if (flipChar == true) then
			items.z3.x, items.z3.y = items.item.x - zInitX, items.item.y + zInitY - 60
	   else
			items.z3.x, items.z3.y = items.item.x + zInitX, items.item.y + zInitY - 60
	   end
	   items.z3.frame = 0
	   items.z3.initX = items.z3.x
	   items.z3.alpha = .2
	   if (world == "World1" or "World2") then
			items.z3:setFillColor(64/255,64/255,64/255)
	   else
			items.z3:setFillColor(255/255,255/255,255/255)
	   end
	   items.z3.xScale, items.z3.yScale = initScale+.6, initScale+.6
	   items:insert( items.z3 )
	   
	   if (fileName ~= "iap" and fileName ~= "rate") then
			items.item:toFront()
	   end
	   
	   
	   if (flipChar == true) then
			items.eyelids = display.newImageRect("Images/UI/" .. eyelids .. ".png", -eWidth, eHeight)
			items.eyelids.x = items.item.x - eOffsetX
	   else
			items.eyelids = display.newImageRect("Images/UI/" .. eyelids .. ".png", eWidth, eHeight)
			items.eyelids.x = items.item.x + eOffsetX
	   end
	   items.eyelids.y = items.item.y + eOffsetY
	   items.eyelids.alpha = 1
	   items:insert( items.eyelids )
	   
	   items.lock = display.newImageRect("Images/UI/selectionLock.png", 84, 132)
	   if (flipChar == true) then
			items.lock.x = items.item.x + lockOffsetX
	   else
			items.lock.x = items.item.x + lockOffsetX
	   end
	   items.lock.y = items.item.y + lockOffsetY
	   items.lock.xScale = lockScale
	   items.lock.yScale = lockScale
	   items.lock.alpha = 0
	   items:insert( items.lock )
	   
	   
	   -- if (levels[code] == "not locked") then
			-- items.lock.alpha = 0
	   -- end
	   
	   if (variation == 4 and unlockedEverything == false and unlockedWeeklySub == false and unlockedMonthlySub == false and unlockedYearlySub == false and levelID <= #lockedLevels + #unlockedLevels and levels[levelID+100] == "not locked" 
			or variation == 5 and levels[levelID+100] == "not locked" 
			or unlockedEverything == true and levels[levelID+100] == "not locked" 
			or unlockedWeeklySub == true and levels[levelID+100] == "not locked" 
			or unlockedMonthlySub == true and levels[levelID+100] == "not locked" 
			or unlockedYearlySub == true and levels[levelID+100] == "not locked" 
			or levelID == selectableChar or levelID == iapChar or levelID == selectableChar or levelID == rateChar) then
			items.eyelids.alpha = 0
			items.z1.alpha = 0
			items.z2.alpha = 0
			items.z3.alpha = 0
	   end
	   
	  for i = 1, #lockedLevels+1 do
		if (lockedLevels[i] == levelID and levelID ~= selectableChar and levelID ~= iapChar and levelID ~= rateChar or
			variation == 4 and unlockedEverything == false and unlockedWeeklySub == false and unlockedMonthlySub == false and unlockedYearlySub == false and levelID > #lockedLevels + #unlockedLevels and levelID ~= selectableChar and levelID ~= iapChar and levelID ~= rateChar) then
		
			if (levelID <= #lockedLevels + #unlockedLevels and iapPurchased[code-4] == "true" and savedData.enablePromo == true and myData.isTV == false or
					levelID <= #lockedLevels + #unlockedLevels and iapPurchased[code-3] == "true" and savedData.enablePromo == false and myData.isTV == false or
					levelID <= #lockedLevels + #unlockedLevels and iapPurchased[code-3] == "true" and myData.isTV) then
					
				unlockedLevels[#unlockedLevels+1] = lockedLevels[i]
				lockedLevels[i] = 0
				levels[levelID+100] = "not locked"
			else
				items.lock.alpha = 1
			end
		end
	  end
	  if (variation == 5 or unlockedEverything == true or unlockedWeeklySub == true or unlockedMonthlySub == true or unlockedYearlySub == true) then
			items.lock.alpha = 0
	  end
	   
	   items.code = code
	   items.levelID = levelID
	   items.text = text
	   items.text2 = text2
	   items.sound = itemSound
	   items.snoreOne = characterSounds.twoSnoreOneSound
	   items.snoreTwo = characterSounds.twoSnoreTwoSound
	   items.music = levelMusic
	   
	   
	   items.selectSignText = selectSignText
	   items.signTextOffsetX = signTextOffsetX
	   items.signTextOffsetY = signTextOffsetY
	   
	   items.offsetX = offsetX
	   items.offsetY = offsetY
	   
	   items.y = items.y+offsetY
	   items.x = items.x+offsetX
	   
	   -- testText.text = items.text
	   
		--item:addEventListener("touch", menuItemTouched)
       menuGroup:insert(items)

    end 
    
    menu.unload = function()
        Runtime:removeEventListener( "enterFrame", positionMenu )
        Runtime:removeEventListener("touch",touchedMenu)
		Runtime:removeEventListener("key", touchedMenu)
		
		-- if (mainContainer and mainContainer.numChildren) then
			-- for i = mainContainer.numChildren, 1, -1 do
				-- if (mainContainer[i]) then
					-- mainContainer[i]:removeSelf()
					-- mainContainer[i] = nil
				-- end
			-- end
		-- end
		-- if (menuGroup and menuGroup.numChildren) then
			-- for i = menuGroup.numChildren, 1, -1 do
				-- if (menuGroup[i]) then
					-- menuGroup[i]:removeSelf()
					-- menuGroup[i] = nil
				-- end
			-- end
		-- end
		-- prevItemIndex = -1
		-- for i = #menuGroup, 1, -1 do
			-- menuGroup[i]:removeSelf()
			-- menuGroup[i] = nil
			-- table.remove( menuGroup, i )
		-- end
		-- menuGroup:removeSelf()
		-- menuGroup = nil
    end
	
	menu.reset = function()
		if (mainContainer) then
			mainContainer.x = 0
		end
		if (menuGroup) then
			menuGroup.x = 0
		end
		
		selectSign.x = halfW * 5
		selectSignText.x = halfW + 70
		description.x = title.x
		star.x = title.x - 150
		-- mainContainer.x = 0
		mainContainer.anchorX, mainContainer.anchorY = 0, 0.5
		mainContainer.x = mainContainer.width+2000
		mainContainer.alpha = 0
		
		
	end
    
    menu.init = function(container,callbackFunction,font)
        
        callback = callbackFunction
        
        menuGroup = display.newGroup()
		menuGroup.x = 0
        container:insert(menuGroup)
        --Runtime:addEventListener("touch",touchedMenu)
		
		currentWorld = "World1"
		
		
		selectSign = display.newImageRect( "Images/UI/sign.png", 317, 171)
		selectSign.x = halfW * 5
		selectSign.y = halfH + 156
		container:insert(selectSign)
		
        
        title = display.newText(container, "", display.contentCenterX, halfH + 122.5,  font, 30)
        title.align = "center"
		--title:setReferencePoint( display.CenterReferencePoint )
		title.x = halfW
		title.rotation = -1
		
		-- title:setTextColor(64,64,64)
		
		selectSignText = display.newText(container, "Test", display.contentCenterX, halfH + 120, font, 16)
        selectSignText.align = "center"
		selectSignText.x = halfW + 70
		selectSignText.rotation = -1
		
		description = display.newText(container, "", display.contentCenterX, halfH + 147, font, 13)
        description.align = "center"
		--description:setReferencePoint( display.CenterReferencePoint )
		description.x = title.x
		description.initX = description.x
		description.rotation = -1
		
		if system.getInfo( "platformName" ) == "Android" then
			title.y = halfH + 52
			description.y = halfH + 108
		end
		-- description:setTextColor(64,64,64)
		
		star = display.newImageRect(container, "Images/UI/selectionStar.png", 31, 29)
	    star.xScale, star.yScale = 0.4, 0.4
		star.offsetX = - 10
		star.x = description.x - (description.width*0.5) + star.offsetX
		star.initScale = star.xScale
		
		-- if version.appStore=="Google Play" or version.appStore=="Amazon" or version.appStore=="Samsung"then
			-- star.y = title.y - 3.5
		-- else
			star.y = description.y
		-- end
	    star.alpha = 0
        
		
		if system.getInfo( "platformName" ) == "Android" then
			title.y = halfH + 54
			description.y = halfH + 114
			star.y = description.y + 29
		end
		
		
		title.origX = title.x
		title.origY = title.y
		title.origSize = title.fontSize
		
		description.origX = description.x
		description.origY = description.y
		description.origSize = description.fontSize
		
        --Runtime:addEventListener( "enterFrame", positionMenu )
        
        
    end

return menu
