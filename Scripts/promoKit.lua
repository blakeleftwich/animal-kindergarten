
local fileSynchIndex = 1
local candidateSettings = {}
local promoKey = ""
local printOut = false
local promoKitInitializing = true
local promoKitInitialized = false
local testMode = false;

promoKit = {}

local function printLocal(logInformation)
    if printOut then
        print(logInformation)
    end 
end

local function getNum(item)
    return #item
end

local function doesFileExist( filename )
    local results = false
    local filePath = system.pathForFile( filename, system.DocumentsDirectory )

    -- filePath will be 'nil' if file doesn't exist and the path is 'system.ResourceDirectory'
    if ( filePath ) then
        filePath = io.open( filePath, "r" )
    end

    if ( filePath ) then
        printLocal( "File found: " .. filename )
        -- Clean up file handles
        filePath:close()
        results = true
    else
        printLocal( "File does not exist: " .. filename )
        results = false
    end

    return results
end


--////////////////////////////////////////////////////////////////////////
--BEGIN APP SETTINGS - Set from promokit Default
--////////////////////////////////////////////////////////////////////////

local function updateTimeout()
	--cancel update if taking too long
	if promoKitInitializing == false then 
		return 
	end
	printLocal("Update timeout - cancelling synch")
	promoKitcompleteFileSynch(false)
end


 local function primeTestGroups()
    --assign app to a test group
    local key
    local value
    local testGroups = candidateSettings[version.appStore].testGroups
    
    for key,value in pairs(testGroups) do --actualcode
        if testGroups[key] == -1 then
            testGroups[key] = math.random()
        end
            
    end
end


local function savePromoKitSettings(savedData)
    local path = system.pathForFile( "promokitSettings.txt", system.DocumentsDirectory )                
    local fileRef = io.open( path, "w+" )
    fileRef:write( jsonParser.encode(savedData))
    io.close( fileRef )
end

local function loadPromoKitSettings()
    local path = system.pathForFile( "promokitSettings.txt", system.DocumentsDirectory )                
    local fileRef = io.open( path, "r" )
    local settingsImport
	if useSaveFiles == false then
		local path2 = system.pathForFile( "promokitDefaults.txt", system.ResourceDirectory )                
        local file2 = io.open( path2, "r" )
        if file2 then 
            settingsImport = file2:read( "*a") 
            io.close( file2)
            candidateSettings = jsonParser.decode(settingsImport) 
            primeTestGroups()            
            promoKit.settings = candidateSettings[version.appStore]                       
        end	
    elseif fileRef then  -- existing file
            settingsImport = fileRef:read( "*a")   
            io.close( fileRef )
            local tempSettings = jsonParser.decode(settingsImport)
            promoKit.settings = tempSettings[version.appStore]
    else --no file use defaults
        local path2 = system.pathForFile( "promokitDefaults.txt", system.ResourceDirectory )                
        local file2 = io.open( path2, "r" )
        if file2 then 
            settingsImport = file2:read( "*a") 
            io.close( file2)
            candidateSettings = jsonParser.decode(settingsImport) 
            primeTestGroups()
            savePromoKitSettings(candidateSettings)
            promoKit.settings = candidateSettings[version.appStore]                       
        end		
    end		
end

function promoKitcompleteFileSynch(wasSuccessful)
    --prevent running more than once
    if promoKitInitializing == false then 
    	return
    end
    promoKitInitializing = false
    
    --did we succeed in updating?
    if wasSuccessful then            
        --save file and return for use
        primeTestGroups()
        savePromoKitSettings(candidateSettings)
        promoKit.settings = candidateSettings[version.appStore]
    else
        candidateSettings = {}
        loadPromoKitSettings()
    end
    
    local promoTime = os.time() - promoKit.startTime
    printLocal("promoKit time:"..promoTime)
    
    if promoTime > promoKit.minTime then
        promoKit.initializeCallback()
    else
        local function makeCallback()
            promoKit.initializeCallback()
        end
        local timeRemaining = promoKit.minTime - promoTime
        timer.performWithDelay (timeRemaining, makeCallback) 
    end 
end

