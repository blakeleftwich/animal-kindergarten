--If You Ask Me v1.0
--Copyright 2013 Eggroll Games
--Programmed by Blake Leftwich & Michael Oder


G_platformName = system.getInfo("platformName")

display.setStatusBar(display.HiddenStatusBar)
system.activate( "multitouch" )
native.setProperty( "prefersHomeIndicatorAutoHidden", true )
native.setProperty( "androidSystemUiVisibility", "immersiveSticky" )


version = require "version"
if (version.defaultVersion ~= 5) then
	if system.getInfo("targetAppStore") == "amazon" then
		store = require "plugin.amazon.iap"
	elseif system.getInfo("targetAppStore") == "google" then
		--store = require( "plugin.google.iap.v3" )
		store = require( "plugin.google.iap.billing.v2" )
	else
		store = require("store")
	end
end

local myData = require("Scripts.myData")
splash = require "Splash.splash"
settingsLua = require "Scripts.settings"
jsonParser = require "json"
saveData = require "saveData"
particles = require "Scripts.Particles"
alertLink = require "Scripts.alertLink"
iap = require "Scripts.iap"
menu = require "Scripts.menu"
menuScrolling = require "Scripts.menuScrolling"
game = require "Scripts.game"
levelDetails = require "Scripts.levelDetails"
levelEditor = require "Scripts.levelEditor"
gameDetails = require "Scripts.gameDetails"
pathPlayer = require "Scripts.pathPlayer"
characterAnim = require "Scripts.characterAnimation"
promoKit = require "Scripts.promoKit"
parentalGate = require "Scripts.parentalGate"
randomGameDetails = require "Scripts.randomGameDetails"
randomLevelDetails = require "Scripts.randomLevelDetails"
itemAnimations = require "Scripts.itemAnimations"
wordProblems = require "Scripts.wordProblems"



local platformVersion = system.getInfo( "platformVersion" ) or 0


local iOSVersion = tonumber(string.sub( platformVersion, 1, 4 )) 


if system.getInfo( "platform" ) == "ios" and system.getInfo( "environment" ) ~= "simulator" and
		version.appStore ~= "Mac" then
	moreInfo = require "plugin.moreInfo"
	
	if (iOSVersion >= 10.3) then
	
		reviewPopUp = require "plugin.reviewPopUp"
	end
end

showReviewFrequency = 2 -- How many levels need to be played before it shows it

currentLevelPlayedNum = 0 -- Don't tweak this number
needsToShowRatePopup = false -- Don't tweak this


--for tvOS
if system.getInfo ("model") == "Apple TV" then
	logToFlurry = false
	useSaveFiles = false
	promoEnabled = true
	system.setIdleTimer( false )
	iCloud = require( "plugin.iCloud" )
elseif (version.bundleID == "com.eggrollgames.animalmathkindergartenfreetime" or version.appStore == "Windows" or
		version.appStore == "Mac" or version.appStore == "Chrome") then
	logToFlurry = false
	promoEnabled = false
	useSaveFiles = true
else
--normal
	-- logToFlurry = true
	
	logToFlurry = false
	
	useSaveFiles = true
	promoEnabled = true
end


if version.appStore == "iTunes" and version.bundleID == "com.eggrollgames.mathgamesfree" then
	usingSubscription = true
else
	usingSubscription = false
end




if ( system.getInfo("environment") == "simulator" ) then
	simulatorController = require("Scripts.simulatorController")
	-- simulatorController:show()
end


myData.isFireTV = false
myData.isController = false

--if (version.appStore == "Amazon" and system.getInfo ( "model" ) == "AFTB" or version.appStore == "Amazon FTV") then
local sysModel = system.getInfo ("model")
if ((version.appStore == "Amazon" and string.sub(sysModel,1,3) == "AFT") or version.appStore == "Amazon FTV" or
			sysModel == "Nexus Player") then
	myData.isFireTV = true
	require "Scripts.RGEasyFTV"
elseif (system.getInfo ("model") == "Apple TV" or version.appStore == "Ouya" or version.appStore == "Chrome") then
	myData.isController = true
	
end

-- xml = require( "Scripts.xml" ).newParser()
--cardPairsXML = xml:loadFile( "cardPairs.xml" )




--version 
--1 = colors paid, 2 = shapes paid, 3 = colors free, 4 = shapes free, 5 = all unlocked,
--6 = colors free unlocked shapes but not all colors, 
--7 = shapes free unlocked colors but not all shapes, 
variation = 5

unlockedEverything = false
unlockedWeeklySub = false
unlockedMonthlySub = false
unlockedYearlySub = false

currentlyPurchasing = false

--override print() function to improve performance when running on device
if ( system.getInfo("environment") == "device" ) then
   print = function() end
end

--main/menu
screenW = display.viewableContentWidth
screenH = display.viewableContentHeight
halfW = display.contentWidth*0.5
halfH = display.contentHeight*0.5
screenOriginX = display.screenOriginX
screenOriginY = display.screenOriginY
screenEdgeX = display.viewableContentWidth + -1* display.screenOriginX
screenEdgeY = display.viewableContentHeight + -1* display.screenOriginY
underlinePositionLow = display.contentHeight/ .695
underlinePositionMid = display.contentHeight/ .819
underlinePositionHigh = display.contentHeight/1.21
underlinePositionTop = display.viewableContentHeight/ 2
threeButtonsLeftX = display.contentWidth/5.6
threeButtonsRightX = display.contentWidth/1.219
twoButtonsLeftX = display.contentWidth/3.85
twoButtonsRightX = display.contentWidth/1.35
center = display.contentWidth/2
safeScreenOriginX = display.safeScreenOriginX
safeScreenOriginY = display.safeScreenOriginY


topInset, leftInset, bottomInset, rightInset = display.getSafeAreaInsets()

if (math.abs(leftInset) > math.abs(rightInset)) then
	safeScreenDistX = math.abs(leftInset)
else
	safeScreenDistX = math.abs(rightInset)
end


local actualWidth = math.floor((display.actualContentWidth/display.contentScaleX)+0.5)
local actualHeight = math.floor((display.actualContentHeight/display.contentScaleY)+0.5)
 
local function matchesWH(width,height)
   return( (width == actualWidth and height == actualHeight) or 
           (height == actualWidth and width == actualHeight) ) 
end 

print("Device width and height")
print(actualWidth)
print(actualHeight)

oniPhoneX = ( string.find( system.getInfo("architectureInfo"), "iPhone10,3" ) ~= nil ) or
                  ( string.find( system.getInfo("architectureInfo"), "iPhone10,6" ) ~= nil or
					matchesWH(1125,2436) or
					matchesWH(1242,2688) or
					matchesWH(828,1792))
-- oniPhoneX = true

hold = true
holdTimer = nil
holdMessageTrans = nil
buttonsActive = false
currentState = "title"
playingTitleStart = false
iapTimeOut = nil
iapTestRestoreStep = 1
iap_MenuOpen = false
titleCanPlay = true
tryRestore = false
fromTitle = false
isPurchasing = false
currentlyPurchasing = false

onLevelSelectScreen = false
showRateInline = true
floatRangeArrow = 2.5
floatRangeBird = 10
floatRangeSun = 1.5
floatRangeStar = 1
floatRangeVictoryStar = 5
floatRangeZ = 5
androidScale = 1.02
chromeScale = 1.1

-- Zzz
scalingAmount = .003
initScale = .4
alphaAmount = .004
floatHeight = 100
floatSpeed = .5


underlineGroup = display.newGroup()
titleButtons = display.newGroup()
selectButtons = display.newGroup()
mainContainer = display.newGroup()
chooseGameButtons = display.newGroup()
chooseModeButtons = display.newGroup()
animationGroup = display.newGroup()
parentsMenuGroup = display.newGroup()
balloonGroup = display.newGroup()
reflectionGroup = display.newGroup()
iapUnlockEverythingGroup = display.newGroup()
iapGroup = display.newGroup()
iapScrollGroup = display.newGroup()
upfrontGroup = display.newGroup()
upfrontScrollGroup = display.newGroup()
explosions = display.newGroup()
dustGroupBack = display.newGroup()
carGroupBack = display.newGroup()
dustGroupFront = display.newGroup()
carGroupFront = display.newGroup()
instructions = display.newGroup()
characterHopGroup = display.newGroup()
dotsGroup = display.newGroup()
questionGroup = display.newGroup()
parentalGateGroup = display.newGroup()


logoMain = {} --placeholder to maintain scope
loadedProducts = {}
storePurchaseID = ""
optionsTextNoIAP = {}
optionsText = {}
lockedLevels = {}

--other main
iapCardsLeft = {}
iapCardsRight = {}
cir1 = {}
iapCardsLeftTable = { "rhombusGem.png", "blue.png", "orangeCat.png", "pinkFlower.png","iapCard1.png", "greenTractor.png", "octagon.png", "purpleBackpack.png", "starBadge.png","iapCard2.png"}
iapCardsRightTable = { "redTomato.png", "pinkPig.png", "greenFrog.png", "triangleXylophone.png","iapCard3.png", "ovalBaby.png", "purpleGrapes.png" , "heartPillow.png", "rectangleBus.png","iapCard4.png"}
-- colorsTable = {{227,6,19}, {227,6,19},{134,67,143}, {255,129,0}, {255,167,213}, {251,224,21}}--old green: {137,159,10},  green: {145,204,48}
colorsTable = {{227,6,19}, {18,109,181},{134,67,143}, {255,129,0}, {255,167,213}, {251,224,21}}-- old green: {137,159,10},  green: {145,204,48}
lastRgb = {145,204,48}--{255,0,150}--{145,204,48}--{54,184,234}
cardLocator = {center - (134 + 24),center - (33.5 + 33.5 + 12),center,center + (33.5 + 33.5 + 12),center + (134 + 24)}
rgb = {145,204,48}
--bgImages = {"bg1.png", "bg2.png", "bg3.png", "bg4.png", "bg5.png"} --numbers
bgImages = {"bgCloud.png", "bgCloud2.png", "bgCloud.png", "bgCloud.png", "bgCloud.png" } --shapes
messageY = { -20, 24, 24, 24, 24, 24 }  -- Add or subtract to Y currently
androidTextOffsetY = 50

--timers
morphRate = 1
soundDelay = 500 --amount subtracted from original transition time for android delay. (300 for andoid) (500 for iOS)
parentsHold = 3000
messageTime = { 1800, 1800, 1800, 1800, 1800, 1800 }    --(1 = numbers to numbers, 2 = number to groups, 3 = groups to groups, 4 = pictures, 5 = colors)
startMessageTime = { 0, 0, 1600, 1600, 0, 0 }   -- For sounds
timeToShowAll = 1500
timeBeforePeek = { 500, 500, 500, 500, 500, 500, 500, 500, 500, 500, 500, 500, 500, 500, 500, 500, 500 }
timeBeforeFlipPerm = { 1200, 1200, 1200, 1200, 1200, 1200, 1200, 1200, 1200, 1200, 1200, 1200, 1200, 1200, 1200, 1200, 1200 }
timeToFlip = 50 -- Time it takes for cards to flip over
showCardsDelay = 0 -- Use other variables
showCardsDelayNum = { 300, 300, 300, 400, 500, 600, 700, 800, 900, 1000 } -- Cards 1 - 10 (num and groups)
showCardsDelayPic = 500 -- Picture cards
timeToShowWin = 1000

--balloon
balloonSpeedY = .3
balloonSpeedX = 0
balloonCycles = 0
totalBalloons = 10
currentPopChannel = 26
popSounds = {}
balloons = {}
reflection = {}
reward = 0
popBalloonCount = 1
victoryMusicTimer = 400
balloonWidth, balloonHeight = 0, 0
currentCountChannel = 24
currentCharNameChannel = 9
currentGameChannel = 22
currOtherMainChannel = 15
currCharSoundChannel = 12
endOfGame = false
endZZZ = false
closeEyes = false
charWakeUp = false
charSoundTrasitioning = false

--game
gameSounds = {}
gameNumSounds = {}
currentCardChannel = 18
currentWrongChannel = 19
currentCursorChannel = 26
gamePathGroup = display.newGroup()
gamePathItems = {}
gamePathText = {}
dotPathItems = {}
currentWaypoint = 1
levelCompleted = false

chosen = {}
cards = {}
cardImages = {}
cardPairs = {}
totalPairs = 0
oldCardGroupX = 0
oldCardGroupY = 0
newCardGroupX = 0
newCardGroupY = 0
cardGroup = display.newGroup()
equationGroup = display.newGroup()
cardBacks = {}
currentBack = 1
scaleCards = .8

rowPosition = { 83.2, 123.2, 166.4, 206.4, 249.6, 289.6, 332.8, 372.8, 416 }
rowPositionWhichTwoNum = { 83.2, 123.2, 166.4, 206.4, 249.6, 289.6, 332.8, 372.8, 416 }
rowPosition2 = { 43, 120, 197, 274, 351, 428, 505, 582, 649 }
longRowPosition = { 63, 108, 153, 198, 243, 288, 333, 378, 423 }


sequenceNum = 0
correctNum = 0
totalNumAnswers = 0
turnedNum = 2
numberOfMistakes = 0
timeToComplete = 0
numCards = 0

currentCountingNumber = 1

layout = 0
levelOrder = {}
difficulty = 1

showAllCards = false
flipAllTimer = 0
showAgain = false
automaticPeek = false
flipped = 0

selectedCardsFloat = true
floaters = {}
floatRange = 5 --higher number creates a larger floating area, 5 is nice and subtle
rotationRange = .06 --higher number creates a larger rotation area, .05 is nice and subtle
rotationRate = 40 --higher number takes longer to rotate, 60 is nice and subtle

firstImageSet = {}
secondImageSet = {}
thirdImageSet = {}
fourthImageSet = {}

-- The gameplay options (1 = normal, 2 = match three, 3 = sequence, 4 = run, 5 = selection)
gameplayOptions = 1
-- The gameplay type (1 = numbers, 2 = pictures)
gameplayType = 1
-- The gameplay match (1 = colors, 2 = pictures to words, 3 = pictures(color), 4 = shapes, 4 = pictures to shapes, 5 = pictures(shapes))
gameplayMatch = 1
-- The gameplay mode (1 = show me, 2 = traditional, 3 = equation)
gameplayMode = 1

level = 1
curGame = 1
curWaypoint = 1
numGames = 0
numGamesLeft = 0

choiceOne = "0"
choiceTwo = "0"
choiceThree = "0"
answer = "0"

choiceOneComplete = false
choiceTwoComplete = false

-- Options
numOrGroup = "both"  -- or "groups" or "both"
equationSign = "-"
numBlanks = 3
choiceOneBlank = true
choiceTwoBlank = true
choiceThreeBlank = true
answerBlank = true

numChoices = 4
choicesOrderRand = true
startRange = 1  -- Make sure that at least the first number can add to a number within the numbers range
endRange = 10

equationAddition3 = 1
equationAddition5 = 1
equationSubtraction3 = 1
equationSubtraction5 = 1

randomCategory = 0
randomImage = 0

currentEquationVO = 1
currentSequenceVO = 1
whichOneIsDifferentVO = 1

shadowOffsetX = 3.1
shadowOffsetY = 4.75


controllerSensitivity = .7
controllerAxisDelay = 300 -- time it takes for controller to respond again after cursor has been moved

showingSaleIAP = false


-- local chanceToShowNewIAP = math.random( 1, 2 )
-- if (chanceToShowNewIAP == 1) then
	showNewIAP = true
-- else
	-- showNewIAP = false
-- end


if (system.getInfo( "platformName" ) == "Android"  ) then

	dynamicFont = "BigSky_1"
	textFont = "CloudyWithaChanceofLove"
	newFont5 = "LEMONMILK-Medium"
else
	dynamicFont = "Big Sky"
	textFont = "Cloudy With a Chance of Love"
	newFont5 = "LEMONMILK-Medium"
end


titleVehicles = {
	{ name = "titleCar1", w = -244, h = 148, offsetY = -1 },
	{ name = "titleCar2", w = -244, h = 148, offsetY = -1 },
	{ name = "titleCar3", w = -244, h = 148, offsetY = -1 },
	{ name = "titleBus", w = -290, h = 175, offsetY = -1 },
	{ name = "titleScooter", w = -112, h = 136, offsetY = -1 },	
}

vehicles = {
	{ name = "bus", w = 99, h = 58, offsetY = 0 },
	{ name = "car1", w = -78, h = 50, offsetY = -1 },
	{ name = "car2", w = -78, h = 50, offsetY = -1 },
	{ name = "car3", w = -78, h = 50, offsetY = -1 },
	{ name = "jeep", w = -83, h = 51, offsetY = -1 },
	{ name = "scooter", w = -40, h = 48, offsetY = -1 },
}



--CREATE DEBUGGER OBJECT
--[[
debugger = {}
function debugger:init()
	debugger.count = 0
	debugger.textLog = "Starting" 
	debugger.debugTextBox = native.newTextBox( 240, display.contentHeight-75, 480, 150 )
	debugger.debugTextBox.text = debugger.textLog
end
function debugger:log(line,description)
	debugger.count = debugger.count+1
	debugger.textLog = debugger.count..":"..line..":"..description.."\n"..debugger.textLog 
	debugger.debugTextBox.text = debugger.textLog
        debugger.debugTextBox:toFront()
        print(description)
end

debugger:init()
--debugger:log(1,"1")
--]]

-- Good Job

function goodJobSequenceClose()

	Runtime:removeEventListener( "key", pop )
	Runtime:removeEventListener( "axis", pop )
	Runtime:removeEventListener( "onFTVKey", pop )

	if (nextWaypoint == true) then
		curWaypoint = curWaypoint + 1
	end
	curGame = curGame + 1
	
	 timer.performWithDelay( 700, callResetGameItems )
	
	
	if (numGamesLeft == 0) then
		popBalloonCount = 1
		print("end")
		
		-- audio.stop(6)
		-- audio.setVolume( 1, { channel=6 } )
		-- audio.stop(2)
		-- audio.stop(3)
		-- audio.stop(4)
		
		-- local function stopVictoryMusic()
			-- audio.stop(11)
			-- audio.setVolume( 1, { channel=6 } )
			
			-- local function playBassMusicTimer()
				-- if savedData.enableMusic == true then                                                                    
                                        
					-- audio.play( matchingDrumsSound, { channel = 6, loops = -1 }  )
					-- audio.play( matchingBassSound, { channel = 2, loops = -1 }  )
					-- audio.play( matchingTriangleSound, { channel = 3, loops = -1 }  )
					-- audio.play( matchingInstrumentSound, { channel = 4, loops = -1 }  )
					--audio.fade( { channel=2 , time=0 , volume=0  } )
					--audio.fade( { channel=3 , time=0 , volume=0  } )
					--audio.fade( { channel=4 , time=0 , volume=0  } )
					-- audio.setVolume( 0, { channel=2 } )
                                        -- audio.setVolume( 0, { channel=3 } )
                                        -- audio.setVolume( 0, { channel=4 } )
                                        -- audio.setVolume( 1, { channel=6 } )
				--end
				--nextGame()
				--AddCards() --added here so that music plays as cards slide in
			--end
			--timer.performWithDelay( 700, playBassMusicTimer )
			--replaced the timer above with: 
			--playBassMusicTimer()
			--so that the music timing is spot on

			-- audio.fade( { channel=28 , time=700 , volume=0  } )
			-- audio.fade( { channel=26 , time=700 , volume=0  } )
		-- end
		-- timer.performWithDelay( victoryMusicTimer, stopVictoryMusic )
		-- I removed the onComplete=AddCards from the following transition and put it in the
		
		-- audio.fade( { channel=3 , time=0 , volume=0  } )
		
		--saveLevelData()
		levelCompleted = true
		closeGameScreen()
		if (goodJobBackground) then
			goodJobBackground:removeSelf()
			goodJobBackground = nil
		end
		if (goodJobImage) then
			goodJobImage:removeSelf()
			goodJobImage = nil
		end
		
		-- Particles:removeParticles(explosions)
		
		-- playBassMusicTimer function above. This causes the music to sync up as one continuous beat. ~Blake
		--transition.to( youreDoingGreatImage, { time=700, alpha=0, transition=easing.outExpo } ) --, onComplete=AddCards
	else
		transition.to( line5, { time=900, alpha=0, transition=easing.outExpo,onComplete=nextGame} )
		--makeButtonsActive()
	end
	
	
	
end



function balloonFloatEnd()

	-- timer.performWithDelay( 100, goodJobSequenceClose, 1)
end

function floatBalloons(event)
	
	balloonSpeedY = balloonSpeedY + .030
	balloonSpeedX = balloonSpeedX + .0005
	
	for i = 1, #balloons do
	
		if (balloons[i].y > 650 and balloons[i].y < 700 and balloons[i].x < (screenOriginX+140)) then
			balloons[i].direction = 2
		elseif (balloons[i].y > 650 and balloons[i].y < 700 and balloons[i].x > (screenEdgeX-140)) then
			balloons[i].direction = 1
		end
	
		if (balloons[i].direction == 1) then
			balloons[i].x = balloons[i].x - balloonSpeedX /  balloons[i].floatSpeedX
		else
			balloons[i].x = balloons[i].x + balloonSpeedX /  balloons[i].floatSpeedX
		end
		
		balloons[i].y = balloons[i].y - balloonSpeedY / balloons[i].floatSpeedY
		
		reflection[i].x = balloons[i].x + 21/balloonWidth
		reflection[i].y = balloons[i].y + 27/balloonHeight
		
	end
	
    balloonCycles = balloonCycles + 1
	local curBalloonCount = 0
	for i = #balloons, 1, -1 do
		if (balloons[i].y < - 50) then
			curBalloonCount = curBalloonCount + 1
		end
	end
	if curBalloonCount == #balloons or totalBalloons < 1 then
		for i = #balloons, 1, -1 do
			if (balloons[i]) then
				balloons[i]:removeSelf()
				balloons[i] = nil
			end
		end
		for i = #reflection, 1, -1 do
			if (reflection[i]) then
				reflection[i]:removeSelf()
				reflection[i] = nil
			end
		end
		balloonGroup:removeSelf()
		balloonGroup = display.newGroup()
		reflectionGroup = display.newGroup()
		balloonSpeedY = .3
		balloonSpeedX = 0
		balloonCycles = 0
		totalBalloons = 10
		Runtime:removeEventListener( "enterFrame", floatBalloons )
		Particles:removeParticles(explosions)
		balloonFloatEnd()
	end
	
	balloonGroup:toFront()
	if (goodJobBackground) then
		goodJobBackground:toFront()
	end
	if (goodJobImage) then
		goodJobImage:toFront()
	end
	if (victoryStar) then
		victoryStar:toFront()
	end
	if (bgWhite) then
		bgWhite:toFront()
	end
	backButton:toFront()
	
