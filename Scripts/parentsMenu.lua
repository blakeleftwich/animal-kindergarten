
--////////////////////////////////////////////////////////////////////////
--Begin Parents/Options MENU
--////////////////////////////////////////////////////////////////////////
function showOptionsMenu()--event)

	parentsHold = 3000
	hold = false
	holdTimer = nil

	print("touched parents button")
	local purchased 
	--if event.phase == "ended" and menuGroup.menuStage == "levelmenu" then
		playSound(_G.clickSound)
		menuGroup.menuStage = "optionsmenu"
		purchased = wasPurchased()
		if menuGroup.optionsMenuGroup.notLoaded then 
			optionsMenuBG = display.newImageRect("Images/menu/optionsMenu.png", 700, 384 )
			optionsMenuBG.x = 256
			optionsMenuBG.y = 192
			
			optionsMenuExitButton = display.newImageRect("Images/menu/iapMenuExitButton.png", 32, 32 )
			optionsMenuExitButton.x = 396
			optionsMenuExitButton.y = 45
			optionsMenuExitButton.action = "exit"
			
			optionsSoundToggle = display.newGroup()
			optionsSoundToggle.x = 340
			optionsSoundToggle.y = 75						
			optionsSoundToggle.action = "soundToggle"
			optionsSoundToggleON = display.newImageRect("Images/menu/optionsToggleOn.png", 63, 30 )
			optionsSoundToggleOFF = display.newImageRect("Images/menu/optionsToggleOff.png", 63, 30 )
			optionsSoundToggle:insert(optionsSoundToggleON)
			optionsSoundToggle:insert(optionsSoundToggleOFF)
			
			optionsExitToggle = display.newGroup()
			optionsExitToggle.x = 340
			optionsExitToggle.y = 108
			optionsExitToggle.action = "exitToggle"
			optionsExitToggleON = display.newImageRect("Images/menu/optionsToggleOn.png", 63, 30 )			
			optionsExitToggleOFF = display.newImageRect("Images/menu/optionsToggleOff.png", 63, 30 )
			optionsExitToggle:insert(optionsExitToggleON)
			optionsExitToggle:insert(optionsExitToggleOFF)
			
			optionsPromoToggle = display.newGroup()
			optionsPromoToggle.x = 340
			optionsPromoToggle.y = 141
			optionsPromoToggle.action = "promoToggle"
			optionsPromoToggleON = display.newImageRect("Images/menu/optionsToggleOn.png", 63, 30 )			
			optionsPromoToggleOFF = display.newImageRect("Images/menu/optionsToggleOff.png", 63, 30 )
			optionsPromoToggle:insert(optionsPromoToggleON)
			optionsPromoToggle:insert(optionsPromoToggleOFF)
			
			if purchased then 
				optionsBlocker = display.newImageRect("Images/menu/optionsMenuPinkBlocker.png", 259, 28 )
				optionsBlocker.x = 248
				optionsBlocker.y = 174
			else
				optionsIAPToggle = display.newGroup()
				optionsIAPToggle.x = 340
				optionsIAPToggle.y = 174
				optionsIAPToggle.action = "IAPToggle"
				optionsIAPToggleON = display.newImageRect("Images/menu/optionsToggleOn.png", 63, 30 )
				optionsIAPToggleOFF = display.newImageRect("Images/menu/optionsToggleOff.png", 63, 30 )
				optionsIAPToggle:insert(optionsIAPToggleON)
				optionsIAPToggle:insert(optionsIAPToggleOFF)
				
				-- optionsRateButton = display.newImageRect("Images/menu/optionsRateButton.png", 270, 31 )
				-- optionsRateButton.x = 248
				-- optionsRateButton.y = 218
				-- optionsRateButton.action = "rate"
				-- optionsRateButton.url = _G.appType.rateURL
				
				optionsUnlockButton = display.newImageRect("Images/menu/optionsUnlockButton.png", 272, 40 )
				optionsUnlockButton.x = 248
				optionsUnlockButton.y = 218
				optionsUnlockButton.action = "unlock"
			end
			
			optionsMenuMoreButton = display.newImageRect("Images/menu/optionsMoreButton.png", 270, 31 )
			optionsMenuMoreButton.x = 248
			optionsMenuMoreButton.y = 259
			optionsMenuMoreButton.action = "more"
			optionsMenuMoreButton.url = settings.moreURL
			
			
			
			optionsColoringFarm = display.newImageRect("Images/menu/optionsColoringFarm.png", 42, 42 )
			optionsColoringFarm.x = 150
			optionsColoringFarm.y = 306
			optionsColoringFarm.action = "Options - Coloring Farm"
			optionsColoringFarm.url = settings.coloringFarmURL
			
			optionsColoringZoo = display.newImageRect("Images/menu/optionsColoringZoo.png", 42, 42 )
			optionsColoringZoo.x = 200
			optionsColoringZoo.y = 306
			optionsColoringZoo.action = "Options - Coloring Zoo"
			optionsColoringZoo.url = settings.coloringZooURL
			
			optionsPuzzleFarm = display.newImageRect("Images/menu/optionsPuzzleFarm.png", 42, 42 )
			optionsPuzzleFarm.x = 250
			optionsPuzzleFarm.y = 306
			optionsPuzzleFarm.action = "Options - Puzzle Farm"
			optionsPuzzleFarm.url = settings.puzzleFarmURL
			
			optionsWhoseToes = display.newImageRect("Images/menu/optionsWhoseToes.png", 42, 42 )
			optionsWhoseToes.x = 300
			optionsWhoseToes.y = 306
			optionsWhoseToes.action = "Options - Whose Toes"
			optionsWhoseToes.url = settings.whoseToesURL
			
			optionsEggrollButton = display.newImageRect("Images/menu/optionsEggroll.png", 42, 42 )
			optionsEggrollButton.x = 350
			optionsEggrollButton.y = 306
			optionsEggrollButton.action = "eggroll"
			optionsEggrollButton.url = settings.eggrollURL
			
			menuGroup.optionsMenuGroup:insert(optionsMenuBG)
			menuGroup.optionsMenuGroup:insert(optionsMenuExitButton)
			--menuGroup.optionsMenuGroup:insert(optionsRateButton)
			if not purchased then 
				menuGroup.optionsMenuGroup:insert(optionsUnlockButton)
				menuGroup.optionsMenuGroup:insert(optionsIAPToggle)
			else
				menuGroup.optionsMenuGroup:insert(optionsBlocker)
			end
			menuGroup.optionsMenuGroup:insert(optionsMenuMoreButton)
			menuGroup.optionsMenuGroup:insert(optionsSoundToggle)
			menuGroup.optionsMenuGroup:insert(optionsPromoToggle)
			menuGroup.optionsMenuGroup:insert(optionsExitToggle)
			
			menuGroup.optionsMenuGroup:insert(optionsColoringFarm)
			menuGroup.optionsMenuGroup:insert(optionsColoringZoo)
			menuGroup.optionsMenuGroup:insert(optionsPuzzleFarm)
			menuGroup.optionsMenuGroup:insert(optionsWhoseToes)
			menuGroup.optionsMenuGroup:insert(optionsEggrollButton)
		end
		optionsMenuMoreButton.y = 259
		menuGroup.optionsMenuGroup.notLoaded = false
		optionsMenuExitButton:addEventListener("touch", exitOptionsMenu)
		--optionsRateButton:addEventListener("touch", optionsMenuButtonListener)
		if purchased then 
			transition.to( optionsMenuMoreButton, { time=400,y=239})
		else
			optionsUnlockButton:addEventListener("touch", optionsMenuUnlockButtonListener)
			optionsIAPToggle:addEventListener("touch", optionsMenuToggleListener)
		end
		optionsMenuMoreButton:addEventListener("touch", optionsMenuButtonListener)
		optionsSoundToggle:addEventListener("touch", optionsMenuToggleListener)
		optionsPromoToggle:addEventListener("touch", optionsMenuToggleListener)
		optionsExitToggle:addEventListener("touch", optionsMenuToggleListener)
		
		optionsColoringFarm:addEventListener("touch", optionsMenuButtonListener)
		optionsColoringZoo:addEventListener("touch", optionsMenuButtonListener)
		optionsPuzzleFarm:addEventListener("touch", optionsMenuButtonListener)
		optionsWhoseToes:addEventListener("touch", optionsMenuButtonListener)
		optionsEggrollButton:addEventListener("touch", optionsMenuButtonListener)
		
		optionsMenuSetToggles()
		optionsApplySettings()
		menuGroup.optionsMenuGroup.alpha = 0
		transition.to( menuGroup.optionsMenuGroup, { time=400,alpha=1})	
		analytics.logEvent( "Opened Options Menu" )
	--end