local function networkFileListener( event )        
	--needs to be udated to be more flexible, save to app directory
        if ( event.isError ) then
                print ( "Network error - download failed" )
                promoKitcompleteFileSynch(false)
        elseif ( event.phase == "ended" ) then
           -- local response = " "..event.response
            
            printLocal("networkFileListener: event phase ended")
            if event.status ~= 200 then
                 printLocal("networkFileListener: transfer status issue:"..event.status.." - download failed")
                 event = nil --clear out
                 promoKitcompleteFileSynch(false)
         --   elseif string.find(response,"Page Not Found") > 1 then
          --       printLocal("networkFileListener: file not found - download failed")
          --       promoKitcompleteFileSynch(false)
            else
                printLocal("networkFileListener: downloaded file - go to next")
                event = nil --clear out
                --check if file was downloaded - sometimes get event early
                if doesFileExist(candidateSettings[version.appStore].files[fileSynchIndex].fileName) then
                    --completed download so go to next file
                    fileSynchIndex = fileSynchIndex + 1
                    timer.performWithDelay(1,synchFiles)
               -- else
                 --   printLocal("networkFileListener: " .. candidateSettings[version.appStore].files[fileSynchIndex].fileName .. " - download failed")
                 --   promoKitcompleteFileSynch(false)
                end
            end
        end
        
       -- print ( "RESPONSE: " .. event.response )
end

function synchFiles()
	if promoKitInitializing == false then return end

    local suffix = display.imageSuffix
    local versionCandidateSettings = candidateSettings[version.appStore]
    local files = versionCandidateSettings.files
    local download = true
    
	if suffix == nil then suffix = "" end
	
    printLocal("synchFiles candidate ratethis:"..versionCandidateSettings.links.rateThisAppURL)   
    printLocal("synchFiles: "..fileSynchIndex)
    
    local numFiles = getNum(files)
    printLocal("synchFiles: numFiles"..numFiles)
    --if there are more files to get, request them
    if(fileSynchIndex < numFiles + 1) then
        printLocal("synchFiles: checking "..fileSynchIndex.." "..files[fileSynchIndex].fileName)
        if doesFileExist(files[fileSynchIndex].fileName) then
            printLocal("synchFiles: "..files[fileSynchIndex].fileName .." already downloaded")
            fileSynchIndex = fileSynchIndex + 1
            synchFiles()
        else
            if files[fileSynchIndex].type == "image" then
                if files[fileSynchIndex].suffix ~= suffix then
                    printLocal("synchFiles: "..files[fileSynchIndex].fileName .." wrong suffix("..files[fileSynchIndex].suffix..") wanted "..suffix)
                    download = false
                end
            end
            
            if download then 
                printLocal("synchFiles: downloading "..files[fileSynchIndex].fileName)
                local fileName = files[fileSynchIndex].fileName
                local fileURL = "https://eggrollgames.com/pk/files/"..fileName
                network.download( fileURL, "GET", networkFileListener, fileName, system.DocumentsDirectory )
            else
                 printLocal("synchFiles: skipping "..files[fileSynchIndex].fileName)
                fileSynchIndex = fileSynchIndex + 1
                synchFiles()
            end 
        end
    else --otherwise we are done
        printLocal("synchFiles: all done!")
        promoKitcompleteFileSynch(true)
    end    
end


local function networkSettingsListener( event )
        if ( event.isError ) then
                printLocal( "networkSettingsListener: Network error!")
                promoKitcompleteFileSynch(false)
        elseif ( event.phase == "ended" ) then
                --print ( "RESPONSE: " .. event.response )
                printLocal("networkSettingsListener: settings downloaded")
                fileSynchIndex = 1
                candidateSettings = jsonParser.decode(event.response)
                if candidateSettings then --if successfully decoded - proceed
                    printLocal("networkSettingsListener: settings parsed - starting synch")
                    synchFiles()
                else -- go back to current file
                    printLocal("networkSettingsListener: settings parse failed")
                    promoKitcompleteFileSynch(false)
                end
        end
end


local function updatePromoKitSettings() 
    local settingsURL = "https://eggrollgames.com/pk/settings/"..promoKey..".js" --normally use .js
    if (testMode) then
        settingsURL = "https://eggrollgames.com/pk/settings-test/"..promoKey..".js"
    end
    printLocal("updatePromoKitSettings: ".. settingsURL)
	network.request( settingsURL, "GET", networkSettingsListener)	
end



--[[]
-check if have network connection
- yes
        - show loading indicator
        - pull js file
                succeed:
                        - check if have referenced files
                                no:
                                        - show loading indicator
                                        - download missing ones
                                        succeed
                                                - update saved promosettings
                                                - continue with new file
                                        fail
                                                - continue with old file
                                yes
                                        - update saved promosettings
                                        - continue with new file
                fail
                        - continue with old file
- no
        - continue with old file			
--]]

