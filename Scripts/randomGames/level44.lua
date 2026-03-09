--Pete the Frog:
return {
	{
			gameType = "matching",
			question = { line1 = "Touch a color, then another", line2 = "card with the same color.", scale = .8, offsetY = -67 },
			cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 1, endRange = 8, category = "colorToColor" },
			matching = { mode = "memory", layout = 5, numRandom = true }  
	},
	{
			gameType = "matching",
			nextWaypoint = false,
			question = { line1 = "Touch an item, then another", line2 = "item with the same shape.", scale = .8, offsetY = -67 },
			cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 1, endRange = 8, category = "shapeToShape" },
			matching = { mode = "memory", layout = 9, numRandom = true }  		
	},
	{
			gameType = "matching",
			question = { line1 = "Touch a number, then a card", line2 = "with the same number of items.", scale = .8, offsetY = -67 },
			cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 1, endRange = 10, category = "numbersToGroups" },
			matching = { mode = "memory", layout = 5, numRandom = true }
	},
	
	{
			gameType = "matching",
			question = { line1 = "Touch a color, then another", line2 = "card with the same color.", scale = .8, offsetY = -67 },
			cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 1, endRange = 8, category = "colorToColorItem" },
			matching = { mode = "memory", layout = 9, numRandom = true }  
	},
	{
			gameType = "matching",
			question = { line1 = "Touch an item, then another", line2 = "item with the same shape.", scale = .8, offsetY = -67 },
			cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 1, endRange = 8, category = "shapeToShapeItem" },
			matching = { mode = "memory", layout = 5, numRandom = true }  		
	},
	{
			gameType = "matching",
			nextWaypoint = false,
			question = { line1 = "Touch a number, then a card", line2 = "with the same number of items.", scale = .8, offsetY = -67 },
			cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 4, endRange = 10, category = "numbersToGroups" },
			matching = { mode = "memory", layout = 9, numRandom = true }
	},
	
	{
			gameType = "matching",
			question = { line1 = "Touch a color, then another", line2 = "card with the same color.", scale = .8, offsetY = -67 },
			cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 4, endRange = 8, category = "colorItemToColorItem" },
			matching = { mode = "memory", layout = 5, numRandom = true }  
	},
	{
			gameType = "matching",
			nextWaypoint = false,
			question = { line1 = "Touch an item, then another", line2 = "item with the same shape.", scale = .8, offsetY = -67 },
			cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 4, endRange = 8, category = "shapeItemToShapeItem" },
			matching = { mode = "memory", layout = 9, numRandom = true }  		
	},
	{
			gameType = "matching",
			question = { line1 = "Touch a number, then a card", line2 = "with the same number of items.", scale = .8, offsetY = -67 },
			cards = { scale = 1, offsetX = 0, offsetY = -25, startRange = 4, endRange = 10, category = "groupsToGroups" },
			matching = { mode = "memory", layout = 5, numRandom = true }
	},
	
	
}