end

function resetBalloonScale()
	for i=1, #balloons do
		balloons[i].width = balloons[i].origWidth
		balloons[i].height = balloons[i].origHeight
	end
end

function popOld(event)
	if event.phase == "began" then
		display.getCurrentStage():setFocus( event.target )
		event.target.isFocus = true
		transition.to( event.target, { time=100, alpha=0, width=140,  height=140, transition=easing.inExpo, onComplete=resetBalloonScale} )
		transition.to( reflection[event.target.id], { time=100, alpha=0, width=140,  height=140, transition=easing.inExpo, onComplete=resetBalloonScale} )
		
		if savedData.enableSounds == true then
			playReservedChannel(gameNumSounds[popBalloonCount], currentCountChannel, 0)
		end
		popBalloonCount = popBalloonCount + 1
		
		currentCountChannel = currentCountChannel + 1
		if currentCountChannel > 25 then
			currentCountChannel = 24
		end
		
		totalBalloons = totalBalloons - 1
		if savedData.enableSounds == true then
			playReservedChannel(popSounds[math.random(1,3)], currentPopChannel, 0)
		end
		currentPopChannel = currentPopChannel + 1
		if currentPopChannel > 26 then
			currentPopChannel = 27
		end
		--playSound(popSounds, math.random(1,3))
		
		Particles:newEmitter(explosions,"fireworks", "Images/starParticle.png", 32, 32, 10, event.target.x, event.target.y, -4, 4, -16, 6, event.target.rgb[1], event.target.rgb[2], event.target.rgb[3])
		
		event.phase = "ended"
	end
	if event.phase == "ended" then
		-- reset global touch focus
		display.getCurrentStage():setFocus( nil )
		event.target.isFocus = nil
	end
	return true
end