--**************************************************
--*  PUBLIC FUNCTIONS
--**************************************************

function promoKit:init(key,callback,minTime)
    
	if useSaveFiles == false then
		candidateSettings = {}
        loadPromoKitSettings()
		promoKit.initializeCallback = callback
		
		promoKit.initializeCallback()
		
		return 
	end
	
	
	if (promoKitInitialized) then 
		return
	end
	promoKitInitialized = true
	
    if system.getInfo( "environment" ) == "simulator" then printOut = true end
    
    printLocal("promkit:init key="..key)
    
    if minTime == nil then minTime = 0 end
    promoKit.initializeCallback = callback
    promoKit.minTime = minTime
    promoKit.startTime = os.time()
    if key == "" then
        
        local alert = native.showAlert( "WARNING", "No Key Set for PromoKit!", { "OK" } )
        promoKitcompleteFileSynch(false)
    else
        promoKey = key
        
        if key == "none" then 
            promoKitcompleteFileSynch(false)
        else
            updatePromoKitSettings()
        end
        
    end
    timer.performWithDelay (10000, updateTimeout) 

end

function promoKit:getImage(fileName,path,width,height)   
    local newImage
    
    if path == "<promokit>" then        
       -- return system.DocumentsDirectory 
        newImage =  display.newImageRect(fileName,system.DocumentsDirectory,width,height)
    else
        local filePath = path..fileName
        newImage = display.newImageRect(filePath,width,height)
    end
    
    if newImage == nil then --if failed send back display group so that app wont error
        newImage = display.newGroup()        
    end    
    
    return newImage    
end


function promoKit:selectWeightedOption(options)
    local total = 0
    local i
    
    --if only one return it
    if #options == 1 then 
        return options[1]        
    end
        
    --total weightings
    for i = 1,#options do
        if options[i].weighting == nil or options[i].weighting <= 0 then --if invalid number set a valid weighting
            options[i].weighting = 1/(#options)
        end
        total = total + options[i].weighting        
    end
    
    if total <= 0 then
        --if invalid total rebalance
        for i = 1,#options do
            options[i].weighting = 1/(#options)        
        end
    elseif total ~= 1 then
        --if weightings not 1 - rebalance
        for i = 1,#options do
            options[i].weighting = options[i].weighting/total        
        end
    end
    
   
    
    --choose a random number 
    math.randomseed( os.time() )
    local randNum = math.random()
    printLocal("randNum:"..randNum)
    local total = 0
    for i = 1,#options do
        total = total + options[i].weighting
        if total > randNum then
            return options[i]
        end
    end
    --if didn't find return the last one
    return options[#options]
end

function promoKit:SetTestMode(isTesting)
    testMode = isTesting
end


return promoKit

--[[
    --to do
        ** add timeout
        - add status indicator (nope)
        ** integrate 
            ** with promo display in menu
            ** change from old settings to promokit settings
            - with iapPromo
            - with iapPopUp?
        ** add way to randomly assign users to separate test groups long term for rateuspopup
            ** store in settings
        - add iap option to promokit
        - add tracking to prevent checking too often
    --to test
        - test on device with large file
        ** test on device with many files
        ** test with many files        
        - test on cellular network
        ** test with no files to download
        ** test on device with network turned off
        ** test weighted selector
        ** test with malformatted JSON downloaded - should be rejected
        ** test with missing settings file
        ** test with missing images file
        ** test only download images if needed for that suffix
        ** test suffix support in documents directory
        ** test blank promokitid only loads local file and warns 
        ** test none promokitid only loads local file
        ** verify promokitSettings.txt loaded if saved
        ** test cloudflare caching - 4 hours
        ** test promo
    later
        - intergrate and test mainmenuiap
        - integrate and test regular iap
    --questions        
        - do we want to not check if it hasn't been long since last downloaded?
        
        
**********
Notes
***************
Cloudflare cache supported  file types
https://support.cloudflare.com/hc/en-us/articles/200172516-Which-file-extensions-does-CloudFlare-cache-for-static-content
    
Default cache refresh is 4 hours

Here is how to check cache info:
https://support.cloudflare.com/hc/en-us/articles/200169556-How-can-I-tell-if-CloudFlare-is-caching-my-site-or-a-specific-file-
        
        
        
        
--]]