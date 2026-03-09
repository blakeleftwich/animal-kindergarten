saveData = {}
--////////////////////////////////////////////////////////////////////////
--BEGIN APP SETTINGS - Set from parents
--////////////////////////////////////////////////////////////////////////

function load()
    
	local settingsImport
	if useSaveFiles == false then 
		settingsImport = iCloud.get( "savedData" )
	else
		local path = system.pathForFile( "savedData.txt", system.DocumentsDirectory )                
		local fileRef = io.open( path, "r" )
		-- local settingsImport
		if fileRef then  -- existing file
			settingsImport = fileRef:read( "*a")   
			io.close( fileRef )	
		end
	end
	if (settingsImport == nil) then
		local path2 = system.pathForFile( "parentsDefaults.txt", system.ResourceDirectory )                
		local file2 = io.open( path2, "r" )
		if file2 then 
			settingsImport = file2:read( "*a") 
			io.close( file2)		
		end	
	end
	print("loadParentSettings: "..settingsImport)
	savedData = jsonParser.decode(settingsImport)	
	
	
	
	
	
	if useSaveFiles == false then 
		levelData = iCloud.get( "levelData" )
		if (levelData) then
			levels = jsonParser.decode(levelData)	
		end
	else
		local filePath = system.pathForFile( "levelData.txt", system.DocumentsDirectory )
		local levelsFile = io.open( filePath, "r" )
		
		if (levelsFile) then
			-- levels = {}
		
			-- local a = 1
			-- for line in io.lines(filePath) do
				-- levels[a] = line
				-- a = a + 1
			-- end
			
			local newLevels = levelsFile:read( "*a") 
			io.close( levelsFile)	
			
			levels = jsonParser.decode(newLevels)	
		end
	end
	
	if (levels == nil) then
	
		levels = {}
	
		for i = 1,  100 do
			levels[i] = "not completed"
		end
		for i = 101, 200 do
			levels[i] = "locked"
		end
		
		if useSaveFiles == false then 
			levelData = jsonParser.encode(levels)
			iCloud.set( "levelData", levelData )
		else
			local filePath = system.pathForFile( "levelData.txt", system.DocumentsDirectory )
			--local levelsFile = io.open( filePath, "r" )
			-- file = io.open( filePath, "w" )
			-- for i = 1, 200 do
				-- file:write( levels[i], "\n" )
			-- end
			-- io.close( file )
			
			local fileRef2 = io.open( filePath, "w+" )
			fileRef2:write( jsonParser.encode(levels))
			io.close( fileRef2 )
		end
	
	end
	
	if (levels[300] == nil) then
		levels[300] = {}
		levels[300].repeatedLevels = {}
	end
	
	
	
	
	
	
	
	if useSaveFiles == false then 
		iapData = iCloud.get( "iapData" )
		if (iapData) then
			iapPurchased = jsonParser.decode(iapData)	
		end
	else
		local iapPath = system.pathForFile( "iapData.txt", system.DocumentsDirectory )
		local iapFile = io.open( iapPath, "r" )
	
		if (iapFile) then
			
			iapPurchased = {}
			
			local a = 1
			local iapUnlocked = 0
			for line in io.lines(iapPath) do
				iapPurchased[a] = line
				a = a + 1
				if (line == true) then
					iapUnlocked = iapUnlocked + 1
				end
			end
		
			
			if (iapUnlocked == 5) then
				variation = 5
				iap_savePurchase()
			end
			
		end
		
	end
	
	
	if (iapPurchased == nil) then
	
		iapPurchased = {}
		
		for i = 1, 5 do
			iapPurchased[i] = "false"
		end
		
		if useSaveFiles == false then 
			iapData = jsonParser.encode(iapPurchased)
			iCloud.set( "iapData", iapData )
		else
			local iapPath = system.pathForFile( "iapData.txt", system.DocumentsDirectory )
			local iapFile = io.open( iapPath, "r" )
			local fileRef = io.open( iapPath, "w" )
			for i = 1, 5 do
				fileRef:write( iapPurchased[i], "\n" )
			end
			io.close( fileRef )
		end
	
	end
	
	
	
	
	if (version.defaultVersion == 5) then
		variation = 5
		iap_savePurchase()
	end
	
	
end


