--************IAP Functions
local myData = require("Scripts.myData")
function buyIAP(thisIAP)

	buttonsActive = false
	iapUnlocked = false

    local purchaseID
    local environment = system.getInfo( "environment" )
    -- if buttonsActive then
        -- if iap_MenuOpen then
            buttonsActive = false
			if (currentState == "IAPMenu") then
				closeIAPMenu()
			elseif (currentState == "UpfrontMenu") then
				closeUpfront()
			end
            fadeInMessage("just a sec...", false)
			
			
			-- if (thisIAP == "unlockeverything" and showingSaleIAP == true) then
				-- thisIAP = "unlockeverythinglimitedtime"
			-- end
			
            print("Here we show the device purchase menu for "..thisIAP)
            if thisIAP == "restore" then
                    storePurchaseID = ""
			else
					storePurchaseID = thisIAP
            end
			
			local function delayScreen()
			
				if storePurchaseID ~= "" then 
				
					if (version.appStore == "Amazon" or version.appStore == "Google Play") then
						tryRestore = true
					end
				
					storePurchaseID = version.bundleID .. "." .. storePurchaseID
					if (version.appStore == "Amazon" or version.appStore == "Google Play" or version.appStore == "Chrome") then
							-- print( "store.purchase called" )
							-- print("Loaded Product:  " .. productIdentifiers[1])
							-- print("Store purchase ID:  " .. storePurchaseID)
							-- if (productIdentifiers[1] == storePurchaseID) then
								-- print("Product and Store ID Matched")
							-- end
							if (testText1) then
								testText1.text = storePurchaseID
							end
							
							store.purchase(storePurchaseID)
					else
						store.purchase({storePurchaseID})
					end
					if environment == "simulator" then
						timer.performWithDelay(3000,iap_testPurchase)
					end
				elseif thisIAP == "restore" then
					storePurchaseID = ""
					store.restore();
					if environment == "simulator" then
						timer.performWithDelay(3000,iap_testRestore)
					end
				else
						storePurchaseID = ""
						timer.performWithDelay(300,iap_completed)
				end 
				--version = 5--version + 1
				if (version.appStore == "Amazon") then
					if (appStart == true) then
						iapTimeOut = timer.performWithDelay(5000,iapTimedOut) --time out if nothing happens
					else
						iapTimeOut = timer.performWithDelay(20000,iapTimedOut) --time out if nothing happens
					end
				else
					iapTimeOut = timer.performWithDelay(30000,iapTimedOut) --time out if nothing happens
				end
				--if they successfully buy that IAP we need to do this:
				--version = 2 --change to whatever version they now have
				--then:
			
			
			end
			
			if version.appStore=="Google Play" or version.appStore=="Amazon" or version.appStore=="Samsung" or version.appStore == "Chrome" then
				timer.performWithDelay(100, delayScreen)
			else
				timer.performWithDelay(0, delayScreen)
			end

            --fadeOutMessage()
       -- end
   -- end
   return true
	
end

function iap_testPurchase()
    iap_storeTransaction({transaction = {state="purchased",productIdentifier=storePurchaseID}, })
end

function iap_testRestore()
    
	storePurchaseID=version.bundleID .. ".unlockeverything"
    iap_storeTransaction({transaction = {state="purchased",productIdentifier=storePurchaseID}, })
    if iapTestRestoreStep < 2 then 
        iapTestRestoreStep = iapTestRestoreStep + 1
        timer.performWithDelay(1000,iap_testRestore)
    end
end

function closeIAPMenu()
        iap_MenuOpen = false
		
		if (myData.isTV) then  
			transition.to( iapCursor, { time=400, alpha=0, transition=easing.outExpo } )
			transition.to( iapRestore, { time=400, alpha=0, transition=easing.outExpo } )
			Runtime:removeEventListener( "onFTVKey", trackIAPCursor )
			Runtime:removeEventListener( "axis", iapTrackCursorAxis )
			Runtime:removeEventListener( "key", trackIAPCursor )
		end
		currentState = "select"
		
		
		
	transition.to( topIAPText, { time=400, alpha=0, transition=easing.outExpo } )
	transition.to( midIAPText, { time=400, alpha=0, transition=easing.outExpo } )
	transition.to( bottomIAPText, { time=400, alpha=0, transition=easing.outExpo } )
	
	 transition.to( iapGroup, { time=400, alpha=0, transition=easing.outExpo } )
	 transition.to( iapScrollGroup, { time=400, alpha=0, transition=easing.outExpo } )
	Runtime:removeEventListener( "enterFrame", iapScrollAnim)
	
end

