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
	local tblBasket = gameOptions.questions
	local tblCards = gameOptions.cards
	local gameGroup
	local floaters = {}
	local gameImages = {}
	gameGroups = {}
	local gameNumbers = {}
	local currentCount = 1
	local isEndGame = false
	local closingGame = false
	local floatRangeItem = 1.5
	local gameTime = 0
	local groupStartRange, groupEndRange = tblCards.groupStartRange, tblCards.groupEndRange
	local startRange, endRange = tblCards.startRange, tblCards.endRange
	
	

	
	
	
	if (prevBubbleAnswer == nil) then
		prevBubbleAnswer = {}
	elseif (#prevBubbleAnswer >= 10 - 1 + 1) then
		for i = #prevBubbleAnswer, 1, -1 do
			table.remove( prevBubbleAnswer, i )
		end
	elseif (#prevBubbleAnswer >= endRange - startRange + 1) then
		repeat
			table.remove( prevBubbleAnswer, 1 )
		until #prevBubbleAnswer < endRange - startRange + 1
	end
	
	local repeatednum = false
	repeat
		repeatednum = false
		
		numImagesAnswer = math.random( startRange, endRange )
		
		for i = #prevBubbleAnswer, 1, -1 do
			if (prevBubbleAnswer[i] == numImagesAnswer) then
				repeatednum = true
			end
		end
		
	until repeatednum == false
	prevBubbleAnswer[#prevBubbleAnswer+1] = numImagesAnswer
	
	
	
	game3CurBubble = game3CurBubble + 1
	if (game3CurBubble > #game3BubbleOptions) then
		game3CurBubble = 1
	end
	
	--game3CurBubble = 2
	
	numGroups = math.random( groupStartRange, groupEndRange )
	
	
	numOptions = {}
	numOptions[1] = numImagesAnswer
	
	
	
	if (numGroups > 1) then
		for i = 2, numGroups do
			local repeated = false
			local tempNumOption
			
			
			repeat
				repeated = false
				
				tempNumOption = math.random( startRange, endRange )
				
				for k = #numOptions, 1, -1 do
					if (tempNumOption == numOptions[k]) then
						repeated = true
					end
				end
			until repeated == false
			
			numOptions[#numOptions+1] = tempNumOption
			
		end
	end
	randomizeTable( numOptions )
	
	
	if (game3CurImage == nil) then
		game3CurImage = 0
		randomizeTable( game3ImageOptions )
	end
	game3CurImage = game3CurImage + 1
	if (game3CurImage > #game3ImageOptions) then
		game3CurImage = 1
		randomizeTable( game3ImageOptions )
	end
	
	
	
	
	--[[if system.getInfo("model") == "iPad" then
	
	
		countImageScale = { 1, 1, 0.825, 0.60, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5 } -- adjusts the size of item when counted at end
	
		groupImageScale = { 0.85, 0.55, 0.49, 0.425, 0.8, 0.7, 0.7, 0.6, 0.6, 0.6 } -- adjusts the size of the clouds, bubbles, balloons
	
		groupItemPositions = { 
			-- 1 group
			{ 
				{ 10, 25 },
			},
			-- 2 groups
			{ 
				{ -80, -24 }, { 80, -20 },
			},
			-- 3 groups
			{ 
				{-150, -18 }, { 0, -24 }, { 150, -20 },
			},
			-- 4 groups
			{ 
				{ -72, 1 }, { 50, -52 }, { -25, 130 }, { 96, 80 },
			},
			-- 5 groups
			{ 
				{ -75, -96 }, { 75, -96 }, { 0, -1 }, { -75, 94 }, { 75, 94 },
			},
			-- 6 groups
			{ 
				{ -60, -102 }, { 60, -102 }, { -60, 8 }, { 60, 8 }, { -60, 118 }, { 60, 118 },
			},
			-- 7 groups
			{ 
				{ -32, -100 }, { 87, -100 }, { -91, 0 }, { 27, 0 }, { 145, 0 }, { -32, 100 }, { 87, 100 },
			},
			-- 8 groups
			{ 
				{ -91, -100 }, { 27, -100 }, { 145, -100 }, { -91, 6 }, { 27, 6 }, { 145, 6 }, { -32, 112 }, { 87, 112 },
			},
			-- 9 groups
			{ 
				{ -91, -100 }, { 27, -100 }, { 145, -100 }, { -91, 6 }, { 27, 6 }, { 145, 6 }, { -91, 112 }, { 27, 112 }, { 145, 112 },
			},
			-- 10 groups
			{ 
				{ 8, -120 }, { -92, -68 }, { 108, -68 }, { 8, -28 }, { -92, 24 }, { 108, 24 }, { 8, 66 }, { -92, 116 }, { 108, 116 }, { 8, 158 },
			},
		}
	
		-- position of items as they scale up after correct answer (on iPad)
		countItemPositions = { 
			-- 1 group
			{ 
				{ 0, -21 },
			},
			-- 2 groups
			{ 
				{ -90, -21 }, { 90, -21 },
			},
			-- 3 groups
			{ 
				{ -150, -21 }, { 0, -24 }, { 150, -20 }, --{ -70, -20 }, { 75, -70 }, { 49, 85 },
			},
			-- 4 groups --
			{ 
				{ -165, -27 }, { -55, -25 }, { 55, -24 }, { 165, -29 }, --{ -77, -23 }, { 45, -78 }, { -30, 110 }, { 95, 60 },
			},
			-- 5 groups --
			{ 
				{ -184, -25 }, { -92, -22 }, { 0, -27 }, { 92, -29 }, { 184, -25 },
			},
			-- 6 groups --
			{ 
				{ -184, -70 }, { -92, -70 }, { 0, -70 }, { 92, -70 }, { 184, -70 }, { -184, 20 },
				-- { -50, -66 }, { 50, -66 }, { -50, 22 }, { 50, 22 }, { -50, 110 }, { 50, 110 },
			},
			-- 7 groups --
			{ 
				{ -184, -70 }, { -92, -70 }, { 0, -70 }, { 92, -70 }, { 184, -70 }, { -184, 20 }, { -92, 20 }, --{ 0, 20 }, { 92, 20 }, { 184, 20 }, { -184, 20 },
				-- { -31, -75 }, { 64, -75 }, { -82, 14 }, { 15, 14 }, { 111, 14 }, { -31, 103 }, { 64, 103 },
			},
			-- 8 groups --
			{ 
				{ -184, -70 }, { -92, -70 }, { 0, -70 }, { 92, -70 }, { 184, -70 }, { -184, 20 }, { -92, 20 }, { 0, 20 }, --{ 92, 20 }, { 184, 20 }, { -184, 20 },
				-- { -81, -75 }, { 16, -75 }, { 112, -75 }, { -81, 14 }, { 16, 14 }, { 112, 14 }, { -30, 103 }, { 65, 103 },
			},
			-- 9 groups --
			{ 
				{ -184, -70 }, { -92, -70 }, { 0, -70 }, { 92, -70 }, { 184, -70 }, { -184, 20 }, { -92, 20 }, { 0, 20 }, { 92, 20 }, --{ 184, 20 }, --{ -184, 20 },
				-- { -76, -67 }, { 15, -67 }, { 105, -67}, { -76, 14 }, { 15, 14 }, { 105, 14 }, { -76, 95 }, { 15, 95 }, { 105, 95 },
			},
			-- 10 groups
			{ 
				{ -184, -70 }, { -92, -70 }, { 0, -70 }, { 92, -70 }, { 184, -70 }, { -184, 20 }, { -92, 20 }, { 0, 20 }, { 92, 20 }, { 184, 20 }, 
				-- { -76, -44 }, { 8, -80 }, { 90, -44 }, { -76, 34 }, { 8, -2 }, { 90, 34 }, { -76, 112 }, { 8, 76 }, { 90, 112 }, { 8, 154 },
			},
		}
		
	
	elseif (display.pixelHeight == 960) then
	--]]
	
		--countImageScale = { 1, 0.8, 0.8, 0.7, 0.7, 0.65, 0.65, 0.65, 0.65, 0.52 } -- iPhone 5 Ratio
		
		

	
		countImageScale = { 1.25, 1, 0.88, 0.672, 0.52, 0.61, 0.61, 0.61, 0.53, 0.53 } -- iPhone 5 Ratio
	
	
		groupImageScale = { 0.85, 0.585, 0.52, 0.45, 0.8, 0.7, 0.7, 0.6, 0.6, 0.6 } --adjusted for Kindergarten background V1
	
		groupItemPositions = { 
			-- 1 group
			{ 
				{ 0, 0 },
			},
			-- 2 groups
			{ 
				{ -90, -18 }, { 90, -10 }, --adjusted to be in a row--adjusted for Kindergarten background V1
			},
			-- 3 groups
			{ 
				{ -155, -30 }, { 0, 10 }, { 155, -22 }, --adjusted to be in a row--adjusted for Kindergarten background V1
			},
			-- 4 groups
			{ 
				{ -77, -23 }, { -30, 110 }, { 45, -78 }, { 95, 60 },
			},
			-- 5 groups
			{ 
				{ -80, -100 }, { 80, -100 }, { 0, 0 }, { -80, 100 }, { 80, 100 },
			},
			-- 6 groups
			{ 
				{ -60, -102 }, { 60, -102 }, { -60, 8 }, { 60, 8 }, { -60, 118 }, { 60, 118 },
			},
			-- 7 groups
			{ 
				{ -32, -100 }, { 87, -100 }, { -91, 0 }, { 27, 0 }, { 145, 0 }, { -32, 100 }, { 87, 100 },
			},
			-- 8 groups
			{ 
				{ -91, -100 }, { 27, -100 }, { 145, -100 }, { -91, 6 }, { 27, 6 }, { 145, 6 }, { -32, 112 }, { 87, 112 },
			},
			-- 9 groups
			{ 
				{ -91, -100 }, { 27, -100 }, { 145, -100 }, { -91, 6 }, { 27, 6 }, { 145, 6 }, { -91, 112 }, { 27, 112 }, { 145, 112 },
			},
			-- 10 groups
			{ 
				{ 8, -120 }, { -92, -68 }, { 108, -68 }, { 8, -28 }, { -92, 24 }, { 108, 24 }, { 8, 66 }, { -92, 116 }, { 108, 116 }, { 8, 158 },
			},
		}
	
		--[[countItemPositions = { 
			-- 1 group
			{ 
				{ 0, 0 },
			},
			-- 2 groups
			{ 
				{ -55, 66 }, { 62, -45 },
			},
			-- 3 groups
			{ 
				{ -70, -20 }, { 75, -70 }, { 49, 85 },
			},
			-- 4 groups --
			{ 
				{ -77, -23 }, { 45, -78 }, { -30, 110 }, { 95, 60 },
			},
			-- 5 groups --
			{ 
				{ -80, -100 }, { 80, -100 }, { 0, 0 }, { -80, 100 }, { 80, 100 },
			},
			-- 6 groups --
			{ 
				{ -60, -102 }, { 60, -102 }, { -60, 8 }, { 60, 8 }, { -60, 118 }, { 60, 118 },
			},
			-- 7 groups --
			{ 
				{ -32, -100 }, { 87, -100 }, { -91, 0 }, { 27, 0 }, { 145, 0 }, { -32, 100 }, { 87, 100 },
			},
			-- 8 groups --
			{ 
				{ -91, -100 }, { 27, -100 }, { 145, -100 }, { -91, 6 }, { 27, 6 }, { 145, 6 }, { -32, 112 }, { 87, 112 },
			},
			-- 9 groups --
			{ 
				{ -91, -100 }, { 27, -100 }, { 145, -100 }, { -91, 6 }, { 27, 6 }, { 145, 6 }, { -91, 112 }, { 27, 112 }, { 145, 112 },
			},
			-- 10 groups
			{ 
				{ -92, -63 }, { 8, -113 }, { 108, -58 }, { -92, 21 }, { 8, -28 }, { 108, 27 }, { -92, 106 }, { 8, 57 }, { 108, 112 }, { 8, 142 },
			},
		}--]]
		
		countItemPositions = { 
			-- 1 group
			{ 
				{ 0, 0 },
			},
			-- 2 groups
			{ 
				{ -88, -14 }, { 88, -14 },
			},
			-- 3 groups
			{ 
				{ -155, -8 }, { 0, -15 }, { 158, -8 },
			},
			-- 4 groups --
			{ 
				{ -180, -12 }, { -60, -20 }, { 60, -24}, { 180, -16 },
			},
			-- 5 groups --
			{ 
				{ -190, -15 }, { -95, -23 }, { 0, -28 }, { 95, -19 }, { 190, -13 },
			},
			-- 6 groups --
			{ 
				{ -112, -55 }, { 0, -55 }, { 112, -55 }, { -112, 55 }, { 0, 55 }, { 112, 55 },
			},
			-- 7 groups --
			{ 
				{ -166, -51 }, { -56, -53 }, { 56, -53 }, { 166, -50 }, { -110, 52 }, { 0, 50 }, { 111, 51 },
			},
			-- 8 groups --
			{ 
				{ -166, -51 }, { -56, -53 }, { 56, -52 }, { 166, -50 }, { -166, 50 }, { -56, 53 }, { 56, 52 }, { 166, 51 },
			},
			-- 9 groups --
			{ 
				{ -190, -55 }, { -95, -53 }, { 0, -59 }, { 95, -57 }, { 190, -55 }, { -142.5, 51 }, { -47.5, 49 }, { 47.5, 47 }, { 142.5, 51 },
			},
			-- 10 groups
			{ 
				{ -190, -52 }, { -95, -53 }, { 0, -55 }, { 95, -54 }, { 190, -52 }, { -190, 48 }, { -95, 46 }, { 0, 44 }, { 95, 47 }, { 190, 50 },
			},
		}
	
	--[[else
	
		countImageScale = { 1, 0.8, 0.8, 0.7, 0.7, 0.65, 0.65, 0.65, 0.65, 0.52 } -- iPhone 5 Ratio
	
		groupImageScale = { 0.85, 0.5, 0.5, 0.45, 0.8, 0.7, 0.7, 0.6, 0.6, 0.6 }
	
		groupItemPositions = { 
			-- 1 group
			{ 
				{ 0, 0 },
			},
			-- 2 groups
			{ 
				{ 62, -45 }, { -55, 66 },
			},
			-- 3 groups
			{ 
				{ -70, -20 }, { 75, -70 }, { 49,85 },
			},
			-- 4 groups
			{ 
				{ -77, -23 }, { 45, -78 }, { -30, 110 }, { 95, 60 },
			},
			-- 5 groups
			{ 
				{ -80, -100 }, { 80, -100 }, { 0, 0 }, { -80, 100 }, { 80, 100 },
			},
			-- 6 groups
			{ 
				{ -60, -102 }, { 60, -102 }, { -60, 8 }, { 60, 8 }, { -60, 118 }, { 60, 118 },
			},
			-- 7 groups
			{ 
				{ -32, -100 }, { 87, -100 }, { -91, 0 }, { 27, 0 }, { 145, 0 }, { -32, 100 }, { 87, 100 },
			},
			-- 8 groups
			{ 
				{ -91, -100 }, { 27, -100 }, { 145, -100 }, { -91, 6 }, { 27, 6 }, { 145, 6 }, { -32, 112 }, { 87, 112 },
			},
			-- 9 groups
			{ 
				{ -91, -100 }, { 27, -100 }, { 145, -100 }, { -91, 6 }, { 27, 6 }, { 145, 6 }, { -91, 112 }, { 27, 112 }, { 145, 112 },
			},
			-- 10 groups
			{ 
				{ 8, -120 }, { -92, -68 }, { 108, -68 }, { 8, -28 }, { -92, 24 }, { 108, 24 }, { 8, 66 }, { -92, 116 }, { 108, 116 }, { 8, 158 },
			},
		}
	
		countItemPositions = { 
			-- 1 group --
			{ 
				{ 0, 0 },
			},
			-- 2 groups
			{ 
				{ -55, 66 }, { 62, -45 },
			},
			-- 3 groups --
			{ 
				{ -70, -20 }, { 75, -70 }, { 49, 85 },
			},
			-- 4 groups --
			{ 
				{ -77, -23 }, { 45, -78 }, { -30, 110 }, { 95, 60 },
			},
			-- 5 groups --
			{ 
				{ -80, -100 }, { 80, -100 }, { 0, 0 }, { -80, 100 }, { 80, 100 },
			},
			-- 6 groups --
			{ 
				{ -60, -102 }, { 60, -102 }, { -60, 8 }, { 60, 8 }, { -60, 118 }, { 60, 118 },
			},
			-- 7 groups --
			{ 
				{ -32, -100 }, { 87, -100 }, { -91, 0 }, { 27, 0 }, { 145, 0 }, { -32, 100 }, { 87, 100 },
			},
			-- 8 groups --
			{ 
				{ -91, -100 }, { 27, -100 }, { 145, -100 }, { -91, 6 }, { 27, 6 }, { 145, 6 }, { -32, 112 }, { 87, 112 },
			},
			-- 9 groups --
			{ 
				{ -91, -100 }, { 27, -100 }, { 145, -100 }, { -91, 6 }, { 27, 6 }, { 145, 6 }, { -91, 112 }, { 27, 112 }, { 145, 112 },
			},
			-- 10 groups --
			{ 
				{ -92, -78 }, { 8, -128 }, { 108, -73 }, { -92, 6 }, { 8, -43 }, { 108, 12 }, { -92, 91 }, { 8, 42 }, { 108, 107 }, { 8, 127 },
			},
		}
	
	end--]]
	
	
	--iPad ratios
	
	gameImageScale = { 0.95, 0.61, 0.55, 0.525, 0.4, 0.4, 0.39, 0.35, 0.3475, 0.3475, }
	
	
	gameImagePositions = { --x, y, rotation, flip
		-- 1 card
		{ 
			{ { 0, -2, 0, 0 }, }, 
		},
		-- 2 cards
		{ 
			{ { -45, -37, -5, 0 }, { 45, 33, 5, 1 }, },
			-- { { 11, -16, 5, 1 }, { -11, 16, -5, -1 }, }, 
		},
		-- 3 cards
		{ 
			{ { -50, -5, -5, 0 }, { 40, -45, 5, 1 }, { 35, 45, 2, 1 }, }, 
			-- { { 15, 0, 5, 1 }, { -15, -20, 5, 1 }, { -13, 20, -5, 0 }, }, 
			-- { { -17, -23, -5, 1 }, { 0, 0, 5, 0 }, { 17, 23, -5, 1 }, }, 
			-- { { 17, -23, 5, 0 }, { 0, 0, -5, 1 }, { -17, 23, 5, 0 }, }, 
		},
		-- 4 cards
		{ 
			-- { { -25, -8, -3, 0 }, { 25, -25, 0, 1 }, { -25, 25, 3, 1 }, { 25, 8, 0, 0 } }, 
			{ { 48, -39, 3, 1 }, { -42, -50, 0, 0 }, { 42, 48, 2, 0 }, { -46, 35, -2, 1 } },
			-- { { 15, -17, 3, 1 }, { -15, -17, -3, 0 }, { 15, 17, 3, 0 }, { -15, 17, -3, 1 } },
		},
		-- 5 cards
		{
			{ { -55, -55, -3, 1 }, { -55, 55, 3, 0 }, { 0, 0, 0, 1 }, { 55, -55, 3, 0 }, { 55, 55, -3, 1 } }, 
			-- { { -15, -25, -3, 1 }, { -11, 0, 3, 0 }, { -15, 26, -3, 1 }, { 15, -16, 3, 0 }, { 15, 15, -3, 1 } }, 
			-- { { 15, -25, 3, 1 }, { 11, 0, -3, 0 }, { 15, 26, 3, 1 }, { -15, -16, -3, 0 }, { -15, 15, 3, 1 } }, 
		},
		-- 6 cards
		{
			{ { -35, -66, -3, 0 }, { -35, -3, 3, 1 }, { -35, 60, -3, 0 }, { 35, -60, 3, 1 }, { 35, 3, -3, 0 }, { 35, 66, 3, 1 } }, 
			-- { { 13, -26, 3, 0 }, { 13, -3, -3, 1 }, { 13, 20, 3, 0 }, { -13, -20, -3, 1 }, { -13, 3, 3, 0 }, { -13, 26, -3, 1 } }, 
		},
		-- 7 cards
		{
			{ { -41, -60, -3, 0 }, { 41, -60, 3, 1 }, { -70, 0, 0, 0 }, { 0, 0, -3, 1 }, { 70, 0, 0, 0 }, { -41, 60, 3, 1 }, { 41, 60, -3, 0 } }, 
			-- { { -11, 0, -3, 0 }, { 11, 0, 3, 1 }, { -20, -26, 0, 0 }, { 0, -26, 3, 1 }, { 20, -26, 0, 0 }, { -11, 26, 3, 1 }, { 11, 26, -3, 0 } }, 
			-- { { -11, -26, 3, 0 }, { 11, -26, -3, 1 }, { -20, 26, 3, 0 }, { 0, 26, 0, 1 }, { 20, 26, -3, 0 }, { -11, 0, -3, 1 }, { 11, 0, 3, 0 } }, 
		},
		-- 8 cards
		{
			{ { -65, -52, -3, 1 }, { 0, -52, 3, 0 }, { 65, -52, -3, 1 }, { -65,4, 3, 0 }, { 0, 4, -3, 1 }, { 65, 4, 3, 0 }, { -33, 60, 0, 1 }, { 32, 60, 0, 0 } }, 
			-- { { -21, -26, 3, 1 }, { 0, -26, -3, 0 }, { 21, -26, 3, 1 }, { -21, 26, -3, 0 }, { 0, 26, 3, 1 }, { 21, 26, 3, 0 }, { -11, 0, 3, 1 }, { 11, 0, -3, 0 } }, 
			-- { { -21, 26, -3, 1 }, { 0, 26, 3, 0 }, { 21, 26, -3, 1 }, { -21, 0, 3, 0 }, { 0, 0, -3, 1 }, { 21, 0, 3, 0 }, { -11, -26, -3, 1 }, { 11, -26, 3, 0 } }, 
		},
		-- 9 cards
		{
			{ { -60, -61, 0, 1 }, { -60, -3, 0, 0 }, { -60, 55, 0, 1 }, { 0, -53, 0, 0 }, { 0, 4, 0, 1 }, { 0, 63, 0, 0 }, { 60, -61, 0, 1 }, { 60, -3, 0, 0 }, { 60, 55, 0, 1 } }, 
			-- { { -20, -18, 0, 1 }, { -20, 4, 0, 0 }, { -20, 28, 0, 1 }, { 0, -26, 0, 0 }, { 0, -3, 0, 1 }, { 0, 20, 0, 0 }, { 20, -18, 0, 1 }, { 20, 4, 0, 0 }, { 20, 28, 0, 1 } }, 
		},
		-- 10 cards
		{
			{ { -60, -57, 0, 1 }, { -60, -2, 0, 0 }, { -60, 53, 0, 1 }, { 0, -86, 0, 0 }, { 0, -30, 0, 1 }, { 0, 26, 0, 0 }, { 0, 82, 0, 1 }, { 60, -56, 0, 1 }, { 60, -2, 0, 0 }, { 60, 52, 0, 1 } }, 
			-- { { -20, -30, 0, 1 }, { 0, -30, 0, 0 }, { 20, -30, 0, 1 }, { -10, -10, 0, 0 }, { 10, -10, 0, 1 }, { -20, 10, 0, 0 }, { 0, 10, 0, 1 }, { 20, 10, 0, 1 }, { -10, 30, 0, 0 }, { 10, 30, 0, 1 } }, 
			-- { { -20, -10, 0, 1 }, { 0, -10, 0, 0 }, { 20, -10, 0, 1 }, { -10, -30, 0, 0 }, { 10, -30, 0, 1 }, { -20, 30, 0, 0 }, { 0, 30, 0, 1 }, { 20, 30, 0, 1 }, { -10, 10, 0, 0 }, { 10, 10, 0, 1 } }, 
		},
	}
	
	
	
	local randomColors = {}
	local randomColor
	for i = 1, game3ImageOptions[game3CurImage].numColors do
	
		randomColors[i] = i
	
	end
	if (#randomColors > 1) then
		randomColor = math.random( 1, #randomColors )
	end
	
	
	
	
	local function outExpo(t, b, c, d)
	  if t == d then
		return b + c
	  else
		return c * 1.001 * (-math.pow(2, -10 * t / d) + 1) + b
	  end
	end
	
	function readBubbleCountingVO(touched)
	
		if (timerPopVO) then
			timer.cancel(timerPopVO)
			timerPopVO = nil
		end
		
		local function playNumVO()
		
			if savedData.enableSounds == true then
				playReservedChannel( gameNumSounds[numImagesAnswer], 28, 0 )
			end
			
			currentGameChannel = currentGameChannel + 1
			if (currentGameChannel > 25) then
				currentGameChannel = 20
			end
		
		
			local function playItemVO()
			
				if savedData.enableSounds == true then
					if (numImagesAnswer > 1) then
						playReservedChannel( gameSounds[game3ImageOptions[game3CurImage].id], 28, 0 )
					else
						playReservedChannel( gameSoundsSingular[game3ImageOptions[game3CurImage].id], 28, 0 )
					end
				end
				
				currentGameChannel = currentGameChannel + 1
				if (currentGameChannel > 25) then
					currentGameChannel = 20
				end
			
			
			end
			timerPopVO = timer.performWithDelay( 900, playItemVO )
		
		end
		
		
		local function startPopVO()
	
			if (randomVO == 1 and numGroups ~= 1) then
			
				if savedData.enableSounds == true then
					if (game3BubbleOptions[game3CurBubble].id == "Bubble") then
						playReservedChannel( whichBubbleHas, 28, 0 )
					
					elseif (game3BubbleOptions[game3CurBubble].id == "Balloon") then
						playReservedChannel( whichBalloonHas, 28, 0 )
					
					else
						playReservedChannel( whichCloudHas, 28, 0 )
					
					end
					currentGameChannel = currentGameChannel + 1
					if (currentGameChannel > 25) then
						currentGameChannel = 20
					end
				end
			
				-- randomVOChoice = 1
				
				timerPopVO = timer.performWithDelay( 1400, playNumVO )
			else
			
				if savedData.enableSounds == true then
					if (game3BubbleOptions[game3CurBubble].id == "Bubble") then
						playReservedChannel( popTheBubbleWith, 28, 0 )
					
					elseif (game3BubbleOptions[game3CurBubble].id == "Balloon") then
						playReservedChannel( popTheBalloonWith, 28, 0 )
					
					else
						playReservedChannel( popTheCloudWith, 28, 0 )
					
					end
					currentGameChannel = currentGameChannel + 1
					if (currentGameChannel > 25) then
						currentGameChannel = 20
					end
				end
			
				-- randomVOChoice = 2
				
				timerPopVO = timer.performWithDelay( 1200, playNumVO )
			end
		
		end
		
		startPopVO()
		
		
	
	end
	
	---------------------------------------    
    -- update function
    ---------------------------------------  
	
	
	function this.enterFrame(e)
	
		for i = #gameGroups, 1, -1 do
			if (gameGroups[i].startingTrans == true) then
				
				gameGroups[i].currentTime = gameGroups[i].currentTime + 1
				
				if (gameGroups[i].currentTime < gameGroups[i].duration) then
					gameGroups[i].x = outExpo(gameGroups[i].currentTime, gameGroups[i].startX, gameGroups[i].differenceX, gameGroups[i].duration)
					gameGroups[i].y = outExpo(gameGroups[i].currentTime, gameGroups[i].startY, gameGroups[i].differenceY, gameGroups[i].duration)
				
					gameGroups[i].floatX = gameGroups[i].x
					gameGroups[i].floatY = gameGroups[i].y
									
				end
				
			end
			
			if (gameGroups[i].floatX == nil) then
				gameGroups[i].floatX = gameGroups[i].x
				gameGroups[i].floatY = gameGroups[i].y
			end
			
			local floatRangeGroup = 12
			
			gameGroups[i].frame = gameGroups[i].frame + 1
					
			if (gameGroups[i].idType == "Cloud") then
				gameGroups[i].x =  gameGroups[i].floatX + floatRangeGroup/2 * math.sin(gameGroups[i].frame/120)
				gameGroups[i].y =  gameGroups[i].floatY + 2 * math.sin(gameGroups[i].frame/80)
			else
				-- gameGroups[i].y =  gameGroups[i].floatY + floatRangeGroup * math.sin(gameGroups[i].frame/120)
				gameGroups[i].x =  gameGroups[i].floatX + floatRangeGroup * math.sin(gameGroups[i].frame/120)
				gameGroups[i].y =  gameGroups[i].floatY + 4 * math.sin(gameGroups[i].frame/80)
			end
			
		end

		for k = #floaters, 1, -1 do
			for i = 1, #gameImages do

				if (floaters[k] == gameImages[i].id) then
					if (gameImages[i].idType == "bubble") then
						gameImages[i].xScale = gameImages[i].xScale + .0003 * math.sin(gameImages[i].frame/25)
						gameImages[i].yScale = gameImages[i].yScale + .0003 * math.sin(gameImages[i].frame/20)
					end
					gameImages[i].frame = gameImages[i].frame + 1
					gameImages[i].y =  gameImages[i].initY + floatRangeItem * math.sin(gameImages[i].frame/30)
				end
				
			end
		end
		

		gameTime = gameTime + 1
		-- if (gameTime > playInstructionsTime) then
			-- if (isEndGame == false or isEndGame == nil) then
				-- startInstructions()
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
				currentGameChannel = 20
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
						currentGameChannel = 20
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
						
						if (game3ImageOptions[game3CurImage].sound) then
							playReservedChannel( gameSounds[game3ImageOptions[game3CurImage].sound], currentGameChannel, 0 )
						else
							local randomRewardVO = math.random( 1, #randomRewardSounds )
				
							playReservedChannel( gameSounds[randomRewardSounds[randomRewardVO]], currentGameChannel, 0 )
							
						end
						currentGameChannel = currentGameChannel + 1
						if (currentGameChannel > 25) then
							currentGameChannel = 20
						end
						
						
						if (game3ImageOptions[game3CurImage].soundTwo) then
							playReservedChannel( gameSounds[game3ImageOptions[game3CurImage].soundTwo], currentGameChannel, 0 )
							currentGameChannel = currentGameChannel + 1
							if (currentGameChannel > 25) then
								currentGameChannel = 20
							end
						end
						
						
						
						for i = 1, #gameImages do
						
							gameImages[i].initX = gameImages[i].x
							gameImages[i].initY = gameImages[i].y
							gameImages[i].initR = gameImages[i].rotation
							-- gameImages[i].animationInfo = gameImages[i].rewardAnim
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
	
	
        if not self.isLive or not self.isTouchEnable then return end

        local target = event.target
		
		gameTime = 0
        -- Key pressed --
        if(event.phase == "began") then
            -- display.getCurrentStage():setFocus(target)
            -- target._isFocus = true
            
			
			
			scaleCurrentCountingItem( target )
			
			
        end -- touch began, moved, ended, cancelled

        return true
    end
    
	
	
	function bubbleCountingTap( event )

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
				
			
			
				if (target.id == numImagesAnswer) then
			
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
			
					for i = 1, #gameGroups do
						gameGroups[i]:removeEventListener("touch", bubbleCountingTap)
					end
					
					Runtime:removeEventListener("enterFrame", this)
			
			
					for i = #floaters, 1, -1 do
						if (floaters[i] == target.id) then
							table.remove( floaters, i )
						end
					end
					
					
					local function moveItemsToCenter()
				
						local currentItemGroup = 0
						local currentCountVO = 1
						tempGroup = display.newGroup()
						
						for i = gameGroups[currentAnswerGroup].numChildren, 1, -1 do
						
							for k = #floaters, 1, -1 do
								if (floaters[k] == gameGroups[currentAnswerGroup][i].id) then
									table.remove( floaters, k )
								end
							end
						
							local oldX, oldY = gameGroups[currentAnswerGroup][i]:localToContent( 0, 0 )
							local oldScale = gameGroups[currentAnswerGroup][i].xScale
							gameGroups[currentAnswerGroup][i].oldX = oldX
							gameGroups[currentAnswerGroup][i].oldY = oldY
							
							local tempItem = gameGroups[currentAnswerGroup][i]
							
							display.currentStage:insert( gameGroups[currentAnswerGroup][i] )
							tempGroup:insert( tempItem )
							
							tempItem.xScale, tempItem.yScale = oldScale*gameGroups[currentAnswerGroup].xScale, oldScale*gameGroups[currentAnswerGroup].yScale
							
							
						end
						
						tempGroup.gameNumbers = gameGroups[currentAnswerGroup].gameNumbers
						-- for i = #tempGroup.gameNumbers, 1, -1 do
							-- tempGroup:insert( tempGroup.gameNumbers[i] )
						-- end
						
						gameGroup:insert( tempGroup )
						
						-- if system.getInfo("model") == "iPad" then
			
							-- gameGroup.xScale = 0.82
							-- gameGroup.yScale = 0.82
							-- gameGroup.x = 40
							-- gameGroup.y = 68
							
							
						-- elseif (display.pixelHeight == 960) then
						
							-- gameGroup.xScale = 0.82
							-- gameGroup.yScale = 0.82
							-- gameGroup.x = 60
							-- gameGroup.y = 55
							
						
						-- else
						
							-- gameGroup.xScale = 0.95
							-- gameGroup.yScale = 0.95
							-- gameGroup.x = 45
							-- gameGroup.y = 40
						
						
						-- end
						
						
						
						
						for i = tempGroup.numChildren, 1, -1 do
						
							local newX, newY = tempGroup[i].oldX, tempGroup[i].oldY
							local correctLoc = false
						
							repeat
								correctLoc = false
							
								tempGroup[i].x = newX
								tempGroup[i].y = newY
							
								local tempX, tempY = tempGroup[i]:localToContent( 0, 0 )
							
								if (tempX > tempGroup[i].oldX - 1 and 
									tempX < tempGroup[i].oldX + 1 and
									tempY > tempGroup[i].oldY - 1 and
									tempY < tempGroup[i].oldY + 1) then
								
									correctLoc = true
								else
									
									if (tempX > tempGroup[i].oldX - 1 and
										tempX < tempGroup[i].oldX + 1) then
										
									else
										if (tempX > tempGroup[i].oldX) then
											newX = newX - 1
										else
											newX = newX + 1
										end
									end
									
									if (tempY > tempGroup[i].oldY - 1 and
										tempY < tempGroup[i].oldY + 1) then
										
									else
										if (tempY > tempGroup[i].oldY) then
											newY = newY - 1
										else
											newY = newY + 1
										end
									end
									
								end
								
							until correctLoc == true
						
						end
						
						
						
						local function countVO( item )
						
						
							if savedData.enableSounds == true then
								playReservedChannel( gameNumSounds[currentCountVO], currentGameChannel, 0 )
								
								currentGameChannel = currentGameChannel + 1
								if (currentGameChannel > 25) then
									currentGameChannel = 20
								end
							end
						
						
							
							
							item.parent.gameNumbers[currentCountVO]:toFront()
				
							local offsetX = item.contentWidth * game3ImageOptions[game3CurImage].numOffsetX
							local offsetY = item.contentHeight * game3ImageOptions[game3CurImage].numOffsetY
							
							
							item.parent.gameNumbers[currentCountVO].x = item.x - (item.contentWidth*0.5) + offsetX
							item.parent.gameNumbers[currentCountVO].y = item.y - (item.contentHeight*0.5) + offsetY
							item.parent.gameNumbers[currentCountVO].rotation = item.rotation
							item.parent.gameNumbers[currentCountVO].xScale, item.parent.gameNumbers[currentCountVO].yScale = math.abs(item.initScale), math.abs(item.initScale)
							item.parent.gameNumbers[currentCountVO].origScale = item.parent.gameNumbers[currentCountVO].xScale
							item.parent.gameNumbers[currentCountVO].popScale = item.parent.gameNumbers[currentCountVO].origScale + 0.2
							item.parent.gameNumbers[currentCountVO].initScale = item.parent.gameNumbers[currentCountVO].xScale
							item.parent.gameNumbers[currentCountVO].initX = item.parent.gameNumbers[currentCountVO].x
							item.parent.gameNumbers[currentCountVO].initY = item.parent.gameNumbers[currentCountVO].y
							item.parent.gameNumbers[currentCountVO].initR = item.parent.gameNumbers[currentCountVO].rotation
							item.parent.gameNumbers[currentCountVO].animationInfo = game3ImageOptions[game3CurImage].animation
							item.parent.gameNumbers[currentCountVO].bounceY = item.parent.gameNumbers[currentCountVO].y
							
							item.parent.gameNumbers[currentCountVO].xScale = item.parent.gameNumbers[currentCountVO].popScale
							item.parent.gameNumbers[currentCountVO].yScale = item.parent.gameNumbers[currentCountVO].popScale
							item.parent.gameNumbers[currentCountVO].alpha = 1
							
							-- transition.to( item.parent.gameNumbers[currentCountVO], { delay = 0, time=50 , alpha = 1, xScale = item.parent.gameNumbers[currentCountVO].popScale, yScale = item.parent.gameNumbers[currentCountVO].popScale, transition=easing.inExpo } )
							transition.to( item.parent.gameNumbers[currentCountVO], { delay = 0, time=50 , alpha = 1, xScale = item.parent.gameNumbers[currentCountVO].origScale, yScale = item.parent.gameNumbers[currentCountVO].origScale, transition=easing.outExpo} )
			
							item:setFillColor( .76, .76, .76)
							
							transition.to( item, { time=100 , xScale = item.initScale, yScale = item.initScale, transition=easing.outExpo } )
							
							
							currentCountVO = currentCountVO + 1
							
							if (currentCountVO > tempGroup.numChildren-1) then
								
								
								local function itemNameVO()
								
								
									if savedData.enableSounds == true then
									
										if (tempGroup.numChildren-1 > 1) then
											playReservedChannel( gameSounds[game3ImageOptions[game3CurImage].id], currentGameChannel, 0 )
										else
											playReservedChannel( gameSoundsSingular[game3ImageOptions[game3CurImage].id], currentGameChannel, 0 )
										end
									
										currentGameChannel = currentGameChannel + 1
										if (currentGameChannel > 25) then
											currentGameChannel = 20
										end
									end
								
									
									
									local function playRewardVO()
			
										if savedData.enableSounds == true then
											
											if (game3ImageOptions[game3CurImage].sound) then
												playReservedChannel( gameSounds[game3ImageOptions[game3CurImage].sound], currentGameChannel, 0 )
											else
												local randomRewardVO = math.random( 1, #randomRewardSounds )
									
												playReservedChannel( gameSounds[randomRewardSounds[randomRewardVO]], currentGameChannel, 0 )
												
											end
											
											-- if (game3ImageOptions[game3CurImage].sound) then
												-- playReservedChannel( gameSounds[game3ImageOptions[game3CurImage].sound], currentGameChannel, 0 )
											-- end
											currentGameChannel = currentGameChannel + 1
											if (currentGameChannel > 25) then
												currentGameChannel = 20
											end
											
											
											
											if (game3ImageOptions[game3CurImage].soundTwo) then
												playReservedChannel( gameSounds[game3ImageOptions[game3CurImage].soundTwo], currentGameChannel, 0 )
												currentGameChannel = currentGameChannel + 1
												if (currentGameChannel > 25) then
													currentGameChannel = 20
												end
											end
											
											-- if (game3ImageOptions[game3CurImage].soundTwo) then
												-- playReservedChannel( gameSounds[game3ImageOptions[game3CurImage].soundTwo], currentGameChannel, 0 )
												-- currentGameChannel = currentGameChannel + 1
												-- if (currentGameChannel > 25) then
													-- currentGameChannel = 20
												-- end
											-- end
										
										end
										
										
										
										for i = 1, #gameImages do
										
											gameImages[i].initX = gameImages[i].x
											gameImages[i].initY = gameImages[i].y
											gameImages[i].initR = gameImages[i].rotation
										
											-- gameImages[i].animationInfo = gameImages[i].rewardAnim
											-- gameNumbers[i].animationInfo = gameNumbers[i].rewardAnim
											if (gameImages[i].animation) then
											else
												if (gameImages[i].animationInfo ~= nil) then
													animateStart( gameImages[i] )
												end
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
								rewardTimer = timer.performWithDelay( 700, itemNameVO )
								
							end
						
						end
						
						
						
						if savedData.enableSounds == true then
							playReservedChannel( gameSounds.corner, currentGameChannel, 0 )
							
							currentGameChannel = currentGameChannel + 1
							if (currentGameChannel > 25) then
								currentGameChannel = 20
							end
						end
						
						
						
						
						for i = tempGroup.numChildren, 1, -1 do
							if (i < tempGroup.numChildren) then
							
								-- transition.to( tempGroup[i], { delay = 600 + (currentItemGroup*700), time=100 , x = halfW + 86 + groupItemPositions[tempGroup.numChildren-1][i][1], y = halfH - 20 + groupItemPositions[tempGroup.numChildren-1][i][2], xScale = countImageScale[tempGroup.numChildren-1], yScale = countImageScale[tempGroup.numChildren-1], transition=easing.inOutExpo, onComplete = countVO } )
								
								
								transition.to( tempGroup[currentItemGroup], { delay = 0 + math.random(0, 100), time=300 , x = halfW + countItemPositions[tempGroup.numChildren-1][i][1], y = halfH - 40 + countItemPositions[tempGroup.numChildren-1][i][2], xScale = countImageScale[tempGroup.numChildren-1], yScale = countImageScale[tempGroup.numChildren-1], transition=easing.inOutExpo } )
							
							
								if (currentItemGroup > tempGroup.numChildren - 2) then
									
									local function scalePopItems()
									
										currentItemGroup = 0
										
										for k = tempGroup.numChildren, 1, -1 do
											if (k < tempGroup.numChildren) then
										
												tempGroup[k].initScale = countImageScale[tempGroup.numChildren-1]
												tempGroup[k].popScale = tempGroup[k].initScale + (tempGroup[k].initScale*0.3)
												tempGroup[k].anim = transition.to( tempGroup[k], { delay = 0 + (currentItemGroup*700), time=100 , xScale = tempGroup[k].popScale, yScale = tempGroup[k].popScale, transition=easing.inExpo, onComplete = countVO } )
									
										
											end
											
											currentItemGroup = currentItemGroup + 1
										end
									
									end
									
									timer.performWithDelay( 0, scalePopItems )
									
									
								end
							
								
								
							end
						
							currentItemGroup = currentItemGroup + 1
						end
						
						
						
						
						
						
					
					end
					
					
					
					for i = #gameGroups, 1, -1 do
					
						if (gameGroups[i] == target) then
						
							
							currentAnswerGroup = i
							rewardTimer = timer.performWithDelay( 300, moveItemsToCenter )
							
							
							if savedData.enableSounds == true then
								
								if (game3BubbleOptions[game3CurBubble].id == "Bubble") then
									playReservedChannel( popSounds[math.random(1,#popSounds)], currentGameChannel, 0 )
								elseif (game3BubbleOptions[game3CurBubble].id == "Balloon") then
									playReservedChannel( gameSounds.balloonPop, currentGameChannel, 0 )
								else
									playReservedChannel( gameSounds.poof, currentGameChannel, 0 )
								end
								
								currentGameChannel = currentGameChannel + 1
								if (currentGameChannel > 25) then
									currentGameChannel = 20
								end
							end
							
				
							
							
							local function scaleBackGroup( obj )
							
								local groupX, groupY = obj:localToContent( 0, 0 )
								local groupScale = obj.xScale
								
							
								if (game3BubbleOptions[game3CurBubble].id == "Bubble") then
							
									explosions:toFront()
							
									local function addParticleBubble()
										local size = math.random(-6,6)
										local randomOffset = math.random(-40,40)
										-- Particles:newEmitter(particleLayer,"splash", particleFilePath.."bubble.png", 9*o.yScale, 16*o.yScale, 1, particleX+math.random(-30,30), particleY, -7, 7, -10, -1, 255, 255, 255, 0*o.yScale)
										Particles:newEmitter(explosions,"splash", "Images/Particles/bubble.png", (9+size)*groupScale, (16+size)*groupScale, 1, groupX+randomOffset, groupY+randomOffset, -9, 9, -12, -1, 255, 255, 255)
									end
									
									addParticleBubble()
									timer.performWithDelay( 0, addParticleBubble, 9 )
									
								elseif (game3BubbleOptions[game3CurBubble].id == "Balloon") then
									
									explosions:toFront()
									
									-- local function addParticleBalloon()
										-- local randomOffset = math.random(-40,40)
										Particles:newEmitter(explosions,"fireworksOffscreen", "Images/Particles/confettiParticle.png", 60, 60, 9, groupX, groupY-6, -6, 6, -14, 6, 255, 255, 255)
									-- end
									
									-- addParticleBalloon()
									-- timer.performWithDelay( 0, addParticleBalloon, 5 )
									
								else
								
									-- local size = math.random(3,6) / 100
									
									-- explosions:toBack()
									-- gameGroup:toBack()
									-- if (gameBGParticlesOne) then
										-- gameBGParticlesOne:toBack()
									-- end
									-- if (gameBGParticlesTwo) then
										-- gameBGParticlesTwo:toBack()
									-- end
									-- if (gameBG) then
										-- gameBG:toBack()
									-- end
									-- bgSky:toBack()
									
									local function addParticleCloud()
										local size = math.random(15,55)
										local randomOffset = math.random(-40,40)
										Particles:newEmitter(explosions,"sloMoExplode2", "Images/popCloud.png", size*groupScale, size*groupScale, 1, groupX+randomOffset, groupY+randomOffset, -3.5, 3.5, -6.5, -1, 255, 255, 255, 384)
									end
									
									addParticleCloud()
									timer.performWithDelay( 0, addParticleCloud, 7 )
									
								end
							
								transition.to( gameGroups[i], { time=100, xScale = target.initScale, yScale = target.initScale, transition=easing.outExpo } )
							
								-- transition.to( gameGroups[i][1], { time=100 , alpha = 0, xScale = 0.01, yScale = 0.01, transition=easing.outExpo } )
							end
							
							if (game3BubbleOptions[game3CurBubble].id == "Cloud") then
								transition.to( gameGroups[i][1], { time=100, alpha = 0, xScale = target.initScale+0.4, yScale = target.initScale+0.4, transition=easing.outQuart } )
							else
								transition.to( gameGroups[i][1], { time=100, alpha = 0, xScale = target.initScale+0.4, yScale = target.initScale+0.4, transition=easing.inExpo } )
							end
							
							transition.to( gameGroups[i], { time=100, xScale = target.initScale+0.4, yScale = target.initScale+0.4, transition=easing.inExpo, onComplete = scaleBackGroup } )
							
						else
							transition.to( gameGroups[i], { time=100, alpha = 0, transition=easing.inExpo} )
						
						end
		
		
					end
					
					
				else
				
					if savedData.enableSounds == true then
						playReservedChannel( wrongSound, currentGameChannel, 0 )
						
						currentGameChannel = currentGameChannel + 1
						if (currentGameChannel > 25) then
							currentGameChannel = 20
						end
					end
				
			
					transition.to( target, { time=100 , xScale = target.initScale-0.4, yScale = target.initScale-0.4, transition=easing.inExpo} )
					transition.to( target, { delay = 100, time=100 , xScale = target.initScale, yScale = target.initScale, transition=easing.outExpo, onComplete = makeButtonsActive } )
		
			
				end
				
				
			end
			
		end
		
	end
	
	
	
	
	local function showBubbleCounting()
	
		for i = 1, #gameGroups do
			gameGroups[i]:addEventListener("touch", bubbleCountingTap)
			
			local function groupsFloatUpEnd( obj )
			
				if (gameGroup) then
					gameGroup:toFront()
				end
				if (cursor) then
					cursor:toFront()
				end
				
			end
			
			gameGroups[i].alpha = 1
			
			
				if (game3BubbleOptions[game3CurBubble].id == "Balloon") then
					-- gameGroups[i].duration = math.random( 80, 120 )
					gameGroups[i].duration = 70 + (i*(100/#gameGroups))
				elseif (game3BubbleOptions[game3CurBubble].id == "Cloud") then
					-- gameGroups[i].duration = math.random( 80, 120 )
					gameGroups[i].duration = 50 + (i*(30/#gameGroups))
				else
					-- gameGroups[i].duration = math.random( 80, 120 )
					gameGroups[i].duration = 30 + (i*(100/#gameGroups))
				end
			
				gameGroups[i].currentTime = 0
				gameGroups[i].startX = gameGroups[i].x
				gameGroups[i].startY = gameGroups[i].y
				gameGroups[i].floatX = gameGroups[i].x
				gameGroups[i].floatY = gameGroups[i].y
				gameGroups[i].differenceX = -math.abs(gameGroups[i].initX - gameGroups[i].startX)
				gameGroups[i].differenceY = -math.abs(gameGroups[i].initY - gameGroups[i].startY)
				gameGroups[i].startingTrans = true
				
				
				
				if (i == #gameGroups) then
				
					groupStartTimer = timer.performWithDelay( 1500, groupsFloatUpEnd )
					
					if savedData.enableSounds == true then
						if (game3BubbleOptions[game3CurBubble].id == "Balloon") then
							playReservedChannel( gameSounds.balloonSound, currentGameChannel, 0 )
						elseif (game3BubbleOptions[game3CurBubble].id == "Cloud") then
							playReservedChannel( gameSounds.cloudSound, currentGameChannel, 0 )
						else
							playReservedChannel( gameSounds.bubbleSound, currentGameChannel, 0 )
						end
						
						currentGameChannel = currentGameChannel + 1
						if (currentGameChannel > 25) then
							currentGameChannel = 20
						end
					end
					
				
				end
				
				
		end
	
	
		local function startBubbleVO()
			readBubbleCountingVO(false)
		end
		timerPopVO = timer.performWithDelay( 100, startBubbleVO )
		
		
		
		
		
		questionText.x = 1000
		
		
		randomVO = math.random( 1, 2 )
		randomVOChoice = 1
		
		
		if (randomVO == 1 and numGroups ~= 1) then
			
			if savedData.enableSounds == true then
				if (game3BubbleOptions[game3CurBubble].id == "Bubble") then
					
					if (numImagesAnswer > 1) then
						questionText.text = "Which bubble has " .. tostring(numImagesAnswer) .. " " .. game3ImageOptions[game3CurImage].pluralText .. "?"
					else
						questionText.text = "Which bubble has " .. tostring(numImagesAnswer) .. " " .. game3ImageOptions[game3CurImage].singularText .. "?"
					end
					
				elseif (game3BubbleOptions[game3CurBubble].id == "Balloon") then
					
					if (numImagesAnswer > 1) then
						questionText.text = "Which balloon has " .. tostring(numImagesAnswer) .. " " .. game3ImageOptions[game3CurImage].pluralText .. "?"
					else
						questionText.text = "Which balloon has " .. tostring(numImagesAnswer) .. " " .. game3ImageOptions[game3CurImage].singularText .. "?"
					end
				
				else
					
					if (numImagesAnswer > 1) then
						questionText.text = "Which cloud has " .. tostring(numImagesAnswer) .. " " .. game3ImageOptions[game3CurImage].pluralText .. "?"
					else
						questionText.text = "Which cloud has " .. tostring(numImagesAnswer) .. " " .. game3ImageOptions[game3CurImage].singularText .. "?"
					end
				
				end
				
			end
		
			randomVOChoice = 1
		
		else
		
			if savedData.enableSounds == true then
				if (game3BubbleOptions[game3CurBubble].id == "Bubble") then
					
					if (numImagesAnswer > 1) then
						questionText.text = "Pop the bubble with " .. tostring(numImagesAnswer) .. " " .. game3ImageOptions[game3CurImage].pluralText .. "."
					else
						questionText.text = "Pop the bubble with " .. tostring(numImagesAnswer) .. " " .. game3ImageOptions[game3CurImage].singularText .. "."
					end
				
				elseif (game3BubbleOptions[game3CurBubble].id == "Balloon") then
					
					if (numImagesAnswer > 1) then
						questionText.text = "Pop the balloon with " .. tostring(numImagesAnswer) .. " " .. game3ImageOptions[game3CurImage].pluralText .. "."
					else
						questionText.text = "Pop the balloon with " .. tostring(numImagesAnswer) .. " " .. game3ImageOptions[game3CurImage].singularText .. "."
					end
				
				else
					if (numImagesAnswer > 1) then
						questionText.text = "Pop the cloud with " .. tostring(numImagesAnswer) .. " " .. game3ImageOptions[game3CurImage].pluralText .. "."
					else
						questionText.text = "Pop the cloud with " .. tostring(numImagesAnswer) .. " " .. game3ImageOptions[game3CurImage].singularText .. "."
					end
				
				end
			end
		
			randomVOChoice = 2
			
		end
		
		
		
		if system.getInfo( "platformName" ) == "Android" then
			questionText.y = questionText.y  - 25
		end
		
		
		questionText.anchorX = 0.5
		questionText.anchorY = 0.5
		questionText.x = 1000
		questionText.alpha = 1
	
		-- cardTrans = transition.to( cardGroup, { time=700, x=halfW+cardOptions.offsetX, transition=easing.outExpo } )
		transition.to( questionText, { delay = 100, time=700, x=halfW, transition=easing.outExpo } )
		transition.to( questionTextTwo, { delay = 900, time=700, x=halfW, transition=easing.outExpo } )
	
	
	
		local function addGameListeners()
			-- bg:addEventListener("touch", this)
			Runtime:addEventListener("enterFrame", this)
			
			-- if (myData.isController) then
				-- Runtime:addEventListener( "key", bubbleCountingTap )
			-- elseif (myData.isFireTV) then
				-- Runtime:addEventListener( "onFTVKey", bubbleCountingTap )
			-- end
		
			-- gameBasketBox:addEventListener("touch", numberButtonTouched)
	
		end
		timer.performWithDelay( 500, addGameListeners )
	
	
		local function showCursor()

			cursor.xScale = cardOptions.scale -- Hand Cursor
			cursor.yScale = cardOptions.scale
			cursor:toFront()
			
			currentCardSelected = 1
			
			if (gameGroups and #gameGroups > 0) then
				-- for i = 1, #gameGroups do
					-- if (gameGroups[i].isAGroupItem == true) then
						-- currentCardSelected = i
						-- break
					-- end
				-- end
				for i = 1, #gameGroups do
					if (gameGroups[i].x < gameGroups[currentCardSelected].x) then
						currentCardSelected = i
					end
				end
				
				
				if system.getInfo( "platformName" ) == "Android" then
					cursor.x, cursor.y = gameGroups[currentCardSelected]:localToContent( (gameGroups[currentCardSelected].contentWidth*0.8), (gameGroups[currentCardSelected].contentHeight*0.5) )
				else
					cursor.x, cursor.y = gameGroups[currentCardSelected]:localToContent( gameGroups[currentCardSelected].contentWidth*0.8, gameGroups[currentCardSelected].contentHeight*0.5 )
				end
			
				targetCard = gameGroups[currentCardSelected]
				cursorTransition = transition.to( cursor, { time=700, alpha=1 } )
			
			end
			
			if (myData.isController) then
				Runtime:addEventListener( "key", bubbleCountingTap )
			elseif (myData.isFireTV) then
				Runtime:addEventListener( "onFTVKey", bubbleCountingTap )
			end
			
			
		end
		
		if (myData.isFireTV or myData.isController) then 
			if (game3BubbleOptions[game3CurBubble].id == "Bubble") then
				cursorTimer = timer.performWithDelay( 1800, showCursor )
			elseif (game3BubbleOptions[game3CurBubble].id == "Balloon") then
				cursorTimer = timer.performWithDelay( 2100, showCursor )
			else
				cursorTimer = timer.performWithDelay( 1500, showCursor )
			end
		end
		
	
	
	end
	
	local function setUpBubbleCounting()
	
		gameGroup = display.newGroup()
		
		for k = 1, numGroups do
		
			gameGroups[#gameGroups+1] = display.newGroup()
			
			
			
			if (game3BubbleOptions[game3CurBubble].numColors > 1) then
				local randomColor = math.random( 1, game3BubbleOptions[game3CurBubble].numColors )
				gameImages[#gameImages+1] = display.newImageRect("Images/pop" .. game3BubbleOptions[game3CurBubble].id .. randomColor .. ".png", game3BubbleOptions[game3CurBubble].w, game3BubbleOptions[game3CurBubble].h )
			else
				gameImages[#gameImages+1] = display.newImageRect("Images/pop" .. game3BubbleOptions[game3CurBubble].id .. ".png", game3BubbleOptions[game3CurBubble].w, game3BubbleOptions[game3CurBubble].h )
			end
			gameImages[#gameImages].x, gameImages[#gameImages].y = game3BubbleOptions[game3CurBubble].offsetX, game3BubbleOptions[game3CurBubble].offsetY
			-- gameImages[#gameImages].xScale ,gameImages[#gameImages].yScale = 0.45, 0.45
			gameImages[#gameImages].frame = math.random( 1 , 300 )
			gameImages[#gameImages].initX = gameImages[#gameImages].x
			gameImages[#gameImages].initY = gameImages[#gameImages].y
			gameImages[#gameImages].initR = gameImages[#gameImages].rotation
			gameImages[#gameImages].initScale = gameImages[#gameImages].xScale
			gameImages[#gameImages].id = "bubble" .. #gameImages
			if (game3BubbleOptions[game3CurBubble].id == "Bubble") then
				gameImages[#gameImages].idType = "bubble"
			end
			gameGroups[#gameGroups]:insert( gameImages[#gameImages] )
			
			floaters[#floaters+1] = gameImages[#gameImages].id
			
			
			gameGroups[#gameGroups].gameNumbers = {}
			
		
			for i = 1, numOptions[k] do
			
				if (#randomColors < 2) then
					gameImages[#gameImages+1] = display.newImageRect("Images/" .. game3ImageOptions[game3CurImage].id .. ".png", game3ImageOptions[game3CurImage].w, game3ImageOptions[game3CurImage].h )
				else
					gameImages[#gameImages+1] = display.newImageRect("Images/" .. game3ImageOptions[game3CurImage].id .. randomColors[randomColor] .. ".png", game3ImageOptions[game3CurImage].w, game3ImageOptions[game3CurImage].h )
				end
				
				gameImages[#gameImages].xScale, gameImages[#gameImages].yScale = gameImageScale[numOptions[k]], gameImageScale[numOptions[k]]
				
				
				local randomPosSet = math.random( 1, #gameImagePositions[numOptions[k]] )
				
				gameImages[#gameImages].x = gameImagePositions[numOptions[k]][randomPosSet][i][1] -- was + 55
				
				if (game3BubbleOptions[game3CurBubble].id == "Cloud") then
					gameImages[#gameImages].y = gameImagePositions[numOptions[k]][randomPosSet][i][2] + 5 -- was - 30
				else
					gameImages[#gameImages].y = gameImagePositions[numOptions[k]][randomPosSet][i][2] -- was - 30
				end
				gameImages[#gameImages].rotation = gameImagePositions[numOptions[k]][randomPosSet][i][3]
				gameImages[#gameImages].frame = math.random( 1 , 300 )
				gameImages[#gameImages].initX = gameImages[#gameImages].x
				gameImages[#gameImages].initY = gameImages[#gameImages].y
				gameImages[#gameImages].initR = gameImages[#gameImages].rotation
				gameImages[#gameImages].id = #gameImages
				gameImages[#gameImages].isAGroupItem = false
				gameImages[#gameImages].animationInfo = game3ImageOptions[game3CurImage].animation
			
			
				if (gameImagePositions[numOptions[k]][randomPosSet][i][3] == 1) then
					gameImages[#gameImages].xScale = -gameImages[#gameImages].xScale
				end
				gameImages[#gameImages].initScale = gameImages[#gameImages].xScale
				
				-- gameImages[#gameImages].alpha = 0
				
				floaters[#floaters+1] = gameImages[#gameImages].id
				
				gameGroups[#gameGroups]:insert( gameImages[#gameImages] )
			
				
				if (randomColor) then
					randomColor = randomColor + 1
					if (randomColor > #randomColors) then
						randomColor = 1
					end
				end
				
				
				if (i < 10) then
			
					if (game3ImageOptions[game3CurImage].id == "block") then
						gameGroups[#gameGroups].gameNumbers[#gameGroups[#gameGroups].gameNumbers+1] = display.newImageRect("Images/" .. i .. "Digit.png", 50 * 1.6, 50 * 1.6 )
					else
						gameGroups[#gameGroups].gameNumbers[#gameGroups[#gameGroups].gameNumbers+1] = display.newImageRect("Images/" .. i .. "Digit.png", 50 * 1.2, 50 * 1.2 )
					end
					gameGroups[#gameGroups].gameNumbers[#gameGroups[#gameGroups].gameNumbers].alpha = 0
					gameGroup:insert( gameGroups[#gameGroups].gameNumbers[#gameGroups[#gameGroups].gameNumbers] )
			
				else
				
					local tempNum = i
			
			
					gameGroups[#gameGroups].gameNumbers[#gameGroups[#gameGroups].gameNumbers+1] = display.newGroup()
					
					local num1
					local num2
					
					if (game3ImageOptions[game3CurImage].id == "block") then
						num1 = display.newImageRect("Images/" .. tostring(tempNum):sub(1, 1) .. "Digit.png", 50 * 1.6, 50 * 1.6 )
					else
						num1 = display.newImageRect("Images/" .. tostring(tempNum):sub(1, 1) .. "Digit.png", 50 * 1.2, 50 * 1.2 )
					end
					gameGroups[#gameGroups].gameNumbers[#gameGroups[#gameGroups].gameNumbers]:insert( num1 )
					
					if (game3ImageOptions[game3CurImage].id == "block") then
						num2 = display.newImageRect("Images/" .. tostring(tempNum):sub(2, 2) .. "Digit.png", 50 * 1.6, 50 * 1.6 )
					else
						num2 = display.newImageRect("Images/" .. tostring(tempNum):sub(2, 2) .. "Digit.png", 50 * 1.2, 50 * 1.2 )
					end
					num2.x = num1.x + (num1.contentWidth*0.4) + (num2.contentWidth*0.4) - 10
					gameGroups[#gameGroups].gameNumbers[#gameGroups[#gameGroups].gameNumbers]:insert( num2 )
					
					
					gameGroups[#gameGroups].gameNumbers[#gameGroups[#gameGroups].gameNumbers].anchorChildren = true
					gameGroups[#gameGroups].gameNumbers[#gameGroups[#gameGroups].gameNumbers].anchorX, gameGroups[#gameGroups].gameNumbers[#gameGroups[#gameGroups].gameNumbers].anchorY = 0.5, 0.5
					gameGroups[#gameGroups].gameNumbers[#gameGroups[#gameGroups].gameNumbers].alpha = 0
					gameGroup:insert( gameGroups[#gameGroups].gameNumbers[#gameGroups[#gameGroups].gameNumbers] )
				
				end
			
			end
			
			
			
			
			
			gameGroups[#gameGroups].anchorChildren = true
			gameGroups[#gameGroups].anchorX, gameGroups[#gameGroups].anchorY = 0.5, 0.5
			gameGroups[#gameGroups].xScale, gameGroups[#gameGroups].yScale = groupImageScale[numGroups], groupImageScale[numGroups]
			gameGroups[#gameGroups].x = halfW + groupItemPositions[numGroups][k][1]
			gameGroups[#gameGroups].y = halfH - 20 + groupItemPositions[numGroups][k][2]
			gameGroups[#gameGroups].initX = gameGroups[#gameGroups].x
			gameGroups[#gameGroups].initY = gameGroups[#gameGroups].y
			gameGroups[#gameGroups].initScale = gameGroups[#gameGroups].xScale
			gameGroups[#gameGroups].id = numOptions[k]
			gameGroups[#gameGroups].alpha = 0
			gameGroups[#gameGroups].frame = math.random( 1 , 300 )
			gameGroups[#gameGroups].startingTrans = false
			gameGroups[#gameGroups].idType = game3BubbleOptions[game3CurBubble].id
			gameGroups[#gameGroups].inBasket = false
			
			if (game3BubbleOptions[game3CurBubble].id == "Bubble") then
				
				local newScale = math.random( (gameGroups[#gameGroups].xScale - 0.05)*100, (gameGroups[#gameGroups].xScale)*100 ) / 100
				gameGroups[#gameGroups].xScale, gameGroups[#gameGroups].yScale = newScale, newScale
				
				local newRotation = math.random( -10, 10 ) / 10
				gameGroups[#gameGroups].rotation = newRotation
				
				-- gameGroups[#gameGroups].y = math.random( screenEdgeY*0.7, screenEdgeY + (screenEdgeY*0.40) )
				-- gameGroups[#gameGroups].x = screenEdgeX + math.random(100,200)
				
				gameGroups[#gameGroups].x = gameGroups[#gameGroups].x + 800
				gameGroups[#gameGroups].y = gameGroups[#gameGroups].y + math.random( 700, 800 )
		
			elseif (game3BubbleOptions[game3CurBubble].id == "Balloon") then
				gameGroups[#gameGroups].y = gameGroups[#gameGroups].y + 400
			else
				gameGroups[#gameGroups].x = gameGroups[#gameGroups].x + 800
			end
			
			gameGroup:insert( gameGroups[#gameGroups] )
			
			
		
		end
		randomizeTable( gameImages )
	
	
	
		if (game3BubbleOptions[game3CurBubble].id == "Cloud") then
	
			-- explosions:toBack()
			
			-- if (gameBGParticlesOne) then
				-- gameBGParticlesOne:toBack()
			-- end
			-- if (gameBGParticlesTwo) then
				-- gameBGParticlesTwo:toBack()
			-- end
			-- if (gameBG) then
				-- gameBG:toBack()
			-- end
			-- bgSky:toBack()
		
		end
	
	
	
		
		-- this:insert( gameGroup )
		
		showBubbleCounting()
		
	end
	setUpBubbleCounting()
	
    ----------------------
    -- Destroy function --
    ----------------------
    function this:destroy()
        if self.isLive then
		
            self.isLive = false
			display.getCurrentStage():setFocus(nil)
            
			if (myData.isController) then
				Runtime:removeEventListener( "key", bubbleCountingTap )
			elseif (myData.isFireTV) then
				Runtime:removeEventListener( "onFTVKey", bubbleCountingTap )
			end
			
			Runtime:removeEventListener("enterFrame", this)
			-- bg:removeEventListener("touch", this)
			
			for i = #gameImages, 1, -1 do
				resetItemAnim( gameImages[i] )
			end
			for i = #gameNumbers, 1, -1 do
				resetItemAnim( gameNumbers[i] )
			end
	
	
			if (timerPopVO) then
				timer.cancel( timerPopVO )
				timerPopVO = nil
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