function pop(event)

	if (balloons and #balloons > 0) then

		local target = event.target
		
		if (target == nil) then
			local balloonsPoppedNum = 0
			repeat
				randomBalloon = math.random(1, #balloons)
				
				balloonsPoppedNum = 0
				for i = #balloons, 1, -1 do
					if (balloons[i].popped == true) then
						balloonsPoppedNum = balloonsPoppedNum + 1
					end
				end
			until balloons[randomBalloon].popped == false or balloonsPoppedNum == #balloons
			target = balloons[randomBalloon]
		end
		
		if event.phase == "began" or event.phase == "down" then
		
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
				else
					display.getCurrentStage():setFocus( event.target )
					event.target.isFocus = true
				end
					
					transition.to( target, { time=100, alpha=0, width=140,  height=140, transition=easing.inExpo, onComplete=resetBalloonScale} )
					transition.to( reflection[target.id], { time=100, alpha=0, width=140,  height=140, transition=easing.inExpo, onComplete=resetBalloonScale} )
					
					if savedData.enableSounds == true then
						playReservedChannel(gameNumSounds[popBalloonCount], currentCountChannel, 0)
					end
					popBalloonCount = popBalloonCount + 1
					
					currentCountChannel = currentCountChannel + 1
					if currentCountChannel > 25 then
						currentCountChannel = 24
					end
					
					totalBalloons = totalBalloons - 1
					if savedData.enableSounds == true then
						playReservedChannel(popSounds[math.random(1,3)], currentPopChannel, 0)
					end
					currentPopChannel = currentPopChannel + 1
					if currentPopChannel > 27 then
						currentPopChannel = 26
					end
					--playSound(popSounds, math.random(1,3))
					
					Particles:newEmitter(explosions,"fireworks", "Images/starParticle.png", 32, 32, 10, target.x, target.y, -4, 4, -16, 6, target.rgb[1], target.rgb[2], target.rgb[3])
					
					event.phase = "ended"
			
			end
		end
		
	
	end
	
	if event.phase == "ended" or event.phase == "up" then
		-- reset global touch focus
		if (myData.isFireTV or myData.isController) then 
		else
			display.getCurrentStage():setFocus( nil )
			event.target.isFocus = nil
		end
	end
	
	return true
end



function balloonStart()
	math.randomseed( os.time() )
	balloons[math.random(1, 9)].y = 410
	Runtime:addEventListener( "enterFrame", floatBalloons )
end

function goodJobAnimation1()

	local function playGoodJobSound()
		if savedData.enableSounds == true then
			playReservedChannel(youreDoingGreatSound, 29, 0)
		end
		
		timer.performWithDelay( 3400, goodJobSequenceClose, 1) --3000 originally
	end

	transition.to( goodJobBackground, { time=700, x=halfW, transition=easing.outExpo } )
	transition.to( goodJobImage, { time=700, x=halfW, transition=easing.outExpo, onComplete=playGoodJobSound } )
	
	if savedData.enableSounds == true then
		playReservedChannel(applauseSound, 30, 0)
	end
	
end


function victoryStarFloat()

	victoryStar.frame = victoryStar.frame + 1
	victoryStar.y =  victoryStar.initY + floatRangeVictoryStar * math.sin(victoryStar.frame/30)

end

function starPathAnim1Done(target)

	goodJobBackground = display.newImageRect("Images/UI/messageBG.png", 1000, 72 )
	goodJobBackground.x = -1000
	goodJobBackground.y = halfH+100
	
	goodJobImage = display.newImageRect("Images/UI/goodJob.png", 354, 95 )
	goodJobImage.x = 1000
	goodJobImage.y = halfH+100
	
	victoryStar:toFront()
	--victoryStar.x = halfW
	
	local function doneAnimating()
	
		if savedData.enableSounds == true then
			playReservedChannel(popSounds[1], 19, 0)
		end
	
		local function scaleBack( object )
			transition.to( victoryStar, { time=100 , xScale = 1, yScale = 1, transition=easing.outExpo } )
		end
		transition.to(victoryStar, {time=100, xScale = 1.35, yScale = 1.35, onComplete = scaleBack, transition=easing.inExpo} )
		--scaleBack(star)
		Particles:newEmitter(explosions,"fireworks", "Images/confettiParticle.png", 21, 21, 80, victoryStar.x, victoryStar.y, -4, 4, -16, 6, 255,255,200)--altRgb[1], altRgb[2], altRgb[3])
		
		victoryStar.initY = victoryStar.y
		Runtime:addEventListener( "enterFrame", victoryStarFloat)
		
	end
	--move to center, transitioning instantly because the new path is accurate
	--and closer to the center when finished, not noticeable when moving
	transition.to( victoryStar, { time=1, x = halfW-8,y = halfH-32, transition=easing.outExpo, onComplete=doneAnimating } )
	timer.performWithDelay( 1000, goodJobAnimation1 )
	
	
	balloonStart()
end

function hopDone(target)
end

function goodJobSequence()

	if (nextWaypoint == true) then
		numGamesLeft = numGamesLeft - 1
	end
	--reward = reward + 1
	
	print("end game") 
	print(nextWaypoint)
	print(numGamesLeft)
	
	if (numGamesLeft ~= 0 and nextWaypoint == true) then
	
	
		local moveDetails = moveOptions[levelEditorDetails.levelMoveStyle]
	
		gameIcon.animInfo = waypoints[levelEditorDetails.levelMoveStyle][currentWaypoint]
		
	
		-- gameIcon.animInfo = levelDetails["level" .. level].waypoints[currentWaypoint]
		
		-- print("Should add waypoint here")
		pathPlayer.animateCharacter(gameIcon,pathAnimDone)
		
		--balloons[i]:setFillColor( balloons[i].rgb[1], balloons[i].rgb[2], balloons[i].rgb[3] )
		gamePathText[curWaypoint]:setFillColor( 254/255,237/255,44/255 )
		
		currentWaypoint = currentWaypoint + 1
		
		currentEquationVO = 1
		-- currentSequenceVO = 1
	end
	
	-- print("Reward: " .. reward)
	
	if (numGamesLeft == 0) then
		reward = 0
		
		currentEquationVO = 1
		currentSequenceVO = 1
		
		questionHitBox:removeEventListener( "touch", instructionsTouch )
		
		if savedData.enableSounds == true then
			playReservedChannel(magicSound, 20, 0)
		end
		
		-- transition.to( questionText, { time=700, x=900, transition=easing.outExpo } )
		-- transition.to( questionTextTwo, { time=700, x=900, transition=easing.outExpo } )
		-- transition.to( equationGroup, { time=700, x=900, transition=easing.outExpo } )
		
		--saveLevelData()
		Runtime:removeEventListener( "enterFrame", worldStarFloat)
		
		victoryStar = display.newImageRect("Images/UI/victoryStar.png", 15, 14 )
		--victoryStar:setReferencePoint(display.centerReferencePoint)
		victoryStar.x = worldStar.x
		victoryStar.y = worldStar.y
		victoryStar.initY = worldStar.y
		victoryStar.frame = 0
		
		worldStar:removeSelf()
		worldStar = nil
		
		starPaths={
					{start={x=74,y=266},finish={x=0,y=0},charAnim={animType="follow",smoothing=43},time=.5,snapto=0,smoothing=3,repeats=0,
                        origpath={{y=240,x=365},{y=240,x=365},{y=240,x=365},{y=240,x=365},{y=240,x=365},{y=240,x=365},{y=240,x=365},{y=240,x=365},{y=240,x=365},{y=240,x=365},{y=240,x=365},{y=240,x=365},{y=240,x=365},{y=238,x=366},{y=234,x=369},{y=232,x=371},{y=230,x=372},{y=228,x=374},{y=227,x=374},{y=225,x=375},{y=224,x=376},{y=222,x=377},{y=220,x=378},{y=217,x=380},{y=217,x=380},{y=215,x=381},{y=214,x=382},{y=212,x=383},{y=209,x=384},{y=208,x=386},{y=208,x=386},{y=205,x=386},{y=204,x=387},{y=201,x=388},{y=198,x=389},{y=198,x=389},{y=193,x=391},{y=191,x=392},{y=188,x=393},{y=187,x=394},{y=185,x=394},{y=181,x=395},{y=178,x=396},{y=175,x=397},{y=171,x=398},{y=169,x=398},{y=166,x=400},{y=160,x=401},{y=158,x=401},{y=155,x=401},{y=151,x=401},{y=147,x=401},{y=143,x=401},{y=141,x=401},{y=137,x=401},{y=135,x=401},{y=132,x=401},{y=128,x=401},{y=127,x=401},{y=124,x=401},{y=123,x=401},{y=120,x=401},{y=118,x=401},{y=116,x=400},{y=114,x=400},{y=112,x=398},{y=110,x=398},{y=107,x=397},{y=106,x=396},{y=104,x=396},{y=102,x=395},{y=99,x=394},{y=97,x=392},{y=96,x=392},{y=95,x=391},{y=93,x=390},{y=92,x=389},{y=90,x=388},{y=89,x=387},{y=86,x=385},{y=84,x=384},{y=82,x=382},{y=80,x=380},{y=78,x=379},{y=76,x=377},{y=69,x=370},{y=66,x=368},{y=66,x=368},{y=65,x=365},{y=63,x=362},{y=61,x=359},{y=61,x=358},{y=58,x=355},{y=56,x=352},{y=56,x=350},{y=54,x=346},{y=53,x=345},{y=52,x=343},{y=51,x=340},{y=51,x=337},{y=49,x=334},{y=47,x=329},{y=47,x=327},{y=46,x=324},{y=44,x=317},{y=43,x=314},{y=43,x=310},{y=41,x=304},{y=41,x=299},{y=41,x=298},{y=40,x=291},{y=40,x=285},{y=40,x=282},{y=40,x=274},{y=39,x=270},{y=39,x=265},{y=39,x=256},{y=39,x=250},{y=39,x=245},{y=39,x=241},{y=39,x=237},{y=39,x=233},{y=41,x=228},{y=41,x=220},{y=42,x=214},{y=43,x=211},{y=43,x=206},{y=43,x=201},{y=44,x=197},{y=47,x=194},{y=48,x=187},{y=50,x=182},{y=52,x=179},{y=54,x=174},{y=57,x=169},{y=60,x=164},{y=62,x=159},{y=66,x=151},{y=67,x=147},{y=70,x=144},{y=71,x=140},{y=73,x=136},{y=76,x=132},{y=78,x=129},{y=81,x=124},{y=86,x=120},{y=90,x=115},{y=95,x=112},{y=98,x=109},{y=100,x=106},{y=102,x=104},{y=105,x=102},{y=107,x=100},{y=110,x=98},{y=111,x=96},{y=115,x=93},{y=116,x=93},{y=119,x=91},{y=122,x=90},{y=124,x=87},{y=126,x=87},{y=131,x=84},{y=132,x=84},{y=135,x=82},{y=137,x=81},{y=139,x=80},{y=144,x=79},{y=145,x=78},{y=148,x=76},{y=150,x=76},{y=151,x=75},{y=153,x=74},{y=156,x=73},{y=157,x=73},{y=160,x=73},{y=164,x=71},{y=167,x=70},{y=170,x=69},{y=172,x=68},{y=175,x=68},{y=177,x=67},{y=183,x=66},{y=185,x=66},{y=190,x=66},{y=193,x=66},{y=197,x=66},{y=199,x=66},{y=203,x=66},{y=205,x=66},{y=208,x=66},{y=213,x=66},{y=215,x=66},{y=219,x=66},{y=220,x=66},{y=223,x=66},{y=224,x=67},{y=228,x=68},{y=230,x=68},{y=231,x=69},{y=233,x=69},{y=236,x=70},{y=239,x=71},{y=241,x=72},{y=244,x=73},{y=247,x=74},{y=249,x=76},{y=251,x=76},{y=254,x=77},{y=255,x=78},{y=257,x=80},{y=259,x=81},{y=262,x=82},{y=263,x=83},{y=264,x=84},{y=264,x=84},{y=265,x=85},{y=266,x=87},{y=266,x=88},{y=267,x=89},{y=269,x=91},{y=270,x=93},{y=271,x=94},{y=272,x=97},{y=273,x=99},{y=274,x=101},{y=274,x=104},{y=277,x=105},{y=277,x=107},{y=278,x=108},{y=279,x=110},{y=279,x=112},{y=279,x=113},{y=279,x=114},{y=279,x=117},{y=279,x=121},{y=279,x=123},{y=279,x=127},{y=279,x=131},{y=279,x=134},{y=279,x=139},{y=279,x=141},{y=279,x=147},{y=279,x=151},{y=279,x=154},{y=279,x=158},{y=278,x=163},{y=276,x=169},{y=275,x=170},{y=274,x=176},{y=272,x=180},{y=271,x=182},{y=271,x=186},{y=270,x=190},{y=268,x=192},{y=267,x=196},{y=266,x=201},{y=263,x=205},{y=262,x=209},{y=260,x=211},{y=259,x=215},{y=256,x=218},{y=256,x=220},{y=252,x=225},{y=249,x=228},{y=248,x=230},{y=246,x=232},{y=244,x=234},{y=243,x=235},{y=242,x=237},{y=241,x=238},{y=238,x=241},{y=236,x=242},{y=234,x=243},{y=233,x=244},{y=232,x=245},{y=230,x=247},{y=227,x=248},{y=226,x=249},{y=225,x=249},{y=223,x=250},{y=222,x=251},{y=220,x=252},{y=217,x=252},{y=216,x=252},{y=214,x=252},{y=212,x=253},{y=209,x=253},{y=208,x=253},{y=206,x=254},{y=204,x=255},{y=201,x=255},{y=200,x=255},{y=196,x=255},{y=194,x=255},{y=192,x=255},{y=190,x=255},{y=188,x=256},{y=186,x=256},{y=185,x=256},{y=185,x=256},{y=184,x=256},{y=183,x=256},{y=182,x=256},{y=180,x=256},{y=180,x=256},{y=179,x=256},{y=178,x=256},{y=177,x=256},{y=177,x=256},{y=175,x=256},{y=174,x=256},{y=174,x=256},{y=172,x=256},{y=172,x=256},{y=170,x=254},{y=168,x=254},{y=168,x=254},{y=167,x=253},{y=166,x=252},{y=164,x=251},{y=164,x=251},{y=164,x=251},{y=164,x=251},{y=164,x=251},{y=163,x=251},{y=163,x=251},{y=162,x=250},{y=162,x=250},{y=162,x=250},{y=162,x=250},{y=162,x=250},{y=162,x=250},{y=162,x=250},{y=162,x=250},{y=162,x=250},{y=162,x=250},{y=162,x=250},{y=162,x=250},{y=162,x=250},{y=162,x=250},{y=162,x=250},{y=162,x=250},{y=162,x=250},{y=162,x=250},{y=162,x=250},{y=162,x=250},{y=162,x=250}}},
        }
		
		victoryStar.animInfo = starPaths[1]
		pathPlayer.animateCharacter(victoryStar,starPathAnim1Done)
		transition.to( victoryStar, { time=650,width=336, height=321, transition=easing.inQuad } )
		
		
		characterHopAnim = {
			start={x=59.5,y=hopX},finish={x=157,y=hopX},textOffset={x=-1,y=-1.25},charAnim={animType="hop",height=4,frequency=40},time=1,snapto=0,smoothing=3,repeats=0,
			origpath={{y=326,x=hopX},{y=326,x=hopX},{y=326,x=hopX},{y=326,x=hopX},{y=326,x=hopX},{y=326,x=hopX},{y=326,x=hopX},{y=326,x=hopX},{y=326,x=hopX},{y=326,x=hopX},{y=326,x=hopX},{y=326,x=hopX},{y=326,x=hopX},{y=326,x=hopX},{y=326,x=hopX},{y=326,x=hopX},{y=326,x=hopX},{y=326,x=hopX},{y=326,x=hopX},{y=326,x=hopX},{y=326,x=hopX},{y=326,x=hopX},{y=326,x=hopX},{y=326,x=hopX},{y=326,x=hopX},{y=326,x=hopX},{y=326,x=hopX},{y=326,x=hopX},{y=326,x=hopX},{y=326,x=hopX},{y=326,x=hopX},{y=326,x=hopX},{y=326,x=hopX},{y=326,x=hopX},{y=326,x=hopX},{y=326,x=hopX},{y=326,x=hopX},{y=326,x=hopX},{y=326,x=hopX},{y=326,x=hopX},{y=326,x=hopX},{y=326,x=hopX},{y=326,x=hopX},{y=326,x=hopX},{y=326,x=hopX},{y=326,x=hopX},{y=326,x=hopX},{y=326,x=hopX},{y=326,x=hopX},{y=326,x=hopX},{y=326,x=hopX},{y=326,x=hopX},{y=326,x=hopX},{y=326,x=hopX},{y=326,x=hopX},{y=326,x=hopX},{y=326,x=hopX},{y=326,x=hopX},{y=326,x=hopX},{y=326,x=hopX},{y=326,x=hopX},{y=326,x=hopX},{y=326,x=hopX},{y=326,x=hopX}} 
		}
		
		gameIcon.animInfo = characterHopAnim
		pathPlayer.animateCharacter(gameIcon, hopDone)
		characterHopGroup:insert( gameIcon )
		characterHopGroup:toFront()
		
		if system.getInfo( "platformName" ) == "Android" then
			characterHopGroup.x = 2 + characterDetails[levelEditorDetails.character].hopOffset.x
			characterHopGroup.y = -8 + characterDetails[levelEditorDetails.character].hopOffset.y
		else
			characterHopGroup.x = 0 + characterDetails[levelEditorDetails.character].hopOffset.x
			characterHopGroup.y = 0 + characterDetails[levelEditorDetails.character].hopOffset.y
		end
		
		-- audio.fade( { channel=2 , time=1000 , volume=0  } )
		-- audio.fade( { channel=3 , time=1000 , volume=0  } )
		-- audio.fade( { channel=4 , time=1000 , volume=0  } )
		-- audio.fade( { channel=5 , time=1000 , volume=0  } )
		audio.setVolume( 0, { channel=3 } ) ----------------
		audio.stop( 3 ) ----------

		transition.to( backButton, { time=700, alpha=0, transition=easing.outExpo } )
		transition.to( instructionsReplayButton, { time=700, alpha=0, transition=easing.outExpo } )
		transition.to( questionText, { time=700, alpha=0, transition=easing.outExpo } )
		transition.to( questionTextTwo, { time=700, alpha=0, transition=easing.outExpo } )
		butonsActive = false

		if (gameplayMode == 2) then
			transition.to( peekButton, { time=700, alpha=0, transition=easing.outExpo } )
		end
		
		if (currentState == "game") then
			
			math.randomseed( os.time() )
			
			totalBalloons = math.random(10, 20)
			local prevY, addY = 430, 0
			local lastX = 0
			
			randomizeTable(colorsTable)
			
			for i = 1, totalBalloons do
			
				local floatSpeed
				local balloonSize = math.random( 1, 3)
				if (balloonSize == 1) then
					balloonWidth, balloonHeight = 2, 2
					floatSpeedY = 1.8
					floatSpeedX = 1.6
				elseif (balloonSize == 2) then
					balloonWidth, balloonHeight = 1.8, 1.8
					floatSpeedY = 1.5
					floatSpeedX = 1.3
				elseif (balloonSize == 3) then
					balloonWidth, balloonHeight = 1.7, 1.7
					floatSpeedY = 1.3
					floatSpeedX = 1.1
				end
				
				addY = addY + 1
				if (addY == 3) then
					addY = 0
					prevY = prevY + 100
				end
				
				local xRandom
				repeat
					xRandom = math.random( 1, 2 )
				until xRandom ~= lastX
				lastX = xRandom
				
				local xPos
				if (xRandom == 1) then
					xPos = math.random(screenOriginX + 100, halfW)
				elseif (xRandom == 2) then
					xPos = math.random(halfW, screenEdgeX - 100)
				elseif (xRandom == 4) then
					--xPos = math.random(400, 500)
				end
				
				local direction = math.random(1,2)
			
				balloons[i] = display.newImageRect("Images/balloon.png", 121/balloonWidth, 172/balloonHeight )
				balloons[i].origWidth = 121/balloonWidth
				balloons[i].origHeight = 172/balloonHeight
				balloons[i].x = xPos
				balloons[i].y = math.random(prevY, prevY+100)
				balloons[i].id = i
				balloons[i].floatSpeedY = floatSpeedY
				balloons[i].floatSpeedX = floatSpeedX
				balloons[i].direction = direction
				balloons[i].popped = false
				balloons[i]:addEventListener( "touch", pop ) 
				
				if (myData.isController) then
					Runtime:addEventListener( "key", pop )
					Runtime:addEventListener( "axis", pop )
				elseif (myData.isFireTV) then 
					Runtime:addEventListener( "onFTVKey", pop )
				end	
				
				if (i < 7) then
					balloons[i].rgb = {colorsTable[i][1],colorsTable[i][2],colorsTable[i][3]}
				elseif (i < 13) then
					-- print(i-6)
					balloons[i].rgb = {colorsTable[i-6][1],colorsTable[i-6][2],colorsTable[i-6][3]}
				elseif (i < 19) then
					balloons[i].rgb = {colorsTable[i-12][1],colorsTable[i-12][2],colorsTable[i-12][3]}
				elseif (i < 25) then
					balloons[i].rgb = {colorsTable[i-18][1],colorsTable[i-18][2],colorsTable[i-18][3]}
				else
					balloons[i].rgb = {colorsTable[i-24][1],colorsTable[i-24][2],colorsTable[i-24][3]}
				end
				
				balloons[i]:setFillColor( balloons[i].rgb[1]/255, balloons[i].rgb[2]/255, balloons[i].rgb[3]/255 )
				
				reflection[i] = display.newImageRect("Images/reflection.png", 62/balloonWidth, 204/balloonHeight )
				reflection[i].origWidth = 62/balloonWidth
				reflection[i].origHeight = 204/balloonHeight
				reflection[i].x = balloons[i].x + 21/balloonWidth
				reflection[i].y = balloons[i].y + 27/balloonHeight
			
				balloonGroup:insert(balloons[i])
				balloonGroup:insert(reflection[i])
				
			end
			
			
			backButton:toFront()
			instructionsReplayButton:toFront()
			balloonGroup:toFront()
			victoryStar:toFront()
			
			if savedData.enableSounds == true then
				playReservedChannel(victoryMusicSound, 23, 0)
			end
			
			--balloonStart()
		
		end
		
		
		
		
	else
	
	
		local randomSound = math.random(1,#goodJobSounds)

		if savedData.enableSounds == true then
			playReservedChannel(goodJobSounds[randomSound], 32, 0)
		end
		
		
		if (gameplayMode == 2) then
			transition.to( peekButton, { time=700, alpha=0, transition=easing.outExpo } )
		end
		transition.to( backButton, { time=700, alpha=0, transition=easing.outExpo } )
		transition.to( instructionsReplayButton, { time=700, alpha=0, transition=easing.outExpo } )
		buttonsActive = false
		
		if (currentState == "game") then
			goodJobTimer = timer.performWithDelay( 50, goodJobSequenceClose )
		end
		
	end
	
end

-- End Good Job



-- Sound functions

function stopButtonSound()
	media.stopSound()
end

function playReservedChannel(sound, reservedChannel, loopNumber)
	if savedData.enableSounds == true then
		local channelActive = audio.isChannelActive(reservedChannel)
		if channelActive then
			audio.stop( reservedChannel )
		end
		
		audio.setVolume(1, { channel=reservedChannel } )
		
		audio.play( sound, { channel = reservedChannel, loops = loopNumber}  )
	end
end

timer.soundPerformWithDelay = timer.performWithDelay
function timer.soundPerformWithDelay(interval, func, ...)
  local iterations, params
  local options = {...}
  if type(options[1]) == "number" then
		iterations = options[1]
		params = options[2]
  else
		iterations = 1
		params = options[1]
  end
  local function temp()
		func(params)
  end
  timer.performWithDelay(interval, temp, iterations)
end

function playSoundTimer(params)

	playReservedChannel(params.sound, params.reservedChannel, params.loopNumber)
end

-- end Sound functions


-- Other functions

function randomizeTable(t)
	local n = #t 
	math.randomseed( os.time() ) 
	while n >= 2 do 
		local k = math.random(n) 
		t[n], t[k] = t[k], t[n] 
		n = n - 1 		
	end
	return t
end 

function compare(a, b)
	return a < b
end 

function fadeBass()
	fadeReservedChannel(3, 140)
end

function morphColor()

	if lastRgb[1] < altRgb[1] then
		lastRgb[1] = lastRgb[1] + morphRate
		if lastRgb[1] > altRgb[1] then
			lastRgb[1] = altRgb[1]
		end
	elseif lastRgb[1] > altRgb[1] then
		lastRgb[1] = lastRgb[1] - morphRate
		if lastRgb[1] < altRgb[1] then
			lastRgb[1] = altRgb[1]
		end
	end
	
	if lastRgb[2] < altRgb[2] then
		lastRgb[2] = lastRgb[2] + morphRate
		if lastRgb[2] > altRgb[2] then
			lastRgb[2] = altRgb[2]
		end
	elseif lastRgb[2] > altRgb[2] then
		lastRgb[2] = lastRgb[2] - morphRate
		if lastRgb[2] < altRgb[2] then
			lastRgb[2] = altRgb[2]
		end
	end
	
	if lastRgb[3] < altRgb[3] then
		lastRgb[3] = lastRgb[3] + morphRate
		if lastRgb[3] > altRgb[3] then
			lastRgb[3] = altRgb[3]
		end
	elseif lastRgb[3] > altRgb[3] then
		lastRgb[3] = lastRgb[3] - morphRate
		if lastRgb[3] < altRgb[3] then
			lastRgb[3] = altRgb[3]
		end
	end
	
	--underline:setFillColor(lastRgb[1], lastRgb[2], lastRgb[3])
	-- for i = 1, 5 do
		-- bgAnimationGroup[i]:setFillColor(lastRgb[1], lastRgb[2], lastRgb[3])
	-- end
	
	if lastRgb[1] == altRgb[1] and lastRgb[2] == altRgb[2] and lastRgb[3] == altRgb[3] then
		timer.cancel(colorMorphTimer)
	end
end

function updateCurrentColorRGB()
	if cardBacks[currentBack] == 1 then
		--pink
		rgb = {255,167,213}
		--green
		altRgb = {145,204,48}--{137,159,10}
	elseif cardBacks[currentBack] == 2 then
		--blue
		rgb = {54,184,234}
		--pink
		altRgb = {255,167,213}
	elseif cardBacks[currentBack] == 3 then
		--orange
		rgb = {255,129,0}
		--blue
		altRgb = {54,184,234}
	elseif cardBacks[currentBack] == 4 then
		--green
		rgb = {145,204,48}--{137,159,10}
		--pink
		altRgb = {255,167,213}
	elseif cardBacks[currentBack] == 5 then
		--purple
		rgb = {134,67,143}
		--orange
		altRgb = {255,129,0}
	elseif cardBacks[currentBack] == 6 then
		--red
		rgb = {227,6,19}
		--orange
		altRgb = {255,129,0}
	else
		--red
		rgb = {227,6,19}
		--orange
		altRgb = {255,129,0}
	end
end



function repeatBgAnimation(obj)
	math.randomseed( os.time() )
	local scale = math.random(7,10)
	obj.xScale = scale/10
	obj.yScale = scale/10
	
	obj.x = screenEdgeX + 80
	
	for i = #cir1, 1, -1 do
		if (obj.x - 180 < cir1[i].x) then
			obj.x = screenEdgeX + ( math.random( 80, 180 ) )
		end
	end
	
	-- obj.y = math.random(screenOriginY+30,screenEdgeY-130)
	--transition.to( obj, { time=math.random(48000,50000), rotation = math.random(-120,120), alpha=math.random(), x = math.random(-1000,-912), y = math.random(-120,320), width=tempScaleTrans,  height=tempScaleTrans, transition=easing.none, onComplete=repeatBgAnimation} )
	
	local randomTime = math.random(200000,300000)
	local posY
	
	obj.y = math.random(screenOriginY+ 65,bgSunGroup.y + 65)
	
	repeat
		posY = math.random(obj.y-20,obj.y+20)
	until posY > screenOriginY+ 65 and posY < bgSunGroup.y + 65
	
	
	transition.to( obj, { time=randomTime, x = screenOriginX-1000, y = posY, transition=easing.none} )

	for i = #cir1, 1, -1 do
		if (obj == cir1[i]) then
			if (cir1[i-1]) then
				cir1[i-1].xScale = scale/10
				cir1[i-1].yScale = scale/10
				cir1[i-1].x = obj.x
				cir1[i-1].y = obj.y
				transition.to( cir1[i-1], { time=randomTime, x = screenOriginX-1000, y = posY, transition=easing.none, onComplete=repeatBgAnimation} )
			end
		end
	end
	
	end

function birdFloat( event )

	local particlexv = {min=-1,max=1}
	-- particlexv = {min=3,max=6}
	if (bgBirdGroup.alpha == 1) then
		bgBirdGroup.frame = bgBirdGroup.frame + 1
		bgBirdGroup.y =  bgBirdGroup.initY + 30 * math.sin(bgBirdGroup.frame/20)

		Particles:newEmitter(dustGroupBack,"fade", "Images/UI/puff.png", 50/1.65, 50/1.65, 1, bgBirdGroup.x+30, bgBirdGroup.y+20, particlexv.min, particlexv.max, -1, 1, 255, 255, 255, 0)
	end
	
end

function sunFloat( event )

	if (currentState ~= "game") then
		bgSunGroup.frame = bgSunGroup.frame + 1
		bgSunGroup.y =  bgSunGroup.initY + floatRangeSun * math.sin(bgSunGroup.frame/30)
	end
	
	
	
	-- Cars
	
	if (currentState ~= "game") then
	
		titleCarFrame = titleCarFrame + 1
		for i = #titleCarsBack, 1, -1 do
			if (titleCarsBack[i]) then
				titleCarsBack[i].y = titleCarsBack[i].initY
				titleCarsBack[i].y = titleCarsBack[i].y + .4 * math.sin(titleCarFrame/.023)
			end
		end

		for i = #titleCarsFront, 1, -1 do
			if (titleCarsFront[i]) then
				titleCarsFront[i].y = titleCarsFront[i].initY
				titleCarsFront[i].y = titleCarsFront[i].y + .4 * math.sin(titleCarFrame/.023)
			end
		end
	
		if (#titleCarsBack > 0) then
			local randomCar = math.random( 1, 3 )
			if (titleCarsBack[randomCar] and titleCarsBack[randomCar].isSmokeParticles == 1) then
				Particles:newEmitter(dustGroupBack,"dust", "Images/UI/dust.png", math.random(18,28)*2, math.random(18,28)*2, 1, titleCarsBack[randomCar].x + 20 + math.random(-12,12), titleCarsBack[randomCar].y -90 + math.random(12,24), -4, -6.2, 1.15, 1.4, 255, 255, 255)
			end
		elseif (#titleCarsFront > 0) then
			local randomCar = math.random( 1, 3 )
			if (titleCarsFront[randomCar] and titleCarsFront[randomCar].isSmokeParticles == 1) then
				Particles:newEmitter(dustGroupFront,"dust", "Images/UI/dust.png", math.random(18,28)*2, math.random(18,28)*2, 1, titleCarsFront[randomCar].x - 20 + math.random(-12,12), titleCarsFront[randomCar].y -90 + math.random(12,24), -4, -6.2, 1.15, 1.4, 255, 255, 255)
			end
		end
	end
	
end

function bgAnimationStart()
	bgSunGroup = display.newGroup()
	bgSunGroup.alpha = 0
	bgBirdGroup = display.newGroup()
	bgBirdGroup.alpha = 0
	bgCloudsOneGroup = display.newGroup()
	bgCloudsOneGroup.alpha = 0
	bgCloudsTwoGroup = display.newGroup()
	bgCloudsTwoGroup.alpha = 0
	math.randomseed( os.time() )
	
	sun = display.newImageRect("Images/UI/bgSun.png", 128, 115)
	bgSunGroup:insert( sun )
	
	sunTwo = display.newImageRect("Images/UI/bgSun2.png", 116, 116)
	bgSunGroup:insert( sunTwo )
	sunTwo.alpha = 0
	
	
	bgSunGroup.x = screenOriginX + 135 - (screenOriginX*0.5)
	bgSunGroup.y = 100
	bgSunGroup.initY = bgSunGroup.y
	bgSunGroup.initX = bgSunGroup.x
	bgSunGroup.initScale = bgSunGroup.yScale
	bgSunGroup.frame = 0
	
	
	
	Runtime:addEventListener( "enterFrame", sunFloat)
	
	local cloudNum = 1
	local function addCloud()
		cir1[#cir1+1] = display.newImageRect("Images/UI/"..bgImages[1], 108, 56)
		
		local scale = math.random(7,10)
		
		cir1[#cir1].xScale = scale/10
		cir1[#cir1].yScale = scale/10
		
		if (cloudNum == 1) then
			cir1[#cir1].x = math.random(screenOriginX+70, halfW)
		elseif (cloudNum == 2) then
			cir1[#cir1].x = math.random(halfW+40, screenEdgeX-60)
		else
			cir1[#cir1].x = screenEdgeX + 80
		end
		cir1[#cir1].y = math.random(screenOriginY+65,bgSunGroup.y + 65)
		bgCloudsOneGroup:insert(cir1[#cir1])
		--transition.to( cir1[i], { time=math.random(3000,48000), rotation = math.random(-120,120), alpha=math.random(), x = math.random(-500,-300), y = math.random(-120,320), width=tempScaleTrans,  height=tempScaleTrans, transition=easing.none, onComplete=repeatBgAnimation} )
		local randomTime = math.random(200000,300000)
		local cloudPosY = math.random(cir1[cloudNum].y-20,cir1[cloudNum].y+20)
		transition.to( cir1[#cir1], { time=randomTime, x = screenOriginX-500, y = cloudPosY, transition=easing.none} )
	
		cir1[#cir1+1] = display.newImageRect("Images/UI/"..bgImages[1], 109, 57)
		cir1[#cir1].xScale = scale/10
		cir1[#cir1].yScale = scale/10
		
		cir1[#cir1].x = cir1[#cir1-1].x
		cir1[#cir1].y = cir1[#cir1-1].y
		bgCloudsTwoGroup:insert(cir1[#cir1])
		transition.to( cir1[#cir1], { time=randomTime, x = screenOriginX-500, y = cloudPosY, transition=easing.none, onComplete=repeatBgAnimation} )
		
		cloudNum = cloudNum + 1
	end
	addCloud()
	addCloud()
	timer.performWithDelay( math.random(60000,80000), addCloud, 3 )
	
	-- bird = display.newImageRect("Images/UI/bgBird.png", 40, 25)
	bird = display.newImageRect("Images/UI/plane.png", -92, 64)
	-- ufo = display.newImageRect("Images/UI/bgUfo.png", 61, 48)
	bgBirdGroup:insert( bird )
	-- bgBirdGroup:insert( ufo )
	-- ufo.alpha = 0
	bgBirdGroup.x = screenEdgeX + 50
	bgBirdGroup.y = halfH - 40
	bgBirdGroup.initY = bgBirdGroup.y
	bgBirdGroup.frame = 0
	
	
	local function resetBird()
		bgBirdGroup.x = screenEdgeX + 50
		bgBirdGroup.y = halfH - 40
		bgBirdGroup.initY = bgBirdGroup.y
		bgBirdGroup.frame = 0
		-- Runtime:removeEventListener( "enterFrame", birdFloat)
	end
	
	local function birdFly()
		Runtime:addEventListener( "enterFrame", birdFloat)
		
		local function playPlaneSound()
			if savedData.enableSounds == true then
				playReservedChannel(planeSound, 12, 0)
			end
		end
		--timer.performWithDelay( 0, playPlaneSound )
		if (currentState ~= "game") then
			playPlaneSound()
		end
		transition.to( bgBirdGroup, { time=math.random(2500,3000), x=screenOriginX-50, transition=easing.none, onComplete=resetBird} )
	end
	-- timer.performWithDelay( math.random(15000,20000), birdFly, -1 )
	
	
	-- if (oniPhoneX == true) then
		gameCornerCloud1 = display.newImageRect("Images/UI/cornerCloud.png", 126, 119 )
		
		gameCornerCloud1.x = safeScreenOriginX + (gameCornerCloud1.contentWidth*0.5) - 1
		gameCornerCloud1.y = safeScreenOriginY + (gameCornerCloud1.contentHeight*0.5) - 2
	
		
		-- gameCornerCloud1.x = screenOriginX + (gameCornerCloud1.contentWidth*0.5) - 1 - 30 + 5 + 5
		-- gameCornerCloud1.y = screenOriginY + (gameCornerCloud1.contentHeight*0.5) - 2 - 56 + 5 + 5
	-- else
		-- gameCornerCloud1 = display.newImageRect("Images/UI/cornerCloud.png", 80, 48 )
		-- gameCornerCloud1.x = screenOriginX + (gameCornerCloud1.contentWidth*0.5) - 1
		-- gameCornerCloud1.y = screenOriginY + (gameCornerCloud1.contentHeight*0.5) - 2
	-- end
	
	gameCornerCloud1.alpha = 0
	--bgCloudsOneGroup:insert( gameCornerCloud1 )
	
	if (oniPhoneX == true) then
		gameCornerCloud2 = display.newImageRect("Images/UI/cornerCloudV2.png", 126, 119 )
		gameCornerCloud2.x = screenEdgeX + (gameCornerCloud2.contentWidth*0.5) - 1 - 30 + 5 + 5
		gameCornerCloud2.y = screenOriginY + (gameCornerCloud2.contentHeight*0.5) - 2 - 56 + 5 + 5
	else
		gameCornerCloud2 = display.newImageRect("Images/UI/cornerCloud.png", 80, 48 )
		gameCornerCloud2.x = screenEdgeX + (gameCornerCloud2.contentWidth*0.5) - 1
		gameCornerCloud2.y = screenOriginY + (gameCornerCloud2.contentHeight*0.5) - 2
	end
	
	gameCornerCloud2.alpha = 0
	--bgCloudsOneGroup:insert( gameCornerCloud2 )
	
	
	
	-- bgBirdGroup:toBack()
	bgCloudsOneGroup:toBack()
	bgCloudsTwoGroup:toBack()
	bgSunGroup:toBack()
	bg:toBack()
	playArrow:toFront()
	
	if (mainContainer) then
		mainContainer:toFront()
	end
	
	
	
	
	if (currentState == "title") then
	
		-- if (savedData.appOpenNum == 1 and variation == 4 and version.appStore == "Amazon" and system.getInfo( "environment" ) ~= "simulator") then
			-- buyIAP("restore")
		-- else
			-- title()
		-- end
	
		title()
		transition.to( titleBG, { delay=900, time=700, alpha=1} )
		transition.to( bgSunGroup, { delay=900, time=700, alpha=1} )
		-- transition.to( bgBirdGroup, { delay=900, time=700, alpha=1} )
		transition.to( bgCloudsOneGroup, { delay=900, time=700, alpha=1} )
		transition.to( bgCloudsTwoGroup, { delay=900, time=700, alpha=1} )
	end
end


function titleRemoveCar( groupObj )

	for i = #titleCarsFront, 1, -1 do
		if (titleCarsFront[i] == groupObj) then
			table.remove( titleCarsFront, i )
		end
	end
	for i = #titleCarsBack, 1, -1 do
		if (titleCarsBack[i] == groupObj) then
			table.remove( titleCarsBack, i )
		end
	end

	-- for i = groupObj.numChildren, 1, -1 do
		-- groupObj[i]:removeSelf()
		-- groupObj[i] = nil
	-- end
	
	if (groupObj) then
		groupObj:removeSelf()
		groupObj = nil
	end

end

function titleAddCars()

	local randomDirection = math.random( 1, 2 )
	local isSmokeParticles = math.random( 1, 3 )
	
	
	
	-- local randomVehicle = math.random( 1, #vehicles )
	
	local newTitleCarScale = 1.35
	
	local car = display.newImageRect("Images/UI/" .. titleVehicles[titleCurrentVehicle].name .. ".png", titleVehicles[titleCurrentVehicle].w * newTitleCarScale, titleVehicles[titleCurrentVehicle].h * newTitleCarScale )
	
	
	car.anchorX, car.anchorY = 0.5, 1
	
	car.isSmokeParticles = isSmokeParticles
	
	if (randomDirection == 1) then
		titleCarsBack[#titleCarsBack+1] = car
		titleCarsBack[#titleCarsBack].x = screenEdgeX + 200
		if (#titleCarsBack >= 2 and titleCarsBack[#titleCarsBack-1] and titleCarsBack[#titleCarsBack-1].x > screenEdgeX) then
			titleCarsBack[#titleCarsBack].x = titleCarsBack[#titleCarsBack-1].x + 130
		end
		titleCarsBack[#titleCarsBack].xScale, titleCarsBack[#titleCarsBack].yScale = 0.8, 0.8
		titleCarsBack[#titleCarsBack].y = halfH + 253 + titleVehicles[titleCurrentVehicle].offsetY
		titleCarsBack[#titleCarsBack].initY = titleCarsBack[#titleCarsBack].y
		titleCarsBack[#titleCarsBack].carTrans = transition.to( titleCarsBack[#titleCarsBack], { time=math.random(titleCarSpeedMin, titleCarSpeedMax), x = screenOriginX - 200, onComplete=titleRemoveCar } )
		titleGroupBack:insert( car )
	else
		titleCarsFront[#titleCarsFront+1] = car
		titleCarsFront[#titleCarsFront].x = screenOriginX - 200
		if (#titleCarsFront >= 2 and titleCarsFront[#titleCarsFront-1] and titleCarsFront[#titleCarsFront-1].x < screenOriginX) then
			titleCarsFront[#titleCarsFront].x = titleCarsFront[#titleCarsFront-1].x - 130
		end
		titleCarsFront[#titleCarsFront].y = halfH + 273 + titleVehicles[titleCurrentVehicle].offsetY
		titleCarsFront[#titleCarsFront].initY = titleCarsFront[#titleCarsFront].y
		titleCarsFront[#titleCarsFront].xScale = -1
		titleCarsFront[#titleCarsFront].carTrans = transition.to( titleCarsFront[#titleCarsFront], { time=math.random(titleCarSpeedMin, titleCarSpeedMax), x = screenEdgeX + 200, onComplete=titleRemoveCar } )
		titleGroupFront:insert( car )
	end
	
	
	for i = #titleCarsFront, 1, -1 do
		if (titleCarsFront[i]) then
			titleCarsFront[i]:toFront()
		end
	end
	
	
	titleCurrentVehicle = titleCurrentVehicle + 1
	if (titleCurrentVehicle > #titleVehicles) then
		titleCurrentVehicle = 1
	end
	


end


-- Loading Items

function loadGameSounds()

	cardHopSound = audio.loadSound("Audio/corner.mp3")
	explodeSound = audio.loadSound("Audio/pop1.mp3")
	attentionSound = audio.loadSound("Audio/pop.mp3")
	wiggleSound = audio.loadSound("Audio/wiggle.mp3")
	flipSound = audio.loadSound("Audio/flip.mp3")
	wrongSound = audio.loadSound("Audio/bwip.mp3")
	
	shortClapSound = audio.loadSound("Audio/soundShortClap.mp3")
	
	windSound = audio.loadSound("Audio/wind2.mp3")
	
	
	youreDoingGreatSound = audio.loadSound("Audio/youreDoingGreat.mp3")
	
	goodJobSounds = { audio.loadSound("Audio/goodJob.mp3"),
									audio.loadSound("Audio/terrific.mp3"),
									audio.loadSound("Audio/excellent.mp3"),
									audio.loadSound("Audio/wow.mp3"),
									audio.loadSound("Audio/great.mp3"),
									audio.loadSound("Audio/awesome.mp3"),
									audio.loadSound("Audio/yep.mp3"),
									audio.loadSound("Audio/youGotIt.mp3"),
									}
									
									
	correctCardSounds = { audio.loadSound("Audio/correct.mp3"),
												audio.loadSound("Audio/right.mp3"),
												audio.loadSound("Audio/youGotIt.mp3"),
												audio.loadSound("Audio/yep.mp3"),
	}
	
	correct = audio.loadSound("Audio/tinkle.mp3")
	
	hundredSounds = {	audio.loadSound("Audio/oneHundred2.mp3"),
											audio.loadSound("Audio/twoHundred.mp3"),
											audio.loadSound("Audio/threeHundred.mp3"),
											audio.loadSound("Audio/fourHundred.mp3"),
											audio.loadSound("Audio/fiveHundred.mp3"),
											audio.loadSound("Audio/sixHundred.mp3"),
											audio.loadSound("Audio/sevenHundred.mp3"),
											audio.loadSound("Audio/eightHundred.mp3"),
											audio.loadSound("Audio/nineHundred.mp3"),
											
	}
	
									

	gameSounds = { 
								zero = audio.loadSound("Audio/zero.mp3"),
								one = audio.loadSound("Audio/one.mp3"),
								two = audio.loadSound("Audio/two.mp3"),
								three = audio.loadSound("Audio/three.mp3"),
								four = audio.loadSound("Audio/four.mp3"),
								five = audio.loadSound("Audio/five.mp3"),
								six = audio.loadSound("Audio/six.mp3"),
								seven = audio.loadSound("Audio/seven.mp3"),
								eight = audio.loadSound("Audio/eight.mp3"),
								nine = audio.loadSound("Audio/nine.mp3"),
								ten = audio.loadSound("Audio/ten.mp3"),
								eleven = audio.loadSound("Audio/eleven.mp3"),
								twelve = audio.loadSound("Audio/twelve.mp3"),
								thirteen = audio.loadSound("Audio/thirteen.mp3"),
								fourteen = audio.loadSound("Audio/fourteen.mp3"),
								fifteen = audio.loadSound("Audio/fifteen.mp3"),
								sixteen = audio.loadSound("Audio/sixteen.mp3"),
								seventeen = audio.loadSound("Audio/seventeen.mp3"),
								eighteen = audio.loadSound("Audio/eighteen.mp3"),
								nineteen = audio.loadSound("Audio/nineteen.mp3"),
								twenty = audio.loadSound("Audio/twenty.mp3"),
								twentyOne = audio.loadSound("Audio/twentyOne.mp3"),
								twentyTwo = audio.loadSound("Audio/twentyTwo.mp3"),
								twentyThree = audio.loadSound("Audio/twentyThree.mp3"),
								twentyFour = audio.loadSound("Audio/twentyFour.mp3"),
								twentyFive = audio.loadSound("Audio/twentyFive.mp3"),
								twentySix = audio.loadSound("Audio/twentySix.mp3"),
								twentySeven = audio.loadSound("Audio/twentySeven.mp3"),
								twentyEight = audio.loadSound("Audio/twentyEight.mp3"),
								twentyNine = audio.loadSound("Audio/twentyNine.mp3"),
								thirty = audio.loadSound("Audio/thirty.mp3"),
								thirtyOne = audio.loadSound("Audio/thirtyOne.mp3"),
								thirtyTwo = audio.loadSound("Audio/thirtyTwo.mp3"),
								thirtyThree = audio.loadSound("Audio/thirtyThree.mp3"),
								thirtyFour = audio.loadSound("Audio/thirtyFour.mp3"),
								thirtyFive = audio.loadSound("Audio/thirtyFive.mp3"),
								thirtySix = audio.loadSound("Audio/thirtySix.mp3"),
								thirtySeven = audio.loadSound("Audio/thirtySeven.mp3"),
								thirtyEight = audio.loadSound("Audio/thirtyEight.mp3"),
								thirtyNine = audio.loadSound("Audio/thirtyNine.mp3"),
								forty = audio.loadSound("Audio/forty.mp3"),
								fortyOne = audio.loadSound("Audio/fortyOne.mp3"),
								fortyTwo = audio.loadSound("Audio/fortyTwo.mp3"),
								fortyThree = audio.loadSound("Audio/fortyThree.mp3"),
								fortyFour = audio.loadSound("Audio/fortyFour.mp3"),
								fortyFive = audio.loadSound("Audio/fortyFive.mp3"),
								fortySix = audio.loadSound("Audio/fortySix.mp3"),
								fortySeven = audio.loadSound("Audio/fortySeven.mp3"),
								fortyEight = audio.loadSound("Audio/fortyEight.mp3"),
								fortyNine = audio.loadSound("Audio/fortyNine.mp3"),
								fifty = audio.loadSound("Audio/fifty.mp3"),
								fiftyOne = audio.loadSound("Audio/fiftyOne.mp3"),
								fiftyTwo = audio.loadSound("Audio/fiftyTwo.mp3"),
								fiftyThree = audio.loadSound("Audio/fiftyThree.mp3"),
								fiftyFour = audio.loadSound("Audio/fiftyFour.mp3"),
								fiftyFive = audio.loadSound("Audio/fiftyFive.mp3"),
								fiftySix = audio.loadSound("Audio/fiftySix.mp3"),
								fiftySeven = audio.loadSound("Audio/fiftySeven.mp3"),
								fiftyEight = audio.loadSound("Audio/fiftyEight.mp3"),
								fiftyNine = audio.loadSound("Audio/fiftyNine.mp3"),
								sixty = audio.loadSound("Audio/sixty.mp3"),
								sixtyOne = audio.loadSound("Audio/sixtyOne.mp3"),
								sixtyTwo = audio.loadSound("Audio/sixtyTwo.mp3"),
								sixtyThree = audio.loadSound("Audio/sixtyThree.mp3"),
								sixtyFour = audio.loadSound("Audio/sixtyFour.mp3"),
								sixtyFive = audio.loadSound("Audio/sixtyFive.mp3"),
								sixtySix = audio.loadSound("Audio/sixtySix.mp3"),
								sixtySeven = audio.loadSound("Audio/sixtySeven.mp3"),
								sixtyEight = audio.loadSound("Audio/sixtyEight.mp3"),
								sixtyNine = audio.loadSound("Audio/sixtyNine.mp3"),
								seventy = audio.loadSound("Audio/seventy.mp3"),
								seventyOne = audio.loadSound("Audio/seventyOne.mp3"),
								seventyTwo = audio.loadSound("Audio/seventyTwo.mp3"),
								seventyThree = audio.loadSound("Audio/seventyThree.mp3"),
								seventyFour = audio.loadSound("Audio/seventyFour.mp3"),
								seventyFive = audio.loadSound("Audio/seventyFive.mp3"),
								seventySix = audio.loadSound("Audio/seventySix.mp3"),
								seventySeven = audio.loadSound("Audio/seventySeven.mp3"),
								seventyEight = audio.loadSound("Audio/seventyEight.mp3"),
								seventyNine = audio.loadSound("Audio/seventyNine.mp3"),
								eighty = audio.loadSound("Audio/eighty.mp3"),
								eightyOne = audio.loadSound("Audio/eightyOne.mp3"),
								eightyTwo = audio.loadSound("Audio/eightyTwo.mp3"),
								eightyThree = audio.loadSound("Audio/eightyThree.mp3"),
								eightyFour = audio.loadSound("Audio/eightyFour.mp3"),
								eightyFive = audio.loadSound("Audio/eightyFive.mp3"),
								eightySix = audio.loadSound("Audio/eightySix.mp3"),
								eightySeven = audio.loadSound("Audio/eightySeven.mp3"),
								eightyEight = audio.loadSound("Audio/eightyEight.mp3"),
								eightyNine = audio.loadSound("Audio/eightyNine.mp3"),
								ninety = audio.loadSound("Audio/ninety.mp3"),
								ninetyOne = audio.loadSound("Audio/ninetyOne.mp3"),
								ninetyTwo = audio.loadSound("Audio/ninetyTwo.mp3"),
								ninetyThree = audio.loadSound("Audio/ninetyThree.mp3"),
								ninetyFour = audio.loadSound("Audio/ninetyFour.mp3"),
								ninetyFive = audio.loadSound("Audio/ninetyFive.mp3"),
								ninetySix = audio.loadSound("Audio/ninetySix.mp3"),
								ninetySeven = audio.loadSound("Audio/ninetySeven.mp3"),
								ninetyEight = audio.loadSound("Audio/ninetyEight.mp3"),
								ninetyNine = audio.loadSound("Audio/ninetyNine.mp3"),
								oneHundred = audio.loadSound("Audio/oneHundred.mp3"),
								
								ones = audio.loadSound("Audio/ones.mp3"),
								twos = audio.loadSound("Audio/twos.mp3"),
								threes = audio.loadSound("Audio/threes.mp3"),
								fours = audio.loadSound("Audio/fours.mp3"),
								fives = audio.loadSound("Audio/fives.mp3"),
								sixes = audio.loadSound("Audio/sixes.mp3"),
								sevens = audio.loadSound("Audio/sevens.mp3"),
								eights = audio.loadSound("Audio/eights.mp3"),
								nines = audio.loadSound("Audio/nines.mp3"),
								tens = audio.loadSound("Audio/tens.mp3"),
								elevens = audio.loadSound("Audio/elevens.mp3"),
								twelves = audio.loadSound("Audio/twelves.mp3"),
								thirteens = audio.loadSound("Audio/thirteens.mp3"),
								fourteens = audio.loadSound("Audio/fourteens.mp3"),
								fifteens = audio.loadSound("Audio/fifteens.mp3"),
								sixteens = audio.loadSound("Audio/sixteens.mp3"),
								seventeens = audio.loadSound("Audio/seventeens.mp3"),
								eighteens = audio.loadSound("Audio/eighteens.mp3"),
								nineteens = audio.loadSound("Audio/nineteens.mp3"),
								twenties = audio.loadSound("Audio/twenties.mp3"),
								
								-- circleDonut = audio.loadSound("Audio/circleDonut.mp3"),
								-- circleTrain = audio.loadSound("Audio/circleTrain.mp3"),
								-- rhombusGem = audio.loadSound("Audio/rhombusGem.mp3"),
								-- rhombusTortilla = audio.loadSound("Audio/rhombusTortilla.mp3"),
								-- heartPillow = audio.loadSound("Audio/heartPillow.mp3"),
								-- heartLollipop = audio.loadSound("Audio/heartLollipop.mp3"),
								-- octagonPizza = audio.loadSound("Audio/octagonPizza.mp3"),
								-- octagonPuzzle = audio.loadSound("Audio/octagonPuzzle.mp3"),
								-- ovalBaby = audio.loadSound("Audio/ovalBaby.mp3"),
								-- ovalMelon = audio.loadSound("Audio/ovalMelon.mp3"),
								-- pentagonMaze = audio.loadSound("Audio/pentagonMaze.mp3"),
								-- pentagonToast = audio.loadSound("Audio/pentagonToast.mp3"),
								-- rectangleBus = audio.loadSound("Audio/rectangleBus.mp3"),
								-- rectangleCake = audio.loadSound("Audio/rectangleCake.mp3"),
								-- squareRobot = audio.loadSound("Audio/squareRobot.mp3"),
								-- squareWaffle = audio.loadSound("Audio/squareWaffle.mp3"),
								-- starBadge = audio.loadSound("Audio/starBadge.mp3"),
								-- starCookie = audio.loadSound("Audio/starCookie.mp3"),
								-- trianglePie = audio.loadSound("Audio/trianglePie.mp3"),
								-- triangleXylophone = audio.loadSound("Audio/triangleXylophone.mp3"),
								
								circleDonut = audio.loadSound("Audio/circleDonut.mp3"),
								ovalBaby = audio.loadSound("Audio/ovalBaby.mp3"),
								pentagonToast = audio.loadSound("Audio/pentagonToast.mp3"),
								squareRobot = audio.loadSound("Audio/squareRobot.mp3"),
								starCookie = audio.loadSound("Audio/starCookie.mp3"),
								triangleXylophone = audio.loadSound("Audio/triangleXylophone.mp3"),
								squareBlock = audio.loadSound("Audio/block.mp3"),
								circleClock = audio.loadSound("Audio/clock.mp3"),
								triangleCheese = audio.loadSound("Audio/cheese.mp3"),
								rectangleCookie = audio.loadSound("Audio/pastry.mp3"),
								ovalWatermelon = audio.loadSound("Audio/watermelonVO.mp3"),
								-- starCookie = audio.loadSound("Audio/starCookie.mp3"),
								heartStrawberry = audio.loadSound("Audio/strawberry.mp3"),
								diamondTortilla = audio.loadSound("Audio/tortilla.mp3"),
								octagonUmbrella = audio.loadSound("Audio/umbrella.mp3"),
								pentagonFlower = audio.loadSound("Audio/flower.mp3"),
								-- squareRobot = audio.loadSound("Audio/robot.mp3"),
								-- circleDonut = audio.loadSound("Audio/circleDonut.mp3"),
								-- triangleXylophone = audio.loadSound("Audio/triangleXylophone.mp3"),
								rectanglePizza = audio.loadSound("Audio/pizza.mp3"),
								-- ovalBaby = audio.loadSound("Audio/ovalBaby.mp3"),
								starStarfish = audio.loadSound("Audio/starFish.mp3"),
								heartCandy = audio.loadSound("Audio/candy.mp3"),
								diamondKite = audio.loadSound("Audio/kite.mp3"),
								octagonStopSign = audio.loadSound("Audio/stopSign.mp3"),
								-- pentagonToast = audio.loadSound("Audio/stars.mp3"),
								
								circle = audio.loadSound("Audio/circle.mp3"),
								rhombus = audio.loadSound("Audio/rhombus.mp3"),
								-- diamond = audio.loadSound("Audio/rhombus.mp3"),
								heart = audio.loadSound("Audio/heart.mp3"),
								octagon = audio.loadSound("Audio/octagon.mp3"),
								oval = audio.loadSound("Audio/oval.mp3"),
								pentagon = audio.loadSound("Audio/pentagon.mp3"),
								rectangle = audio.loadSound("Audio/rectangle.mp3"),
								square = audio.loadSound("Audio/square.mp3"),
								star = audio.loadSound("Audio/star.mp3"),
								triangle = audio.loadSound("Audio/triangle.mp3"),
								
								circles = audio.loadSound("Audio/circles.mp3"),
								squares = audio.loadSound("Audio/squares.mp3"),
								stars = audio.loadSound("Audio/stars.mp3"),
								triangles = audio.loadSound("Audio/triangles.mp3"),
								
								starCount = audio.loadSound("Audio/stars.mp3"),
								block = audio.loadSound("Audio/blocks.mp3"),
								smallHeart = audio.loadSound("Audio/hearts.mp3"),
								
								octagons = audio.loadSound("Audio/octagons.mp3"),
								ovals = audio.loadSound("Audio/ovals.mp3"),
								pentagons = audio.loadSound("Audio/pentagons.mp3"),
								rhombuses = audio.loadSound("Audio/rhombuses.mp3"),
								rectangles = audio.loadSound("Audio/rectangles.mp3"),
								
								-- oneFrog = audio.loadSound("Audio/frogs.mp3"),
								-- oneSun = audio.loadSound("Audio/oneSun.mp3"),
								-- twoBirds = audio.loadSound("Audio/twoBirds.mp3"),
								-- twoTractors = audio.loadSound("Audio/twoTractors.mp3"),
								-- twoGuitars = audio.loadSound("Audio/twoGuitars.mp3"),
								-- threeLadybugs = audio.loadSound("Audio/threeLadybugs.mp3"),
								-- threeSocks = audio.loadSound("Audio/threeSocks.mp3"),
								-- threeTomatoes = audio.loadSound("Audio/threeTomatoes.mp3"),
								-- fourCarrots = audio.loadSound("Audio/fourCarrots.mp3"),
								-- fourPigs = audio.loadSound("Audio/fourPigs.mp3"),
								-- fourCars = audio.loadSound("Audio/fourCars.mp3"),
								-- fiveWatermelons = audio.loadSound("Audio/fiveWatermelons.mp3"),
								-- fiveBalls = audio.loadSound("Audio/fiveBalls.mp3"),
								-- fivePuppies = audio.loadSound("Audio/fivePuppies.mp3"),
								-- sixDucks = audio.loadSound("Audio/sixDucks.mp3"),
								-- sixBunnies = audio.loadSound("Audio/sixBunnies.mp3"),
								-- sixBananas = audio.loadSound("Audio/sixBananas.mp3"),
								-- sevenBabies = audio.loadSound("Audio/sevenBabies.mp3"),
								-- sevenBalloons = audio.loadSound("Audio/sevenBalloons.mp3"),
								-- sevenHippos = audio.loadSound("Audio/sevenHippos.mp3"),
								-- eightDonuts = audio.loadSound("Audio/eightDonuts.mp3"),
								-- eightRobots = audio.loadSound("Audio/eightRobots.mp3"),
								-- eightApples = audio.loadSound("Audio/eightApples.mp3"),
								-- nineBears = audio.loadSound("Audio/nineBears.mp3"),
								-- nineMonsters = audio.loadSound("Audio/nineMonsters.mp3"),
								-- nineBoots = audio.loadSound("Audio/nineBoots.mp3"),
								-- tenCats = audio.loadSound("Audio/tenCats.mp3"),
								-- tenHearts = audio.loadSound("Audio/tenHearts.mp3"),
								-- tenElephants = audio.loadSound("Audio/tenElephants.mp3"),
								
								oneStrawberry = audio.loadSound("Audio/strawberry.mp3"),
								twoPastries = audio.loadSound("Audio/pastries.mp3"),
								threePears = audio.loadSound("Audio/pears.mp3"),
								fourWatermelonSlices = audio.loadSound("Audio/watermelons.mp3"),
								fiveBroccoli = audio.loadSound("Audio/broccoli.mp3"),
								sixCookies = audio.loadSound("Audio/starCookie.mp3"),
								sevenAcorns = audio.loadSound("Audio/acorns.mp3"),
								eightCherries = audio.loadSound("Audio/cherries.mp3"),
								nineEggplants = audio.loadSound("Audio/eggplant.mp3"),
								tenStarsCard = audio.loadSound("Audio/stars.mp3"),
								
								oneDuckCard = audio.loadSound("Audio/duck.mp3"),
								twoBalloonsCard = audio.loadSound("Audio/balloons.mp3"),
								threeYarnBallsCard = audio.loadSound("Audio/yarnBalls.mp3"),
								fourCarrotsCard = audio.loadSound("Audio/carrots.mp3"),
								fivePeppersCard = audio.loadSound("Audio/peppers.mp3"),
								sixGuitarsCard = audio.loadSound("Audio/twoGuitars.mp3"),
								sevenApplesCard = audio.loadSound("Audio/apples.mp3"),
								eightBallsCard = audio.loadSound("Audio/balls.mp3"),
								nineOrangesCard = audio.loadSound("Audio/oranges.mp3"),
								tenHeartsCard = audio.loadSound("Audio/hearts.mp3"),
								
								blue = audio.loadSound("Audio/blue.mp3"),
								red = audio.loadSound("Audio/red.mp3"),
								yellow = audio.loadSound("Audio/yellow.mp3"),
								green = audio.loadSound("Audio/green.mp3"),
								orange = audio.loadSound("Audio/orange.mp3"),
								purple = audio.loadSound("Audio/purple.mp3"),
								pink = audio.loadSound("Audio/pink.mp3"),
								brown = audio.loadSound("Audio/brown.mp3"),
								
								-- blueBird = audio.loadSound("Audio/blueBird.mp3"),
								-- blueCrayon = audio.loadSound("Audio/blueCrayon.mp3"),
								-- redTomato = audio.loadSound("Audio/redTomato.mp3"),
								-- redWagon = audio.loadSound("Audio/redWagon.mp3"),
								-- yellowBus = audio.loadSound("Audio/duck.mp3"),
								-- yellowSun = audio.loadSound("Audio/yellowSun.mp3"),
								-- greenFrog = audio.loadSound("Audio/greenFrog.mp3"),
								-- greenTractor = audio.loadSound("Audio/greenTractor.mp3"),
								-- orangeCat = audio.loadSound("Audio/orangeCat.mp3"),
								-- orangePumpkin = audio.loadSound("Audio/orangePumpkin.mp3"),
								-- purpleBackpack = audio.loadSound("Audio/purpleBackpack.mp3"),
								-- purpleGrapes = audio.loadSound("Audio/purpleGrapes.mp3"),
								-- pinkFlower = audio.loadSound("Audio/pinkFlower.mp3"),
								-- pinkPig = audio.loadSound("Audio/pinkPig.mp3"),
								-- brownCoconut = audio.loadSound("Audio/brownCoconut.mp3"),
								-- brownPuppy = audio.loadSound("Audio/brownPuppy.mp3"),
								
								blueOwl = audio.loadSound("Audio/owlVO.mp3"),
								blueCrayon = audio.loadSound("Audio/blueCrayon.mp3"),
								redHeart = audio.loadSound("Audio/heart.mp3"),
								redBird = audio.loadSound("Audio/bird.mp3"),
								redTomato = audio.loadSound("Audio/redTomato.mp3"),
								redWagon = audio.loadSound("Audio/redWagon.mp3"),
								yellowBus = audio.loadSound("Audio/duck.mp3"),
								yellowSun = audio.loadSound("Audio/yellowSun.mp3"),
								yellowDuck = audio.loadSound("Audio/duck.mp3"),
								yellowStar = audio.loadSound("Audio/star.mp3"),
								greenFrog = audio.loadSound("Audio/greenFrog.mp3"),
								greenTractor = audio.loadSound("Audio/greenTractor.mp3"),
								greenBroccoli = audio.loadSound("Audio/broccoli.mp3"),
								orangeCat = audio.loadSound("Audio/orangeCat.mp3"),
								orangePumpkin = audio.loadSound("Audio/orangePumpkin.mp3"),
								orangeOrange = audio.loadSound("Audio/orange.mp3"),
								purpleBackpack = audio.loadSound("Audio/purpleBackpack.mp3"),
								purpleGrapes = audio.loadSound("Audio/purpleGrapes.mp3"),
								pinkFlower = audio.loadSound("Audio/pinkFlower.mp3"),
								pinkPig = audio.loadSound("Audio/pinkPig.mp3"),
								brownCoconut = audio.loadSound("Audio/brownCoconut.mp3"),
								brownPuppy = audio.loadSound("Audio/brownPuppy.mp3"),
								brownBarrel = audio.loadSound("Audio/barrel.mp3"),
								
								patternCookie9 = audio.loadSound("Audio/starCookie.mp3"),
								patternBanana = audio.loadSound("Audio/banana.mp3"),
								patternCookie2 = audio.loadSound("Audio/starCookie.mp3"),
								patternCookie1 = audio.loadSound("Audio/iceCreamCone.mp3"),
								patternCookie11 = audio.loadSound("Audio/starCookie.mp3"),
								patternCorn = audio.loadSound("Audio/corn.mp3"),
								
								candy = audio.loadSound("Audio/candy.mp3"),
								cake = audio.loadSound("Audio/cake.mp3"),
								iceCream = audio.loadSound("Audio/iceCreamCone.mp3"),
								corn = audio.loadSound("Audio/corn.mp3"),
								pumpkin = audio.loadSound("Audio/pumpkin.mp3"),
								cherry = audio.loadSound("Audio/cherry.mp3"),
								
								orangeBall = audio.loadSound("Audio/orangeBasketball.mp3"),
								blueOwlColor = audio.loadSound("Audio/blueOwl.mp3"),
								brownAcorn = audio.loadSound("Audio/brownAcorn.mp3"),
								yellowBanana = audio.loadSound("Audio/yellowBanana.mp3"),
								redBirdColor = audio.loadSound("Audio/redBird.mp3"),
								purpleEggplant = audio.loadSound("Audio/purpleEggplant.mp3"),
								greenLeaf = audio.loadSound("Audio/greenLeaf.mp3"),
								
								
								
								
								
								
								xylophones = audio.loadSound("Audio/xylophones.mp3"),
								frogs = audio.loadSound("Audio/frogs.mp3"),
								balls = audio.loadSound("Audio/balls.mp3"),
								carrots = audio.loadSound("Audio/carrots.mp3"),
								babies = audio.loadSound("Audio/babies.mp3"),
								flowers = audio.loadSound("Audio/flowers.mp3"),
								apples = audio.loadSound("Audio/apples.mp3"),
								bananas = audio.loadSound("Audio/bananas.mp3"),
								apple = audio.loadSound("Audio/apple.mp3"),
								banana = audio.loadSound("Audio/banana.mp3"),
								cakes = audio.loadSound("Audio/rectangleCake.mp3"),
								pies = audio.loadSound("Audio/trianglePie.mp3"),
								cookies = audio.loadSound("Audio/starCookie.mp3"),
								pizzas = audio.loadSound("Audio/octagonPizza.mp3"),
								waffles = audio.loadSound("Audio/squareWaffle.mp3"),
								
								chompGulp = audio.loadSound("Audio/chompGulp.mp3"),
								laughSillyB = audio.loadSound("Audio/laughSillyB.mp3"),
								windSound = audio.loadSound("Audio/wind2.mp3"),
								partyHorn = audio.loadSound("Audio/partyHorn.mp3"),
								cartoon = audio.loadSound("Audio/cartoon1.mp3"),
								gatorWow = audio.loadSound("Audio/gatorWow.mp3"),
								
								twoToothbrushes = audio.loadSound("Audio/toothbrushes.mp3"),
								twoBoots = audio.loadSound("Audio/boots.mp3"),
								fiveTomatoes = audio.loadSound("Audio/tomatoes.mp3"),
								fiveBackpacks = audio.loadSound("Audio/backpacks.mp3"),
								tenStars = audio.loadSound("Audio/stars.mp3"),
								tenBalloons = audio.loadSound("Audio/balloons.mp3"),
								
								owlVO = audio.loadSound("Audio/owlVO.mp3"),
								barrel = audio.loadSound("Audio/barrel.mp3"),
								leaf = audio.loadSound("Audio/leaf.mp3"),
								acorn = audio.loadSound("Audio/acorn.mp3"),
								eggplant = audio.loadSound("Audio/eggplant.mp3"),
								
								watermelon = audio.loadSound("Audio/watermelon.mp3"),
								watermelonSlices = audio.loadSound("Audio/watermelons.mp3"),
								
								strawberry = audio.loadSound("Audio/strawberry.mp3"),
								strawberries = audio.loadSound("Audio/strawberries.mp3"),
								
								hearts = audio.loadSound("Audio/tenHearts.mp3"),
								
								pepper = audio.loadSound("Audio/pepper.mp3"),
								peppers = audio.loadSound("Audio/peppers.mp3"),
								raspberry = audio.loadSound("Audio/raspberry.mp3"),
								raspberries = audio.loadSound("Audio/raspberries.mp3"),
								oranges = audio.loadSound("Audio/oranges.mp3"),
			
								heartReward = audio.loadSound("Audio/kiss.mp3"),
								starReward = audio.loadSound("Audio/magic3.mp3"),
			
								chomp = audio.loadSound("Audio/chomp.mp3"),
								poof = audio.loadSound("Audio/poof.mp3"),
								balloonPop = audio.loadSound("Audio/balloonPop.mp3"),
								foodCrunch = audio.loadSound("Audio/foodCrunch.mp3"),
								gulp = audio.loadSound("Audio/gulpShort.mp3"),
								laughSilly3 = audio.loadSound("Audio/laughSilly3.mp3"),
								laughSillyB = audio.loadSound("Audio/laughSillyB.mp3"),
								spin = audio.loadSound("Audio/spin.mp3"),
								
								trueSound = audio.loadSound("Audio/true.mp3"),
								falseSound = audio.loadSound("Audio/false.mp3"),
								
								plus = audio.loadSound("Audio/plus.mp3"),
								minus = audio.loadSound("Audio/minus.mp3"),
			
							}
	
	
		gameSoundsSingular = {
		
			starCount = audio.loadSound("Audio/star.mp3"),
			block = audio.loadSound("Audio/block.mp3"),
			smallHeart = audio.loadSound("Audio/heart.mp3"),
			
		}
	
								
								
		gameNumSounds = { audio.loadSound("Audio/one.mp3"),
								audio.loadSound("Audio/two.mp3"),
								audio.loadSound("Audio/three.mp3"),
								audio.loadSound("Audio/four.mp3"),
								audio.loadSound("Audio/five.mp3"),
								audio.loadSound("Audio/six.mp3"),
								audio.loadSound("Audio/seven.mp3"),
								audio.loadSound("Audio/eight.mp3"),
								audio.loadSound("Audio/nine.mp3"),
								audio.loadSound("Audio/ten.mp3"),
								audio.loadSound("Audio/eleven.mp3"),
								audio.loadSound("Audio/twelve.mp3"),
								audio.loadSound("Audio/thirteen.mp3"),
								audio.loadSound("Audio/fourteen.mp3"),
								audio.loadSound("Audio/fifteen.mp3"),
								audio.loadSound("Audio/sixteen.mp3"),
								audio.loadSound("Audio/seventeen.mp3"),
								audio.loadSound("Audio/eighteen.mp3"),
								audio.loadSound("Audio/nineteen.mp3"),
								audio.loadSound("Audio/twenty.mp3"),
								audio.loadSound("Audio/twentyOne.mp3"),
								audio.loadSound("Audio/twentyTwo.mp3"),
								audio.loadSound("Audio/twentyThree.mp3"),
								audio.loadSound("Audio/twentyFour.mp3"),
								audio.loadSound("Audio/twentyFive.mp3"),
								audio.loadSound("Audio/twentySix.mp3"),
								audio.loadSound("Audio/twentySeven.mp3"),
								audio.loadSound("Audio/twentyEight.mp3"),
								audio.loadSound("Audio/twentyNine.mp3"),
								audio.loadSound("Audio/thirty.mp3"),
								audio.loadSound("Audio/thirtyOne.mp3"),
								audio.loadSound("Audio/thirtyTwo.mp3"),
								audio.loadSound("Audio/thirtyThree.mp3"),
								audio.loadSound("Audio/thirtyFour.mp3"),
								audio.loadSound("Audio/thirtyFive.mp3"),
								audio.loadSound("Audio/thirtySix.mp3"),
								audio.loadSound("Audio/thirtySeven.mp3"),
								audio.loadSound("Audio/thirtyEight.mp3"),
								audio.loadSound("Audio/thirtyNine.mp3"),
								audio.loadSound("Audio/forty.mp3"),
								audio.loadSound("Audio/fortyOne.mp3"),
								audio.loadSound("Audio/fortyTwo.mp3"),
								audio.loadSound("Audio/fortyThree.mp3"),
								audio.loadSound("Audio/fortyFour.mp3"),
								audio.loadSound("Audio/fortyFive.mp3"),
								audio.loadSound("Audio/fortySix.mp3"),
								audio.loadSound("Audio/fortySeven.mp3"),
								audio.loadSound("Audio/fortyEight.mp3"),
								audio.loadSound("Audio/fortyNine.mp3"),
								audio.loadSound("Audio/fifty.mp3"),
								audio.loadSound("Audio/fiftyOne.mp3"),
								audio.loadSound("Audio/fiftyTwo.mp3"),
								audio.loadSound("Audio/fiftyThree.mp3"),
								audio.loadSound("Audio/fiftyFour.mp3"),
								audio.loadSound("Audio/fiftyFive.mp3"),
								audio.loadSound("Audio/fiftySix.mp3"),
								audio.loadSound("Audio/fiftySeven.mp3"),
								audio.loadSound("Audio/fiftyEight.mp3"),
								audio.loadSound("Audio/fiftyNine.mp3"),
								audio.loadSound("Audio/sixty.mp3"),
								audio.loadSound("Audio/sixtyOne.mp3"),
								audio.loadSound("Audio/sixtyTwo.mp3"),
								audio.loadSound("Audio/sixtyThree.mp3"),
								audio.loadSound("Audio/sixtyFour.mp3"),
								audio.loadSound("Audio/sixtyFive.mp3"),
								audio.loadSound("Audio/sixtySix.mp3"),
								audio.loadSound("Audio/sixtySeven.mp3"),
								audio.loadSound("Audio/sixtyEight.mp3"),
								audio.loadSound("Audio/sixtyNine.mp3"),
								audio.loadSound("Audio/seventy.mp3"),
								audio.loadSound("Audio/seventyOne.mp3"),
								audio.loadSound("Audio/seventyTwo.mp3"),
								audio.loadSound("Audio/seventyThree.mp3"),
								audio.loadSound("Audio/seventyFour.mp3"),
								audio.loadSound("Audio/seventyFive.mp3"),
								audio.loadSound("Audio/seventySix.mp3"),
								audio.loadSound("Audio/seventySeven.mp3"),
								audio.loadSound("Audio/seventyEight.mp3"),
								audio.loadSound("Audio/seventyNine.mp3"),
								audio.loadSound("Audio/eighty.mp3"),
								audio.loadSound("Audio/eightyOne.mp3"),
								audio.loadSound("Audio/eightyTwo.mp3"),
								audio.loadSound("Audio/eightyThree.mp3"),
								audio.loadSound("Audio/eightyFour.mp3"),
								audio.loadSound("Audio/eightyFive.mp3"),
								audio.loadSound("Audio/eightySix.mp3"),
								audio.loadSound("Audio/eightySeven.mp3"),
								audio.loadSound("Audio/eightyEight.mp3"),
								audio.loadSound("Audio/eightyNine.mp3"),
								audio.loadSound("Audio/ninety.mp3"),
								audio.loadSound("Audio/ninetyOne.mp3"),
								audio.loadSound("Audio/ninetyTwo.mp3"),
								audio.loadSound("Audio/ninetyThree.mp3"),
								audio.loadSound("Audio/ninetyFour.mp3"),
								audio.loadSound("Audio/ninetyFive.mp3"),
								audio.loadSound("Audio/ninetySix.mp3"),
								audio.loadSound("Audio/ninetySeven.mp3"),
								audio.loadSound("Audio/ninetyEight.mp3"),
								audio.loadSound("Audio/ninetyNine.mp3"),
								audio.loadSound("Audio/oneHundred.mp3"),
								
								}
						
	
	-- one = audio.loadSound("Audio/one.mp3")
	-- two = audio.loadSound("Audio/two.mp3")
	-- three = audio.loadSound("Audio/three.mp3")
end

function loadMenuSounds()	
	--music audio
	--askMeDrumsSound = audio.loadSound("Audio/askMeDrums.mp3")
	--askMeBassSound = audio.loadSound("Audio/askMeBass.mp3")
	--askMeTimerSound = audio.loadSound("Audio/askMeTimer.mp3")
	
	-- bgOneMusic = audio.loadSound("Audio/jazzAction.mp3")
	-- bgFiveMusic = audio.loadSound("Audio/farm.mp3")
	-- bgSixMusic = audio.loadSound("Audio/farm.mp3")
	-- bgSevenMusic = audio.loadSound("Audio/farm.mp3")
	
	numberWords = {
	
		"zero",
		"one",
		"two",
		"three",
		"four",
		"five",
		"six",
		"seven",
		"eight",
		"nine",
		"ten",
		"eleven",
		"twelve",
		"thirteen",
		"fourteen",
		"fifteen",
		"sixteen",
		"seventeen",
		"eighteen",
		"nineteen",
		"twenty"
		
	}
	
	victoryMusicSound = audio.loadSound("Audio/endStinger2.mp3")
	magicSound = audio.loadSound("Audio/magic2.mp3")
	unlockSound = audio.loadSound("Audio/magic2.mp3")
	harpTransitionSound = audio.loadSound("Audio/letsDoIt.mp3")
	completedSound = audio.loadSound("Audio/alarm.mp3")
	
	planeSound = audio.loadSound("Audio/plane.mp3")
	
	correctGateSound = audio.loadSound("Audio/xyloUp.mp3")
	wrongGateSound = audio.loadSound("Audio/bwip.mp3")
	
	showMeButtonSound = audio.loadSound("Audio/showMe.mp3")
	
	numbersAndNumbersInstructions = audio.loadSound("Audio/matchTheNumberCards.mp3")
	numbersAndGroupsInstructions = audio.loadSound("Audio/touchANumberThenItems.mp3")
	numbersAndGroupsInstructions2 = audio.loadSound("Audio/pickANumberThenACard.mp3")
	groupsAndGroupsInstructions = audio.loadSound("Audio/matchPictureCardsThatHaveTheSameNumberOfItems.mp3")
	shapesMatchingInstructions = audio.loadSound("Audio/findTheMatchingShapes.mp3")
	colorsMatchingInstructions = audio.loadSound("Audio/findTheMatchingColors.mp3")
	itemMatchingInstructions = audio.loadSound("Audio/findTheMatchingItems.mp3")
	shapesAndItemsMatchingInstructions = audio.loadSound("Audio/touchAShapeThenAnotherCard.mp3")
	shapesAndItemsMatchingInstructions2 = audio.loadSound("Audio/pickAShapeThenAnotherCard.mp3")
	colorsAndItemsMatchingInstructions = audio.loadSound("Audio/touchAColorThenAnotherCard.mp3")
	colorsAndItemsMatchingInstructions2 = audio.loadSound("Audio/pickAColorThenAnotherCard.mp3")
	colorItemsMatchingInstructions = audio.loadSound("Audio/touchAColorItemThenAnotherCard.mp3")
	colorItemsMatchingInstructions2 = audio.loadSound("Audio/pickAColorThenAnotherCard.mp3")
	
	equationsAnswersShowMeInstructions = audio.loadSound("Audio/touchAnEquationThenTheCardWithTheAnswer.mp3")
	equationsAnswersShowMeInstructions2 = audio.loadSound("Audio/pickAnEquation.mp3")
	equationsAnswersMatchInstructions = audio.loadSound("Audio/matchEquationsToTheirAnswer.mp3")
	
	matchTheShapeCards = audio.loadSound("Audio/matchTheShapeCards.mp3")
	matchTheColorCards = audio.loadSound("Audio/colorsInstructions.mp3")
	
	
	-- heresAnotherOne = audio.loadSound("Audio/heresAnotherOne.mp3")
	
	solveTheEquationSound = { audio.loadSound("Audio/keepItUp.mp3"),
													-- audio.loadSound("Audio/heresAnotherOne.mp3"),
													audio.loadSound("Audio/solveTheEquation.mp3")
	}
	
	whatComesNextSound = { audio.loadSound("Audio/whatComesNext.mp3"),
												-- audio.loadSound("Audio/heresAnotherOne.mp3")
	}
	
	whatsMissingSound ={  audio.loadSound("Audio/whatsMissing.mp3"),
											-- audio.loadSound("Audio/heresAnotherOne.mp3"),
	}
	
	whichOneIsDifferentSound = { audio.loadSound("Audio/whichOneIsDifferent.mp3"),
														audio.loadSound("Audio/whichOneIsDifferent2.mp3")
	
	}
	
	howManySound = audio.loadSound("Audio/howMany.mp3")
	whichCardMostSound = audio.loadSound("Audio/whichCardMost.mp3")
	whichCardLeastSound = audio.loadSound("Audio/whichCardLeast.mp3")
	whichNumIsGreater = audio.loadSound("Audio/whichNumberIsGreater.mp3")
	whichNumIsLess = audio.loadSound("Audio/whichNumberIsLess.mp3")
	whichNumIsGreatest = audio.loadSound("Audio/whichNumberIsGreatest.mp3")
	whichNumIsLeast = audio.loadSound("Audio/whichNumberIsLeast.mp3")
	whichNumberFirstSound = audio.loadSound("Audio/whichNumberFirst.mp3")
	whichNumberLastSound = audio.loadSound("Audio/whichNumberLast.mp3")
	whichTwoAddSound = audio.loadSound("Audio/whichTwoAdd.mp3")
	whichThreeAddSound = audio.loadSound("Audio/whichThreeAddUpTo.mp3")
	whichOneIsASound = audio.loadSound("Audio/whichOneIsA.mp3")
	whichOneIsAnSound = audio.loadSound("Audio/whichOneIsAn.mp3")
	howManyAreSound = audio.loadSound("Audio/howManyAre.mp3")
	-- solveTheEquationSound = audio.loadSound("Audio/solveTheEquation.mp3")
	countingSound = audio.loadSound("Audio/touchTheNumbersInOrder.mp3")
	countingSound2 = audio.loadSound("Audio/pickTheNumbersInOrder.mp3")
	
	whichOneIsSound = audio.loadSound("Audio/whichOneIs.mp3")
	whichOneIsASound = audio.loadSound("Audio/whichOneIsA.mp3")
	whichOneIsAnSound = audio.loadSound("Audio/whichOneIsAn.mp3")
	
	lessThanSound = audio.loadSound("Audio/lessThan.mp3")
	moreThanSound = audio.loadSound("Audio/moreThan.mp3")
	
	whichOneIsBigger = audio.loadSound("Audio/whichOneIsBigger.mp3")
	whichOneIsSmaller = audio.loadSound("Audio/whichOneIsSmaller.mp3")
	
	whichOneIsBiggest = audio.loadSound("Audio/whichOneIsBiggest.mp3")
	whichOneIsSmallest = audio.loadSound("Audio/whichOneIsSmallest.mp3")
	
	pickTheEven = audio.loadSound("Audio/pickTheEvenNumbers.mp3")
	pickTheOdd = audio.loadSound("Audio/pickTheOddNumbers.mp3")
	
	dragSound = audio.loadSound("Audio/drag.mp3")
	putSound = audio.loadSound("Audio/put1.mp3")
	canYouDragSound = audio.loadSound("Audio/canYouDrag.mp3")
	toTheBasket = audio.loadSound("Audio/toTheBasket.mp3")
	toTheBasket2 = audio.loadSound("Audio/toTheBasket2.mp3")
	
	whichBalloonHas = audio.loadSound("Audio/whichBalloonHas.mp3")
	popTheBalloonWith = audio.loadSound("Audio/popTheBalloonWith.mp3")
	whichBubbleHas = audio.loadSound("Audio/whichBubbleHas.mp3")
	popTheBubbleWith = audio.loadSound("Audio/popTheBubbleWith.mp3")
	whichCloudHas = audio.loadSound("Audio/whichCloudHas.mp3")
	popTheCloudWith = audio.loadSound("Audio/popTheCloudWith.mp3")
	
	canYouPutTheNumber = audio.loadSound("Audio/canYouPutTheNumberBackTogether.mp3")
	putTheNumberBack = audio.loadSound("Audio/putTheNumberBackTogether.mp3")
	
	canYouPutThePuzzle = audio.loadSound("Audio/canYouPutThePuzzleBackTogether.mp3")
	putThePuzzleBack = audio.loadSound("Audio/putThePuzzleBackTogether.mp3")
	
	completeThePuzzle = audio.loadSound("Audio/completeThePuzzle.mp3")
	
	buildTheNumber1 = audio.loadSound("Audio/buildTheNumber1.mp3")
	buildTheNumber2 = audio.loadSound("Audio/buildTheNumber2.mp3")
	
	putTheNumbersInOrder = audio.loadSound("Audio/putTheNumbersInOrder.mp3")
	
	canPutBackNum = audio.loadSound("Audio/canYouPutTheNumbersBack.mp3")
	canPutBackNumBelong = audio.loadSound("Audio/canYouPutTheNumbersBackWhereTheyBelong.mp3")
	putTheNumbersBelong = audio.loadSound("Audio/putTheNumbersWhereTheyBelong.mp3")
	
	pickTheNumbersGreaterThan = audio.loadSound("Audio/pickTheNumbersThatAreGreaterThan.mp3")
	pickTheNumbersLessThan = audio.loadSound("Audio/pickTheNumbersThatAreLessThan.mp3")
	
	
	touchAllThe = audio.loadSound("Audio/touchAllThe2.mp3")
	pickAllThe = audio.loadSound("Audio/pickAllThe.mp3")
	items = audio.loadSound("Audio/items.mp3")
	cards2 = audio.loadSound("Audio/cards.mp3")
	
	touchThe = audio.loadSound("Audio/touchThe.mp3")
	canYouTouchThe = audio.loadSound("Audio/canYouTouchThe.mp3")
	canYouPickThe = audio.loadSound("Audio/canYouPickThe.mp3")
	-- thisIsA = audio.loadSound("Audio/thisIsA.mp3")
	nowTouchThe = audio.loadSound("Audio/nowTouchThe.mp3")
	
	pickThe = audio.loadSound("Audio/pickThe.mp3")
	nowPickThe = audio.loadSound("Audio/nowPickThe.mp3")
	
	
	findThe = audio.loadSound("Audio/findThe.mp3")
	nowFindThe = audio.loadSound("Audio/nowFindThe.mp3")
	
	trueOrFalseSound = audio.loadSound("Audio/trueOrFalse.mp3")
	
	uhOhSound = audio.loadSound("Audio/uhOh.mp3")
	whoaSound = audio.loadSound("Audio/whoa.mp3")
	
	canYouPutShapesBack = audio.loadSound("Audio/canYouPutTheShapesBackWhereTheyBelong.mp3")
	putTheShapesBack = audio.loadSound("Audio/putTheShapesBackWhereTheyBelong.mp3")
	
	solveWordProblemSound = audio.loadSound("Audio/solveTheWordProblem.mp3")
	
	howManyMoreBananasSound = audio.loadSound("Audio/howManyMoreBananas.mp3")
	howManyMoreApplesSound = audio.loadSound("Audio/howManyMoreApples.mp3")
	howManyBananasSound = audio.loadSound("Audio/howManyBananasTakeAway.mp3")
	howManyApplesSound = audio.loadSound("Audio/howManyApplesTakeAway.mp3")
	
	putTheNumbersGreaterThan = audio.loadSound("Audio/putNumbersGreaterThan.mp3")
	putTheNumbersLessThan = audio.loadSound("Audio/putNumbersLessThan.mp3")
	intoTheBasket = audio.loadSound("Audio/intoTheBasket.mp3")
	
	introSounds = {				
								-- intro1 = audio.loadSound("Audio/intro9.mp3"), -- Ralphie from Animal Math 1
								-- intro2 = audio.loadSound("Audio/intro20.mp3"), -- Sunshine from Pre-K 2
								-- intro3 = audio.loadSound("Audio/intro2.mp3"), -- Percival 3
								-- intro4 = audio.loadSound("Audio/intro3.mp3"), -- Chauncey 4
								-- intro5 = audio.loadSound("Audio/intro19.mp3"), -- Ralphie 5
							
								-- intro6 = audio.loadSound("Audio/intro12.mp3"), -- Oliver from Pre-K 6
								-- intro7 = audio.loadSound("Audio/intro5.mp3"), -- Chip 7
								-- intro8 = audio.loadSound("Audio/intro10.mp3"), -- Sunshine from Pre-K 8
								-- intro9 = audio.loadSound("Audio/intro21.mp3"), -- Percival 9
								-- intro10 = audio.loadSound("Audio/intro13.mp3"), -- Pete from Animal Math 10
								
								-- intro11 = audio.loadSound("Audio/intro5.mp3"), -- Chip 11
								-- intro12 = audio.loadSound("Audio/intro20.mp3"), -- Sunshine from Pre-K 12
								-- intro13 = audio.loadSound("Audio/intro3.mp3"), -- Chauncey 13 
								-- intro14 = audio.loadSound("Audio/intro14.mp3"), -- Oleg from Pre-K 14
								-- intro15 = audio.loadSound("Audio/intro15.mp3"), -- Cordelia from Pre-K 15
								
								-- intro16 = audio.loadSound("Audio/intro1.mp3"), -- Ralphie 16								
								-- intro17 = audio.loadSound("Audio/intro2.mp3"), -- Percival 17
								-- intro18 = audio.loadSound("Audio/intro3.mp3"), -- Chauncey 18
								-- intro19 = audio.loadSound("Audio/intro24.mp3"), -- Webster from Pre-K 19
								-- intro20 = audio.loadSound("Audio/intro17.mp3"), -- Chloe from Pre-K 20
								
								-- intro21 = audio.loadSound("Audio/intro21.mp3"), -- Percival 21
								-- intro22 = audio.loadSound("Audio/intro6.mp3"), -- Oleg 22								
								-- intro23 = audio.loadSound("Audio/intro4.mp3"), -- Webster 23
								-- intro24 = audio.loadSound("Audio/intro17.mp3"), -- Chloe from Pre-K 24
								-- intro25 = audio.loadSound("Audio/intro2.mp3"), -- Percival 25
								
								-- intro26 = audio.loadSound("Audio/intro3.mp3"), -- Chauncey 26
								-- intro27 = audio.loadSound("Audio/intro18.mp3"), -- Cordelia from Animal Math 27								
								-- intro28 = audio.loadSound("Audio/intro17.mp3"), -- Chloe from Pre-K 28
								-- intro29 = audio.loadSound("Audio/intro3.mp3"), -- Chauncey 29
								-- intro30 = audio.loadSound("Audio/intro7.mp3"), -- Sunshine 30
								
								-- intro31 = audio.loadSound("Audio/intro21.mp3"), -- Percival 31
								-- intro32 = audio.loadSound("Audio/intro4.mp3"), -- Webster 32								
								-- intro33 = audio.loadSound("Audio/intro3.mp3"), -- Chauncey 33
								-- intro34 = audio.loadSound("Audio/intro18.mp3"), -- Cordelia from Animal Math 34
								-- intro35 = audio.loadSound("Audio/intro20.mp3"), -- Sunshine 35
								
								-- intro36 = audio.loadSound("Audio/intro8.mp3"), -- Pete 36
								-- intro37 = audio.loadSound("Audio/intro2.mp3"), -- Percival 37
								-- intro38 = audio.loadSound("Audio/intro18.mp3"), -- Cordelia from Animal Math 38
								-- intro39 = audio.loadSound("Audio/intro3.mp3"), -- Chauncey 39
								-- intro40 = audio.loadSound("Audio/intro2.mp3"), -- Pete from Animal Math 40
								
								-- intro41 = audio.loadSound("Audio/intro23.mp3"), -- Oliver 41
								-- intro42 = audio.loadSound("Audio/intro25.mp3"), -- Chip 42							
								-- intro43 = audio.loadSound("Audio/intro2.mp3"), -- Percival 43
								-- intro44 = audio.loadSound("Audio/intro13.mp3"), -- Pete from Animal Math 44
								-- intro45 = audio.loadSound("Audio/intro3.mp3"), -- Chauncey 45
								
								-- intro46 = audio.loadSound("Audio/intro18.mp3"), -- Cordelia from Animal Math 46
								-- intro47 = audio.loadSound("Audio/intro7.mp3"), -- Sunshine 47							
								-- intro48 = audio.loadSound("Audio/intro8.mp3"), -- Pete 48
								-- intro49 = audio.loadSound("Audio/intro15.mp3"), -- Cordelia from Pre-K 49
								-- intro50 = audio.loadSound("Audio/intro2.mp3"), -- Percival 50
								
								
								
								-- repeated levels
								-- intro51 = audio.loadSound("Audio/intro1.mp3"), -- Ralphie 51
								-- intro52 = audio.loadSound("Audio/intro21.mp3"), -- Percival 52
								-- intro53 = audio.loadSound("Audio/intro3.mp3"), -- Chauncey 53
								-- intro54 = audio.loadSound("Audio/intro4.mp3"), -- Webster 54
								-- intro55 = audio.loadSound("Audio/intro5.mp3"), -- Chip 55
								-- intro56 = audio.loadSound("Audio/intro6.mp3"), -- Oleg 56
								-- intro57 = audio.loadSound("Audio/intro20.mp3"), -- Sunshine 57
								-- intro58 = audio.loadSound("Audio/intro22.mp3"), -- Pete 58
								
								
								welcomeToTheBigCityGoRalphie = audio.loadSound("Audio/welcomeToTheBigCityGoRalphie.mp3"),
								biggerOrSmallerOliversAnExpert = audio.loadSound("Audio/biggerOrSmallerOliversAnExpert.mp3"),
								itsYourTurnOliverYouReady = audio.loadSound("Audio/itsYourTurnOliverYouReady.mp3"),
								
								okayPercivalItsYourTurnBiggerOrSmaller = audio.loadSound("Audio/okayPercivalItsYourTurnBiggerOrSmaller.mp3"),
								
								itsTimeToPracticeShapesYouReadyChip = audio.loadSound("Audio/itsTimeToPracticeShapesYouReadyChip.mp3"),
								numbersColorsAndShapesLetsDoItOleg = audio.loadSound("Audio/numbersColorsAndShapesLetsDoItOleg.mp3"),
								hiWebsterReadyToPlaySomeShapeGames = audio.loadSound("Audio/hiWebsterReadyToPlaySomeShapeGames.mp3"),
								okayPercivalItsYourTurnOffToSchool = audio.loadSound("Audio/okayPercivalItsYourTurnOffToSchool.mp3"),
								itsTimeToTestOurSkillsSunshineLetsDoIt = audio.loadSound("Audio/itsTimeToTestOurSkillsSunshineLetsDoIt.mp3"),
								hiChaunceyCanYouSpotTheDifference = audio.loadSound("Audio/hiChaunceyCanYouSpotTheDifference.mp3"),
								
								hiChaunceyCountingIsSoMuchFun = audio.loadSound("Audio/hiChaunceyCountingIsSoMuchFun.mp3"),
								
								countingIsSoMuchFunLetsGoOleg = audio.loadSound("Audio/countingIsSoMuchFunLetsGoOleg.mp3"),
								puttingNumbersTogetherIsFunLetsGoRalphie = audio.loadSound("Audio/puttingNumbersTogetherIsFunLetsGoRalphie.mp3"),
								cmonBellaFlexYourBrainYoureDoingGreat = audio.loadSound("Audio/cmonBellaFlexYourBrainYoureDoingGreat.mp3"),
								chloeLovesSolvingNumberPuzzlesWannaPlayAlong = audio.loadSound("Audio/chloeLovesSolvingNumberPuzzlesWannaPlayAlong.mp3"),
								ohHiyaChipWeCanTestOurSkillsTogether = audio.loadSound("Audio/ohHiyaChipWeCanTestOurSkillsTogether.mp3"),
								letsMatchOliversAnExpert = audio.loadSound("Audio/letsMatchOliversAnExpert.mp3"),
								letsMatchEmUpOlegThisIsFun = audio.loadSound("Audio/letsMatchEmUpOlegThisIsFun.mp3"),
								hiWebsterReadyForANewChallenge = audio.loadSound("Audio/hiWebsterReadyForANewChallenge.mp3"),
								whatCouldBeMissingPeteLetsFindOut = audio.loadSound("Audio/whatCouldBeMissingPeteLetsFindOut.mp3"),
								okayChloeItsTimeForMorePuzzles = audio.loadSound("Audio/okayChloeItsTimeForMorePuzzles.mp3"),
								letsGoOlegThisOneWillReallyTestYourSkill = audio.loadSound("Audio/letsGoOlegThisOneWillReallyTestYourSkill.mp3"),
								letsFindThePatternRalphieThisIsFun = audio.loadSound("Audio/letsFindThePatternRalphieThisIsFun.mp3"),
								cmonSunshineYouUpForTheChallenge = audio.loadSound("Audio/cmonSunshineYouUpForTheChallenge.mp3"),
								peteLovesNumbersLetsHopToIt = audio.loadSound("Audio/peteLovesNumbersLetsHopToIt.mp3"),
								thisLooksLikeFunGoPinkie = audio.loadSound("Audio/thisLooksLikeFunGoPinkie.mp3"),
								hiDudleyLetsPlaySomeMathGames = audio.loadSound("Audio/hiDudleyLetsPlaySomeMathGames.mp3"),
								itsYourTurnCordeliaHereWeGo = audio.loadSound("Audio/itsYourTurnCordeliaHereWeGo.mp3"),
								thisCanBeTrickyYouReadyChip = audio.loadSound("Audio/thisCanBeTrickyYouReadyChip.mp3"),
								cMonOlegItsTimeToPracticeWhatWeveLearned = audio.loadSound("Audio/cMonOlegItsTimeToPracticeWhatWeveLearned.mp3"),
								itsTimeToGoChaunceyYouCanDoIt = audio.loadSound("Audio/itsTimeToGoChaunceyYouCanDoIt.mp3"),
								goodMorningSunshineItsTimeToMatch = audio.loadSound("Audio/goodMorningSunshineItsTimeToMatch.mp3"),
								thisOneWillReallyTestYourSkillGoRalphie = audio.loadSound("Audio/thisOneWillReallyTestYourSkillGoRalphie.mp3"),
								hiDudleyYouUpForTheChallenge = audio.loadSound("Audio/hiDudleyYouUpForTheChallenge.mp3"),
								timeToTestAllOurSkillsGoCordelia = audio.loadSound("Audio/timeToTestAllOurSkillsGoCordelia.mp3"),
								heresARealBrainbusterHopToItPete = audio.loadSound("Audio/heresARealBrainbusterHopToItPete.mp3"),
								doYouKnowYourNumbersGoPinkie = audio.loadSound("Audio/doYouKnowYourNumbersGoPinkie.mp3"),
								
								okayOlegLetsSortOutTheseNumbers = audio.loadSound("Audio/okayOlegLetsSortOutTheseNumbers.mp3"),
								whatComesNextRalphieYouReady = audio.loadSound("Audio/whatComesNextRalphieYouReady.mp3"),
								whatCouldBeMissingWebsterLetsFindOut = audio.loadSound("Audio/whatCouldBeMissingWebsterLetsFindOut.mp3"),
								letsReallyTestOurAdditionSkillsItsYourTurnOliver = audio.loadSound("Audio/letsReallyTestOurAdditionSkillsItsYourTurnOliver.mp3"),
								sunshinesARealMathWhizLetsAddEmUp = audio.loadSound("Audio/sunshinesARealMathWhizLetsAddEmUp.mp3"),
								trueOrFalseDaisyKnowsTheAnswer = audio.loadSound("Audio/trueOrFalseDaisyKnowsTheAnswer.mp3"),
								wordProblemsAreARealChallengeYouReadyChip = audio.loadSound("Audio/wordProblemsAreARealChallengeYouReadyChip.mp3"),
								dudleyLetsPlayTheSubtractionGameYouCanDoIt = audio.loadSound("Audio/dudleyLetsPlayTheSubtractionGameYouCanDoIt.mp3"),
								ralphieThisOneWillReallyTestYourSkillGoodLuck = audio.loadSound("Audio/ralphieThisOneWillReallyTestYourSkillGoodLuck.mp3"),
								wordProblemsAreARealChallengeItsYourTurnOliver = audio.loadSound("Audio/wordProblemsAreARealChallengeItsYourTurnOliver.mp3"),
	
								itsYourTurnRockoHereWeGo = audio.loadSound("Audio/itsYourTurnRockoHereWeGo.mp3"),
	}
	
	
	--sound effects
	bwipSound = "Audio/bwip.mp3"
	tom1Sound = "Audio/tom1.mp3"
	tom2Sound = "Audio/tom2.mp3"
	--tom3Sound = audio.loadSound("Audio/tom2.mp3")
	crashSound = "Audio/crash.mp3"
	
	clickSound = audio.loadSound("Audio/click.mp3")
	numMemoryMatchSound = audio.loadSound("Audio/shapesMemoryMatch.mp3")
	hiSound = audio.loadSound("Audio/hi.mp3")
	thankyouVOSound = audio.loadSound("Audio/thankYou.mp3")
	
	keepItUpYouAreDoingGreatTitleSound = audio.loadSound("Audio/keepItUpYoureDoingGreatTitle.mp3")
	
	applauseSound = audio.loadSound("Audio/applause.mp3")
	popSounds = {audio.loadSound("Audio/pop1.mp3"),audio.loadSound("Audio/pop2.mp3"),audio.loadSound("Audio/pop3.mp3")}
end


function loadFonts()

	speechBubble = display.newImageRect("Images/UI/speechBubble.png", 228, 156)--381, 119 )
	speechBubble.x = halfW
	speechBubble.y = halfH
	speechBubble.alpha = 0
	
	
	
	local textOptions = 
	{
		text = "",
		x = 0,
		y = 0,
		width = 512,     --required for multi-line and alignment
		align = "center",
		font = dynamicFont,
		fontSize = 72/2
	}
	
	-- line1 = display.newText( "This", display.contentWidth/3.2, display.contentHeight/1.53, 320, 0, dynamicFont, 72/2 )
	--line1:setReferencePoint( display.CenterReferencePoint )
	line1 = display.newText( textOptions )
	line1:setFillColor(64/255,64/255,64/255)
	-- line1.anchorX=0.5
    -- line1.anchorY=0.5
	line1.x = halfW
	line1.alpha = 0
	instructions:insert( line1 )
	
	line2 = display.newText( "BOOYA", display.contentWidth/3.2, display.contentHeight/1.53, dynamicFont, 128/2 )
	line2.alpha = 0
	
	line3 = display.newText( "is", display.contentWidth/3.2, display.contentHeight/1.53, 320, 0, dynamicFont, 72/2 )
	--line3:setReferencePoint( display.CenterReferencePoint )
	line3:setFillColor(64/255,64/255,64/255)
	line3.x = halfW
	line3.alpha = 0
	-- instructions:insert( line3 )
	
	line4 = display.newText( "HELLO", center, display.contentHeight/1.53, dynamicFont, 128/2 )
	line4.alpha = 0
	
	altColorTextfield = {line4, line2}
	altColorNumber = 1
	
	-- line5 = display.newText( "if you ask me!", display.contentWidth/3.2, display.contentHeight/1.53, 320, 0, dynamicFont, 72/2 )
	line5 = display.newText( textOptions )
	--line5:setReferencePoint( display.CenterReferencePoint )
	line5:setFillColor(64/255,64/255,64/255)
	-- line5.anchorX=0.5
    -- line5.anchorY=0.5
	line5.x = halfW
	line5.alpha = 0
	instructions:insert( line5 )
	
	
	instructions.anchorChildren = true
	instructions.anchorX=0.5
    instructions.anchorY=0.5 
	
	
	--instructions:setReferencePoint( display.CenterRightReferencePoint ) -- replaced for graphics 2.0 with:
	
	if (iapButtonText) then
		iapButtonText.anchorX = 1
		iapButtonText.anchorY = .5
	end
	
	instructions.x = halfW
	
	line6 = display.newText( "What other", display.contentWidth/3.2, display.contentHeight/1.53, dynamicFont, 72/2 )
	line6:setFillColor(64/255,64/255,64/255)
	line6.alpha = 0
	
	line8 = display.newText( "things can you see?", display.contentWidth/3.2, display.contentHeight/1.53, dynamicFont, 72/2 )
	line8:setFillColor(64/255,64/255,64/255)
	line8.alpha = 0
	
	topIAPText = display.newText( "$3.99", halfW, halfH - 84.5, dynamicFont, 27 )
	topIAPText:setFillColor(255/255,255/255,255/255)
	topIAPText.alpha = 0
	
	
	
	midIAPText = display.newText( "$3.99", halfW, halfH + 40.5, dynamicFont, 35 )
	midIAPText:setFillColor(255/255,255/255,255/255)
	midIAPText.alpha = 0
	
	bottomIAPText = display.newText( "$1.99", halfW, halfH + 84.5, dynamicFont, 15 )
	bottomIAPText:setFillColor(255/255,255/255,255/255)
	bottomIAPText.alpha = 0
	
	if (system.getInfo( "platformName" ) == "Android") then
		topIAPText.y = halfH - 146
		midIAPText.y = halfH - 38
		bottomIAPText.y = halfH + 52
	end
	
	 --print("loadFonts-textYs: "..topIAPText.y.." "..midIAPText.y.." "..bottomIAPText.y)
	if display.pixelHeight == 480 or display.pixelHeight == 960 then
		message = display.newText( "purchases disabled", display.contentWidth/2.5, display.contentHeight/15+4, dynamicFont, 24/2 )
		lockMessage = display.newText( "purchases disabled", display.contentWidth/2.5, display.contentHeight/15+4, dynamicFont, 24/2 )
	
		-- lockImage = display.newImageRect("Images/UI/lock.png", 14, 21 )
		-- lockImage.x = display.contentWidth/2.5 - 12
		-- lockImage.y = display.contentHeight/15+11
	else
		message = display.newText( "purchases disabled", display.contentWidth/2.5, 7, dynamicFont, 24/2 )
		lockMessage = display.newText( "purchases disabled", display.contentWidth/2.5, 7, dynamicFont, 24/2 )
	
		-- lockImage = display.newImageRect("Images/UI/lock.png", 14, 21 )
		-- lockImage.x = display.contentWidth/2.5 - 12
		-- lockImage.y = 14
	end		
	
	
	-- lockImage.alpha = 0
	
	lockMessage:setFillColor(64/255,64/255,64/255)
	lockMessage.alpha = 0
	-- message:setFillColor(64/255,64/255,64/255)
	message.alpha = 0
	
	if (system.getInfo( "platformName" ) == "Android") then
		lockMessage.y = lockMessage.y - 55
		message.y = message.y - 55
	elseif (version.appStore == "Amazon") then
		message.y = screenOriginY -14
	elseif (system.getInfo( "platformName" )  == "iPhone OS") then
		message.y = screenOriginY + 36
	end
	
	
	choiceOneText = display.newText( "_", 179, 93, dynamicFont, 75 )
	-- choiceOneText:setFillColor(255/255,255/255,255/255)
	choiceOneText:setFillColor(255/255,254/255,240/255)
	choiceOneText.x = -160
	choiceOneText.y = halfH - 50
	equationGroup:insert( choiceOneText )
	
	signText = display.newText( "+", 179, 93, dynamicFont, 75 )
	-- signText:setFillColor(255/255,255/255,255/255)
	signText:setFillColor(255/255,254/255,240/255)
	signText.x = -80
	signText.y = halfH - 50
	equationGroup:insert( signText )
	
	choiceTwoText = display.newText( "_", 179, 93, dynamicFont, 75 )
	-- choiceTwoText:setFillColor(255/255,255/255,255/255)
	choiceTwoText:setFillColor(255/255,254/255,240/255)
	choiceTwoText.x = 0
	choiceTwoText.y = halfH - 50
	equationGroup:insert( choiceTwoText )
	
	equalText = display.newText( "=", 179, 93, dynamicFont, 75 )
	-- equalText:setFillColor(255/255,255/255,255/255)
	equalText:setFillColor(255/255,254/255,240/255)
	equalText.x = 80
	equalText.y = halfH - 50
	equationGroup:insert( equalText )
	
	answerText = display.newText( "_", 179, 93, dynamicFont, 75 )
	-- answerText:setFillColor(255/255,255/255,255/255)
	answerText:setFillColor(255/255,254/255,240/255)
	answerText.x = 160
	answerText.y = halfH - 50
	equationGroup:insert( answerText )
	
	underlineOneImage = display.newImageRect("Images/UI/blankCard.png", 65, 79)
	underlineOneImage.x = choiceOneText.x
	underlineOneImage.y = choiceOneText.y
	
	if system.getInfo( "platformName" ) == "Android" then
		underlineOneImage.y = choiceOneText.y + 189
	end
	equationGroup:insert( underlineOneImage )
	
	underlineTwoImage = display.newImageRect("Images/UI/blankCard.png", 65, 79)
	underlineTwoImage.x = choiceTwoText.x
	underlineTwoImage.y = choiceTwoText.y
	
	if system.getInfo( "platformName" ) == "Android" then
		underlineTwoImage.y = choiceTwoText.y + 189
	end
	equationGroup:insert( underlineTwoImage )
	
	underlineThreeImage = display.newImageRect("Images/UI/blankCard.png", 65, 79)
	underlineThreeImage.x = answerText.x
	underlineThreeImage.y = answerText.y
	
	if system.getInfo( "platformName" ) == "Android" then
		underlineThreeImage.y = answerText.y + 189
	end
	equationGroup:insert( underlineThreeImage )
	
	oldEquationGroupX = equationGroup.x
	oldEquationGroupY = equationGroup.y
	
	--equationGroup.alpha = 0
	--equationGroup:setReferencePoint( display.CenterReferencePoint )
	equationGroup.x = 1000
	
	
	
	
	-- local textOptions = 
	-- {
		-- text = "",     
		-- x = 179,
		-- y = 93,
		-- width = 300,
		-- height = 22,
		-- font = dynamicFont,   
		-- fontSize = 25,
		-- align = "center"  -- Alignment parameter
	-- }
	 
	-- questionText = display.newText( textOptions )
	
	questionText = display.newText( "", 179, 93, dynamicFont, 25 )
	-- questionText:setFillColor(64/255,64/255,64/255)
	-- questionText:setFillColor(5/255,78/255,124/255)
	
	--questionText:setFillColor(248/255,248/255,243/255)
	questionText:setFillColor(255/255,254/255,240/255)
	questionText.x = halfW
	questionText.y = halfH - 100
	questionText.initY = questionText.y
	questionText.alpha = 0
	questionGroup:insert( questionText )
	
	
	 
	-- questionTextTwo = display.newText( textOptions )
	
	questionTextTwo = display.newText( "", 179, 93, dynamicFont, 25 )
	-- questionTextTwo:setFillColor(64/255,64/255,64/255)
	-- questionTextTwo:setFillColor(5/255,78/255,124/255)
	-- questionTextTwo:setFillColor(248/255,248/255,243/255)
	questionTextTwo:setFillColor(255/255,254/255,240/255)
	questionTextTwo.x = halfW
	questionTextTwo.y = questionText.y + 20
	questionTextTwo.alpha = 0
	questionGroup:insert( questionTextTwo )
	
	questionHitBox = display.newImageRect("Images/UI/underline.png", 330, 60)
	questionHitBox.x = halfW
	questionHitBox.alpha = 0
	questionHitBox.isHitTestable = true
	
	
	--fontsLoaded = true
end

function loadImageOptions()

	singularNumbersSet = {
						"one",
						"two",
						"three",
						"four",
						"five",
						"six",
						"seven",
						"eight",
						"nine",
						"ten",
						"eleven",
						"twelve",
						"thirteen",
						"fourteen",
						"fifteen",
						"sixteen",
						"seventeen",
						"eighteen",
						"nineteen",
						"twenty"
	}

	pluralNumbersSet = {
						"ones",
						"twos",
						"threes",
						"fours",
						"fives",
						"sixes",
						"sevens",
						"eights",
						"nines",
						"tens",
						"elevens",
						"twelves",
						"thirteens",
						"fourteens",
						"fifteens",
						"sixteens",
						"seventeens",
						"eighteens",
						"nineteens",
						"twenties"
	}

	firstImageSet = { "one",
								"two",
								"three",
								"four",
								"five",
								"six",
								"seven",
								"eight",
								"nine",
								"ten",
								"eleven",
								"twelve",
								"thirteen",
								"fourteen",
								"fifteen",
								"sixteen",
								"seventeen",
								"eighteen",
								"nineteen",
								"twenty",
								"twentyOne",
								"twentyTwo",
								"twentyThree",
								"twentyFour",
								"twentyFive",
								"twentySix",
								"twentySeven",
								"twentyEight",
								"twentyNine",
								"thirty",
								"thirtyOne",
								"thirtyTwo",
								"thirtyThree",
								"thirtyFour",
								"thirtyFive",
								"thirtySix",
								"thirtySeven",
								"thirtyEight",
								"thirtyNine",
								"forty",
								"fortyOne",
								"fortyTwo",
								"fortyThree",
								"fortyFour",
								"fortyFive",
								"fortySix",
								"fortySeven",
								"fortyEight",
								"fortyNine",
								"fifty",
								"fiftyOne",
								"fiftyTwo",
								"fiftyThree",
								"fiftyFour",
								"fiftyFive",
								"fiftySix",
								"fiftySeven",
								"fiftyEight",
								"fiftyNine",
								"sixty",
								"sixtyOne",
								"sixtyTwo",
								"sixtyThree",
								"sixtyFour",
								"sixtyFive",
								"sixtySix",
								"sixtySeven",
								"sixtyEight",
								"sixtyNine",
								"seventy",
								"seventyOne",
								"seventyTwo",
								"seventyThree",
								"seventyFour",
								"seventyFive",
								"seventySix",
								"seventySeven",
								"seventyEight",
								"seventyNine",
								"eighty",
								"eightyOne",
								"eightyTwo",
								"eightyThree",
								"eightyFour",
								"eightyFive",
								"eightySix",
								"eightySeven",
								"eightyEight",
								"eightyNine",
								"ninety",
								"ninetyOne",
								"ninetyTwo",
								"ninetyThree",
								"ninetyFour",
								"ninetyFive",
								"ninetySix",
								"ninetySeven",
								"ninetyEight",
								"ninetyNine",
								"oneHundred",
	}
	
	-- secondImageSet = { "oneFrog",
										-- "twoBirds",
										-- "threeLadybugs",
										-- "fourCarrots",
										-- "fiveBalls",
										-- "sixBananas",
										-- "sevenBabies",
										-- "eightApples",
										-- "nineBears",
										-- "tenCats"
	-- }
	
	-- thirdImageSet = { "oneSun",
									-- "twoGuitars",
									-- "threeSocks",
									-- "fourCars",
									-- "fivePuppies",
									-- "sixBunnies",
									-- "sevenBalloons",
									-- "eightDonuts",
									-- "nineBoots",
									-- "tenElephants"
	-- }
	
	-- fourthImageSet = { "purpleBackpack",
									-- "twoTractors",
									-- "threeTomatoes",
									-- "fourPigs",
									-- "fiveWatermelons",
									-- "sixDucks",
									-- "sevenHippos",
									-- "eightRobots",
									-- "nineMonsters",
									-- "tenHearts"
	-- }
	
	secondImageSet = { "oneStrawberry",
										"twoPastries",
										"threePears",
										"fourWatermelonSlices",
										"fiveBroccoli",
										"sixCookies",
										"sevenAcorns",
										"eightCherries",
										"nineEggplants",
										"tenStarsCard"
	}
	
	thirdImageSet = { "oneDuckCard",
									"twoBalloonsCard",
									"threeYarnBallsCard",
									"fourCarrotsCard",
									"fivePeppersCard",
									"sixGuitarsCard",
									"sevenApplesCard",
									"eightBallsCard",
									"nineOrangesCard",
									"tenHeartsCard"
	}
	
	fourthImageSet = { "oneStrawberry",
									"twoPastries",
									"threePears",
									"fourWatermelonSlices",
									"fiveBroccoli",
									"sixCookies",
									"sevenAcorns",
									"eightCherries",
									"nineEggplants",
									"tenStarsCard"
	}
	
	fifthImageSet = { "dotsOne",
									"dotsTwo",
									"dotsThree",
									"dotsFour",
									"dotsFive",
									"dotsSix",
									"dotsSeven",
									"dotsEight",
									"dotsNine",
									"dotsTen"
	}
	
	sixthImageSet = { "dotsCard1",
									"dotsCard2",
									"dotsCard3",
									"dotsCard4",
									"dotsCard5",
									"dotsCard6",
									"dotsCard7",
									"dotsCard8",
									"dotsCard9",
									"dotsCard10"
	}
	
	dotImages = { "dots1",
				"dots2",
				"dots3",
				"dots4",
				"dots5",
				"dots6",
				"dots7",
				"dots8",
				"dots9",
				"dots10"
	}
	
	howManyAreCategories = { "blue",
												"red",
												"green",
												"circles",
												"squares",
												"triangles"
	}
	
	howManyAreList = { "blueCircle",
									"blueSquare",
									"blueTriangle",
									"redCircle",
									"redSquare",
									"redTriangle",
									"greenCircle",
									"greenSquare",
									"greenTriangle"
	}
	
	howManyAreCategoriesAlt = { "blue",
												"red",
												"green",
												"yellow",
												"circles",
												"squares",
												"triangles"
	}
	
	howManyAreListAlt = { "blueCircle",
									"blueSquare",
									"blueTriangle",
									"redCircle",
									"redSquare",
									"redTriangle",
									"greenCircle",
									"greenSquare",
									"greenTriangle",
									"yellowCircle",
									"yellowSquare",
									"yellowTriangle",
	}
	
	howManyAreCategoriesAlt2 = { "blue",
												"red",
												"circles",
												"squares",
												"triangles",
	}
	
	howManyAreListAlt2 = { "blueCircle",
									"blueSquare",
									"blueTriangle",
									"redCircle",
									"redSquare",
									"redTriangle",
	}
	
	howManyImageList = { 
						--{ image = "cakes" }, 
						{ image = "xylophones" }, 
						{ image = "frogs" }, 
						--{ image = "cookies" }, 
						--{ image = "pizzas" }, 
						{ image = "balls" },
						--{ image = "apples" }, 						
						{ image = "carrots" }, 
						{ image = "babies" }, 
						{ image = "flowers" }, 
						--{ image = "waffles" }
	}
	
	howManyGroupList = {
						{ image = "twoToothbrushes" },
						{ image = "twoBoots" },
						{ image = "fiveTomatoes" },
						{ image = "fiveBackpacks" },
						{ image = "tenStars" },
						{ image = "tenBalloons" },
	}
	
	
	-- sequenceImageList = {
						-- { image = "cakes" },
						-- { image = "pies" },
						-- { image = "cookies" },
						-- { image = "pizzas" },
						-- { image = "waffles" }
	
	-- }
	
	-- sequenceCardList = {
						-- { image = "rectangleCake" },
						-- { image = "pieCard" },
						-- { image = "starCookie" },
						-- { image = "octagonPizza" },
						-- { image = "squareWaffle" }
	
	-- }
	
	sequenceImageList = {
						{ image = "vegfruBanana", w = 128, h = 112, vo = "banana", },
						{ image = "fruApple", w = 111, h = 116, vo = "apple", },
						{ image = "fruOrange", w = 110, h = 120, vo = "orange", },
						{ image = "fruGrapes", w = 127, h = 120, vo = "purpleGrapes", },
						
						{ image = "vegfruPepperR", w = 104, h = 132, vo = "pepper", },
						{ image = "vegfruCorn", w = 120, h = 112, vo = "corn", },
						{ image = "vegfruPumpkin", w = 124, h = 120, vo = "pumpkin", },
						{ image = "vegEggplant", w = 115, h = 114, vo = "eggplant", },
											
						{ image = "cookie1", w = 88, h = 128, vo = "iceCream", },
						{ image = "cookie2", w = 120, h = 120, vo = "cake", },
						{ image = "cookie9", w = 108, h = 128, vo = "cookies", },
						{ image = "snackCandy", w = 107, h = 137, vo = "candy", },
						
						
						
						
					
					
						
						
						-- { image = "cookie11", w = 116, h = 116, vo = "cookies", },
						
						
						
						-- { image = "cookie3", w = 124, h = 116, vo = "cookies", },
						-- { image = "cookie4", w = 124, h = 104, vo = "cookies", },
						-- { image = "cookie5", w = 116, h = 116, vo = "cookies", },
						
						-- { image = "cookie7", w = 120, h = 116, vo = "circleDonut", },
						-- { image = "cookie8", w = 124, h = 116, vo = "cookies", },
						
						-- { image = "cookie10", w = 128, h = 104, vo = "cookies", },
						
	
						-- { image = "cakes" },
						-- { image = "pies" },
						-- { image = "cookies" },
						-- { image = "pizzas" },
						-- { image = "waffles" }
	
	}
	
	sequenceCardList = {
	
						{ image = "patternBanana" },
						{ image = "patternApple" },
						{ image = "patternOrange" },
						{ image = "patternGrapes" },						
						
						{ image = "patternPepperR" },
						{ image = "patternCorn" },
						{ image = "patternPumpkin" },
						{ image = "patternEggplant" },				
					
						{ image = "patternCookie1" },
						{ image = "patternCookie2" },
						{ image = "patternCookie9" },
						{ image = "patternCandy" },
						
						-- { image = "patternPepperR" },
						-- { image = "patternBanana" },
						-- { image = "patternPepperG" },
						-- { image = "patternCorn" },
						-- { image = "patternPepperY" },
						-- { image = "patternCherry" },
						-- { image = "patternRaspberry" },
						-- { image = "patternPumpkin" },
						-- { image = "patternCookie1" },
						-- { image = "patternCookie2" },
						-- { image = "patternCookie3" },
						-- { image = "patternCookie4" },
						-- { image = "patternCookie5" },
						-- { image = "patternCookie6" },
						-- { image = "patternCookie7" },
						-- { image = "patternCookie8" },
						-- { image = "patternCookie9" },
						-- { image = "patternCookie10" },
						-- { image = "patternCookie11" },
						
	
						-- { image = "rectangleCake" },
						-- { image = "pieCard" },
						-- { image = "starCookie" },
						-- { image = "octagonPizza" },
						-- { image = "squareWaffle" }
	
	}
	
	howManyApplesList = {
						{ image = "apples" },
						{ image = "bananas" }
	}
	
	
	howManyPositions = {
						{ 75, 1, halfW, halfH - 40 },
						{ 75, 1, halfW - 40, halfH - 55, halfW + 30, halfH - 25 },
						{ 75, .9, halfW - 55, halfH - 35, halfW + 15, halfH - 16, halfW + 80, halfH - 54 },
						{ 75, .9, halfW - 85, halfH - 45, halfW - 20, halfH - 19, halfW + 40, halfH - 58, halfW + 100, halfH - 30 },
						{ 75, .8, halfW - 90, halfH - 15, halfW - 145, halfH - 60, halfW - 20, halfH - 35, halfW + 50, halfH - 50, halfW + 105, halfH - 15 },
						{ 75, .7, halfW - 145, halfH - 20, halfW - 90, halfH - 40, halfW - 30, halfH - 70, halfW-5, halfH - 20, halfW + 45, halfH - 65, halfW + 100, halfH - 20 },
						{ 75, .7, halfW - 110, halfH - 40, halfW - 60, halfH - 65, halfW - 50, halfH - 15, halfW, halfH - 55, halfW + 45, halfH - 20, halfW + 70, halfH - 70, halfW + 110, halfH - 30 },
						{ 75, .7, halfW - 110, halfH - 40, halfW - 60, halfH - 75, halfW - 50, halfH - 20, halfW, halfH - 60, halfW + 45, halfH - 28, halfW + 75, halfH - 74, halfW + 110, halfH - 20, halfW + 135, halfH - 65 },
						{ 75, .7, halfW + 140, halfH - 65, halfW + 110, halfH - 20, halfW + 70, halfH - 70, halfW + 40, halfH - 25, halfW - 9, halfH - 64, halfW - 50, halfH - 20, halfW - 70, halfH - 72, halfW - 130, halfH - 67, halfW - 120, halfH - 20 },
						{ 75, .7, halfW - 180, halfH - 20, halfW - 130, halfH - 55, halfW - 60, halfH - 75, halfW - 50, halfH - 25, halfW - 4, halfH - 60, halfW + 45, halfH - 25, halfW + 75, halfH - 70, halfW + 120, halfH - 20, halfW + 140, halfH - 65, halfW + 185, halfH - 25 },
						
						{ 75, .7 },
						{ 75, .7 },
						{ 70, .7 },
						{ 70, .7 },
						{ 60, .7 },
						{ 60, .7 },
						{ 55, .6 },
						{ 55, .6 },
						{ 50, .6 },
						{ 50, .6 },
	}
	
	howManyGroupPositions = {
						{ 0, 1, halfW, halfH - 40 },
						{ 0, 1, halfW - 40, halfH - 55, halfW + 40, halfH - 25 },
						{ 0, 1, halfW - 65, halfH - 45, halfW + 15, halfH - 16, halfW + 100, halfH - 54 },
						{ 0, 1, halfW - 115, halfH - 45, halfW - 40, halfH - 19, halfW + 40, halfH - 50, halfW + 120, halfH - 30 },
						{ 0, 1, halfW - 100, halfH - 15, halfW - 175, halfH - 50, halfW - 20, halfH - 35, halfW + 60, halfH - 50, halfW + 135, halfH - 15 },
						{ 0, 1, halfW - 205, halfH - 20, halfW - 130, halfH - 40, halfW - 50, halfH - 55, halfW+20, halfH - 20, halfW + 95, halfH - 55, halfW + 170, halfH - 20 },
						{ 0, 1, halfW - 200, halfH - 40, halfW - 125, halfH - 55, halfW - 70, halfH - 15, halfW, halfH - 45, halfW + 70, halfH - 20, halfW + 130, halfH - 50, halfW + 200, halfH - 30 },
						{ 0, .9, halfW - 200, halfH - 40, halfW - 135, halfH - 45, halfW - 80, halfH - 20, halfW - 15, halfH - 55, halfW + 45, halfH - 28, halfW + 105, halfH - 54, halfW + 154, halfH - 20, halfW + 205, halfH - 60 },
						{ 0, .9, halfW + 215, halfH - 55, halfW + 160, halfH - 20, halfW + 105, halfH - 60, halfW + 55, halfH - 25, halfW + 5, halfH - 57, halfW - 50, halfH - 20, halfW - 110, halfH - 40, halfW - 170, halfH - 55, halfW - 230, halfH - 20 },
						{ 0, .9, halfW - 230, halfH - 20, halfW - 170, halfH - 35, halfW - 115, halfH - 65, halfW - 70, halfH - 25, halfW - 14, halfH - 60, halfW + 35, halfH - 25, halfW + 85, halfH - 65, halfW + 130, halfH - 20, halfW + 170, halfH - 65, halfW + 215, halfH - 25 },
						
						{ 75, .7 },
						{ 75, .7 },
						{ 70, .7 },
						{ 70, .7 },
						{ 60, .7 },
						{ 60, .7 },
						{ 55, .6 },
						{ 55, .6 },
						{ 50, .6 },
						{ 50, .6 },
	}
	
	
	firstShapeSet = { 	"square",
						"circle",
						"triangle",
						"rectangle",
						"oval",
						"star",
						"heart",	
						"rhombus",
						"octagon",
						"pentagon"
	}
	
	firstShapeSetPlural = { 	"squares",
								"circles",
								"triangles",
								"rectangles",
								"ovals",
								"stars",
								"hearts",	
								"rhombuses",
								"octagons",
								"pentagons"
	}
	
	-- secondShapeSet = { 	"squareRobot",
						-- "circleDonut",
						-- "trianglePie",
						-- "rectangleBus",
						-- "ovalBaby",
						-- "starBadge",
						-- "heartLollipop",
						-- "rhombusGem",
						-- "octagonPizza",
						-- "pentagonMaze"
	-- }
	
	-- thirdShapeSet = { 	"squareWaffle",
						-- "circleTrain",
						-- "triangleXylophone",
						-- "rectangleCake",
						-- "ovalMelon",
						-- "starCookie",
						-- "heartPillow",
						-- "rhombusTortilla",
						-- "octagonPuzzle",
						-- "pentagonToast"
	-- }
	
	secondShapeSet = { 	"squareBlock",
						"circleClock",
						"triangleCheese",
						"rectangleCookie",
						"ovalWatermelon",
						"starCookie",
						"heartStrawberry",
						"diamondTortilla",
						"octagonUmbrella",
						"pentagonFlower",
	}
	
	thirdShapeSet = { 	"squareRobot",
						"circleDonut",
						"triangleXylophone",
						"rectanglePizza",
						"ovalBaby",
						"starStarfish",
						"heartCandy",
						"diamondKite",
						"octagonStopSign",
						"pentagonToast"
	}
	
	firstColorSet = { 	"blue",
						"red",
						"yellow",
						"green",
						"orange",
						"purple",
						"pink",	
						"brown"
	}
	
	-- secondColorSet = { 	"blueBird",
						-- "redTomato",
						-- "yellowBus",
						-- "greenFrog",
						-- "orangeCat",
						-- "purpleBackpack",
						-- "pinkFlower",
						-- "brownCoconut"
	-- }
	
	-- thirdColorSet = { 	"blueCrayon",
						-- "redWagon",
						-- "yellowSun",
						-- "greenTractor",
						-- "orangePumpkin",
						-- "purpleGrapes",
						-- "pinkPig",
						-- "brownPuppy"
	-- }
	
	secondColorSet = { 	"blueOwl",
						"redHeart",
						"yellowStar",
						"greenFrog",
						"orangeCat",
						"purpleBackpack",
						"pinkFlower",
						"brownBarrel"
	} 
	
	thirdColorSet = { 	"blueCrayon",
						"redBird",
						"yellowDuck",
						"greenBroccoli",
						"orangeOrange",
						"purpleGrapes",
						"pinkPig",
						"brownPuppy"
	}
	
	
	-- pictureSet = {	"blueBird",
						-- "pinkPig",
						-- "greenFrog",
						-- "orangeCat",
						-- "orangePumpkin",
						-- "brownCoconut",
						-- "redTomato",
						-- "ovalMelon",
						-- "purpleGrapes",
						-- "squareWaffle",
						-- "rectangleCake",
						-- "circleDonut",
						-- "yellowSun",
						-- "yellowBus",
						-- "greenTractor",
						-- "pinkFlower",
						-- "purpleBackpack",
						-- "heartPillow",
						-- "redWagon",
						-- "blueCrayon",
						-- "triangleXylophone",
						-- "squareRobot",
						-- "starBadge"
	-- }
	
	pictureSet = {		"blueOwl",
						"orangeCat",
						"yellowDuck",						
						"pinkPig",
						"greenFrog",
						"redBird",							
						"brownPuppy",
						
						"orangeOrange",
						"patternBanana",
						"purpleGrapes",
						"greenBroccoli",
						"patternCorn",
						
						"patternCookie9",
						"patternCookie2",
						"circleDonut",
						"patternCookie1",
						"patternCookie11",
						
						"purpleBackpack",							
						"circleClock",
						"diamondKite",
						"octagonStopSign",
						"squareBlock",
						"squareRobot",
	}
	
	
	biggerSmaller = {	
										"biggerStrawberry",
										"biggerPepper",
										"biggerOrange",
										"biggerBroccoli",
										"biggerRaspberry",
										
										"biggerToothbrush",
										"biggerLeaf",
										"biggerFrog",
										"biggerFish",
										"biggerCorn",
										"biggerAnt",
										"biggerWatermelon",
										"biggerCaterpillar",
										"biggerTart",
		
		}
	
	
	-- which one is the same --
	whichSameSets = {  image = { { "apples", "-" },
																{ "bananas", "-" },
						
											},
											card = {	{ "apples1", "-" }, 
															{ "bananas1", "-" },
											
											}
		}
	
	-- which one is different hidden --
	whichDifferentHSets = {  
								{ "toothbrush1", "toothbrush2" },
								{ "puppy1", "puppy2" },
								{ "balloon1", "balloon2" },
								{ "backpack1", "backpack2" },
								{ "carrot1", "carrot2" },
								{ "gingerbreadMan1", "gingerbreadMan2" },
								{ "yoyo1", "yoyo2" },
								{ "boot1", "boot2" },
								{ "tractor1", "tractor2" },
								{ "flower1", "flower2" },
								{ "pig1", "pig2" },
								{ "ant1", "ant2" }, 
								
								
								
								-- { "cookieDiff1", "cookieDiff2" },
								-- { "croissant1", "croissant2" },
								-- { "lamb1", "lamb2" },
								-- { "orange1", "orange2" },
								-- { "plane1", "plane2" },
		}
	
	-- which one is different categories --
	whichDifferentCSets = {  
												{ 
													{ "backpack1", "backpack2", "backpack3" },
													{ "ladybug1", "ladybug2", "ladybug3" },
													{ "boot1", "boot2", "boot3" },
												},
												{
													{ "backpack1", "backpack2", "backpack3" },
													{ "ladybug1", "ladybug2", "ladybug3" },
													{ "boot1", "boot2", "boot3" },
												
												}
			
		
		
		}
	
	
	
	additionEquations3 = {
											{ 1, 0 },
											{ 1, 1 },
											{ 1, 2 },
											{ 2, 0 },
											{ 2, 1 },
											{ 3, 0 },
	}
		
	additionEquations5 = {
											{ 1, 3 },
											{ 1, 4 },
											{ 2, 2 },
											{ 2, 3 },
											{ 3, 1 },
											{ 3, 2 },
											{ 4, 0 },
											{ 4, 1 },
											{ 5, 0 },
	}
	
	subtractionEquations3 = {
										{ 1, 0 },
										{ 1, 1 },
										{ 2, 0 },
										{ 2, 1 },
										{ 2, 2 },
										{ 3, 0 },
										{ 3, 1 },
										{ 3, 2 },
										{ 3, 3 },
	}
	
	subtractionEquations5 = {
										{ 4, 0 },
										{ 4, 1 },
										{ 4, 2 },
										{ 4, 3 },
										{ 4, 4 },
										{ 5, 0 },
										{ 5, 1 },
										{ 5, 2 },
										{ 5, 3 },
										{ 5, 4 },
										{ 5, 5 },
	}
	
	
	
	wordProblemsAddition = {
		num10 = {1,2,4,5,7,9}, --{ 3, 5, 2 },
		num25 = {1,3,5,7,9}, --{ 1, 8, 7 },
		num50 = {1,3,5,6,8,9}, --{ 4, 5, 6 },
		num100 = {1,5,6,8}, --{ 1, 2, 3 },
		num1000 = {1,5,6,8}, --{ 5, 6, 7},
	}
	
	wordProblemsSubtraction = {
		num10 = {1,2,4,5,6,7,9,10}, --{ 3, 5, 2 },
		num25 = {1,2,4,5,6,8,9,10},--{ 1, 8, 7 },
		num50 = {1,3,4,5,6,8,9,10}, --{ 4, 5, 6 },
		num100 = {1,3,4,5,6,9,10}, --{ 1, 2, 3 },
		num1000 = {1,3,5,6}, --{ 5, 6, 7},
	}
	
	
	
end

-- End Loading Items





function init()

	appStart = true

	--debugger:log(3,"init")
	--    debugger:init()
        iap_readPurchasedVersion()
        logoMain = display.newImageRect("Images/UI/logo.png", 472, 180)   --381, 119 )
        logoMain.x = display.contentWidth/2+.2
        logoMain.y = display.contentHeight/2-7       
        logoMain.alpha = 0
		
		kindergartenLogo = display.newImageRect("Images/UI/cityLogo.png", 371 * 1.25, 218 * 1.25)   --381, 119 )
        kindergartenLogo.x = display.contentWidth/2
        kindergartenLogo.y = display.contentHeight/2-15
        kindergartenLogo.alpha = 0
        
        --local scaler = display.pixelWidth / display.actualContentWidth
       -- print(display.pixelWidth.." "..display.pixelHeight.."-"..display.contentWidth.." "..display.contentHeight.."--"..scaler)
        load()
        introMenuSound = audio.loadSound("Audio/jazzStart.mp3")
	audio.play( introMenuSound, { channel = 1, loops = -1 }  )
	if savedData.enableMusic == false then
		audio.setVolume( 0, { channel=1 })
	end
	
	menuSound = audio.loadSound("Audio/traffic.mp3")
	audio.play( menuSound, { channel = 2, loops = -1 }  )
	if savedData.enableMusic == false then
		audio.setVolume( 0, { channel=2 })
	end
	
	if (settingsLua.parentsButtonDelay == false) then
		parentsHold = 0
	end
	
	bgLighter = display.newImageRect("Images/UI/citySkyWide.png", 1000, 400) -- bgWideLighter
	bgLighter.x = center
	bgLighter.y = display.contentHeight/2
	bgLighter:toBack()	
	bgLighter.alpha = 0
	
	bg = display.newImageRect("Images/UI/citySkyWide.png", 1000, 400) -- bgWide
	bg.isHitTestable = true
	bg.x = center
	bg.y = display.contentHeight/2
	bg:toBack()
	
	
	
	bgWhite = display.newImageRect("Images/UI/cityTransitionBGWide.png", 1000, 400)
	bgWhite.x = center
	bgWhite.y = display.contentHeight/2
	bgWhite.alpha = 0
	
	bgWhiteTwo = display.newImageRect("Images/UI/bgWhite.png", 1000, 400)
	bgWhiteTwo.x = center
	bgWhiteTwo.y = display.contentHeight/2
	bgWhiteTwo.alpha = 0
        
        --timer.performWithDelay(10, finishInit) 
        -- transition.to(logoMain, { time=1100, alpha=1,  onComplete=finishInit } )
		
	transition.to(logoMain, { time=1100, alpha=1 } ) --,  onComplete=finishInit
    
	timer.performWithDelay( 1100, FadeOutLogoMain )
		
		
end


function FadeOutLogoMain()

	transition.to(logoMain, { time=1100, alpha=0, transition=easing.inExpo } )
	
	timer.performWithDelay( 1400, ShowKindergartenLogo )
	
end

function ShowKindergartenLogo()
	
	transition.to(kindergartenLogo, { time=1100, alpha=1 } )

	if (promoEnabled == true) then
		promoKit:init(version.promoKitID,finishInit,1100)
	else
		timer.performWithDelay( 1100, finishInit )
	end
end


function finishLoading()

	if (version.appStore == "Google Play" and variation ~= 5) then
		alertLink:new(true, settingsLua.unlockAlertLinkValues.frequency, settingsLua.unlockAlertLinkValues.iterations, settingsLua.unlockAlertLinkValues.title, settingsLua.unlockAlertLinkValues.description, settingsLua.unlockAlertLinkValues.yesButton, settingsLua.unlockAlertLinkValues.noButton, settingsLua.unlockAlertLinkValues.remindButton, version.rateURL)
		save()
	else
		alertLink:new(true, settingsLua.alertLinkValues.frequency, settingsLua.alertLinkValues.iterations, settingsLua.alertLinkValues.title, settingsLua.alertLinkValues.description, settingsLua.alertLinkValues.yesButton, settingsLua.alertLinkValues.noButton, settingsLua.alertLinkValues.remindButton, version.rateURL)
		save()
	end

end

function alertSelect(event)

	if "clicked" == event.action then
		local i = event.index
		if 1 == i then -- Don't Remind Me Again
			-- savedData.audioAlertEnabled = false
			-- save()
			-- print("Don't remind again")
		-- elseif 2 == i then -- OK
			
		end
		
		
		finishLoading()
		
	end

end


function checkIfMuted(event)


	if (event.muted == true) then
		local alert = native.showAlert( "AUDIO MUTED", "This app will be silent while your mute switch is on. To hear the app's sound, flip your device's mute switch located near the volume buttons.", { "OK" }, alertSelect )
	else
		finishLoading()
	end
end

function onSystemEvent( event )
    if (event.type == "applicationSuspend") then
    
    elseif (event.type == "applicationResume") then
    	if (appStart == false and savedData.audioAlertEnabled == true and moreInfo ~= nil) then
				moreInfo.isMuted(checkIfMuted)
		end
    end
end
Runtime:addEventListener( "system", onSystemEvent ) -- used to catch system events like pause

function startLogoFade()
		transition.to(kindergartenLogo, { time=1100, alpha=0, transition=easing.inExpo, onComplete=bgAnimationStart } )
	--resetChoiceValues()
	--title()
	   
		
	-- if (version.appStore == "Google Play" and variation ~= 5) then
		-- alertLink:new(true, settingsLua.unlockAlertLinkValues.frequency, settingsLua.unlockAlertLinkValues.iterations, settingsLua.unlockAlertLinkValues.title, settingsLua.unlockAlertLinkValues.description, settingsLua.unlockAlertLinkValues.yesButton, settingsLua.unlockAlertLinkValues.noButton, settingsLua.unlockAlertLinkValues.remindButton, version.rateURL)
		-- save()
	-- else
		-- alertLink:new(true, settingsLua.alertLinkValues.frequency, settingsLua.alertLinkValues.iterations, settingsLua.alertLinkValues.title, settingsLua.alertLinkValues.description, settingsLua.alertLinkValues.yesButton, settingsLua.alertLinkValues.noButton, settingsLua.alertLinkValues.remindButton, version.rateURL)
		-- save()
	-- end
	
	
	if (savedData.audioAlertEnabled ~= nil) then
	else
		savedData.audioAlertEnabled = true
	end
	
	if (savedData.audioAlertEnabled == true and moreInfo ~= nil) then
		moreInfo.isMuted(checkIfMuted)
	else
		finishLoading()
	end
	
	
end

function finishInit()
	--debugger:log(4,"start finishInit")
	
	-- testText = display.newText( "Test text is enabled", screenOriginX + 50, screenEdgeY - 100, 320, 0, dynamicFont, 13 )
	-- testText:setFillColor(0)
	-- testText.anchorX=0
	-- testText.anchorY=1
	
	-- testText1 = display.newText( "Test Text 1", halfW, screenOriginY + 30, 400, 0, dynamicFont, 20 )
	-- testText2 = display.newText( "Test Text 2", halfW, testText1.y + 30, 400, 0, dynamicFont, 20 )
	-- testText3 = display.newText( "Test Text 3", halfW, testText2.y + 30, 400, 0, dynamicFont, 20 )
	-- testText4 = display.newText( "Test Text 4", halfW, testText3.y + 30, 400, 0, dynamicFont, 20 )
	-- testText5 = display.newText( "Test Text 5", halfW, testText4.y + 30, 400, 0, dynamicFont, 20 )
	-- testText6 = display.newText( "Test Text 6", halfW, testText5.y + 30, 400, 0, dynamicFont, 20 )
	-- testText7 = display.newText( "Test Text 7", halfW, testText6.y + 30, 400, 0, dynamicFont, 20 )
	-- testText8 = display.newText( "Test Text 8", halfW, testText7.y + 30, 400, 0, dynamicFont, 20 )
	
	
	-- testText1:setFillColor( 0 )
	-- testText2:setFillColor( 0 )
	-- testText3:setFillColor( 0 )
	-- testText4:setFillColor( 0 )
	-- testText5:setFillColor( 0 )
	-- testText6:setFillColor( 0 )
	-- testText7:setFillColor( 0 )
	-- testText8:setFillColor( 0 )
	
	showIAPOnStart = 3
	
	
	checkIfSale()
	
	updatePromo()
	audio.reserveChannels(40)--27
	
	
	loadMenu()--title screen starts from this function
	
	
	
	loadSelectScreen()
	
	
	loadFonts()
	loadIAPMenu()
	
	
	loadMenuSounds()
	-- loadGameSounds()
	
	loadImageOptions()
	
	gameLevelDetails()
	
	--iapLoadMenuAnimation()
	
	currentState = "title"
	Runtime:addEventListener( "enterFrame", iapCardFloat)
	
	
        -- transition.to(logoMain, { time=1100, alpha=0, transition=easing.inExpo, onComplete=bgAnimationStart } )
	--resetChoiceValues()
	--title()
        iap_InitAppStore()
		
	-- alertLink:new(true, settingsLua.alertLinkValues.frequency, settingsLua.alertLinkValues.iterations, settingsLua.alertLinkValues.title, settingsLua.alertLinkValues.description, settingsLua.alertLinkValues.yesButton, settingsLua.alertLinkValues.noButton, settingsLua.alertLinkValues.remindButton, version.rateURL)
    -- save()
	-- if (version.appStore == "Google Play" and variation ~= 5) then
		-- alertLink:new(true, settingsLua.unlockAlertLinkValues.frequency, settingsLua.unlockAlertLinkValues.iterations, settingsLua.unlockAlertLinkValues.title, settingsLua.unlockAlertLinkValues.description, settingsLua.unlockAlertLinkValues.yesButton, settingsLua.unlockAlertLinkValues.noButton, settingsLua.unlockAlertLinkValues.remindButton, version.rateURL)
		-- save()
	-- else
		-- alertLink:new(true, settingsLua.alertLinkValues.frequency, settingsLua.alertLinkValues.iterations, settingsLua.alertLinkValues.title, settingsLua.alertLinkValues.description, settingsLua.alertLinkValues.yesButton, settingsLua.alertLinkValues.noButton, settingsLua.alertLinkValues.remindButton, version.rateURL)
		-- save()
	-- end
	--debugger:log(5,"end finishInit")
	
	
	-- if (savedData.appOpenNum == 1 and variation == 4) then
		-- if (version.appStore == "Amazon" and system.getInfo( "environment" ) ~= "simulator") then
			-- version.appStore == "Google Play" and system.getInfo( "environment" ) ~= "simulator") then
			
			-- buyIAP("restore")
		-- end
	-- end
	 
	if (savedData.hasTriedRestore == nil) then
		savedData.hasTriedRestore = false
	end
	
	if (version.appStore == "Amazon" and variation == 4 and system.getInfo( "environment" ) ~= "simulator" and savedData.hasTriedRestore == false) then
		savedData.hasTriedRestore = true
	-- if (savedData.appOpenNum == 0 and variation == 4 and version.appStore == "Amazon" and system.getInfo( "environment" ) ~= "simulator") then
		buyIAP("restore")
	else
		--buyIAP("unlockeverything") -- only for testing
		timer.performWithDelay( 5, startLogoFade )
	end
	
end

--debugger:log(3,"pre init")

sceneSkip = 0 -- 0 = no skip -- random levels start at 52
-- curGame = 5
autoScrollTo = 0 -- dont go above 49 -- Saving doesn't work when auto scrolling to random levels

--timer.performWithDelay( 10,init)
init()
--splash:initSplash()