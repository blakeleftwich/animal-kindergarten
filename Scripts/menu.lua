local myData = require("Scripts.myData")
local promoLink
local promoTrackingID


function destroyChooseModeButtons()
	chooseModeButtons.x = 800
	
	
	if showMeButton ~= nil then
            showMeButton:removeSelf()
        end
                
	showMeButton = nil
        if traditionalButton ~= nil then 
            traditionalButton:removeSelf()
        end
	traditionalButton = nil
end

function closeChooseModeScreen()
	
	if (currentState == "game") then
		transition.to( chooseModeButtons, { time=700, alpha=0, x=-800, transition=easing.outExpo,onComplete=gameStartAnim1 } )
		transition.to( backButton, { time=700, alpha=0, transition=easing.outExpo } )
		buttonsActive = false
		
	else
	
		transition.to( chooseModeButtons, { time=700, alpha=0, x=800, transition=easing.outExpo,onComplete=destroyChooseModeButtons } )
		if chooseModeTitle ~= nil then 
            chooseModeTitle:removeSelf()
        end
		chooseModeTitle = nil
	
		updateChooseGameButtons()
		
	end
	
	transition.to( chooseModeTitle, { time=700, alpha=0, transition=easing.outExpo } )
	
end

function updateChooseModeButtons()

	if chooseGameTitle ~= nil then 
		chooseGameTitle:removeSelf()
	end
	chooseGameTitle = nil

	chooseModeTitle = display.newImageRect("Images/UI/chooseAMode.png", 216, 16 )
	chooseModeTitle.x = halfW
	chooseModeTitle.y = screenOriginY + 20

	showMeButton = display.newImageRect("Images/UI/showMeModeButton.png", 430,93)
	showMeButton.name = "showMeChosen"
	
	traditionalButton = display.newImageRect("Images/UI/traditionalModeButton.png", 430, 93 )
	traditionalButton.name = "traditionalChosen"
	
	showMeButton.x = halfW
	showMeButton.y = display.contentHeight/2 + 50
	showMeButton:addEventListener("touch", buttonTouched)
	traditionalButton.x = halfW
	traditionalButton.y = display.contentHeight/2 - 50
	traditionalButton:addEventListener("touch", buttonTouched)
	chooseModeButtons:insert(showMeButton)
	chooseModeButtons:insert(traditionalButton)
	
	
	chooseModeButtons:toFront()
	transition.to( chooseModeButtons, { time=700, alpha=1, x=0, transition=easing.outExpo, onComplete=makeButtonsActive} )
	
end


function destroyChooseGameButtons()

	if (currentState == "mode") then
		chooseGameButtons.x = -800
	else
		chooseGameButtons.x = 800
	end
	
	
	if (gameplayType == 1) then
		if numChooseButton ~= nil then
				numChooseButton:removeSelf()
			end
					
		numChooseButton = nil
			if numGroupChooseButton ~= nil then 
				numGroupChooseButton:removeSelf()
			end
		numGroupChooseButton = nil
		if groupsChooseButton ~= nil then 
				groupsChooseButton:removeSelf()
			end
		groupsChooseButton = nil
	else
		if picturesChooseButton ~= nil then 
				picturesChooseButton:removeSelf()
			end
		picturesChooseButton = nil
		if colorsChooseButton ~= nil then 
				colorsChooseButton:removeSelf()
			end
		colorsChooseButton = nil
	end
end

function closeChooseGameScreen()

	if (currentState == "mode") then
	
		transition.to( chooseGameButtons, { time=700, alpha=0, x=-800, transition=easing.outExpo, onComplete=destroyChooseGameButtons } )
		updateChooseModeButtons()
	
	else
		transition.to( selectButtons, { time=700, alpha=0, x=-800, transition=easing.outExpo } )
		transition.to( whatDoYouWant, { time=700, alpha=0, transition=easing.outExpo, onComplete=resetYPosition} )
	end
	
end

function updateChooseGameButtons()

	destroySelectButtons()
	
	chooseGameTitle = display.newImageRect("Images/UI/chooseAGame.png", 157, 16 )
	chooseGameTitle.x = halfW
	chooseGameTitle.y = screenOriginY + 20
	if (currentState ~= "mode") then
		chooseGameTitle.alpha = 0
	end

	if (gameplayType == 1) then
		numChooseButton = display.newImageRect("Images/UI/numbersGameButton.png", 430,93)
		numChooseButton.name = "numChosen"
		
		numGroupChooseButton = display.newImageRect("Images/UI/numbersAndGroupsGameButton.png", 430, 93 )
		numGroupChooseButton.name = "numGroupChosen"	
		
		groupsChooseButton = display.newImageRect("Images/UI/groupsGameButton.png", 430, 93 )
		groupsChooseButton.name = "groupsChosen"
		
		numChooseButton.x = halfW
		numChooseButton.y = display.contentHeight/2 + 100 + 15
		numChooseButton:addEventListener("touch", buttonTouched)
		numGroupChooseButton.x = halfW
		numGroupChooseButton.y = display.contentHeight/2 + 15
		numGroupChooseButton:addEventListener("touch", buttonTouched)
		groupsChooseButton.x = halfW
		groupsChooseButton.y = display.contentHeight/2 - 100 + 15
		groupsChooseButton:addEventListener("touch", buttonTouched)
		chooseGameButtons:insert(numChooseButton)
		chooseGameButtons:insert(numGroupChooseButton)
		chooseGameButtons:insert(groupsChooseButton)
		
		
		if (myData.isTV and version.appStore ~= "Chrome") then 
		else
			transition.to( backButton, { time=700, alpha=1, transition=easing.outExpo, onComplete=makeButtonsActive } )
		end
		
	else
	
		shapesChooseButton = display.newImageRect("Images/UI/shapesGameButton.png", 430, 93 )
		shapesChooseButton.name = "shapesChosen"	
	
		picturesChooseButton = display.newImageRect("Images/UI/picturesAndShapesGameButton.png", 430,93)
		picturesChooseButton.name = "picturesChosen"
		
		colorsChooseButton = display.newImageRect("Images/UI/shapePicturesGameButton.png", 430, 93 )
		colorsChooseButton.name = "colorsChosen"	
		
		
		shapesChooseButton.x = halfW
		shapesChooseButton.y = display.contentHeight/2 - 100 + 15
		shapesChooseButton:addEventListener("touch", buttonTouched)
		picturesChooseButton.x = halfW
		picturesChooseButton.y = display.contentHeight/2 + 15
		picturesChooseButton:addEventListener("touch", buttonTouched)
		colorsChooseButton.x = halfW
		colorsChooseButton.y = display.contentHeight/2 + 100 + 15
		colorsChooseButton:addEventListener("touch", buttonTouched)
		chooseGameButtons:insert(shapesChooseButton)
		chooseGameButtons:insert(picturesChooseButton)
		chooseGameButtons:insert(colorsChooseButton)
		
		if (myData.isTV and version.appStore ~= "Chrome") then 
		else
			transition.to( backButton, { time=700, alpha=1, transition=easing.outExpo, onComplete=makeButtonsActive } )
		end
		
	end
	
	
	chooseGameButtons:toFront()
	transition.to( chooseGameButtons, { time=700, alpha=1, x=0, transition=easing.outExpo, onComplete=makeButtonsActive } )
	transition.to( chooseGameTitle, { time=700, alpha=1, transition=easing.outExpo } )
	
	currentState = "match"
	
end


function resetYPosition()
	whatDoYouWant.y = -400
	
	if (currentState == "match") then
		updateChooseGameButtons()
	end
	
end

function closeSelectScreen()
	
	if (currentState == "match") then
		transition.to( selectButtons, { time=700, alpha=0, x=-800, transition=easing.outExpo } )
		transition.to( whatDoYouWant, { time=700, alpha=0, transition=easing.outExpo, onComplete=resetYPosition} )
	else
		transition.to( selectButtons, { time=700, alpha=0, x=-800, transition=easing.outExpo } )
		transition.to( whatDoYouWant, { time=700, alpha=0, transition=easing.outExpo, onComplete=resetYPosition} )
	
	end
end

function selectAnimation3()
	selectButtons:toFront()
	
	
	transition.to( selectButtons, { time=700, alpha=1, x=0, transition=easing.outExpo } )
	
		transition.to( backButton, { time=1100, alpha=1, transition=easing.outExpo} )
	
end

function selectAnimation2()

	if (needsToShowRatePopup == false) then
		
		if levelNotCompleted == false and endOfGame == true 
			or itemIndex+2 > totalLevels and menuGroup[itemIndex+2] and levels[300].repeatedLevels[itemIndex+2-subFromRepeatLevels] and levels[300].repeatedLevels[itemIndex+2-subFromRepeatLevels].completed == "completed" and endOfGame == true and menuGroup[itemIndex+2].levelID ~= selectableChar and menuGroup[itemIndex+2].levelID ~= iapChar and menuGroup[itemIndex+2].levelID ~= rateChar
			or itemIndex+2 <= totalLevels and menuGroup[itemIndex+2] and levels[menuGroup[itemIndex+2].levelID] == "completed" and endOfGame == true and menuGroup[itemIndex+2].levelID ~= selectableChar and menuGroup[itemIndex+2].levelID ~= iapChar and menuGroup[itemIndex+2].levelID ~= rateChar
			or levelNotCompleted == true and nextCharLocked == false and endOfGame == true
			or itemIndex+1 == totalAvailLevels
			or endOfGame == false
			or menuGroup[itemIndex+2].levelID == rateChar then
			
			
			if (myData.isFireTV ) then 
				Runtime:addEventListener( "onFTVKey", touchedMenu )
			elseif (myData.isController) then
				Runtime:addEventListener("key", touchedMenu)
				Runtime:addEventListener( "axis", touchedMenuAxis )
			end
			Runtime:addEventListener("touch",touchedMenu)
			currentState = "select"
			onLevelSelectScreen = true
			makeButtonsActive()
			
			
		end
		
	end
	
end

function selectAnimation1()
	
	if (endOfGame == false and fromTitle == true) then
	
		itemIndex = 0
		
		print(totalLevels-repeatedLevelsNum-2)
		print("Test")
		
		for i = 1, totalLevels-repeatedLevelsNum-2 do
		print(i)
			print(levels[i])
			if (levels[menuGroup[i].levelID] ~= "completed") then
				break
			end
			itemIndex = itemIndex+1
		end
		
		print(itemIndex)
		
		if (autoScrollTo ~= 0) then
			itemIndex = autoScrollTo-1
		end
		
		print("Testin")
		print(itemIndex)
	
		local newX = 0 - (((display.contentWidth * 0.5) + 50)*(itemIndex))
	
	
		transition.to( menuGroup, { time=700, alpha=1, x=newX, transition=easing.outExpo } )
	
	
	end
	
	
	transition.to( mainContainer, { time=700, alpha=1, x=0, transition=easing.outExpo } )
	
	
		transition.to( backButton, { time=700, alpha=1, transition=easing.outExpo} )
	fromMenu = true
	
		
	Runtime:addEventListener( "enterFrame", positionMenu )
	
	
	timer.performWithDelay ( 700, selectAnimation2 )
	destroyMenuButtons()
	updateSelectScreenButtons()
end


function destroySelectButtons()
	if numbersSelectButton ~= nil then
            numbersSelectButton:removeSelf()
        end
                
	numbersSelectButton = nil
        if picturesSelectButton ~= nil then 
            picturesSelectButton:removeSelf()
        end
	picturesSelectButton = nil
end

function updateSelectScreenButtons()


end

function removeSelectScreen()

	menu.unload()
	menu.reset()

end


