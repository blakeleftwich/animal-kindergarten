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
	local puzzleBG, puzzleBGBack, puzzleBGFinished
	local puzzleStartTouch = false
	local currentItemTouch = 0
	local currentIndex = 1
	puzzlePieces = {}
	local floaters = {}
    local currentImage = "a"
	local currentNumber = tblPuzzle.number
    local puzzleSet = 1
	local imageW, imageH, imageSlotW, imageSlotH
	
	
	local numberDetails = {
		{ w = 88, h = 180, slotW = 92, slotH = 184, maskSet = { 1 } },
		{ w = 136, h = 172, slotW = 140, slotH = 176, maskSet = { 2 } },
		{ w = 128, h = 176, slotW = 132, slotH = 180, maskSet = { 3 } },
		{ w = 164, h = 180, slotW = 168, slotH = 184, maskSet = { 5 } }, --was 4
		{ w = 136, h = 176, slotW = 140, slotH = 180, maskSet = { 5 } },
		{ w = 160, h = 180, slotW = 168, slotH = 188, maskSet = { 6 } },
		{ w = 148*1.15, h = 172*1.15, slotW = 152*1.15, slotH = 176*1.15, maskSet = { 7 } },
		{ w = 156, h = 176, slotW = 160, slotH = 180, maskSet = { 8 } }, -- was 8
		{ w = 160, h = 180, slotW = 164, slotH = 184, maskSet = { 20 } }, -- was 9
		{ w = 268, h = 180, slotW = 272, slotH = 184, maskSet = { 10 } },
		{ w = 168, h = 180, slotW = 168, slotH = 180, maskSet = { 11 } },
	}
	
	
	
	local puzzleDetails = {
		-- original mask settings
		-- { 
			-- { mask = "maskSet2b", maskW = 300, maskH = 88, slotW = 250, slotH = 80, offsetX = 0, offsetY = -74.5, rotation = 0 },
			-- { mask = "maskSet2a", maskW = 300, maskH = 100, slotW = 250, slotH = 90, offsetX = 0, offsetY = 0.5, rotation = 0 },
			-- { mask = "maskSet2b", maskW = 300, maskH = 88, slotW = 250, slotH = 80, offsetX = 0, offsetY = 74.5, rotation = 0 },
		-- },
		
		-- for number 1
		{ 
			{ mask = "maskSet2b", maskW = 300, maskH = 88, slotW = 250, slotH = 80, offsetX = 0, offsetY = -63.5, rotation = 0 },
			{ mask = "maskSet2a", maskW = 300, maskH = 100, slotW = 250, slotH = 90, offsetX = 0, offsetY = 11.5, rotation = 0 },
			{ mask = "maskSet2b", maskW = 300, maskH = 88, slotW = 250, slotH = 80, offsetX = 0, offsetY = 85.5, rotation = 0 },
		},
		
			-- for number 2
		{ 
			{ mask = "maskSet2b", maskW = 300, maskH = 88, slotW = 250, slotH = 80, offsetX = 0, offsetY = -84.5, rotation = 0 },
			{ mask = "maskSet2a", maskW = 300, maskH = 100, slotW = 250, slotH = 90, offsetX = 0, offsetY = -10.5, rotation = 0 },
			{ mask = "maskSet2b", maskW = 300, maskH = 88, slotW = 250, slotH = 80, offsetX = 0, offsetY = 64.5, rotation = 0 },
		},
		
			-- for number 3
		{ 
			{ mask = "maskSet2b", maskW = 300, maskH = 88, slotW = 250, slotH = 80, offsetX = 0, offsetY = -64.5, rotation = 0 },
			{ mask = "maskSet2a", maskW = 300, maskH = 100, slotW = 250, slotH = 90, offsetX = 0, offsetY = 10.5, rotation = 0 },
			{ mask = "maskSet2b", maskW = 300, maskH = 88, slotW = 250, slotH = 80, offsetX = 0, offsetY = 84.5, rotation = 0 },
		},
		
		-- for number 4
		{ 
			{ mask = "maskSet2b", maskW = 300, maskH = 88, slotW = 250, slotH = 80, offsetX = 0, offsetY = -63.75, rotation = 0 },
			{ mask = "maskSet2a", maskW = 300, maskH = 100, slotW = 250, slotH = 90, offsetX = 0, offsetY = 11.25, rotation = 0 },
			{ mask = "maskSet2b", maskW = 300, maskH = 88, slotW = 250, slotH = 80, offsetX = 0, offsetY = 85.25, rotation = 0 },
		},
		
		-- for number 5
		{ 
			{ mask = "maskSet2b", maskW = 300, maskH = 88, slotW = 250, slotH = 80, offsetX = 0, offsetY = -64.5, rotation = 0 },
			{ mask = "maskSet2a", maskW = 300, maskH = 100, slotW = 250, slotH = 90, offsetX = 0, offsetY = 10.5, rotation = 0 },
			{ mask = "maskSet2b", maskW = 300, maskH = 88, slotW = 250, slotH = 80, offsetX = 0, offsetY = 84.5, rotation = 0 },
		},
		
		-- for number 6
		{ 
			{ mask = "maskSet2b", maskW = 300, maskH = 88, slotW = 250, slotH = 80, offsetX = 0, offsetY = -74.5, rotation = 0 },
			{ mask = "maskSet2a", maskW = 300, maskH = 100, slotW = 250, slotH = 90, offsetX = 0, offsetY = 0.5, rotation = 0 },
			{ mask = "maskSet2b", maskW = 300, maskH = 88, slotW = 250, slotH = 80, offsetX = 0, offsetY = 74.5, rotation = 0 },
		},
		-- for number 7
		{ 
			{ mask = "maskSet2b", maskW = 300, maskH = 88, slotW = 250, slotH = 80, offsetX = 0, offsetY = -66, rotation = 0 },
			{ mask = "maskSet2a", maskW = 300, maskH = 100, slotW = 250, slotH = 90, offsetX = 0, offsetY = 9, rotation = 0 },
			{ mask = "maskSet2b", maskW = 300, maskH = 88, slotW = 250, slotH = 80, offsetX = 0, offsetY = 83, rotation = 0 },
		},
		-- for number 8
		{ 
			{ mask = "maskSet2b", maskW = 300, maskH = 88, slotW = 250, slotH = 80, offsetX = 0, offsetY = -74.5, rotation = 0 },
			{ mask = "maskSet2a", maskW = 300, maskH = 100, slotW = 250, slotH = 90, offsetX = 0, offsetY = 0.5, rotation = 0 },
			{ mask = "maskSet2b", maskW = 300, maskH = 88, slotW = 250, slotH = 80, offsetX = 0, offsetY = 74.5, rotation = 0 },
		},
		-- for number 9
		{ 
			{ mask = "maskSet2b", maskW = 300, maskH = 88, slotW = 250, slotH = 80, offsetX = 0, offsetY = -74.5, rotation = 0 },
			{ mask = "maskSet2a", maskW = 300, maskH = 100, slotW = 250, slotH = 90, offsetX = 0, offsetY = 0.5, rotation = 0 },
			{ mask = "maskSet2b", maskW = 300, maskH = 88, slotW = 250, slotH = 80, offsetX = 0, offsetY = 74.5, rotation = 0 },
		},
		-- for number 10
		{ 
			{ mask = "maskSet2d", maskW = 160, maskH = 200, slotW = 160, slotH = 200, offsetX = -97.5, offsetY = 0, rotation = 90 },
			{ mask = "maskSet2a", maskW = 160, maskH = 200, slotW = 160, slotH = 200, offsetX = 0.5, offsetY = 0, rotation = 90 },
			{ mask = "maskSet2d", maskW = 190, maskH = 200, slotW = 190, slotH = 200, offsetX = 97.5, offsetY = 0, rotation = 90 },
		},
		
		
		-- egg and ice cream
		{ 
			{ mask = "maskSet2a", maskW = 155, maskH = 90, slotW = 155, slotH = 90, offsetX = 0, offsetY = -75, rotation = 0 },
			{ mask = "maskSet2b", maskW = 165, maskH = 68, slotW = 165, slotH = 68, offsetX = 0, offsetY = 0.3, rotation = 0 },
			{ mask = "maskSet2a", maskW = 155, maskH = 90, slotW = 155, slotH = 90, offsetX = 0, offsetY = 75, rotation = 0 },
		},
		
		-- tree and acorn
		{ 
			{ mask = "maskSet2a", maskW = 155, maskH = 100, slotW = 155, slotH = 100, offsetX = 0, offsetY = -75, rotation = 0 },
			{ mask = "maskSet2b", maskW = 175, maskH = 78, slotW = 175, slotH = 78, offsetX = 0, offsetY = 0.3, rotation = 0 },
			{ mask = "maskSet2a", maskW = 180, maskH = 100, slotW = 180, slotH = 100, offsetX = 0, offsetY = 75, rotation = 0 },
		},
		
		-- donut
		{ 
			{ mask = "maskSet2a", maskW = 200, maskH = 100, slotW = 200, slotH = 100, offsetX = 0, offsetY = -75, rotation = 0 },
			{ mask = "maskSet2b", maskW = 210, maskH = 78, slotW = 210, slotH = 78, offsetX = 0, offsetY = 0.3, rotation = 0 },
			{ mask = "maskSet2a", maskW = 200, maskH = 100, slotW = 200, slotH = 100, offsetX = 0, offsetY = 75, rotation = 0 },
		},
		
		-- banana
		{ 
			{ mask = "maskSet2d", maskW = 110, maskH = 180, slotW = 110, slotH = 180, offsetX = -97.5, offsetY = 0, rotation = 90 },
			{ mask = "maskSet2e", maskW = 100, maskH = 180, slotW = 100, slotH = 180, offsetX = 0.2, offsetY = 0, rotation = 90 },
			{ mask = "maskSet2d", maskW = 110, maskH = 180, slotW = 110, slotH = 180, offsetX = 97.5, offsetY = 0, rotation = 90 },
		},
		
		-- watermelon
		{ 
			{ mask = "maskSet2d", maskW = 110, maskH = 180, slotW = 110, slotH = 180, offsetX = -97.5, offsetY = 0, rotation = 90 },
			{ mask = "maskSet2e", maskW = 100, maskH = 180, slotW = 100, slotH = 180, offsetX = 0.2, offsetY = 0, rotation = 90 },
			{ mask = "maskSet2d", maskW = 110, maskH = 180, slotW = 110, slotH = 180, offsetX = 97.5, offsetY = 0, rotation = 90 },
		},
		
		-- eggplant
		{ 
			{ mask = "maskSet2d", maskW = 110, maskH = 200, slotW = 110, slotH = 200, offsetX = -97.5, offsetY = 0, rotation = 90 },
			{ mask = "maskSet2e", maskW = 100, maskH = 180, slotW = 100, slotH = 180, offsetX = 0.2, offsetY = 0, rotation = 90 },
			{ mask = "maskSet2d", maskW = 110, maskH = 160, slotW = 110, slotH = 160, offsetX = 97.5, offsetY = 0, rotation = 90 },
		},
		
		-- bee
		{ 
			{ mask = "maskSet2d", maskW = 110, maskH = 200, slotW = 110, slotH = 200, offsetX = -97.5, offsetY = 0, rotation = 90 },
			{ mask = "maskSet2e", maskW = 110, maskH = 205, slotW = 110, slotH = 205, offsetX = 0.2, offsetY = 0, rotation = 90 },
			{ mask = "maskSet2d", maskW = 130, maskH = 200, slotW = 130, slotH = 200, offsetX = 97.5, offsetY = 0, rotation = 90 },
		},
		
		-- caterpillar
		{ 
			{ mask = "maskSet2d", maskW = 110, maskH = 240, slotW = 110, slotH = 240, offsetX = -112, offsetY = 0, rotation = 90 },
			{ mask = "maskSet2d", maskW = 110, maskH = 150, slotW = 110, slotH = 150, offsetX = 0.2, offsetY = 0, rotation = 90 },
			{ mask = "maskSet2d", maskW = 120, maskH = 100, slotW = 120, slotH = 100, offsetX = 112, offsetY = 0, rotation = 90 },
		},
		
		
		
		
		-- 4 square - donut, egg, tree
		{ 
			{ mask = "maskSet1b", maskW = 140, maskH = 140, slotW = 140, slotH = 140, offsetX = -68.6, offsetY = -68.6, rotation = 0 },
			{ mask = "maskSet1b", maskW = 140, maskH = 140, slotW = 140, slotH = 140, offsetX = 68.6, offsetY = -68.6, rotation = 0 },
			{ mask = "maskSet1b", maskW = 140, maskH = 140, slotW = 140, slotH = 140, offsetX = -68.6, offsetY = 68.6, rotation = 0 },
			{ mask = "maskSet1b", maskW = 140, maskH = 140, slotW = 140, slotH = 140, offsetX = 68.6, offsetY = 68.6, rotation = 0 },
		},
		
		
		
		-- ice cream new
		{ 
			{ mask = "maskSet2a", maskW = 115, maskH = 110, slotW = 115, slotH = 110, offsetX = -10, offsetY = -75, rotation = -15 },
			{ mask = "maskSet2b", maskW = 115, maskH = 120, slotW = 115, slotH = 120, offsetX = 0, offsetY = 0.3, rotation = -15 },
			{ mask = "maskSet2a", maskW = 60, maskH = 120, slotW = 60, slotH = 120, offsetX = 10, offsetY = 75, rotation = -15 },
		},
		
		-- red bird new
		{ 
			{ mask = "maskSet2a", maskW = 175, maskH = 110, slotW = 175, slotH = 110, offsetX = -10, offsetY = -75, rotation = -15 },
			{ mask = "maskSet2b", maskW = 205, maskH = 110, slotW = 205, slotH = 110, offsetX = 0, offsetY = 0.3, rotation = -15 },
			{ mask = "maskSet2a", maskW = 110, maskH = 130, slotW = 110, slotH = 130, offsetX = 10, offsetY = 75, rotation = -15 },
		},
		
		
		-- other horizontal
		-- { 
			-- { mask = "maskSet2c", maskW = 332, maskH = 132, slotW = 250, slotH = 90, offsetX = 0, offsetY = -118.5, rotation = 0 },
			-- { mask = "maskSet2d", maskW = 332, maskH = 132, slotW = 250, slotH = 90, offsetX = 0, offsetY = 0.25, rotation = 0 },
			-- { mask = "maskSet2c", maskW = 332, maskH = 132, slotW = 250, slotH = 90, offsetX = 0, offsetY = 118.5, rotation = 0 },
		-- },
		
		-- other vertical
		-- { 
			-- { mask = "maskSet2c", maskW = 132, maskH = 332, slotW = 90, slotH = 250, offsetX = -118.5, offsetY = 0, rotation = 90 },
			-- { mask = "maskSet2d", maskW = 132, maskH = 332, slotW = 90, slotH = 250, offsetX = 0.25, offsetY = 0, rotation = 90 },
			-- { mask = "maskSet2c", maskW = 132, maskH = 332, slotW = 90, slotH = 250, offsetX = 118.5, offsetY = 0, rotation = 90 },
		-- },
		
		-- other horizontal
		-- { 
			-- { mask = "maskSet2a", maskW = 155, maskH = 80, slotW = 155, slotH = 80, offsetX = 0, offsetY = -75.5, rotation = 0 },
			-- { mask = "maskSet2b", maskW = 165, maskH = 68, slotW = 165, slotH = 68, offsetX = 0, offsetY = 0.3, rotation = 0 },
			-- { mask = "maskSet2a", maskW = 155, maskH = 80, slotW = 155, slotH = 80, offsetX = 0, offsetY = 75.5, rotation = 0 },
		-- },
		
		-- { 
			-- { mask = "maskSet2b", maskW = 88, maskH = 300, slotW = 80, slotH = 250, offsetX = -74.5, offsetY = 0, rotation = 90 },
			-- { mask = "maskSet2a", maskW = 100, maskH = 300, slotW = 90, slotH = 250, offsetX = 0.5, offsetY = 0, rotation = 90 },
			-- { mask = "maskSet2b", maskW = 88, maskH = 300, slotW = 80, slotH = 250, offsetX = 74.5, offsetY = 0, rotation = 90 },
		-- },
		-- { 
			-- { mask = "maskSet1a", maskW = 96, maskH = 96, slotW = 85, slotH = 85, offsetX = -39, offsetY = -40, rotation = 0 },
			-- { mask = "maskSet1a", maskW = 96, maskH = 96, slotW = 85, slotH = 85, offsetX = 39, offsetY = -40, rotation = 0 },
			-- { mask = "maskSet1a", maskW = 96, maskH = 96, slotW = 85, slotH = 85, offsetX = -39, offsetY = 40, rotation = 0 },
			-- { mask = "maskSet1a", maskW = 96, maskH = 96, slotW = 85, slotH = 85, offsetX = 39, offsetY = 40, rotation = 0 },
		-- },
		
	
	}
	
	local puzzlePiecePositions = {
		-- x, y, scale, rotation
		{ { 0, 0 }, },
		{ { 0, 0 }, { 0, 0 }, },
		{ { -150, -50, 0.7, 0 }, { -150, 50, 0.7, 0 }, { 150, 0, 0.7, 0 }, },
		{ { -150, -50, 0.8, 0 }, { -150, 50, 0.8, 0 }, { 150, -50, 0.8, 0 }, { 150, 50, 0.8, 0 } },
	}
	
	
	local cursorPieceOffsetsNum = {
		{ maskSet1 = { { offsetX = 20, offsetY = 20 }, { offsetX = 30, offsetY = 10 }, { offsetX = 30, offsetY = -2 }, }, },
		{ maskSet1 = { { offsetX = 10, offsetY = 27 }, { offsetX = 42, offsetY = 10 }, { offsetX = 17, offsetY = 10 }, }, },
		{ maskSet1 = { { offsetX = 10, offsetY = 20 }, { offsetX = 20, offsetY = 0 }, { offsetX = 10, offsetY = 0 }, }, },
		{ maskSet1 = { { offsetX = 30, offsetY = 20 }, { offsetX = 40, offsetY = 10 }, { offsetX = 45, offsetY = -2 }, }, },
		{ maskSet1 = { { offsetX = 15, offsetY = 15 }, { offsetX = 35, offsetY = 0 }, { offsetX = 10, offsetY = -2 }, }, },
		{ maskSet1 = { { offsetX = 20, offsetY = 20 }, { offsetX = 0, offsetY = 0 }, { offsetX = 13, offsetY = 3 }, }, },
		{ maskSet1 = { { offsetX = 10, offsetY = 10 }, { offsetX = 20, offsetY = 10 }, { offsetX = -20, offsetY = 0 }, }, },
		{ maskSet1 = { { offsetX = 10, offsetY = 20 }, { offsetX = 15, offsetY = 10 }, { offsetX = 15, offsetY = 4 }, }, },
		{ maskSet1 = { { offsetX = 5, offsetY = 25 }, { offsetX = 20, offsetY = 10 }, { offsetX = 0, offsetY = 0 }, }, },
		{ maskSet1 = { { offsetX = 35, offsetY = 20 }, { offsetX = 20, offsetY = 10 }, { offsetX = 25, offsetY = 10 }, }, },
	}
	
	local cursorPieceOffsetsItem = {
		{ maskSet1 = { { offsetX = 15, offsetY = 20 }, { offsetX = 15, offsetY = 12 }, { offsetX = 15, offsetY = 7 }, }, maskSet2 = { { offsetX = 45, offsetY = 30 }, { offsetX = -20, offsetY = 30 }, { offsetX = 45, offsetY = -15 }, { offsetX = -20, offsetY = -15 }, }, },
		{ maskSet1 = { { offsetX = 35, offsetY = 30 }, { offsetX = -10, offsetY = 30 }, { offsetX = 35, offsetY = -10 }, { offsetX = -10, offsetY = -10 }, }, },
		{ maskSet1 = { { offsetX = 40, offsetY = 35 }, { offsetX = -20, offsetY = 35 }, { offsetX = 40, offsetY = -15 }, { offsetX = -20, offsetY = -15 }, }, },
		{ maskSet1 = { { offsetX = 25, offsetY = 40 }, { offsetX = -10, offsetY = 35 }, { offsetX = 35, offsetY = -20 }, { offsetX = -20, offsetY = -15 }, }, },
		{ maskSet1 = { { offsetX = 15, offsetY = 20 }, { offsetX = 15, offsetY = 10 }, { offsetX = 15, offsetY = 10 }, }, maskSet2 = { { offsetX = 65, offsetY = 35 }, { offsetX = -40, offsetY = 35 }, { offsetX = 50, offsetY = -15 }, { offsetX = -25, offsetY = -15 }, }, },
		{ maskSet1 = { { offsetX = 10, offsetY = 20 }, { offsetX = 10, offsetY = 12 }, { offsetX = 10, offsetY = 5 }, }, maskSet2 = { { offsetX = 45, offsetY = 30 }, { offsetX = -20, offsetY = 30 }, { offsetX = 45, offsetY = -10 }, { offsetX = -20, offsetY = -10 }, }, },
		{ maskSet1 = { { offsetX = 40, offsetY = 35 }, { offsetX = -20, offsetY = 40 }, { offsetX = 40, offsetY = -10 }, { offsetX = -10, offsetY = -5 }, }, maskSet2 = { { offsetX = 5, offsetY = 25 }, { offsetX = 10, offsetY = 10 }, { offsetX = 30, offsetY = 10 }, }, },
		{ maskSet1 = { { offsetX = 30, offsetY = 50 }, { offsetX = 15, offsetY = 65 }, { offsetX = 0, offsetY = 0 }, }, },
		{ maskSet1 = { { offsetX = 25, offsetY = 7 }, { offsetX = 15, offsetY = 15 }, { offsetX = 0, offsetY = 0 }, }, },
		{ maskSet1 = { { offsetX = 45, offsetY = -15 }, { offsetX = 14, offsetY = 27 }, { offsetX = -8, offsetY = 35 }, }, },
		{ maskSet1 = { { offsetX = 30, offsetY = 20 }, { offsetX = 15, offsetY = 5 }, { offsetX = -10, offsetY = -40 }, }, },
		{ maskSet1 = { { offsetX = 40, offsetY = 30 }, { offsetX = 15, offsetY = 15 }, { offsetX = -5, offsetY = -20 }, }, },
		{ maskSet1 = { { offsetX = 15, offsetY = 20 }, { offsetX = 25, offsetY = 10 }, { offsetX = 33, offsetY = -5 }, }, },
		{ maskSet1 = { { offsetX = -20, offsetY = 40 }, { offsetX = 0, offsetY = 17 }, { offsetX = 38, offsetY = -10 }, }, },
	
	}
	
	
	if (tblPuzzle.imageSet == "Objects") then
		
		if (tblPuzzle.number ~= "random") then
			currentObjectSet = tblPuzzle.number
		end
		
		if (tblPuzzle.typeSet == "Color") then
			currentImage = colorSets[currentObjectSet].image
			currentSetNum = colorSets[currentObjectSet].id
			currentImageVO = colorSets[currentObjectSet].VO
			print("Testing")
			print(colorSets[currentObjectSet].preVO)
			currentPreImageVO = colorSets[currentObjectSet].preVO
			imageW = colorSets[currentObjectSet].w
			imageH = colorSets[currentObjectSet].h
			imageSlotW = colorSets[currentObjectSet].slotW
			imageSlotH = colorSets[currentObjectSet].slotH
			
			currentMaskSet = math.random( 1, #colorSets[currentObjectSet].maskSet )
			currentMaskSetNum = currentMaskSet
			puzzleSet = colorSets[currentObjectSet].maskSet[currentMaskSet]
		
		elseif (tblPuzzle.typeSet == "Shapes") then
			currentImage = shapeSets[currentObjectSet].image
			currentSetNum = shapeSets[currentObjectSet].id
			currentImageVO = shapeSets[currentObjectSet].VO
			currentPreImageVO = shapeSets[currentObjectSet].preVO
			imageW = shapeSets[currentObjectSet].w
			imageH = shapeSets[currentObjectSet].h
			imageSlotW = shapeSets[currentObjectSet].slotW
			imageSlotH = shapeSets[currentObjectSet].slotH
			
			currentMaskSet = math.random( 1, #shapeSets[currentObjectSet].maskSet )
			currentMaskSetNum = currentMaskSet
			puzzleSet = shapeSets[currentObjectSet].maskSet[currentMaskSet]
		
		else
			currentImage = objectSets[currentObjectSet].image
			currentSetNum = objectSets[currentObjectSet].id
			currentImageVO = objectSets[currentObjectSet].VO
			currentPreImageVO = objectSets[currentObjectSet].preVO
			imageW = objectSets[currentObjectSet].w
			imageH = objectSets[currentObjectSet].h
			imageSlotW = objectSets[currentObjectSet].slotW
			imageSlotH = objectSets[currentObjectSet].slotH
			
			currentMaskSet = math.random( 1, #objectSets[currentObjectSet].maskSet )
			currentMaskSetNum = currentMaskSet
			puzzleSet = objectSets[currentObjectSet].maskSet[currentMaskSet]
		
		end
		
		
		if (puzzleSet == 14) then
			puzzlePiecePositions = {
				-- x, y, scale, rotation
				{ { 0, 0 }, },
				{ { 0, 0 }, { 0, 0 }, },
				{ { -190, -50, 0.7, 0 }, { -190, 20, 0.7, 0 }, { 190, 0, 0.7, 0 }, },
				{ { -150, -50, 0.8, 0 }, { -150, 50, 0.8, 0 }, { 150, -50, 0.8, 0 }, { 150, 50, 0.8, 0 } },
			}
		elseif (puzzleSet == 15) then
			puzzlePiecePositions = {
				-- x, y, scale, rotation
				{ { 0, 0 }, },
				{ { 0, 0 }, { 0, 0 }, },
				{ { -190, -60, 0.7, 0 }, { -190, 40, 0.7, 0 }, { 190, 0, 0.7, 0 }, },
				{ { -150, -50, 0.8, 0 }, { -150, 50, 0.8, 0 }, { 150, -50, 0.8, 0 }, { 150, 50, 0.8, 0 } },
			}
		elseif (puzzleSet == 16) then
			puzzlePiecePositions = {
				-- x, y, scale, rotation
				{ { 0, 0 }, },
				{ { 0, 0 }, { 0, 0 }, },
				{ { -190, -80, 0.7, 0 }, { -190, 40, 0.7, 0 }, { 190, 0, 0.7, 0 }, },
				{ { -150, -50, 0.8, 0 }, { -150, 50, 0.8, 0 }, { 150, -50, 0.8, 0 }, { 150, 50, 0.8, 0 } },
			}
		elseif (puzzleSet == 17) then
			puzzlePiecePositions = {
				-- x, y, scale, rotation
				{ { 0, 0 }, },
				{ { 0, 0 }, { 0, 0 }, },
				{ { -160, -55, 0.6, 0 }, { -220, 45, 0.6, 0 }, { 200, -15, 0.7, 0 }, },
				{ { -150, -50, 0.8, 0 }, { -150, 50, 0.8, 0 }, { 150, -50, 0.8, 0 }, { 150, 50, 0.8, 0 } },
			}
		elseif (puzzleSet == 18) then
			puzzlePiecePositions = {
				-- x, y, scale, rotation
				{ { 0, 0 }, },
				{ { 0, 0 }, { 0, 0 }, },
				{ { -200, -90, 0.7, 0 }, { -200, 30, 0.7, 0 }, { 200, -30, 0.7, 0 }, },
				{ { -150, -50, 0.8, 0 }, { -150, 50, 0.8, 0 }, { 150, -50, 0.8, 0 }, { 150, 50, 0.8, 0 } },
			}
		elseif (puzzleSet == 19) then
			puzzlePiecePositions = {
				-- x, y, scale, rotation
				{ { 0, 0 }, },
				{ { 0, 0 }, { 0, 0 }, },
				{ { -200, -90, 0.7, 0 }, { -200, 30, 0.7, 0 }, { 200, -30, 0.7, 0 }, },
				{ { -180, -50, 0.8, 0 }, { -180, 50, 0.8, 0 }, { 180, -50, 0.8, 0 }, { 180, 50, 0.8, 0 } },
			}
		elseif (puzzleSet == 20 or puzzleSet == 21 or puzzleSet == 22) then
			puzzlePiecePositions = {
				-- x, y, scale, rotation
				{ { 0, 0 }, },
				{ { 0, 0 }, { 0, 0 }, },
				{ { -180, -80, 0.7, 0 }, { -180, 40, 0.7, 0 }, { 180, 0, 0.7, 0 }, },
				{ { -150, -50, 0.8, 0 }, { -150, 50, 0.8, 0 }, { 150, -50, 0.8, 0 }, { 150, 50, 0.8, 0 } },
			}
		elseif (puzzleSet == 23) then
			puzzlePiecePositions = {
				-- x, y, scale, rotation
				{ { 0, 0 }, },
				{ { 0, 0 }, { 0, 0 }, },
				{ { -170, -40, 0.7, 0 }, { -190, 40, 0.7, 0 }, { 170, 0, 0.7, 0 }, },
				{ { -150, -50, 0.8, 0 }, { -150, 50, 0.8, 0 }, { 150, -50, 0.8, 0 }, { 150, 50, 0.8, 0 } },
			}
		end
	else
		if (tblPuzzle.number == "random") then
			local repeatedNum = false
			
			if (#usedPuzzleNums > 9) then
				for i = #usedPuzzleNums, 1, -1 do
					table.remove( usedPuzzleNums, i )
				end
			end
			
			repeat
				repeatedNum = false
				
				currentImage = math.random( tblPuzzle.minRand, tblPuzzle.maxRand )
			
				for i = #usedPuzzleNums, 1, -1 do
					if (usedPuzzleNums[i] == currentImage) then
						repeatedNum = true
					end
				end
			
			until repeatedNum == false
		-- elseif (numberSets[tblPuzzle.imageSet]) then
			-- currentImage = numberSets[tblPuzzle.imageSet][ math.random( 1, #numberSets[tblPuzzle.imageSet] ) ]
		else
			currentImage = tblPuzzle.number
		end
		local usedNum = false
		for i = #usedPuzzleNums, 1, -1 do
			if (usedPuzzleNums[i] == currentImage) then
				usedNum = true
			end
		end
		if (usedNum == false) then
			usedPuzzleNums[#usedPuzzleNums+1] = currentImage
		end
		currentSetNum = currentImage
		imageW = numberDetails[currentImage].w
		imageH = numberDetails[currentImage].h
		imageSlotW = numberDetails[currentImage].slotW
		imageSlotH = numberDetails[currentImage].slotH
		
		-- puzzleSet = currentImage
		
		local randomSet = math.random( 1, #numberDetails[currentImage].maskSet )
		currentMaskSetNum = randomSet
		puzzleSet = numberDetails[currentImage].maskSet[randomSet]
		-- for i = 1, #tblPuzzle.maskSet do
			-- puzzleSet = tblPuzzle.maskSet[i]
		-- end
		
		if (puzzleSet == 10) then
			puzzlePiecePositions = {
				-- x, y, scale, rotation
				{ { 0, 0 }, },
				{ { 0, 0 }, { 0, 0 }, },
				{ { -200, -60, 0.55, 0 }, { -200, 50, 0.55, 0 }, { 200, -30, 0.55, 0 }, },
				{ { -180, -50, 0.8, 0 }, { -180, 50, 0.8, 0 }, { 180, -50, 0.8, 0 }, { 180, 50, 0.8, 0 } },
			}
		end
	end
	
	-- if (tblPuzzle.maskSet == "random") then
		-- puzzleSet = math.random( 1, #puzzleDetails )
	-- else
		-- puzzleSet = tblPuzzle.maskSet
	-- end
	
	
	
	
	
	
	function readPuzzleVO()
	
		if savedData.enableSounds == true then
								
			print("play sounds")
			if (tblPuzzle.imageSet == "Objects") then
				if (curGame == 1) then
					-- play canYouPutTheNumberBackTogether obj
					print("sound1")
					playReservedChannel( canYouPutThePuzzle, 11, 0 )
				else
					local randomSound = math.random( 1, 2 )
					if (randomSound == 1) then
						-- play putTheNumberBackTogether obj
						print("sound2")
						playReservedChannel( putThePuzzleBack, 11, 0 )
					else
						-- play completeThePuzzle obj
						print("sound3")
						playReservedChannel( completeThePuzzle, 11, 0 )
					end
				end
			else
				if (isPutNumTogetherFirstPlay == true) then
					playReservedChannel( putTheNumberBack, 11, 0 )
					-- play canYouPutTheNumberBackTogether
					-- playReservedChannel( canYouPutTheNumber, currentGameChannel, 0 )
				else
					local randomSound = math.random( 1, 2 )
					if (randomSound == 1) then
						-- play putTheNumberBackTogether
						playReservedChannel( putTheNumberBack, 11, 0 )
					else
						-- play completeThePuzzle
						playReservedChannel( completeThePuzzle, 11, 0 )
					end
				end
			end
			
			currentGameChannel = currentGameChannel + 1
			if (currentGameChannel > 25) then
				currentGameChannel = 20
			end
		end
	
	end
	
	
	---------------------------------------    
    -- update function
    ---------------------------------------  
	function this.enterFrame(e)
	
		if (currentItemTouch and currentItemTouch ~= 0) then
			if system.getInfo("model") == "iPad" then
				currentItemTouch.x = (currentItemTouch.currentX - currentItemTouch.x) * .25 + currentItemTouch.x 
				currentItemTouch.y = (currentItemTouch.currentY - currentItemTouch.y) * .25 + currentItemTouch.y	
			elseif (display.pixelHeight == 960) then
				currentItemTouch.x = (currentItemTouch.currentX - currentItemTouch.x) * .25 + currentItemTouch.x
				currentItemTouch.y = (currentItemTouch.currentY - currentItemTouch.y) * .25 + currentItemTouch.y
			else
				currentItemTouch.x = ((currentItemTouch.currentX - currentItemTouch.x) * .25 + currentItemTouch.x) - 8.2
				currentItemTouch.y = ((currentItemTouch.currentY - currentItemTouch.y) * .25 + currentItemTouch.y)
			end
		end
		
		if (floaters) then
			for k = #floaters, 1, -1 do
			
				for i = 1, #puzzlePieces do
				
					if (floaters[k] == puzzlePieces[i].id) then
						puzzlePieces[i].frame = puzzlePieces[i].frame + 1
						puzzlePieces[i].y =  puzzlePieces[i].initY + 1.5 * math.sin(puzzlePieces[i].frame/30)
					end
					
				end
				
			end
	end
	
	
	
		
		if (myData.isFireTV or myData.isController) then 
			for i = 1, #puzzlePieces do
			
				if (puzzlePieces[i] == puzzlePieces[currentCardSelected]) then
					puzzlePieces[i].slotBGPiece:setFillColor( 0 )
					puzzlePieces[i].slotBGPiece.alpha = 0.2 * cursor.alpha
				else
					puzzlePieces[i].slotBGPiece.alpha = 0
				end
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
			this.animationInfo = { id = "none", particles = "kiteClouds", duration = 1000, anchor = { 0.5, 0.5 }, particleOffset = { 0, 0 } }
			
			animateStart( this )
			bgWhite:toFront()
		
		end
    
    ---------------------------------------    
    -- touch function
    ---------------------------------------    
	
	function getCursorOffset( pieceID )
	
		local offsetX, offsetY
		
	
		if (tblPuzzle.imageSet == "Objects") then
			offsetX = cursorPieceOffsetsItem[currentSetNum]["maskSet" .. currentMaskSetNum][pieceID].offsetX
			offsetY = cursorPieceOffsetsItem[currentSetNum]["maskSet" .. currentMaskSetNum][pieceID].offsetY
		else
			offsetX = cursorPieceOffsetsNum[currentSetNum]["maskSet" .. currentMaskSetNum][pieceID].offsetX
			offsetY = cursorPieceOffsetsNum[currentSetNum]["maskSet" .. currentMaskSetNum][pieceID].offsetY
		end
	
		return offsetX, offsetY
	end
	
	function checkPuzzle( currentItem )
	
		audio.stop( 28 )
		
		currentItem.inSlot = true
		
		for k = #floaters, 1, -1 do
			if (floaters[k] == currentItem.id) then
				table.remove(floaters, k)
			end
		end
		
		
		
		
		
		local function finishTransToSlot()
			
			
			if savedData.enableSounds == true then
				playReservedChannel(popSounds[math.random(1,3)], currentPopChannel, 0)
			end
			currentPopChannel = currentPopChannel + 1
			if currentPopChannel > 26 then
				currentPopChannel = 27
			end
			
			if savedData.enableSounds == true then
				local randomSound
				
				repeat
					randomSound = math.random(1,5)
				until prevPuzzleGoodJobVO == nil or prevPuzzleGoodJobVO ~= randomSound
				playReservedChannel(goodJobSounds[randomSound], 21, 0)
				prevPuzzleGoodJobVO = randomSound
			end
			
			currentItem.x = currentItem.slotX
			currentItem.y = currentItem.slotY
			
			currentItem[1].alpha = 0
			currentItem.slotBGPiece.alpha = 0
			
			
			local itemX, itemY = currentItem:localToContent( 0, 0 )
		
			local newMaskW, newMaskH
			local newMaskX
			local newMaskY
			
			if (currentItem[2].maskRotation == 0) then
				newMaskW, newMaskH = (currentItem.maskW*currentItem.initScale), (currentItem.maskH*currentItem.initScale)
				newMaskX = itemX + (currentItem[2].maskXPos * currentItem.initScale) + currentItem.offsetPosX
				newMaskY = itemY + (currentItem[2].maskYPos * currentItem.initScale) + currentItem.offsetPosY
			else
				newMaskW, newMaskH = (currentItem.maskW*currentItem.initScale), (currentItem.maskH*currentItem.initScale)
				newMaskX = itemX + (currentItem[2].maskXPos * currentItem.initScale) + currentItem.offsetPosX
				newMaskY = itemY + (currentItem[2].maskYPos * currentItem.initScale) + currentItem.offsetPosY
			end
			
			if (myData.isFireTV or myData.isController) then 
				Particles:newEmitter(explosions,"fireworks", "Images/starParticle.png", 32, 32, 10, cursor.x, cursor.y, -4, 4, -16, 6, 252,234,27)--altRgb[1], altRgb[2], altRgb[3])
			else
				Particles:newEmitter(explosions,"fireworks", "Images/starParticle.png", 32, 32, 10, newMaskX, newMaskY, -4, 4, -16, 6, 252,234,27)--altRgb[1], altRgb[2], altRgb[3])
			end
			explosions:toFront()
			
			local numFinished = 0
			for i = #puzzlePieces, 1, -1 do
				if (puzzlePieces[i].inSlot == true) then
					numFinished = numFinished + 1
				end
			end
			if (numFinished == #puzzlePieces) then
				buttonsActive = false
				-- self.isTouchEnable = false
				
				puzzleBGFinished:toFront()
				puzzleBGFinished.alpha = 1
				puzzleBG.alpha = 0
				if (puzzleBGBack) then
					puzzleBGBack.alpha = 0
				end
				for i = #puzzlePieces, 1, -1 do
					puzzlePieces[i].alpha = 0
				end
				
				
				-- if savedData.enableSounds == true then
					-- playReservedChannel(shortClapSound, currOtherMainChannel, 0)
					-- currOtherMainChannel = currOtherMainChannel + 1
					-- if (currOtherMainChannel > 17) then
						-- currOtherMainChannel = 15
					-- end
				-- end
				
				local function numbersAnim()
				
					if (tblPuzzle.imageSet == "Objects") then
						if savedData.enableSounds == true then
						
							print("Test VO")
							print(currentPreImageVO)
							print(gameSounds[currentPreImageVO])
						
							if (tblPuzzle.typeSet == "Shapes") then
								playReservedChannel( gameSounds[currentImageVO], currentGameChannel, 0 )
							else
								playReservedChannel( gameSounds[currentPreImageVO], currentGameChannel, 0 )
							end
							currentGameChannel = currentGameChannel + 1
							if (currentGameChannel > 25) then
								currentGameChannel = 22
							end
						end
					else
						if savedData.enableSounds == true then
							playReservedChannel( gameNumSounds[currentImage], currentGameChannel, 0 )
							currentGameChannel = currentGameChannel + 1
							if (currentGameChannel > 25) then
								currentGameChannel = 22
							end
						end
					end
					
					puzzleBGFinished.initX = puzzleBGFinished.x
					puzzleBGFinished.initY = puzzleBGFinished.y
					puzzleBGFinished.initR = puzzleBGFinished.rotation
					puzzleBGFinished.initScale = puzzleBGFinished.yScale
					puzzleBGFinished.animationInfo = { id = "spin", particles = "", duration = 700, anchor = { 0.5, 0.5 }, particleOffset = { 0, 0 } }
					
					isPutNumPuzzleFirstPlay = false
					
					if (puzzleBGFinished.animation) then
					else
						animateStart( puzzleBGFinished )
					end
					
					local function hideGameScreen()
					
						if savedData.enableSounds == true then
							playReservedChannel(shortClapSound, currOtherMainChannel, 0)
							currOtherMainChannel = currOtherMainChannel + 1
							if (currOtherMainChannel > 17) then
								currOtherMainChannel = 15
							end
						end
					
						transition.to( puzzleBGFinished, { time=700, alpha=0, transition=easing.outExpo } )
						timer.performWithDelay( 0, goodJobSequence )
					end
					rewardTimer = timer.performWithDelay( 1000, hideGameScreen )
					
				end
				timer.performWithDelay( 1000, numbersAnim )
				
				
				-- transition.to(puzzleBGFinished, {delay=500, time=1000, rotation=1440, x=_CX,
					-- onComplete = function()
						-- if not self.isLive then return end
						-- pop out and
						-- transition.to(puzzleBGFinished, {delay=200, time=200, xScale=3, yScale=3, alpha=0,
							-- onStart = function()
								-- if not self.isLive then return end
								-- explosions:toFront()
								-- Particles:newEmitter(
									-- explosions, "fireworks", "Images/starParticle.png",
									-- 32, 32, 10, obj.x, obj.y, -4, 4, -16, 6, 252,234,27
								-- )
							-- end,
							-- onComplete = function()
								-- if not self.isLive then return end
								-- goodJobSequence()   --> here to end the game...
							-- end})
					-- end})
				
			else
			
				if (myData.isFireTV or myData.isController) then 
					
					local function scatterNumbers()
					
						transTime = 0
					
						for i = #floaters, 1, -1 do
							floaters[i] = nil
						end
					
						-- currentIndex = currentIndex + 1
						repeat
							currentIndex = math.random( 1, #puzzlePieces )
						until puzzlePieces[currentIndex].inSlot == false
						
						puzzlePieces[currentIndex]:toFront()
						puzzlePieces[currentIndex].y = halfH - 200
						puzzlePieces[currentIndex].x = screenOriginX - 1000
						puzzlePieces[currentIndex].alpha = 1
					
						local spinAmount = math.random( -8, 8 )
						if spinAmount < 1 or spinAmount > 1 then spinAmount = 1 end
						puzzlePieces[currentIndex].rotation = puzzlePieces[currentIndex].rotation + (spinAmount*360)
						randomDelay = math.random(1,100)
						
						local randomTime = math.random(1400,1600)
						
						local newX = puzzlePiecePositions[#puzzlePieces][currentIndex][1]
						local newY = puzzlePiecePositions[#puzzlePieces][currentIndex][2]
						
						puzzlePieces[currentIndex].origY = newY
						puzzlePieces[currentIndex].origX = newX
				
						transition.to( puzzlePieces[currentIndex], {delay = randomDelay, time= randomTime, x = newX, y = newY, xScale = puzzlePiecePositions[#puzzlePieces][currentIndex][3], yScale = puzzlePiecePositions[#puzzlePieces][currentIndex][3], rotation = puzzlePiecePositions[#puzzlePieces][currentIndex][4], transition=easing.inOutQuad } )
						
						transition.to( puzzlePieces[currentIndex][1], { delay = randomDelay, time= randomTime, alpha=puzzlePieces[currentIndex][1].initAlpha, transition=easing.inExpo } )
				
						
						if (randomDelay + randomTime > transTime) then
							transTime = randomDelay + randomTime
						end
					
						local function startNumFloat()
						
							local function showCursor()
								for i = 1, #puzzlePieces do
									if (puzzlePieces[i].inSlot == false) then
										currentCardSelected = i
									end
								end
								
								-- cursor.x, cursor.y = puzzlePieces[i]:localToContent( gameSlots[i].contentWidth*0.8, gameSlots[i].contentHeight*0.8 )
								cursor:toFront()
								-- targetCard = puzzlePieces[i]
								
								for m = 1, #puzzlePieces do
									if (puzzlePieces[m].inSlot == false and puzzlePieces[m].slotX < puzzlePieces[currentCardSelected].slotX) then
										currentCardSelected = m
									end
								end
								for m = 1, #puzzlePieces do
									if (puzzlePieces[m].inSlot == false and puzzlePieces[m].slotY < puzzlePieces[currentCardSelected].slotY) then
										currentCardSelected = m
									end
								end
								
								
								local offsetX, offsetY = getCursorOffset( currentCardSelected )
								
								cursor.x, cursor.y = piecesGroup.x + puzzlePieces[currentCardSelected].slotX + offsetX, piecesGroup.y + puzzlePieces[currentCardSelected].slotY + offsetY
								
								
								cursorTransition = transition.to( cursor, { time=100, alpha=1 } )
								makeButtonsActive()
								
							end
							timer.performWithDelay( 100, showCursor )
						
							floaters[#floaters+1] = puzzlePieces[currentIndex].id
							
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
			transition.to( currentItem, { delay = 0, time=350 , x = currentItem.slotX, y = currentItem.slotY, xScale = currentItem.initScale, yScale = currentItem.initScale, rotation = 0, transition=easing.outExpo } )
			timer.performWithDelay( 351, finishTransToSlot )
		else
			transition.to( currentItem, { delay = 0, time=50 , x = currentItem.slotX, y = currentItem.slotY, xScale = currentItem.initScale, yScale = currentItem.initScale, rotation = 0, transition=easing.inExpo } )
			finishTransToSlot()
		end
		
	
	end
	
	
    function this:touch(e)
        if not self.isLive or not self.isTouchEnable then return end

        local obj = e.target
        -- Key pressed --
        if(e.phase == "began") then
            display.getCurrentStage():setFocus(obj)
            obj._isFocus = true
            
			
			if (currentItemTouch == 0) then
			
				for i = #puzzlePieces, 1, -1 do
					
					local itemX, itemY = puzzlePieces[i]:localToContent( 0, 0 )
					
					if (puzzlePieces[i].alpha > 0 and puzzlePieces[i].inSlot == false and puzzlePieces[i].offsetPosX) then
				
						local newMaskW, newMaskH
						local newMaskX
						local newMaskY
						
						if (puzzlePieces[i][2].maskRotation == 0) then
							newMaskW, newMaskH = (puzzlePieces[i].maskW*puzzlePieces[i].xScale), (puzzlePieces[i].maskH*puzzlePieces[i].yScale)
							newMaskX = itemX + (puzzlePieces[i][2].maskXPos * puzzlePieces[i].xScale) + puzzlePieces[i].offsetPosX
							newMaskY = itemY + (puzzlePieces[i][2].maskYPos * puzzlePieces[i].yScale) + puzzlePieces[i].offsetPosY
						else
							newMaskW, newMaskH = (puzzlePieces[i].maskW*puzzlePieces[i].xScale), (puzzlePieces[i].maskH*puzzlePieces[i].yScale)
							newMaskX = itemX + (puzzlePieces[i][2].maskXPos * puzzlePieces[i].xScale) + puzzlePieces[i].offsetPosX
							newMaskY = itemY + (puzzlePieces[i][2].maskYPos * puzzlePieces[i].yScale) + puzzlePieces[i].offsetPosY
						end
						
						
						-- local tempRect = display.newRect( newMaskX, newMaskY, newMaskW, newMaskH )
						-- tempRect.alpha = 0.4
						-- tempRect:setFillColor( 1, 0, 0 )
				
						
				
						if (e.x > newMaskX - (newMaskW*0.5) and
								e.x < newMaskX + (newMaskW*0.5) and
								e.y > newMaskY - (newMaskH*0.5) and
								e.y < newMaskY + (newMaskH*0.5)) then
							
							currentItemTouch = puzzlePieces[i]
							currentItemTouch:toFront()
							
							beganTouchX = e.x - currentItemTouch[2].maskX
							beganTouchY = e.y - currentItemTouch[2].maskY
							
							
							currentItemTouch.initX = currentItemTouch.x
							currentItemTouch.initY = currentItemTouch.y
							
							currentItemTouch.currentX = currentItemTouch.initX
							currentItemTouch.currentY = currentItemTouch.initY
						
							for k = #floaters, 1, -1 do
								if (floaters[k] == currentItemTouch.id) then
									table.remove(floaters, k)
								end
							end
							
							transition.to( currentItemTouch, { time=400, xScale = currentItemTouch.initScale, yScale = currentItemTouch.initScale, rotation = 0, transition=easing.outExpo } )
							
						
							break
						end
					
					end
				end
			
			end

        elseif(e.phase == "moved") then
			if obj._isFocus then
				if (currentItemTouch ~= 0) then
					local newX, newY = e.x - currentItemTouch[2].maskX, e.y - currentItemTouch[2].maskY
				
					currentItemTouch.currentX = currentItemTouch.initX - (beganTouchX - newX)
					currentItemTouch.currentY = currentItemTouch.initY - (beganTouchY - newY)
					
				end
			end
        -- Key released --
        elseif(e.phase == "ended" or e.phase == "cancelled") then
            if obj._isFocus then
                obj._isFocus = false
                display.getCurrentStage():setFocus(nil)
				
			if (currentItemTouch ~= 0) then
			
				local itemX, itemY = currentItemTouch:localToContent( 0, 0 )
				
				local newMaskW, newMaskH
				local newMaskX
				local newMaskY
				
				if (currentItemTouch[2].maskRotation == 0) then
					newMaskW, newMaskH = (currentItemTouch.maskW*currentItemTouch.xScale), (currentItemTouch.maskH*currentItemTouch.yScale)
					newMaskX = itemX + (currentItemTouch[2].maskXPos * currentItemTouch.xScale) + currentItemTouch.offsetPosX
					newMaskY = itemY + (currentItemTouch[2].maskYPos * currentItemTouch.yScale) + currentItemTouch.offsetPosY
				else
					newMaskW, newMaskH = (currentItemTouch.maskW*currentItemTouch.xScale), (currentItemTouch.maskH*currentItemTouch.yScale)
					newMaskX = itemX + (currentItemTouch[2].maskXPos * currentItemTouch.xScale) + currentItemTouch.offsetPosX
					newMaskY = itemY + (currentItemTouch[2].maskYPos * currentItemTouch.yScale) + currentItemTouch.offsetPosY
				end
				
				if (currentItemTouch.x <= currentItemTouch.slotX + (currentItemTouch.slotW*0.5) and 
					currentItemTouch.x >= currentItemTouch.slotX - (currentItemTouch.slotW*0.5) and
					currentItemTouch.y <= currentItemTouch.slotY + (currentItemTouch.slotH*0.5) and
					currentItemTouch.y >= currentItemTouch.slotY - (currentItemTouch.slotH*0.5)) then
					
					
					checkPuzzle( currentItemTouch )
				
				else
				
					local function finishedItemTrans( obj )
						
						obj.initY = obj.origY
						obj.frame = 0
						local isFloating = false
						for i = #floaters, 1, -1 do
							if (floaters[i] == obj.id) then
								isFloating = true
							end
						end
						if (isFloating == false) then
							floaters[#floaters+1] = obj.id
						end
						
					end
					transition.to( currentItemTouch, { time=400, x = currentItemTouch.origX, y = currentItemTouch.origY, xScale = currentItemTouch.breakScale, yScale = currentItemTouch.breakScale, rotation = currentItemTouch.breakRotation, transition=easing.outExpo, onComplete = finishedItemTrans } )
					
					
				
				end
				
				currentItemTouch = 0
				
			end
			
                
                -- if obj.name == chooseGameAnswer then
                    -- self.isTouchEnable = false
                    
					
            end -- if obj._isFocus then
        end -- touch began, moved, ended, cancelled

        return true
    end
    
	
	function puzzleTap( event )

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
				
				
				if (puzzlePieces[currentIndex].id == puzzlePieces[currentCardSelected].id) then
					
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
						if (floaters[k] == puzzlePieces[currentIndex].index) then
							table.remove( floaters, k )
						end
					end
					
					-- checkSlot( gameNumbers[currentIndex], gameSlots[currentCardSelected] )
					checkPuzzle( puzzlePieces[currentIndex] )
				
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
	
		transition.to( puzzleBGFinished, { time=700, alpha=1, transition=easing.inExpo } )
		for i = #puzzlePieces, 1, -1 do
			transition.to( puzzlePieces[i], { delay = 699, time=0, alpha=1, transition=easing.inExpo } )
		end
	
	
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
				rewardTimer = timer.performWithDelay( 500, numberVO )
			end
			rewardTimer = timer.performWithDelay( 500, isVO )
			
		end
		-- rewardTimer = timer.performWithDelay( 700, thisIsVO )
		
		local function playCurrentImageVO()
			
			if savedData.enableSounds == true then
				if (tblPuzzle.imageSet == "Objects") then
					playReservedChannel( gameSounds[currentPreImageVO], currentGameChannel, 0 )
					currentGameChannel = currentGameChannel + 1
					if (currentGameChannel > 25) then
						currentGameChannel = 22
					end
				end
			end
		
			local function playCurrentImageVO2()
			
				if (tblPuzzle.imageSet == "Objects") then
					if savedData.enableSounds == true then
						playReservedChannel( gameSounds[currentImageVO], currentGameChannel, 0 )
						currentGameChannel = currentGameChannel + 1
						if (currentGameChannel > 25) then
							currentGameChannel = 22
						end
					end
				else
					if savedData.enableSounds == true then
						playReservedChannel( gameNumSounds[currentImage], currentGameChannel, 0 )
						currentGameChannel = currentGameChannel + 1
						if (currentGameChannel > 25) then
							currentGameChannel = 22
						end
					end
				end
				
			end
			
			
			if (currentPreImageVO and tblPuzzle.imageSet == "Objects") then
				timer.performWithDelay( 700, playCurrentImageVO2 )
			else
				timer.performWithDelay( 0, playCurrentImageVO2 )
			end
			
		end
		timer.performWithDelay( 700, playCurrentImageVO )
		
		
		local function scatterPieces()
			
			if (puzzleBGBack) then
				transition.to( puzzleBGBack, { time=400, alpha=puzzleBGBack.initAlpha, transition=easing.inExpo } )
			end
			transition.to( puzzleBG, { time=400, alpha=puzzleBG.initAlpha, transition=easing.inExpo } )
		
		
			repeat
				currentIndex = math.random( 1, #puzzlePieces )
			until puzzlePieces[currentIndex].inSlot == false
		
			puzzleBGFinished.alpha = 0
			local transTime = 0
			for k = 1, #puzzlePieces do
				
				puzzlePieces[k]:toFront()
				
				local spinAmount = math.random( -8, 8 )
				if spinAmount < 1 or spinAmount > 1 then spinAmount = 1 end
				puzzlePieces[k].rotation = puzzlePieces[k].rotation + (spinAmount*360)
				puzzlePieces[k].breakRotation = puzzlePiecePositions[#puzzlePieces][k][4]
				puzzlePieces[k].breakScale = puzzlePiecePositions[#puzzlePieces][k][3]
				randomDelay = math.random(1,100)
				
				local newX = puzzlePiecePositions[#puzzlePieces][k][1]
				local newY = puzzlePiecePositions[#puzzlePieces][k][2]
				
				-- puzzlePieces[k].offsetPosX = (puzzlePiecePositions[#puzzlePieces][1][1]*0.5)
				-- puzzlePieces[k].offsetPosY = puzzlePiecePositions[#puzzlePieces][1][2]
				
				-- local newX = puzzlePiecePositions[#puzzlePieces][1][1]
				-- local newY = puzzlePiecePositions[#puzzlePieces][1][2]
				
				puzzlePieces[k].origY = newY
				puzzlePieces[k].origX = newX
				
				local randomTime = math.random(1400,1600)-randomDelay
				-- use
				
				if (k ~= currentIndex and myData.isFireTV or k ~= currentIndex and myData.isController) then
					transition.to( puzzlePieces[k], {delay = randomDelay, time=randomTime-randomDelay, alpha = 1, x = screenEdgeX + 100, y = puzzlePieces[k].initY, xScale = puzzlePiecePositions[#puzzlePieces][k][3], yScale = puzzlePiecePositions[#puzzlePieces][k][3], rotation = puzzlePiecePositions[#puzzlePieces][k][4], transition=easing.inOutQuad } )
				else
					transition.to( puzzlePieces[k], {delay = randomDelay, time= randomTime, x = newX, y = newY, xScale = puzzlePiecePositions[#puzzlePieces][k][3], yScale = puzzlePiecePositions[#puzzlePieces][k][3], rotation = puzzlePiecePositions[#puzzlePieces][k][4], transition=easing.inOutQuad } )
				end
				-- transition.to( puzzlePieces[k], {delay = randomDelay, time= randomTime, x = newX, y = newY, transition=easing.inOutQuad } )
				
				-- transition.to( puzzlePieces[k].mask, {delay = randomDelay, time= randomTime, maskScaleX = puzzlePiecePositions[#puzzlePieces][k][3], maskScaleY = puzzlePiecePositions[#puzzlePieces][k][3], rotation = puzzlePiecePositions[#puzzlePieces][k][4], transition=easing.inOutQuad } )
				transition.to( puzzlePieces[k][1], { delay = randomDelay, time= randomTime, alpha=puzzlePieces[k][1].initAlpha, transition=easing.inExpo } )
				
				if (randomDelay + randomTime > transTime) then
					transTime = randomDelay + randomTime
				end
				
				-- Particles:newEmitter(explosions,"fireworks", "Images/confettiParticle.png", 12, 12, 40, piecesGroup.x, piecesGroup.y, -4, 4, -16, 6, 255,255,200)--lastRgb[1], lastRgb[2], lastRgb[3])
				-- Particles:newEmitter(explosions,"fade", "Images/puff.png", 50, 50, 5, piecesGroup.x + math.random(-10, 10), piecesGroup.y + math.random(-10, 10), -3, 3, -3, 3, 255, 255, 255)
				-- explosions:toFront()
				
				
				
				if (k == #puzzlePieces) then
				
					local function playUhOhVO()
						-- bgSky:addEventListener("touch", gameButtonTouched)
					
						if savedData.enableSounds == true then
							playReservedChannel( uhOhSound, currentGameChannel, 0 )
							currentGameChannel = currentGameChannel + 1
							if (currentGameChannel > 25) then
								currentGameChannel = 22
							end
						end
						
					
					end
					rewardTimer = timer.performWithDelay( 500, playUhOhVO )
				
					local function startNumFloat()
						
						if (myData.isFireTV or myData.isController) then 
							for i = 1, #puzzlePieces do
								if (i ~= currentIndex) then
									puzzlePieces[i].alpha = 0
									puzzlePieces[i].x = puzzlePieces[k].origX
									puzzlePieces[i].y = puzzlePieces[k].origY
								end
							end
						end
						
						local function showCursor()

							cursor.xScale = cardOptions.scale -- Hand Cursor
							cursor.yScale = cardOptions.scale
							cursor:toFront()
							
							currentCardSelected = 1
							
							if (puzzlePieces and #puzzlePieces > 0) then
								for i = 1, #puzzlePieces do
									if (puzzlePieces[i].slotX < puzzlePieces[currentCardSelected].slotX) then
										currentCardSelected = i
									end
								end
								for i = 1, #puzzlePieces do
									if (puzzlePieces[i].slotY < puzzlePieces[currentCardSelected].slotY) then
										currentCardSelected = i
									end
								end
								
								
								local offsetX, offsetY = getCursorOffset( currentCardSelected )
								
								cursor.x, cursor.y = piecesGroup.x + puzzlePieces[currentCardSelected].slotX + offsetX, piecesGroup.y + puzzlePieces[currentCardSelected].slotY + offsetY
								
								
							
								-- targetCard = gameSlots[currentCardSelected]
								cursorTransition = transition.to( cursor, { time=700, alpha=1 } )
							
							end
							
							if (myData.isController) then
								Runtime:addEventListener( "key", puzzleTap )
							elseif (myData.isFireTV) then
								Runtime:addEventListener( "onFTVKey", puzzleTap )
							end
							
						end
						
						if (myData.isFireTV or myData.isController) then 
							cursorTransition = timer.performWithDelay( 700, showCursor )
						end
						
						
						-- Runtime:addEventListener("enterFrame", this)
						
						for i = #puzzlePieces, 1, -1 do
							-- puzzlePieces[i].offsetPosX = (puzzlePieces[i].x * 0.5)
							-- puzzlePieces[i].offsetPosY = puzzlePieces[i].y
							
							puzzlePieces[i].offsetPosX = 0
							puzzlePieces[i].offsetPosY = 0
							
							-- puzzlePieces[i].offsetPosX = (puzzlePiecePositions[#puzzlePieces][1][1]*0.5)
							-- puzzlePieces[i].offsetPosY = puzzlePiecePositions[#puzzlePieces][1][2]
						
							puzzlePieces[i].initY = puzzlePieces[i].origY
							
							-- puzzlePieces[i].origY = puzzlePieces[i].y
							-- puzzlePieces[i].origX = puzzlePieces[i].x
							puzzlePieces[i].frame = 0
							floaters[#floaters+1] = puzzlePieces[i].id
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
							
							
							readPuzzleVO()
							
							questionText:toFront()
							questionTextTwo:toFront()
							transition.to( questionText, { time=700, x=halfW, transition=easing.outExpo } )
							transition.to( questionTextTwo, { time=700, x=halfW, transition=easing.outExpo } )

							
			
						
						end
						timerVO = timer.performWithDelay( 0, playCanPutNumVO )
					
					end
					timerVO = timer.performWithDelay( transTime + 1, startNumFloat )
					
				
				end
				
			end
			
		end
		-- for i = #puzzlePieces, 1, -1 do
							-- puzzlePieces.offsetPosX = (puzzlePieces[i].x*0.5)
							-- puzzlePieces.offsetPosY = puzzlePieces[i].y
		-- end
		timerVO = timer.performWithDelay( 700+900, scatterPieces ) -- 1440
		
		
		
		
		if (tblPuzzle.imageSet == "Objects") then
			questionText.text = "Put the puzzle together."
			
			if system.getInfo( "platformName" ) == "Android" then
				questionText.y = questionText.y - 12
			end
		else
			questionText.text = "Put the number together."
			
			if system.getInfo( "platformName" ) == "Android" then
				questionText.y = questionText.y - 5
			end
		end
		
		
		
		questionText.anchorX = 0.5
		questionText.anchorY = 0.5
		questionText.x = 1000
		questionText.alpha = 1
	
		-- cardTrans = transition.to( cardGroup, { time=700, x=halfW+cardOptions.offsetX, transition=easing.outExpo } )
		-- transition.to( questionText, { time=700, x=halfW, transition=easing.outExpo } )
		-- transition.to( questionTextTwo, { time=700, x=halfW, transition=easing.outExpo } )
	
	
		
		rewardTimer = timer.performWithDelay( 700+900, startWindAnim )
		
		
		bg:removeEventListener("touch", this)
		Runtime:removeEventListener("enterFrame", this)
		local function addGameListeners()
			bg:addEventListener("touch", this)
			Runtime:addEventListener("enterFrame", this)
		end
		numTimer = timer.performWithDelay( 1440, addGameListeners )
	
	end
	
	local function setUpPuzzle()
	
		if (puzzleBG) then
		else

			piecesGroup = display.newGroup()
		
			if (tblPuzzle.bgSlot ~= "") then
				if (tblPuzzle.bgSlot == "slotAlpha") then
					puzzleBGBack = display.newImageRect("Images/puzzle" .. currentImage .. ".png", imageW, imageH )
				else
					puzzleBGBack = display.newImageRect("Images/" .. tblPuzzle.bgSlot .. ".png", imageW, imageH )
				end
				-- puzzleBGBack.x, puzzleBGBack.y = _WIDTH * 0.5, _HEIGHT * 0.5
				puzzleBGBack.initAlpha = tblPuzzle.bgSlotAlpha
				puzzleBGBack.alpha = 0
				
				-- if (tblPuzzle.imageSet == "Objects") then
					-- puzzleBGBack.x = objectSets[currentObjectSet].slotOffsetX
					-- puzzleBGBack.y = objectSets[currentObjectSet].slotOffsetY
				-- end
				
				puzzleBGBack:setFillColor( tblPuzzle.bgSlotColor[1], tblPuzzle.bgSlotColor[2], tblPuzzle.bgSlotColor[3] )
			end
		
			if (tblPuzzle.otherSlot == "") then
				puzzleBG = display.newImageRect("Images/slot" .. currentImage .. ".png", imageSlotW, imageSlotH )
			else
				puzzleBG = display.newImageRect("Images/" .. tblPuzzle.otherSlot .. ".png", imageSlotW, imageSlotH )
			end
			-- puzzleBG.x, puzzleBG.y = _WIDTH * 0.5, _HEIGHT * 0.5
			puzzleBG.initAlpha = tblPuzzle.slotAlpha
			puzzleBG.alpha = 0
			
			if (tblPuzzle.imageSet == "Objects") then
				if (tblPuzzle.typeSet == "Color") then
					puzzleBG.x = colorSets[currentObjectSet].slotOffsetX
					puzzleBG.y = colorSets[currentObjectSet].slotOffsetY
				elseif (tblPuzzle.typeSet == "Shapes") then
					puzzleBG.x = shapeSets[currentObjectSet].slotOffsetX
					puzzleBG.y = shapeSets[currentObjectSet].slotOffsetY
				else
					puzzleBG.x = objectSets[currentObjectSet].slotOffsetX
					puzzleBG.y = objectSets[currentObjectSet].slotOffsetY
				end
			end
			puzzleBG:setFillColor( tblPuzzle.slotColor[1], tblPuzzle.slotColor[2], tblPuzzle.slotColor[3] )
			
			print("old BG Y")
			print(puzzleBG.y)
			
			puzzleBGFinished = display.newImageRect("Images/puzzle" .. currentImage .. ".png", imageW, imageH )
			-- puzzleBGFinished.x, puzzleBGFinished.y = puzzleBG.x, puzzleBG.y
			puzzleBGFinished.alpha = 0
			-- puzzleBGFinished:setFillColor( 1, 0, 0 )
			
			for i = 1, #puzzleDetails[puzzleSet] do
			
				
				puzzlePieces[#puzzlePieces+1] = display.newGroup()
				
				local puzzlePiece = display.newImageRect("Images/puzzle" .. currentImage .. ".png", imageW, imageH )
				local puzzleShadow = display.newImageRect("Images/puzzle" .. currentImage .. ".png", imageW, imageH )
				
				-- puzzlePiece:setFillColor( 1, 0, 0 )
				
				puzzleShadow:setFillColor( 0 )
				puzzleShadow.alpha = 0
				puzzleShadow.initAlpha = 0.2
				
				puzzleShadow.x = puzzlePiece.x + 1.5
				puzzleShadow.y = puzzlePiece.y + 5
				
				
				-- puzzlePieces[#puzzlePieces].pieceCenter = display.newRect( 0, 0, 1, 1 )
				-- puzzlePieces[#puzzlePieces].pieceCenter:setFillColor( 1, 0, 0 )
				-- puzzlePieces[#puzzlePieces].pieceCenter.alpha = 0.1
				
				
				puzzlePieces[#puzzlePieces]:insert( puzzleShadow )
				puzzlePieces[#puzzlePieces]:insert( puzzlePiece )
				-- puzzlePieces[#puzzlePieces]:insert( puzzlePieces[#puzzlePieces].pieceCenter )
				
				-- puzzlePieces[#puzzlePieces].x, puzzlePieces[#puzzlePieces].y = puzzleBG.x, puzzleBG.y
				
				local suffix = display.imageSuffix
				if (display.imageSuffix == nil) then
					suffix = ""
				end
				print(suffix)
				puzzlePiece:setMask( graphics.newMask( "Images/" .. puzzleDetails[puzzleSet][i].mask .. suffix .. ".jpg" ) )
				puzzleShadow:setMask( graphics.newMask( "Images/" .. puzzleDetails[puzzleSet][i].mask .. suffix .. ".jpg" ) )
				
				puzzlePieces[#puzzlePieces].maskW = puzzleDetails[puzzleSet][i].maskW
				puzzlePieces[#puzzlePieces].maskH = puzzleDetails[puzzleSet][i].maskH
				
				puzzlePieces[#puzzlePieces].slotW = puzzleDetails[puzzleSet][i].slotW
				puzzlePieces[#puzzlePieces].slotH = puzzleDetails[puzzleSet][i].slotH
				
				
				if (suffix == "@4x") then
					puzzlePiece.maskScaleX, puzzlePiece.maskScaleY = 0.25, 0.25
					puzzleShadow.maskScaleX, puzzleShadow.maskScaleY = 0.25, 0.25
				elseif (suffix == "@2x") then
					puzzlePiece.maskScaleX, puzzlePiece.maskScaleY = 0.5, 0.5
					puzzleShadow.maskScaleX, puzzleShadow.maskScaleY = 0.5, 0.5
				end
				
				puzzlePiece.maskX = puzzleDetails[puzzleSet][i].offsetX
				puzzlePiece.maskY = puzzleDetails[puzzleSet][i].offsetY
				
				-- puzzlePieces[#puzzlePieces].pieceCenter.x = puzzlePiece.maskX
				-- puzzlePieces[#puzzlePieces].pieceCenter.y = puzzlePiece.maskY
				
				puzzlePiece.maskXPos = puzzlePiece.maskX
				puzzlePiece.maskYPos = puzzlePiece.maskY
			
				puzzlePiece.maskRotation = puzzleDetails[puzzleSet][i].rotation
				puzzleShadow.maskRotation = puzzlePiece.maskRotation
			
				puzzleShadow.maskX = puzzleDetails[puzzleSet][i].offsetX
				puzzleShadow.maskY = puzzleDetails[puzzleSet][i].offsetY
			
			
				local oldX, oldY = puzzlePieces[#puzzlePieces]:localToContent(0, 0)
			
				local tempX = (puzzlePieces[#puzzlePieces].contentWidth*0.5) + puzzleShadow.maskX
				local tempY = (puzzlePieces[#puzzlePieces].contentHeight*0.5) + puzzleShadow.maskY
				
				
				
				puzzlePieces[#puzzlePieces].anchorChildren = true
				puzzlePieces[#puzzlePieces].anchorX = tempX/puzzlePieces[#puzzlePieces].contentWidth
				puzzlePieces[#puzzlePieces].anchorY = tempY/puzzlePieces[#puzzlePieces].contentHeight
			
				local currentX, currentY = puzzlePieces[#puzzlePieces]:localToContent(0, 0)
				local diffX = oldX - currentX
				local diffY = oldY - currentY
			
				
				puzzlePieces[#puzzlePieces].x = diffX
				puzzlePieces[#puzzlePieces].y = diffY
			
			
				puzzlePieces[#puzzlePieces].slotX = puzzlePieces[#puzzlePieces].x
				puzzlePieces[#puzzlePieces].slotY = puzzlePieces[#puzzlePieces].y
			
				puzzlePieces[#puzzlePieces].initScale = puzzlePieces[#puzzlePieces].yScale
			
				piecesGroup:insert( puzzlePieces[#puzzlePieces] )
				
				
				
				puzzlePieces[#puzzlePieces].slotBGPiece = display.newImageRect("Images/puzzle" .. currentImage .. ".png", imageW, imageH )
				puzzlePieces[#puzzlePieces].slotBGPiece:setMask( graphics.newMask( "Images/" .. puzzleDetails[puzzleSet][i].mask .. suffix .. ".jpg" ) )
				puzzlePieces[#puzzlePieces].slotBGPiece.maskRotation = puzzlePiece.maskRotation
				if (suffix == "@4x") then
					puzzlePieces[#puzzlePieces].slotBGPiece.maskScaleX, puzzlePieces[#puzzlePieces].slotBGPiece.maskScaleY = 0.25, 0.25
				elseif (suffix == "@2x") then
					puzzlePieces[#puzzlePieces].slotBGPiece.maskScaleX, puzzlePieces[#puzzlePieces].slotBGPiece.maskScaleY = 0.5, 0.5
				end
				puzzlePieces[#puzzlePieces].slotBGPiece.maskX = puzzleDetails[puzzleSet][i].offsetX
				puzzlePieces[#puzzlePieces].slotBGPiece.maskY = puzzleDetails[puzzleSet][i].offsetY
				puzzlePieces[#puzzlePieces].slotBGPiece.alpha = 0
				piecesGroup:insert( puzzlePieces[#puzzlePieces].slotBGPiece )
				
			
				puzzlePieces[#puzzlePieces].alpha = 0
				puzzlePieces[#puzzlePieces].inSlot = false
				puzzlePieces[#puzzlePieces].image = currentImage
				puzzlePieces[#puzzlePieces].id = "piece" .. #puzzlePieces
				puzzlePieces[#puzzlePieces].frame = 0
			end
			
			if (puzzleBGBack) then
				piecesGroup:insert( puzzleBGBack )
			end
			piecesGroup:insert( puzzleBG )
			piecesGroup:insert( puzzleBGFinished )
			
			
			piecesGroup:toFront()
			piecesGroup.anchorChildren = true
			piecesGroup.anchorX, piecesGroup.anchorY = 0.5, 0.5
			
			--piecesGroup.x, piecesGroup.y = _WIDTH * 0.5, _HEIGHT * 0.5
			
			if (tblPuzzle.imageSet == "Objects") then
				if (tblPuzzle.typeSet == "Color") then
					piecesGroup.x, piecesGroup.y = halfW + colorSets[currentObjectSet].puzzleOffsetX, halfH - 40 + colorSets[currentObjectSet].puzzleOffsetY
				elseif (tblPuzzle.typeSet == "Shapes") then
					piecesGroup.x, piecesGroup.y = halfW + shapeSets[currentObjectSet].puzzleOffsetX, halfH - 40 + shapeSets[currentObjectSet].puzzleOffsetY
				else
					piecesGroup.x, piecesGroup.y = halfW + objectSets[currentObjectSet].puzzleOffsetX, halfH - 40 + objectSets[currentObjectSet].puzzleOffsetY
				end
			else
				piecesGroup.x, piecesGroup.y = halfW, halfH - 40
			end
			
			-- if (tblPuzzle.imageSet == "Objects") then
				-- puzzleBG.x = objectSets[currentObjectSet].slotOffsetX
				-- puzzleBG.y = objectSets[currentObjectSet].slotOffsetY
			-- end
			
			
			local randomPositions = puzzlePiecePositions[#puzzlePieces]
			
			-- if (puzzleSet == 2) then
				-- local randomSpots = math.random( 1, 2 )
				-- if (randomSpots == 1) then
					-- randomPositions[2], randomPositions[3] = randomPositions[3], randomPositions[2]
				-- end
			if (puzzleSet < 10) then
				-- local randomSpots = math.random( 1, 3 )
				-- if (randomSpots == 1) then
					-- randomPositions[2], randomPositions[3] = randomPositions[3], randomPositions[2]
				-- elseif (randomSpots == 2) then
					-- randomPositions[2], randomPositions[1] = randomPositions[1], randomPositions[2]
				-- end
				local randomSpots = math.random( 1, 2 )
				if (randomSpots == 1) then
					randomPositions[2], randomPositions[3] = randomPositions[3], randomPositions[2]
				end
			elseif (puzzleSet == 11 or puzzleSet == 12) then
				local randomSpots = math.random( 1, 2 )
				if (randomSpots == 1) then
					randomPositions[2], randomPositions[3] = randomPositions[3], randomPositions[2]
				end
			elseif (puzzleSet == 14 or puzzleSet == 15 or puzzleSet == 16 or puzzleSet == 18) then
				randomPositions[1], randomPositions[3] = randomPositions[3], randomPositions[1]
			elseif (puzzleSet == 17) then
				randomPositions[1], randomPositions[2] = randomPositions[2], randomPositions[1]
			elseif (puzzleSet == 20 or puzzleSet == 21 or puzzleSet == 24 or puzzleSet == 10) then
				randomPositions[3], randomPositions[2] = randomPositions[2], randomPositions[3]
			elseif (puzzleSet == 22) then
				-- randomPositions[3], randomPositions[1] = randomPositions[1], randomPositions[3]
				-- randomPositions[3], randomPositions[2] = randomPositions[2], randomPositions[3]
			elseif (puzzleSet == 23) then
				-- randomPositions[3], randomPositions[2] = randomPositions[2], randomPositions[3]
			elseif (puzzleSet == 19) then
				local randomSpots = math.random( 1, 2 )
				if (randomSpots == 1) then
					randomPositions[1], randomPositions[3] = randomPositions[3], randomPositions[1]
					randomPositions[2], randomPositions[4] = randomPositions[4], randomPositions[2]
				end
			else
				randomizeTable(randomPositions)
				randomizeTable(randomPositions)
				randomizeTable(randomPositions)
			end
			
			
			timer.performWithDelay( 5, showPuzzle )
			
			-- for i = #puzzlePieces, 1, -1 do
				-- local newX = puzzleBG.x - puzzlePieces[i][2].maskX + puzzlePiecePositions[#puzzlePieces][i][1]
				-- local newY = puzzleBG.y - puzzlePieces[i][2].maskY + puzzlePiecePositions[#puzzlePieces][i][2]
				-- transition.to( puzzlePieces[i], { time=700, x = newX, y = newY, transition=easing.outExpo } )
			-- end
			
			
			
			-- local function addGameListeners()
				-- bg:addEventListener("touch", this)
				-- Runtime:addEventListener("enterFrame", this)
			-- end
			-- timer.performWithDelay( 500, addGameListeners )
			
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
			
			bgWhite:toFront()
			
			resetItemAnim( puzzleBGFinished )
			resetItemAnim( this )
			
			
			if (myData.isController) then
				Runtime:removeEventListener( "key", puzzleTap )
			elseif (myData.isFireTV) then
				Runtime:removeEventListener( "onFTVKey", puzzleTap )
			end
			
			-- Particles:removeParticles(-1)
			
			if (currentObjectSet) then
				currentObjectSet = currentObjectSet + 1
				
				if (tblPuzzle.typeSet == "Color") then
					if (currentObjectSet > #colorSets) then
						currentObjectSet = 1
					end
				elseif (tblPuzzle.typeSet == "Shapes") then
					if (currentObjectSet > #shapeSets) then
						currentObjectSet = 1
					end
				else
					if (currentObjectSet > #objectSets) then
						currentObjectSet = 1
					end
				end
			end
            
			Runtime:removeEventListener("enterFrame", this)
			bg:removeEventListener("touch", this)
			
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
			
			if (puzzleBGBack) then
				puzzleBGBack:removeSelf()
				puzzleBGBack = nil
			end
			if (puzzleBG) then
				puzzleBG:removeSelf()
				puzzleBG = nil
			end
			if (puzzleBGFinished) then
				puzzleBGFinished:removeSelf()
				puzzleBGFinished = nil
			end
			if (puzzlePieces) then
				for i = #puzzlePieces, 1, -1 do
					if (puzzlePieces[i]) then
						for k = puzzlePieces[i].numChildren, 1, -1 do
							if (puzzlePieces[i][k]) then
								puzzlePieces[i][k]:removeSelf()
								puzzlePieces[i][k] = nil
							end
						end
						puzzlePieces[i]:removeSelf()
						puzzlePieces[i] = nil
					end
				end
				puzzlePieces = nil
			end
			
			if (piecesGroup) then
				piecesGroup:removeSelf()
				piecesGroup = nil
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
