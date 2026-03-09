alertLink = {}

saveData = require "saveData"
	
	--ShowFirst is how many times the app needs to open before it shows.
	--ShowIncrement is how often it would keep showing when app is opened.
	function alertLink:new(appStart, frequency, iterations, popupTitle, popupText, yesText, noText, remindText, link)	
		
		local lastPopup = frequency * iterations
		
		if (appStart == true) then
			if (tonumber(savedData.showPopupAt) == 0) then
				savedData.showPopupAt = tonumber(savedData.showPopupAt) + frequency
			end
			
			savedData.appOpenNum = tonumber(savedData.appOpenNum) + 1
		end
		
		
		
		if (appStart == true and savedData.appOpenNum == savedData.showPopupAt and tonumber(savedData.appOpenNum) <= lastPopup or
				appStart == false) then
		
			
			local function onLinkComplete( event )
                if "clicked" == event.action then
                    local i = event.index
                    if 2 == i then
					
							if (appStart == true and version.appStore == "Google Play" and variation == 4) then
								-- unlockByRating()
								variation = 5
								updateParentsMenu()
								iap_savePurchase()	
								saveIAPData()
								
								-- Flurry 2019
								-- logAnalyticEvent("Opened Rate to Unlock")
							end
                            print "OK Clicked"
							
							
							
							savedData.rateInlineTouched = true
							save()
							
							local function resetSelectScreen()
								menu.unload()
								menu.reset()
								loadScrollMenu()
							end
							timer.performWithDelay( 100, resetSelectScreen )
							
							if (appStart == true) then
								-- savedData.appOpenNum = lastPopup + 1
							else
								iap_completed()
							end
                            
							local openURL =  promoKit.settings.links.rateThisAppURL
							print("opening link "..tostring(openURL))
							system.openURL( openURL )
							
							
                    elseif 1 == i then
                            print "Cancel Clicked"
							if (appStart == true) then
								-- savedData.appOpenNum = lastPopup + 1
								save()
							else
								iap_completed()
							end
							
							-- Flurry 2019
							-- logAnalyticEvent("Exited Rate to Unlock")
					-- elseif 2 == i then
							-- print "Remind Clicked"
							-- if (appStart == true) then
							-- else
								-- iap_completed()
							-- end
                    end
                end
            end
			
			
			local alert = native.showAlert( popupTitle, popupText, { noText, yesText }, onLinkComplete )
		
			-- local alert = native.showAlert( popupTitle, popupText, { noText, remindText, yesText }, onLinkComplete )
			
		
			if (appStart == true) then
				savedData.showPopupAt = tonumber(savedData.showPopupAt) + frequency
			end
		end
		
	end
	

return alertLink