function updatePriceString()
	--grab appropriate price string from this store
	-- topIAPText:toFront()
	
	if (forParentsButton.alpha == 0) then
		topIAPText.text = "UNLOCK ALL!"
	else
		topIAPText.text = "MORE FUN!"
	end
	
	
	topIAPText.anchorX = 0.5
	topIAPText.anchorY = 0.5
	topIAPText.x = halfW - 11
	
	
	-- if (system.getInfo( "platformName" ) == "Android") then
		-- topIAPText.text = "$2.99"
		-- midIAPText.text = "$2.99"
	-- else
		-- topIAPText.text = iap_getProductPrice(version.unlockItems.All) --"$3.99"
		midIAPText.text = iap_getProductPrice(version.unlockItems.All) --"$3.99"
	-- end
	-- topIAPText:setReferencePoint(display.CenterReferencePoint)
	-- topIAPText.anchorX = 0.5
	-- topIAPText.anchorY = 0.5
	-- topIAPText.x = halfW - 11
	
	
	midIAPText.anchorX = 0.5
	midIAPText.anchorY = 0.5
	midIAPText.x = halfW - 11
	
	
	bottomIAPText:toFront()
	if (forParentsButton == nil or forParentsButton.alpha == 0) then
	
		-- if (system.getInfo( "platformName" ) == "Android") then
			
			-- bottomIAPText.text = "or just " .. characterSelected .. " for " .. "$0.99"
		-- else
			bottomIAPText.text = "or just " .. characterSelected .. " for " .. iap_getProductPrice(version.unlockItems[characterSelected])
		-- end
	else
		bottomIAPText.text = "Unlock ALL games!"
	end
	
	
	-- bottomIAPText:setReferencePoint(display.CenterReferencePoint)
	bottomIAPText.anchorX = 0.5
	bottomIAPText.anchorY = 0.5
	bottomIAPText.x = halfW - 11
        --topIAPText.anchorX=1
        --topIAPText.anchorY=0.5
	-- midIAPText.text = iap_getProductPrice(version.unlockItems.mid) --"$2.99"
	-- midIAPText:setReferencePoint(display.CenterRightReferencePoint)
        --midIAPText.anchorX=1
        --midIAPText.anchorY=0.5
        -- midIAPText.y = 214
	-- bottomIAPText.text = iap_getProductPrice(version.unlockItems.bottom)--"$1.99"
	-- bottomIAPText:setReferencePoint(display.CenterRightReferencePoint)
        --bottomIAPText.anchorX=1
       -- bottomIAPText.anchorY=0.5
        -- bottomIAPText.y = 291
	--bottomIAPText.x = -400
	--bottomIAPText.y = display.contentHeight/1.8275
       -- print("textYs: "..topIAPText.y.." "..midIAPText.y.." "..bottomIAPText.y)
end




function iapControllerDirectionPressed(keyName)

	if (keyName and keyName == "up") then
	
		if (currentCursorSelect == "iapUnlockAll") then
			currentCursorSelect = "restore"
			iapCursor.x = iapRestoreX
			iapCursor.y = iapRestoreY
		elseif (currentCursorSelect == "restore") then
			currentCursorSelect = "iapUnlockCharacter"
			iapCursor.x = iapUnlockCharX
			iapCursor.y = iapUnlockCharY
		else
			currentCursorSelect = "iapUnlockAll"
			iapCursor.x = iapUnlockAllX
			iapCursor.y = iapUnlockAllY
		end
		
	elseif (keyName and keyName == "down") then
	
		if (currentCursorSelect == "iapUnlockCharacter") then
			currentCursorSelect = "restore"
			iapCursor.x = iapRestoreX
			iapCursor.y = iapRestoreY
		elseif (currentCursorSelect == "iapUnlockAll") then
			currentCursorSelect = "iapUnlockCharacter"
			iapCursor.x = iapUnlockCharX
			iapCursor.y = iapUnlockCharY
		else
			currentCursorSelect = "iapUnlockAll"
			iapCursor.x = iapUnlockAllX
			iapCursor.y = iapUnlockAllY
		end
	
	end
	
	
	playReservedChannel(shakeSound, currentCursorChannel, 0)
	currentCursorChannel = currentCursorChannel + 1
	if (currentCursorChannel > 27) then
		currentCursorChannel = 26
	end		
	
end

function trackIAPCursor( event )
        
       -- local alert = native.showAlert( "buttonAlert2", "2 - phase:"..event.phase.. " key:"..event.keyName )
	if (event.phase == "began" and buttonsActive == true and event.keyName ~= "menu" and currentState == "IAPMenu") then
	
		if (event.keyName and event.keyName == "up") then
		
			iapControllerDirectionPressed("up")
			
		elseif (event.keyName and event.keyName == "down") then
			
			iapControllerDirectionPressed("down")
			
		end
		
	end
			
end

function iapTrackCursorAxis( event )

	if (buttonsActive == true and currentState == "IAPMenu") then

		if event.normalizedValue > 0 then
			axisName = event.axis.type .. "+"
		else
			axisName = event.axis.type .. "-"
		end
		
		
		if math.abs(event.normalizedValue) >= controllerSensitivity then
			if (axisName == "leftY-" or axisName == "y-") then
				iapControllerDirectionPressed("up")
				Runtime:removeEventListener( "axis", iapTrackCursorAxis )
				timer.performWithDelay( controllerAxisDelay, function()
					Runtime:addEventListener( "axis", iapTrackCursorAxis )
				end )
			elseif (axisName == "leftY+" or axisName == "y+") then
				iapControllerDirectionPressed("down")
				Runtime:removeEventListener( "axis", iapTrackCursorAxis )
				timer.performWithDelay( controllerAxisDelay, function()
					Runtime:addEventListener( "axis", iapTrackCursorAxis )
				end )
			end
		end

	end

end