end

function optionsMenuButtonListener(event)
	local target = event.target
	if event.phase == "ended" then
		playSound(_G.clickSound)
		system.openURL( target.url )		
		menuGroup.waitframe = 1
		updateWaiting()
		print("Opened "..target.action .." ::"..target.url)
		analytics.logEvent( "Opened "..target.action )
		
		hideOptionsMenu()
	end
	return true
end


function optionsMenuToggleListener(event)
	local target = event.target
	if event.phase == "ended" then
		playSound(_G.clickSound)
		print("optionsMenuToggleListener: "..target.action)
		if target.action=="soundToggle" then
			if parentsSettings.enableSounds then 
				parentsSettings.enableSounds = false			
			else
				parentsSettings.enableSounds = true			
			end
			optionsMenuToggleLog(target.action,parentsSettings.enableSounds)
		elseif target.action=="promoToggle" then
			if parentsSettings.enablePromo then 
				parentsSettings.enablePromo = false
			else
				parentsSettings.enablePromo = true
			end
			optionsMenuToggleLog(target.action,parentsSettings.enablePromo)
		elseif target.action=="IAPToggle" then
			if parentsSettings.enableIAP then 
				parentsSettings.enableIAP = false
			else
				parentsSettings.enableIAP = true
			end
			optionsMenuToggleLog(target.action,parentsSettings.enableIAP)
		elseif target.action=="exitToggle" then
			if parentsSettings.enableSocial then 
				parentsSettings.enableSocial = false
			else
				parentsSettings.enableSocial = true
			end
			optionsMenuToggleLog(target.action,parentsSettings.enableSocial)
		end
		optionsMenuSetToggles()
		saveParentSettings()
		optionsApplySettings()
		return true
	end