function save()

	if useSaveFiles == false then 
		settingsImport = jsonParser.encode(savedData)
		iCloud.set( "savedData", settingsImport )
	else
		local path = system.pathForFile( "savedData.txt", system.DocumentsDirectory )                
		local fileRef = io.open( path, "w+" )
		fileRef:write( jsonParser.encode(savedData))
		io.close( fileRef )
	end
	
end


function saveLevelData()
	--levels[level+100] = "not locked"
	-- levels[level] = "completed"
	
	
	-- textIndex+1 > totalLevels
			 
			 -- levels[300].repeatedLevels[textIndex+1].completed
			 -- levels[300].repeatedLevels[1+textIndex].locked
	
	
	if (variation == 4 and unlockedEverything == false and charWakeUp == false) then
		for i = 1, #unlockedLevels do
			if (menuGroup[itemIndex+2] and unlockedLevels[i] == menuGroup[itemIndex+2].levelID) then
				levels[menuGroup[itemIndex+2].levelID+100] = "not locked"
			end
		end
		levels[menuGroup[itemIndex+1].levelID] = "completed"
	elseif (variation == 5 and unlockedEverything == true and charWakeUp == false) then
		-- if (itemIndex+1 > totalLevels) then
			-- levels[300].repeatedLevels[itemIndex+1-subFromRepeatLevels].completed = "completed"
			-- levels[300].repeatedLevels[2+itemIndex-subFromRepeatLevels].locked = "not locked"
		-- else
			-- levels[level+1+100] = "not locked"
			-- levels[level] = "completed"
		-- end
		
		if (itemIndex+1 > totalLevels - repeatedLevelsNum) then
			levels[300].repeatedLevels[itemIndex+1-subFromRepeatLevels].completed = "completed"
			
		else
			levels[level] = "completed"
		end
		
		if (itemIndex+1 >= totalLevels - repeatedLevelsNum) then
			levels[300].repeatedLevels[2+itemIndex-subFromRepeatLevels].locked = "not locked"
		else
			levels[level+1+100] = "not locked"
		end
		
	end
	
	if (charWakeUp == true) then
		charWakeUp = false
	end
	
	
	if useSaveFiles == false then 
		levelData = jsonParser.encode(levels)
		iCloud.set( "levelData", levelData )
	else
		 local saveFilePath = system.pathForFile( "levelData.txt", system.DocumentsDirectory )
		 -- local fileRef = io.open( saveFilePath, "w" )
		 -- for i = 1, 200 do
			 -- fileRef:write( levels[i], "\n" )
		 -- end
		 -- io.close( fileRef )
		 
		local fileRef2 = io.open( saveFilePath, "w+" )
		fileRef2:write( jsonParser.encode(levels))
		io.close( fileRef2 )
	end
	 
end

function saveIAPData()

	if useSaveFiles == false then 
		iapData = jsonParser.encode(iapPurchased)
		iCloud.set( "iapData", iapData )
	else

        local iapPath = system.pathForFile( "iapData.txt", system.DocumentsDirectory )
		local fileRef = io.open( iapPath, "w" )
		for i = 1, 5 do
			fileRef:write( iapPurchased[i], "\n" )
		end
		io.close( fileRef )
	
	end
	
end

function loadReceipt()

	local settingsImport
	if useSaveFiles == false then 
		settingsImport = iCloud.get( "savedReceipt" )
		if (settingsImport) then
			receiptJSON = jsonParser.decode(settingsImport)	
		end
	else
		local pathReceipt = system.pathForFile( "savedReceipt.txt", system.DocumentsDirectory )                
		local fileReceipt = io.open( pathReceipt, "rb" )
		local settingsReceipt
		if fileReceipt then  -- existing file
			receiptJSON = fileReceipt:read( "*a")   
			io.close( fileReceipt )	
			
			
			-- receiptJSON = jsonParser.decode(settingsReceipt)	
		else
		end
	end

	

end

function saveReceipt()

	if (receiptJSON) then
	
		if useSaveFiles == false then 
			settingsImport = jsonParser.encode(receiptJSON)
			iCloud.set( "savedReceipt", settingsImport )
		else
			local pathReceipt = system.pathForFile( "savedReceipt.txt", system.DocumentsDirectory )                
			local fileReceipt = io.open( pathReceipt, "w+b" )
			fileReceipt:write( receiptJSON )
			-- file:write( jsonParser.encode(receiptJSON))
			io.close( fileReceipt )
		end
	
		
	end

end


--////////////////////////////////////////////////////////////////////////
--END APP SETTINGS
--////////////////////////////////////////////////////////////////////////



return saveData

