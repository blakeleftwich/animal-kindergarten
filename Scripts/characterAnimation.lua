


function animateObject(event)
	animated.frame = animated.frame + 1
	if animated.frame == 77 and waving then
		transition.to( rightArm, { time=800, rotation = 89, transition=easing.inExpo } )
		waving = false
	end
	if animated.frame == 127 and rightArm == rightArm1 then
		rightArm2.x = legs.x + 60
		rightArm2.y = legs.y - rightArm2Y
		rightArm2.alpha = 1
		rightArm = rightArm2
		rightArm1.alpha = 0
	end
	animated.y = animatedYPosition + charFloatRange * math.sin(animated.frame/30)
	animated.rotation = animated.rotation + charRotationRange * math.sin(animated.frame/charRotationRate)
	torso.xScale = torso.xScale + .0003 * math.sin(animated.frame/45)
	torso.yScale = torso.yScale + .0003 * math.sin(animated.frame/45)
	head.xScale = head.xScale - .0001 * math.sin(animated.frame/45)
	head.yScale = head.yScale - .0001 * math.sin(animated.frame/45)
	-- hat.xScale = hat.xScale - .0001 * math.sin(animated.frame/45)
	-- hat.yScale = hat.yScale - .0001 * math.sin(animated.frame/45)
	eyelids.xScale = eyelids.xScale - .0001 * math.sin(animated.frame/45)
	eyelids.yScale = eyelids.yScale - .0001 * math.sin(animated.frame/45)
	leftArm.y = leftArm.y - .035 * math.sin(animated.frame/45)
	rightArm.y = rightArm.y + .02 * math.sin(animated.frame/45)
	if waving then
		rightArm.rotation = rightArm.rotation + 1 * math.sin(animated.frame/5)
	end
	
	if (instructions) then
		instructions:toFront()
	end
	
end

function openEyes(event)
	eyelids.alpha = 0
	eyeTimer = timer.performWithDelay( math.random(1000,10000), blink)
end

function blink(event)
	eyelids.alpha = 1
	eyeTimer = timer.performWithDelay( math.random(140,240), openEyes )
end

function tiltHeadLeft(event)
	transition.to( head, { time=3000, rotation = 7, transition=easing.inOutExpo } )
	-- transition.to( hat, { time=3000, rotation = 7, transition=easing.inOutExpo } )
	transition.to( eyelids, { time=3000, rotation = 7, transition=easing.inOutExpo } )
	tiltTimer = timer.performWithDelay( math.random(5000,12000), tiltHeadRight )
end

function tiltHeadRight(event)
	transition.to( head, { time=3000, rotation = 2, transition=easing.inOutExpo } )
	-- transition.to( hat, { time=3000, rotation = 2, transition=easing.inOutExpo } )
	transition.to( eyelids, { time=3000, rotation = 2, transition=easing.inOutExpo } )
	tiltTimer = timer.performWithDelay( math.random(5000,12000), tiltHeadLeft )
end

function initAnimation()
	Runtime:addEventListener( "enterFrame", animateObject)
	blinkTimer = timer.performWithDelay( 2000, blink )
	tiltHeadRight()
	
end



function startCharAnim(charX)

	waving = true
	
	rightArm2Y = 165.5

	legs = display.newImageRect("Images/UI/legs.png", 193, 309)
	legs.x = 0
	legs.y = display.contentHeight*1.37

	leftArm = display.newImageRect("Images/UI/leftArm.png", 62, 176)
	leftArm.x = legs.x - 62
	leftArm.y = legs.y - 160.5

	rightArm1 = display.newImageRect("Images/UI/rightArm.png", 237, 303)
	rightArm1.x = legs.x + 38
	rightArm1.y = legs.y - 230
	-- rightArm1.rotation = 90

	rightArm2 = display.newImageRect("Images/UI/leftArm.png", 62, 176)
	rightArm2.x = legs.x + 58
	rightArm2.y = legs.y - rightArm2Y
	rightArm2.xScale = -1
		
	if waving then
		rightArm = rightArm1
		rightArm2.alpha = 0
	else
		rightArm = rightArm2
		rightArm1.alpha = 0
	end


	torso = display.newImageRect("Images/UI/torso.png", 116, 137)
	torso.x = legs.x - 2
	torso.y = legs.y - 183

	head = display.newImageRect("Images/UI/head.png", 256, 268)
	head.x = legs.x - 19
	head.y = legs.y - 317
	--head.anchorY = 1 -- commented out for graphics 2.0

	eyelids = display.newImageRect("Images/UI/eyelids.png", 157, 49)
	eyelids.x = head.x + 12
	eyelids.y = head.y 
	eyelids.alpha = 0
	
	-- hat = display.newImageRect("Images/UI/hat.png", 256, 268)
	-- hat.x = head.x
	-- hat.y = head.y

	head.rotation = 4
	eyelids.rotation = 4
	-- hat.rotation = 4

	jill = display.newGroup()
	jill:insert(legs)
	jill:insert(leftArm)
	jill:insert(rightArm1)
	jill:insert(rightArm2)
	--jill:insert(rightArm)
	jill:insert(torso)
	jill:insert(head)
	jill:insert(eyelids)
	-- jill:insert(hat)

	jill.x = charX
	jill.y = 725

	jill.frame = 0
	animated = jill
	animatedYPosition = display.contentHeight/2 - 235
	charFloatRange = .05 --higher number creates a larger floating area, 5 is nice and subtle
	charRotationRange = .005 --higher number creates a larger rotation area, .06 is nice and subtle
	charRotationRate = 30 --higher number takes longer to rotate, 40 is nice and subtle

	
	if (speechBubble) then
		speechBubble:toFront()
	end
	if (instructions) then
		instructions:toFront()
	end
	
	emmaTrans = transition.to( jill, { time=400, y = display.contentHeight/2 - 235, transition=easing.outExpo, onComplete=initAnimation } )
	-- emmaArmTrans = transition.to( rightArm1, { time=400, rotation = 0, transition=easing.outExpo } )

	
end



function removeCharAnim(anim)

	local function removeItems()
		for i = #jill, 1, -1 do
			jill[i]:removeSelf()
			jill[i] = nil
		end
		
		if (jill) then
			jill:removeSelf()
			jill = nil
		end
		
	end
	
	if (emmaTrans) then
		transition.cancel( emmaTrans )
		emmaTrans = nil
	end
	if (emmaArmTrans) then
		transition.cancel( emmaArmTrans )
		emmaArmTrans = nil
	end
	
	Runtime:removeEventListener( "enterFrame", animateObject)
	
	if (blinkTimer) then
		timer.cancel( blinkTimer )
		blinkTimer = nil
	end
	if (eyeTimer) then
		timer.cancel( eyeTimer )
		eyeTimer = nil
	end
	if (tiltTimer) then
		timer.cancel( tiltTimer )
		tiltTimer = nil
	end
	
	if (anim == "down") then
		transition.to( jill, { time=500, y = 725, transition=easing.inExpo, onComplete=removeItems } )
	elseif (anim == "fade") then
		transition.to( jill, { time=500, alpha = 0, transition=easing.outExpo, onComplete=removeItems } )
	end
	
end