function loadSelectScreen()

	if (system.getInfo( "platformName" ) == "Android"  ) then

		selectFont = "BigSky_1"
	else
		selectFont = "Big Sky"
	end
	
	
	musicOptions = {
	
		selectionOneMusic = audio.loadSound("Audio/jazzAction.mp3"),
	
	}
	
	
	characterSounds = {
	
		ralphie = audio.loadSound("Audio/ralphie.mp3"),
		percival = audio.loadSound("Audio/percival.mp3"),
		chauncey = audio.loadSound("Audio/chauncey.mp3"),
		webster = audio.loadSound("Audio/webster.mp3"),
		chip = audio.loadSound("Audio/chip.mp3"),
		oleg = audio.loadSound("Audio/oleg.mp3"),
		sunshine = audio.loadSound("Audio/sunshine.mp3"),
		pete = audio.loadSound("Audio/pete.mp3"),
		selectionFifteenSound = audio.loadSound("Audio/readyForANewChallenge.mp3"),
		
		pinkie = audio.loadSound("Audio/pinkie.mp3"),
		oliver = audio.loadSound("Audio/oliver.mp3"),
		cordelia = audio.loadSound("Audio/cordelia.mp3"),
		rocco = audio.loadSound("Audio/rocco.mp3"), --
		chloe = audio.loadSound("Audio/chloe.mp3"),
		
		dudley = audio.loadSound("Audio/dudley.mp3"),
		bella = audio.loadSound("Audio/bella.mp3"),
		daisy = audio.loadSound("Audio/daisy.mp3"),
	
	
		twoSnoreOneSound = audio.loadSound("Audio/snoreOut2.mp3"),
		twoSnoreTwoSound = audio.loadSound("Audio/snoreIn1.mp3"),
	}
	
	
	characterDetails = {
	
	
		Pinkie = { --
			character = { "Images/UI/selection1.png", 320, 256, 0, -22 },
			icon = {image="worldIcon1",width=44,height=34, anchor = { 0.55, 1 }, shadowScaleX = 1, shadowScaleY = 1, shadowOffsetX = -8.5, shadowOffsetY = -2},
			eyelids = { "eyelids1", 120, 24, -69.25, -61.8 }, 
			zOffset = { -104, -111 },
			lock = { 0, 0, 1 },
			pathOffset = { x = 6, y = 26 },
			hopOffset = { x = 5.5, y = 19},
			correctSound = "pig",
			
			iconIphone4 = {image="worldIcon1",width=92,height=68, anchor = { 0.55, 1 }, shadowScaleX = 1, shadowScaleY = 1, shadowOffsetX = -8.5, shadowOffsetY = -2},
			pathOffsetIphone4 = { x = 21, y = 36 },
			hopOffsetIphone4 = { x = 17.5, y = 25},
		
		},
		Oliver = { --
			character = { "Images/UI/selection40.png", 308, 254, 0, -31 },
			icon = {image="worldIcon40",width=45,height=59, anchor = { 0.55, 1 }, shadowScaleX = 1, shadowScaleY = 1, shadowOffsetX = -6, shadowOffsetY = -2.75},
			eyelids = { "eyelids40",35,19,-71.4,-78.5 }, 
			zOffset = { -123,-56 },
			lock = { 0, 0, 1 },
			pathOffset = { x = 1, y = 25 },
			hopOffset = { x = 0, y = 18},
			correctSound = "horse",
		},
		Sherman = { --
			character = { "Images/UI/selection43.png", 320, 256, 0, -14 },
			icon = {image="worldIcon43",width=80,height=68, anchor = { 0.55, 1 }, shadowScaleX = 1, shadowScaleY = 1.1, shadowOffsetX = -5.5, shadowOffsetY = -1.75},
			eyelids = { "eyelids43",64,36,-55.5,-41 }, 
			zOffset = { -86,-90 },
			lock = { 0, 0, 1 },
			pathOffset = { x = 1, y = 23 },
			hopOffset = { x = 17.5, y = 25},
			correctSound = "sheep",
		},
		Oleg = { --
			character = { "Images/UI/selection60.png", 308, 254, 0, -30 },
			icon = {image="worldIcon60",width=100,height=75, anchor = { 0.5, 1 }, shadowScaleX = .6, shadowScaleY = .6, shadowOffsetX = -.5, shadowOffsetY = -3},
			eyelids = { "eyelids60",145,72,0,-40 }, 
			zOffset = { -95.75,-32 },
			lock = { 0, 0, 1 },
			pathOffset = { x = 1, y = 43 },
			hopOffset = { x = 0, y = 32 },
			correctSound = "owl",
		},
		Chloe = { --
			character = { "Images/UI/selection64.png", 308, 254, 0, -34 },
			icon = {image="worldIcon64",width=100,height=75, anchor = { 0.5, 0.5 }, shadowScaleX = .6, shadowScaleY = .7, shadowOffsetX = 6, shadowOffsetY = -.5},
			eyelids = { "eyelids64",98,29,53,-20 }, 
			zOffset = { -5.5,-92 },
			lock = { 0, 0, 1 },
			pathOffset = { x = 1, y = 6 },
			hopOffset = { x = 0, y = 0 },
			correctSound = "fox2",
		},
		Bella = { --
			character = { "Images/UI/selection69.png", 308, 254, 0, -34 },
			icon = {image="worldIcon69",width=100,height=90, anchor = { 0.5, 0.5 }, shadowScaleX = .6, shadowScaleY = .7, shadowOffsetX = 6, shadowOffsetY = -.5},
			eyelids = { "eyelids69",53,27,26.5,-5.5 }, 
			zOffset = { -50,-36 },
			lock = { 0, 0, 1 },
			pathOffset = { x = 1, y = 6 },
			hopOffset = { x = 0, y = -3 },
			correctSound = "fox2",
		},
			
		
		Webster = { --
			character = { "Images/UI/selection41.png", 320, 256, 0, -30 },
			icon = {image="worldIcon41",width=56,height=60, anchor = { 0.55, .8 }, shadowScaleX = .6, shadowScaleY = 1, shadowOffsetX = -5.5, shadowOffsetY = 6.5}, --was -1.75
			eyelids = { "eyelids41",45,17,-70.5,-46.5 }, 
			zOffset = { -110,-55 },
			lock = { 0, 0, 1 },
			pathOffset = { x = 0, y = 20 },
			hopOffset = { x = 0, y = 11},
			correctSound = "duck",
		},
		Paco = { --
			character = { "Images/UI/selection67.png", 308, 254, 0, -10 },
			icon = {image="worldIcon67",width=100,height=75, anchor = { 0.55, .8 }, shadowScaleX = .6, shadowScaleY = 1, shadowOffsetX = -5.5, shadowOffsetY = 6.5}, --was -1.75
			eyelids = { "eyelids67",44,13,-75.3,27 }, 
			zOffset = { -142,34 },
			lock = { 0, 0, 1 },
			pathOffset = { x = 1, y = 47 },
			hopOffset = { x = -4, y = 4 },
			correctSound = "duck",
		},
		Bessie = { --
			character = { "Images/UI/selection23.png", 320, 256, 0, -20 },
			icon = {image="worldIcon23",width=124,height=96, anchor = { 0.55, 1 }, shadowScaleX = 1, shadowScaleY = 1, shadowOffsetX = -12, shadowOffsetY = -1.75},
			eyelids = { "eyelids23",84,32,-61,-79.5 }, 
			zOffset = { -114,-101 },
			lock = { 0, 0, 1 },
			pathOffset = { x = 1, y = 23 },
			hopOffset = { x = 17.5, y = 25},
			correctSound = "cow",
		},
		Ralphie = { --
			character = { "Images/UI/selection15.png", 308, 254, 0, -20 },
			icon = {image="worldIcon15",width=46,height=36, anchor = { 0.55, 1 }, shadowScaleX = .75, shadowScaleY = .75, shadowOffsetX = -2, shadowOffsetY = -1.75},
			eyelids = { "eyelids15",176,40,-17,-57 }, 
			zOffset = { -65,-106 },
			lock = { 0, 0, 1 },
			pathOffset = { x = 6, y = 26},
			hopOffset = { x = 7, y = 18},
			correctSound = "catMeow",
		},
		Gordon = { --
			character = { "Images/UI/selection44.png", 320, 256, 0, -20 },
			icon = {image="worldIcon44",width=76,height=84, anchor = { 0.55, 1 }, shadowScaleX = 1, shadowScaleY = 1, shadowOffsetX = -6, shadowOffsetY = -1.75},
			eyelids = { "eyelids44",68,32,-53,-30 }, 
			zOffset = { -35.5,-90 },
			lock = { 0, 0, 1 },
			pathOffset = { x = 1, y = 23 },
			hopOffset = { x = 17.5, y = 25},
			correctSound = "goat",
		},
		Cordelia = { --
			character = { "Images/UI/selection24.png", 320, 254, 0, -30 },
			icon = {image="worldIcon24",width=41,height=50, anchor = { 0.55, 1 }, shadowScaleX = .75, shadowScaleY = .75, shadowOffsetX = 2, shadowOffsetY = -1.75},
			eyelids = { "eyelids24",56,13,-94,-32 }, 
			zOffset = { -138,-18 },
			lock = { 0, 0, 1 },
			pathOffset = { x = 0, y = 38 },
			hopOffset = { x = 0, y = 30},
			correctSound = "chicken1",
		},
		Rocco = { --
			character = { "Images/UI/selection99.png", 308, 254, 0, -14 },
			icon = {image="worldIcon99",width=42,height=50, anchor = { 0.55, 1 }, shadowScaleX = .75, shadowScaleY = .75, shadowOffsetX = 2, shadowOffsetY = -1.75},
			eyelids = { "eyelids99",60,19,-82,-40 }, 
			zOffset = { -138,-18 },
			lock = { 0, 0, 1 },
			pathOffset = { x = 0, y = 38 },
			hopOffset = { x = 0, y = 30},
			correctSound = "chicken1",
		},
		Chauncey = { --
			character = { "Images/UI/selection25.png", 308, 254, 0, -30 },
			icon = {image="worldIcon25",width=43,height=39, anchor = { 0.55, 1 }, shadowScaleX = .55, shadowScaleY = .65, shadowOffsetX = -6, shadowOffsetY = -1.75},
			eyelids = { "eyelids25",96,18,-13,-4 }, 
			zOffset = { -16.25,-71.5 },
			lock = { 0, 0, 1 },
			pathOffset = { x = 6, y = 26 },
			hopOffset = { x = 5, y = 18},
			correctSound = "mouse",
		},
		Pete = { --
			character = { "Images/UI/selection66.png", 308, 254, 0, -24 },
			icon = {image="worldIcon66",width=100,height=90, anchor = { 0.55, 1 }, shadowScaleX = .9, shadowScaleY = 1.7, shadowOffsetX = -4, shadowOffsetY = -7},
			eyelids = { "eyelids66",130,56,0,-75 }, 
			zOffset = { -2.5,-110 },
			lock = { 0, 0, 1 },
			pathOffset = { x = 0, y = 55 },
			hopOffset = { x = 0, y = 45 },
			correctSound = "frog",
		},
		Sunshine = { --
			character = { "Images/UI/selection70.png", 308, 254, 0, -36 },
			icon = {image="worldIcon70",width=100,height=75, anchor = { 0.55, 0.5 }, shadowScaleX = 0.55, shadowScaleY = 0.55, shadowOffsetX = -6, shadowOffsetY = 62},
			eyelids = { "eyelids70",114,21,-58,39 }, 
			zOffset = { -53,-60 },
			lock = { 0, 0, 1 },
			pathOffset = { x = 0, y = 3 },
			hopOffset = { x = 2, y = -3 },
			correctSound = "",
		},
		Dudley = { --
			character = { "Images/UI/selection62.png", 308, 254, 0, -30 },
			icon = {image="worldIcon62",width=70,height=75, anchor = { 0.55, 0.5 }, shadowScaleX = 0.55, shadowScaleY = 0.55, shadowOffsetX = -6, shadowOffsetY = 62},
			eyelids = { "eyelids62",50,15,-37.5,-54 }, 
			zOffset = { -99,-53 },
			lock = { 0, 0, 1 },
			pathOffset = { x = 0, y = 10 },
			hopOffset = { x = 0, y = 5 },
			correctSound = "",
		},
		Daisy = { --
			character = { "Images/UI/selection68.png", 308, 254, 0, -26 },
			icon = {image="worldIcon68",width=100,height=90, anchor = { 0.55, 0.5 }, shadowScaleX = 0.55, shadowScaleY = 0.55, shadowOffsetX = -6, shadowOffsetY = 62},
			eyelids = { "eyelids68",67,39,-87,-18 }, 
			zOffset = { -148,-40 },
			lock = { 0, 0, 1 },
			pathOffset = { x = 1, y = 6 },
			hopOffset = { x = 0, y = -2 },
			correctSound = "",
		},
		
		Frances = { --
			character = { "Images/UI/selection63.png", 308, 254, 0, -23 },
			icon = {image="worldIcon63",width=100,height=95, anchor = { 0.55, 0.5 }, shadowScaleX = 0.55, shadowScaleY = 0.55, shadowOffsetX = -6, shadowOffsetY = 62},
			eyelids = { "eyelids63",40,25,-12,-48 }, 
			zOffset = { 58,-61 },
			lock = { 0, 0, 1 },
			pathOffset = { x = 1, y = 23 },
			hopOffset = { x = -5, y = -19 },
			correctSound = "",
		},
		Chip = { --
			character = { "Images/UI/selection61.png", 308, 254, 0, -30 },
			icon = {image="worldIcon61",width=100,height=90, anchor = { 0.55, 0.5 }, shadowScaleX = 0.55, shadowScaleY = 0.55, shadowOffsetX = -6, shadowOffsetY = 62},
			eyelids = { "eyelids61",102,38,0,-37 }, 
			zOffset = { -70,-84 },
			lock = { 0, 0, 1 },
			pathOffset = { x = 0, y = 3 },
			hopOffset = { x = 0, y = -3 },
			correctSound = "",
		},
		Percival = { --
			character = { "Images/UI/selection4.png", 308, 254, 0, -29 },
			icon = {image="worldIcon4",width=44,height=38, anchor = { 0.55, 0.5 }, shadowScaleX = 0.55, shadowScaleY = 0.55, shadowOffsetX = -6, shadowOffsetY = 62},
			eyelids = { "eyelids4",107,23,.6,-23 }, 
			zOffset = { -78.5,-108 },
			lock = { 0, 0, 1 },
			pathOffset = { x = 6, y = 7 },
			hopOffset = { x = 6, y = -1},
			correctSound = "",
		},
		Ben = { --
			character = { "Images/UI/selection65.png", 308, 254, 0, -12 },
			icon = {image="worldIcon65",width=100,height=75, anchor = { 0.55, 0.5 }, shadowScaleX = 0.55, shadowScaleY = 0.55, shadowOffsetX = -6, shadowOffsetY = 62},
			eyelids = { "eyelids65",67,16,-28,-70.5 }, 
			zOffset = { -149,-78 },
			lock = { 0, 0, 1 },
			pathOffset = { x = 1, y = 23 },
			hopOffset = { x = -5, y = -19 },
			correctSound = "",
		},
	
	}
	
	
	loadScrollMenu()
	
end


