
local itemsToAnimate = {}

-- local wiggler = {}

-- function animateActors(event) 

    -- if (animPrevTime == 0 ) then 
		-- animPrevTime = event.time - 10	
    -- end
    -- local tDelta = event.time - animPrevTime
    -- animPrevTime = event.time 
    -- local tRatio = 30/tDelta
	
	-- for i = #wiggler, 1, -1 do
		-- local o = wiggler[i]			
		-- if o.animTime > 0 then	
			-- if o.rv ~= 0 then 
				-- o.rotation = o.rotation + (o.rv*tDelta)
			-- end
			-- if (animPrevTime-o.startTime > o.animTime) then
				-- o.animTime = 0
				-- o.rotation = o.tr
				-- o.rv = 0
			-- else
				-- o.rv = (tRatio*.5*o.rv) - (.005*(o.rotation - o.tr))
			-- end
		-- else
			-- table.remove( wiggler, i )
		-- end
	-- end
	
	-- if (#wiggler == 0) then
		-- Runtime:removeEventListener( "enterFrame", animateActors)
	-- end
	
-- end

-- function startWiggle(target,duration) 
	-- wiggler[#wiggler+1] = target
	-- animPrevTime = 0
	-- target.tr = target.initR
	-- target.rv = 0
	-- target.rotation = target.initR
	-- target.startTime = 0
	-- target.animTime = 0
	-- if target.animTime == 0 then 
		-- target.startTime = system.getTimer()
		-- target.rv=-.4
		-- target.animTime = duration
		-- target.tr = target.rotation
	-- else				
		-- if math.abs(target.rv) < .4 then
			-- target.rv = .4 * math.abs(target.rv)/target.rv
		-- end				
		-- target.startTime = system.getTimer()
	-- end	
	-- if (#wiggler == 1) then
		-- Runtime:addEventListener( "enterFrame", animateActors)
	-- end
-- end
-- movingY = 200

function resetItemAnim( o )
	
	if (o.stickerAnim) then
		transition.cancel( o.stickerAnim )
		o.stickerAnim = nil
	end

	-- o.anchorX = 0.5
	-- o.anchorY = 0.5
	o.animTime = 0
	o.animPrevTime = 0
	
	if (o.animation == "") then
	else
	
		if (o.initAnchorX) then
			o.anchorX = o.initAnchorX
		else
			o.anchorX = 0.5
		end
		if (o.initAnchorY) then
			o.anchorY = o.initAnchorY
		else
			o.anchorY = 0.5
		end
		o.y = o.initY
		o.x = o.initX
		
		if (o.initScale) then
			o.xScale = o.initScale
			o.yScale = o.initScale
		end
		if (o.initR) then
			o.rotation = o.initR
		else
			o.rotation = 0
		end
		o.ty = o.initY
		o.tx = o.initX
		o.tr = o.initR
		o.ts = o.initScale
		o.xv = 0
		o.yv = 0
		o.rv = 0
		o.av = 0
		o.sv = 0
	end
	
	
	o.frame = 0
	
	o.animation = nil
	o.particles = nil
	o.duration = nil
	o.particleDuration = nil
	o.targetScale = nil
	
	for i = #itemsToAnimate, 1, -1 do
		if (itemsToAnimate[i] == o) then
			table.remove( itemsToAnimate, i )
		end
	end
	
	
	
end


function animateStart( item )
	--debugger:log(4,"animation started")
   -- local alert = native.showAlert( "animation", "animation started", { "OK"} )
	
	if (item) then
		
		
		if (item.animationInfo.particles == "lickgame") then
			movingX = display.contentCenterX + 75 --exclusively for lick animation
			movingY = display.contentCenterY - 20 --exclusively for lick animation
		else
			movingX = display.contentCenterX --exclusively for lick animation
			movingY = display.contentCenterY - 20 --exclusively for lick animation
		end
		local animationType = item.animationInfo.id
		local particleType = item.animationInfo.particles
		local animationDuration = item.animationInfo.duration
		local stickerSound = item.animationInfo.sound
		local stickerSoundTwo = item.animationInfo.soundTwo
		
		--print(particleType)
		-- print(particleType)
		print(animationType)
		
		if savedData.enableSounds == true then
			if (stickerSound) then
				playReservedChannel( gameSounds[stickerSound], currentGameChannel, 0 )
				currentGameChannel = currentGameChannel + 1
				if (currentGameChannel > 25) then
					currentGameChannel = 20
				end
			end
			if (stickerSoundTwo) then
				playReservedChannel( gameSounds[stickerSoundTwo], currentGameChannel, 0 )
				currentGameChannel = currentGameChannel + 1
				if (currentGameChannel > 25) then
					currentGameChannel = 20
				end
			end
		end
		
		
		if (animationType == "") then
		elseif (item.animation ~= nil) then
			animationType = ""
		else
		
			if animationType == "toybox" then
				if system.getInfo("model") == "iPad" then
					item.initScale = 0.95
				elseif (display.pixelHeight == 960) then
					item.initScale = 0.95
				else
					item.initScale = 1
				end
			end
		
			item.animation = animationType
			item.particles = particleType
			item.duration = animationDuration
			if (item.animationInfo.particleDuration) then
				item.particleDuration = item.animationInfo.particleDuration
			else
				item.particleDuration = nil
			end
			-- item.particleDuration = item.animationInfo.particleDuration
			item.targetScale = { x = item.initScale, y = item.initScale }
			item.tr = item.initR
			item.xv = 0
			item.yv = 0
			item.rv = 0
			item.av = 0
			item.sv = 0
			item.ty = item.initY
			item.tx = item.initX
			item.ts = item.initScale
			item.animTime = 0
			item.animPrevTime = 0
			item.startX = item.x
			item.startY = item.y
			
			if (item.path == true) then
			else
				item.anchorX = item.animationInfo.anchor[1]
				item.anchorY = item.animationInfo.anchor[2]
			end
			
			if (item.initAnchorX or item.initAnchorY or item.path == true) then
			else
				
				-- if (item and item.xScale and item.xScale > 0) then
				
					-- if (item.animationInfo.anchor[1] ~= 0.5) then
					
						-- print("Test1")
					
						-- local anchorXDiff
						-- if (item.animationInfo.anchor[1] < 0.5) then
							-- anchorXDiff = (item.contentWidth*0.5) - (item.contentWidth*item.animationInfo.anchor[1])
							-- item.x = item.initX - anchorXDiff
						-- else
							-- anchorXDiff = (item.contentWidth*item.animationInfo.anchor[1]) - (item.contentWidth*0.5)
							-- item.x = item.initX + anchorXDiff
						-- end
					-- end
				
				-- else
				
					-- if (item.animationInfo.anchor[1] ~= 0.5) then
					
						-- print("Test2")
					
						-- local anchorXDiff
						-- if (item.animationInfo.anchor[1] < 0.5) then
							-- anchorXDiff = (item.contentWidth*0.5) - (item.contentWidth*item.animationInfo.anchor[1])
							-- item.x = item.initX + anchorXDiff
						-- else
							-- anchorXDiff = (item.contentWidth*item.animationInfo.anchor[1]) - (item.contentWidth*0.5)
							-- item.x = item.initX - anchorXDiff
						-- end
					-- end
				
				-- end
				
				-- if (item.animationInfo.anchor[2] ~= 0.5) then
				
					-- print("Test3")
				
					-- local anchorYDiff
					-- if (item.animationInfo.anchor[2] < 0.5) then
						-- anchorYDiff = (item.contentHeight*0.5) - (item.contentHeight*item.animationInfo.anchor[2])
						-- item.y = item.initY - anchorYDiff
					-- else
						-- anchorYDiff = (item.contentHeight*item.animationInfo.anchor[2]) - (item.contentHeight*0.5)
						-- item.y = item.initY + anchorYDiff
					-- end
				-- end
				
				if (item and item.xScale) then
					if (item.xScale > 0) then
			
						if (item.animationInfo.anchor[1] ~= 0.5) then
							print("anchor 1")
							local anchorXDiff
							if (item.animationInfo.anchor[1] < 0.5) then
								anchorXDiff = (item.contentWidth*0.5) - (item.contentWidth*item.animationInfo.anchor[1])
								item.x = item.initX - anchorXDiff
								
								if (item.path == true) then
									gamePathGroup.x = gamePathGroup.initX - anchorXDiff
								end
							else
								anchorXDiff = (item.contentWidth*item.animationInfo.anchor[1]) - (item.contentWidth*0.5)
								item.x = item.initX + anchorXDiff
							
								if (item.path == true) then
									gamePathGroup.x = gamePathGroup.initX + anchorXDiff
								end
							end
						end
					
					else
					
						if (item.animationInfo.anchor[1] ~= 0.5) then
							print("anchor 2")
							local anchorXDiff
							if (item.animationInfo.anchor[1] < 0.5) then
								anchorXDiff = (item.contentWidth*0.5) - (item.contentWidth*item.animationInfo.anchor[1])
								item.x = item.initX + anchorXDiff
								
								if (item.path == true) then
									gamePathGroup.x = gamePathGroup.initX + anchorXDiff
								end
							else
								anchorXDiff = (item.contentWidth*item.animationInfo.anchor[1]) - (item.contentWidth*0.5)
								item.x = item.initX - anchorXDiff
								
								if (item.path == true) then
									gamePathGroup.x = gamePathGroup.initX - anchorXDiff
								end
							end
						end
					
					end
				end
				
				if (item.animationInfo.anchor[2] ~= 0.5) then
					print("anchor 3")
					local anchorYDiff
					if (item.animationInfo.anchor[2] < 0.5) then
						anchorYDiff = (item.contentHeight*0.5) - (item.contentHeight*item.animationInfo.anchor[2])
						item.y = item.initY - anchorYDiff
						
						if (item.path == true) then
							gamePathGroup.y = gamePathGroup.initY - anchorYDiff
						end
					else
						anchorYDiff = (item.contentHeight*item.animationInfo.anchor[2]) - (item.contentHeight*0.5)
						item.y = item.initY + anchorYDiff
						
						if (item.path == true) then
							gamePathGroup.y = gamePathGroup.initY + anchorYDiff
						end
					end
				end
				
			end
			
			item.particleOffsetX = item.animationInfo.particleOffset[1]
			item.particleOffsetY = item.animationInfo.particleOffset[2]
			
			
			print(item.particles)
			
			if (item and item.x) then
				itemsToAnimate[#itemsToAnimate+1] = item
			end
			
			if (#itemsToAnimate == 1) then
				Runtime:removeEventListener( "enterFrame", animateActorsItemAnimations)
				Runtime:addEventListener( "enterFrame", animateActorsItemAnimations)
			end
			
		end
		
		
		

		-- print(animationType)
		
		local function stickerFinished( o )
			
			-- o.anchorX = 0.5
			-- o.anchorY = 0.5
			o.x = o.initX
			o.y = o.initY
			o.rotation = o.initR
			o.frame = 0
			
			o.animation = nil
			
			for i = #itemsToAnimate, 1, -1 do
				if (itemsToAnimate[i] == o) then
					table.remove( itemsToAnimate, i )
				end
			end
		
		end
		
		-- print(animationType)
		
		if (animationType == "") then
		elseif (animationType == "none") then
			startNone(item,item.duration)	
		elseif animationType == "spin" then
			item.rotation = 0
			item.stickerAnim = transition.to( item, { time=item.duration, rotation=item.tr-720, transition=easing.inOutQuad, onComplete = resetItemAnim } )	
		elseif animationType == "spinback" then
			item.rotation = 0
			item.stickerAnim = transition.to( item, { time=item.duration, rotation=item.tr-720, transition=easing.inOutQuad, onComplete = resetItemAnim } )	
		elseif animationType == "disappear" then
			if item.animTime == 0 then 
				item.animTime = item.duration
			end
			item.startTime = system.getTimer()
			item.rotation = item.tr
			
			item.stickerAnim = transition.to( item, { time=item.duration, alpha=0, xScale = 1.4, yScale = 1.4, transition=easing.inQuad, onComplete = resetItemAnim } )	
		
		elseif animationType == "disappearloop" then
			if item.animTime == 0 then 
				item.animTime = item.duration
			end
			item.startTime = system.getTimer()
			item.rotation = item.tr
			
			local function showItem()
				if (item) then
					item.xScale, item.yScale = 0.01, 0.01
					item.alpha = 0
					item.stickerAnim = transition.to( item, { time=500, alpha=1, xScale = 1, yScale = 1, transition=easing.inQuad } )	
				end
			end
			if (item.stickerTimer) then
				timer.cancel( item.stickerTimer )
				item.stickerTimer = nil
			end
			if (item.stickerAnim) then
				transition.cancel( item.stickerAnim )
				item.stickerAnim = nil
			end
			item.stickerTimer = timer.performWithDelay( item.duration + 500, showItem )
		
			item.stickerAnim = transition.to( item, { time=item.duration, alpha=0, xScale = 1.4, yScale = 1.4, transition=easing.inQuad, onComplete = resetItemAnim } )	
		
		
		elseif animationType == "hop" then
			startHop(item,item.duration)
		elseif animationType == "jumptopos" then
			startJumpToPos(item,item.duration)
		elseif animationType == "floattopos" then
			startFloatToPos(item,item.duration)
		elseif animationType == "giftBounce" then
			startGiftBounce(item,item.duration)										
		elseif animationType == "balloon" then			
			startBalloon(item,item.duration)	
		elseif animationType == "springy" then			
			startSpringy(item,item.duration)	
		elseif animationType == "toybox" then			
			startToyBox(item,item.duration)	
		elseif animationType == "float" or animationType == "floatchar" then	
			startFloat(item,item.duration)	
		elseif animationType == "shake" then
			startShake(item,item.duration)
		elseif animationType == "basketShake" then
			startBasketShake(item,item.duration)
		elseif animationType == "rustle" then
			if (event) then
				startRustle(item,item.duration,event.x,event.y)
			else
				startRustle(item,item.duration,item.x,item.y)
			end
	    elseif animationType == "smallrustle" then
            if (event) then    
				startSmallRustle(item,item.duration,event.x,event.y)
			else
				startSmallRustle(item,item.duration,item.x,item.y)
			end	
		elseif animationType == "dartleft" or animationType == "dartright" or
					animationType == "dartleftloop" or animationType == "dartrightloop" then
			startDart(animationType,item,item.duration)     
		elseif animationType == "walkleft" or animationType == "walkright" or
					animationType == "walkleftloop" or animationType == "walkrightloop" then
			startWalk(animationType,item,item.duration)
		elseif animationType == "waddleleft" or animationType == "waddleright" or animationType == "waddlerightchar" or animationType == "waddlerightchar2" or
					animationType == "waddleleftloop" or animationType == "waddlerightloop" then
			startWaddle(animationType,item,item.duration)
		elseif animationType == "flyleft" or animationType == "flyright" or animationType == "flyrightchar" or
					animationType == "flyleftloop" or animationType == "flyrightloop" or
					animationType == "flyleftup" or animationType == "flyrightup" then
			startFlying(animationType,item,item.duration)
		elseif animationType == "flyleft2" or animationType == "flyright2" or animationType == "flyrightchar2" or
					animationType == "flyleftloop2" or animationType == "flyrightloop2" then
			startFlying2(animationType,item,item.duration)
		
		elseif animationType == "flyup" or animationType == "flydown" or
					animationType == "flyuploop" or animationType == "flydownloop" then
			startFlyUp(animationType,item,item.duration)
		elseif animationType == "popOutGrowIn" then
			local delay = item.duration
			local actorRef = item
			local currScaleX = item.xScale
			local currScaleY = item.yScale
			local popScaleX = item.xScale * 2
			local popScaleY = item.yScale * 2
			
			if actorRef.animTime == 0 then 
				actorRef.animTime = item.duration
			end
			actorRef.startTime = system.getTimer()
			
			transition.to( actorRef, { time=300, alpha = 0,xScale=popScaleX,yScale=popScaleY, transition=easing.outQuart } )
			
			timer.performWithDelay (delay, stickerFinished)
		end
		
		
	
	end

end

function animateActorsItemAnimations(event) 

	for i = #itemsToAnimate, 1, -1 do
	
		itemsToAnimate[i].ts = 0
		if (itemsToAnimate[i].animPrevTime == 0 ) then 
			itemsToAnimate[i].animPrevTime = event.time - 10	
		end

		itemsToAnimate[i].tDelta = event.time - itemsToAnimate[i].animPrevTime
		itemsToAnimate[i].animPrevTime = event.time 
		itemsToAnimate[i].tRatio = 30/itemsToAnimate[i].tDelta
	
			local o = itemsToAnimate[i]					
			if o and o.animation and o.animTime > 0 and o.y then
					
					if (o.animation == "" or o.animation == "waddlerightchar" or o.animation == "waddlerightchar2") then
					else
						if (o.animation == "jumptopos" or o.animation == "floattopos") then
						else
							if (o.giftBouncePause and o.giftBouncePause == true or
									o.bouncePause and o.bouncePause == true) then
							else
								o.y = o.y + (o.yv*itemsToAnimate[i].tDelta)
							end
						end
						if (o.animation == "flyrightchar") then
						else
							o.x = o.x + (o.xv*itemsToAnimate[i].tDelta)
						end
					end					
					if o.rv ~= 0 then 
						if o.animation == "waddleright" or o.animation == "waddlerightchar" or o.animation == "waddlerightchar2" then
							o.rotation = o.rotation - (o.rv*itemsToAnimate[i].tDelta)
						else
							o.rotation = o.rotation + (o.rv*itemsToAnimate[i].tDelta)
						end
					end
					if o.sv ~= 0 then 
							itemsToAnimate[i].ts = o.trackScale + (o.sv*itemsToAnimate[i].tDelta)
							if itemsToAnimate[i].ts < 0.1 then 
								itemsToAnimate[i].ts = 0.1
							--elseif itemsToAnimate[i].ts > 1.6 then 
							--   itemsToAnimate[i].ts = 1.6
							end
							o.trackScale = itemsToAnimate[i].ts
							o.xScale = itemsToAnimate[i].ts*o.targetScale.x
							o.yScale = itemsToAnimate[i].ts*o.targetScale.y
					end

					if (itemsToAnimate[i].animPrevTime-o.startTime > o.animTime) then
							--print("rel")
							
							print("reset anim")
							
							if (o.animation == "" or
									o.animation == "waddlerightchar" or
									o.animation == "waddlerightchar2" or
									o.animation == "flyrightchar" or
									o.animation == "floatchar") then
							else
								-- o.anchorX = 0.5
								-- o.anchorY = 0.5
								if (o.animation == "jumptopos" or o.animation == "floattopos") then
								else
									if (o.initAnchorX) then
										o.anchorX = o.initAnchorX
									else
										o.anchorX = 0.5
									end
									if (o.initAnchorY) then
										o.anchorY = o.initAnchorY
									else
										o.anchorY = 0.5
									end
								end
								
								o.y = o.initY
								o.x = o.initX
								
								-- o.y = o.ty
								-- o.x = o.tx
								o.yv = 0
								o.rotation = o.initR
								
								if (o.initScale) then
									o.xScale = o.initScale
									o.yScale = o.initScale
								end
								o.ty = o.initY
								o.tx = o.initX
							end
							
							if (o.animation == "") then
							else
								o.rv = 0
								o.rotation = o.initR
								
							end
							
							if (o.shadow and o.shadowOffsetX) then
								o.shadow.x = o.x + o.shadowOffsetX
								
								local yDiff = math.abs(o.initY - o.y) -- o.startY
								local newShadowScale = 1 - (yDiff/60) -- 12
								o.shadow.xScale, o.shadow.yScale = newShadowScale, newShadowScale
							end
							
							o.frame = 0
							o.animTime = 0
							o.animation = nil
							
							
							for i = #itemsToAnimate, 1, -1 do
								if (itemsToAnimate[i] == o) then
									table.remove( itemsToAnimate, i )
								end
							end
							
					else
						local particleX
						local particleY
						
						local oX, oY = o:localToContent( 0, 0 )
						
						if (o.xScale > 0) then
							particleX = oX + (o.particleOffsetX*o.yScale)
							particleY = oY + (o.particleOffsetY*o.yScale)
						else
							particleX = oX - (o.particleOffsetX*o.yScale)
							particleY = oY + (o.particleOffsetY*o.yScale)
						end
					
							if o.animation == "" then
							elseif o.animation == "spring" then
									o.xv = (itemsToAnimate[i].tRatio*.4*o.xv) - (.006*(o.x - o.tx))
									o.yv = (itemsToAnimate[i].tRatio*.4*o.yv) - (.006*(o.y - o.ty))
							elseif o.animation == "hop" then 
									--print("hop yv:" ..o.yv)
									o.yv = o.yv + .02
									if o.y > o.ty then
										o.y = o.ty+o.ty-o.y
										o.yv = -.7 * o.yv
									end
							elseif o.animation == "jumptopos" then
									o.animY = o.animY + (o.yv*itemsToAnimate[i].tDelta)
									o.y = o.animY + (4 * math.sin(o.frame/2))
							
									if (o.shadow) then
										o.shadow.x = o.x + o.shadowOffsetX
										
										local yDiff = math.abs(o.initY - o.y) -- o.startY
										local newShadowScale = 1 - (yDiff/60) -- 12
										o.shadow.xScale, o.shadow.yScale = newShadowScale, newShadowScale
		
										
										if (o.jumping ~= true) then
											-- o.shadow.y = o.y + o.shadowOffsetY
										end
									end
							
									if (o.x > o.startX + (math.abs(o.initX-o.startX)*0.5) and o.yv < 0) then
										o.yv = -o.yv
									end
									if o.y > o.ty then
										o.y = o.ty
									end
									
									o.frame = o.frame + 1
									
									local details = levelDetails["level" .. level]
									if (details.icon.image ~= "worldIcon42" and -- webster and pete
										details.icon.image ~= "worldIcon41") then
										
										o.rotation = o.rotation - (2*math.sin(o.frame/2))--owl (and any other animal) wiggles while hopping
									else
										o.rotation = o.rotation - (math.sin(o.frame/6)) --frog and duck does a little rotation when hopping
									end
							
							elseif o.animation == "floattopos" then
									o.animY = o.animY + (o.yv*itemsToAnimate[i].tDelta)
									o.y = o.animY + (4 * math.sin(o.frame/2))
							
									if (o.shadow) then
										o.shadow.x = o.x + o.shadowOffsetX
										
										local yDiff = math.abs(o.initY - o.y) -- o.startY
										local newShadowScale = 1 - (yDiff/60) -- 12
										o.shadow.xScale, o.shadow.yScale = newShadowScale, newShadowScale
		
										
										if (o.jumping ~= true) then
											-- o.shadow.y = o.y + o.shadowOffsetY
										end
									end
							
									if (o.x > o.startX + (math.abs(o.initX-o.startX)*0.5) and o.yv < 0) then
										o.yv = -o.yv
									end
									if o.y > o.ty then
										o.y = o.ty
									end
									
									o.frame = o.frame + 1
									o.rotation = o.rotation - (2*math.sin(o.frame/2))
							
							elseif o.animation == "giftBounce" then 
									--print("hop yv:" ..o.yv)
									o.yv = o.yv + .03
									
									-- local currentHeight = math.abs(o.startY - o.y)
									-- o.xScale = 0.2 + (0.8 * (currentHeight / o.giftDropHeight))
									
									if o.bounceY and o.y >= o.bounceY and o.giftBouncePause == false then
										o.giftBouncePause = true
										
										local function scaleBack()
											local function bounceUp()
												o.yv = o.yv * .98 -- 0.98
												o.y = o.ty
												-- o.y = -.7 * o.yv
												o.giftBounce = true
												o.giftBouncePause = false
											end
											transition.to( o, { time = 20, xScale = 1, yScale = 1, onComplete = bounceUp } )
										end
										transition.to( o, { time = 20, xScale = 1.025, yScale = 0.975, onComplete = scaleBack } ) -- was time = 100, xScale = 1.2, yScale = 0.8
									end
							elseif o.animation == "shake" then 
									--print("shake rv:" ..o.rv.." itemsToAnimate[i].tRatio:" .. itemsToAnimate[i].tRatio.." tr:" .. o.tr.." r:" .. o.rotation)
									--o.rv = (itemsToAnimate[i].tRatio*.45*o.rv) - (.004*(o.rotation - o.tr))
									o.rv = (itemsToAnimate[i].tRatio*.5*o.rv) - (.005*(o.rotation - o.tr))
							elseif o.animation == "waddleleft" or o.animation == "waddleleftloop" then
									if o.x < -700 then 
										if (o.animation == "waddleleft") then
											o.alpha = 0
											o.xScale = 0.01
											o.yScale = 0.01
										else
											o.x = 700
										end
									end
									o.frame = o.frame + 1
									--o.rv = o.rv + 0.1 * math.sin(o.frame/20) --(itemsToAnimate[i].tRatio*.5*o.rv) - (.005*(o.rotation - o.tr))
									o.rv = 0
									o.rotation = o.rotation + (5*math.sin(o.frame/3.5))
									--print("rotation:" .. o.rotation.." sin:" .. (math.sin(o.frame)))
							elseif o.animation == "waddleright" or o.animation == "waddlerightloop" or o.animation == "waddlerightchar" or o.animation == "waddlerightchar2" then 
									if o.x > 700 then 
										if (o.animation == "waddleright" or o.animation == "waddlerightchar" or o.animation == "waddlerightchar2") then
											o.alpha = 0
											o.xScale = 0.01
											o.yScale = 0.01
										else
											o.x = -700
										end
									end
									--o.rv = (itemsToAnimate[i].tRatio*.5*o.rv) --- (.005*(o.rotation - o.tr))
									o.rv = 0
									o.frame = o.frame + 1
									
									if (o.animation == "waddlerightchar2") then
										-- o.anchorY = 100
										o.rotation = o.rotation - (4*math.sin(o.frame/3.5))
									else
										o.rotation = o.rotation - (1.75*math.sin(o.frame/3.5)) --In sticker app, was (5*math.sin(o.frame/3.5))
									end
							elseif o.animation == "rustle" then 
									o.xv = (itemsToAnimate[i].tRatio*.4*o.xv) - (.004*(o.x - o.tx))
									o.yv = (itemsToAnimate[i].tRatio*.4*o.yv) - (.004*(o.y - o.ty))
									o.rv = (itemsToAnimate[i].tRatio*.4*o.rv) - (.004*(o.rotation - o.tr))
							elseif o.animation == "balloon" then
									o.sv = (itemsToAnimate[i].tRatio*.4*o.sv) - (.005*(o.trackScale - 1))
							elseif o.animation == "springy" then 
									o.sv = (itemsToAnimate[i].tRatio*.4*o.sv) - (.01*(o.trackScale - 1))
							elseif o.animation == "toybox" then 
									o.sv = (itemsToAnimate[i].tRatio*.3*o.sv) - (.01*(o.trackScale - 1))
							elseif o.animation == "float" or o.animation == "floatchar" then 
									o.frame = o.frame + 1
									o.y = o.ty + 4 * math.sin(o.frame/2)
									o.rotation = o.rotation - (2*math.sin(o.frame/2))
							elseif o.animation == "dartleft" or o.animation == "dartleftloop" then 
									if o.x < -700 then 
										if (o.animation == "dartleft") then
											o.alpha = 0
											o.xScale = 0.01
											o.yScale = 0.01
										else
											o.x = 700
										end
									end
							elseif o.animation == "dartright" or o.animation == "dartrightloop" then 
									if o.x > 700 then
										if (o.animation == "dartright") then
											o.alpha = 0
											o.xScale = 0.01
											o.yScale = 0.01
										else
											o.x = -700
										end
									end
							elseif o.animation == "walkleft" or o.animation == "walkleftloop" then 
									if o.x < -700 then
										if (o.animation == "walkleft") then
											o.alpha = 0
											o.xScale = 0.01
											o.yScale = 0.01
										else
											o.x = 700
										end
									end
									o.yv = o.yv + .02
									if o.y > o.ty then
											o.y = o.ty+o.ty-o.y
											o.yv = -.7 * o.yv
									end									
							elseif o.animation == "walkright" or o.animation == "walkrightloop" then 
									if o.x > 700 then
										if (o.animation == "walkright") then
											o.alpha = 0
											o.xScale = 0.01
											o.yScale = 0.01
										else
											o.x = -700
										end
									end
									o.yv = o.yv + .02
									if o.y > o.ty then
											o.y = o.ty+o.ty-o.y
											o.yv = -.7 * o.yv
									end
							elseif o.animation == "flyleft" or o.animation == "flyleftloop" or o.animation == "flyleftup" then 
									if o.x < -700 then
										if (o.animation == "flyleft" or o.animation == "flyleftup") then
											o.alpha = 0
											o.xScale = 0.01
											o.yScale = 0.01
										else
											o.x = 700
										end
									end
									o.frame = o.frame + 1
									
									if (o.animation == "flyleftup") then
										o.y = o.y - 0.5
									else
										o.y = o.ty + 30 * math.sin(o.frame/20)
									end

							elseif o.animation == "flyright" or o.animation == "flyrightloop" or o.animation == "flyrightchar" or o.animation == "flyrightup" then 
									if o.x > 700 then
										if (o.animation == "flyright" or o.animation == "flyrightchar" or o.animation == "flyrightup") then
											o.alpha = 0
											o.xScale = 0.01
											o.yScale = 0.01
										else
											o.x = -700
										end
									end
									o.frame = o.frame + 1
									o.y = o.ty + 30 * math.sin(o.frame/20)
							elseif o.animation == "flyup" or o.animation == "flyuploop" then 
									if o.y < -700 then
										if (o.animation == "flyup") then
											o.alpha = 0
											o.xScale = 0.01
											o.yScale = 0.01
										else
											o.y = 700
										end
									end
									o.frame = o.frame + 1
									-- o.x = o.tx + 30 * math.sin(o.frame/20)

							elseif o.animation == "flydown" or o.animation == "flydownloop" then 
									if o.y > 700 then
										if (o.animation == "flydown") then
											o.alpha = 0
											o.xScale = 0.01
											o.yScale = 0.01
										else
											o.y = -700
										end
									end
									o.frame = o.frame + 1
									-- o.x = o.tx + 30 * math.sin(o.frame/20)
							end

							
						
						if (o.particleDuration == nil or o.particleDuration > 0) then
							
							local particlexv = {min=-1,max=1}
							if o.xv > 0 then 
								particlexv = {min=-6,max=-3}
							elseif o.xv < 0 then 
								particlexv = {min=3,max=6}
							end
							if o.particles == "" then                                                            
							elseif o.particles == "smoke" then
								Particles:newEmitter(explosions,"fade", "Images/Particles/puff.png", 50*o.yScale, 50*o.yScale, 1, particleX, particleY, particlexv.min, particlexv.max, -1, 1, 255, 255, 255, 0*o.yScale)
							elseif o.particles == "pepperSmoke" then
								Particles:newEmitter(explosions,"pepperSmoke", "Images/Particles/puff.png", 80*o.yScale, 80*o.yScale, 1, particleX, particleY, -3, 3, -3, 3, 255, 255, 255, 0*o.yScale)
							
							elseif o.particles == "rocketSmoke" then
								Particles:newEmitter(explosions,"rocketSmoke", "Images/Particles/puff.png", 50*o.yScale, 50*o.yScale, 2, particleX, particleY, particlexv.min, particlexv.max, -1, 1, 255, 255, 255, 0*o.yScale)
								Particles:newEmitter(explosions,"fireworks", "Images/Particles/star.png", 16*o.yScale, 16*o.yScale, 1, particleX, particleY, particlexv.min-.59, particlexv.max+.59, -1, 1, 255, 255, 255, 0*o.yScale)
							
							elseif o.particles == "bubbles" then
								Particles:newEmitter(explosions,"bubbles", "Images/Particles/popBubble.png", 50*o.yScale, 50*o.yScale, 1, particleX, particleY, particlexv.min, particlexv.max, -1, 1, 255, 255, 255, 0*o.yScale)
							
							elseif o.particles == "stars" then
								Particles:newEmitter(explosions,"fade", "Images/Particles/star.png", 33*o.yScale, 33*o.yScale, 1, particleX, particleY, particlexv.min, particlexv.max, -1, 1, 255, 255, 255, 0*o.yScale)
							elseif o.particles == "starMagic" then
								Particles:newEmitter(explosions,"starMagic", "Images/Particles/star.png", math.random(18,28)*o.yScale, math.random(18,28)*o.yScale, 1, particleX+math.random(-55,55), particleY+math.random(-55,55), particlexv.min, particlexv.max, -1, 1, 255, 255, 255, 0*o.yScale)
							elseif o.particles == "dropDust" then
								Particles:newEmitter(explosions,"starMagic", "Images/Particles/whiteTransparentParticle.png", math.random(18,28)*o.yScale, math.random(18,28), 1, particleX+math.random(-55,55), particleY+math.random(-55,55), particlexv.min, particlexv.max, -1, 1, 255, 255, 255, 0*o.yScale)
							elseif o.particles == "dust" then
								Particles:newEmitter(explosions,"dust", "Images/Particles/whiteTransparentParticle.png", math.random(18,28)*o.yScale, math.random(18,28)*o.yScale, 1, particleX, particleY, particlexv.min, particlexv.max, -1, 1, 255, 255, 255, 0*o.yScale)
							elseif o.particles == "nestDust" then
								Particles:newEmitter(explosions,"nestDust", "Images/Particles/whiteTransparentParticle.png", math.random(18,28)*o.yScale, math.random(18,28)*o.yScale, 1, particleX, particleY, -5, -5, 0, 0, 255, 255, 255, 0*o.yScale)
						
							elseif o.particles == "horseDust" then
								randomSize = math.random(10,35)
								Particles:newEmitter(explosions,"dust", "Images/Particles/whiteTransparentParticle.png", randomSize, randomSize, 3, particleX + math.random(-60,60), particleY+math.random(-4,4), particlexv.min, particlexv.max, -1, 1, 255, 255, 255, 0*o.yScale)
							elseif o.particles == "fireSmoke" then
								Particles:newEmitter(explosions,"trainSmoke", "Images/Particles/whiteTransparentParticle.png", math.random(20,40)*o.yScale, math.random(20,40)*o.yScale, 6, particleX+math.random(-20,20), particleY+math.random(-20,0), particlexv.min, particlexv.max, -1, 1, 233, 233, 233, 0*o.yScale)
							elseif o.particles == "helicopterdust" then
								Particles:newEmitter(explosions,"helicopterdust", "Images/Particles/whiteTransparentParticle.png", math.random(18,32)*o.yScale, math.random(18,32)*o.yScale, 2, math.random(particleX-70, particleX+70) , particleY, particlexv.min-5, particlexv.max+5, -1, 1, 255, 255, 255, 0*o.yScale)
							
							elseif o.particles == "smallGiftDust" then
								Particles:newEmitter(explosions,"dust", "Images/Particles/whiteTransparentParticle.png", math.random(8,10)*o.yScale, math.random(8,10)*o.yScale, 1, particleX+(math.random(-20,20)*o.yScale), particleY, particlexv.min, particlexv.max, -1, 1, 255, 255, 255, 0*o.yScale)
							elseif o.particles == "largeGiftDust" and o.giftBounce == true then
								-- randomScale = math.random(15,20)/10
								Particles:newEmitter(explosions,"giftDust", "Images/Particles/whiteTransparentParticle.png", 50, 50, 1, particleX+(math.random(-100,100)*o.yScale), halfH + 120, particlexv.min-6, particlexv.max+6, -1, .25, 255, 255, 255, 1)--math.random(10,100)/1000)
								Particles:newEmitter(explosions,"giftDust", "Images/Particles/whiteTransparentParticle.png", 45, 45, 1, particleX+(math.random(-100,100)*o.yScale), halfH + 120, particlexv.min-8, particlexv.max+8, -2, .25, 255, 255, 255, 1)--math.random(10,100)/1000)
								Particles:newEmitter(explosions,"giftDust", "Images/Particles/whiteTransparentParticle.png", 40, 40, 1, particleX+(math.random(-100,100)*o.yScale), halfH + 120, particlexv.min-12, particlexv.max+12, -3, .25, 255, 255, 255, 1)--math.random(10,100)/1000)
								Particles:newEmitter(explosions,"giftDust", "Images/Particles/whiteTransparentParticle.png", 35, 35, 1, particleX+(math.random(-100,100)*o.yScale), halfH + 120, particlexv.min-14, particlexv.max+14, -4, .25, 255, 255, 255, 1)-- math.random(10,100)/1000)
							
								local function stopDustParticles()
									o.giftBounce = false
								end
								timer.performWithDelay( o.particleDuration, stopDustParticles )
							-- elseif o.particles == "gallopDust" and o.giftBounce == true then
							elseif o.particles == "gallopDust" then
							
								-- Particles:newEmitter(explosions,"dust", "Images/Particles/whiteTransparentParticle.png", math.random(18,28)*o.yScale, math.random(18,28)*o.yScale, 1, particleX+(math.random(-75,75)*o.yScale), particleY, particlexv.min, particlexv.max, -1, 1, 255, 255, 255, 0*o.yScale)
								Particles:newEmitter(explosions,"dust", "Images/Particles/whiteTransparentParticle.png", math.random(18,28)*o.yScale, math.random(18,28)*o.yScale, 1, particleX+(math.random(-55,55)*o.yScale), particleY, particlexv.min, particlexv.max, -1, 1, 255, 255, 255, 0*o.yScale)
							
							
								-- local function stopDustParticles()
									-- o.giftBounce = false
								-- end
								-- timer.performWithDelay( 100, stopDustParticles )
							elseif o.particles == "narrowDust" then
							
								-- Particles:newEmitter(explosions,"dust", "Images/Particles/whiteTransparentParticle.png", math.random(18,28)*o.yScale, math.random(18,28)*o.yScale, 1, particleX+(math.random(-75,75)*o.yScale), particleY, particlexv.min, particlexv.max, -1, 1, 255, 255, 255, 0*o.yScale)
								Particles:newEmitter(explosions,"dust", "Images/Particles/whiteTransparentParticle.png", math.random(18,28)*o.yScale, math.random(18,28)*o.yScale, 1, particleX+(math.random(-35,35)*o.yScale), particleY, particlexv.min, particlexv.max, -1, 1, 255, 255, 255, 0*o.yScale)
							
							
								-- local function stopDustParticles()
									-- o.giftBounce = false
								-- end
								-- timer.performWithDelay( 100, stopDustParticles )
							elseif o.particles == "owlDust" then
							
								-- Particles:newEmitter(explosions,"dust", "Images/Particles/whiteTransparentParticle.png", math.random(18,28)*o.yScale, math.random(18,28)*o.yScale, 1, particleX+(math.random(-75,75)*o.yScale), particleY, particlexv.min, particlexv.max, -1, 1, 255, 255, 255, 0*o.yScale)
								Particles:newEmitter(explosions,"dust", "Images/Particles/whiteTransparentParticle.png", math.random(15,22)*o.yScale, math.random(15,22)*o.yScale, 1, particleX+(math.random(-15,15)*o.yScale), particleY, particlexv.min, particlexv.max, -1, 1, 255, 255, 255, 0*o.yScale)
							
							
								-- local function stopDustParticles()
									-- o.giftBounce = false
								-- end
								-- timer.performWithDelay( 100, stopDustParticles )
							elseif o.particles == "veryNarrowDust" then
							
								-- Particles:newEmitter(explosions,"dust", "Images/Particles/whiteTransparentParticle.png", math.random(18,28)*o.yScale, math.random(18,28)*o.yScale, 1, particleX+(math.random(-75,75)*o.yScale), particleY, particlexv.min, particlexv.max, -1, 1, 255, 255, 255, 0*o.yScale)
								Particles:newEmitter(explosions,"dust", "Images/Particles/whiteTransparentParticle.png", math.random(18,28)*o.yScale, math.random(18,28)*o.yScale, 1, particleX+(math.random(-22,22)*o.yScale), particleY, particlexv.min, particlexv.max, -1, 1, 255, 255, 255, 0*o.yScale)
							
							
								-- local function stopDustParticles()
									-- o.giftBounce = false
								-- end
								-- timer.performWithDelay( 100, stopDustParticles )
							
							elseif o.particles == "apples" then
								if math.random() < .09 then                                                                
								   particlexv.max = math.random()*2 - 1--particlexv.max/2
								   if particlexv.max < 0 then 
									   particlexv.max = particlexv.max - 1
								   else
									   particlexv.max = particlexv.max + 1
								   end
									Particles:newEmitter(explosions,"objectBounce", version.root .. "/Images/sticker73.png", 31*o.yScale, 31*o.yScale, 1, particleX+math.random(-65,65), particleY+math.random(-65,45), -2, 2, -1, 1, 255, 255, 255, 180*o.yScale)
								end
							elseif o.particles == "eggs" then
								if math.random() < .09 then                                                                
								   particlexv.max = math.random()*2 - 1--particlexv.max/2
								   if particlexv.max < 0 then 
									   particlexv.max = particlexv.max - 1
								   else
									   particlexv.max = particlexv.max + 1
								   end
									Particles:newEmitter(explosions,"objectBounce", "Images/Particles/egg.png", 22*o.yScale, 30*o.yScale, 1, particleX, particleY, particlexv.min, particlexv.max, -1, 1, 255, 255, 255, 10*o.yScale)
								end
							elseif o.particles == "acorns" then
								if math.random() < .09 then                                                                
								   particlexv.max = math.random()*2 - 1--particlexv.max/2
								   if particlexv.max < 0 then 
									   particlexv.max = particlexv.max - 1
								   else
									   particlexv.max = particlexv.max + 1
								   end
									Particles:newEmitter(explosions,"objectBounce", version.root .. "/Images/Particles/acorn.png", 27*o.yScale, 30*o.yScale, 1, particleX, particleY, particlexv.min, particlexv.max, -1, 1, 255, 255, 255, 25*o.yScale)
								end
							elseif o.particles == "pinecones" then
								if math.random() < .09 then                                                                
								   particlexv.max = math.random()*2 - 1--particlexv.max/2
								   if particlexv.max < 0 then 
									   particlexv.max = particlexv.max - 1
								   else
									   particlexv.max = particlexv.max + 1
								   end
									Particles:newEmitter(explosions,"objectBounce", version.root .. "/Images/traySticker32.png", 18*o.yScale, 22*o.yScale, 1, particleX+math.random(-55,55), particleY+math.random(-65,45), particlexv.min, particlexv.max, -1, 1, 255, 255, 255, 130*o.yScale)
								end
							elseif o.particles == "carrots" then
								if math.random() < .09 then                                                                
								   particlexv.max = math.random()*2 - 1--particlexv.max/2
								   if particlexv.max < 0 then 
									   particlexv.max = particlexv.max - 1
								   else
									   particlexv.max = particlexv.max + 1
								   end
									Particles:newEmitter(explosions,"objectBounce", version.root .. "/Images/sticker68.png", 47*o.yScale, 74*o.yScale, 1, particleX, particleY, -2, 2, -1, 1, 255, 255, 255, 3*o.yScale)
								end
							elseif o.particles == "basketballs" then
								if math.random() < .09 then                                                                
								   particlexv.max = math.random()*2 - 1--particlexv.max/2
								   if particlexv.max < 0 then 
									   particlexv.max = particlexv.max - 1
								   else
									   particlexv.max = particlexv.max + 1
								   end
									Particles:newEmitter(explosions,"objectBounce", version.root .. "/Images/traySticker77.png", 38*o.yScale, 38*o.yScale, 1, particleX, particleY, particlexv.min, particlexv.max, -1, 1, 255, 255, 255, 39*o.yScale)
								end
							elseif o.particles == "cupcakes" then
								if math.random() < .09 then                                                                
								   particlexv.max = math.random()*2 - 1--particlexv.max/2
								   if particlexv.max < 0 then 
									   particlexv.max = particlexv.max - 1
								   else
									   particlexv.max = particlexv.max + 1
								   end
									Particles:newEmitter(explosions,"objectBounce", version.root .. "/Images/traySticker26.png", 21.3*o.yScale, 26.6*o.yScale, 1, particleX, particleY, particlexv.min, particlexv.max, -1, 1, 255, 255, 255, 23*o.yScale)
								end
							elseif o.particles == "coins" then
								if math.random() < .09 then                                                                
								   particlexv.max = math.random()*2 - 1--particlexv.max/2
								   if particlexv.max < 0 then 
									   particlexv.max = particlexv.max - 1
								   else
									   particlexv.max = particlexv.max + 1
								   end
									Particles:newEmitter(explosions,"objectBounce", version.root .. "/Images/traySticker31.png", 34*o.yScale, 34*o.yScale, 1, particleX, particleY, particlexv.min, particlexv.max, -1, 1, 255, 255, 255, 15*o.yScale)
								end
							elseif o.particles == "strawberries" then
								if math.random() < .09 then                                                                
								   particlexv.max = math.random()*2 - 1--particlexv.max/2
								   if particlexv.max < 0 then 
									   particlexv.max = particlexv.max - 1
								   else
									   particlexv.max = particlexv.max + 1
								   end
									Particles:newEmitter(explosions,"objectBounce", version.root .. "/Images/traySticker22.png", 16*o.yScale, 22*o.yScale, 1, particleX, particleY, particlexv.min, particlexv.max, -1, 1, 255, 255, 255, 127*o.yScale)
								end
							elseif o.particles == "appleDrop" then
								if math.random() < .09 then                                                                
								   particlexv.max = math.random()*2 - 1--particlexv.max/2
								   if particlexv.max < 0 then 
									   particlexv.max = particlexv.max - 1
								   else
									   particlexv.max = particlexv.max + 1
								   end
									Particles:newEmitter(explosions,"objectBounce", version.root .. "/Images/traySticker73.png", 22*o.yScale, 20*o.yScale, 1, particleX, particleY, particlexv.min, particlexv.max, -1, 1, 255, 255, 255, 138*o.yScale)
									
								end
							elseif o.particles == "barrelRandom" then
								if math.random() < .09 then                                                                
								   particlexv.max = math.random()*2 - 1--particlexv.max/2
								   if particlexv.max < 0 then 
									   particlexv.max = particlexv.max - 1
								   else
									   particlexv.max = particlexv.max + 1
								   end
									randomParticle = math.random(1,5)
									if randomParticle == 1 then
										Particles:newEmitter(explosions,"objectBounce", version.root .. "/Images/traySticker23.png", 25*o.yScale, 27.5*o.yScale, 1, particleX, particleY, particlexv.min, particlexv.max, -1, 1, 255, 255, 255, 134*o.yScale)
									elseif randomParticle == 2 then
										Particles:newEmitter(explosions,"objectBounce", version.root .. "/Images/traySticker73.png", 26.62*o.yScale, 24.2*o.yScale, 1, particleX, particleY, particlexv.min, particlexv.max, -1, 1, 255, 255, 255, 134*o.yScale)
									elseif randomParticle == 3 then
										Particles:newEmitter(explosions,"objectBounce", version.root .. "/Images/traySticker22.png", 16*o.yScale, 22*o.yScale, 1, particleX, particleY, particlexv.min, particlexv.max, -1, 1, 255, 255, 255, 134*o.yScale)
									elseif randomParticle == 4 then
										Particles:newEmitter(explosions,"objectBounce", version.root .. "/Images/sticker68.png", 31.02*o.yScale, 48.84*o.yScale, 1, particleX, particleY, particlexv.min, particlexv.max, -1, 1, 255, 255, 255, 134*o.yScale)
									elseif randomParticle == 5 then
										Particles:newEmitter(explosions,"objectBounce", version.root .. "/Images/Particles/acorn.png", 13.5*o.yScale, 15*o.yScale, 1, particleX, particleY, particlexv.min, particlexv.max, -1, 1, 255, 255, 255, 134*o.yScale)
									end
								end
							elseif o.particles == "tentRandom" then
								if math.random() < .09 then                                                                
								   particlexv.max = math.random()*2 - 1--particlexv.max/2
								   if particlexv.max < 0 then 
									   particlexv.max = particlexv.max - 1
								   else
									   particlexv.max = particlexv.max + 1
								   end
									randomParticle = math.random(1,5)
									if randomParticle == 1 then
										Particles:newEmitter(explosions,"objectBounce", version.root .. "/Images/traySticker23.png", 25*o.yScale, 27.5*o.yScale, 1, particleX, particleY, particlexv.min, particlexv.max, -1, 1, 255, 255, 255, 40*o.yScale)
									elseif randomParticle == 2 then
										Particles:newEmitter(explosions,"objectBounce", version.root .. "/Images/traySticker73.png", 26.62*o.yScale, 24.2*o.yScale, 1, particleX, particleY, particlexv.min, particlexv.max, -1, 1, 255, 255, 255, 40*o.yScale)
									elseif randomParticle == 3 then
										Particles:newEmitter(explosions,"objectBounce", version.root .. "/Images/traySticker22.png", 16*o.yScale, 22*o.yScale, 1, particleX, particleY, particlexv.min, particlexv.max, -1, 1, 255, 255, 255, 40*o.yScale)
									elseif randomParticle == 4 then
										Particles:newEmitter(explosions,"objectBounce", version.root .. "/Images/sticker68.png", 31.02*o.yScale, 48.84*o.yScale, 1, particleX, particleY, particlexv.min, particlexv.max, -1, 1, 255, 255, 255, 40*o.yScale)
									elseif randomParticle == 5 then
										Particles:newEmitter(explosions,"objectBounce", version.root .. "/Images/Particles/acorn.png", 13.5*o.yScale, 15*o.yScale, 1, particleX, particleY, particlexv.min, particlexv.max, -1, 1, 255, 255, 255, 40*o.yScale)
									end
								end
							elseif o.particles == "basketRandom" then
								if math.random() < .09 then                                                                
								   particlexv.max = math.random()*2 - 1--particlexv.max/2
								   if particlexv.max < 0 then 
									   particlexv.max = particlexv.max - 1
								   else
									   particlexv.max = particlexv.max + 1
								   end
									randomParticle = math.random(1,5)
									if randomParticle == 1 then
										Particles:newEmitter(explosions,"objectBounce", version.root .. "/Images/traySticker23.png", 25*o.yScale, 27.5*o.yScale, 1, particleX, particleY, particlexv.min, particlexv.max, -1, 1, 255, 255, 255, 100*o.yScale)
									elseif randomParticle == 2 then
										Particles:newEmitter(explosions,"objectBounce", version.root .. "/Images/traySticker73.png", 26.62*o.yScale, 24.2*o.yScale, 1, particleX, particleY, particlexv.min, particlexv.max, -1, 1, 255, 255, 255, 100*o.yScale)
									elseif randomParticle == 3 then
										Particles:newEmitter(explosions,"objectBounce", version.root .. "/Images/traySticker22.png", 16*o.yScale, 22*o.yScale, 1, particleX, particleY, particlexv.min, particlexv.max, -1, 1, 255, 255, 255, 100*o.yScale)
									elseif randomParticle == 4 then
										Particles:newEmitter(explosions,"objectBounce", version.root .. "/Images/sticker68.png", 31.02*o.yScale, 48.84*o.yScale, 1, particleX, particleY, particlexv.min, particlexv.max, -1, 1, 255, 255, 255, 100*o.yScale)
									elseif randomParticle == 5 then
										Particles:newEmitter(explosions,"objectBounce", version.root .. "/Images/Particles/acorn.png", 13.5*o.yScale, 15*o.yScale, 1, particleX, particleY, particlexv.min, particlexv.max, -1, 1, 255, 255, 255, 100*o.yScale)
									end
								end
							elseif o.particles == "bananaTrail" then
									Particles:newEmitter(explosions,"fade", "Images/Particles/banana.png", 20*o.yScale, 20*o.yScale, 1, particleX, particleY, particlexv.min, particlexv.max, -1, 1, 255, 255, 255, 0*o.yScale)
							elseif o.particles == "hearts" then
								Particles:newEmitter(explosions,"fade", "Images/Particles/heart.png", 25*o.yScale, 25*o.yScale, 1, particleX, particleY, particlexv.min, particlexv.max, -1, 1, 255, 255, 255, 0*o.yScale)
							elseif o.particles == "splash" then
								Particles:newEmitter(explosions,"splash", "Images/Particles/bubble.png", 9*o.yScale, 16*o.yScale, 1, particleX+math.random(-30,30), particleY, -7, 7, -10, -1, 255, 255, 255, 0*o.yScale)
							elseif o.particles == "rightsplash" then
								Particles:newEmitter(explosions,"splash", "Images/Particles/bubble.png", 9*o.yScale, 16*o.yScale, 1, particleX+math.random(-30,30), particleY, 2, 7, -10, -1, 255, 255, 255, 0*o.yScale)
							elseif o.particles == "juice" then
								randomSize = math.random(6,20)
								Particles:newEmitter(explosions,"splash", "Images/Particles/bubble.png", randomSize*o.yScale, (randomSize+4)*o.yScale, 2, particleX+math.random(-80,80), particleY+math.random(-40,40), -9, 9, -15, -1, 255, 255, 255, 0*o.yScale)
							elseif o.particles == "puddleSplash" then
								local i
								local darkness = math.random(240,255)
								local randomSize = math.random(4,9)
								-- for i = 1,5 do
								-- randomSize = math.random(4,13)
									Particles:newEmitter(explosions,"puddleSplash", "Images/Particles/water2.png", randomSize*o.yScale, (randomSize+4)*o.yScale, 2, particleX+math.random(-7,7), particleY, -3, 3, -5, -1, darkness, darkness, darkness, math.random(5,16))
								-- end	
							elseif o.particles == "puddleHop" then
								local i
								local darkness = math.random(240,255)
								local randomSize = math.random(4,9)
								-- Particles:newEmitter(explosions,"flutterHop", "Images/Particles/leaf.png", 25/randomSize, 13/randomSize, 2, particleX, particleY, -1, 1.5, -7, -3, 255, 255, 255, math.random(0,6))
							 
									Particles:newEmitter(explosions,"puddleSplash", "Images/Particles/water2.png", randomSize*o.yScale, (randomSize+4)*o.yScale, 2, particleX+math.random(-7,7), particleY, -2, 3, -7, -3, darkness, darkness, darkness, math.random(5,16))
								-- end	
							elseif o.particles == "lilypadSplash" then
								local i
								local darkness = math.random(200,255)
								local randomSize = math.random(4,9)
									Particles:newEmitter(explosions,"lilypadSplash", "Images/Particles/water3.png", randomSize*o.yScale, (randomSize+4)*o.yScale, 2, particleX+math.random(-7,7), particleY, -3, 3, -5, -1, darkness, darkness, darkness, math.random(5,16))			
							
							elseif o.particles == "juiceSmall" then
								randomSize = math.random(3,7)
								Particles:newEmitter(explosions,"splash", "Images/Particles/bubble.png", randomSize*o.yScale, (randomSize+2)*o.yScale, 2, particleX+math.random(-4,4), particleY, -4, 4, -6, -1, darkness, darkness, darkness, math.random(5,12))
							elseif o.particles == "eggShell" then
								-- local darkness = math.random(200,255)
									local randomShellSize = math.random(11,15)/10
									local darkness = math.random(200,255)
									Particles:newEmitter(explosions,"eggExplode", "Images/Particles/eggShell.png", 16*randomShellSize, 16*randomShellSize, 1, particleX+math.random(-7,7), particleY, -3.25, 3, -7, -1, darkness, darkness, darkness, math.random(15,16))
									local randomShellSize = math.random(5,11)/10
									local darkness = math.random(240,255)
									Particles:newEmitter(explosions,"eggExplode", "Images/Particles/eggShell.png", 16*randomShellSize, 16*randomShellSize, 1, particleX+math.random(-7,7), particleY, -3.75, 3.5, -7, -1, darkness, darkness, darkness, math.random(15,16))
							
							elseif o.particles == "eggShellNest" then
								-- local darkness = math.random(200,255)
									local randomShellSize = math.random(7,13)/10
									local darkness = math.random(200,255)
									Particles:newEmitter(explosions,"eggExplodeNest", "Images/Particles/eggShell.png", 16*randomShellSize, 16*randomShellSize, 1, particleX+math.random(-7,7), particleY, -2.2, 2.2, -5.75, -1, darkness, darkness, darkness, math.random(5,11))
								
							elseif o.particles == "mud" then
								--	print("*************create splash particles*************")
									local i
									for i = 1,10 do
										Particles:newEmitter(explosions,"sloMoExplode", "Images/Particles/mud2.png", math.random(20,30), math.random(20,30), 1, particleX+math.random(-30,30), particleY, -4, 4, -6, -1, 255, 255, 255, 0*o.yScale, 5)
									end
							elseif o.particles == "mudSplash" then
								--	print("*************create splash particles*************")
									local i
									local darkness = math.random(200,255)
									local randomMudSize = math.random(4,12)
									-- for i = 1,5 do
										Particles:newEmitter(explosions,"sloMoExplode4", "Images/Particles/mud3.png", randomMudSize, randomMudSize + math.random(1,3), 1, particleX+math.random(-7,7), particleY, -1, 1, -3, -1, darkness, darkness, darkness, math.random(5,12))
									-- end
									-- this is the mud that hits screen and slides down
									
									if math.random() < 0.4 then 
									
										if savedData.enableSounds == true then
											playReservedChannel( mudSounds[math.random(1,3)], currentGameChannel, 0 )
											currentGameChannel = currentGameChannel + 1
											if (currentGameChannel > 25) then
												currentGameChannel = 20
											end
										end
									
										-- Particles:newEmitter(explosions,"delayedFade", "Images/Particles/mud4.png", math.random(90,300), math.random(90,300), 1, math.random(-100,halfW*2+200),  math.random(-100,200+halfH*2), 0, 0, 0, 0, darkness, darkness, darkness)
										-- if savedData.enableSounds == true then
											-- local mudSounds = {"splat1","splat2","splash"} --screen splats after puzzle
											-- playReservedChannel(stickerSounds[mudSounds[math.random(1,3)]], 17, 0)	
										-- end
									end
							elseif o.particles == "mudSplashLess" then
								--	print("*************create splash particles*************")
									local i
									-- local darkness = math.random(200,255)
									-- local randomMudSize = math.random(4,12)
									for i = 1,5 do
										local darkness = math.random(200,255)
										local randomMudSize = math.random(4,12)
										Particles:newEmitter(explosions,"sloMoExplode3", "Images/Particles/mud3.png", randomMudSize, randomMudSize + math.random(1,3), 1, particleX+math.random(-7,7), particleY, -3, 3, -5, -1, darkness, darkness, darkness, math.random(1,10))
									end
									if math.random() < 0.04 then 
									
										if savedData.enableSounds == true then
											playReservedChannel( mudSounds[math.random(1,3)], currentGameChannel, 0 )
											currentGameChannel = currentGameChannel + 1
											if (currentGameChannel > 25) then
												currentGameChannel = 20
											end
										end
									
										-- Particles:newEmitter(explosions,"delayedFade", "Images/Particles/mud4.png", math.random(90,300), math.random(90,300), 1, math.random(-100,halfW*2+200),  math.random(-100,200+halfH*2), 0, 0, 0, 0, darkness, darkness, darkness)
										-- if savedData.enableSounds == true then
											-- local mudSounds = {"splat1","splat2","splash"} --screen splats after puzzle
											-- playReservedChannel(stickerSounds[mudSounds[math.random(1,3)]], 17, 0)	
										-- end
									end
							
							
							
							
							elseif o.particles == "kiteClouds" then
								if math.random()>.86 then
								
									local xMin = screenOriginX - 200 + 30
									local xMax = screenOriginX - 10
									
									local randomItem = math.random( 1, 2 )
									if (randomItem == 1) then
										-- randomSize = math.random(1,2)/6
										-- Particles:newEmitter(explosions,"windLeaves", "Images/Particles/leaf.png", randomSize*180, randomSize*108, 1, math.random(-200,-90), math.random(40,200), 1, 10, -.25, .25, 255, 255, 255, 0*o.yScale)
										
										-- original code
										randomSize = math.random(1,2)/6
										Particles:newEmitter(explosions,"windLeaves", "Images/Particles/leaf.png", randomSize*180, randomSize*108, 1, math.random(xMin,xMax), math.random(40,200), 1, 10, -.25, .25, 255, 255, 255, 0*o.yScale)
										randomSize = math.random(1,2)/6
										Particles:newEmitter(explosions,"windLeaves", "Images/Particles/leaf.png", randomSize*180, randomSize*108, 1, math.random(xMin,xMax), math.random(40,200), 1, 10, -.25, .25, 255, 255, 255, 0*o.yScale)
										randomSize = math.random(1,2)/5
										Particles:newEmitter(explosions,"windLeaves", "Images/Particles/leaf.png", randomSize*180, randomSize*108, 1, math.random(xMin,xMax), math.random(40,200), 1, 10, -.25, .25, 255, 255, 255, 0*o.yScale)
									
										--fewer random calculations version
										-- randomSize = math.random(1,2)/6
										-- Particles:newEmitter(explosions,"windLeaves", "Images/Particles/leaf.png", 31.5, 18.9, 1, math.random(-200,-90), math.random(40,200), 1, 10, -.25, .25, 255, 255, 255, 0*o.yScale)
										-- randomSize = math.random(1,2)/6
										-- Particles:newEmitter(explosions,"windLeaves", "Images/Particles/leaf.png", 55.8, 33.48, 1, math.random(-200,-90), math.random(40,200), 1, 10, -.25, .25, 255, 255, 255, 0*o.yScale)
										-- randomSize = math.random(1,2)/5
										-- Particles:newEmitter(explosions,"windLeaves", "Images/Particles/pineCone.png", 36, 21.6, 1, math.random(-200,-90), math.random(40,200), 1, 10, -.25, .25, 255, 255, 255, 0*o.yScale)
									
									
									else
										-- original code
										randomSize = math.random(1,2)/2.5
										Particles:newEmitter(explosions,"windClouds", "Images/Particles/windCloud.png", randomSize*180, randomSize*108, 1, math.random(xMin,xMax), math.random(40,200), 1, 18, -.25, .25, 255, 255, 255, 0*o.yScale)
										randomSize = math.random(1,2)/2.5
										Particles:newEmitter(explosions,"windClouds", "Images/Particles/windCloud.png", randomSize*180, randomSize*108, 1, math.random(xMin,xMax), math.random(40,200), 1, 18, -.25, .25, 255, 255, 255, 0*o.yScale)
										
										--fewer random calculations version
										-- randomSize = math.random(1,2)/2.5
										-- Particles:newEmitter(explosions,"windClouds", "Images/Particles/bgCloud.png", 90, 54, 1, math.random(-200,-90), math.random(40,200), 1, 18, -.25, .25, 255, 255, 255, 0*o.yScale)
										-- randomSize = math.random(1,2)/2.5
										-- Particles:newEmitter(explosions,"windClouds", "Images/Particles/bgCloud.png", 126, 75.6, 1, math.random(-200,-90), math.random(40,200), 1, 18, -.25, .25, 255, 255, 255, 0*o.yScale)
										
										
										-- Particles:newEmitter(explosions,"windLines", "Images/Particles/windLine.png", math.random(50,300), 1, 1, math.random(-200,-90), math.random(40,200), 1, 18, 0, 0, 255, 255, 255, 0*o.yScale)
										Particles:newEmitter(explosions,"windLines", "Images/Particles/windLine.png", math.random(50,300), 1, 1, math.random(xMin,xMax), math.random(40,200), 1, 18, 0, 0, 255, 255, 255, 0*o.yScale)
										
									end
								end
							elseif o.particles == "snow" then
								randomSize = math.random(4,17)
								Particles:newEmitter(explosions,"snow", "Images/Particles/snowParticle.png", randomSize*o.yScale, randomSize*o.yScale, 1, display.contentCenterX+math.random(-384,384), math.random(-20,-4), -2, 0, 1, 6, 255, 255, 255, 0*o.yScale)
							elseif o.particles == "lick" then
								movingX = movingX + 1.25
								movingY = movingY - 3
								randomSize = math.random(4,12)
								Particles:newEmitter(explosions,"lick", "Images/Particles/whiteParticle.png", randomSize*o.yScale, (randomSize+4)*o.yScale, 1, movingX+math.random(-10,10), movingY, -5, 5, -11, -1, 255, 224, 225, 0*o.yScale)
							
							elseif o.particles == "lickgame" then
								movingX = movingX + 1.25
								movingY = movingY - 3
								randomSize = math.random(4,12)
								Particles:newEmitter(explosions,"lick", "Images/Particles/whiteParticle.png", randomSize*o.yScale, (randomSize+4)*o.yScale, 1, movingX+math.random(-10,10), movingY, -5, 5, -11, -1, 255, 224, 225, 0*o.yScale)
							
							elseif o.particles == "foodSplash" then
								local randomParticleSize = math.random(1,2)+.4
								Particles:newEmitter(explosions,"splash", "Images/Particles/foodMorsel.png", 9/randomParticleSize, 16/randomParticleSize, 1, particleX+math.random(-30,30), particleY, -4, 4, -6, -1, 255, 255, 255, 0*o.yScale)
							elseif o.particles == "sandSplash" then
								randomParticle = math.random(4,22)
								Particles:newEmitter(explosions,"splash", "Images/Particles/confettiParticle.png", randomParticle*o.yScale, randomParticle*o.yScale, 2, particleX+math.random(-30,30), particleY, -7, 7, -10, -1, 255, 255, 255, 0*o.yScale)
								Particles:newEmitter(explosions,"splash", "Images/Particles/sandMorsel.png", randomParticle*o.yScale, randomParticle+3*o.yScale, 1, particleX+math.random(-30,30), particleY, -7, 7, -10, -1, 255, 255, 255, 0*o.yScale)
							elseif o.particles == "flowerPop" then
								randomParticle = math.random(4,22)
								Particles:newEmitter(explosions,"splash", "Images/Particles/confettiParticle.png", randomParticle, randomParticle, 1, particleX, particleY, -3, 3, -6, -1, 255, 255, 255, 0)
								
							elseif o.particles == "balloonPop" then
								randomParticle = math.random(10,50)
								Particles:newEmitter(explosions,"fireworks", "Images/Particles/confettiParticle.png", randomParticle*o.yScale, randomParticle*o.yScale, 2, particleX+math.random(-30,30), particleY-10, -9, 9, -15, -1, 255, 255, 255, 0*o.yScale)
								Particles:newEmitter(explosions,"giftBits", "Images/Particles/balloonPart.png", randomParticle*1.25*o.yScale, randomParticle*1.16*o.yScale, 1, particleX+math.random(-30,30), particleY-10, -9, 9, -15, -1, 255, 255, 255, 0*o.yScale)
							
							elseif o.particles == "bigSplash" then
								Particles:newEmitter(explosions,"splash", "Images/Particles/bubble.png", 18*o.yScale, 32*o.yScale, 1, particleX+math.random(-65,60), particleY+math.random(-50,50), -10, 10, -16, -1, 255, 255, 255, 0*o.yScale)
							elseif o.particles == "teethBrush" then
								Particles:newEmitter(explosions,"splash", "Images/Particles/bubble.png", 9*o.yScale, 16*o.yScale, 1, particleX+math.random(-30,30), particleY, -7, 7, -10, -1, 255, 255, 255, 0*o.yScale)
								randomBubbleSize = math.random(15,40)
								Particles:newEmitter(explosions,"teethBrush", "Images/Particles/bubble.png", randomBubbleSize*o.yScale, randomBubbleSize*o.yScale, 1, particleX+math.random(-20,20), particleY+math.random(-10,10), -.5, .5, -.5, .5, 255, 255, 255, 0*o.yScale)
							elseif o.particles == "bubbles" then
								Particles:newEmitter(explosions,"flutter", "Images/Particles/bubble.png", 25*o.yScale, 25*o.yScale, 1, particleX, particleY, particlexv.min, particlexv.max, -1, 1, 255, 255, 255, 0*o.yScale)
							elseif o.particles == "bubbler" then
								randomBubbleSize = math.random(15,40)
								Particles:newEmitter(explosions,"bubbles", "Images/Particles/bubble.png", randomBubbleSize*o.yScale, randomBubbleSize*o.yScale, 1, particleX, particleY, particlexv.min, particlexv.max, -3, 3, 255, 255, 255, 0*o.yScale)
							elseif o.particles == "birds" then
							   if math.random() < .1 then                                                            
								   Particles:newEmitter(explosions,"spray", "Images/UI/bgBird.png", 101*o.yScale, 62*o.yScale, 1, particleX, particleY, -16, 16, -4, 4, 255, 255, 255, 0*o.yScale)
							   end
						   elseif o.particles == "leaves" then
							   if math.random() < .1 then                                                            
								   Particles:newEmitter(explosions,"flutter", "Images/Particles/leaf.png", 25*o.yScale, 13*o.yScale, 1, particleX, particleY, -3, 3, -6, -1, 255, 255, 255, 2)
							   end
							elseif o.particles == "leaves2" then
							   if math.random() < .8 then  
								   local randomSize = math.random(10,20)/10
								   -- print("RANDOMSIZE "..randomSize)
								   Particles:newEmitter(explosions,"flutter2", "Images/Particles/leaf.png", 25/randomSize, 13/randomSize, 1, particleX, particleY, -2.5, 2.5, -6, -1, 255, 255, 255, math.random(4,18))
								   local randomSize = math.random(10,20)/10
								   Particles:newEmitter(explosions,"flutter2", "Images/Particles/leaf.png", 25/randomSize, 13/randomSize, 1, particleX, particleY, -3, 3, -6, -1, 255, 255, 255, math.random(6,14))
							   end
							elseif o.particles == "buildANest" then
							   if math.random() < .8 then  
								   local randomSize = math.random(10,20)/10
								   -- print("RANDOMSIZE "..randomSize)
								Particles:newEmitter(explosions,"nestDust", "Images/Particles/whiteTransparentParticle.png", math.random(18,28)*o.yScale, math.random(18,28)*o.yScale, 1, particleX+math.random(-10,10), particleY+math.random(-10,10), -5, -5, 0, 0, 255, 255, 255, 0*o.yScale)
								Particles:newEmitter(explosions,"flutter2", "Images/Particles/leaf.png", 25/randomSize, 13/randomSize, 1, particleX, particleY, -3, 3, -6, -1, 255, 255, 255, 100)
								Particles:newEmitter(explosions,"sloMoExplode2", "Images/UI/branch1.png", 25/randomSize, 13/randomSize, 1, particleX, particleY, -3, 3, -4, -1, 255, 255, 255, 100)
								  
							   end   
							elseif o.particles == "leavesHop" then
							   if math.random() < .8 then  
								   local randomSize = math.random(10,20)/10
								   -- print("RANDOMSIZE "..randomSize)
								   
								   Particles:newEmitter(explosions,"flutterHop", "Images/Particles/leaf.png", 25/randomSize, 13/randomSize, 2, particleX, particleY, -1, 1.5, -7, -3, 255, 255, 255, math.random(0,6))
							   end
						    elseif particleType == "moreLeaves" then                                                                  
									Particles:newEmitter(explosions,"flutter", "Images/Particles/leaf.png", 25, 13, 1, particleX, particleY, -4, 4, -2, 4,255, 255, 255, 0)
							elseif particleType == "fluffBurst" then 
								-- particleY = o.ty + (o.particleOffsetY*o.yScale)
								local size = math.random(10,25)
								Particles:newEmitter(explosions,"sloMoExplode2", "Images/Particles/bgCloud.png", size, size, 1, particleX+math.random(-30,30), particleY, -3, 3, -6, -1, 255, 255, 255, math.random(6,14))
							elseif particleType == "leafBurstTree" then 
								Particles:newEmitter(explosions,"sloMoExplode2", "Images/Particles/leaf.png", 25, 13, 1, particleX+math.random(-30,30), particleY, -3, 3, -6, -1, 255, 255, 255, o.particleDistToGround)
							elseif particleType == "leafBurstBush" then 
								-- particleY = o.ty + (o.particleOffsetY*o.yScale)
								Particles:newEmitter(explosions,"sloMoExplode2", "Images/Particles/leaf.png", 25, 13, 1, particleX+math.random(-30,30), particleY, -3, 3, -6, -1, 255, 255, 255, 5)
	
							elseif o.particles == "heartsFloat" then
							    randomSize = math.random(5,35)                                                      
								Particles:newEmitter(explosions,"flutter", "Images/Particles/heart.png", randomSize*o.yScale, randomSize*o.yScale, 1, particleX+4, particleY-30, -2, 4, -6, 0, 255, 255, 255, 0*o.yScale)
							elseif o.particles == "monkeys" then
							   if math.random() < .05 then 
									Particles:newEmitter(explosions,"bounce", "Images/Particles/elephantMonkeyMid.png", 89*o.yScale, 71*o.yScale, 1, particleX, particleY, -8, 8, -2, 6, 255, 255, 255, 0*o.yScale)
							   end
						   elseif o.particles == "notes" then
							   if math.random() < .1 then 
									Particles:newEmitter(explosions,"notes", "Images/Particles/note.png", 35*o.yScale, 35*o.yScale, 1, particleX, particleY, -3,3, -3, 3, 30, 30, 30, 0*o.yScale)
							   end
							end
					
					
							if (o.particleDuration and itemsToAnimate[i].animPrevTime-o.startTime > o.particleDuration) then
								print("reset to 0")
								o.particleDuration = 0
							end
						
						end
						
					end
			end
	end
	--cloud.update(itemsToAnimate[i].tDelta) 

	
	if (#itemsToAnimate == 0) then
		Runtime:removeEventListener( "enterFrame", animateActorsItemAnimations)
	end

end


function startNone(target,duration) 
	--Initialize		
	--print("init float")
	target.animation = ""
	target.startTime = system.getTimer()
	if target.ty == 0 then 
		-- target.ty = target.initY
		-- target.tx = target.initX
	end			
	if target.animTime == 0 then
		target.frame = 0
		target.animTime = duration
	end
	
	
end	

function startFloat(target,duration) 
	--Initialize		
	--print("init float")
	-- target.animation = "float"
	target.startTime = system.getTimer()
	
	if target.ty == 0 then 
		target.ty = target.initY
		target.tx = target.initX
	end			
	if target.animTime == 0 then
		target.frame = 0
		target.animTime = duration
	end
	
	
end	

function startBalloon(target,duration) 
	--Initialize		
	--print("init balloon")
	target.animation = "balloon"
	target.yv=0
	target.xv=0
	if target.animTime == 0 then 
		target.startTime = system.getTimer()
		target.sv=.01
		target.animTime = duration
		target.ty = target.initY
		target.tx = target.initX
		target.tr = target.rotation
		target.trackScale = 1
	else				
		target.sv = target.sv + .01	
		target.startTime = system.getTimer()
	end			
end	

function startSpringy(target,duration) 
	--Initialize		
	--print("init balloon")
	target.animation = "springy"
	if target.animTime == 0 then 
		target.startTime = system.getTimer()
		target.sv=.01
		target.animTime = duration
		target.ty = target.initY
		target.tx = target.initX
		target.tr = target.rotation
		target.trackScale = 1
	else				
		target.sv = target.sv + .01	
		target.startTime = system.getTimer()
	end			
end	

function startToyBox(target,duration) 
	--Initialize		
	--print("init balloon")
	
	if target.animTime == 0 then 
		target.startTime = system.getTimer()
		target.sv=-.01
		target.animTime = duration
		target.ty = target.initY
		target.tx = target.initX
		target.tr = target.rotation
		target.trackScale = 0.5
	else				
		target.sv = target.sv - .01	
		target.startTime = system.getTimer()
	end			
end	

function startHop(target,duration) 
	--Initialize		
	--print("init hop")
	target.animation = "hop"
	-- target.bounce = true
	-- target.bouncePause = false
	target.xv = 0
	target.yv=0
	
	if target.animTime == 0 then 
		target.startTime = system.getTimer()
		target.yv=-.3
		target.animTime = duration
		target.ty = target.initY
		target.tx = target.initX
		target.tr = target.rotation
	else
		if math.abs(target.ty-target.y) < 10 then 
			if math.abs(target.yv) < .3 then
				target.yv = .3 * math.abs(target.yv)/target.yv
			end
		end				
		target.startTime = system.getTimer()
	end			
end	

function startJumpToPos(target,duration)

	target.animation = "jumptopos"
	-- target.bounce = true
	-- target.bouncePause = false
	target.xv = 0
	target.yv = 0
	
	target.frame = 0
	
	local distance = math.abs(target.initX - target.startX) / 100
	local dur = duration / 1000
	print("jumptopos")
	
	-- if target.animTime == 0 then 
		target.startTime = system.getTimer()
		target.yv=(-.07)/dur
		target.xv=(.1*distance)/dur
		target.animTime = duration
		target.ty = target.initY
		target.tx = target.initX
		target.tr = target.rotation
		
		target.animY = target.y
	-- else
		-- if math.abs(target.ty-target.y) < 10 then 
			-- if math.abs(target.yv) < .05 then
				-- target.yv = .05 * math.abs(target.yv)/target.yv
			-- end
		-- end				
		-- target.xv=.1
		-- target.startTime = system.getTimer()
	-- end	

end

function startFloatToPos(target,duration)

	target.animation = "floattopos"
	-- target.bounce = true
	-- target.bouncePause = false
	target.xv = 0
	target.yv = 0
	
	target.frame = 0
	
	local distance = math.abs(target.initX - target.startX) / 100
	local dur = duration / 1000
	print("floattopos")
	
	-- if target.animTime == 0 then 
		target.startTime = system.getTimer()
		target.yv=(-.07)/dur
		target.xv=(.1*distance)/dur
		target.animTime = duration
		target.ty = target.initY
		target.tx = target.initX
		target.tr = target.rotation
		
		target.animY = target.y
	-- else
		-- if math.abs(target.ty-target.y) < 10 then 
			-- if math.abs(target.yv) < .05 then
				-- target.yv = .05 * math.abs(target.yv)/target.yv
			-- end
		-- end				
		-- target.xv=.1
		-- target.startTime = system.getTimer()
	-- end	

end

function startGiftBounce(target,duration) 
	--Initialize		
	--print("init hop")
	target.animation = "giftBounce"
	target.giftBounce = true
	target.giftBouncePause = false
	
	target.giftDropHeight = math.abs(target.bounceY - target.startY)
	
	local function scaleBack()
		local function bounceUp()
		
			if target.animTime == 0 then 
				target.startTime = system.getTimer()
				target.yv=-.65-- -0.6
				target.animTime = duration
				target.ty = target.initY
				target.tx = target.initX
				target.tr = target.rotation
			else
				if math.abs(target.ty-target.y) < 10 then 
					if math.abs(target.yv) < .3 then
						target.yv = .3 * math.abs(target.yv)/target.yv
					end
				end				
				target.startTime = system.getTimer()
			end		
		
		end
		transition.to( target, { time = 25, xScale = 1, yScale = 1, onComplete = bounceUp } )
	end
	transition.to( target, { time = 25, xScale = 1.075, yScale = 0.925, onComplete = scaleBack } ) --was time = 100, xScale = 1.2, yScale = 0.8
	
	
end	

function startShake(target,duration) 
	--Initialize		
	--print("init shake")
	target.animation = "shake"
	if target.animTime == 0 then 
		target.startTime = system.getTimer()
		target.rv=-.4
		target.animTime = duration
		target.tr = target.rotation
		target.ty = target.initY
		target.tx = target.initX
		target.yv = 0
	else				
		if math.abs(target.rv) < .4 then
			target.rv = .4 * math.abs(target.rv)/target.rv
		end				
		target.startTime = system.getTimer()
	end			
end	

function startBasketShake(target,duration) 
	--Initialize		
	--print("init shake")
	target.animation = "shake"
	if target.animTime == 0 then 
		target.startTime = system.getTimer()
		target.rv=-.2
		target.animTime = duration
		target.tr = target.rotation
		target.ty = target.initY
		target.tx = target.initX
		target.yv = 0
	else				
		if math.abs(target.rv) < .2 then
			target.rv = .2 * math.abs(target.rv)/target.rv
		end				
		target.startTime = system.getTimer()
	end			
end	

function startRustle(target,duration,x,y) 
	--Initialize		
	--print("init rustle ")
	local dx = 1
	local dy = 1
	target.animation = "rustle"
	if target.animTime == 0 then 
		target.tr = target.rotation
		target.ty = target.initY
		target.tx = target.initX
	end
	target.startTime = system.getTimer()
	if duration < 1 then 
		duration = 1
	end
	if (x-target.x) > 0 then 
		dx = -1
	end
	if (y-target.y) > 0 then 
		dy = -1
	end
	target.animTime = duration
	
	target.xv = math.random()/2*dx
	target.yv = math.random()/2*dy
	target.rv = .4*(math.random()/2-.5)
end

function startSmallRustle(target,duration,x,y) 
        local dx = 1
        local dy = 1
        --Initialize		
        --print("init rustle ")
        target.animation = "smallrustle"
        if target.animTime == 0 then 
                target.tr = target.rotation
                target.ty = target.y
                target.tx = target.x
        end
        target.startTime = system.getTimer()
        if duration < 1 then 
                        duration = 1
        end
        if (x-target.x) > 0 then 
                        dx = -1
        end
        if (y-target.y) > 0 then 
                        dy = -1
        end
        target.animTime = duration

        target.xv = math.random()*dx
        target.yv = math.random()*dy
        target.rv = .4*(math.random()-.5)

end

function startWalk(direction,target,duration) 
	--Initialize		
	--print("init walk "..direction)
	target.animation = direction
	if target.animTime == 0 then 
		target.startTime = system.getTimer()
		if duration < 1 then 
			duration = 1
		end
		target.animTime = duration
		target.xv = 1400/duration
		target.yv=-.3
		target.ty = target.initY
		target.tx = target.initX
		if direction == "walkleft" or direction == "walkleftloop" then 
			target.xv = -target.xv
		end
		--print("xv:"..target.xv)			
	end			
end

function startWaddle(direction,target,duration) 
	target.animation = direction
	if target.animTime == 0 then 
		target.startTime = system.getTimer()
		if duration < 1 then 
			duration = 1
		end
		
		target.rv=-.4
		target.animTime = duration
		target.xv = 1400/duration
		target.tr = target.rotation
		target.ty = target.initY
		target.tx = target.initX
		target.yv = 0
		target.frame = 0
		if direction == "waddleleft" or direction == "waddleleftloop" then 
			target.xv = -target.xv
		end
	else				
		if math.abs(target.rv) < .4 then
			target.rv = .4 * math.abs(target.rv)/target.rv
		end				
		target.startTime = system.getTimer()
	end	
end

function startDart(direction,target,duration) 
	--Initialize		
	--print("init walk "..direction)
	target.animation = direction
	if target.animTime == 0 then 
		target.startTime = system.getTimer()
		if duration < 1 then 
			duration = 1
		end
		target.animTime = duration
		target.xv = 1400/duration
		--target.yv=-.3
		target.ty = target.initY
		target.tx = target.initX
		if direction == "dartleft" or direction == "dartleftloop" then 
			target.xv = -target.xv
		end
		--print("xv:"..target.xv)			
	end			
end

function startFlying(direction,target,duration) 
	--Initialize		
	--print("init flying "..direction)
	target.animation = direction
	if target.animTime == 0 then 
		target.startTime = system.getTimer()
		if duration < 1 then 
			duration = 1
		end
		target.animTime = duration
		target.xv = 1400/duration
		target.frame = 1000
		target.ty = target.initY - 12
		target.tx = target.initX
		if direction == "flyleft" or direction == "flyleftloop" or direction == "flyleftup" then 
			target.xv = -target.xv
		end
		--print("xv:"..target.xv)			
	end			
end

function startFlying2(direction,target,duration) 
	--Initialize		
	--print("init flying "..direction)
	target.animation = direction
	if target.animTime == 0 then 
		target.startTime = system.getTimer()
		if duration < 1 then 
			duration = 1
		end
		target.animTime = duration
		target.xv = 1400/duration
		target.frame = 0
		target.ty = target.initY
		target.tx = target.initX
		if direction == "flyleft2" or direction == "flyleftloop2" then 
			target.xv = -target.xv
		end
		--print("xv:"..target.xv)			
	end			
end

function startFlyUp(direction,target,duration) 
	--Initialize		
	--print("init flying "..direction)
	target.animation = direction
	if target.animTime == 0 then 
		target.startTime = system.getTimer()
		if duration < 1 then 
			duration = 1
		end
		target.animTime = duration
		target.yv = -1400/duration
		target.frame = 0
		target.ty = target.initY
		target.tx = target.initX
		if direction == "flydown" or direction == "flydownloop" then 
			target.yv = -target.yv
		end
		--print("xv:"..target.xv)			
	end			
end