function openIAPMenu()
        print("openIAPMenu")
		
		
		updatePriceString()
		
		
		currentState = "IAPMenu"
		
		if (myData.isTV) then 
			currentCursorSelect = "iapUnlockAll"
			
			iapCursor.x = iapUnlockAllX
			iapCursor.y = iapUnlockAllY
				
			if (myData.isController) then
				Runtime:addEventListener( "key", trackIAPCursor )
				Runtime:addEventListener( "axis", iapTrackCursorAxis )
			elseif (myData.isFireTV) then
				Runtime:addEventListener( "onFTVKey", trackIAPCursor )
			end
			
			iapCursor:toFront()
			transition.to( iapRestore, { time=700, alpha=1, transition=easing.outExpo } )
			transition.to( iapCursor, { time=700, alpha=1, transition=easing.outExpo } )
		
			timer.performWithDelay( 1150, makeButtonsActive )
		
		else
		
			timer.performWithDelay( 1100, makeButtonsActive )
		
		end
		
		
		
	transition.to( iapGroup, { time=1100, alpha=1, transition=easing.outExpo } )
	transition.to( iapScrollGroup, { time=1100, alpha=1, transition=easing.outExpo } )
	Runtime:addEventListener( "enterFrame", iapScrollAnim)
	
		transition.to( topIAPText, { time=650, alpha=1, transition=easing.outExpo } )
		transition.to( midIAPText, { time=650, alpha=1, transition=easing.outExpo } )
		transition.to( bottomIAPText, { time=750, alpha=1, transition=easing.outExpo } )
	
	
end