function loadScrollMenu()

	if (mainContainer) then
		for i = #mainContainer, 1, -1 do
			mainContainer[i]:removeSelf()
			mainContainer[i] = nil
		end
		mainContainer:removeSelf()
		mainContainer = nil
	end
	mainContainer = display.newGroup()
	mainContainer.x = 0
	
	
	if (savedData.rateInlineTouched == nil) then
		savedData.rateInlineTouched = false
		save()
	end
	
	
	subFromRepeatLevels = 0
	
	
	selectableChar = 2000
	iapChar = 2001
	rateChar = 2002
	
	
	repeatedLevelsNum = 19 -- Only repeated levels
	

	menu.init(mainContainer,itemSelected,selectFont)
	
	if (variation == 4 and unlockedEverything == false and unlockedWeeklySub == false and unlockedMonthlySub == false and unlockedYearlySub == false) then
	
		local firstFreeLevel = 1
	
		
		unlockedLevels = {}
		lockedLevels = {}
		
		
		for i = 1, #levelEditor do
		
			local v = levelEditor[i]
		
			if (v.free == true) then
				
				if (menuGroup == nil or menuGroup.numChildren == 0) then
					firstFreeLevel = i
				end
		
				unlockedLevels[#unlockedLevels+1] = i
		
				local characterDet = characterDetails[v.character].character
				local eyelidDetails = characterDetails[v.character].eyelids
				local zDetails = characterDetails[v.character].zOffset
				local lockDetails = characterDetails[v.character].lock
				
				print(v.selectScreenNameText)
				print(v.selectScreenSubtitleText)
				
				menu.addMenuItem("World" .. v.world, characterDet[1], characterDet[2], characterDet[3], characterDet[4], characterDet[5], i, v.selectScreenNameText, v.selectScreenSubtitleText, lockDetails[1], lockDetails[2], lockDetails[3], musicOptions[v.music],characterSounds[v.selectScreenNameVO],zDetails[1],zDetails[2],eyelidDetails[1],eyelidDetails[2],eyelidDetails[3],eyelidDetails[4],eyelidDetails[5], v.selectScreenSignText, v.selectScreenSignXOffset, v.selectScreenSignYOffset, v.flipChar)
			
			end
			
		end
		
		
		totalAvailLevels = menuGroup.numChildren -- only free levels
		
		
		codeIndexStart = 4
			if (savedData.enableIAP == true) then
			
				if (myData.isTV) then 
					menu.addMenuItem("World1","iap", 308, 254, 2, -24, iapChar,"","", 0, 0, 1, selectionOneMusic,characterSounds.selectionFifteenSound,-3.5,0,"eyelids41",140,33,1,-55, "", 70, 0, false)
				else
					menu.addMenuItem("World1","iap", 308, 254, 2, -32, iapChar,"","", 0, 0, 1, selectionOneMusic,characterSounds.selectionFifteenSound,-3.5,0,"eyelids41",140,33,1,-55, "", 70, 0, false)
				end
			
				codeIndexStart = 5
				
				subFromRepeatLevels = subFromRepeatLevels + 1
			end
		
		
		local getNumLevels = #levelEditor - totalAvailLevels - repeatedLevelsNum
		local currentLevelEditorNum = 0
		for i = 1, #levelEditor do
		
			local v = levelEditor[i]
		
			if (v.free == false) then
		
				lockedLevels[#lockedLevels+1] = i
		
				local characterDet = characterDetails[v.character].character
				local eyelidDetails = characterDetails[v.character].eyelids
				local zDetails = characterDetails[v.character].zOffset
				local lockDetails = characterDetails[v.character].lock
				
				menu.addMenuItem("World" .. v.world, characterDet[1], characterDet[2], characterDet[3], characterDet[4], characterDet[5], i, v.selectScreenNameText, v.selectScreenSubtitleText, lockDetails[1], lockDetails[2], lockDetails[3], musicOptions[v.music],characterSounds[v.selectScreenNameVO],zDetails[1],zDetails[2],eyelidDetails[1],eyelidDetails[2],eyelidDetails[3],eyelidDetails[4],eyelidDetails[5], v.selectScreenSignText, v.selectScreenSignXOffset, v.selectScreenSignYOffset, v.flipChar)
			
				print(v.selectScreenNameText)
				print(v.selectScreenSubtitleText)
			
				currentLevelEditorNum = currentLevelEditorNum + 1
			
				if (currentLevelEditorNum >= getNumLevels) then
					currentLevelEditorNum = i + 1
					break
				end
			
			end
			
		end
		
		
		if (myData.isTV == false) then
			if (savedData.enablePromo == true) then
				menu.addMenuItem("World1","Images/UI/selection43.png", 308,254, 2, -12, selectableChar,"","", 0, 0, 1, selectionOneMusic,characterSounds.selectionFifteenSound,-3.5,0,"eyelids41",140,33,1,-55, "", 70, 0, false)
			
				print("promo")
			
				subFromRepeatLevels = subFromRepeatLevels + 1
			end
		end
		
		
		repeatedCharStart = menuGroup.numChildren+1
		
		
		print("test")
		
		for i = currentLevelEditorNum, #levelEditor do
		
			local v = levelEditor[i]
		
			if (v.free == false) then
			
				lockedLevels[#lockedLevels+1] = i
		
				local characterDet = characterDetails[v.character].character
				local eyelidDetails = characterDetails[v.character].eyelids
				local zDetails = characterDetails[v.character].zOffset
				local lockDetails = characterDetails[v.character].lock
				
				menu.addMenuItem("World" .. v.world, characterDet[1], characterDet[2], characterDet[3], characterDet[4], characterDet[5], i, v.selectScreenNameText, v.selectScreenSubtitleText, lockDetails[1], lockDetails[2], lockDetails[3], musicOptions[v.music],characterSounds[v.selectScreenNameVO],zDetails[1],zDetails[2],eyelidDetails[1],eyelidDetails[2],eyelidDetails[3],eyelidDetails[4],eyelidDetails[5], v.selectScreenSignText, v.selectScreenSignXOffset, v.selectScreenSignYOffset, v.flipChar)
			
				print(v.selectScreenNameText)
				print(v.selectScreenSubtitleText)
			
				currentLevelEditorNum = currentLevelEditorNum + 1
			
			
			end
			
		end
		
		
		levels[100+firstFreeLevel] = "not locked"
		
		
	else
	
	
		for i = 1, 3 do
		
			local v = levelEditor[i]
		
			local characterDet = characterDetails[v.character].character
			local eyelidDetails = characterDetails[v.character].eyelids
			local zDetails = characterDetails[v.character].zOffset
			local lockDetails = characterDetails[v.character].lock
			
			print("test character")
			print(characterDet[1])
			
			menu.addMenuItem("World" .. v.world, characterDet[1], characterDet[2], characterDet[3], characterDet[4], characterDet[5], i, v.selectScreenNameText, v.selectScreenSubtitleText, lockDetails[1], lockDetails[2], lockDetails[3], musicOptions[v.music],characterSounds[v.selectScreenNameVO],zDetails[1],zDetails[2],eyelidDetails[1],eyelidDetails[2],eyelidDetails[3],eyelidDetails[4],eyelidDetails[5], v.selectScreenSignText, v.selectScreenSignXOffset, v.selectScreenSignYOffset, v.flipChar)
			
		end
	
	
		codeIndexStart = 4
				
		
		for i = 4, #levelEditor-repeatedLevelsNum do
		
			local v = levelEditor[i]
		
			local characterDet = characterDetails[v.character].character
			local eyelidDetails = characterDetails[v.character].eyelids
			local zDetails = characterDetails[v.character].zOffset
			local lockDetails = characterDetails[v.character].lock
			
			menu.addMenuItem("World" .. v.world, characterDet[1], characterDet[2], characterDet[3], characterDet[4], characterDet[5], i, v.selectScreenNameText, v.selectScreenSubtitleText, lockDetails[1], lockDetails[2], lockDetails[3], musicOptions[v.music],characterSounds[v.selectScreenNameVO],zDetails[1],zDetails[2],eyelidDetails[1],eyelidDetails[2],eyelidDetails[3],eyelidDetails[4],eyelidDetails[5], v.selectScreenSignText, v.selectScreenSignXOffset, v.selectScreenSignYOffset, v.flipChar)
			
		end
		
		
		if (myData.isTV == false) then
			if (savedData.enablePromo == true and promoEnabled == true) then
				menu.addMenuItem("World1","Images/UI/selection43.png", 308,254, 2, -12, selectableChar,"","", 0, 0, 1, selectionOneMusic,characterSounds.selectionFifteenSound,-3.5,0,"eyelids41",140,33,1,-55, "BLVD", 70, 0, false)
			
				subFromRepeatLevels = subFromRepeatLevels + 1
			end
		end
		
		
		repeatedCharStart = menuGroup.numChildren+1
		
		
		for i = #levelEditor-repeatedLevelsNum+1, #levelEditor do
		
			local v = levelEditor[i]
		
			local characterDet = characterDetails[v.character].character
			local eyelidDetails = characterDetails[v.character].eyelids
			local zDetails = characterDetails[v.character].zOffset
			local lockDetails = characterDetails[v.character].lock
			
			menu.addMenuItem("World" .. v.world, characterDet[1], characterDet[2], characterDet[3], characterDet[4], characterDet[5], i, v.selectScreenNameText, v.selectScreenSubtitleText, lockDetails[1], lockDetails[2], lockDetails[3], musicOptions[v.music],characterSounds[v.selectScreenNameVO],zDetails[1],zDetails[2],eyelidDetails[1],eyelidDetails[2],eyelidDetails[3],eyelidDetails[4],eyelidDetails[5], v.selectScreenSignText, v.selectScreenSignXOffset, v.selectScreenSignYOffset, v.flipChar)
			
		end
		
		
		local levelUnlock = 0
		repeat
			levelUnlock = levelUnlock + 1
		until levels[levelUnlock] == "not completed"
		
		print("level unlocked")
		print(levelUnlock)
		levels[100 + levelUnlock] = "not locked"
		
		
		totalAvailLevels = menuGroup.numChildren - 1
		
		
		levelUnlock = 0
		repeat
			levelUnlock = levelUnlock + 1
			
			if (levels[levelUnlock] == "completed") then
				levels[100 + levelUnlock+1] = "not locked"
			end
		until levelUnlock >= totalAvailLevels or iapPurchased[levelUnlock-2] and iapPurchased[levelUnlock-2] == "true"
	end
	
	
	totalLevels = menuGroup.numChildren - 1
	
	
	levelsNum = menuGroup.numChildren - subFromRepeatLevels -- Only levels. Not repeated -- 30
	
	
	if (variation == 5 or unlockedEverything == true or unlockedWeeklySub == true or unlockedMonthlySub == true or unlockedYearlySub == true) then
		unlockedLevels = nil
		for i = #lockedLevels, 1, -1 do
			lockedLevels[i] = nil
			table.remove( lockedLevels, i )
		end
	end
	
	
	mainContainer.anchorX, mainContainer.anchorY = 0, 0.5
	mainContainer.x = 2000
	mainContainer.alpha = 0
	loadingMenu = true
	

end


function loadChooseGameScreen()
	chooseGameButtons:toFront()
	chooseGameButtons.x = 800
	chooseGameButtons.alpha = 0	
end

function loadChooseModeScreen()
	chooseModeButtons:toFront()
	chooseModeButtons.x = 800
	chooseModeButtons.alpha = 0	
end


function makeButtonsActive()
	print("MAKE BUTTONS ACTIVE")
	buttonsActive = true
	
end

function buttonTouched(event)
	local thisButton = event.target
	local keyName = event.keyName
	
	if event.phase == "began" then
		if (testText) then
			if (buttonsActive == true) then
				testText.text = testText.text .. "\n" .. "is buttons active: " .. "true"
			else
				testText.text = testText.text .. "\n" .. "is buttons active: " .. "false"
			end
			testText.text = testText.text .. "\n" .. "current state: " .. currentState
			testText:toFront()
		end
	end
	
	if event.phase == "began" and buttonsActive or
		keyName and event.phase == "down" and buttonsActive and keyName ~= "menu" or
			keyName and event.phase == "down" and buttonsActive and system.getInfo ("model") == "Apple TV" then
			
		hold = true
		
		if (thisButton) then
			print ("Button: " .. thisButton.name)
		end
		backButton:toFront()
		
		if (holdMessageTrans) then
			transition.cancel( holdMessageTrans )
			holdMessageTrans = nil
		end
		if (holdImageTrans) then
			transition.cancel( holdImageTrans )
			holdImageTrans = nil
		end
		
		if thisButton and thisButton.name == "promo" and currentState == "title" then
			
			if savedData.enableSounds == true then
					playReservedChannel(clickSound, 8, 0)
			end
			
			if (promoTrackingID) then
			end
			
			nextScene = "promo"
			openParentalGate()
			
					
		elseif (thisButton and thisButton.name == "restore") or 
				( keyName and currentCursorSelect == "restore" and currentState == "IAPMenu"  and keyName == "buttonA") or
				( keyName and currentCursorSelect == "restore" and currentState == "IAPMenu"  and keyName == "buttonZ") or
				( myData.isFireTV and currentCursorSelect == "restore" and currentState == "IAPMenu"  and event.keyName and event.keyName == "select" ) then
				
				
			 buyIAP("restore")
			 if savedData.enableSounds == true then
					playReservedChannel(clickSound, 8, 0)
			end
                        return true
						
		elseif thisButton and thisButton.name == "iapBottomButton" and currentState == "title" then
               if (settingsLua.parentsButtonDelay == true) then
						fadeInUnlockMessage("hold for 3 seconds", false)
					end
					local function onHoldTimer()
						if (hold ==  true) then
						
							unlockScreen()
							closeMenu()
							Runtime:removeEventListener( "enterFrame", iapCardFloat)
							
							if (holdTimer) then
								timer.cancel(holdTimer)
								holdTimer = nil
							end
							hold = false
							
							if savedData.enableSounds == true then
									playReservedChannel(clickSound, 8, 0)
							end
							
							fadeOutUnlockMessage()
						end
					end
					holdTimer = timer.performWithDelay( parentsHold, onHoldTimer)
					
		elseif thisButton and thisButton.name == "iapBottomButton" and currentState == "parentsMenu" then
		
			unlockScreen()
			closeMenu()
			Runtime:removeEventListener( "enterFrame", iapCardFloat)
			
			if savedData.enableSounds == true then
					playReservedChannel(clickSound, 8, 0)
			end
			
        elseif thisButton and thisButton.name == "openParentsMenu" and currentState == "title" then
              
					
					nextScene = "parentsMenu"
					openParentalGate()
					
						if savedData.enableSounds == true then
								playReservedChannel(clickSound, 8, 0)
						end
						
		elseif thisButton and thisButton.name == "privacyPolicy" then  
								
					
					if (thisButton.name) then
					end
					
					local openURL =  promoKit.settings.links.privacyPolicy
					print("opening link "..tostring(openURL))
					system.openURL( openURL )
					
					if savedData.enableSounds == true then
							playReservedChannel(clickSound, 8, 0)
					end
					
		elseif thisButton and thisButton.name == "rateApp" then  
								
					
					if (reviewPopUp ~= nil) then
					
						reviewPopUp.show()
						
					else
						
						local openURL =  promoKit.settings.links.rateThisAppURL
						print("opening link "..tostring(openURL))
						system.openURL( openURL )
						
						
					end
					
					if savedData.enableSounds == true then
							playReservedChannel(clickSound, 8, 0)
					end
								
             elseif thisButton and thisButton.name == "unlockAllColors" then
                    if (settingsLua.parentsButtonDelay == true and currentState ~= "parentsMenu") then
						fadeInUnlockMessage("hold for 3 seconds", false)
					end
					local function onHoldTimer()
							if (hold ==  true) then
								print("+++unlockScreen - unlockAllColors")
								unlockScreen()
								if (holdTimer) then
									timer.cancel(holdTimer)
									holdTimer = nil
								end
								hold = false
								
								if savedData.enableSounds == true then
										playReservedChannel(clickSound, 8, 0)
								end
								
								fadeOutUnlockMessage()
								
							end
							
					end
					if (currentState == "parentsMenu") then
						holdTimer = timer.performWithDelay( 0, onHoldTimer)
					else
						holdTimer = timer.performWithDelay( parentsHold, onHoldTimer)
					end
                
                elseif thisButton and thisButton.name == "unlockAllShapes" then
                    if (settingsLua.parentsButtonDelay == true and currentState ~= "parentsMenu") then
						fadeInUnlockMessage("hold for 3 seconds", false)
					end
					local function onHoldTimer()
						if (hold ==  true) then
                            print("+++unlockScreen - unlockAllShapes")
							unlockScreen()
							if (holdTimer) then
								timer.cancel(holdTimer)
								holdTimer = nil
							end
							hold = false
							
							if savedData.enableSounds == true then
									playReservedChannel(clickSound, 8, 0)
							end
							
							fadeOutUnlockMessage()
							
						end
					end
					if (currentState == "parentsMenu") then
						holdTimer = timer.performWithDelay( 0, onHoldTimer)
					else
						holdTimer = timer.performWithDelay( parentsHold, onHoldTimer)
					end
		
		elseif thisButton and thisButton.name == "unlockColors" then
                if (settingsLua.parentsButtonDelay == true and currentState ~= "parentsMenu") then
						fadeInUnlockMessage("hold for 3 seconds", false)
					end
					local function onHoldTimer()
						if (hold ==  true) then
							print("+++unlockScreen - unlockColors")
							unlockScreen()
							if (holdTimer) then
								timer.cancel(holdTimer)
								holdTimer = nil
							end
							hold = false
							
							if savedData.enableSounds == true then
									playReservedChannel(clickSound, 8, 0)
							end
							
							fadeOutUnlockMessage()
							
						end
						
					end
					if (currentState == "parentsMenu") then
						holdTimer = timer.performWithDelay( 0, onHoldTimer)
					else
						holdTimer = timer.performWithDelay( parentsHold, onHoldTimer)
					end
		
		elseif thisButton and thisButton.name == "unlockShapes" then
			if (settingsLua.parentsButtonDelay == true and currentState ~= "parentsMenu") then
				
						fadeInUnlockMessage("hold for 3 seconds", false)
					end
					local function onHoldTimer()
						if (hold ==  true) then
							print("+++unlockScreen - unlockShapes")
							unlockScreen()
							if (holdTimer) then
								timer.cancel(holdTimer)
								holdTimer = nil
							end
							hold = false
							
							if savedData.enableSounds == true then
									playReservedChannel(clickSound, 8, 0)
							end
							
							fadeOutUnlockMessage()
							
						end
					end
					if (currentState == "parentsMenu") then
						holdTimer = timer.performWithDelay( 0, onHoldTimer)
					else
						holdTimer = timer.performWithDelay( parentsHold, onHoldTimer)
					end
		
		elseif (thisButton and thisButton.name == "iapUnlockAll" and currentState == "IAPMenu") or 
				( keyName and currentCursorSelect == "iapUnlockAll" and currentState == "IAPMenu"  and keyName == "buttonA") or
				( keyName and currentCursorSelect == "iapUnlockAll" and currentState == "IAPMenu"  and keyName == "buttonZ") or
				(currentCursorSelect == "iapUnlockAll" and currentState == "IAPMenu" and myData.isFireTV and event.keyName and event.keyName == "select" or
				thisButton and thisButton.name == "iapUnlockAll" and currentState == "UpfrontMenu") or 
				( keyName and currentCursorSelect == "iapUnlockAll" and currentState == "UpfrontMenu"  and keyName == "buttonA") or
				(currentCursorSelect == "iapUnlockAll" and currentState == "UpfrontMenu" and myData.isFireTV and event.keyName and event.keyName == "select" or
				thisButton and thisButton.name == "iapUnlockAll" and currentState == "parentsMenu") then
				
			if (thisButton and thisButton.id == "window" or currentCursorSelect == "iapUnlockAll") then
				if (event.x and event.x < halfW + 70 and event.y > halfH - 100 and event.y < halfH + 65 and currentState == "IAPMenu" or 
					event.x and event.x < halfW + 110 and event.y > halfH - 60 and event.y < halfH + 65 and currentState == "IAPMenu" or 
					event.x and event.x < halfW + 70 and event.y > halfH - 100 and event.y < halfH + 145 and currentState == "UpfrontMenu" or 
					event.x and event.x < halfW + 110 and event.y > halfH - 60 and event.y < halfH + 145 and currentState == "UpfrontMenu" or 
					currentCursorSelect == "iapUnlockAll") then
					
					if (forParentsButton.alpha == 0) then
						charSoundTrasitioning = true
						
						
						if savedData.enableSounds == true then
							playReservedChannel(clickSound, 8, 0)
						end
						buyIAP(version.unlockItems.All)
					else
					
						
						transition.to( upfrontGroup, { time=1100, alpha=0, transition=easing.outExpo } )
						transition.to( upfrontScrollGroup, { time=1100, alpha=0, transition=easing.outExpo, onComplete = makeButtonsActive } )
						Runtime:removeEventListener( "enterFrame", upfrontScrollAnim)
						
						
						nextScene = "upfrontIAP"
						openParentalGate()
						
							
								if savedData.enableSounds == true then
									playReservedChannel(clickSound, 8, 0)
								end
								
							
					end
					
								return true
				end
				
			elseif (thisButton) then
			
				charSoundTrasitioning = true
				
				if (thisButton.name) then
				end
				
				if savedData.enableSounds == true then
						playReservedChannel(clickSound, 8, 0)
				end
				buyIAP(version.unlockItems.All)
							return true
			end
			
		elseif (thisButton and thisButton.name == "iapUnlockCharacter") or 
					( keyName and currentCursorSelect == "iapUnlockCharacter" and currentState == "IAPMenu"  and keyName == "buttonA") or
					( keyName and currentCursorSelect == "iapUnlockCharacter" and currentState == "IAPMenu"  and keyName == "buttonZ") or
					(currentCursorSelect == "iapUnlockCharacter" and currentState == "IAPMenu" and event.keyName and event.keyName == "select" and myData.isFireTV) then
				
				if (event.y and event.y > halfH + 77 or currentCursorSelect == "iapUnlockCharacter") then
					
					charSoundTrasitioning = true
					
					if savedData.enableSounds == true then
							playReservedChannel(clickSound, 8, 0)
					end
					buyIAP(version.unlockItems[characterSelected])
								return true
				end
               
			   
		elseif (thisButton and thisButton.name == "play" and currentState == "title") or 
					(currentState == "title" and myData.isFireTV or
					keyName and currentState == "title") then
					
			if (system.getInfo ("model") == "Apple TV") then
				system.deactivate("controllerUserInteraction")
			end
					
			fromTitle = true
			
			needsToShowRatePopup = false
			
			loadScrollMenu()
			
			
			if (titleBackButton) then
				transition.to( titleBackButton, { time=700, alpha=0, transition=easing.outExpo } )
			end
			transition.to( forParentsButton, { time=700, alpha=0, x=display.contentWidth + 400, transition=easing.outExpo } )
			transition.to( titleButtons, { time=700, alpha=0, x=-800, transition=easing.outExpo } )
			transition.to( playLogoButton, { time=700, alpha=0, transition=easing.outExpo, onComplete=selectAnimation1} )
			
			
			closeMenu()
			
			charSoundTrasitioning = false
			
			removeCharAnim("down")
			
			slideOutPromo()
			currentState = "select"
			buttonsActive = false
			
			
			if savedData.enableSounds == true then
				playReservedChannel(clickSound, 8, 0)
			end
			
			itemIndex = 0
			
			hold = false
			if (holdTimer) then
				timer.cancel(holdTimer)
				holdTimer = nil
			end
			fadeOutUnlockMessage()
			
			Runtime:removeEventListener( "enterFrame", iapCardFloat)
			
			
		elseif (thisButton and thisButton.name == "upfrontExit" and currentState == "UpfrontMenu") or 
				( keyName and currentState == "UpfrontMenu"  and keyName == "buttonB") or
				(currentState == "UpfrontMenu" and event.keyName and event.keyName == "back" and myData.isFireTV) then
			
			
				if (event.x and event.x > halfW + 140 or event.x and event.y < halfH - 130 or 
						event.x and event.x < halfW - 130 or event.x and event.y > halfH + 140) then
				
					buttonsActive = false
					
				
					closeUpfront()
					
				
					currentState = "title"
				
					titleButtons:toFront()
					transition.to( titleButtons, { time=700, alpha=1, x=0, transition=easing.outExpo } )
					transition.to( playLogoButton, { time=700, alpha=1, transition=easing.outExpo } )
					transition.to( playArrow, { time=700, alpha=1, transition=easing.outExpo } )
					
					if (version.appStore == "Mac")  or version.appStore == "Windows" or version.appStore == "Chrome" then
						transition.to( exitGameBtn, { time=700, alpha=1, transition=easing.outExpo } )
					end
					
					local function titleCharAnimation()
						
						startCharAnim(halfW)
					end
					timer.performWithDelay( 300, titleCharAnimation)
					
					Runtime:addEventListener( "enterFrame", playArrowFloat)
					
					
					local function playTitleSound()
						makeButtonsActive()
						if savedData.enableSounds == true and titleCanPlay == true then
							playReservedChannel(numMemoryMatchSound, 7, 0)
							titleCanPlay = false
						elseif (savedData.enableSounds == true and titleCanPlay == true) then
							playReservedChannel(hiSound, 7, 0)
						end
					end
					
					timer.performWithDelay( 600, playTitleSound)
					
					timer.performWithDelay( 700, makeButtonsActive )
						
					
					if savedData.enableSounds == true then
						playReservedChannel(clickSound, 8, 0)
					end
					
				end
			
			
		elseif (thisButton and thisButton.name == "iapExit" and currentState == "IAPMenu") or 
				( keyName and currentState == "IAPMenu"  and keyName == "buttonB") or
				(currentState == "IAPMenu" and event.keyName and event.keyName == "back" and myData.isFireTV) then
			
			
			if (myData.isTV == true) then
			
				buttonsActive = false
				closeIAPMenu()
				
				charSoundTrasitioning = false
				
				
				Runtime:addEventListener( "enterFrame", positionMenu )
				Runtime:addEventListener("touch",touchedMenu)
				
				if (myData.isFireTV) then 
					Runtime:addEventListener( "onFTVKey", touchedMenu )
				elseif (myData.isController) then
					Runtime:addEventListener("key", touchedMenu)
					Runtime:addEventListener( "axis", touchedMenuAxis )
				end
			
				timer.performWithDelay( 400, makeButtonsActive )
			
			else
			
				if (event.x and event.x > halfW + 70 or event.x and event.y < halfH - 100 or 
						event.x and event.x < halfW - 110 or event.x and event.y > halfH + 100) then
				
					buttonsActive = false
					
				
					closeIAPMenu()
					if (forParentsButton.alpha == 0) then
						charSoundTrasitioning = false
						
					
						Runtime:addEventListener("touch",touchedMenu)
						
						if (myData.isFireTV) then 
							Runtime:addEventListener( "onFTVKey", touchedMenu )
						elseif (myData.isController) then
							Runtime:addEventListener("key", touchedMenu)
							Runtime:addEventListener( "axis", touchedMenuAxis )
							
							if (version.appStore == "Chrome") then
								transition.to( backButton, { time=400, alpha=1, transition=easing.outExpo } )
							end
						else
							transition.to( backButton, { time=400, alpha=1, transition=easing.outExpo } )
						end
						
						timer.performWithDelay( 400, makeButtonsActive )
						
					else
					
					
						currentState = "title"
					
						titleButtons:toFront()
						transition.to( titleButtons, { time=700, alpha=1, x=0, transition=easing.outExpo } )
						transition.to( playLogoButton, { time=700, alpha=1, transition=easing.outExpo } )
						transition.to( playArrow, { time=700, alpha=1, transition=easing.outExpo } )
						
						if (version.appStore == "Mac")  or version.appStore == "Windows" or version.appStore == "Chrome" then
							transition.to( exitGameBtn, { time=700, alpha=1, transition=easing.outExpo } )
						end
						
						local function titleCharAnimation()
							
							startCharAnim(halfW)
						end
						timer.performWithDelay( 300, titleCharAnimation)
						
						Runtime:addEventListener( "enterFrame", playArrowFloat)
						
						
						local function playTitleSound()
							makeButtonsActive()
							if savedData.enableSounds == true and titleCanPlay == true then
								playReservedChannel(numMemoryMatchSound, 7, 0)
								titleCanPlay = false
							elseif (savedData.enableSounds == true) then
								playReservedChannel(hiSound, 7, 0)
							end
						end
						
						timer.performWithDelay( 600, playTitleSound)
						
						timer.performWithDelay( 700, makeButtonsActive )
						
					end
					
					
				end
				
				if savedData.enableSounds == true then
					playReservedChannel(clickSound, 8, 0)
				end
			
			end
				
		
		elseif (thisButton and thisButton.name == "exitGame" and currentState == "title") or
               (currentState == "title" and currentCursorSelect == "exitGame" and keyName and isKeyButtonSelect(keyName)) then
				
				if savedData.enableSounds == true then
					playReservedChannel(clickSound, 29, 0)
				end
				print("Exit Game")
				native.requestExit()
			
			
		elseif (thisButton and thisButton.name == "back" and event.keyName == nil) or
				(event.keyName and event.keyName == "buttonB") or
				(event.keyName and event.keyName == "back") or
				(event.keyName and event.keyName == "b") or
				(event.keyName and event.keyName == "deleteBack") or
				(event.keyName and system.getInfo ("model") == "Apple TV" and event.keyName == "menu") then
				
				
				Runtime:removeEventListener( "onFTVKey", touchedMenu )
				Runtime:removeEventListener("key", touchedMenu)
				Runtime:removeEventListener( "axis", touchedMenuAxis )
				
			print("CURRENTSTATE IS "..currentState)
			hold = false
			if (holdTimer) then
				timer.cancel(holdTimer)
				holdTimer = nil
			end
			fadeOutUnlockMessage()
			titleCanPlay = false
			
			if currentState == "select" then
				changeBackground()
				menuUnload = true
				local function unloadMenu()
					menu.reset()
					menu.unload()
					menuUnload = false
					itemIndex = 0
				end
				timer.performWithDelay( 300, unloadMenu)
				
				
				closeSelectScreen()
				mainContainer.anchorX=0
				mainContainer.anchorY=0.5

				transition.to( mainContainer, { time=700, alpha = 0, x=mainContainer.width+2000, transition=easing.outExpo } )
				transition.to( backButton, { time=700, alpha=0, transition=easing.outExpo, onComplete = openMenu } )
				
				
				destroySelectButtons()
				title()
				buttonsActive = false
				onLevelSelectScreen = false
				currentState = "title"
				Runtime:addEventListener( "enterFrame", iapCardFloat)
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
				 
				 
				 if (variation == 5 or unlockedEverything == true or unlockedWeeklySub == true or unlockedMonthlySub == true or unlockedYearlySub == true) then
					
					if (showRateInline == true) then
				 
						 local function resetSelectScreen()
							menu.unload()
							menu.reset()
							loadScrollMenu()
						end
						timer.performWithDelay( 100, resetSelectScreen )
						
					end
				
					showRateInline = false
				
				end
				 
			elseif currentState == "match" then
				closeChooseGameScreen()
				transition.to( backButton, { time=700, alpha=0, transition=easing.outExpo } )
				transition.to( chooseGameTitle, { time=700, alpha=0, transition=easing.outExpo } )
				chooseGameButtons.x = 800
				destroyChooseGameButtons()
				selectAnimation1()
				buttonsActive = false
				currentState = "select"
			elseif currentState == "mode" then
				closeChooseModeScreen()
				chooseGameButtons.x = -800
				buttonsActive = false
				currentState = "match"
			elseif currentState == "parentsMenu" then
			
				buttonsActive = false
			
				if (variation == 4 and unlockedEverything == false and unlockedWeeklySub == false and unlockedMonthlySub == false and unlockedYearlySub == false) then
				
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
				
				end
			
				local function goToTitleScreen()
					slideInPromo()
					transition.to( stripes, { time=700, alpha=0, transition=easing.outExpo } )
					transition.to( playLogoButton, { time=900, alpha=1, transition=easing.outExpo} )
					
					if (version.appStore ~= "Chrome") then
						transition.to( forParentsButton, { time=1100, alpha=1, x=forParentsButtonX, transition=easing.outExpo } )
					end
					transition.to( backButton, { time=700, alpha=0, transition=easing.outExpo } )	
					transition.to( parentsMenuGroup, { time=700, alpha=0, x=display.contentWidth + 200, transition=easing.outExpo } ) 
					transition.to( titleButtons, { time=700, alpha=0, x=-800, transition=easing.outExpo } )
					timer.performWithDelay( 350, transitionBackBottomButtons , 1 )
					
					title()
					currentState = "title"
				end
				
				if (variation == 4 and unlockedEverything == false and unlockedWeeklySub == false and unlockedMonthlySub == false and unlockedYearlySub == false) then
					timer.performWithDelay( 150, goToTitleScreen )
				else
					timer.performWithDelay( 0, goToTitleScreen )
				end
				
			elseif currentState == "IAPMenu" then
			
				buttonsActive = false
				
				closeIAPMenu()
				
				Runtime:removeEventListener( "enterFrame", positionMenu )
				Runtime:addEventListener( "enterFrame", positionMenu )
				Runtime:addEventListener("touch",touchedMenu)
				
				
				if (myData.isTV) then 
					if (myData.isFireTV ) then 
						Runtime:addEventListener( "onFTVKey", touchedMenu )
					elseif (myData.isController) then
						Runtime:addEventListener("key", touchedMenu)
						Runtime:addEventListener( "axis", touchedMenuAxis )
					end
					
					if (version.appStore == "Chrome") then
						transition.to( backButton, { time=700, alpha=1, transition=easing.outExpo } )
					end
				else
					transition.to( backButton, { time=700, alpha=1, transition=easing.outExpo } )
				end
				
				timer.performWithDelay( 200, makeButtonsActive )
			
			elseif currentState == "UpfrontMenu" then
			elseif currentState == "game" then
				buttonsActive = false
				audio.fade( { channel=3 , time=1000 , volume=0  } )
				local function playMenuMusicTimer()
					if savedData.enableMusic == true then
						audio.stop( 3 )
						audio.play( introMenuSound, { channel = 1, loops = -1 }  )
						audio.setVolume( 1, { channel=1 } )
						audio.play( introMenuSound, { channel = 2, loops = -1 }  )
						audio.setVolume( 1, { channel=2 } )
					end
				end
				timer.performWithDelay( 1000, playMenuMusicTimer )
				currentState = "select"
				transition.to( gamePathGroup, { time=700, alpha=0, transition=easing.outExpo } )
				closeGameScreen()
				transition.to( backButton, { time=700, alpha=0, transition=easing.outExpo } )
				transition.to( instructionsReplayButton, { time=700, alpha=0, transition=easing.outExpo } )
				if (gameplayMode == 2) then
					transition.to( peekButton, { time=700, alpha=0, transition=easing.outExpo } )
				end
				Runtime:removeEventListener( "enterFrame", countTime )
			end
			
				
			if savedData.enableSounds == true then
				playReservedChannel(clickSound, 8, 0)
			end
			
			
		end
	end
	
	if event.phase == "moved" and hold == true then
        if event.x and event.x > event.target.x - (event.target.width/2) + 3 and 
           event.x < event.target.x + (event.target.width/2) - 3 and 
           event.y > event.target.y - (event.target.height/2) + 3 and 
           event.y < event.target.y + (event.target.height/2) - 3 then
        else
			hold = false
			if (holdTimer) then
				timer.cancel(holdTimer)
				holdTimer = nil
			end
			fadeOutUnlockMessage()
		end
	end
	
	if event.phase == "ended" or event.phase == "cancelled" then
		hold = false
		if (holdTimer) then
			timer.cancel(holdTimer)
			holdTimer = nil
		end
		fadeOutUnlockMessage()
	end
	
	
	if (thisButton and thisButton.name == "back") or 
				(event.keyName and event.keyName == "buttonB") or
				(event.keyName and event.keyName == "back") then
	
		if (myData.isFireTV) then
		elseif (version.appStore=="Amazon") then
			return true
		end
	
	end
	
	
end


function parentalGateFlurry(scene,typeFlurry)

	
	if (scene == "parentsMenu") then
	
		if (typeFlurry == "exit") then
		else
		end
		
	elseif (scene == "promo") then
	
		if (typeFlurry == "exit") then
			if (promoTrackingID) then
			end
		else
			if (promoTrackingID) then
			end
		end
		
	elseif (scene == "selectableChar") then
	
		if (typeFlurry == "exit") then
			if (promos[1]) then
			end
		else
			if (promos[1]) then
			end
		end
	
	elseif (scene == "iapChar") then
	
		if (typeFlurry == "exit") then
			if (showingSaleIAP == true) then
			else
			end
		else
			if (showingSaleIAP == true) then
			else
			end
		end
		
	elseif (scene == "rateChar") then
	
		if (typeFlurry == "exit") then
		else
		end
	
	elseif (scene == "characterIAP") then
	
		if (typeFlurry == "exit") then
			if (menuGroup[1+itemIndex].text) then
			end
		else
			if (menuGroup[1+itemIndex].text) then
			end
		end
		
	elseif (scene == "upfrontIAP") then
		
		if (typeFlurry == "exit") then
		else
		end
	
	end

end

function goToScene(scene)

	currentScene = scene

	if (scene == "parentsMenu") then
	
		
		if (version.bundleID == "com.eggrollgames.animalmathkindergartenfreetime") then
			optionsTextNoIAPPromo.isVisible = true
			optionsText.isVisible = false
			optionsTextNoIAP.isVisible = false
			iapOffButton.alpha = 0
			iapOnButton.alpha = 0
			promoOffButton.alpha = 0
			promoOnButton.alpha = 0
		 elseif variation == 5 or unlockedEverything == true or unlockedWeeklySub == true or unlockedMonthlySub == true or unlockedYearlySub == true then
			optionsTextNoIAP.isVisible = true
			optionsText.isVisible = false
			optionsTextNoIAPPromo.isVisible = false
			iapOffButton.alpha = 0
			iapOnButton.alpha = 0
		else
			optionsTextNoIAP.isVisible = false
			optionsText.isVisible = true
			optionsTextNoIAPPromo.isVisible = false
		end
		
		stripes:toFront()
		parentsMenuGroup:toFront()
		
			
		transition.to( forParentsButton, { delay = 400,time=700, alpha=0, x=display.contentWidth + 400, transition=easing.outExpo } )
		transition.to( stripes, { delay = 400,time=700, alpha=1, transition=easing.outExpo } )
		transition.to( playLogoButton, { delay = 400,time=700, alpha=0, transition=easing.outExpo} )
		transition.to( parentsMenuGroup, { delay = 400,time=700, alpha=1, x=0, transition=easing.outExpo } ) 
		closeMenu()
		removeCharAnim("down")
		
		
		if (iapButtonText) then
		
			if (version.unlockItems.All) then
				iapButtonText.text = iap_getProductPrice(version.unlockItems.All)
			end
			iapButtonText.anchorX = 0.5
			iapButtonText.anchorY = 0.5
			
			if (iapButtonText.text == "") then
				iapButtonText.text = "GET!"
			end
			
			iapButtonText.x = unlockButton.x
			iapButtonText.y = unlockButton.y + 10
			
			if (iapButtonText.text == "") then
				iapButtonText.text = "GET!"
			end
			
			if ( system.getInfo( "platformName" ) == "Android" ) then
				iapButtonText.y = unlockButton.y - 69
			end
		
		end
		
		transition.to( forParentsButton, { delay = 400,time=700, alpha=0, x=display.contentWidth + 400, transition=easing.outExpo, onComplete=resetBottomParentsButtons } )
		transition.to( titleButtons, { delay = 400,time=700, alpha=0, x=-800, transition=easing.outExpo} )
		transition.to( playLogoButton, { delay = 400,time=700, alpha=0, transition=easing.outExpo} )
		timer.performWithDelay( 350, updateBottomMenuButtons , 1 )
		currentState = "parentsMenu"
		buttonsActive = false
		slideOutPromo()
		
		
	elseif (scene == "promo") then
	
		if (promoTrackingID) then
		end
		
		currentState = "title"
		buttonsActive = true
		
		print("opening link "..tostring(promoLink))
		system.openURL( promoLink )
		
	elseif (scene == "selectableChar") then
	
		transition.to( menuGroup[1+itemIndex], { time=700, alpha=1, transition=easing.outExpo } )
		
	
		if (promos[1]) then
		end
	
		openAppStoreURL(promoLinks[1])
		
		buttonsActive = true
		currentState = "select"
	
	elseif (scene == "iapChar" or scene == "restoreChar" or
				scene == "iapCharWeekly" or scene == "iapCharMonthly" or scene == "iapCharYearly") then
	
		
		if (showingSaleIAP == true) then
			
		else
		
		end
		
		
		buttonsActive = false
		charSoundTrasitioning = true
		transition.to( backButton, { time=700, alpha=0, transition=easing.outExpo } )
		
		Runtime:removeEventListener( "enterFrame", positionMenu )
		Runtime:removeEventListener( "onFTVKey", touchedMenu )
		Runtime:removeEventListener("touch",touchedMenu)
		Runtime:removeEventListener("key", touchedMenu)
		Runtime:removeEventListener( "axis", touchedMenuAxis )
		
		currentState = "select"
		
		
		if (scene == "iapChar") then
			buyIAP(version.unlockItems.All)
		elseif (scene == "iapCharWeekly") then
			buyIAP("weekly")
		elseif (scene == "iapCharMonthly") then
			buyIAP("monthly")
		elseif (scene == "iapCharYearly") then
			buyIAP("yearly")
		else
			buyIAP("restore")
		end
		
	elseif (scene == "rateChar") then
	
		savedData.rateInlineTouched = true
		save()
		
		transition.to( menuGroup[1+itemIndex], { time=700, alpha=1, transition=easing.outExpo } )
		
		transition.to( backButton, { time=700, alpha=0, transition=easing.outExpo } )
		
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
		
		
		local openURL =  promoKit.settings.links.rateThisAppURL
		print("opening link "..tostring(openURL))
		system.openURL( openURL )
	
	elseif (scene == "characterIAP") then
	
		
			currentState = "select"
		
			if (menuGroup[1+itemIndex].text) then
			end
		
			if (menuGroup[itemIndex]) then
				menuGroup[itemIndex].xScale, menuGroup[itemIndex].yScale = 1, 1
			 end
			 if (menuGroup[2+itemIndex]) then
				menuGroup[2+itemIndex].xScale, menuGroup[2+itemIndex].yScale = 1, 1
			 end
			 
			buttonsActive = false
			charSoundTrasitioning = true
			transition.to( backButton, { time=700, alpha=0, transition=easing.outExpo } )
			
			
			Runtime:removeEventListener( "enterFrame", positionMenu )
			Runtime:removeEventListener( "onFTVKey", touchedMenu )
			Runtime:removeEventListener("touch",touchedMenu)
			Runtime:removeEventListener("key", touchedMenu)
			Runtime:removeEventListener( "axis", touchedMenuAxis )
			
			buyIAP(version.unlockItems.All)
		
		
	elseif (scene == "upfrontIAP") then
	
		transition.to( upfrontGroup, { time=1100, alpha=0, transition=easing.outExpo } )
		transition.to( upfrontGroup, { time=1100, alpha=0, transition=easing.outExpo, onComplete = makeButtonsActive } )
		Runtime:removeEventListener( "enterFrame", upfrontScrollAnim)
		
	
		currentState = "UpfrontIAP"
	
		buyIAP(version.unlockItems.All)
		
	
	end

end


function closeUpfront()

	transition.to( upfrontGroup, { time=400, alpha=0, transition=easing.outExpo } )
	transition.to( upfrontScrollGroup, { time=400, alpha=0, transition=easing.outExpo } )
	Runtime:removeEventListener( "enterFrame", upfrontScrollAnim)

end

function openUpfront()

	currentState = "UpfrontMenu"
	
	transition.to( upfrontGroup, { time=1100, alpha=1, transition=easing.outExpo } )
	transition.to( upfrontScrollGroup, { time=1100, alpha=1, transition=easing.outExpo, onComplete = makeButtonsActive } )

	Runtime:addEventListener( "enterFrame", upfrontScrollAnim)
	
end

function upfrontScrollAnim()
	
	for i = 1, #scrollImagesUpfront do
		scrollImagesUpfront[i].x = scrollImagesUpfront[i].x - .5
		scrollImagesUpfront[i].maskX = scrollImagesUpfront[i].maskX + .5
		
		if (scrollImagesUpfront[i].x < (upfrontButton.x - (upfrontButton.width*0.5) - (scrollImagesUpfront[i].width*0.5) - 20) ) then
			if (i ~= 1) then
				local oldX = scrollImagesUpfront[i].x
				scrollImagesUpfront[i].x = scrollImagesUpfront[i-1].x + scrollImagesUpfront[i].width - 1
				local newX = scrollImagesUpfront[i].x
				scrollImagesUpfront[i].maskX = scrollImagesUpfront[i].maskX - (newX - oldX)
			else
				local oldX = scrollImagesUpfront[i].x
				scrollImagesUpfront[i].x = scrollImagesUpfront[#scrollImagesUpfront].x + scrollImagesUpfront[i].width - 1
				local newX = scrollImagesUpfront[i].x
				scrollImagesUpfront[i].maskX = scrollImagesUpfront[i].maskX - (newX - oldX)
			end
		end
	end
	
	if (iap_getProductPrice(version.unlockItems.All) ~= "" and bottomUpfrontTextPopup.text == "GET!") then
		
		if (version == 1) then
			bottomUpfrontTextPopup.text = iap_getProductPrice( "unlockshapes" )
		elseif (version == 6) then
			bottomUpfrontTextPopup.text = iap_getProductPrice( "unlockallcolors" )
		else
			bottomUpfrontTextPopup.text = iap_getProductPrice( version.unlockItems.All )
		end
		
	end
	
end

function loadScrollingUpfront(numImages, width, height, maskImage)

	upfrontMask = graphics.newMask( "Images/UI/upfrontMask.png" )

	scrollImagesUpfront = {}
	scollNumUpfront = 1

	for i = 0, numImages-1 do
		scrollImagesUpfront[#scrollImagesUpfront+1] = display.newImageRect("Images/UI/iapScreen" .. i+1 .. ".png", width, height )
		scrollImagesUpfront[#scrollImagesUpfront].x = halfW
		scrollImagesUpfront[#scrollImagesUpfront].y = halfH - 42
		upfrontScrollGroup:insert( scrollImagesUpfront[#scrollImagesUpfront] )
		
		scrollImagesUpfront[#scrollImagesUpfront]:setMask( upfrontMask )
		scrollImagesUpfront[#scrollImagesUpfront].maskX = 0
		scrollImagesUpfront[#scrollImagesUpfront].maskY = 0
		
		if (i ~= 0) then
			scrollImagesUpfront[#scrollImagesUpfront].x = (halfW - 71) + (width * i) - 1
			scrollImagesUpfront[#scrollImagesUpfront].maskX = scrollImagesUpfront[#scrollImagesUpfront].maskX - (width * i) + 71.9
		else
			scrollImagesUpfront[#scrollImagesUpfront].x = (halfW - 71) + (width * i)
			scrollImagesUpfront[#scrollImagesUpfront].maskX = scrollImagesUpfront[#scrollImagesUpfront].maskX - (width * i) + 70.9
		end
		
	end
	
	
end

function initUpfront()


	upfrontBG = display.newImageRect("Images/UI/iapMenuBG.png", 1000, 384 )
	upfrontBG.x = halfW
	upfrontBG.y = halfH
	upfrontBG:addEventListener("touch", buttonTouched)
	upfrontBG.name = "upfrontExit"
	upfrontGroup:insert( upfrontBG )
	
	
	upfrontBack = display.newImageRect("Images/UI/parentalGateBackground.png", 344, 312 )
	upfrontBack.x = halfW
	upfrontBack.y = halfH
	upfrontBack:setFillColor( 0 )
	upfrontBack:addEventListener("touch", buttonTouched)
	upfrontBack.name = "iapUnlockAll"
	upfrontBack.id = "window"
	upfrontGroup:insert( upfrontBack )
	
	
	upfrontButton = display.newImageRect("Images/UI/upfrontPriceButton.png", 304, 84 )
	upfrontButton.x = halfW
	upfrontButton.y = halfH + 56
	upfrontButton:setFillColor( 1, 0, 0 )
	upfrontGroup:insert( upfrontButton )
	
	
	upfrontTab = display.newImageRect("Images/UI/upfrontTab.png", 320, 56 )
	upfrontTab.x = halfW
	upfrontTab.y = halfH + 124
	upfrontTab:setFillColor( 1, 0, 0 )
	upfrontGroup:insert( upfrontTab )
	

	if (myData.isTV) then 
	else
		
		
		upfrontExitBack = display.newImageRect("Images/UI/parentalGateButton.png", 52, 52 )
		upfrontExitBack.xScale, upfrontExitBack.yScale = 0.75, 0.75
		upfrontExitBack.x = halfW + 160
		upfrontExitBack.y = halfH - 144
		upfrontExitBack:setFillColor( 255/255, 0/255, 0/255 )
		upfrontGroup:insert( upfrontExitBack )
	
		upfrontExit = display.newImageRect( "Images/UI/upfrontXButtonX.png", 20, 20 )
		upfrontExit.xScale, upfrontExit.yScale = 1,1 --2.2, 2.2
		upfrontExit.x = upfrontExitBack.x
		upfrontExit.y = upfrontExitBack.y - 1
		upfrontGroup:insert( upfrontExit )
	end
	
	
	bottomUpfrontTextPopup = display.newText( "GET", upfrontButton.x, upfrontButton.y+1.5, dynamicFont, 48 )
	upfrontGroup:insert( bottomUpfrontTextPopup )
	if (system.getInfo( "platformName" ) == "Android"  ) then
		bottomUpfrontTextPopup.y = upfrontButton.y - 105
	end
	bottomUpfrontTextPopup.text = iap_getProductPrice( version.unlockItems.All )
	
	if (bottomUpfrontTextPopup.text == "") then
		bottomUpfrontTextPopup.text = "GET!"
	end
	
	
	midUpfrontTextPopup = display.newText( "Unlock ALL games!", halfW, halfH + 124.5, dynamicFont, 25 )
	if (system.getInfo( "platformName" ) == "Android"  ) then
		midUpfrontTextPopup.y = halfH + 68.5
	end
	upfrontGroup:insert( midUpfrontTextPopup )
	
	
	topUpfontTextPopup = display.newText( "MORE FUN!", halfW, halfH - 117.5, dynamicFont, 43 )
	if (system.getInfo( "platformName" ) == "Android"  ) then
		topUpfontTextPopup.y = halfH - 215
	end
	upfrontGroup:insert( topUpfontTextPopup )
	
	
	loadScrollingUpfront( 6, 143*1.4, 81*1.4, "Images/UI/iapScreenMask.png" )
	
	
	upfrontGroup.alpha = 0
	upfrontScrollGroup.alpha = 0
	upfrontScrollGroup:toFront()

end

function destroyMenuButtons()
	if (leftButton) then
		leftButton:removeSelf()
		leftButton = nil
	end
	if (centerButton) then
		centerButton:removeSelf()
		centerButton = nil
	end
	if (rightButton) then
		rightButton:removeSelf()
		rightButton = nil
	end
end

function closeMenu()

	if variation == 4 and unlockedEverything == false and unlockedWeeklySub == false and unlockedMonthlySub == false and unlockedYearlySub == false then
	
		transition.to( iapCoinImage, { time=700, alpha=0, transition=easing.outExpo } )
		
		for i = #iapCardsLeft, 1, -1 do
			transition.to( iapCardsLeft[i], { time=700, alpha=0, transition=easing.outExpo } )
			transition.to( iapCardsRight[i], { time=700, alpha=0, transition=easing.outExpo } )
			
		end

	end
	
	transition.to( playArrow, { time=700, alpha=0, transition=easing.outExpo } )
	
	if (version.appStore == "Mac")  or version.appStore == "Windows" or version.appStore == "Chrome" then
		transition.to( exitGameBtn, { time=700, alpha=0, transition=easing.outExpo } )
	end
	
	Runtime:removeEventListener( "enterFrame", playArrowFloat)
	
end

function updateBottomMenuButtons()
	destroyMenuButtons()
	updateParentsButtons()
	transition.to( titleButtons, { time=700, alpha=1, x=0, transition=easing.outExpo, onComplete=makeButtonsActive } )
	
	if (myData.isTV and version.appStore ~= "Chrome") then
	else
		transition.to( backButton, { time=1100, alpha=1, transition=easing.outExpo} )
	end
end

function transitionBackBottomButtons()
	destroyMenuButtons()
	transition.to( titleButtons, { time=700, alpha=1, x=0, transition=easing.outExpo } )
end

function fadeInMessage(text, delay)
		message.text = text
		message.anchorX = 0.5
		message.x = halfW
		transition.to( message, { time=700, alpha=1, transition=easing.outExpo } )
		if delay then
			fadeMessageTimer = timer.performWithDelay( 2000, fadeOutMessage, 1 )
		end
end

function fadeInUnlockMessage(text, delay)
	if lockMessage.alpha ~= 1 then
		unlockMessage:toFront()
		unlockBar:toFront()
		transition.to( unlockMessage, { time=700, alpha=1, transition=easing.outExpo } )
		transition.to( unlockBar, { time=700, alpha=1, transition=easing.outExpo } )
		barTrans = transition.to( unlockBar, { time=3000, xScale=18.75 } )
	end
end

function fadeOutMessage()
	transition.to( message, { time=700, alpha=0, transition=easing.outExpo } )
end

function fadeOutUnlockMessage()
	if (barTrans) then
		transition.cancel( barTrans )
		barTrans = nil
	end
	holdMessageTrans = transition.to( unlockMessage, { time=700, alpha=0, transition=easing.outExpo } )
	holdImageTrans = transition.to( unlockBar, { time=700, xScale=.1, alpha=0, transition=easing.outExpo } )
end

function unlockScreen()
	
	
	if savedData.enableIAP then
	
	
           if iap_MenuOpen == false then 
                    iap_MenuOpen = false
                    buttonsActive = false 
					
                     fadeOutMessage()
                    
					
                    transition.to( forParentsButton, { time=700, alpha=0, x=display.contentWidth + 400, transition=easing.outExpo, onComplete=completeUnlockScreenOpen } )
                    transition.to( playLogoButton, { time=700, alpha=0, transition=easing.outExpo} )
                    transition.to( parentsMenuGroup, { time=700, alpha=0, x=display.contentWidth + 200, transition=easing.outExpo } ) 
                    transition.to( backButton, { time=700, alpha=0, transition=easing.outExpo } )
                    slideOutPromo()		
					
					
                    updateIAPMenu()
					
					
          end
	else
		fadeInMessage("purchases disabled", true)
	end
end

function completeUnlockScreenOpen()
    iap_MenuOpen = true
end

function menuToggleTouched(event)
	local thisButton = event.target
	if event.phase == "began" then
	
		if savedData.enableSounds == true then
			playReservedChannel(clickSound, 8, 0) --channel shared with applause sound
		end
		
		
		if thisButton.name == "soundOn" then
				savedData.enableSounds = false
				thisButton.alpha = 0
				soundOffButton.alpha = 1
				
				
		elseif thisButton.name == "soundOff" then
				savedData.enableSounds = true
				thisButton.alpha = 0
				soundOnButton.alpha = 1
				
				
		elseif thisButton.name == "musicOn" then
				savedData.enableMusic = false
				audio.setVolume( 0, { channel=1 })
				audio.setVolume( 0, { channel=2 })
				thisButton.alpha = 0
				musicOffButton.alpha = 1
				
				
		elseif thisButton.name == "musicOff" then
				savedData.enableMusic = true
				audio.setVolume( 1, { channel=1 } )
				audio.setVolume( 1, { channel=2 } )
				thisButton.alpha = 0
				musicOnButton.alpha = 1
				
				
		elseif thisButton.name == "promoOn" then
				savedData.enablePromo = false
				thisButton.alpha = 0
				promoOffButton.alpha = 1
				
				
				local function resetSelectScreen()
					menu.unload()
					menu.reset()
					loadScrollMenu()
				end
				timer.performWithDelay( 100, resetSelectScreen )
		elseif thisButton.name == "promoOff" then
				savedData.enablePromo = true
				thisButton.alpha = 0
				promoOnButton.alpha = 1
				
				
				local function resetSelectScreen()
					menu.unload()
					menu.reset()
					loadScrollMenu()
				end
				timer.performWithDelay( 100, resetSelectScreen )
		elseif thisButton.name == "iapOn" then
				print("insert turn iap off code")
				transition.to( leftButton, { time=700, alpha=.5, transition=easing.outExpo } )
				transition.to( centerButton, { time=700, alpha=.5, transition=easing.outExpo } )
				transition.to( rightButton, { time=700, alpha=.5, transition=easing.outExpo } )				
				savedData.enableIAP = false
				thisButton.alpha = 0
				iapOffButton.alpha = 1
				
				
		elseif thisButton.name == "iapOff" then
				print("insert turn iap on code")
				transition.to( leftButton, { time=700, alpha=1, transition=easing.outExpo } )
				transition.to( centerButton, { time=700, alpha=1, transition=easing.outExpo } )
				transition.to( rightButton, { time=700, alpha=1, transition=easing.outExpo } )				
				savedData.enableIAP = true
				thisButton.alpha = 0
				iapOnButton.alpha = 1
				
				
		end
	end
        save()
end

function skipToLevel( skipToLevel )

		
	print("skip level")
	print(skipToLevel)
	print(repeatedCharStart)

	if (skipToLevel >= repeatedCharStart) then
		playingRandomGame = true
		
		subFromRepeatLevels = 0
		
		
		randomLevelChallenge = savedData[skipToLevel+1-subFromRepeatLevels .. "randomLevelSelect"]
		randomLevelChallenge = tostring(randomLevelChallenge)
		level = randomLevelDetails["random" .. randomLevelChallenge].character
		
		charLevel = skipToLevel-1
		
	else
		playingRandomGame = false
		
		level = skipToLevel
	end
	
	currentLevel = skipToLevel


	levelOptions = gameDetails["level" .. level]
	gameOptions = levelOptions["game" ..curGame]
	
	local gameMode
	if (gameOptions.gameType == "matching") then
		gameMode = gameOptions.mode
	end
	if (gameType == "matching") then
		if (gameMode == "showMe") then
			gameplayMode = 1
		else
			gameplayMode = 2
		end
	elseif (gameType == "equation") then
		gameplayMode = 3
	end
	
	
	currentState = "game"
	buttonsActive = false
	
	bgWhite:toFront()
	transition.to( bgWhite, { time=700, alpha = 1, transition=easing.outExpo, onComplete=gameStartAnim1  } )
	
	audio.fade( { channel=1 , time=1000 , volume=0  } )
	
	
	endOfGame = false
	endZZZ = false
	closeEyes = false
	
	if (endGameTimer) then
		timer.cancel( endGameTimer )
		endGameTimer = nil
	end
	if (endGameTransition) then
		transition.cancel( endGameTransition )
		endGameTransition = nil
	end

end


function promoTouched(event)
	math.randomseed( os.time() ) 
end

function updatePromoOld()
	
	if (version.appStore=="Google Play") then
	
		
		promos = {"more.png"}
		promoLinks = {settingsLua.eggrollURL}
	elseif (version.appStore=="Amazon") then
		
		promos = {"animal1st.png"}
		promoLinks = {settingsLua.aFirstGradeMathURL }
	elseif (version.appStore=="Samsung") then
		promos = {"more.png"}
		promoLinks = {settingsLua.eggrollURL}
	else
		
		promos = {"animal1st.png"}
		promoLinks = {settingsLua.firstGradeMathURL }
	end
	
	
	math.randomseed( os.time() ) 
	randomPromo = math.random(1,#promos)
	promo = display.newImageRect("Images/Promo/"..promos[randomPromo], 73, 132)
	
	promo.x = screenOriginX + 38
	promoY = screenOriginY + 29
	
	promo.y = -100
	promo.alpha = 0
	promo.name = "more"
	promo:addEventListener("touch", buttonTouched)
end

function updatePromo()

	if (promoEnabled == true) then

		if (version.appStore=="Google Play") then
			promos = {"animal1st"}
			promoLinks = {settingsLua.gFirstGradeMathURL}
		elseif (version.appStore=="Amazon") then
			promos = {"animal1st"}
			promoLinks = {settingsLua.aFirstGradeMathURL }
		elseif (version.appStore=="Samsung") then
		else
			promos = {"animal1st"}
			promoLinks = {settingsLua.firstGradeMathURL }
		end

			local selectedPromo = promoKit:selectWeightedOption(promoKit.settings.mainmenuPromo)
			 
			
			promoLink = selectedPromo.promoURL
			promoTrackingID = selectedPromo.trackingID
			
			 promo = promoKit:getImage(selectedPromo.fileName,selectedPromo.path,selectedPromo.width,selectedPromo.height)
		promo.x = screenOriginX + safeScreenDistX + selectedPromo.x
		promoY = screenOriginY + topInset + selectedPromo.y
		
		promo.y = -100
		promo.alpha = 0
		promo.name = "promo"
		promo:addEventListener("touch", buttonTouched)
		
	end
	
end

function slideInPromo()
	if savedData.enablePromo and promoEnabled == true then
		transition.to( promo, { time=700, alpha=1, y=promoY, transition=easing.outExpo } )
	end
end

function slideOutPromo()
	if (promoEnabled == true) then
		transition.to( promo, { time=700, alpha=0, y=-100, transition=easing.outExpo } )
	end
end

function titleAnimation2()
	print("TITLEANIMATION2")
	
	
	if (myData.isTV) then
	else
		slideInPromo()
		
		if (version.appStore ~= "Chrome") then
			transition.to( forParentsButton, { time=700, alpha=1, x=forParentsButtonX, transition=easing.outExpo} )
		end
	end
	
	if (needsToShowRatePopup == false and savedData.appOpenNum % showIAPOnStart == 0 and variation == 4 and unlockedEverything == false and unlockedWeeklySub == false and unlockedMonthlySub == false 
			and unlockedYearlySub == false and appStart == true and myData.isTV == false and promoEnabled == true and version.defaultVersion == -1) then --remove version.defaultVersion == -1 to use upfront again
		
		initUpfront()
		
		local function openStartIAPMenu()
		
			playingTitleStart = false
		
			openUpfront()
			upfrontGroup:toFront()
			upfrontScrollGroup:toFront()
		end
		timer.performWithDelay( 500, openStartIAPMenu )
		
	else
	
		titleButtons:toFront()
		
		if (titleBackButton) then
			transition.to( titleBackButton, { time=400, alpha=1, transition=easing.outExpo } )
		end
		transition.to( titleButtons, { time=700, alpha=1, x=0, transition=easing.outExpo } )
		transition.to( playLogoButton, { time=700, alpha=1, transition=easing.outExpo } )
		transition.to( playArrow, { time=700, alpha=1, transition=easing.outExpo } )
		
		if (version.appStore == "Mac")  or version.appStore == "Windows" or version.appStore == "Chrome" then
			transition.to( exitGameBtn, { time=700, alpha=1, transition=easing.outExpo } )
		end
		
		local function titleCharAnimation()
			
			startCharAnim(halfW)
		end
		timer.performWithDelay( 300, titleCharAnimation)
		
		Runtime:addEventListener( "enterFrame", playArrowFloat)
		
		
		local function playTitleSound()
		
			playingTitleStart = false
		
			if (system.getInfo ("model") == "Apple TV") then
				system.activate("controllerUserInteraction")
			end
		
				makeButtonsActive()
			
			if (needsToShowRatePopup == true) then
				playReservedChannel(keepItUpYouAreDoingGreatTitleSound, 7, 0)
			elseif savedData.enableSounds == true and titleCanPlay == true then
				playReservedChannel(numMemoryMatchSound, 7, 0)
				titleCanPlay = false
			elseif (savedData.enableSounds == true and playIAPThankYouVO and playIAPThankYouVO == true) then
				playReservedChannel(thankyouVOSound, 7, 0)
				playIAPThankYouVO = false
			elseif (savedData.enableSounds == true) then
				playReservedChannel(hiSound, 7, 0)
			end
		end
		
		timer.performWithDelay( 600, playTitleSound)
		
		
		local function showTitleRatePopup()
		
			needsToShowRatePopup = false
			
			endOfGame = false
			
			makeButtonsActive()
			
			print("show rate popup")
			if (reviewPopUp ~= nil) then
				reviewPopUp.show()
			end
			
		
		end
		
		if (needsToShowRatePopup == true) then
		end
	
	end
	
	appStart = false
	
	
end

function playArrowFloat( event )

	playArrow.frame = playArrow.frame + 1
	playArrow.x = playArrow.initX + floatRangeArrow * math.sin(playArrow.frame/30)

end

function title()


	if (playingTitleStart == false and titleButtons.alpha ~= 1) then
	

		playingTitleStart = true


		goingToTitle = true

		print("scene skip")
		print(sceneSkip)
		if (sceneSkip == 0) then

			if variation == 5 then
			end
			

			timer.performWithDelay( 900, titleAnimation2 )
		
		else
		
			bgCloudsOneGroup.alpha = 0
			bgCloudsTwoGroup.alpha = 0
		
			skipToLevel( sceneSkip )
		
		
		end
	
	end
	
end

function goToTitle()
	title()
end
	
function updateParentsButtons()
end

function iapCardFloat( event )

	for i = #iapCardsLeft, 2, -2 do
	
		iapCardsLeft[i].frame = iapCardsLeft[i].frame + 1
		iapCardsLeft[i].y = iapCardsLeft[i].initY + floatRange * math.sin(iapCardsLeft[i].frame/30)
		iapCardsLeft[i].rotation = iapCardsLeft[i].rotation + rotationRange * math.cos(iapCardsLeft[i].frame/rotationRate)
		iapCardsLeft[i].x = iapCardsLeft[i].x + .5
		
		if (iapCardsLeft[i].x == halfW) then
			iapCardsLeft[i].x = halfW - (#iapCardsLeft*60)
		end
		
		iapCardsRight[i].frame = iapCardsRight[i].frame + 1
		iapCardsRight[i].y = iapCardsRight[i].initY - floatRange * math.sin(iapCardsRight[i].frame/30)
		iapCardsRight[i].rotation = iapCardsRight[i].rotation - rotationRange * math.cos(iapCardsRight[i].frame/rotationRate)
		iapCardsRight[i].x = iapCardsRight[i].x - .5
		
		if (iapCardsRight[i].x == halfW) then
			iapCardsRight[i].x = halfW + (#iapCardsLeft*60)
		end
	end
	
	for i = #iapCardsLeft-1, 1, -2 do
	
		iapCardsLeft[i].frame = iapCardsLeft[i].frame + 1
		iapCardsLeft[i].y = iapCardsLeft[i].initY- floatRange * math.sin(iapCardsLeft[i].frame/30)
		iapCardsLeft[i].rotation = iapCardsLeft[i].rotation - rotationRange * math.cos(iapCardsLeft[i].frame/rotationRate)
		iapCardsLeft[i].x = iapCardsLeft[i].x + .5
		
		if (iapCardsLeft[i].x == halfW) then
			iapCardsLeft[i].x = halfW - (#iapCardsLeft*60)
		end
		
		iapCardsRight[i].frame = iapCardsRight[i].frame + 1
		iapCardsRight[i].y = iapCardsRight[i].initY + floatRange * math.sin(iapCardsRight[i].frame/30)
		iapCardsRight[i].rotation = iapCardsRight[i].rotation + rotationRange * math.cos(iapCardsRight[i].frame/rotationRate)
		iapCardsRight[i].x = iapCardsRight[i].x - .5
		
		if (iapCardsRight[i].x == halfW) then
			iapCardsRight[i].x = halfW + (#iapCardsLeft*60)
		end
	end

end

function iapMenuAnimation()


	if variation == 4 and unlockedEverything == false and unlockedWeeklySub == false and unlockedMonthlySub == false and unlockedYearlySub == false then
	
		transition.to( iapCoinImage, { time=700, alpha=1, transition=easing.outExpo } )
		
		for i = #iapCardsLeft, 1, -1 do
		
			for i = #iapCardsLeft, 1, -1 do
				transition.to( iapCardsLeft[i], { time=700, alpha=1, transition=easing.outExpo } )
				transition.to( iapCardsRight[i], { time=700, alpha=1, transition=easing.outExpo } )
			end
			
		end
		
		iapCoinImage:toFront()
		
		if (currentState ~= "title" and currentState ~= "parentsMenu") then
			Runtime:addEventListener( "enterFrame", iapCardFloat)
		end
	
	end

end

function iapLoadMenuAnimation()


		cardNumber = 1
		
		
		for i = 1, #iapCardsLeftTable do
			iapCardsLeft[#iapCardsLeft+1] = display.newImageRect("Images/" .. iapCardsLeftTable[cardNumber], 158*0.30, 198*0.30 )
			iapCardsLeft[#iapCardsLeft].x = halfW - (i*60)
			
			if (screenH > 341) then
				iapCardsLeft[#iapCardsLeft].y = display.contentHeight/1.18
				iapCardsLeft[#iapCardsLeft].initY = display.contentHeight/1.18
			else
				iapCardsLeft[#iapCardsLeft].y = display.contentHeight/1.2
				iapCardsLeft[#iapCardsLeft].initY = display.contentHeight/1.2
			end
			iapCardsLeft[#iapCardsLeft].frame = 0
			iapCardsLeft[#iapCardsLeft].alpha = 0
			
			iapCardsRight[#iapCardsRight+1] = display.newImageRect("Images/" .. iapCardsRightTable[cardNumber], 158*0.30, 198*0.30 )
			iapCardsRight[#iapCardsRight].x = halfW + (i*60)
			
			if (screenH > 341) then
				iapCardsRight[#iapCardsRight].y = display.contentHeight/1.18
				iapCardsRight[#iapCardsRight].initY = display.contentHeight/1.18
			else
				iapCardsRight[#iapCardsRight].y = display.contentHeight/1.2
				iapCardsRight[#iapCardsRight].initY = display.contentHeight/1.2
			end
			iapCardsRight[#iapCardsRight].frame = 0
			iapCardsRight[#iapCardsRight].alpha = 0
			
			if (cardNumber < #iapCardsLeftTable) then
				cardNumber = cardNumber + 1
			else
				cardNumber = 1
			end
			
			if (iapCoinImage) then
				iapCoinImage:toFront()
			end
			
		end
	

end


function checkIfSale()

	
	local t = os.date( '*t' )  -- get table of current date and time
	currentDateTime = t
	
	if (savedData.saleLastShown) then
	else
		savedData.saleLastShown = t
	end
	if (savedData.saleFirstShown) then
	else
		savedData.saleFirstShown = false
	end
	if (savedData.isSale) then
	else
		savedData.isSale = false
	end
	
	local lastYear = savedData.saleLastShown.year
	local lastMonth = savedData.saleLastShown.month
	local lastDay = savedData.saleLastShown.day
	
	local currentYear = t.year
	local currentMonth = t.month
	local currentDay = t.day
	
	local currentHours = (os.time( currentDateTime ) / 60) / 60
	local lastHours = (os.time( savedData.saleLastShown ) / 60) / 60
	
	if (lastYear == currentYear and lastMonth == currentMonth and lastDay == currentDay) then
	else
		savedData.isSale = false
	end
	
	
	local hourDifference = math.floor(currentHours - lastHours)
	
	
	if (savedData.isSale == true) then
		showingSaleIAP = true
	else
		if (savedData.saleFirstShown == false) then
			if (promoKit.settings and promoKit.settings["saleSchedule"] and hourDifference >= promoKit.settings["saleSchedule"]["hoursToFirstShow"]) then
				savedData.saleFirstShown = true
				savedData.isSale = true
				savedData.saleLastShown = t
				showingSaleIAP = true
			end
		else
			if (promoKit.settings and promoKit.settings["saleSchedule"] and hourDifference >= promoKit.settings["saleSchedule"]["hoursAfterLastShow"]) then
				savedData.saleFirstShown = true
				savedData.isSale = true
				savedData.saleLastShown = t
				showingSaleIAP = true
			end
		end
	end
	save()
	
		showingSaleIAP = true

end


function updateParentsMenu()
	
	
	if (version.bundleID == "com.eggrollgames.animalmathkindergartenfreetime") then
		optionsTextNoIAPPromo.isVisible = true
		optionsText.isVisible = false
		optionsTextNoIAP.isVisible = false
		iapOffButton.alpha = 0
		iapOnButton.alpha = 0
		promoOffButton.alpha = 0
		promoOnButton.alpha = 0
	 elseif variation == 5 or unlockedEverything == true or unlockedWeeklySub == true or unlockedMonthlySub == true or unlockedYearlySub == true then
		optionsTextNoIAP.isVisible = true
		optionsText.isVisible = false
		optionsTextNoIAPPromo.isVisible = false
		iapOffButton.alpha = 0
		iapOnButton.alpha = 0
	else
		optionsTextNoIAP.isVisible = false
		optionsText.isVisible = true
		optionsTextNoIAPPromo.isVisible = false
	end
	
	
	if (iapButtonText) then
		iapButtonText.alpha = 0
	end
	
	stripes.height = 108
	
	if (version.bundleID == "com.eggrollgames.animalmathkindergartenfreetime") then
		stripes.height = 90
		musicOnButton.y = stripes.y - 16
	else
		stripes.height = 108
		musicOnButton.y = stripes.y - 32
	end
	musicOffButton.y = musicOnButton.y
	
	soundOnButton.y = musicOnButton.y + parentsSpacing
	soundOffButton.y = soundOnButton.y
	
	promoOnButton.y = soundOnButton.y + parentsSpacing
	promoOffButton.y = promoOnButton.y
	
	if (unlockButton) then
		unlockButton.alpha = 0
	end
	if (restoreButton) then
		restoreButton.alpha = 0
	end
	
	if (version.appStore~="Samsung") then
		if (rateAppButton) then
			rateAppButton.x = halfW
			rateAppButton.y = promoOnButton.y + 75
		end
	end
	
end

function loadMenu()


	titleGroup = display.newGroup()
	
	dustGroupBack:toFront()
	titleGroupBack = display.newGroup()
	
	dustGroupFront:toFront()
	titleGroupFront = display.newGroup()
	
	
	titleBG = display.newImageRect("Images/UI/cityTitleBGWide.png", 1000, 303 ) --832, 162
	titleBG.anchorX=0.5
    titleBG.anchorY = 1
	titleBG.x = halfW
	titleBG.y = 234+(titleBG.height/2)
	titleBG.alpha = 0
	titleGroup:insert( titleBG )
	
	
	titleCarsBack = {}
	titleCarsFront = {}
	
	titleCarSpeedMin = 3500
	titleCarSpeedMax = 4000
	titleCarFrame = 0
	
	titleAddCarMin = 1370-- How frequent cars are added --was 1000
	titleAddCarMax = 2000 --was 3000
	
	randomizeTable( titleVehicles )
	titleCurrentVehicle = 1
	
	
	print("load menu")
	
	local function startCarsTimer()
		if (titleAddCarsTimer) then
			timer.cancel( titleAddCarsTimer )
			titleAddCarsTimer = nil
		end
		titleAddCarsTimer = timer.performWithDelay( math.random( titleAddCarMin, titleAddCarMax ), titleAddCars, -1 )
	end
	timer.performWithDelay( 4000, startCarsTimer )
	
	
	clickSound = "Audio/click.mp3"
	
	
	if (system.getInfo ("model") == "Apple TV") then
	
		titleBackButton = display.newImageRect("Images/UI/appleTVExitButton.png", 52, 20 )
	
		titleBackButton:setFillColor(255/255,255/255,255/255)
		
		
		titleBackButton.x = screenOriginX + safeScreenDistX + 10
		titleBackButton.y = safeScreenOriginY + 1
		
		titleBackButton.alpha = 0
	
	end
	
	
	if (myData.isTV) then 
		if (system.getInfo ("model") == "Apple TV") then
			backButton = display.newImageRect("Images/UI/appleTVBackButton.png", 90, 20 )
		else
			backButton = display.newImageRect("Images/UI/fireTVBackButton.png", 90, 20 )
		end
	else
		backButton = display.newImageRect("Images/UI/backButton.png", 64, 64 )
	end
	
	backButton:setFillColor(255/255,254/255,240/255)
	
	backButton.x = screenOriginX + safeScreenDistX + 24
	
	if (oniPhoneX == true) then
		backButton.y = safeScreenOriginY + 12
	else
		backButton.y = safeScreenOriginY + 1
	end
	
	
	backButton.name = "back"
	backButton.alpha = 0
	backButton:addEventListener("touch", buttonTouched)
	
	
	if (myData.isTV) then 
		instructionsReplayButton = display.newImageRect("Images/UI/fireTVRepeatButton.png", 80, 20 )
	else
		instructionsReplayButton = display.newImageRect("Images/UI/replayInstructionsButton.png", 64, 64 )
		instructionsReplayButton:setFillColor(246/255,134/255,43/255)
	end
	
	instructionsReplayButton.x = screenEdgeX - safeScreenDistX - 24
	
	if (oniPhoneX == true) then
		instructionsReplayButton.y = safeScreenOriginY + 12
	else
		instructionsReplayButton.y = safeScreenOriginY + 1
	end
	
	
	instructionsReplayButton.name = "back"
	instructionsReplayButton.alpha = 0
	
	
	titleButtons:toFront()
	titleButtons.x = -800
	titleButtons.alpha = 0
	
	forParentsButton = display.newImageRect("Images/UI/forParentsButton.png", 115, 75 )
	forParentsButton:setFillColor(255/255,254/255,240/255)
	
	
	forParentsButtonX = screenEdgeX - safeScreenDistX - 65
	forParentsButton.y = safeScreenOriginY + 24
	
	forParentsButton.x = display.contentWidth + 400
	
	forParentsButton.alpha = 0
	forParentsButton.name = "openParentsMenu"
	forParentsButton:addEventListener("touch", buttonTouched)
	
	stripes = display.newImageRect("Images/UI/stripesWide.png", 1000, 136 )
	stripes.x = center
	stripes.y = halfH - 25
	stripes.alpha = 0
	
	
        optionsText = display.newImageRect("Images/UI/optionsText.png", 199, 119 )	
	optionsText.x = halfW - 65
	optionsText.y = stripes.y
        
	optionsTextNoIAP = display.newImageRect("Images/UI/optionsNoIAPText.png", 199, 119 )	
	optionsTextNoIAP.x = optionsText.x
	optionsTextNoIAP.y = stripes.y + 18
	
	optionsTextNoIAPPromo = display.newImageRect("Images/UI/optionsNoIAPPromoText.png", 198, 107 )	
	optionsTextNoIAPPromo.x = optionsText.x
	optionsTextNoIAPPromo.y = stripes.y + 30
	if (version.bundleID == "com.eggrollgames.animalmathkindergartenfreetime") then
		optionsTextNoIAPPromo.isVisible = true
		optionsText.isVisible = false
		optionsTextNoIAP.isVisible = false
	 elseif variation == 5 or unlockedEverything == true or unlockedWeeklySub == true or unlockedMonthlySub == true or unlockedYearlySub == true then
		optionsTextNoIAP.isVisible = true
		optionsText.isVisible = false
		optionsTextNoIAPPromo.isVisible = false
	else
		optionsTextNoIAP.isVisible = false
		optionsText.isVisible = true
		optionsTextNoIAPPromo.isVisible = false
	end
	
	
	parentsSpacing = 32
	
	musicOnButton = display.newImageRect("Images/UI/onButton.png", 77, 27 )
	musicOnButton.x = halfW + 130
	musicOnButton.y = stripes.y - 48
	musicOnButton.name = "musicOn"
        if savedData.enableMusic then
            musicOnButton.alpha = 1
        else
            musicOnButton.alpha = 0
        end 
	musicOnButton:addEventListener("touch", menuToggleTouched)
	
	musicOffButton = display.newImageRect("Images/UI/offButton.png", 77, 27 )
	musicOffButton.x = musicOnButton.x
	musicOffButton.y = musicOnButton.y
	musicOffButton.name = "musicOff"	
        if savedData.enableMusic then
            musicOffButton.alpha = 0
        else
            musicOffButton.alpha = 1
        end 
	musicOffButton:addEventListener("touch", menuToggleTouched)
	
	soundOnButton = display.newImageRect("Images/UI/onButton.png", 77, 27 )
	soundOnButton.x = musicOnButton.x
	soundOnButton.y = musicOnButton.y + parentsSpacing
	soundOnButton.name = "soundOn"
        if savedData.enableSounds then
            soundOnButton.alpha = 1
        else
            soundOnButton.alpha = 0
        end
	soundOnButton:addEventListener("touch", menuToggleTouched)
	
	soundOffButton = display.newImageRect("Images/UI/offButton.png", 77, 27 )
	soundOffButton.x = musicOnButton.x
	soundOffButton.y = soundOnButton.y
	soundOffButton.name = "soundOff"
	if savedData.enableSounds then
            soundOffButton.alpha = 0
        else
            soundOffButton.alpha = 1
        end
	soundOffButton:addEventListener("touch", menuToggleTouched)
	
	promoOnButton = display.newImageRect("Images/UI/onButton.png", 77, 27 )
	promoOnButton.x = musicOnButton.x
	promoOnButton.y = soundOnButton.y + parentsSpacing
	promoOnButton.name = "promoOn"
        if savedData.enablePromo then 
            promoOnButton.alpha = 1
        else
            promoOnButton.alpha = 0
        end
	promoOnButton:addEventListener("touch", menuToggleTouched)
	
	promoOffButton = display.newImageRect("Images/UI/offButton.png", 77, 27 )
	promoOffButton.x = musicOnButton.x
	promoOffButton.y = promoOnButton.y
	promoOffButton.name = "promoOff"
	if savedData.enablePromo then 
            promoOffButton.alpha = 0
        else
            promoOffButton.alpha = 1
        end
	promoOffButton:addEventListener("touch", menuToggleTouched)
	
	iapOnButton = display.newImageRect("Images/UI/onButton.png", 77, 27 )
	iapOnButton.x = musicOnButton.x
	iapOnButton.y = promoOnButton.y + parentsSpacing
	iapOnButton.name = "iapOn"
        if savedData.enableIAP then
            iapOnButton.alpha = 1
        else
            iapOnButton.alpha = 0
        end
	iapOnButton:addEventListener("touch", menuToggleTouched)
	
	iapOffButton = display.newImageRect("Images/UI/offButton.png", 77, 27 )
	iapOffButton.x = musicOnButton.x
	iapOffButton.y = iapOnButton.y
	iapOffButton.name = "iapOff"
	if savedData.enableIAP then
            iapOffButton.alpha = 0
        else
            iapOffButton.alpha = 1
        end
	iapOffButton:addEventListener("touch", menuToggleTouched)
	
	if variation == 5 or unlockedEverything == true or unlockedWeeklySub == true or unlockedMonthlySub == true or unlockedYearlySub == true then
		iapOnButton.alpha = 0
		iapOffButton.alpha = 0
	end
	
	thankYouImage = display.newImageRect("Images/UI/thankYou.png", 400, 32 )
	thankYouImage.x = halfW
	thankYouImage.y = musicOffButton.y - 44
	
	
	if (system.getInfo( "platformName" ) == "Android"  ) then
		dynamicFont = "BigSky_1"
	else
		dynamicFont = "Big Sky"
	end
	
	if (promoEnabled == true) then
		
		privacyPolicyButton = display.newImageRect("Images/UI/privacyPolicy.png", 188, 44 )
		privacyPolicyButton.x = halfW
		privacyPolicyButton.y = iapOffButton.y + 125
		privacyPolicyButton.name = "privacyPolicy"
		privacyPolicyButton:addEventListener("touch", buttonTouched)
		
		unlockButton = display.newImageRect("Images/UI/unlockGamesButton.png", 108, 60 )
		unlockButton.x = halfW - 125
		unlockButton.y = iapOffButton.y + 65
		unlockButton.name = "iapUnlockAll"
		unlockButton:addEventListener("touch", buttonTouched)
		
		restoreButton = display.newImageRect("Images/UI/restoreButton.png", 108, 60 )
		restoreButton.x = halfW
		restoreButton.y = iapOffButton.y + 65
		restoreButton.name = "restore"
		restoreButton:addEventListener("touch", buttonTouched)
		
		if (version.appStore~="Samsung") then
			rateAppButton = display.newImageRect("Images/UI/rateButton.png", 108, 60 )
			rateAppButton.x = halfW + 125
			rateAppButton.y = iapOffButton.y + 65
			rateAppButton.name = "rateApp"
			rateAppButton:addEventListener("touch", buttonTouched)
		end
		
		
		iapButtonText = display.newText( "$2.99", unlockButton.x, unlockButton.y, dynamicFont, 35 )
		iapButtonText:setFillColor(255/255,255/255,255/255)
		
		if (version.unlockItems.All) then
			iapButtonText.text = iap_getProductPrice(version.unlockItems.All)
		end
		iapButtonText.anchorX = 0.5
		iapButtonText.anchorY = 0.5
		
		if (iapButtonText.text == "") then
			iapButtonText.text = "GET!"
		end
		
		iapButtonText.x = unlockButton.x
		iapButtonText.y = unlockButton.y + 10
		
		if (iapButtonText.text == "") then
			iapButtonText.text = "GET!"
		end
		
		if ( system.getInfo( "platformName" ) == "Android" ) then
			iapButtonText.y = unlockButton.y - 69
		end
		
	end
	
	parentsMenuGroup:insert(thankYouImage)
	parentsMenuGroup:insert(optionsText)
    parentsMenuGroup:insert(optionsTextNoIAP)
	parentsMenuGroup:insert(optionsTextNoIAPPromo)
	parentsMenuGroup:insert(musicOnButton)
	parentsMenuGroup:insert(musicOffButton)
	parentsMenuGroup:insert(soundOnButton)
	parentsMenuGroup:insert(soundOffButton)
	parentsMenuGroup:insert(promoOnButton)
	parentsMenuGroup:insert(promoOffButton)
	parentsMenuGroup:insert(iapOnButton)
	parentsMenuGroup:insert(iapOffButton)
	
	if (unlockButton) then
		parentsMenuGroup:insert(unlockButton)
	end
	if (restoreButton) then
		parentsMenuGroup:insert(restoreButton)
	end
	if (rateAppButton) then
		parentsMenuGroup:insert(rateAppButton)
	end
	if (privacyPolicyButton) then
		parentsMenuGroup:insert(privacyPolicyButton)
	end
	if (iapButtonText) then
		parentsMenuGroup:insert(iapButtonText)
	end
	
	if (version.bundleID == "com.eggrollgames.animalmathkindergartenfreetime") then
		promoOnButton.alpha = 0
		promoOffButton.alpha = 0
	end
	
	parentsMenuGroup.x =  display.contentWidth + 200
	parentsMenuGroup:toFront()
	parentsMenuGroup.alpha = 0
	
	playLogoButton = display.newImageRect("Images/UI/playButtonColorLogo.png", 700, 300)--381, 119 )
	playLogoButton.x = center - 6
	playLogoButton.y = display.contentHeight/1.45
	playLogoButton.name = "play"
	playLogoButton:setFillColor(255/255,254/255,240/255)
	
	
	if (myData.isFireTV) then
		Runtime:addEventListener( "onFTVKey", buttonTouched )
	elseif (myData.isController) then
		Runtime:addEventListener( "key", buttonTouched )
	end
	playLogoButton:addEventListener("touch", buttonTouched)
	playLogoButton.alpha = 0
	
	playArrow = display.newImageRect("Images/UI/playArrow.png", 56, 56)
	playArrow.x = screenEdgeX - rightInset - 60
	playArrow.y = display.contentHeight/2.0
	playArrow.alpha = 0
	playArrow.initX = playArrow.x
	playArrow.frame = 0
	playArrow.name = "play"
	playArrow:addEventListener("touch", buttonTouched)
	
	unlockMessage = display.newImageRect("Images/UI/threeSecondMessage.png", 188, 15)--381, 119 )
	unlockMessage.x = halfW
	unlockMessage.y = screenOriginY + 15
	unlockMessage.alpha = 0
	unlockMessage:setFillColor(64/255,64/255,64/255)
	
	unlockBar = display.newRect(-10,0,10,2)
	unlockBar:setFillColor(255/255)
	unlockBar.x = halfW
	unlockBar.y = screenOriginY + 21.5
	unlockBar.xScale = .1
	unlockBar.alpha = 0
	
	exitGameBtn = display.newImageRect("Images/UI/iapMenuExitButton2.png", 28, 28 )
	exitGameBtn.x = screenEdgeX - 20 
	exitGameBtn.y = screenOriginY + 20 
	exitGameBtn.alpha = 0
	exitGameBtn.name = "exitGame"
	exitGameBtn:addEventListener("touch", buttonTouched)
	
	if (variation == 5 or unlockedEverything == true or unlockedWeeklySub == true or unlockedMonthlySub == true or unlockedYearlySub == true) then
		updateParentsMenu()
	end
	
	
	initParentalGate()
	
	
end
