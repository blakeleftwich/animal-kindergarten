-- Animation & visual effects extracted from game.lua
local myData = require("Scripts.myData")

function bgGameAnimations(event)


	-- Cars
	
	carFrame = carFrame + 1
	for i = #carsBack, 1, -1 do
		if (carsBack[i]) then
			carsBack[i].y = carsBack[i].initY
			carsBack[i].y = carsBack[i].y + .4 * math.sin(carFrame/.023)
		end
	end

	for i = #carsFront, 1, -1 do
		if (carsFront[i]) then
			carsFront[i].y = carsFront[i].initY
			carsFront[i].y = carsFront[i].y + .4 * math.sin(carFrame/.023)
		end
	end
	
	
	if (#carsBack > 0) then
		local randomCar = math.random( 1, 3 )
		if (carsBack[randomCar] and carsBack[randomCar].isSmokeParticles == 1) then
			Particles:newEmitter(dustGroupBack,"dust", "Images/UI/dust.png", math.random(18,28)/1.5, math.random(18,28)/1.5, 1, carsBack[randomCar].x + 20 + math.random(-12,12), carsBack[randomCar].y -30 + math.random(12,24), -4, -6.2, 1.15, 1.4, 255, 255, 255)
		end
	elseif (#carsFront > 0) then
		local randomCar = math.random( 1, 3 )
		if (carsFront[randomCar] and carsFront[randomCar].isSmokeParticles == 1) then
			Particles:newEmitter(dustGroupFront,"dust", "Images/UI/dust.png", math.random(18,28)/1.25, math.random(18,28)/1.25, 1, carsFront[randomCar].x - 20 + math.random(-12,12), carsFront[randomCar].y -30 + math.random(12,24), -4, -6.2, 1.15, 1.4, 255, 255, 255)
		end
	end
	





	-- Plane

	-- if (bgPlane.animTime <= 0) then
		-- bgPlane.animTime = bgPlane.animTime - 1
		-- if (bgPlane.animTime <= -bgPlane.timeToAnimation) then
			-- bgPlane.timeToAnimation = math.random(500, 700)
			-- startFlying(bgPlane.animation, bgPlane, bgPlane.duration)
		-- end
	-- end

	
	
	local o = bgPlane

	o.ts = 0
	if (o.animPrevTime == 0 ) then 
		o.animPrevTime = event.time - 10	
	end

	o.tDelta = event.time - o.animPrevTime
	o.animPrevTime = event.time 
	o.tRatio = 30/o.tDelta
	
	if o.animation and o.animTime > 0 and o.alpha == 1 then
			o.y = o.y + (o.yv*o.tDelta)
			o.x = o.x + (o.xv*o.tDelta)		
			if o.rv ~= 0 then 
				if o.animation == "waddleright" then
					o.rotation = o.rotation - (o.rv*o.tDelta)
				else
					o.rotation = o.rotation + (o.rv*o.tDelta)
				end
			end
			if o.sv ~= 0 then 
					o.ts = o.trackScale + (o.sv*o.tDelta)
					if o.ts < 0.1 then 
						o.ts = 0.1
					--elseif o.ts > 1.6 then 
					--   o.ts = 1.6
					end
					o.trackScale = o.ts
					o.xScale = o.ts*o.targetScale.x
					o.yScale = o.ts*o.targetScale.y
			end

			if (o.animPrevTime-o.startTime > o.animTime) then
					--print("rel")
					
					o.anchorX = 0.5
					o.anchorY = 0.5
					o.y = o.ty
					o.x = o.tx
					o.yv = 0
					o.animTime = 0
					o.rotation = 0
					o.rv = 0
					o.xScale = o.xScale
					o.yScale = o.yScale
					o.ty = o.y
					o.tx = o.x
					o.frame = 0
					
			else
				local particleX
				local particleY
				
				if (o.xScale > 0) then
					particleX = o.x + (o.particleOffsetX*o.yScale)
					particleY = o.y + (o.particleOffsetY*o.yScale)
				else
					particleX = o.x - (o.particleOffsetX*o.yScale)
					particleY = o.y + (o.particleOffsetY*o.yScale)
				end
			
					if o.animation == "flyleft" then 
							if o.x < -200 then 
								o.x = 700
							end
							o.frame = o.frame + 1
							o.y = o.ty + 30 * math.sin(o.frame/20)

					elseif o.animation == "flyright" then 
							if o.x > 700 then 
								o.x = -200
							end
							o.frame = o.frame + 1
							o.y = o.ty + 30 * math.sin(o.frame/20)
					end

					local particlexv = {min=-1,max=1}
					if o.xv > 0 then 
						particlexv = {min=-6,max=-3}
					elseif o.xv < 0 then 
						particlexv = {min=3,max=6}
					end
					if o.particles == "" then                                                            
					elseif o.particles == "smoke" then
						-- Particles:newEmitter(dustGroupBack,"fade", "Images/UI/puff.png", 50*o.yScale/1.65, 50*o.yScale/1.65, 1, particleX, particleY, particlexv.min, particlexv.max, -1, 1, 255, 255, 255, 0*o.yScale)
					end
			end
	end
	
	
	
	if (dustGroupBack) then
		dustGroupBack:toFront()
	end
	if (carGroupBack) then
		carGroupBack:toFront()
	end
	if (dustGroupFront) then
		dustGroupFront:toFront()
	end
	if (carGroupFront) then
		carGroupFront:toFront()
	end
	if (bgPlane) then
		bgPlane:toFront()
	end
	if (questionText) then
		questionText:toFront()
	end
	if (questionTextTwo) then
		questionTextTwo:toFront()
	end
	if (howManyBackground) then
		howManyBackground:toFront()
	end
	if (howManyGroup) then
		howManyGroup:toFront()
	end
	if (equationGroup) then
		equationGroup:toFront()
	end
	if (equationComplexGroup) then
		equationComplexGroup:toFront()
	end
	if (dotsGroup) then
		dotsGroup:toFront()
	end
	if (cardGroup) then
		cardGroup:toFront()
	end
	if (cursor) then
		cursor:toFront()
	end
	if (explosions) then
		explosions:toFront()
	end
	
	if (bgWhite) then
		bgWhite:toFront()
	end
	if (bgWhiteTwo) then
		bgWhiteTwo:toFront()
	end
	if (speechBubble) then
		speechBubble:toFront()
	end
	if (jill) then
		jill:toFront()
	end
	if (instructions) then
		instructions:toFront()
	end
	
end

function startFlying(direction,target,duration) 
	--Initialize		
	--print("init flying "..direction)
	target.animation = direction
	if target.animTime <= 0 then 
		target.startTime = system.getTimer()
		if duration < 1 then 
			duration = 1
		end
		target.animTime = duration
		target.xv = 900/duration
		target.frame = 0
		target.ty = target.y
		target.tx = target.x
		if direction == "flyleft" then 
			target.xv = -target.xv
		end
		--print("xv:"..target.xv)			
	end			
end


function removeCar( groupObj )

	for i = #carsFront, 1, -1 do
		if (carsFront[i] == groupObj) then
			table.remove( carsFront, i )
		end
	end
	for i = #carsBack, 1, -1 do
		if (carsBack[i] == groupObj) then
			table.remove( carsBack, i )
		end
	end

	-- for i = groupObj.numChildren, 1, -1 do
		-- groupObj[i]:removeSelf()
		-- groupObj[i] = nil
	-- end
	
	if (groupObj) then
		groupObj:removeSelf()
		groupObj = nil
	end

end

function addCars()

	local randomDirection = math.random( 1, 2 )
	local isSmokeParticles = math.random( 1, 3 )
	
	
	
	-- local randomVehicle = math.random( 1, #vehicles )
	
	local car = display.newImageRect("Images/UI/" .. vehicles[currentVehicle].name .. ".png", vehicles[currentVehicle].w, vehicles[currentVehicle].h )
	
	
	car.anchorX, car.anchorY = 0.5, 1
	
	car.isSmokeParticles = isSmokeParticles
	
	if (randomDirection == 1) then
		carsBack[#carsBack+1] = car
		carsBack[#carsBack].x = screenEdgeX + 40
		if (#carsBack >= 2 and carsBack[#carsBack-1] and carsBack[#carsBack-1].x > screenEdgeX) then
			carsBack[#carsBack].x = carsBack[#carsBack-1].x + 45
		end
		carsBack[#carsBack].xScale, carsBack[#carsBack].yScale = 0.8, 0.8
		carsBack[#carsBack].y = halfH + 177 + vehicles[currentVehicle].offsetY
		carsBack[#carsBack].initY = carsBack[#carsBack].y
		carsBack[#carsBack].carTrans = transition.to( carsBack[#carsBack], { time=math.random(carSpeedMin, carSpeedMax), x = screenOriginX - 40, onComplete=removeCar } )
		carGroupBack:insert( car )
	else
		carsFront[#carsFront+1] = car
		carsFront[#carsFront].x = screenOriginX - 40
		if (#carsFront >= 2 and carsFront[#carsFront-1] and carsFront[#carsFront-1].x < screenOriginX) then
			carsFront[#carsFront].x = carsFront[#carsFront-1].x - 45
		end
		carsFront[#carsFront].y = halfH + 197 + vehicles[currentVehicle].offsetY
		carsFront[#carsFront].initY = carsFront[#carsFront].y
		carsFront[#carsFront].xScale = -1
		carsFront[#carsFront].carTrans = transition.to( carsFront[#carsFront], { time=math.random(carSpeedMin, carSpeedMax), x = screenEdgeX + 40, onComplete=removeCar } )
		carGroupFront:insert( car )
	end
	
	
	for i = #carsFront, 1, -1 do
		if (carsFront[i]) then
			carsFront[i]:toFront()
		end
	end
	
	
	currentVehicle = currentVehicle + 1
	if (currentVehicle > #vehicles) then
		currentVehicle = 1
	end
	


end



function pathAnimDone(target)

	-- print ("Waypoint has been added here")
	
	-- print ("Waypoint is now " .. currentWaypoint)

end

function worldStarFloat()

	worldStar.frame = worldStar.frame + 1
	worldStar.y =  worldStar.initY + floatRangeStar * math.sin(worldStar.frame/30)

end


function countTime(event) 
	timeToComplete = timeToComplete + 1
	
	if (gameplayMode == 1 and automaticPeek == true and timeToComplete == timeBeforePeek[layout] and gameplayMatch ~= 15) then
		wiggle()
		timeToComplete = 0
	end
	
	if (gameplayMode == 2 and automaticPeek == true and timeToComplete == timeBeforePeek[layout]) then
		
		if (showAllCards == false) then
			if (showAgainTimer) then
				timer.cancel( showAgainTimer )
				showAgainTimer = nil
			end
			if (flipAgainTimer) then
				timer.cancel( flipAgainTimer )
				flipAgainTimer = nil
			end
			flipOne()
			timeToComplete = 0
		end
	end
	
	
end 

function cardWinHop( cardOne, cardTwo )

	local function cardWinHop2()
	
		local function removeCards()
		
			
			if savedData.enableSounds == true then
				playReservedChannel(explodeSound, 15, 0)
			end
		
		
			cardX1, cardY1 = cardOne:localToContent( 0, 0 )
			cardX2, cardY2 = cardTwo:localToContent( 0, 0 )
		
			Particles:newEmitter(explosions,"fireworks", "Images/starParticle.png", 32, 32, 10, cardX1, cardY1, -4, 4, -16, 6, 252,234,27)--altRgb[1], altRgb[2], altRgb[3])
			Particles:newEmitter(explosions,"fireworks", "Images/starParticle.png", 32, 32, 10, cardX2, cardY2, -4, 4, -16, 6, 252,234,27)--altRgb[1], altRgb[2], altRgb[3])
		
			if (gameplayOptions ~= 4) then
				cardOne.alpha = 0
				cardTwo.alpha = 0
				
				if (cardOne.shadow) then
					cardOne.shadow.alpha = 0
				end
				if (cardTwo.shadow) then
					cardTwo.shadow.alpha = 0
				end
				
				if (cardOne.textGroup) then
					cardOne.textGroup.alpha = 0
				end
				if (cardTwo.textGroup) then
					cardTwo.textGroup.alpha = 0
				end
				
				
				if (gameplayOptions == 2) then
					cards[chosen[3]].alpha = 0
				end
			end

			-- table.remove(chosen,1)
			-- table.remove(chosen,1)
			-- if (gameplayOptions == 2) then
				-- table.remove(chosen,1)
			-- end
			
			sequenceNum = sequenceNum + 1
			correctNum = correctNum + 1
			
			if (correctNum == totalPairs) then
			
				if (myData.isController) then
					Runtime:removeEventListener( "key", MatchingTap )
				elseif (myData.isFireTV) then
					Runtime:removeEventListener( "onFTVKey", MatchingTap )
				end
			
				Runtime:removeEventListener( "enterFrame", countTime )
				
				if (automaticPeekTimer) then
					timer.cancel(automaticPeekTimer)
				end
				
				if savedData.enableSounds == true then
					if (reward == 3) then
						--playReservedChannel(crowdAmazedSound, 15, 0)
					else
						playReservedChannel(shortClapSound, 21, 0)
					end
				end
				-- if savedData.enableMusic == true then
					-- if ( reward == 0 ) then
						-- audio.setVolume( 1, { channel=2 } )
					-- elseif (reward == 1) then
						-- audio.setVolume( 1, { channel=3 } )
					-- elseif (reward == 2) then
						-- audio.setVolume( 1, { channel=4 } )
					-- end
				-- end
				
				print("win!")
				
				table.remove(levelOrder,1)
				
				local function hideQuestion()
					questionText.alpha = 0
					questionTextTwo.alpha = 0
				end
				transition.to( questionText, { time=700, alpha = 0, transition=easing.outExpo, onComplete = hideQuestion } )
				transition.to( questionTextTwo, { time=700, alpha = 0, transition=easing.outExpo } )
				goodJobSequence()
				--timer.performWithDelay(900, goodJobAnimation1, 1)
				--timer.soundPerformWithDelay( 900-soundDelay, playSoundTimer, { sound=goodJobSound, reservedChannel=8, loopNumber=0 } )
				
				if (gameplayOptions == 4) then
					for i = 1, #cards do
						cards[i].alpha = 0
					end
				end
				
				
			else
			
				if (isClassicMode == false) then
					table.remove(showMeSelectOptions, 1)
					table.remove(showMeSelectOptions, 1)
					table.remove(showMeSelectOptionsPlural, 1)
					table.remove(showMeSelectOptionsPlural, 1)
					
					playingFirstPartShowMe = false
					changeShowMeQuestion(false)
					
					function playInstructionsDelay()
						playInstructionsAudio(false)
					end
					if (questionAudioTimer) then
						timer.cancel( questionAudioTimer )
						questionAudioTimer = nil
					end
					
					-- Timer for Now Touch The
					if (cardOptions.category ~= "numbersToGroups") then
						questionAudioTimer = timer.performWithDelay( 0, playInstructionsDelay )
					end
				end
			
				if (myData.isFireTV or myData.isController) then 
					timer.performWithDelay( 100, showCursor )
				end
				
			end
			
		end
		
		transition.to( cardOne, { time=150 , y=cardOne.y + 25, transition=easing.inExpo } )
		transition.to( cardTwo, { time=150 , y=cardTwo.y + 25, transition=easing.inExpo, onComplete=removeCards } )
	
		if (cardOne.textGroup) then
			transition.to( cardOne.textGroup, { time=150 , y=cardOne.y + 25 + cardOne.textGroup.offsetY, transition=easing.inExpo } )
		end
		if (cardTwo.textGroup) then
			transition.to( cardTwo.textGroup, { time=150 , y=cardTwo.y + 25 + cardTwo.textGroup.offsetY, transition=easing.inExpo } )
		end
	
	
		if (cardOne.shadow) then
			transition.to( cardOne.shadow, { time=150 , y=cardOne.y + 25 + shadowOffsetY, transition=easing.inExpo } )
		end
		if (cardTwo.shadow) then
			transition.to( cardTwo.shadow, { time=150 , y=cardTwo.y + 25 + shadowOffsetY, transition=easing.inExpo } )
		end
	end

	if savedData.enableSounds == true then
		playReservedChannel(cardHopSound, 16, 0)
	end
	
	transition.to( cardOne, { time=150 , y=cardOne.y - 20, transition=easing.outExpo } )
	transition.to( cardTwo, { time=150 , y=cardTwo.y - 20, transition=easing.outExpo, onComplete=cardWinHop2} )

	if (cardOne.textGroup) then
		transition.to( cardOne.textGroup, { time=150 , y=cardOne.y - 20 + cardOne.textGroup.offsetY, transition=easing.outExpo } )
	end
	if (cardTwo.textGroup) then
		transition.to( cardTwo.textGroup, { time=150 , y=cardTwo.y - 20 + cardTwo.textGroup.offsetY, transition=easing.outExpo } )
	end
	
	
	if (cardOne.shadow) then
		transition.to( cardOne.shadow, { time=150 , y=cardOne.y - 20 + shadowOffsetY, transition=easing.outExpo } )
	end
	if (cardTwo.shadow) then
		transition.to( cardTwo.shadow, { time=150 , y=cardTwo.y - 20 + shadowOffsetY, transition=easing.outExpo } )
	end
	
	if (correctNum+1 == totalPairs) then
		--wiggleAnimation()
	end
	
end

function cardFloat( event )

	for i = #floaters, 1, -1 do
		for j = #cards, 1, -1 do
			if (floaters[i] == cards[j].id) then
				cards[j].frame = cards[j].frame + 1
				cards[j].y =  cards[j].initY + floatRange * math.sin(cards[j].frame/30)
				cards[j].rotation = cards[j].rotation + rotationRange * math.cos(cards[j].frame/rotationRate)
			
				if (cards[j].textGroup) then
					cards[j].textGroup.y = cards[j].y + cards[j].textGroup.offsetY
					cards[j].textGroup.rotation = cards[j].rotation
				end
				if (cards[j].shadow) then
					cards[j].shadow.x = cards[j].x + shadowOffsetX
					cards[j].shadow.y = cards[j].y + shadowOffsetY
					cards[j].shadow.rotation = cards[j].rotation
				end
			end
		end
	end

	-- floater.frame = floater.frame + 1
	-- floater.y = floaterYPosition + floatRange * math.sin(floater.frame/30)
	-- floater.rotation = floater.rotation + rotationRange * math.cos(floater.frame/rotationRate)
end

function animateActors(event) 
    local ts = 0
    if (animPrevTime == 0 ) then 
		animPrevTime = event.time - 10	
    end
    local tDelta = event.time - animPrevTime
    animPrevTime = event.time 
    local tRatio = 30/tDelta
    local o = wiggler					
    if o and o.animTime > 0 and o.y then
        o.y = o.y + (o.yv*tDelta)
        o.x = o.x + (o.xv*tDelta)		
        if o.rv ~= 0 then 
            o.rotation = o.rotation + (o.rv*tDelta)
        end
        if o.sv ~= 0 then 
            ts = o.trackScale + (o.sv*tDelta)
            if ts < 0.1 then 
                ts = 0.1
            end
            o.trackScale = ts
            o.xScale = ts*o.targetScale.x
            o.yScale = ts*o.targetScale.y
        end
        if (animPrevTime-o.startTime > o.animTime) then
            o.y = o.ty
            o.x = o.tx
            o.yv = 0
            o.animTime = 0
            o.rotation = o.tr
            o.rv = 0
            o.xScale = o.targetScale.x
            o.yScale = o.targetScale.y
        else
			o.rv = (tRatio*.5*o.rv) - (.005*(o.rotation - o.tr))
        end
		if (o.textGroup) then
			o.textGroup.rotation = o.rotation
		end
	
	
		if (o.shadow) then
			o.shadow.rotation = o.rotation
		end
	else
		Runtime:removeEventListener( "enterFrame", animateActors)
	end
end

function startWiggle(target,duration) 
	wiggler = target
	animPrevTime = 0
	target.displayScale = 1
	target.tx = 0
	target.ty = 0
	target.tr = 0
	target.ts = 1
	target.xv = 0
	target.yv = 0
	target.rv = 0
	target.sv = 0
	target.rotation = 0
	target.startTime = 0
	target.animTime = 0
	target.targetScale = {x=1, y=1}
	if target.animTime == 0 then 
		target.startTime = system.getTimer()
		target.rv=-.4
		target.animTime = duration
		target.tr = target.rotation
		target.ty = target.y
        target.tx = target.x
		target.yv = 0
	else				
		if math.abs(target.rv) < .4 then
			target.rv = .4 * math.abs(target.rv)/target.rv
		end				
		target.startTime = system.getTimer()
	end	
	Runtime:addEventListener( "enterFrame", animateActors)
end	

function wiggle ()

	-- if savedData.enableSounds == true then
		-- playReservedChannel(wiggleSound, 17, 0)
	-- end

	local hasBeenSelected = false
	local randomCard

	repeat
		randomCard = math.random(1, #cards)
		hasBeenSelected = false
		
		for j = #chosen, 1, -1 do
			if cards[randomCard] == chosen[j] then
				hasBeenSelected = true
			end
		end
	until hasBeenSelected == false and cards[randomCard].alpha ~= 0 and prevWiggle ~= randomCard
	
	-- startWiggle(cards[randomCard],700)
	prevWiggle = randomCard
	
end