function iapScrollAnim()
	
	for i = 1, #scrollImages do
		scrollImages[i].x = scrollImages[i].x - .5
		scrollImages[i].maskX = scrollImages[i].maskX + .5
		
		if (scrollImages[i].x < (iapButton.x - (iapButton.width*0.5) - (scrollImages[i].width*0.5) ) ) then
			if (i ~= 1) then
				local oldX = scrollImages[i].x
				scrollImages[i].x = scrollImages[i-1].x + scrollImages[i].width - 1
				local newX = scrollImages[i].x
				scrollImages[i].maskX = scrollImages[i].maskX - (newX - oldX)
			else
				local oldX = scrollImages[i].x
				scrollImages[i].x = scrollImages[#scrollImages].x + scrollImages[i].width - 1
				local newX = scrollImages[i].x
				scrollImages[i].maskX = scrollImages[i].maskX - (newX - oldX)
			end
		end
	end
	
end

function loadScrollingIAP(numImages, width, height, maskImage)

	iapMask = graphics.newMask( "Images/UI/iapScreenMask.png" )

	scrollImages = {}
	scollNum = 1

	for i = 0, numImages-1 do
		scrollImages[#scrollImages+1] = display.newImageRect("Images/UI/iapScreen" .. i+1 .. ".png", width, height )
		scrollImages[#scrollImages].x = halfW
		scrollImages[#scrollImages].y = halfH - 29
		iapScrollGroup:insert( scrollImages[#scrollImages] )
		
		scrollImages[#scrollImages]:setMask( iapMask )
		scrollImages[#scrollImages].maskX = 0
		scrollImages[#scrollImages].maskY = 0
		
		if (i ~= 0) then
			scrollImages[#scrollImages].x = (halfW - 80) + (width * i) - 1
			scrollImages[#scrollImages].maskX = scrollImages[#scrollImages].maskX - (width * i) + 71.9
		else
			scrollImages[#scrollImages].x = (halfW - 80) + (width * i)
			scrollImages[#scrollImages].maskX = scrollImages[#scrollImages].maskX - (width * i) + 70.9
		end
		
	end
	
	
	
	-- iapScrollGroup:setReferencePoint( display.CenterReferencePoint )
	
	-- iapScrollGroup:setMask( iapMask )
	-- iapScrollGroup.maskX = iapScrollGroup.contentWidth*0.5
	-- iapScrollGroup.maskY = iapScrollGroup.contentHeight*0.5

end

function loadIAPMenu()
	
	iapBG = display.newImageRect("Images/UI/iapMenuBG.png", 800, 384 )
	iapBG.x = halfW
	iapBG.y = halfH
	iapBG:addEventListener("touch", buttonTouched)
	iapBG.name = "iapExit"
	iapGroup:insert( iapBG )
	
	iapButton = display.newImageRect("Images/UI/iapMenuUnlockButton.png", 227, 207 )
	iapButton.x = halfW - 9.7
	iapButton.y = halfH
	iapButton:addEventListener("touch", buttonTouched)
	iapButton.name = "iapUnlockAll"
	iapButton.id = "window"
	iapGroup:insert( iapButton )
	
	iapAlt = display.newImageRect("Images/UI/iapMenuUnlockButtonAlt.png", 228, 37 )
	iapAlt.x = halfW - 9.7
	iapAlt.y = halfH + 85.5
	iapAlt:addEventListener("touch", buttonTouched)
	iapAlt.name = "iapUnlockCharacter"
	iapGroup:insert( iapAlt )
	
	if (myData.isTV) then 
	else
		-- iapExit = display.newImageRect("Images/UI/iapMenuExitButton.png", 45, 45 )
		-- iapExit.x = halfW + 103
		-- iapExit.y = halfH - 102
		-- iapExit:addEventListener("touch", buttonTouched)
		-- iapExit.name = "iapExit"
		-- iapGroup:insert( iapExit )
		
		iapExit = display.newImageRect("Images/UI/parentalGateNumberButton.png", 36, 36 )
		iapExit.xScale, iapExit.yScale = 0.75, 0.75
		iapExit.x = halfW + 103
		iapExit.y = halfH - 102
		iapExit:setFillColor( 255/255, 0/255, 0/255 )
		iapGroup:insert( iapExit )
	
		iapExitX = display.newImageRect( "Images/UI/upfrontXButtonX.png", 20, 20 )
		iapExitX.xScale, iapExitX.yScale = 1.5, 1.5
		iapExitX.x = iapExit.x
		iapExitX.y = iapExit.y
		iapGroup:insert( iapExitX )
	end
	
	
	loadScrollingIAP( 6, 143, 81, "Images/UI/iapScreenMask.png" )
	
	
	
	iapRestore = display.newImageRect("Images/UI/restoreButtonFireTV.png", 59, 16)
	iapRestore.x = halfW - 10
	iapRestore.y = halfH + 118
	iapRestore.alpha = 0
	iapGroup:insert( iapRestore )
	
	iapGroup:insert( topIAPText )
	iapGroup:insert( midIAPText )
	iapGroup:insert( bottomIAPText )
	
	iapCursor = display.newImageRect("Images/UI/cursorHand.png", 59, 59)
	iapCursor.x = 0
	iapCursor.y = 0
	iapCursor.alpha = 0
	iapGroup:insert( iapCursor )
	
	--if (system.getInfo ( "model" ) == "AFTB") then
	if (myData.isTV) then 
		iapUnlockAllX = halfW + 90
		iapUnlockAllY = halfH + 66
		
		iapUnlockCharX = halfW + 80
		iapUnlockCharY = halfH + 115
		
		iapRestoreX = iapRestore.x + 46
		iapRestoreY =iapRestore.y + 26
	else
		iapUnlockAllX = midIAPText.x + 90
		iapUnlockAllY = midIAPText.y + 22
		
		iapUnlockCharX = bottomIAPText.x + 88
		iapUnlockCharY = bottomIAPText.y + 32
		
		iapRestoreX = iapRestore.x + 46
		iapRestoreY =iapRestore.y + 26
	end
	
	
	iapGroup.alpha = 0
	iapScrollGroup.alpha = 0
	bg:toBack()
	iapScrollGroup:toFront()
	
end


function iap_storeTransaction(event)
    local environment = system.getInfo( "environment" )
	
	buttonsActive = false
	
	if (event.name == "init") then -- make sure store gets initialized
		
		print("calling init")
		if (event.transaction.isError) then
			print("is error")
			print(event.transaction.errorType)
			print(event.transaction.errorString)
		else
			if (version.appStore == "Google Play") then
				iap_GetProductPrices()
			end
		end
	
	
	else
	

			--will need to call versionSetUp() on success
		local transaction = event.transaction	
			if environment ~= "simulator" then
				store.finishTransaction( transaction )
			end
			
		if (iapTimeOut) then
			timer.cancel(iapTimeOut) --clear timeout
		 end
		  
		  if (testText2) then
			testText2.text = transaction.state
		  end
		  if (testText4 and testText5) then
			if (transaction.isError == true) then
				testText4.text = "isError is true"
				testText5.text = transaction.errorType
				testText6.text = transaction.errorString
			else
				testText4.text = "isError is false"
				testText5.text = transaction.errorType
				testText6.text = transaction.errorString
			end
		  end
		  
		  if (testText7 and transaction.originalJson) then
			-- local jsonString = jsonParser.decode(transaction.originalJson)
			testText7.text = transaction.originalJson
		  end
		  
		  if (testText8) then
			testText8.text = transaction.receipt
		  end
		  
		  
		if (version.appStore == "Chrome") then
			iap_purchaseComplete(version.bundleID .. "." .. version.unlockItems.All,false)
		elseif transaction.state == "purchased" then
			iap_purchaseComplete(transaction.productIdentifier,false)
			
			if (transaction.productIdentifier) then
				-- Flurry 2019
				-- logAnalyticEvent("Purchased " .. transaction.productIdentifier)
			end
			
			--playSound(_G.applauseSound)	
					--versionSetUp()
		elseif  transaction.state == "restored" then
			iap_purchaseComplete(transaction.productIdentifier,true)
			
			if (transaction.productIdentifier) then
				-- Flurry 2019
				-- logAnalyticEvent("Restored purchase of " .. transaction.productIdentifier)
			end
			
			--playSound(_G.applauseSound)    
					--versionSetUp()
			elseif transaction.state == "cancelled" then
					print("+++unlockScreen - iap_storeTransaction cancelled")
				   
				   if (transaction.productIdentifier) then
						-- Flurry 2019
						-- logAnalyticEvent("Cancelled purchase of " .. transaction.productIdentifier)
				   end
				   
				   iap_failed()
				   -- unlockScreen()
		elseif transaction.state == "failed" then
			--openAppStoreURL(_G.settingsLua.appStore.EggrollStoreLink) -- open eggroll page on app store app
					print("+++unlockScreen - iap_storeTransaction failed")
				 --   native.showAlert("failed transaction state!", "state:"..transaction.state, { "OK"}, dummy)
					-- iap_completed()
					
					print(transaction.productIdentifier)
					if (transaction.productIdentifier) then
						-- Flurry 2019
						-- logAnalyticEvent("Failed purchase of " .. transaction.productIdentifier)
					else
						-- Flurry 2019
						-- logAnalyticEvent("Failed purchase")
					end
					
					-- iap_failed()
					
					if (tryRestore == true) then
						tryRestore = false
						buyIAP("restore")
					else
						iap_failed()
					end
					
			else
			  -- native.showAlert("unknown transaction state!", "state:"..transaction.state, { "OK"}, dummy)
				-- iap_completed()
				
				iap_failed()
				
		end
	
	end
	
	Runtime:addEventListener( "enterFrame", iapCardFloat)
        
	--analytics.logEvent( "Transaction:"..transaction.state )
        
        
end


function iap_purchaseComplete(itemCode,restore)
        local sKey = version.bundleID.."."
        local itemID = ""
        
        local previousVersion = variation
        local message
        local i
		
                
	if (itemCode == nil or sKey == nil) then
	
				buyIAP("restore")
	elseif (isPurchasing == false and string.gsub(itemCode,sKey,"") == "unlockeverything" or
				isPurchasing == false and string.gsub(itemCode,sKey,"") == "weekly" or
				isPurchasing == false and string.gsub(itemCode,sKey,"") == "monthly" or
				isPurchasing == false and string.gsub(itemCode,sKey,"") == "yearly") then -- added this to fix the issue on Amazon live builds that try to restore multiple IAP
			itemID = string.gsub(itemCode,sKey,"")
			
			
            if variation == 4 then
			
				print("message:" .. itemID)
				
				if (itemID == "weekly") then
				   unlockedWeeklySub = true
				   updateParentsMenu()
					iapMessage = "weekly features"
					iapUnlocked = true
					isPurchasing = true
					savedIAPData.weeklySubUnlocked = true
					
				elseif (itemID == "monthly") then
				   unlockedMonthlySub = true
				   updateParentsMenu()
					iapMessage = "monthly features"
					iapUnlocked = true
					isPurchasing = true
					savedIAPData.monthlySubUnlocked = true
					
				elseif (itemID == "yearly") then
				   unlockedYearlySub = true
				   updateParentsMenu()
					iapMessage = "yearly features"
					iapUnlocked = true
					isPurchasing = true
					savedIAPData.yearlySubUnlocked = true
                elseif itemID == "unlockeverything" then
					unlockedEverything = true
                    variation = 5
					updateParentsMenu()
                    message = "all features"
					iapUnlocked = true
					isPurchasing = true
					savedIAPData.unlockEverything = true
					
					for i = 1,  100 do
						levels[i] = "not completed"
					end
					for i = 101, 200 do
						levels[i] = "locked"
					end
					
					if (showingSaleIAP == true) then
						-- Flurry 2019
						-- logAnalyticEvent("Test 1 - 50% Off Purchased")
					else
						-- Flurry 2019
						-- logAnalyticEvent("Test 1 - Normal Price Purchased")
					end
					
				elseif itemID == "percival" then
					iapPurchased[1] = "true"
					message = "Percival"
					iapUnlocked = true
					
				elseif itemID == "chauncey" then
					iapPurchased[2] = "true"
					message = "Chauncey"
					iapUnlocked = true
					
				elseif itemID == "webster" then
					iapPurchased[3] = "true"
					message = "Webster"
					iapUnlocked = true
					
				elseif itemID == "chip" then
					iapPurchased[4] = "true"
					message = "Chip"
					iapUnlocked = true
					
				elseif itemID == "pete" then
					iapPurchased[5] = "true"
					message = "Pete"
					iapUnlocked = true
					
				end
				
            end
       
        -- if previousVersion == variation then 
            -- timer.performWithDelay(300,iap_completed)
			
            -- return
        -- end
		
		local numIAPUnlocked = 0
		for i = 1, #iapPurchased do
			if (iapPurchased[i] == "true") then
				numIAPUnlocked = numIAPUnlocked + 1
			end
		end
		
		if (numIAPUnlocked == #iapPurchased) then
			
			unlockedEverything = true
			variation = 5
			updateParentsMenu()
		end
			
		-- remove Scroll Menu
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
		
		iap_savePurchase()	
		saveIAPData()
		
		
		if (iapUnlocked == true) then
			tryRestore = false
		end
		
		--playSound(_G.unlockSound)	
		
		-- native.showAlert("Thanks!", "You've unlocked "..message.." and you're ready to play!", { "OK"}, dummy)
		--timer.performWithDelay(300,iap_completed)
			
		-- if savedData.enableSounds == true then
			-- playReservedChannel(unlockSound, 14, 0)
		-- end
		
		if (iapUnlocked == true) then
			playIAPThankYouVO = true
			playVictorySound = true
		end
		
		if (version.appStore ~= "Amazon" and  version.appStore ~= "Amazon FTV" and message and version.appStore ~= "iTunes" and version.appStore ~= "Ouya") then
			 native.showAlert("Thanks!", "You've unlocked "..message.." and you're ready to play!", { "OK"}, iap_completed)
		else
			if (restore == true or iapUnlocked ~= true or version.appStore ~= "iTunes") then
				iap_completed()
			else
				iapUnlocked = false
				
				local function showRateLinkPopup()
					if (reviewPopUp ~= nil) then
					
						--reviewPopUp.show()
						-- needsToShowRatePopup = true
						iap_completed()
						
					else
						alertLink:new(false, settingsLua.alertLinkValues.frequency, settingsLua.alertLinkValues.iterations, settingsLua.alertLinkValues.title, settingsLua.alertLinkValues.description, settingsLua.alertLinkValues.yesButton, settingsLua.alertLinkValues.noButton, settingsLua.alertLinkValues.remindButton, promoKit.settings.links.rateThisAppURL)
					end
				end
				timer.performWithDelay( 1000, showRateLinkPopup )
			end
		end
		--timer.performWithDelay(300,iap_completed)
	
	
	else
	
		iapTimeOut = timer.performWithDelay(5000,iapOtherTimedOut)
	
	
	end
       
end

function updateIAPMenu()
        
	openIAPMenu()
end

function iap_savePurchase()
	if useSaveFiles == false then 
		variationData = jsonParser.encode(variation)
		iCloud.set( "data", variationData )
	else
		local path = system.pathForFile( "data.txt", system.DocumentsDirectory )                
		local file = io.open( path, "w+b" )
		file:write( variation )          
		io.close( file )
	end
	
	if useSaveFiles == false then 
		iapSettingsImport = jsonParser.encode(savedIAPData)
		iCloud.set( "savedIAPData", iapSettingsImport )
	else
		local path2 = system.pathForFile( "savedIAPData.txt", system.DocumentsDirectory )                
		local fileRef = io.open( path2, "w+" )
		fileRef:write( jsonParser.encode(savedIAPData))
		io.close( fileRef )
	end
end

function iap_readPurchasedVersion()
    local loadVersion
    variation = _G.version.defaultVersion
	
	if variation ~= 5 then 
			
		if useSaveFiles == false then 
			loadVersion = iCloud.get( "data" )
			if (loadVersion) then
				variation = jsonParser.decode(loadVersion)	
			end
		else
			local path = system.pathForFile( "data.txt", system.DocumentsDirectory )            
			local file = io.open( path, "r" )
			
			if file then
			
				loadVersion = file:read( "*a") 
				   -- native.showAlert("Loaded Config", "Version: " .. loadVersion, { "OK"}, dummy)
					io.close( file)		
					loadVersion = tonumber(loadVersion) 
					 variation = loadVersion
			end
			
		end
		
		if variation == nil then
		
			variation = 4
		
			if useSaveFiles == false then 
				loadVersion = jsonParser.encode(variation)
				iCloud.set( "data", loadVersion )
			else
				file = io.open( path, "w+b" )
				file:write( variation )
				io.close( file )
			end
				
		end
		
		
		
		
		local iapSettingsImport
		if useSaveFiles == false then 
			iapSettingsImport = iCloud.get( "savedIAPData" )
		else
			local path2 = system.pathForFile( "savedIAPData.txt", system.DocumentsDirectory )                
			local file2 = io.open( path2, "r" )
			-- local iapSettingsImport
			if file2 then  -- existing file
				iapSettingsImport = file2:read( "*a")   
				io.close( file2 )	
			end
		end
		local wasFileCreatedAlready = true
		if (iapSettingsImport == nil) then
			local path3 = system.pathForFile( "iapDefaults.txt", system.ResourceDirectory )                
			local file3 = io.open( path3, "r" )
			if file3 then 
				iapSettingsImport = file3:read( "*a") 
				io.close( file3)		
				wasFileCreatedAlready = false
			end	
		end
		savedIAPData = jsonParser.decode(iapSettingsImport)	
		
		if (wasFileCreatedAlready == false) then
			if (unlockedEverything == true) then
				savedIAPData.unlockEverything = true
				iap_savePurchase()
			end
		end
		
		if (savedIAPData.weeklySubUnlocked == nil) then
			savedIAPData.weeklySubUnlocked = false
		end
		if (savedIAPData.monthlySubUnlocked == nil) then
			savedIAPData.monthlySubUnlocked = false
		end
		if (savedIAPData.yearlySubUnlocked == nil) then
			savedIAPData.yearlySubUnlocked = false
		end
		
		unlockedWeeklySub = savedIAPData.weeklySubUnlocked
		unlockedMonthlySub = savedIAPData.monthlySubUnlocked
		unlockedYearlySub = savedIAPData.yearlySubUnlocked
		
		if (savedIAPData.unlockEverything == true) then
			unlockedEverything = true
			savedIAPData.unlockEverything = true
			iap_savePurchase()
		end
		
		
		
	end
	
	
end

function iap_failed()

	if (testText3) then
		testText3.text = "iap failed called"
	end

	fadeOutMessage() 
	
	
	if (appStart == true) then
		startLogoFade()
	elseif (forParentsButton.alpha == 0) then
	
	
		buttonsActive = true
		
		if (menuGroup[1+itemIndex]) then
			transition.to( menuGroup[1+itemIndex], { time=700, alpha=1, transition=easing.outExpo } )
		end
		
		
		if ( currentState ~= "parentsMenu" and currentState ~= "title") then
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
			
		end
	
	else
	
	
		currentState = "title"
			
		titleButtons:toFront()
		
		
		if (titleButtons.alpha ~= 1) then
		
			transition.to( titleButtons, { time=700, alpha=1, x=0, transition=easing.outExpo } )
			transition.to( playLogoButton, { time=700, alpha=1, transition=easing.outExpo } )
			transition.to( playArrow, { time=700, alpha=1, transition=easing.outExpo } )
			
			if (version.appStore == "Mac")  or version.appStore == "Windows" or version.appStore == "Chrome" then
				transition.to( exitGameBtn, { time=700, alpha=1, transition=easing.outExpo } )
			end
			
			local function titleCharAnimation()
				
				startCharAnim(halfW)
				-- hat.alpha = 0
			end
			timer.performWithDelay( 300, titleCharAnimation)
			
			Runtime:addEventListener( "enterFrame", playArrowFloat)
			
			-- iapMenuAnimation()
			
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
		
		else
		
			makeButtonsActive()
		
		end
	
	
	end
	

end

function iapOtherTimedOut()
	
	if (isPurchasing == false) then
		fadeOutMessage()  
		makeButtonsActive()
	end
	
end

function iapTimedOut()

	if (iapTimeOut) then
		timer.cancel(iapTimeOut) --clear timeout
	end

	if (tryRestore == true) then
		tryRestore = false
		buyIAP("restore")
	else
		iap_failed()
	end

end

function iap_completed()

	tryRestore = false
	
	if (testText3) then
		testText3.text = "iap completed called"
	end
    
	if (iapTimeOut) then
		timer.cancel(iapTimeOut) --clear timeout
    end
	
	print("test  " .. currentState)
	
    --versionSetUp()
    fadeOutMessage()    
    destroyMenuButtons()
    --updateMenuButtons()
	
	isPurchasing = false
	currentlyPurchasing = false
	
	if (playVictorySound and playVictorySound == true) then
		if savedData.enableSounds == true then
			playReservedChannel(unlockSound, 14, 0)
		end
		playVictorySound = false
	end
	
	if (testText) then
		testText.text = testText.text .. "\n" .. "for parents button is: " .. forParentsButton.alpha
		testText:toFront()
	end
	
	if (appStart == true) then
		startLogoFade()
	elseif (forParentsButton.alpha == 0) then
	
		buttonsActive = true
		
		local function playTitleSound()
			-- makeButtonsActive()
			-- if savedData.enableSounds == true and titleCanPlay == true then
				-- playReservedChannel(numMemoryMatchSound, 7, 0)
				titleCanPlay = false
			-- elseif (savedData.enableSounds == true) then
				-- playReservedChannel(hiSound, 7, 0)
				
			-- end
			playReservedChannel(unlockedIAP, 7, 0)
		end
		
		timer.performWithDelay( 600, playTitleSound)
		
		if ( currentState ~= "parentsMenu" and currentState ~= "title") then
			
			closeIAPMenu()
			title()
			buttonsActive = false
			currentState = "title"
		end
	
	else
	
		currentState = "title"
		
		titleButtons:toFront()
		
		if (titleButtons.alpha ~= 1) then
		
			transition.to( titleButtons, { time=700, alpha=1, x=0, transition=easing.outExpo } )
			transition.to( playLogoButton, { time=700, alpha=1, transition=easing.outExpo } )
			transition.to( playArrow, { time=700, alpha=1, transition=easing.outExpo } )
			
			if (version.appStore == "Mac")  or version.appStore == "Windows" or version.appStore == "Chrome" then
				transition.to( exitGameBtn, { time=700, alpha=1, transition=easing.outExpo } )
			end
			
			local function titleCharAnimation()
				
				startCharAnim(halfW)
				-- hat.alpha = 0
			end
			timer.performWithDelay( 300, titleCharAnimation)
			
			Runtime:addEventListener( "enterFrame", playArrowFloat)
			
			-- iapMenuAnimation()
			
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
		
		else
		
			makeButtonsActive()
		
		end
	
	end
    
end

function iap_InitAppStore()
	if version.appStore=="iTunes" then
        settingsLua.appStore = settingsLua.iTunes
    elseif version.appStore=="Google Play" or version.appStore == "Chrome" then
        settingsLua.appStore = settingsLua.googlePlay
	elseif version.appStore == "Amazon" then
		settingsLua.appStore = settingsLua.googlePlay
    elseif version.appStore=="Shapes iTunes" then
        settingsLua.appStore = settingsLua.shapesiTunes
    elseif version.appStore=="Shapes Google Play" then
        settingsLua.appStore = settingsLua.shapesGooglePlay
    end
	

    if version.defaultVersion == 4 then --5 is everything unlocked
		if version.appStore == "Amazon" or version.appStore=="Google Play" then
			store.init(iap_storeTransaction)
		elseif version.appStore == "iTunes" then
			if store.availableStores.apple then
				store.init("apple", iap_storeTransaction)
			end
        -- elseif store.availableStores.google then
		elseif system.getInfo("targetAppStore") == "google" then
            store.init("google", iap_storeTransaction)
        end
        
     
         -- iap_GetProductPrices()
		 
		 if (version.appStore == "Google Play") then
			-- gets prices from store transaction function
		else
         -- iap_GetProductPrices()
			timer.performWithDelay( 100, iap_GetProductPrices )
		end
    end
	
	
	if (usingSubscription == true) then
	
	
		if (store) then
			store.init("apple", iap_storeTransaction)
			iap_GetProductPrices()
		end
		
		--testing
		-- unlockedMonthlySub = false
		-- updateParentsMenu()
		-- iapUnlocked = false
		-- isPurchasing = false
		-- savedIAPData.monthlySubUnlocked = false
		-- save()
		-- iap_savePurchase()
		
	
		local function checkIfValidListener(event)
			--print("Is Subscription Expired")
			--print(event.subscriptionExpired)
			
			-- line1.text = event.subscriptionExpired
			-- line1.alpha = 1
			-- line1.x = halfW
			-- line1.y = halfH
			
			-- if (line1.text == "" or line1.text == nil) then
				-- line1.text = "text is nil"
			-- end
			
			-- line1.text = "checking if expired"
			
			if (inTestMode == true and inTestModeText) then
				--inTestModeText.text = inTestModeText.text .. "\n" .. event.subscriptions
				inTestModeText.text = inTestModeText.text .. "\nGet subscriptions:"
			end
			
			if #event.activeSubscriptions > 0 then
				for productId, sub in pairs(event.activeSubscriptions) do
				
					if (inTestMode == true and inTestModeText) then
						inTestModeText.text = inTestModeText.text .. "\nActive Sub"
						inTestModeText.text = inTestModeText.text .. "\n" .. productId
						inTestModeText.text = inTestModeText.text .. "\n" .. sub.expires
					end
				end
			end
			
			if #event.expiredSubscriptions > 0 then
				for productId, sub in pairs(event.expiredSubscriptions) do
					--print(productId, sub.expired and "expired" or "active", sub.expires)
					
					if (inTestMode == true and inTestModeText) then
						inTestModeText.text = inTestModeText.text .. "\nExpired Sub"
						inTestModeText.text = inTestModeText.text .. "\n" .. productId
						inTestModeText.text = inTestModeText.text .. "\n" .. sub.expires
					end
					
					--if (sub.expired == true) then
						if (productId == version.bundleID..".weekly") then
							unlockedWeeklySub = false
							updateParentsMenu()
							iapUnlocked = false
							isPurchasing = false
							savedIAPData.weeklySubUnlocked = false
							save()
							iap_savePurchase()
						elseif (productId == version.bundleID..".monthly") then
							unlockedMonthlySub = false
							updateParentsMenu()
							iapUnlocked = false
							isPurchasing = false
							savedIAPData.monthlySubUnlocked = false
							save()
							iap_savePurchase()
						elseif (productId == version.bundleID..".yearly") then
							unlockedYearlySub = false
							updateParentsMenu()
							iapUnlocked = false
							isPurchasing = false
							savedIAPData.yearlySubUnlocked = false
							save()
							iap_savePurchase()
						end
					--end
				end
			end
			
			-- if (event.isValid == true and event.subscriptionExpired ~= true) then
			-- else
				-- if (event.productIdentifier
				-- unlockedEverything = false
				-- variation = 4
				-- updateParentsMenu()
				-- iapUnlocked = false
				-- isPurchasing = false
				-- iapEverythingUnlocked = false
				-- savedIAPData.unlockEverything = false
				-- save()
			-- end
			
			-- if (event.subscriptionExpired == nil or event.subscriptionExpired == true) then
				-- unlockedAllRanges = false
				-- save()
			-- end
		end
		
		-- line1.alpha = 1
		-- line1.x = halfW
		-- line1.y = halfH
		
		-- line1:toFront()
	
	
		if (receiptJSON) then
		
			--line1.text = "receipt found"
			print("receipt found")
			
			if (inTestMode == true and inTestModeText) then
				inTestModeText.text = inTestModeText.text .. "\nreceipt found"
			end
			
			-- receiptDecoded =  jsonParser.decode(receiptJSON)
			--storeValid.validateIOSReceipt(receiptJSON, "f3adacdd6cb54cc8a78a3ac293c9e254", checkIfValidListener, true )
			--storeValidation.validateIOSReceipt(receiptJSON, "f3adacdd6cb54cc8a78a3ac293c9e254", checkIfValidListener, false )
		else
		
			--line1.text = "no receipt found"
			if (inTestMode == true and inTestModeText) then
				inTestModeText.text = inTestModeText.text .. "\nno receipt found"
			end
		
			print("no receipt found")
			-- unlockedEverything = false
			-- variation = 4
			-- updateParentsMenu()
			-- iapUnlocked = false
			-- isPurchasing = false
			-- iapEverythingUnlocked = false
			-- savedIAPData.unlockEverything = false
			-- save()
		end
		
	end

	
	
end

function iap_getProductPrice(id)
    local i
    local environment = system.getInfo( "environment" )
    if environment == "simulator" then
        return "$1.99"
    else    
	
		if (version.bundleID and id) then
			id = version.bundleID.."."..id    
			if loadedProducts[id] == nil then       
				return ""
			else       
				return loadedProducts[id]  
			end
		else
			return ""
		end
    end
end

function iap_loadProductsCallback( event )
    local i
    local validProducts = event.products
   -- local invalidProducts = event.invalidProducts
   print("Test")
	print(#validProducts)
	productIdentifiers = {}
    for i = 1,#validProducts do
       local id = validProducts[i].productIdentifier
       local price = validProducts[i].localizedPrice       
        loadedProducts[id] = price         
		productIdentifiers[1] = validProducts[i].productIdentifier
		print(validProducts[i].productIdentifier)
		print(validProducts[i].localizedPrice)
    end
    
   -- for i = 1,#invalidProducts do
   --     print( invalidProducts[i] )
   -- end
end

function iap_GetProductPrices()
    print("Load list of products")
   -- debugger:log("20","call func iap_GetProductPrices")

    --includes all possibilities, but ignores ones it doesn't need
    local arrayOfProductIdentifiers = 
    {
        version.bundleID..".unlockeverything",  -- Everything
		-- version.bundleID..".unlockeverything2",
		-- version.bundleID..".unlockeverything3",
		version.bundleID..".unlockeverythinglimitedtime",
		version.bundleID..".percival",
		version.bundleID..".chauncey",
		version.bundleID..".webster",
		version.bundleID..".chip",
		version.bundleID..".pete",
		
		version.bundleID..".weekly",
		version.bundleID..".monthly",
		version.bundleID..".yearly",
    }

    if ( store.isActive ) then

        if ( store.canLoadProducts ) then
            store.loadProducts( arrayOfProductIdentifiers, iap_loadProductsCallback )
        else
            --this store does not support an app fetching products
        end

    end
end

function openAppStoreURL(url)
    if settingsLua.appStore ~= nil then
        if settingsLua.appStore.affiliates ~= nil then
            local country = system.getPreference( "locale", "country" )
            if settingsLua.appStore.affiliates[country] ~= nil then 
                url = url..settingsLua.appStore.affiliates[country]
            elseif settingsLua.appStore.affiliates.default ~= nil then 
                url = url..settingsLua.appStore.affiliates.default
            end
        end
    else
    	  -- url = url..settingsLua.appStore.affiliates.default
		  url = url
    end
    print("openAppStoreURL: "..url)
    system.openURL( url )
end

--***End IAP Functions