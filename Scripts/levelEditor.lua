local levelEditor = {

	{ --1
	
		--CHARACTER
		character = "Ralphie", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Ralphie",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "Remember Your Colors?",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,
		selectScreenSignText = "ST",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "ralphie", -- Table is in menu.lua (characterSounds)
		flipChar = false,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "welcomeToTheBigCityGoRalphie", -- Table is in main.lua
		levelIntroTextLine1 = "Welcome to\nthe big city.",
		levelIntroTextLine2 = "Go Ralphie!" ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "ralphie", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "ralphie", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	{-- 2
	
		--CHARACTER
		character = "Webster", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Webster",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "Size and Shape",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "RD",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "webster", -- Table is in menu.lua (characterSounds)
		flipChar = false,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "hiWebsterReadyToPlaySomeShapeGames", -- Table is in main.lua
		levelIntroTextLine1 = "Hi Webster!",
		levelIntroTextLine2 = "Ready to play some\nshape games?" ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "webster", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "webster", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	
	{ -- 3
	
		--CHARACTER
		character = "Percival", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Percival",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "Bigger or Smaller",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "CIR",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "percival", -- Table is in menu.lua (characterSounds)
		flipChar = false,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "okayPercivalItsYourTurnBiggerOrSmaller", -- Table is in main.lua
		levelIntroTextLine1 = "Okay Percival,\nit's your turn!",
		levelIntroTextLine2 = "Bigger or smaller?" ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2500,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "percival", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "percival", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	-- {-- 3
	
		----CHARACTER
		-- character = "Oliver", --  Table is in menu.lua (characterDetails)

		----SELECT SCREEN SETUP  
		-- selectScreenNameText = "Oliver",
		-- selectScreenNameTextXOffset = 0,
		-- selectScreenNameTextYOffset = 0,
		-- selectScreenNameTextSizeOffset = 0, 
		-- selectScreenSubtitleText = "Bigger or Smaller?",
		-- selectScreenSubtitleTextXOffset = 0,
		-- selectScreenSubtitleTextYOffset = 0,
		-- selectScreenSubtitleTextSizeOffset = 0,   
		-- selectScreenSignText = "CIR",
		-- selectScreenSignXOffset = 101,
		-- selectScreenSignYOffset = -10,
		-- selectScreenNameVO = "oliver", -- Table is in menu.lua (characterSounds)
		-- flipChar = false,
		-- free = true,

		----LEVEL INTRO SETUP  
		-- levelIntroVO = "biggerOrSmallerOliversAnExpert", -- Table is in main.lua
		-- levelIntroTextLine1 = "Bigger or smaller?",
		-- levelIntroTextLine2 = "Oliver's an expert." ,
		-- levelIntroTextSpacing = 24,
		-- levelIntroTextXOffset = 0,
		-- levelIntroTextYOffset = 2,
		-- levelIntroTextSize = 17, 
		-- levelIntroShowTime = 2200,
		 
		----LEVEL SETUP
		-- world = 1,
		-- levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		-- levelMoveStyle = "oliver", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		-- collectItems = "oliver", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		-- music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	-- },
	
	
	
	{-- 4
	
		--CHARACTER
		character = "Chip", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Chip",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "Shape Up!",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "AVE",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "chip", -- Table is in menu.lua (characterSounds)
		flipChar = false,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "itsTimeToPracticeShapesYouReadyChip", -- Table is in main.lua
		levelIntroTextLine1 = "It's time to\npractice shapes.",
		levelIntroTextLine2 = "You ready Chip?" ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "chip", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "chip", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	{--5
	
		--CHARACTER
		character = "Pinkie", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Pinkie",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "Number Identification",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "DR",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "pinkie", -- Table is in menu.lua (characterSounds)
		flipChar = true,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "doYouKnowYourNumbersGoPinkie", -- Table is in main.lua
		levelIntroTextLine1 = "Do you know\nyour numbers?",
		levelIntroTextLine2 = "Go Pinkie!" ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2500,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "pinkie", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "pinkie", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	
	{ -- 6
	
		--CHARACTER
		character = "Oliver", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Oliver",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "Color, Shape, & Number Puzzles",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "CIR",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "oliver", -- Table is in menu.lua (characterSounds)
		flipChar = false,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "itsYourTurnOliverYouReady", -- Table is in main.lua
		levelIntroTextLine1 = "It's your\nturn Oliver",
		levelIntroTextLine2 = "You ready?" ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "oliver", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "oliver", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	{-- 7
	
		--CHARACTER
		character = "Sunshine", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Sunshine",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "Pre-K Review",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "LN",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "sunshine", -- Table is in menu.lua (characterSounds)
		flipChar = true,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "itsTimeToTestOurSkillsSunshineLetsDoIt", -- Table is in main.lua
		levelIntroTextLine1 = "It's time to test\nour skills Sunshine!",
		levelIntroTextLine2 = "Let's do it." ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 3000,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "sunshine", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "sunshine", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	{--8
	
		--CHARACTER
		character = "Chauncey", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Chauncey",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "Counting Basics",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "CIR",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "chauncey", -- Table is in menu.lua (characterSounds)
		flipChar = false,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "hiChaunceyCountingIsSoMuchFun", -- Table is in main.lua
		levelIntroTextLine1 = "Hi Chauncey!",
		levelIntroTextLine2 = "Counting is\nso much fun." ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "chauncey", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "chauncey", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	
	{-- 9
	
		--CHARACTER
		character = "Oleg", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Oleg",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "Colors, Shapes, & Counting",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "BLVD",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "oleg", -- Table is in menu.lua (characterSounds)
		flipChar = false,
		free = true,

		--LEVEL INTRO SETUP  
		levelIntroVO = "numbersColorsAndShapesLetsDoItOleg", -- Table is in main.lua
		levelIntroTextLine1 = "Numbers, colors,\nand shapes.",
		levelIntroTextLine2 = "Let's do it Oleg!" ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "oleg", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "oleg", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	
	{ -- 10
	
		--CHARACTER
		character = "Webster", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Webster",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "In the Basket",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "LP",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "webster", -- Table is in menu.lua (characterSounds)
		flipChar = true,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "hiWebsterReadyForANewChallenge", -- Table is in main.lua
		levelIntroTextLine1 = "Hi Webster!",
		levelIntroTextLine2 = "Ready for a\nnew challenge?" ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "webster", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "webster", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	
	
	{ -- 11
	
		--CHARACTER
		character = "Pete", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Pete",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "How many?",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "LP",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "pete", -- Table is in menu.lua (characterSounds)
		flipChar = false,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "peteLovesNumbersLetsHopToIt", -- Table is in main.lua
		levelIntroTextLine1 = "Pete loves numbers!",
		levelIntroTextLine2 = "Let's hop to it." ,
		levelIntroTextSpacing = 24,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "pete", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "pete", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	

	{ -- 12
	
		--CHARACTER
		character = "Rocco", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Rocco",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "Counting Skills",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "WAY",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "rocco", -- Table is in menu.lua (characterSounds)
		flipChar = true,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "itsYourTurnRockoHereWeGo", -- Table is in main.lua
		levelIntroTextLine1 = "It's your\nturn Rocco!",
		levelIntroTextLine2 = "Here we go!" ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 1800,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "rocco", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "rocco", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	
	{ -- 13
	
		--CHARACTER
		character = "Bella", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Bella",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "Numeric Order",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "ST",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "bella", -- Table is in menu.lua (characterSounds)
		flipChar = false,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "cmonBellaFlexYourBrainYoureDoingGreat", -- Table is in main.lua
		levelIntroTextLine1 = "C'mon Bella,\nflex your brain.",
		levelIntroTextLine2 = "You're doing great!" ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "bella", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "bella", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	{ -- 14
	
		--CHARACTER
		character = "Chloe", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Chloe",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "What Comes Next?",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "WAY",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "chloe", -- Table is in menu.lua (characterSounds)
		flipChar = true,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "chloeLovesSolvingNumberPuzzlesWannaPlayAlong", -- Table is in main.lua
		levelIntroTextLine1 = "Chloe loves solving\nnumber puzzles.",
		levelIntroTextLine2 = "Want to play along?" ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "chloe", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "chloe", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	
	
	
	
	
	{ -- 15
	
		--CHARACTER
		character = "Percival", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Percival",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "Build the Number",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "LP",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "percival", -- Table is in menu.lua (characterSounds)
		flipChar = false,
		free = true,

		--LEVEL INTRO SETUP  
		levelIntroVO = "okayPercivalItsYourTurnOffToSchool", -- Table is in main.lua
		levelIntroTextLine1 = "Okay Percival,\nit's your turn!",
		levelIntroTextLine2 = "Off to school." ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "percival", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "percival", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	{ -- 16
	
		
		--CHARACTER
		character = "Dudley", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Dudley",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "First & Last ",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "BLVD",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "dudley", -- Table is in menu.lua (characterSounds)
		flipChar = true,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "hiDudleyLetsPlaySomeMathGames", -- Table is in main.lua
		levelIntroTextLine1 = "Hi Dudley!",
		levelIntroTextLine2 = "Let's play some\nmath games." ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "dudley", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "dudley", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
		
		
		
	
	},
	
	{ -- 17
	
		--CHARACTER
		character = "Oleg", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Oleg",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "Matching Fun!",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "CIR",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "oleg", -- Table is in menu.lua (characterSounds)
		flipChar = false,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "letsMatchEmUpOlegThisIsFun", -- Table is in main.lua
		levelIntroTextLine1 = "Let's match 'em\nup Oleg!",
		levelIntroTextLine2 = "This is fun." ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2300,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "oleg", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "oleg", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	
	},
	
	
	{ -- 18
	
		
		
		--CHARACTER
		character = "Ralphie", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Ralphie",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "Order Up!",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "DR",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "ralphie", -- Table is in menu.lua (characterSounds)
		flipChar = false,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "thisOneWillReallyTestYourSkillGoRalphie", -- Table is in main.lua
		levelIntroTextLine1 = "This one will really\ntest your skill.",
		levelIntroTextLine2 = "Go Ralphie!" ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "ralphie", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "ralphie", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
		
		----CHARACTER
		-- character = "Chip", --  Table is in menu.lua (characterDetails)

		----SELECT SCREEN SETUP  
		-- selectScreenNameText = "Chip",
		-- selectScreenNameTextXOffset = 0,
		-- selectScreenNameTextYOffset = 0,
		-- selectScreenNameTextSizeOffset = 0, 
		-- selectScreenSubtitleText = "Review 3",
		-- selectScreenSubtitleTextXOffset = 0,
		-- selectScreenSubtitleTextYOffset = 0,
		-- selectScreenSubtitleTextSizeOffset = 0,   
		-- selectScreenSignText = "DR",
		-- selectScreenSignXOffset = 101,
		-- selectScreenSignYOffset = -10,
		-- selectScreenNameVO = "chip", -- Table is in menu.lua (characterSounds)
		-- flipChar = false,
		-- free = false,

		----LEVEL INTRO SETUP  
		-- levelIntroVO = "ohHiyaChipWeCanTestOurSkillsTogether", -- Table is in main.lua
		-- levelIntroTextLine1 = "Oh, hiya Chip!",
		-- levelIntroTextLine2 = "We can test our\nskills together." ,
		-- levelIntroTextSpacing = 34,
		-- levelIntroTextXOffset = 0,
		-- levelIntroTextYOffset = 2,
		-- levelIntroTextSize = 17, 
		-- levelIntroShowTime = 2200,
		 
		----LEVEL SETUP
		-- world = 1,
		-- levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		-- levelMoveStyle = "chip", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		-- collectItems = "chip", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		-- music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	{ -- 19
	
	
	
		--CHARACTER
		character = "Chip", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Chip",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "Pop It!",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "BLVD",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "chip", -- Table is in menu.lua (characterSounds)
		flipChar = false,
		free = true,

		--LEVEL INTRO SETUP  
		levelIntroVO = "ohHiyaChipWeCanTestOurSkillsTogether", -- Table is in main.lua
		levelIntroTextLine1 = "Oh, hiya Chip!",
		levelIntroTextLine2 = "We can test our\nskills together." ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "chip", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "chip", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	
	
		
	
	},
	
	
	{ -- 20
	
		--CHARACTER
		character = "Sunshine", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Sunshine",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "Matching Numbers with Groups",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "RD",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "sunshine", -- Table is in menu.lua (characterSounds)
		flipChar = false,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "goodMorningSunshineItsTimeToMatch", -- Table is in main.lua
		levelIntroTextLine1 = "Good morning\nSunshine!",
		levelIntroTextLine2 = "It's time to match." ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "sunshine", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "sunshine", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	
	{-- 21
	
		--CHARACTER
		character = "Chauncey", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Chauncey",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "Spot the Difference",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "CIR",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "chauncey", -- Table is in menu.lua (characterSounds)
		flipChar = false,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "hiChaunceyCanYouSpotTheDifference", -- Table is in main.lua
		levelIntroTextLine1 = "Hi Chauncey!",
		levelIntroTextLine2 = "Can you spot\nthe difference?" ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "chauncey", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "chauncey", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	{ -- 22
	
		--CHARACTER
		character = "Pete", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Pete",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "Greatest and Least",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "LP",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "pete", -- Table is in menu.lua (characterSounds)
		flipChar = false,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "peteLovesNumbersLetsHopToIt", -- Table is in main.lua
		levelIntroTextLine1 = "Pete loves numbers!",
		levelIntroTextLine2 = "Let's hop to it." ,
		levelIntroTextSpacing = 24,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "pete", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "pete", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	{ -- 23
	
		--CHARACTER
		character = "Oliver", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Oliver",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "Matching Groups",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "AVE",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "oliver", -- Table is in menu.lua (characterSounds)
		flipChar = true,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "letsMatchOliversAnExpert", -- Table is in main.lua
		levelIntroTextLine1 = "Let's Match!",
		levelIntroTextLine2 = "Oliver's an expert." ,
		levelIntroTextSpacing = 24,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "oliver", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "oliver", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	{ -- 24
	
		--CHARACTER
		character = "Sunshine", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Sunshine",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "Cardinality Plus",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "CIR",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "sunshine", -- Table is in menu.lua (characterSounds)
		flipChar = true,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "cmonSunshineYouUpForTheChallenge", -- Table is in main.lua
		levelIntroTextLine1 = "C'mon Sunshine!",
		levelIntroTextLine2 = "You up for\nthe challenge?" ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "sunshine", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "sunshine", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	{ --25
	
		--CHARACTER
		character = "Chauncey", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Chauncey",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "Building Bigger Numbers",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "AVE",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "chauncey", -- Table is in menu.lua (characterSounds)
		flipChar = true,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "itsTimeToGoChaunceyYouCanDoIt", -- Table is in main.lua
		levelIntroTextLine1 = "It's time to\ngo Chauncey.",
		levelIntroTextLine2 = "You can do it!" ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "chauncey", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "chauncey", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	{ -- 26
	
		
		--CHARACTER
		character = "Chloe", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Chloe",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "Skip Counting By 2s",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "DR",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "chloe", -- Table is in menu.lua (characterSounds)
		flipChar = false,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "chloeLovesSolvingNumberPuzzlesWannaPlayAlong", -- Table is in main.lua
		levelIntroTextLine1 = "Chloe loves solving\nnumber puzzles.",
		levelIntroTextLine2 = "Want to play along?" ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "chloe", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "chloe", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	
	
		--CHARACTER
		-- character = "Pinkie", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		-- selectScreenNameText = "Pinkie",
		-- selectScreenNameTextXOffset = 0,
		-- selectScreenNameTextYOffset = 0,
		-- selectScreenNameTextSizeOffset = 0, 
		-- selectScreenSubtitleText = "Skip Counting By 2s",
		-- selectScreenSubtitleTextXOffset = 0,
		-- selectScreenSubtitleTextYOffset = 0,
		-- selectScreenSubtitleTextSizeOffset = 0,   
		-- selectScreenSignText = "DR",
		-- selectScreenSignXOffset = 101,
		-- selectScreenSignYOffset = -10,
		-- selectScreenNameVO = "pinkie", -- Table is in menu.lua (characterSounds)
		-- flipChar = true,
		-- free = false,

		--LEVEL INTRO SETUP  
		-- levelIntroVO = "thisLooksLikeFunGoPinkie", -- Table is in main.lua
		-- levelIntroTextLine1 = "This looks like fun.",
		-- levelIntroTextLine2 = "Go Pinkie!" ,
		-- levelIntroTextSpacing = 24,
		-- levelIntroTextXOffset = 0,
		-- levelIntroTextYOffset = 2,
		-- levelIntroTextSize = 17, 
		-- levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		-- world = 1,
		-- levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		-- levelMoveStyle = "pinkie", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		-- collectItems = "pinkie", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		-- music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	
	{ -- 27
	
		--CHARACTER
		character = "Pete", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Pete",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "What's Missing?",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "RD",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "pete", -- Table is in menu.lua (characterSounds)
		flipChar = false,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "whatCouldBeMissingPeteLetsFindOut", -- Table is in main.lua
		levelIntroTextLine1 = "What could be\nmissing Pete?",
		levelIntroTextLine2 = "Let's find out." ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "pete", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "pete", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	{ -- 28
	
		--CHARACTER
		character = "Ralphie", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Ralphie",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "Image Patterns",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "AVE",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "ralphie", -- Table is in menu.lua (characterSounds)
		flipChar = false,
		free = true,

		--LEVEL INTRO SETUP  
		levelIntroVO = "letsFindThePatternRalphieThisIsFun", -- Table is in main.lua
		levelIntroTextLine1 = "Let's find the\npattern Ralphie.",
		levelIntroTextLine2 = "This is fun!" ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "ralphie", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "ralphie", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	{ -- 29
	
		
		--CHARACTER
		character = "Pinkie", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Pinkie",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "Skip Counting by 5s",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "WAY",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "pinkie", -- Table is in menu.lua (characterSounds)
		flipChar = false,
		free = true,

		--LEVEL INTRO SETUP  
		levelIntroVO = "doYouKnowYourNumbersGoPinkie", -- Table is in main.lua
		levelIntroTextLine1 = "Do you know\nyour numbers?",
		levelIntroTextLine2 = "Go Pinkie!" ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2500,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "pinkie", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "pinkie", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
		
		
		
		----CHARACTER
		-- character = "Chip", --  Table is in menu.lua (characterDetails)

		----SELECT SCREEN SETUP  
		-- selectScreenNameText = "Chip",
		-- selectScreenNameTextXOffset = 0,
		-- selectScreenNameTextYOffset = 0,
		-- selectScreenNameTextSizeOffset = 0, 
		-- selectScreenSubtitleText = "Skip Counting by 5s",
		-- selectScreenSubtitleTextXOffset = 0,
		-- selectScreenSubtitleTextYOffset = 0,
		-- selectScreenSubtitleTextSizeOffset = 0,   
		-- selectScreenSignText = "WAY",
		-- selectScreenSignXOffset = 101,
		-- selectScreenSignYOffset = -10,
		-- selectScreenNameVO = "chip", -- Table is in menu.lua (characterSounds)
		-- flipChar = false,
		-- free = true,

		----LEVEL INTRO SETUP  
		-- levelIntroVO = "thisCanBeTrickyYouReadyChip", -- Table is in main.lua
		-- levelIntroTextLine1 = "This can be tricky!",
		-- levelIntroTextLine2 = "You ready Chip?" ,
		-- levelIntroTextSpacing = 24,
		-- levelIntroTextXOffset = 0,
		-- levelIntroTextYOffset = 2,
		-- levelIntroTextSize = 17, 
		-- levelIntroShowTime = 2200,
		 
		----LEVEL SETUP
		-- world = 1,
		-- levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		-- levelMoveStyle = "chip", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		-- collectItems = "chip", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		-- music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	{ -- 30
	
		--CHARACTER
		character = "Oleg", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Oleg",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "Nimble Numbers",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "ST",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "oleg", -- Table is in menu.lua (characterSounds)
		flipChar = false,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "cMonOlegItsTimeToPracticeWhatWeveLearned", -- Table is in main.lua
		levelIntroTextLine1 = "C'mon Oleg!",
		levelIntroTextLine2 = "It's time to practice\nwhat we've learned." ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "oleg", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "oleg", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	{ -- 31
	
		--CHARACTER
		character = "Rocco", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Rocco",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "The Order of Things",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "DR",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "rocco", -- Table is in menu.lua (characterSounds)
		flipChar = true,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "itsYourTurnRockoHereWeGo", -- Table is in main.lua
		levelIntroTextLine1 = "It's your\nturn Rocco!",
		levelIntroTextLine2 = "Here we go!" ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 1800,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "rocco", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "rocco", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	},
	
	{ -- 32
	
		--CHARACTER
		character = "Dudley", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Dudley",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "One More",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "LP",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "dudley", -- Table is in menu.lua (characterSounds)
		flipChar = false,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "hiDudleyYouUpForTheChallenge", -- Table is in main.lua
		levelIntroTextLine1 = "Hi Dudley!",
		levelIntroTextLine2 = "You up for\nthe challenge?" ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "dudley", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "dudley", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	{ -- 33
	
		--CHARACTER
		character = "Pinkie", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Pinkie",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "Greater Than",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "RD",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "pinkie", -- Table is in menu.lua (characterSounds)
		flipChar = false,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "doYouKnowYourNumbersGoPinkie", -- Table is in main.lua
		levelIntroTextLine1 = "Do you know\nyour numbers?",
		levelIntroTextLine2 = "Go Pinkie!" ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "pinkie", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "pinkie", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	{ -- 34
	
		--CHARACTER
		character = "Bella", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Bella",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "Skip Counting by 10s",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "CIR",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "bella", -- Table is in menu.lua (characterSounds)
		flipChar = true,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "cmonBellaFlexYourBrainYoureDoingGreat", -- Table is in main.lua
		levelIntroTextLine1 = "C'mon Bella,\nflex your brain!",
		levelIntroTextLine2 = "You're doing great." ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "bella", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "bella", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	{ -- 35
	
		--CHARACTER
		character = "Ralphie", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Ralphie",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "How Many More?",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "BLVD",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "ralphie", -- Table is in menu.lua (characterSounds)
		flipChar = false,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "thisOneWillReallyTestYourSkillGoRalphie", -- Table is in main.lua
		levelIntroTextLine1 = "This one will really\ntest your skill.",
		levelIntroTextLine2 = "Go Ralphie!" ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "ralphie", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "ralphie", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	{ -- 36
	
		--CHARACTER
		character = "Rocco", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Rocco",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "Going Up",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "DR",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "rocco", -- Table is in menu.lua (characterSounds)
		flipChar = false,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "itsYourTurnRockoHereWeGo", -- Table is in main.lua
		levelIntroTextLine1 = "It's your\nturn Rocco!",
		levelIntroTextLine2 = "Here we go!" ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 1800,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "rocco", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "rocco", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	{ -- 37
	
		--CHARACTER
		character = "Oliver", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Oliver",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "Ten More",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "ST",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "oliver", -- Table is in menu.lua (characterSounds)
		flipChar = false,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "letsReallyTestOurAdditionSkillsItsYourTurnOliver", -- Table is in main.lua
		levelIntroTextLine1 = "Let's really test\nour addition skills.",
		levelIntroTextLine2 = "It's your turn Oliver!" ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2300,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "oliver", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "oliver", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	{ -- 38
	
		--CHARACTER
		character = "Webster", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Webster",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "What's Missing 2s, 5s, 10s?",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "CIR",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "webster", -- Table is in menu.lua (characterSounds)
		flipChar = false,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "whatCouldBeMissingWebsterLetsFindOut", -- Table is in main.lua
		levelIntroTextLine1 = "What could be\nmissing Webster?",
		levelIntroTextLine2 = "Let's find out." ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "webster", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "webster", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	{ -- 39
	
		--CHARACTER
		character = "Pete", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Pete",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "Apples & Bananas",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "ST",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "pete", -- Table is in menu.lua (characterSounds)
		flipChar = false,
		free = true,

		--LEVEL INTRO SETUP  
		levelIntroVO = "heresARealBrainbusterHopToItPete", -- Table is in main.lua
		levelIntroTextLine1 = "Here's a real\nbrainbuster.",
		levelIntroTextLine2 = "Hop to it Pete!" ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "pete", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "pete", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	{ -- 40
	
		--CHARACTER
		character = "Percival", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Percival",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "Addition Dot Equations",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "LP",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "percival", -- Table is in menu.lua (characterSounds)
		flipChar = false,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "okayPercivalItsYourTurnOffToSchool", -- Table is in main.lua
		levelIntroTextLine1 = "Okay Percival,\nit's your turn!",
		levelIntroTextLine2 = "Off to school." ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "percival", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "percival", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	{ -- 41
	
		--CHARACTER
		character = "Bella", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Bella",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "It All Adds Up",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "BLVD",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "bella", -- Table is in menu.lua (characterSounds)
		flipChar = false,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "cmonBellaFlexYourBrainYoureDoingGreat", -- Table is in main.lua
		levelIntroTextLine1 = "C'mon Bella,\nflex your brain.",
		levelIntroTextLine2 = "You're doing great!" ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "bella", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "bella", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	{ -- 42
	
		--CHARACTER
		character = "Sunshine", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Sunshine",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "Which Two?",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "LP",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "sunshine", -- Table is in menu.lua (characterSounds)
		flipChar = true,
		free = true,

		--LEVEL INTRO SETUP  
		levelIntroVO = "sunshinesARealMathWhizLetsAddEmUp", -- Table is in main.lua
		levelIntroTextLine1 = "Sunshine's a\nreal math whiz!",
		levelIntroTextLine2 = "Let's add 'em up." ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "sunshine", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "sunshine", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	{ -- 43
	
		--CHARACTER
		character = "Oliver", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Oliver",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "Addition Equations",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "ST",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "oliver", -- Table is in menu.lua (characterSounds)
		flipChar = true,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "letsReallyTestOurAdditionSkillsItsYourTurnOliver", -- Table is in main.lua
		levelIntroTextLine1 = "Let's really test\nour addition skills.",
		levelIntroTextLine2 = "It's your turn Oliver!" ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2300,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "oliver", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "oliver", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	{ -- 44
	
		--CHARACTER
		character = "Pinkie", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Pinkie",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "One to Five More",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "DR",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "pinkie", -- Table is in menu.lua (characterSounds)
		flipChar = true,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "thisLooksLikeFunGoPinkie", -- Table is in main.lua
		levelIntroTextLine1 = "This looks like fun.",
		levelIntroTextLine2 = "Go Pinkie!" ,
		levelIntroTextSpacing = 24,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "pinkie", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "pinkie", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	{ -- 45
	
		--CHARACTER
		character = "Dudley", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Dudley",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "Addition Mix Up",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "LP",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "dudley", -- Table is in menu.lua (characterSounds)
		flipChar = false,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "hiDudleyLetsPlaySomeMathGames", -- Table is in main.lua
		levelIntroTextLine1 = "Hi Dudley!",
		levelIntroTextLine2 = "Let's play some\nmath games." ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "dudley", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "dudley", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	{ -- 46
	
		--CHARACTER
		character = "Daisy", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Daisy",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "True or False Addition",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "PL",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "daisy", -- Table is in menu.lua (characterSounds)
		flipChar = false,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "trueOrFalseDaisyKnowsTheAnswer", -- Table is in main.lua
		levelIntroTextLine1 = "True or False?",
		levelIntroTextLine2 = "Daisy knows\nthe answer!" ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "daisy", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "daisy", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	{ -- 47
	
		--CHARACTER
		character = "Chip", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Chip",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "Addition Word Problems",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "ST",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "chip", -- Table is in menu.lua (characterSounds)
		flipChar = false,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "wordProblemsAreARealChallengeYouReadyChip", -- Table is in main.lua
		levelIntroTextLine1 = "Word problems are\na real challenge!",
		levelIntroTextLine2 = "You ready Chip?" ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "chip", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "chip", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	{ -- 48
	
		--CHARACTER
		character = "Chauncey", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Chauncey",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "Addition Magician",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "BLVD",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "chauncey", -- Table is in menu.lua (characterSounds)
		flipChar = false,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "itsTimeToGoChaunceyYouCanDoIt", -- Table is in main.lua
		levelIntroTextLine1 = "It's time to\ngo Chauncey.",
		levelIntroTextLine2 = "You can do it!" ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "chauncey", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "chauncey", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	{ -- 49
	
	
		--CHARACTER
		character = "Chloe", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Chloe",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "Less Than",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "RD",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "chloe", -- Table is in menu.lua (characterSounds)
		flipChar = true,
		free = true,

		--LEVEL INTRO SETUP  
		levelIntroVO = "chloeLovesSolvingNumberPuzzlesWannaPlayAlong", -- Table is in main.lua
		levelIntroTextLine1 = "Chloe loves solving\nnumber puzzles.",
		levelIntroTextLine2 = "Want to play along?" ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "chloe", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "chloe", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
		
		--CHARACTER
		-- character = "Webster", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		-- selectScreenNameText = "Webster",
		-- selectScreenNameTextXOffset = 0,
		-- selectScreenNameTextYOffset = 0,
		-- selectScreenNameTextSizeOffset = 0, 
		-- selectScreenSubtitleText = "Less Than",
		-- selectScreenSubtitleTextXOffset = 0,
		-- selectScreenSubtitleTextYOffset = 0,
		-- selectScreenSubtitleTextSizeOffset = 0,   
		-- selectScreenSignText = "RD",
		-- selectScreenSignXOffset = 101,
		-- selectScreenSignYOffset = -10,
		-- selectScreenNameVO = "webster", -- Table is in menu.lua (characterSounds)
		-- flipChar = false,
		-- free = false,

		--LEVEL INTRO SETUP  
		-- levelIntroVO = "hiWebsterReadyForANewChallenge", -- Table is in main.lua
		-- levelIntroTextLine1 = "Hi Webster!",
		-- levelIntroTextLine2 = "Ready for a\nnew challenge?" ,
		-- levelIntroTextSpacing = 34,
		-- levelIntroTextXOffset = 0,
		-- levelIntroTextYOffset = 2,
		-- levelIntroTextSize = 17, 
		-- levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		-- world = 1,
		-- levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		-- levelMoveStyle = "webster", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		-- collectItems = "webster", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		-- music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
		
		
		
		--CHARACTER
		-- character = "Oleg", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		-- selectScreenNameText = "Oleg",
		-- selectScreenNameTextXOffset = 0,
		-- selectScreenNameTextYOffset = 0,
		-- selectScreenNameTextSizeOffset = 0, 
		-- selectScreenSubtitleText = "Less Than",
		-- selectScreenSubtitleTextXOffset = 0,
		-- selectScreenSubtitleTextYOffset = 0,
		-- selectScreenSubtitleTextSizeOffset = 0,   
		-- selectScreenSignText = "RD",
		-- selectScreenSignXOffset = 101,
		-- selectScreenSignYOffset = -10,
		-- selectScreenNameVO = "oleg", -- Table is in menu.lua (characterSounds)
		-- flipChar = false,
		-- free = false,

		--LEVEL INTRO SETUP  
		-- levelIntroVO = "okayOlegLetsSortOutTheseNumbers", -- Table is in main.lua
		-- levelIntroTextLine1 = "Okay, Oleg!",
		-- levelIntroTextLine2 = "Let's sort out\nthese numbers." ,
		-- levelIntroTextSpacing = 34,
		-- levelIntroTextXOffset = 0,
		-- levelIntroTextYOffset = 2,
		-- levelIntroTextSize = 17, 
		-- levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		-- world = 1,
		-- levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		-- levelMoveStyle = "oleg", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		-- collectItems = "oleg", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		-- music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
		
		
		
		----CHARACTER
		-- character = "Oleg", --  Table is in menu.lua (characterDetails)

		----SELECT SCREEN SETUP  
		-- selectScreenNameText = "Oleg",
		-- selectScreenNameTextXOffset = 0,
		-- selectScreenNameTextYOffset = 0,
		-- selectScreenNameTextSizeOffset = 0, 
		-- selectScreenSubtitleText = "Less Than",
		-- selectScreenSubtitleTextXOffset = 0,
		-- selectScreenSubtitleTextYOffset = 0,
		-- selectScreenSubtitleTextSizeOffset = 0,   
		-- selectScreenSignText = "RD",
		-- selectScreenSignXOffset = 101,
		-- selectScreenSignYOffset = -10,
		-- selectScreenNameVO = "oleg", -- Table is in menu.lua (characterSounds)
		-- flipChar = false,
		-- free = false,

		----LEVEL INTRO SETUP  
		-- levelIntroVO = "okayOlegLetsSortOutTheseNumbers", -- Table is in main.lua
		-- levelIntroTextLine1 = "Okay, Oleg!",
		-- levelIntroTextLine2 = "Let's sort out\nthese numbers." ,
		-- levelIntroTextSpacing = 34,
		-- levelIntroTextXOffset = 0,
		-- levelIntroTextYOffset = 2,
		-- levelIntroTextSize = 17, 
		-- levelIntroShowTime = 2200,
		 
		----LEVEL SETUP
		-- world = 1,
		-- levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		-- levelMoveStyle = "oleg", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		-- collectItems = "oleg", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		-- music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	{ -- 50
	
		--CHARACTER
		character = "Percival", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Percival",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "How Many Take Away?",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "ST",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "percival", -- Table is in menu.lua (characterSounds)
		flipChar = false,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "okayPercivalItsYourTurnOffToSchool", -- Table is in main.lua
		levelIntroTextLine1 = "Okay Percival\nit's your turn.",
		levelIntroTextLine2 = "Off to school!" ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "percival", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "percival", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	{ -- 51
	
		--CHARACTER
		character = "Chloe", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Chloe",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "10 Less",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "BLVD",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "chloe", -- Table is in menu.lua (characterSounds)
		flipChar = false,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "okayChloeItsTimeForMorePuzzles", -- Table is in main.lua
		levelIntroTextLine1 = "Okay, Chloe.",
		levelIntroTextLine2 = "It's time for\nmore puzzles!" ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "chloe", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "chloe", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	{ -- 52
	
		--CHARACTER
		character = "Dudley", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Dudley",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "Subtraction Dot Equations",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "RD",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "dudley", -- Table is in menu.lua (characterSounds)
		flipChar = false,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "dudleyLetsPlayTheSubtractionGameYouCanDoIt", -- Table is in main.lua
		levelIntroTextLine1 = "Dudley, let's play the\nsubtraction game.",
		levelIntroTextLine2 = "You can do it!" ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "dudley", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "dudley", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	{ -- 53
	
	
	
			--CHARACTER
		character = "Pinkie", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Pinkie",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "One to Five Less",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "CIR",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "pinkie", -- Table is in menu.lua (characterSounds)
		flipChar = false,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "doYouKnowYourNumbersGoPinkie", -- Table is in main.lua
		levelIntroTextLine1 = "Do you know\nyour numbers?",
		levelIntroTextLine2 = "Go Pinkie!" ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2500,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "pinkie", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "pinkie", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	
		--CHARACTER
		-- character = "Ralphie", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		-- selectScreenNameText = "Ralphie",
		-- selectScreenNameTextXOffset = 0,
		-- selectScreenNameTextYOffset = 0,
		-- selectScreenNameTextSizeOffset = 0, 
		-- selectScreenSubtitleText = "One to Five Less",
		-- selectScreenSubtitleTextXOffset = 0,
		-- selectScreenSubtitleTextYOffset = 0,
		-- selectScreenSubtitleTextSizeOffset = 0,   
		-- selectScreenSignText = "CIR",
		-- selectScreenSignXOffset = 101,
		-- selectScreenSignYOffset = -10,
		-- selectScreenNameVO = "ralphie", -- Table is in menu.lua (characterSounds)
		-- flipChar = false,
		-- free = true,

		--LEVEL INTRO SETUP  
		-- levelIntroVO = "ralphieThisOneWillReallyTestYourSkillGoodLuck", -- Table is in main.lua
		-- levelIntroTextLine1 = "Ralphie, this one will\nreally test your skill.",
		-- levelIntroTextLine2 = "Good luck!" ,
		-- levelIntroTextSpacing = 34,
		-- levelIntroTextXOffset = 0,
		-- levelIntroTextYOffset = 2,
		-- levelIntroTextSize = 17, 
		-- levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		-- world = 1,
		-- levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		-- levelMoveStyle = "ralphie", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		-- collectItems = "ralphie", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		-- music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	{ -- 54
	
		--CHARACTER
		character = "Rocco", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Rocco",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "Subtraction Mix Up",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "WAY",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "rocco", -- Table is in menu.lua (characterSounds)
		flipChar = true,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "itsYourTurnRockoHereWeGo", -- Table is in main.lua
		levelIntroTextLine1 = "It's your\nturn Rocco!",
		levelIntroTextLine2 = "Here we go!" ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 1800,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "rocco", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "rocco", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	{ -- 55
	
		--CHARACTER
		character = "Sunshine", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Sunshine",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "Subtraction Equations",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "LN",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "sunshine", -- Table is in menu.lua (characterSounds)
		flipChar = true,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "itsTimeToTestOurSkillsSunshineLetsDoIt", -- Table is in main.lua
		levelIntroTextLine1 = "It's time to test\nour skills Sunshine.",
		levelIntroTextLine2 = "Let's do it!" ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2500,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "sunshine", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "sunshine", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	{ -- 56
	
		--CHARACTER
		character = "Oliver", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Oliver",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "Subtraction Word Problems",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "LN",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "oliver", -- Table is in menu.lua (characterSounds)
		flipChar = false,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "wordProblemsAreARealChallengeItsYourTurnOliver", -- Table is in main.lua
		levelIntroTextLine1 = "Word problems are\na real challenge.",
		levelIntroTextLine2 = "It's your turn Oliver!" ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2100,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "oliver", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "oliver", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	{ -- 57
	
		--CHARACTER
		character = "Oleg", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Oleg",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "Action Subtraction",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "PL",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "oleg", -- Table is in menu.lua (characterSounds)
		flipChar = false,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "cMonOlegItsTimeToPracticeWhatWeveLearned", -- Table is in main.lua
		levelIntroTextLine1 = "C'mon Oleg!",
		levelIntroTextLine2 = "It's time to practice\nwhat we've learned." ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "oleg", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "oleg", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	
	
	
	--[[
	{
	
		--CHARACTER
		character = "Chloe", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Chloe",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "Puzzling Numbers",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "BLVD",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "chloe", -- Table is in menu.lua (characterSounds)
		flipChar = false,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "okayChloeItsTimeForMorePuzzles", -- Table is in main.lua
		levelIntroTextLine1 = "Okay, Chloe.",
		levelIntroTextLine2 = "It's time for\nmore puzzles!" ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "chloe", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "chloe", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	{
	
		--CHARACTER
		character = "Oleg", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Oleg",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "Count 'em Out",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "DR",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "oleg", -- Table is in menu.lua (characterSounds)
		flipChar = false,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "letsGoOlegThisOneWillReallyTestYourSkill", -- Table is in main.lua
		levelIntroTextLine1 = "Let's go Oleg.",
		levelIntroTextLine2 = "This one will really\ntest your skill!" ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2100,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "oleg", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "oleg", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	{ -- 40
	
		--CHARACTER
		character = "Ralphie", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Ralphie",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "What Comes Next?",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "DR",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "ralphie", -- Table is in menu.lua (characterSounds)
		flipChar = false,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "whatComesNextRalphieYouReady", -- Table is in main.lua
		levelIntroTextLine1 = "What comes\nnext Ralphie?",
		levelIntroTextLine2 = "You ready?" ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "ralphie", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "ralphie", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	{ -- 45
	
		--CHARACTER
		character = "Chip", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Chip",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "One Less",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "AVE",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "chip", -- Table is in menu.lua (characterSounds)
		flipChar = false,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "thisCanBeTrickyYouReadyChip", -- Table is in main.lua
		levelIntroTextLine1 = "This can be tricky.",
		levelIntroTextLine2 = "You ready Chip?" ,
		levelIntroTextSpacing = 24,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "chip", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "chip", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	{ -- 50
	
		--CHARACTER
		character = "Pete", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Pete",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "Review 8",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "AVE",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "pete", -- Table is in menu.lua (characterSounds)
		flipChar = false,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "peteLovesNumbersLetsHopToIt", -- Table is in main.lua
		levelIntroTextLine1 = "Pete loves numbers!",
		levelIntroTextLine2 = "Let's hop to it." ,
		levelIntroTextSpacing = 24,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "pete", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "pete", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	
	--]]
	
	
	
	
	
	
	
	-- Repeated Levels
	
	{
	
		--CHARACTER
		character = "Ralphie", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Ralphie",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "Know Your Colors",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "BLVD",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "ralphie", -- Table is in menu.lua (characterSounds)
		flipChar = false,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "thisOneWillReallyTestYourSkillGoRalphie", -- Table is in main.lua
		levelIntroTextLine1 = "This one will really\ntest your skill.",
		levelIntroTextLine2 = "Go Ralphie!" ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "ralphie", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "ralphie", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	{
	
		--CHARACTER
		character = "Chip", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Chip",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "Know Your Colors",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "ST",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "chip", -- Table is in menu.lua (characterSounds)
		flipChar = false,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "ohHiyaChipWeCanTestOurSkillsTogether", -- Table is in main.lua
		levelIntroTextLine1 = "Oh, hiya Chip!",
		levelIntroTextLine2 = "We can test our\nskills together." ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "chip", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "chip", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	{ -- 60
	
		--CHARACTER
		character = "Sunshine", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Sunshine",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "Know Your Colors",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "CIR",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "sunshine", -- Table is in menu.lua (characterSounds)
		flipChar = false,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "itsTimeToTestOurSkillsSunshineLetsDoIt", -- Table is in main.lua
		levelIntroTextLine1 = "It's time to test\nour skills Sunshine!",
		levelIntroTextLine2 = "Let's do it." ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2500,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "sunshine", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "sunshine", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	{
	
		--CHARACTER
		character = "Pinkie", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Pinkie",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "Know Your Colors",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "DR",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "pinkie", -- Table is in menu.lua (characterSounds)
		flipChar = true,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "doYouKnowYourNumbersGoPinkie", -- Table is in main.lua
		levelIntroTextLine1 = "Do you know\nyour numbers?",
		levelIntroTextLine2 = "Go Pinkie!" ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "pinkie", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "pinkie", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	{
	
		--CHARACTER
		character = "Percival", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Percival",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "Know Your Colors",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "WAY",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "percival", -- Table is in menu.lua (characterSounds)
		flipChar = false,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "okayPercivalItsYourTurnOffToSchool", -- Table is in main.lua
		levelIntroTextLine1 = "Okay Percival\nit's your turn.",
		levelIntroTextLine2 = "Off to school!" ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "percival", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "percival", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	{
	
		--CHARACTER
		character = "Oleg", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Oleg",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "Know Your Colors",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "AVE",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "oleg", -- Table is in menu.lua (characterSounds)
		flipChar = false,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "letsGoOlegThisOneWillReallyTestYourSkill", -- Table is in main.lua
		levelIntroTextLine1 = "Let's go Oleg.",
		levelIntroTextLine2 = "This one will really\ntest your skill!" ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "oleg", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "oleg", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	{
	
		--CHARACTER
		character = "Webster", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Webster",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "Know Your Colors",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "DR",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "webster", -- Table is in menu.lua (characterSounds)
		flipChar = false,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "hiWebsterReadyForANewChallenge", -- Table is in main.lua
		levelIntroTextLine1 = "Hi Webster!",
		levelIntroTextLine2 = "Ready for a\nnew challenge?" ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "webster", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "webster", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	{ -- 65
	
		--CHARACTER
		character = "Pete", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Pete",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "Know Your Colors",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "LP",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "pete", -- Table is in menu.lua (characterSounds)
		flipChar = false,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "peteLovesNumbersLetsHopToIt", -- Table is in main.lua
		levelIntroTextLine1 = "Pete loves numbers!",
		levelIntroTextLine2 = "Let's hop to it." ,
		levelIntroTextSpacing = 24,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "pete", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "pete", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	{
	
		--CHARACTER
		character = "Dudley", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Dudley",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "Know Your Colors",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "LN",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "dudley", -- Table is in menu.lua (characterSounds)
		flipChar = true,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "hiDudleyLetsPlaySomeMathGames", -- Table is in main.lua
		levelIntroTextLine1 = "Hi Dudley!",
		levelIntroTextLine2 = "Let's play some\nmath games." ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "dudley", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "dudley", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	{
	
		--CHARACTER
		character = "Chip", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Chip",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "Know Your Colors",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "AVE",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "chip", -- Table is in menu.lua (characterSounds)
		flipChar = false,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "thisCanBeTrickyYouReadyChip", -- Table is in main.lua
		levelIntroTextLine1 = "This can be tricky!",
		levelIntroTextLine2 = "You ready Chip?" ,
		levelIntroTextSpacing = 24,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "chip", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "chip", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	{
	
		--CHARACTER
		character = "Sunshine", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Sunshine",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "Know Your Colors",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "ST",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "sunshine", -- Table is in menu.lua (characterSounds)
		flipChar = false,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "cmonSunshineYouUpForTheChallenge", -- Table is in main.lua
		levelIntroTextLine1 = "C'mon Sunshine!",
		levelIntroTextLine2 = "You up for\nthe challenge?" ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "sunshine", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "sunshine", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	{
	
		--CHARACTER
		character = "Rocco", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Rocco",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "Know Your Colors",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "CIR",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "rocco", -- Table is in menu.lua (characterSounds)
		flipChar = false,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "itsYourTurnRockoHereWeGo", -- Table is in main.lua
		levelIntroTextLine1 = "It's your\nturn Rocco!",
		levelIntroTextLine2 = "Here we go!" ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 1800,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "rocco", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "rocco", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	{ -- 70
	
		--CHARACTER
		character = "Oleg", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Oleg",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "Know Your Colors",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "BLVD",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "oleg", -- Table is in menu.lua (characterSounds)
		flipChar = false,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "cMonOlegItsTimeToPracticeWhatWeveLearned", -- Table is in main.lua
		levelIntroTextLine1 = "C'mon Oleg!",
		levelIntroTextLine2 = "It's time to practice\nwhat we've learned." ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "oleg", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "oleg", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	{
	
		--CHARACTER
		character = "Chauncey", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Chauncey",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "Know Your Colors",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "AVE",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "chauncey", -- Table is in menu.lua (characterSounds)
		flipChar = false,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "itsTimeToGoChaunceyYouCanDoIt", -- Table is in main.lua
		levelIntroTextLine1 = "It's time to\ngo Chauncey.",
		levelIntroTextLine2 = "You can do it!" ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "chauncey", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "chauncey", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	{
	
		--CHARACTER
		character = "Pinkie", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Pinkie",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "Know Your Colors",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "WAY",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "pinkie", -- Table is in menu.lua (characterSounds)
		flipChar = false,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "thisLooksLikeFunGoPinkie", -- Table is in main.lua
		levelIntroTextLine1 = "This looks like fun.",
		levelIntroTextLine2 = "Go Pinkie!" ,
		levelIntroTextSpacing = 24,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "pinkie", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "pinkie", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	{
	
		--CHARACTER
		character = "Bella", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Bella",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "Know Your Colors",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "LN",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "bella", -- Table is in menu.lua (characterSounds)
		flipChar = false,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "cmonBellaFlexYourBrainYoureDoingGreat", -- Table is in main.lua
		levelIntroTextLine1 = "C'mon Bella,\nflex your brain.",
		levelIntroTextLine2 = "You're doing great!" ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "bella", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "bella", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	{
	
		--CHARACTER
		character = "Pete", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Pete",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "Know Your Colors",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "ST",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "pete", -- Table is in menu.lua (characterSounds)
		flipChar = false,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "heresARealBrainbusterHopToItPete", -- Table is in main.lua
		levelIntroTextLine1 = "Here's a\nreal brainbuster.",
		levelIntroTextLine2 = "Hop to it Pete!" ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "pete", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "pete", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	{ -- 75
	
		--CHARACTER
		character = "Oleg", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Oleg",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "Know Your Colors",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "CIR",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "oleg", -- Table is in menu.lua (characterSounds)
		flipChar = false,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "okayOlegLetsSortOutTheseNumbers", -- Table is in main.lua
		levelIntroTextLine1 = "Okay, Oleg!",
		levelIntroTextLine2 = "Let's sort out\nthese numbers." ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "oleg", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "oleg", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	{
	
		--CHARACTER
		character = "Webster", --  Table is in menu.lua (characterDetails)

		--SELECT SCREEN SETUP  
		selectScreenNameText = "Webster",
		selectScreenNameTextXOffset = 0,
		selectScreenNameTextYOffset = 0,
		selectScreenNameTextSizeOffset = 0, 
		selectScreenSubtitleText = "Know Your Colors",
		selectScreenSubtitleTextXOffset = 0,
		selectScreenSubtitleTextYOffset = 0,
		selectScreenSubtitleTextSizeOffset = 0,   
		selectScreenSignText = "BLVD",
		selectScreenSignXOffset = 101,
		selectScreenSignYOffset = -10,
		selectScreenNameVO = "webster", -- Table is in menu.lua (characterSounds)
		flipChar = false,
		free = false,

		--LEVEL INTRO SETUP  
		levelIntroVO = "hiWebsterReadyForANewChallenge", -- Table is in main.lua
		levelIntroTextLine1 = "Hi Webster!",
		levelIntroTextLine2 = "Ready for a\nnew challenge?" ,
		levelIntroTextSpacing = 34,
		levelIntroTextXOffset = 0,
		levelIntroTextYOffset = 2,
		levelIntroTextSize = 17, 
		levelIntroShowTime = 2200,
		 
		--LEVEL SETUP
		world = 1,
		levelSetting = "farm", --  is in levelDetails.lua (backgroundOptions)
		levelMoveStyle = "webster", -- Table is in levelDetails.lua (moveOptions)(style1 = eat food, style2 = puddles, style3 = fences, etc.)
		collectItems = "webster", -- Table is in levelDetails.lua (collectItemOptions)(only applies for levelMoveStyles that have a reward at the end)
		music = "selectionOneMusic", -- Table is in menu.lua (musicOptions)
	
	},
	
	
}
return levelEditor