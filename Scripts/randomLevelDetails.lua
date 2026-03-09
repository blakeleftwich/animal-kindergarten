local randomLevelDetails = {

	-- use a level num to choose character
	-- if game category is empty, it uses main level category (look in calendarGameDetails.lua for category names)
	-- if game chooseRandom is empty, it uses main level chooseRandom (look in calendarGameDetails.lua for game numbers)
	-- the game table can even be left empty if the whole challenge just uses main category and chooseRandom
	-- waypoint skip lets you choose how many games are on each node
	
	-- "range" = chooses random game within that range in the category game details (calendarGameDetails.lua)
	-- "indiv" = choses from a list of specific games in the category game details (calendarGameDetails.lua)
	
	-- example = { character = 2, category = "matching", chooseRandom = { "range", 1, 2 }, -- main category and chooseRandom
			-- waypointSkip = { 1, 2, 1, 2, 1, 2, 1 },
			-- games = {
				-- { category = "", chooseRandom = "", },
				-- { category = "howMany", chooseRandom = { "range", 1, 2 }, }, -- chooses random from 1-2
				-- { category = "", chooseRandom = { "range", 2, 2 }, }, -- you can also set to only do game 2 in main category
				-- { category = "sequence", chooseRandom = { "indiv", 1, 3, 4 }, }, -- chooses random 1, 3, or 4
				-- { category = "", chooseRandom = "", },
				-- { category = "greaterLessEqual", chooseRandom = { "range", 1, 1 }, },
				-- { category = "", chooseRandom = "", },
				-- { category = "whichNumIsMissing", chooseRandom = { "range", 1, 1 }, },
				-- { category = "", chooseRandom = "", },
				-- { category = "whichIsMoreThan", chooseRandom = { "range", 1, 1 }, },
			-- },
	-- }, 
	
	-- random1 = { image = "day9Screen", text = "Puzzling Patterns",
			-- character = 12, category = "matching", chooseRandom = { "range", 1, 2 }, -- main category and chooseRandom
			
			-- voID = "", -- index of intro table in main.lua
			-- line1 = "",
			-- line3 = "",
			-- scale = "", spacing = "", offsetX = "", showTime = "",
			
			-- waypointSkip = { 1, 2, 1, 2, 1, 2, 1 },
			-- games = {
				-- { category = "", chooseRandom = "", },
				
				-- { category = "howMany", chooseRandom = { "range", 1, 2 }, }, -- chooses random from 1-2
				-- { category = "", chooseRandom = { "range", 2, 2 }, }, -- you can also set to only do game 2 in main category
				
				-- { category = "sequence", chooseRandom = { "indiv", 1, 3, 4 }, }, -- chooses random 1, 3, or 4
				
				-- { category = "", chooseRandom = "", },
				-- { category = "greaterLessEqual", chooseRandom = { "range", 1, 1 }, },
				
				-- { category = "", chooseRandom = "", },
				
				-- { category = "whichNumIsMissing", chooseRandom = { "range", 1, 1 }, },
				-- { category = "", chooseRandom = "", },
				
				-- { category = "whichIsMoreThan", chooseRandom = { "range", 1, 1 }, },
			-- },
	
	-- },
	
	-- random2 = { image = "day12Screen", text = "Anything Goes",
			-- character = 2, category = "matching", chooseRandom = { "range", 1, 2 }, -- main category and chooseRandom
			
			-- voID = "", -- index of intro table in main.lua
			-- line1 = "",
			-- line3 = "",
			-- scale = "", spacing = "", offsetX = "", showTime = "",
			
			-- waypointSkip = { 1, 2, 1, 2, 1, 2, 1 },
			-- games = {
				-- { category = "", chooseRandom = "", },
				
				-- { category = "howMany", chooseRandom = { "range", 1, 2 }, }, -- chooses random from 1-2
				-- { category = "", chooseRandom = { "range", 2, 2 }, }, -- you can also set to only do game 2 in main category
				
				-- { category = "sequence", chooseRandom = { "indiv", 1, 3, 4 }, }, -- chooses random 1, 3, or 4
				
				-- { category = "", chooseRandom = "", },
				-- { category = "greaterLessEqual", chooseRandom = { "range", 1, 1 }, },
				
				-- { category = "", chooseRandom = "", },
				
				-- { category = "whichNumIsMissing", chooseRandom = { "range", 1, 1 }, },
				-- { category = "", chooseRandom = "", },
				
				-- { category = "whichIsMoreThan", chooseRandom = { "range", 1, 1 }, },
			-- },
	
	-- },
	-- random3 = { image = "day15Screen", text = "Amazing Equations",
			-- character = 3, category = "matching", chooseRandom = { "range", 1, 2 }, -- main category and chooseRandom
			
			-- voID = "", -- index of intro table in main.lua
			-- line1 = "",
			-- line3 = "",
			-- scale = "", spacing = "", offsetX = "", showTime = "",
			
			-- waypointSkip = { 2, 1, 2, 1, 2, 1, 2 },
			-- games = {
				
				-- { category = "equation", chooseRandom = { "range", 1, 1 }, }, -- chooses random 1, 3, or 4
				-- { category = "trueOrFalse", chooseRandom = { "range", 1, 1 }, }, -- you can also set to only do game 2 in main category
				
				-- { category = "whichSignIsMissing", chooseRandom = { "range", 1, 1 }, }, -- you can also set to only do game 2 in main category
								
				-- { category = "equation", chooseRandom = { "range", 2, 2 }, }, -- chooses random 1, 3, or 4
				-- { category = "whichSentence", chooseRandom = { "range", 1, 1 }, }, -- chooses random 1, 3, or 4
				
				-- { category = "trueOrFalse", chooseRandom = { "range", 2, 2 }, }, -- you can also set to only do game 2 in main category
				
				-- { category = "equation", chooseRandom = { "range", 2, 2 }, }, -- chooses random 1, 3, or 4
				-- { category = "whichSignIsMissing", chooseRandom = { "range", 2, 2 }, }, -- you can also set to only do game 2 in main category
				
				-- { category = "whichSentence", chooseRandom = { "range", 2, 2 }, }, -- chooses random 1, 3, or 4
				
				-- { category = "trueOrFalse", chooseRandom = { "range", 3, 3 }, }, -- you can also set to only do game 2 in main category
				-- { category = "equation", chooseRandom = { "range", 3, 3 }, }, -- chooses random 1, 3, or 4
						
			-- },
	-- },
	-- random4 = { image = "day14Screen", text = "Equation Master",
			-- character = 3, category = "equation", chooseRandom = { "range", 1, 10 }, -- main category and chooseRandom
			
			-- voID = "", -- index of intro table in main.lua
			-- line1 = "",
			-- line3 = "",
			-- scale = "", spacing = "", offsetX = "", showTime = "",
			
			-- waypointSkip = { 2, 1, 2, 1, 2, 1, 2 },
			-- games = {
				
				
			-- },
	-- },
	-- random5 = {image = "day5Screen", text = "Puzzling Patterns",
			-- character = 2, category = "matching", chooseRandom = { "range", 1, 2 }, -- main category and chooseRandom
			
			-- voID = "", -- index of intro table in main.lua
			-- line1 = "",
			-- line3 = "",
			-- scale = "", spacing = "", offsetX = "", showTime = "",
			
			-- waypointSkip = { 2, 1, 2, 1, 2, 1, 2 },
			-- games = {
				-- { category = "howManyAre", chooseRandom = { "range", 2, 2 }, }, -- you can also set to only do game 2 in main category
				-- { category = "howManyAre", chooseRandom = { "range", 2, 2 }, }, -- you can also set to only do game 2 in main category
				
				-- { category = "sequence", chooseRandom = { "range", 5, 5 }, }, -- chooses random 1, 3, or 4
				
				-- { category = "whichNumIsMissing", chooseRandom = { "range", 2, 2 }, },
				-- { category = "sequence", chooseRandom = { "range", 6, 6 }, }, -- chooses random 1, 3, or 4
				
				-- { category = "whichSignIsMissing", chooseRandom = { "range", 3, 3 }, }, -- chooses random 1, 3, or 4
				
				-- { category = "whichNumIsMissing", chooseRandom = { "range", 3, 3 }, },
				-- { category = "sequence", chooseRandom = { "range", 7, 7 }, }, -- chooses random 1, 3, or 4
				
				-- { category = "sequence", chooseRandom = { "range", 8, 8 }, }, -- chooses random 1, 3, or 4
				
				-- { category = "whichSignIsMissing", chooseRandom = { "range", 4, 4 }, }, -- chooses random 1, 3, or 4
				-- { category = "sequence", chooseRandom = { "range", 9, 9 }, }, -- chooses random 1, 3, or 4
			-- },
	
	-- },
	
	-- random6 = { image = "day16Screen", text = "Sequence Solver",
			-- character = 2, category = "matching", chooseRandom = { "range", 1, 2 }, -- main category and chooseRandom
			
			-- voID = "", -- index of intro table in main.lua
			-- line1 = "",
			-- line3 = "",
			-- scale = "", spacing = "", offsetX = "", showTime = "",
			
			-- waypointSkip = { 2, 1, 2, 1, 2, 1, 2 },
			-- games = {
							
				-- { category = "sequence", chooseRandom = { "range", 1, 4 }, },
				-- { category = "sequence", chooseRandom = { "range", 2, 5 }, },
				
				-- { category = "sequence", chooseRandom = { "range", 3, 6 }, },
				
				-- { category = "sequence", chooseRandom = { "range", 4, 7 }, },
				-- { category = "sequence", chooseRandom = { "range", 5, 8 }, },
				
				-- { category = "sequence", chooseRandom = { "range", 6, 9 }, },
				
				-- { category = "sequence", chooseRandom = { "range", 7, 10 }, },
				-- { category = "sequence", chooseRandom = { "range", 8, 11 }, },
				
				-- { category = "sequence", chooseRandom = { "range", 9, 12 }, },
				
				-- { category = "sequence", chooseRandom = { "range", 10, 14 }, },
				-- { category = "sequence", chooseRandom = { "range", 12, 15 }, },
			-- },
	
	-- },
	-- random7 = { image = "day1Screen", text = "Grab Bag",
			-- character = 3, category = "matching", chooseRandom = { "range", 1, 2 }, -- main category and chooseRandom
			
			-- voID = "", -- index of intro table in main.lua
			-- line1 = "",
			-- line3 = "",
			-- scale = "", spacing = "", offsetX = "", showTime = "",
			
			-- waypointSkip = { 2, 1, 2, 1, 2, 1, 2 },
			-- games = {
							
				-- { category = "which2NumAddUpTo", chooseRandom = { "range", 7, 7 }, }, -- you can also set to only do game 2 in main category
				-- { category = "matching", chooseRandom = { "range", 5, 5 }, },
				
				-- { category = "whichNumIsMissing", chooseRandom = { "range", 3, 3 }, },
				
				-- { category = "whichIsMoreThan", chooseRandom = { "range", 2, 2 }, },
				-- { category = "howManyApples", chooseRandom = { "range", 2, 2 }, }, -- chooses random 1, 3, or 4
				
				-- { category = "trueOrFalse", chooseRandom = { "range", 2, 2 }, }, -- you can also set to only do game 2 in main category
				
				-- { category = "whichSignIsMissing", chooseRandom = { "range", 4, 4 }, }, -- you can also set to only do game 2 in main category
				-- { category = "equation", chooseRandom = { "range", 2, 2 }, }, -- chooses random 1, 3, or 4
				
				-- { category = "whichSentence", chooseRandom = { "range", 3, 3 }, }, -- chooses random 1, 3, or 4
				
				-- { category = "sequence", chooseRandom = { "range", 5, 5 }, }, -- chooses random 1, 3, or 4
				-- { category = "whichOneIs", chooseRandom = { "range", 5, 5 }, }, -- chooses random 1, 3, or 4
			-- },
	
	-- },
	
	-- random8 = { image = "day6Screen", text = "Match 'em Up",
			-- character = 12, category = "matching", chooseRandom = { "range", 1, 2 }, -- main category and chooseRandom
			
			-- voID = "", -- index of intro table in main.lua
			-- line1 = "",
			-- line3 = "",
			-- scale = "", spacing = "", offsetX = "", showTime = "",
			
			-- waypointSkip = { 2, 1, 2, 1, 2, 1, 2 },
			-- games = {
							
				-- { category = "matching", chooseRandom = { "range", 1, 4 }, },
				-- { category = "matching", chooseRandom = { "range", 1, 4 }, },
				
				-- { category = "matching", chooseRandom = { "range", 1, 6 }, },
				
				-- { category = "matching", chooseRandom = { "range", 3, 6 }, },
				-- { category = "matching", chooseRandom = { "range", 4, 8 }, },
				
				-- { category = "matching", chooseRandom = { "range", 1, 7 }, },
				
				-- { category = "matching", chooseRandom = { "range", 5, 8 }, },
				-- { category = "matching", chooseRandom = { "range", 2, 8 }, },
				
				-- { category = "matching", chooseRandom = { "range", 6, 10 }, },
				
				-- { category = "matching", chooseRandom = { "range", 3, 10 }, },
				-- { category = "matching", chooseRandom = { "range", 7, 10 }, },
			-- },
	-- },
	
	
	

	
	-- random9 = {image = "day2Screen", text = "Place Values",
			-- character = 3, category = "matching", chooseRandom = { "range", 1, 2 }, -- main category and chooseRandom
			
			-- voID = "", -- index of intro table in main.lua
			-- line1 = "",
			-- line3 = "",
			-- scale = "", spacing = "", offsetX = "", showTime = "",
			
			-- waypointSkip = { 1, 2, 1, 2, 1, 2, 1 },
			-- games = {
							 
				-- { category = "whichNumIsMissing", chooseRandom = { "range", 1, 3 }, },
				
				-- { category = "whichIsMoreThan", chooseRandom = { "range", 2, 4 }, },
				-- { category = "whichNumIsMissing", chooseRandom = { "range", 1, 4 }, },
				
				-- { category = "whichIsMoreThan", chooseRandom = { "range", 3, 5 }, },
				
				-- { category = "whichNumIsMissing", chooseRandom = { "range", 4, 6 }, },
				-- { category = "whichIsMoreThan", chooseRandom = { "range", 3, 7 }, },
				
				-- { category = "whichNumIsMissing", chooseRandom = { "range", 5, 7 }, },
				
				-- { category = "whichIsMoreThan", chooseRandom = { "range", 6, 8 }, },
				-- { category = "whichNumIsMissing", chooseRandom = { "range", 7, 9 }, },
				
				-- { category = "whichIsMoreThan", chooseRandom = { "range", 8, 10 }, },
			-- },
		-- },
		
		-- random10 = { image = "day3Screen", text = "Number Patterns",
			-- character = 2, category = "sequence", chooseRandom = { "range", 1, 10 }, -- main category and chooseRandom
			
			-- voID = "", -- index of intro table in main.lua
			-- line1 = "",
			-- line3 = "",
			-- scale = "", spacing = "", offsetX = "", showTime = "",
			
			-- waypointSkip = { 2, 2, 2, 2, 2, 2, 2 },
			-- games = {
							 
				-- { category = "", chooseRandom = { "range", 1, 3 }, },
				-- { category = "", chooseRandom = { "range", 2, 4 }, },
				
				-- { category = "", chooseRandom = { "range", 3, 5 }, },
				-- { category = "", chooseRandom = { "range", 4, 6 }, },
				
				-- { category = "", chooseRandom = { "range", 5, 7 }, },
				-- { category = "", chooseRandom = { "range", 6, 8 }, },
				
				-- { category = "", chooseRandom = { "range", 7, 9 }, },
				-- { category = "", chooseRandom = { "range", 8, 10}, },
				
				-- { category = "", chooseRandom = { "range", 9, 11}, },
				-- { category = "", chooseRandom = { "range", 6, 12}, },
				
				-- { category = "", chooseRandom = { "range", 10, 13}, },
				-- { category = "", chooseRandom = { "range", 11, 14}, },
				
				-- { category = "", chooseRandom = { "range", 12, 15}, },
				-- { category = "", chooseRandom = { "range", 13, 15}, },
			-- },
	
	-- },
	
	
	randomLevelOptions = {
		"level36",
		"level37",
		"level39",
		"level40",
		"level43",
		"level44",
		"level47",
		"level23",
		"level24",
		"whatsMissingDetective",
		"pickEmOutExpert",
		"whichThree",
		"equationsExpert1To10",
		"additionMixUp5To10", 
		"review6",
		"backwardsPatterns",
		
		-- "subtractionTest",
		-- "sequenceTest",
		-- "matchingTest",
		-- "matching",
		-- "counting",
		-- "sequence",
		-- "equation",
		-- "howMany",
		-- "greaterLessEqual",
		-- "whichOneIs",
		-- "whichNumIsMissing",
		-- "whichIsMoreThan",
		-- "whichSentence",
		-- "whichSignIsMissing",
		-- "howManyApples",
		-- "which2NumAddUpTo",
		-- "trueOrFalse",
		-- "howManyAre",
		--"PickEvenOdd",
	},
	
	
	
	
	
	
	
	random1 = { image = "day5Screen", text = "Pick 'em Out Expert",
			character = 3, category = "pickEmOutExpert", chooseRandom = { "range", 1, 4 }, -- main category and chooseRandom
			
			voID = "", -- index of intro table in main.lua. Use number without ""
			line1 = "",
			line3 = "",
			scale = "", spacing = "", offsetX = "", showTime = "",
			
			waypointSkip = { 1, 2, 1, 1, 2, 1 },
			games = {
				
					
			},
	
	},
	
	random2 = { image = "day5Screen", text = "What's Missing Detective",
			character = 3, category = "whatsMissingDetective", chooseRandom = { "range", 10, 11 }, -- main category and chooseRandom
			
			voID = "", -- index of intro table in main.lua. Use number without ""
			line1 = "",
			line3 = "",
			scale = "", spacing = "", offsetX = "", showTime = "",
			
			waypointSkip = { 1, 2, 1, 2, 1, 2 },
			games = {
				
					
			},
	
	},
	
	random3 = { image = "day5Screen", text = "Which Three?",
			character = 3, category = "whichThree", chooseRandom = { "range", 1, 7 }, -- main category and chooseRandom
			
			voID = "", -- index of intro table in main.lua. Use number without ""
			line1 = "",
			line3 = "",
			scale = "", spacing = "", offsetX = "", showTime = "",
			
			waypointSkip = { 1, 2, 1, 1, 1, 2 },
			games = {
				
					
			},
	
	},
	
	random4 = { image = "day5Screen", text = "Addition Mix Up 5 to 10",
			character = 3, category = "additionMixUp5To10", chooseRandom = { "range", 1, 11 }, -- main category and chooseRandom
			
			voID = "", -- index of intro table in main.lua. Use number without ""
			line1 = "",
			line3 = "",
			scale = "", spacing = "", offsetX = "", showTime = "",
			
			waypointSkip = { 1, 2, 2, 1, 2, 1 },
			games = {
				
					
			},
	
	},
	
	random5 = { image = "day5Screen", text = "Subtraction Mix Up 5 to 10",
			character = 3, category = "subtractionMixUp5To10", chooseRandom = { "range", 1, 11 }, -- main category and chooseRandom
			
			voID = "", -- index of intro table in main.lua. Use number without ""
			line1 = "",
			line3 = "",
			scale = "", spacing = "", offsetX = "", showTime = "",
			
			waypointSkip = { 2, 1, 2, 1, 2, 1 },
			games = {
				
					
			},
	
	},
	
	random6 = { image = "day5Screen", text = "Greater & Less Deluxe",
			character = 3, category = "greaterAndLessThanDeluxe", chooseRandom = { "range", 6, 7 }, -- main category and chooseRandom
			
			voID = "", -- index of intro table in main.lua. Use number without ""
			line1 = "",
			line3 = "",
			scale = "", spacing = "", offsetX = "", showTime = "",
			
			waypointSkip = { 1, 2, 1, 1, 2, 1 },
			games = {
				
					
			},
	
	},
	
	random7 = { image = "day5Screen", text = "Equations Expert 1 to 10",
			character = 3, category = "equationsExpert1To10", chooseRandom = { "range", 1, 6 }, -- main category and chooseRandom
			
			voID = "", -- index of intro table in main.lua. Use number without ""
			line1 = "",
			line3 = "",
			scale = "", spacing = "", offsetX = "", showTime = "",
			
			waypointSkip = { 1, 2, 1, 1, 2, 2 },
			games = {
				
					
			},
	
	},
	
	random8 = { image = "day5Screen", text = "Where Does It Belong?",
			character = 3, category = "whereDoesItBelong", chooseRandom = { "range", 1, 12 }, -- main category and chooseRandom
			
			voID = "", -- index of intro table in main.lua. Use number without ""
			line1 = "",
			line3 = "",
			scale = "", spacing = "", offsetX = "", showTime = "",
			
			waypointSkip = { 1, 1, 1, 1, 1, 1 },
			games = {
				
					
			},
	
	},
	
	random9 = { image = "day5Screen", text = "Equation Challenge",
			character = 3, category = "equationChallenge", chooseRandom = { "range", 1, 3 }, -- main category and chooseRandom
			
			voID = "", -- index of intro table in main.lua. Use number without ""
			line1 = "",
			line3 = "",
			scale = "", spacing = "", offsetX = "", showTime = "",
			
			waypointSkip = { 2, 1, 2, 2, 1, 2 },
			games = {
				
					
			},
	
	},
	
	random10 = { image = "day5Screen", text = "Complex Equations",
			character = 3, category = "complexEquations", chooseRandom = { "range", 1, 3 }, -- main category and chooseRandom
			
			voID = "", -- index of intro table in main.lua. Use number without ""
			line1 = "",
			line3 = "",
			scale = "", spacing = "", offsetX = "", showTime = "",
			
			waypointSkip = { 1, 1, 1, 1, 1, 1 },
			games = {
				
					
			},
	
	},
	
	random11 = { image = "day5Screen", text = "Mathmatical",
			character = 3, category = "review6", chooseRandom = { "range", 1, 6 }, -- main category and chooseRandom
			
			voID = "", -- index of intro table in main.lua. Use number without ""
			line1 = "",
			line3 = "",
			scale = "", spacing = "", offsetX = "", showTime = "",
			
			waypointSkip = { 2, 1, 2, 1, 2, 1 },
			games = {
				
					
			},
	
	},
	
	
	
	random12 = { image = "day5Screen", text = "Reverse Patterns",
			character = 3, category = "backwardsPatterns", chooseRandom = { "range", 1, 8 }, -- main category and chooseRandom
			
			voID = "", -- index of intro table in main.lua. Use number without ""
			line1 = "",
			line3 = "",
			scale = "", spacing = "", offsetX = "", showTime = "",
			
			waypointSkip = { 1, 1, 1, 1, 1, 1 },
			games = {
				
					
			},
	
	},
	
	-- random1 = { image = "day5Screen", text = "Complex Equations 1 to 10",
			-- character = 3, category = "complexEquations1To10", chooseRandom = { "range", 1, 7 }, -- main category and chooseRandom
			
			-- voID = "", -- index of intro table in main.lua. Use number without ""
			-- line1 = "",
			-- line3 = "",
			-- scale = "", spacing = "", offsetX = "", showTime = "",
			
			-- waypointSkip = { 2, 2, 2, 2, 2, 2 },
			-- games = {
				
					
			-- },
	
	-- },
	
	-- random1 = { image = "day5Screen", text = "Flash Card Math Deluxe 1 to 10",
			-- character = 3, category = "flashCardMatchDeluxe1To10", chooseRandom = { "range", 1, 6 }, -- main category and chooseRandom
			
			-- voID = "", -- index of intro table in main.lua. Use number without ""
			-- line1 = "",
			-- line3 = "",
			-- scale = "", spacing = "", offsetX = "", showTime = "",
			
			-- waypointSkip = { 2, 2, 2, 2, 2, 2 },
			-- games = {
				
					
			-- },
	
	-- },
	
	-- random1 = { image = "day5Screen", text = "Ten More or Less",
			-- character = 3, category = "tenMoreOrLess", chooseRandom = { "range", 1, 6 }, -- main category and chooseRandom
			
			-- voID = "", -- index of intro table in main.lua. Use number without ""
			-- line1 = "",
			-- line3 = "",
			-- scale = "", spacing = "", offsetX = "", showTime = "",
			
			-- waypointSkip = { 2, 2, 2, 2, 2, 2 },
			-- games = {
				
					
			-- },
	
	-- },
	
	-- random1 = { image = "day5Screen", text = "Number Brain",
			-- character = 3, category = "numberBrain", chooseRandom = { "range", 1, 7 }, -- main category and chooseRandom
			
			-- voID = "", -- index of intro table in main.lua. Use number without ""
			-- line1 = "",
			-- line3 = "",
			-- scale = "", spacing = "", offsetX = "", showTime = "",
			
			-- waypointSkip = { 2, 2, 2, 2, 2, 2 },
			-- games = {
				
					
			-- },
	
	-- },
	
	-- random1 = { image = "day5Screen", text = "Warming Up",
			-- character = 3, category = "warmingUp", chooseRandom = { "range", 1, 7 }, -- main category and chooseRandom
			
			-- voID = "", -- index of intro table in main.lua. Use number without ""
			-- line1 = "",
			-- line3 = "",
			-- scale = "", spacing = "", offsetX = "", showTime = "",
			
			-- waypointSkip = { 2, 2, 2, 2, 2, 2 },
			-- games = {
				
					
			-- },
	
	-- },
	
	-- random1 = { image = "day5Screen", text = "Test of Endurance",
			-- character = 3, category = "testOfEndurance", chooseRandom = { "range", 1, 12 }, -- main category and chooseRandom
			
			-- voID = "", -- index of intro table in main.lua. Use number without ""
			-- line1 = "",
			-- line3 = "",
			-- scale = "", spacing = "", offsetX = "", showTime = "",
			
			-- waypointSkip = { 2, 2, 2, 2, 2, 2 },
			-- games = {
				
					
			-- },
	
	-- },
	
	-- random1 = { image = "day5Screen", text = "Subtraction Review 1 to 5",
			-- character = 3, category = "subtractionReview1To5", chooseRandom = { "range", 1, 11 }, -- main category and chooseRandom
			
			-- voID = "", -- index of intro table in main.lua. Use number without ""
			-- line1 = "",
			-- line3 = "",
			-- scale = "", spacing = "", offsetX = "", showTime = "",
			
			-- waypointSkip = { 2, 2, 2, 2, 2, 2 },
			-- games = {
				
					
			-- },
	
	-- },
	
	-- random1 = { image = "day5Screen", text = "Challenge 1 to 10",
			-- character = 3, category = "challenge1To10", chooseRandom = { "range", 1, 8 }, -- main category and chooseRandom
			
			-- voID = "", -- index of intro table in main.lua. Use number without ""
			-- line1 = "",
			-- line3 = "",
			-- scale = "", spacing = "", offsetX = "", showTime = "",
			
			-- waypointSkip = { 2, 2, 2, 2, 2, 2 },
			-- games = {
				
					
			-- },
	
	-- },
	
	-- random1 = { image = "day5Screen", text = "Addition Review 1 to 5",
			-- character = 3, category = "additionReview1To5", chooseRandom = { "range", 1, 11 }, -- main category and chooseRandom
			
			-- voID = "", -- index of intro table in main.lua. Use number without ""
			-- line1 = "",
			-- line3 = "",
			-- scale = "", spacing = "", offsetX = "", showTime = "",
			
			-- waypointSkip = { 2, 2, 2, 2, 2, 2 },
			-- games = {
				
					
			-- },
	
	-- },
	
	-- random1 = { image = "day5Screen", text = "Totally Random",
			-- character = 3, category = "totallyRandom", chooseRandom = { "range", 1, 7 }, -- main category and chooseRandom
			
			-- voID = "", -- index of intro table in main.lua. Use number without ""
			-- line1 = "",
			-- line3 = "",
			-- scale = "", spacing = "", offsetX = "", showTime = "",
			
			-- waypointSkip = { 2, 2, 2, 2, 2, 2 },
			-- games = {
				
					
			-- },
	
	-- },
	
	-- random1 = { image = "day5Screen", text = "Totally Random Deluxe",
			-- character = 3, category = "totallyRandomDeluxe", chooseRandom = { "range", 1, 13 }, -- main category and chooseRandom
			
			-- voID = "", -- index of intro table in main.lua. Use number without ""
			-- line1 = "",
			-- line3 = "",
			-- scale = "", spacing = "", offsetX = "", showTime = "",
			
			-- waypointSkip = { 2, 2, 2, 2, 2, 2 },
			-- games = {
				
					
			-- },
	
	-- },
	
	-- random3 = 
	
	-- { image = "day5Screen", text = "Totally Random",
			-- character = 1, category = "", chooseRandom = { "range", 1, 6 }, -- main category and chooseRandom
			
			-- voID = "", -- index of intro table in main.lua. Use number without ""
			-- line1 = "",
			-- line3 = "",
			-- scale = "", spacing = "", offsetX = "", showTime = "",
			
			-- waypointSkip = { 1, 2, 1, 1, 2, 1 },
			-- games = {
				
				
			-- },
	
	-- },
	
	-- random4 = 
	
	-- { image = "day5Screen", text = "Equation Challenge",
			-- character = 4, category = "level39", chooseRandom = { "range", 1, 6 }, -- main category and chooseRandom
			
			-- voID = "", -- index of intro table in main.lua. Use number without ""
			-- line1 = "",
			-- line3 = "",
			-- scale = "", spacing = "", offsetX = "", showTime = "",
			
			-- waypointSkip = { 1, 2, 1, 2, 2, 2 },
			-- games = {
				
										
			-- },
	
	-- },
	
	
	-- random5 = 
	
		-- { image = "day5Screen", text = "Dot Math Mystery",
			-- character = 5, category = "level40", chooseRandom = { "range", 1, 10 }, -- main category and chooseRandom
			
			-- voID = "", -- index of intro table in main.lua. Use number without ""
			-- line1 = "",
			-- line3 = "",
			-- scale = "", spacing = "", offsetX = "", showTime = "",
			
			-- waypointSkip = { 2, 2, 1, 2, 1, 2 },
			-- games = {
				
					
			-- },
	
	
	
	-- },
	
	-- random6 = 
	
	-- { image = "day5Screen", text = "Number Fun",
			-- character = 6, category = "level43", chooseRandom = { "range", 1, 14 }, -- main category and chooseRandom
			
			-- voID = "", -- index of intro table in main.lua. Use number without ""
			-- line1 = "",
			-- line3 = "",
			-- scale = "", spacing = "", offsetX = "", showTime = "",
			
			-- waypointSkip = { 1, 2, 1, 2, 2, 2 },
			-- games = {
				
				
			-- },
	
	-- },
	
	-- random7 = 
	
	-- { image = "day5Screen", text = "Match 'Em Up!",
			-- character = 3, category = "level44", chooseRandom = { "range", 1, 9 }, -- main category and chooseRandom
			
			-- voID = "", -- index of intro table in main.lua. Use number without ""
			-- line1 = "",
			-- line3 = "",
			-- scale = "", spacing = "", offsetX = "", showTime = "",
			
			-- waypointSkip = { 1, 2, 1, 1, 2, 1 },
			-- games = {
				
				
			-- },
	
	-- },
	
	-- random8 = 
	-- { image = "day5Screen", text = "Addition Surprise",
			-- character = 3, category = "level47", chooseRandom = { "range", 1, 12 }, -- main category and chooseRandom
			
			-- voID = "", -- index of intro table in main.lua. Use number without ""
			-- line1 = "",
			-- line3 = "",
			-- scale = "", spacing = "", offsetX = "", showTime = "",
			
			-- waypointSkip = { 1, 2, 1, 1, 2, 1 },
			-- games = {
				
				
			-- },
	
	-- },
	-- random9 = 
	-- { image = "day5Screen", text = "Silly Sequences",
			-- character = 3, category = "level23", chooseRandom = { "range", 1, 10 }, -- main category and chooseRandom
			
			-- voID = "", -- index of intro table in main.lua. Use number without ""
			-- line1 = "",
			-- line3 = "",
			-- scale = "", spacing = "", offsetX = "", showTime = "",
			
			-- waypointSkip = { 1, 2, 1, 1, 2, 1 },
			-- games = {
						
				
			-- },
	
	-- },
	-- random10 = 
	-- { image = "day5Screen", text = "First & Last",
			-- character = 3, category = "level24", chooseRandom = { "range", 1, 6 }, -- main category and chooseRandom
			
			-- voID = "", -- index of intro table in main.lua. Use number without ""
			-- line1 = "",
			-- line3 = "",
			-- scale = "", spacing = "", offsetX = "", showTime = "",
			
			-- waypointSkip = { 1, 2, 1, 1, 2, 1 },
			-- games = {
				
				
			-- },
	
	-- },
	
	-- random11 = 
	-- { image = "day5Screen", text = "Random Challenge",
			-- character = 1, category = "", chooseRandom = { "range", 1, 6 }, -- main category and chooseRandom
			
			-- voID = "", -- index of intro table in main.lua. Use number without ""
			-- line1 = "",
			-- line3 = "",
			-- scale = "", spacing = "", offsetX = "", showTime = "",
			
			-- waypointSkip = { 1, 2, 1, 1, 2, 1 },
			-- games = {
				
				
			-- },
	
	-- },
	
	-- random12 = 
	-- { image = "day5Screen", text = "Colors, Numbers, and Shapes Marathon",
			-- character = 1, category = "colorsNumbersAndShapesMarathon", chooseRandom = { "range", 1, 11 }, -- main category and chooseRandom
			
			-- voID = "", -- index of intro table in main.lua. Use number without ""
			-- line1 = "",
			-- line3 = "",
			-- scale = "", spacing = "", offsetX = "", showTime = "",
			
			-- waypointSkip = { 2, 3, 4, 3, 2, 3 },
			-- games = {
				
				
			-- },
	
	-- },
	
	
	-- random13 = 
	-- { image = "day5Screen", text = "Puzzle Frenzy",
			-- character = 1, category = "puzzleFrenzy", chooseRandom = { "range", 1, 6 }, -- main category and chooseRandom
			
			-- voID = "", -- index of intro table in main.lua. Use number without ""
			-- line1 = "",
			-- line3 = "",
			-- scale = "", spacing = "", offsetX = "", showTime = "",
			
			-- waypointSkip = { 1, 2, 1, 2, 1, 2 },
			-- games = {
				
				
			-- },
	
	-- },
	
	-- random14 = 
	-- { image = "day5Screen", text = "Which Two Deluxe",
			-- character = 1, category = "whichTwoDeluxe", chooseRandom = { "range", 1, 4 }, -- main category and chooseRandom
			
			-- voID = "", -- index of intro table in main.lua. Use number without ""
			-- line1 = "",
			-- line3 = "",
			-- scale = "", spacing = "", offsetX = "", showTime = "",
			
			-- waypointSkip = { 1, 2, 1, 2, 3, 2 },
			-- games = {
				
				
			-- },
	
	-- },
	
	
	
	
	-- random2 = { image = "day1Screen", text = "Snack Attack!",
			-- character = 8, category = "howMany", chooseRandom = { "range", 1, 10 }, -- main category and chooseRandom
			
			-- voID = "", -- index of intro table in main.lua
			-- line1 = "",
			-- line3 = "",
			-- scale = "", spacing = "", offsetX = "", showTime = "",
			
			-- waypointSkip = { 1, 2, 1, 1, 2, 1 },
			-- games = {
				
				----{ category = "whichIsMoreThan", chooseRandom = { "range", 9, 9 }, },
				
				-- { category = "howManyApples", chooseRandom = { "range", 7, 7}, },
				
				-- { category = "howManyApples", chooseRandom = { "range", 8, 9}, },
				-- { category = "howManyApples", chooseRandom = { "range", 7, 9}, },
				
				-- { category = "howManyApples", chooseRandom = { "range", 8, 9}, },
				
				-- { category = "howManyApples", chooseRandom = { "range", 7, 10}, },
				
				-- { category = "howManyApples", chooseRandom = { "range", 8, 11}, },
				-- { category = "howManyApples", chooseRandom = { "range", 9, 12}, },
				
				-- { category = "howManyApples", chooseRandom = { "range", 10, 12}, },
				
				-- { category = "howManyApples", chooseRandom = { "range", 11, 12}, },
				-- { category = "howManyApples", chooseRandom = { "range", 12, 12}, },
			-- },
	
	-- },
						
			
	-- random3 = {image = "day2Screen", text = "Mind Bender",
			-- character = 2, category = "matching", chooseRandom = { "range", 1, 2 }, -- main category and chooseRandom
			
			-- voID = "", -- index of intro table in main.lua
			-- line1 = "",
			-- line3 = "",
			-- scale = "", spacing = "", offsetX = "", showTime = "",
			
			-- waypointSkip = { 1, 2, 1, 2, 1, 2 },
			-- games = {
						
				-- { category = "sequence", chooseRandom = { "range", 5, 7 }, }, -- chooses random 1, 3, or 4
				
				-- { category = "sequence", chooseRandom = { "range", 6, 8 }, }, -- chooses random 1, 3, or 4
				-- { category = "whichNumIsMissing", chooseRandom = { "range", 2, 2 }, },
				
				-- { category = "sequence", chooseRandom = { "range", 8, 11 }, }, -- chooses random 1, 3, or 4
				
				-- { category = "whichNumIsMissing", chooseRandom = { "range", 3, 3 }, },
				-- { category = "sequence", chooseRandom = { "range", 9, 12 }, }, -- chooses random 1, 3, or 4
				
				-- { category = "sequence", chooseRandom = { "range", 10, 13 }, }, -- chooses random 1, 3, or 4
				
				-- { category = "whichNumIsMissing", chooseRandom = { "range", 3, 3 }, },
				-- { category = "whichNumIsMissing", chooseRandom = { "range", 3, 3 }, },
				
				-- { category = "sequence", chooseRandom = { "range", 12, 13 }, }, -- chooses random 1, 3, or 4
				
			-- },
	
	-- },
		
			
	
	-- random4 = { image = "day4Screen", text = "Erratic Equations Plus",
			-- character = 6, category = "matching", chooseRandom = { "range", 1, 2 }, -- main category and chooseRandom
			
			-- voID = "", -- index of intro table in main.lua
			-- line1 = "",
			-- line3 = "",
			-- scale = "", spacing = "", offsetX = "", showTime = "",
			
			-- waypointSkip = { 2, 1, 2, 1, 2, 1 },
			-- games = {
				
				-- { category = "equation", chooseRandom = { "range", 17, 17 }, }, -- chooses random 1, 3, or 4
				-- { category = "trueOrFalse", chooseRandom = { "range", 1, 1 }, }, -- you can also set to only do game 2 in main category
				
				-- { category = "whichSignIsMissing", chooseRandom = { "range", 11, 11 }, }, -- you can also set to only do game 2 in main category
								
				-- { category = "equation", chooseRandom = { "range", 18, 18 }, }, -- chooses random 1, 3, or 4
				-- { category = "whichSentence", chooseRandom = { "range", 1, 1 }, }, -- chooses random 1, 3, or 4
				
				-- { category = "trueOrFalse", chooseRandom = { "range", 4, 4 }, }, -- you can also set to only do game 2 in main category
				
				-- { category = "equation", chooseRandom = { "range", 18, 18 }, }, -- chooses random 1, 3, or 4
				-- { category = "whichSignIsMissing", chooseRandom = { "range", 13, 13 }, }, -- you can also set to only do game 2 in main category
				
				-- { category = "whichSentence", chooseRandom = { "range", 2, 2 }, }, -- chooses random 1, 3, or 4
				
				-- { category = "trueOrFalse", chooseRandom = { "range", 4, 4 }, }, -- you can also set to only do game 2 in main category
				-- { category = "equation", chooseRandom = { "range", 19, 19 }, }, -- chooses random 1, 3, or 4
						
			-- },
	-- },
	
		-- random5 = { image = "day11Screen", text = "Can You Remember?",
			-- character = 1, category = "matching", chooseRandom = { "range", 1, 2 }, -- main category and chooseRandom
			
			-- voID = "", -- index of intro table in main.lua
			-- line1 = "",
			-- line3 = "",
			-- scale = "", spacing = "", offsetX = "", showTime = "",
			
			-- waypointSkip = { 2, 1, 2, 1, 2, 1 },
			-- games = {
							
				-- { category = "matching", chooseRandom = { "range", 1, 4 }, },
				-- { category = "matching", chooseRandom = { "range", 1, 4 }, },
				
				-- { category = "matching", chooseRandom = { "range", 1, 6 }, },
				
				-- { category = "matching", chooseRandom = { "range", 3, 6 }, },
				-- { category = "matching", chooseRandom = { "range", 4, 8 }, },
				
				-- { category = "matching", chooseRandom = { "range", 1, 7 }, },
				
				-- { category = "matching", chooseRandom = { "range", 5, 8 }, },
				-- { category = "matching", chooseRandom = { "range", 2, 8 }, },
				
				-- { category = "matching", chooseRandom = { "range", 6, 10 }, },
				
				-- { category = "matching", chooseRandom = { "range", 3, 10 }, },
				-- { category = "matching", chooseRandom = { "range", 7, 10 }, },
			-- },
	-- },
		
			
	-- random6 = { image = "day6Screen", text = "Kaleidoscope",
			-- character = 3, category = "matching", chooseRandom = { "range", 1, 2 }, -- main category and chooseRandom
			
			-- voID = 17, -- index of intro table in main.lua
			-- line1 = "Charlie's an expert.",
			-- line3 = "Let's play along!",
			-- scale = 23, spacing = 15, offsetX = "", showTime = 1700,
			
			-- waypointSkip = { 2, 1, 2, 2, 2, 1 },
			-- games = {
							
				-- { category = "which2NumAddUpTo", chooseRandom = { "range", 7, 7 }, }, -- you can also set to only do game 2 in main category
				-- { category = "matching", chooseRandom = { "range", 5, 5 }, },
				
				-- { category = "whichNumIsMissing", chooseRandom = { "range", 3, 3 }, },
				
				-- { category = "whichIsMoreThan", chooseRandom = { "range", 2, 2 }, },
				-- { category = "howManyApples", chooseRandom = { "range", 2, 2 }, }, -- chooses random 1, 3, or 4
				
				-- { category = "trueOrFalse", chooseRandom = { "range", 2, 2 }, }, -- you can also set to only do game 2 in main category
				-- { category = "matching", chooseRandom = { "range", 7, 7 }, }, -- you can also set to only do game 2 in main category
								
				-- { category = "whichSignIsMissing", chooseRandom = { "range", 4, 4 }, }, -- you can also set to only do game 2 in main category
				-- { category = "equation", chooseRandom = { "range", 2, 2 }, }, -- chooses random 1, 3, or 4
				
				-- { category = "whichSentence", chooseRandom = { "range", 3, 3 }, }, -- chooses random 1, 3, or 4
				
				-- { category = "sequence", chooseRandom = { "range", 5, 5 }, }, -- chooses random 1, 3, or 4
				-- { category = "whichOneIs", chooseRandom = { "range", 5, 5 }, }, -- chooses random 1, 3, or 4
			-- },
	
	-- },
	
	-- random7 = { image = "day7Screen", text = "The Big Test",
			-- character = 3, category = "equation", chooseRandom = { "range", 11, 16 }, -- only subtraction
			
			-- voID = "", -- index of intro table in main.lua
			-- line1 = "",
			-- line3 = "",
			-- scale = "", spacing = "", offsetX = "", showTime = "",
			
			-- waypointSkip = { 2, 1, 2, 1, 2, 1 },
			-- games = {
				
				
			-- },
	-- },
	
	
	-- random8 = { image = "day8Screen", text = "It's a Toughie!",
			-- character = 4, category = "which2NumAddUpTo", chooseRandom = { "range", 1, 10 }, -- main category and chooseRandom
			
			-- voID = 14, -- index of intro table in main.lua
			-- line1 = "Ready for more?",
			-- line3 = "Let's find out!",
			-- scale = 24, spacing = 15, offsetX = "", showTime = "",
			
			-- waypointSkip = { 3, 2, 1, 2, 3, 2 },
			-- games = {
				
				-- { category = "whichSentence", chooseRandom = { "range", 3, 3 }, },
				-- { category = "whichSentence", chooseRandom = { "range", 5, 5 }, },
				-- { category = "whichSentence", chooseRandom = { "range", 6, 6 }, },
				
				-- { category = "which2NumAddUpTo", chooseRandom = { "range", 7, 9 }, },
				-- { category = "which2NumAddUpTo", chooseRandom = { "range", 8, 10}, },
				
				-- { category = "matching", chooseRandom = { "range", 8, 10 }, },
				
				-- { category = "whichIsMoreThan", chooseRandom = { "range", 5, 7 }, },
				-- { category = "whichIsMoreThan", chooseRandom = { "range", 8, 10 }, },
				
				-- { category = "trueOrFalse", chooseRandom = { "range", 1, 3 }, }, -- you can also set to only do game 2 in main category
				-- { category = "trueOrFalse", chooseRandom = { "range", 2, 5 }, }, -- you can also set to only do game 2 in main category
				-- { category = "trueOrFalse", chooseRandom = { "range", 3, 6 }, }, -- you can also set to only do game 2 in main category
				
				-- { category = "equation", chooseRandom = { "range", 5, 7 }, },
				-- { category = "equation", chooseRandom = { "range", 8, 10 }, },
				
				-- { category = "matching", chooseRandom = { "range", 9, 9 }, },
			-- },	
				
	-- },
		
	-- random9 = { image = "day9Screen", text = "More or Less",
			-- character = 3, category = "equation", chooseRandom = { "range", 1, 10 }, -- main category and chooseRandom
			
			-- voID = "", -- index of intro table in main.lua
			-- line1 = "",
			-- line3 = "",
			-- scale = "", spacing = "", offsetX = "", showTime = "",
			
			-- waypointSkip = { 2, 1, 2, 1, 2, 1 },
			-- games = {
							
				-- { category = "greaterLessEqual", chooseRandom = { "range", 1, 1 }, },
				-- { category = "greaterLessEqual", chooseRandom = { "range", 2, 4 }, },
				
				-- { category = "greaterLessEqual", chooseRandom = { "range", 1, 4 }, },
				
				-- { category = "greaterLessEqual", chooseRandom = { "range", 3, 5 }, },
				-- { category = "greaterLessEqual", chooseRandom = { "range", 4, 6 }, },
				
				-- { category = "greaterLessEqual", chooseRandom = { "range", 3, 7 }, },
				
				-- { category = "greaterLessEqual", chooseRandom = { "range", 5, 7 }, },
				-- { category = "greaterLessEqual", chooseRandom = { "range", 6, 8 }, },
				
				-- { category = "greaterLessEqual", chooseRandom = { "range", 5, 10 }, },
				
				-- { category = "greaterLessEqual", chooseRandom = { "range", 7, 9 }, },
				-- { category = "greaterLessEqual", chooseRandom = { "range", 8, 10 }, },
			-- },
	-- },
	
		-- random10 = { image = "day10Screen", text = "Starts Easy, Then...",
			-- character = 5, category = "howMany", chooseRandom = { "range", 1, 10 }, -- main category and chooseRandom
			
			-- voID = 13, -- index of intro table in main.lua
			-- line1 = "Ready for more?",
			-- line3 = "You can do it!",
			-- scale = 24, spacing = 15, offsetX = "", showTime = "",
			
			-- waypointSkip = { 2, 2, 1, 1, 2, 1 },
			-- games = {
				
				----{ category = "whichIsMoreThan", chooseRandom = { "range", 9, 9 }, },
							
				-- { category = "howMany", chooseRandom = { "range", 4, 4 }, },
				-- { category = "howMany", chooseRandom = { "range", 5, 5 }, },
				
				-- { category = "howManyAre", chooseRandom = { "range", 5, 7 }, }, -- you can also set to only do game 2 in main category
				-- { category = "howManyAre", chooseRandom = { "range", 8, 10 }, }, -- you can also set to only do game 2 in main category
								
				-- { category = "sequence", chooseRandom = { "range", 3, 3 }, },
				
				-- { category = "whichOneIs", chooseRandom = { "range", 5, 6 }, },
								
				-- { category = "whichIsMoreThan", chooseRandom = { "range", 5, 7 }, },
				-- { category = "whichIsMoreThan", chooseRandom = { "range", 8, 8 }, },
				
				-- { category = "whichSentence", chooseRandom = { "range", 4, 6}, },
								
				-- { category = "howManyApples", chooseRandom = { "range", 1, 3}, },
				-- { category = "howManyApples", chooseRandom = { "range", 4, 6}, },
			-- },
	
	-- },
	
	-- random11 = { image = "day18Screen", text = "More Number Sentences",
			-- character = 6, category = "whichSentence", chooseRandom = { "range", 1, 6 }, -- main category and chooseRandom
			
			-- voID = "", -- index of intro table in main.lua
			-- line1 = "",
			-- line3 = "",
			-- scale = "", spacing = "", offsetX = "", showTime = "",
			
			-- waypointSkip = { 1, 2, 1, 2, 1, 2 },
			-- games = {
				
				
			-- },
	-- },
	
	-- random12 = { image = "day11Screen", text = "Mix Up Match",
			-- character = 7, category = "matching", chooseRandom = { "range", 1, 2 }, -- main category and chooseRandom
			
			-- voID = "", -- index of intro table in main.lua
			-- line1 = "",
			-- line3 = "",
			-- scale = "", spacing = "", offsetX = "", showTime = "",
			
			-- waypointSkip = { 2, 1, 2, 1, 2, 1 },
			-- games = {
							
				-- { category = "matching", chooseRandom = { "range", 1, 4 }, },
				-- { category = "matching", chooseRandom = { "range", 1, 4 }, },
				
				-- { category = "matching", chooseRandom = { "range", 1, 6 }, },
				
				-- { category = "matching", chooseRandom = { "range", 3, 6 }, },
				-- { category = "matching", chooseRandom = { "range", 4, 8 }, },
				
				-- { category = "matching", chooseRandom = { "range", 1, 7 }, },
				
				-- { category = "matching", chooseRandom = { "range", 5, 8 }, },
				-- { category = "matching", chooseRandom = { "range", 2, 8 }, },
				
				-- { category = "matching", chooseRandom = { "range", 6, 10 }, },
				
				-- { category = "matching", chooseRandom = { "range", 3, 10 }, },
				-- { category = "matching", chooseRandom = { "range", 7, 10 }, },
			-- },
	-- },
	
	
	

	
	-- random13 = {image = "day12Screen", text = "More Place Values",
			-- character = 5, category = "matching", chooseRandom = { "range", 1, 2 }, -- main category and chooseRandom
			
			-- voID = "", -- index of intro table in main.lua
			-- line1 = "",
			-- line3 = "",
			-- scale = "", spacing = "", offsetX = "", showTime = "",
			
			-- waypointSkip = { 1, 2, 1, 2, 1, 2 },
			-- games = {
							 
				-- { category = "whichNumIsMissing", chooseRandom = { "range", 1, 3 }, },
				
				-- { category = "whichIsMoreThan", chooseRandom = { "range", 2, 4 }, },
				-- { category = "whichNumIsMissing", chooseRandom = { "range", 1, 4 }, },
				
				-- { category = "whichIsMoreThan", chooseRandom = { "range", 3, 5 }, },
				
				-- { category = "whichNumIsMissing", chooseRandom = { "range", 4, 6 }, },
				-- { category = "whichIsMoreThan", chooseRandom = { "range", 3, 7 }, },
				
				-- { category = "whichNumIsMissing", chooseRandom = { "range", 5, 7 }, },
				
				-- { category = "whichIsMoreThan", chooseRandom = { "range", 6, 8 }, },
				-- { category = "whichNumIsMissing", chooseRandom = { "range", 7, 9 }, },
				
				-- { category = "whichIsMoreThan", chooseRandom = { "range", 8, 10 }, },
			-- },
		-- },
	
	-- random14  = {image = "day13Screen", text = "Which 2 Plus",
			-- character = 8, category = "which2NumAddUpTo", chooseRandom = { "range", 1, 2 }, -- main category and chooseRandom
			
			-- voID = 16, -- index of intro table in main.lua
			-- line1 = "Can you solve the\naddition problems?",
			-- line3 = "Let's find out.",
			-- scale = "", spacing = "", offsetX = "", showTime = 2300,
			
			-- waypointSkip = { 1, 2, 1, 2, 1, 2 },
			-- games = {
							 
				-- { category = "", chooseRandom = { "range", 1, 3 }, },
				
				-- { category = "", chooseRandom = { "range", 2, 4 }, },
				-- { category = "", chooseRandom = { "range", 3, 4 }, },
				
				-- { category = "", chooseRandom = { "range", 1, 5 }, },
				
				-- { category = "", chooseRandom = "", },
				-- { category = "", chooseRandom = { "range", 3,5 }, },
				
				-- { category = "", chooseRandom = { "range", 4, 6 }, },
				
				-- { category = "", chooseRandom = { "range", 3, 6 }, },
				-- { category = "", chooseRandom = { "range", 5, 7 }, },
				
				-- { category = "", chooseRandom = { "range", 6, 7 }, },
			-- },
		-- },
	
	-- random15 = {image = "day14Screen", text = "Equation Explosion",
			-- character = 3, category = "equation", chooseRandom = { "range", 1, 2 }, -- main category and chooseRandom
			
			-- voID = 19, -- index of intro table in main.lua
			-- line1 = "Let's take on\nanother level.",
			-- line3 = "You can do it!",
			-- scale = "", spacing = "", offsetX = "", showTime = 2150,
			
			-- waypointSkip = { 2, 2, 2, 2, 2, 2 },
			-- games = {
							 
				-- { category = "", chooseRandom = { "range", 1, 3 }, },
				-- { category = "", chooseRandom = { "range", 2, 4 }, },
				
				-- { category = "", chooseRandom = { "range", 3, 5 }, },
				-- { category = "", chooseRandom = { "range", 4, 6 }, },
				
				-- { category = "", chooseRandom = { "range", 4, 7 }, },
				-- { category = "", chooseRandom = { "range", 5, 8 }, },
				
				-- { category = "", chooseRandom = { "range", 3, 7 }, },
				-- { category = "", chooseRandom = { "range", 4, 7}, },
				
				-- { category = "", chooseRandom = { "range", 5, 10}, },
				-- { category = "", chooseRandom = { "range", 5, 8}, },
				
				-- { category = "", chooseRandom = { "range", 5, 8}, },
				-- { category = "", chooseRandom = { "range", 7, 10}, },
				
				-- { category = "", chooseRandom = { "range", 7, 9}, },
				-- { category = "", chooseRandom = { "range", 8, 10}, },
			-- },
	
	-- },
	
	-- random16 = { image = "day17Screen", text = "Completely Random!",
			-- character = 6, category = "", chooseRandom = { "range", 3, 10 }, -- main category and chooseRandom
			
			-- voID = 21, -- index of intro table in main.lua
			-- line1 = "You up for the\nchallenge?",
			-- line3 = "Let's go Henrietta!",
			-- scale = "", spacing = "", offsetX = "", showTime = "",
			
			-- waypointSkip = { 1, 2, 3, 2, 1, 2 },
			-- games = {
							 
				
			-- },
	
	-- },
	
	-- random17 = {image = "day15Screen", text = "Find the Missing Sign",
			-- character = 7, category = "equation", chooseRandom = { "range", 1, 6 }, -- main category and chooseRandom
			
			-- voID = "", -- index of intro table in main.lua
			-- line1 = "",
			-- line3 = "",
			-- scale = "", spacing = "", offsetX = "", showTime = "",
			
			-- waypointSkip = { 1, 2, 1, 2, 1, 2 },
			-- games = {	
			
			-- { category = "whichSignIsMissing", chooseRandom = { "range", 1, 1 }, }, -- chooses random 1, 3, or 4
			
			-- { category = "whichSignIsMissing", chooseRandom = { "range", 1, 4 }, }, -- chooses random 1, 3, or 4
			-- { category = "whichSignIsMissing", chooseRandom = { "range", 2, 5 }, }, -- chooses random 1, 3, or 4
			
			-- { category = "whichSignIsMissing", chooseRandom = { "range", 2, 7 }, }, -- chooses random 1, 3, or 4
		
			-- { category = "whichSignIsMissing", chooseRandom = { "range", 4, 7 }, }, -- chooses random 1, 3, or 4
			-- { category = "whichSignIsMissing", chooseRandom = { "range", 5, 8 }, }, -- chooses random 1, 3, or 4
			
			-- { category = "whichSignIsMissing", chooseRandom = { "range", 5, 10 }, }, -- chooses random 1, 3, or 4
			
			-- { category = "whichSignIsMissing", chooseRandom = { "range", 7, 9 }, }, -- chooses random 1, 3, or 4
			-- { category = "whichSignIsMissing", chooseRandom = { "range", 6, 10 }, }, -- chooses random 1, 3, or 4
			
			-- { category = "whichSignIsMissing", chooseRandom = { "range", 8, 10 }, }, -- chooses random 1, 3, or 4
			-- },	
			
		-- },
		
		
	
	-- random18 = { image = "day16Screen", text = "Mondo Math Mix!",
			-- character = 4, category = "sequence", chooseRandom = { "range", 1, 10 }, -- main category and chooseRandom
			
			-- voID = 20, -- index of intro table in main.lua
			-- line1 = "This one will really\ntest your skill.",
			-- line3 = "Good luck!",
			-- scale = "", spacing = "", offsetX = "", showTime = 2100,
			
			-- waypointSkip = { 2, 1, 2, 1, 2, 1 },
			-- games = {
							 
				-- { category = "", chooseRandom = { "range", 1, 3 }, },
				-- { category = "", chooseRandom = { "range", 2, 4 }, },
				
				-- { category = "", chooseRandom = { "range", 3, 5 }, },
				-- { category = "", chooseRandom = { "range", 4, 6 }, },
				
				-- { category = "", chooseRandom = { "range", 5, 7 }, },
				-- { category = "", chooseRandom = { "range", 6, 8 }, },
				
				-- { category = "", chooseRandom = { "range", 7, 9 }, },
				-- { category = "", chooseRandom = { "range", 8, 10}, },
				
				-- { category = "", chooseRandom = { "range", 9, 11}, },
				-- { category = "", chooseRandom = { "range", 6, 12}, },
				
				-- { category = "", chooseRandom = { "range", 10, 13}, },
				-- { category = "", chooseRandom = { "range", 11, 14}, },
				
				-- { category = "", chooseRandom = { "range", 12, 15}, },
				-- { category = "", chooseRandom = { "range", 13, 15}, },
			-- },
	
	-- },
	
	
	
	--start random levels
	
}
return randomLevelDetails