end

function optionsMenuToggleLog(name,value)
	if value then 
		print(name..": true")
		analytics.logEvent( name..": true")
	else
		print(name..": false")
		analytics.logEvent( name..": false")
	end	
end

function optionsMenuSetToggles()
	if parentsSettings.enableSounds then 	
		optionsSoundToggleON.alpha = 1
		optionsSoundToggleOFF.alpha = 0
	else
		optionsSoundToggleON.alpha = 0
		optionsSoundToggleOFF.alpha = 1
	end
	if parentsSettings.enablePromo then 
		optionsPromoToggleON.alpha = 1
		optionsPromoToggleOFF.alpha = 0
	else
		optionsPromoToggleON.alpha = 0
		optionsPromoToggleOFF.alpha = 1
	end
	if not wasPurchased() then 
		if parentsSettings.enableIAP then 
			optionsIAPToggleON.alpha = 1
			optionsIAPToggleOFF.alpha = 0
		else
			optionsIAPToggleON.alpha = 0
			optionsIAPToggleOFF.alpha = 1
		end
	end
	if parentsSettings.enableSocial then 
		optionsExitToggleON.alpha = 1
		optionsExitToggleOFF.alpha = 0
	else
		optionsExitToggleON.alpha = 0
		optionsExitToggleOFF.alpha = 1
	end
end

function optionsMenuUnlockButtonListener(event)
	if event.phase == "began" then 		
		playSound(_G.clickSound)
		if not wasPurchased() then 
			print("unlock")
			store.purchase({ settings.IAPCode })
			--purchaseComplete()
			analytics.logEvent( "Chose Options Menu Unlock" )
			menuGroup.waitframe = 1	
			updateWaiting()
			hideOptionsMenu()
		end
	end
	return true
end

function exitOptionsMenu(event)
	if event.phase == "ended" then
		playSound(_G.clickSound)
		hideOptionsMenu()
	end
	return true
end
	

function hideOptionsMenu()	
	--fade menu
	transition.to( menuGroup.optionsMenuGroup, { time=400,alpha=0,onComplete=optionsClosed})	
	
	--remove listeners
	optionsMenuExitButton:removeEventListener("touch", exitOptionsMenu)
	--optionsRateButton:removeEventListener("touch", optionsMenuButtonListener)
	if not wasPurchased() then
		optionsUnlockButton:removeEventListener("touch", optionsMenuUnlockButtonListener)
		optionsIAPToggle:removeEventListener("touch", optionsMenuToggleListener)
	end
	optionsMenuMoreButton:removeEventListener("touch", optionsMenuButtonListener)
	optionsSoundToggle:removeEventListener("touch", optionsMenuToggleListener)
	optionsPromoToggle:removeEventListener("touch", optionsMenuToggleListener)
	optionsExitToggle:removeEventListener("touch", optionsMenuToggleListener)
	
	optionsColoringFarm:removeEventListener("touch", optionsMenuButtonListener)
	optionsColoringZoo:removeEventListener("touch", optionsMenuButtonListener)
	optionsPuzzleFarm:removeEventListener("touch", optionsMenuButtonListener)
	optionsWhoseToes:removeEventListener("touch", optionsMenuButtonListener)
	optionsEggrollButton:removeEventListener("touch", optionsMenuButtonListener)
end

function optionsClosed(obj)
	--reactivate level menu when iap menu hidden
	menuGroup.menuStage = "topmenu"
end

function optionsApplySettings()
	--mute sounds
	if parentsSettings.enableSounds then
		--audio.setMaxVolume( 1, { 0 } )
		audio.setVolume(.5,{channel=1})
	else
		--audio.setMaxVolume( 0, { 0 } )
		audio.setVolume(0,{channel=1})
	end
        
        --hide social
--	if (parentsSettings.enableSocial)  then		
--                menuGroup.facebookButton.wrapDist = -3
--                menuGroup.twitterButton.wrapDist = -3
--                menuGroup.youtubeButton.wrapDist = -3
--                menuGroup.facebookButton.oalpha = 1
--                menuGroup.twitterButton.oalpha = 1
--                menuGroup.youtubeButton.oalpha = 1
--                if menuGroup.topmenuFullAlpha then 
--                    transition.to( menuGroup.facebookButton, { time=400,alpha=1})
--                    transition.to( menuGroup.twitterButton, { time=400,alpha=1})
--                    transition.to( menuGroup.youtubeButton, { time=400,alpha=1})
--                end
--                menuGroup.facebookGlow.oalpha = 1
--                menuGroup.twitterGlow.oalpha = 1
--                menuGroup.youtubeGlow.oalpha = 1
--                if menuGroup.topmenuFullAlpha then 
--                    transition.to( menuGroup.facebookGlow, { time=400,alpha=1})
--                    transition.to( menuGroup.twitterGlow, { time=400,alpha=1})
--                    transition.to( menuGroup.youtubeGlow, { time=400,alpha=1})
--                end
--	else
		--don't set to 0 or menu code will show on load
--                menuGroup.facebookButton.wrapDist = 0
--                menuGroup.twitterButton.wrapDist = 0
--                menuGroup.youtubeButton.wrapDist = 0
--                menuGroup.facebookButton.oalpha = 0.01
--                menuGroup.twitterButton.oalpha = 0.01
--                menuGroup.youtubeButton.oalpha = 0.01
--                if menuGroup.topmenuFullAlpha then 
--                    transition.to( menuGroup.facebookButton, { time=400,alpha=0.01})
--                    transition.to( menuGroup.twitterButton, { time=400,alpha=0.01})
--                    transition.to( menuGroup.youtubeButton, { time=400,alpha=0.01})
--               end
--                menuGroup.facebookGlow.oalpha = 0.01
--                menuGroup.twitterGlow.oalpha = 0.01
--                menuGroup.youtubeGlow.oalpha = 0.01
--                if menuGroup.topmenuFullAlpha then 
--                    transition.to( menuGroup.facebookGlow, { time=400,alpha=0.01})
--                    transition.to( menuGroup.twitterGlow, { time=400,alpha=0.01})
--                    transition.to( menuGroup.youtubeGlow, { time=400,alpha=0.01})
--                end
--	end
		
	--hide promo
--	if (parentsSettings.enablePromo)  then
--            if menuGroup.topmenuFullAlpha then
--                if menuGroup.promoCreated  then 
--                   transition.to( menuGroup.promoButton, { time=400,alpha=1})
--                end
--                transition.to( menuGroup.moreButton, { time=400,alpha=1})
--            end
--            menuGroup.moreButton.oalpha = 1
--        else
--            if menuGroup.topmenuFullAlpha then
--                if menuGroup.promoCreated then 
--                   transition.to( menuGroup.promoButton, { time=400,alpha=0.01})
--                end
--              transition.to( menuGroup.moreButton, { time=400,alpha=0.01})
--           end
--            menuGroup.moreButton.oalpha = 0.01
--	end
	
	--hide IAP
--	if not wasPurchased() then 
--		if parentsSettings.enableIAP then			
--			transition.to( optionsUnlockButton, { time=400,alpha=1})
--			transition.to( optionsMenuMoreButton, { time=400,y=259})
--                        if menuGroup.topmenuFullAlpha then
--                            transition.to( menuGroup.unlockButton, { time=400,alpha=1})
--                        end
--                        menuGroup.unlockButton.oalpha = 1
--		else
--			transition.to( optionsUnlockButton, { time=400,alpha=0})
--			transition.to( optionsMenuMoreButton, { time=400,y=239})
--                        if menuGroup.topmenuFullAlpha then
--                            transition.to( menuGroup.unlockButton, { time=400,alpha=0.01})
--                        end
--                        menuGroup.unlockButton.oalpha = 0.01
--		end
--	else
--		transition.to( optionsMenuMoreButton, { time=400,y=239})
--	end
	
end

function optionsIAPConfig()

end


--////////////////////////////////////////////////////////////////////////
--End Parents/Options MENU
--////////////////////////////////////////////////////////////////////////