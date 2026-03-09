Particles = {}

local items = {}
local particleNum = 0
local particleGroup = 0
local hasStarted = false

	local function particleUpdate(event)
		local i
		local oldGroup = -1
		--move items
		for i=1,particleNum do
			local o = items[i]
			
			if o.particleType == "cloud" then 
				o.x = o.x + o.particleXSpeed
				o.y = o.y + o.particleYSpeed
				o.rotation = o.rotation + 0.25 -- rotation rate
				--clean items if one falls way off screen
				if o.y > o.initY + 10 or o.y < o.initY - 10 then
					o.particleYSpeed = o.particleYSpeed * -1
				end
				if o.x > o.initX + 15 or o.x < o.initX - 15 then
					o.particleXSpeed = o.particleXSpeed * -1
				end
			elseif o.particleType == "fireworks" then				
				o.particleYSpeed = o.particleYSpeed + .5 --gravity
				o.x = o.x + o.particleXSpeed
				o.y = o.y + o.particleYSpeed
				o.rotation = o.rotation + 3 -- rotation rate
				--clean items if one falls way off screen
				if o.y > 5000 then		
					oldGroup = o.particleGroup					
				end
			elseif o.particleType == "fireworksOffscreen" then				
				o.particleYSpeed = o.particleYSpeed + .5 --gravity
				o.x = o.x + o.particleXSpeed
				o.y = o.y + o.particleYSpeed
				o.rotation = o.rotation + 3 -- rotation rate
				--clean items if one falls way off screen
				if o.y > 2000 then		
					oldGroup = o.particleGroup					
				end
			elseif o.particleType == "meterParticles" then				
				o.particleYSpeed = o.particleYSpeed + .3 --gravity
				o.x = o.x + o.particleXSpeed
				o.y = o.y + o.particleYSpeed
				o.rotation = o.rotation + 3 -- rotation rate
				o.alpha = o.alpha - .05 
				--clean items if one falls way off screen
				if o.y > 2000 then		
					oldGroup = o.particleGroup					
				end	
			elseif o.particleType == "giftBits" then				
				o.particleYSpeed = o.particleYSpeed + .5 --gravity
				o.x = o.x + o.particleXSpeed
				o.y = o.y + o.particleYSpeed
				print(o.rotation)
				if o.distanceToGround == 1 then
					o.rotation = o.rotation + 4 -- rotation rate
				else
					o.rotation = o.rotation - 8 -- rotation rate
				end
				--clean items if one falls way off screen
				if o.y > 2000 then		
					oldGroup = o.particleGroup					
				end
			elseif o.particleType == "lick" then				
				o.particleYSpeed = o.particleYSpeed + .5 --gravity
				o.x = o.x + o.particleXSpeed
				o.y = o.y + o.particleYSpeed
				o.rotation = o.rotation + 50 -- rotation rate
				-- if o.y > 320 then	
					-- o.alpha = o.alpha - .01 -- fade rate
				-- end
				--clean items if one falls way off screen
				if o.y > 1000 then		
					oldGroup = o.particleGroup					
				end
			elseif o.particleType == "splash" then				
				o.particleYSpeed = o.particleYSpeed + .5 --gravity
				o.x = o.x + o.particleXSpeed
				o.y = o.y + o.particleYSpeed
				o.rotation = o.rotation + 50 -- rotation rate
				-- if o.y > 320 then	
					-- o.alpha = o.alpha - .01 -- fade rate
				-- end
				--clean items if one falls way off screen
				if o.y > 1000 then		
					oldGroup = o.particleGroup					
				end
			elseif o.particleType == "puddleSplash" then				
				if o.y >= o.initY + o.distanceToGround then 
					o.y = o.initY + o.distanceToGround
					o.particleXSpeed = 0
					o.particleYSpeed = 0
					o.rotation = 90
					o.xScale = o.xScale - .01
					o.yScale = o.yScale - .007
				else
					o.rotation = o.rotation + 50 -- rotation rate
					o.particleYSpeed = o.particleYSpeed + .25 --gravity
					o.x = o.x + o.particleXSpeed
					o.y = o.y + o.particleYSpeed						
				end								
				o.life = o.life -1
				if o.life < -60 then
					o.alpha = o.alpha - .03
				end
				if o.life < -90 then		
					oldGroup = o.particleGroup					
				end
			elseif o.particleType == "lilypadSplash" then				
				-- if o.y >= o.initY + o.distanceToGround then 
					-- o.y = o.initY + o.distanceToGround
					-- o.particleXSpeed = 0
					-- o.particleYSpeed = 0
					-- o.rotation = 90
					-- o.xScale = o.xScale - .01
					-- o.yScale = o.yScale - .007
				-- else
					o.rotation = o.rotation + 50 -- rotation rate
					o.particleYSpeed = o.particleYSpeed + .25 --gravity
					o.x = o.x + o.particleXSpeed
					o.y = o.y + o.particleYSpeed						
				-- end								
				o.life = o.life -1
				if o.life < -60 then
					o.alpha = o.alpha - .03
				end
				if o.life < -90 then		
					oldGroup = o.particleGroup					
				end
			elseif o.particleType == "bigSplash" then				
				o.particleYSpeed = o.particleYSpeed + .5 --gravity
				o.x = o.x + o.particleXSpeed
				o.y = o.y + o.particleYSpeed
				o.rotation = o.rotation + 50 -- rotation rate
				-- if o.y > 320 then	
					o.alpha = o.alpha - .0075 -- fade rate
				-- end
				--clean items if one falls way off screen
				if o.y > 1000 then		
					oldGroup = o.particleGroup					
				end
			elseif o.particleType == "eggExplode" then				
				
				if o.y >= o.initY + o.distanceToGround then 
					o.y = o.initY + o.distanceToGround
					o.particleXSpeed = 0
					o.particleYSpeed = 0
				else
					o.rotation = o.rotation + 17 -- rotation rate
					o.particleYSpeed = o.particleYSpeed + .25 --gravity
					o.x = o.x + o.particleXSpeed
					o.y = o.y + o.particleYSpeed						
				end								
				o.life = o.life -1
				if o.life < -60 then
					o.alpha = o.alpha - .03
				end
				if o.life < -90 then		
					oldGroup = o.particleGroup					
				end	
			elseif o.particleType == "eggExplodeNest" then				
				
				
				if o.y >= o.initY + o.distanceToGround and o.x > o.initX - 15 and o.x < o.initX + 15 then 
						o.y = o.initY + o.distanceToGround
						o.particleXSpeed = 0
						o.particleYSpeed = 0	
				else
					o.rotation = o.rotation + 2 -- rotation rate
					o.particleYSpeed = o.particleYSpeed + .25 --gravity
					o.x = o.x + o.particleXSpeed
					o.y = o.y + o.particleYSpeed						
				end								
				o.life = o.life -1
				if o.life < -60 then
					o.alpha = o.alpha - .03
				end
				if o.life < -90 then		
					oldGroup = o.particleGroup					
				end	
			elseif o.particleType == "sloMoExplode" then				
				o.particleYSpeed = o.particleYSpeed + .25 --gravity
				o.x = o.x + o.particleXSpeed
				o.y = o.y + o.particleYSpeed
				o.rotation = o.rotation + 3 -- rotation rate				
				--clean items if one falls way off screen
				if o.y > 1000 then		
					oldGroup = o.particleGroup					
				end	
			elseif o.particleType == "sloMoExplode2" then				
				
				if o.y >= o.initY + o.distanceToGround then 
					o.y = o.initY + o.distanceToGround + 0.1
					o.alpha = o.alpha - .01
					
				else
					o.rotation = o.rotation + 2 -- rotation rate
					o.particleYSpeed = o.particleYSpeed + .25 --gravity
					o.x = o.x + o.particleXSpeed
					o.y = o.y + o.particleYSpeed
						if o.particleYSpeed >= 2.5 then
						o.particleYSpeed = 2.5
						if o.particleXSpeed > 3 then o.particleXSpeed = o.particleXSpeed + .06 end
						if o.particleXSpeed < 3 then o.particleXSpeed = o.particleXSpeed - .06 end
						end
				end
								
				--clean items if one falls way off screen
				if o.alpha <= 0 then		
					oldGroup = o.particleGroup					
				end		
			
			elseif o.particleType == "sloMoExplode3" then				
				
				if o.y >= o.initY + o.distanceToGround then 
					o.y = o.initY + o.distanceToGround
					o.particleXSpeed = 0
					o.particleYSpeed = 0
				else
					--o.rotation = o.rotation + 2 -- rotation rate
					o.particleYSpeed = o.particleYSpeed + .25 --gravity
					o.x = o.x + o.particleXSpeed
					o.y = o.y + o.particleYSpeed						
				end								
				o.life = o.life -1
				if o.life < -60 then
					o.alpha = o.alpha - .03
				end
				if o.life < -90 then		
					oldGroup = o.particleGroup					
				end
			elseif o.particleType == "sloMoExplode4" then				
				
				if o.y >= o.initY + o.distanceToGround then 
					o.y = o.initY + o.distanceToGround
					o.particleXSpeed = 0
					o.particleYSpeed = 0
				else
					--o.rotation = o.rotation + 2 -- rotation rate
					o.particleYSpeed = o.particleYSpeed + .25 --gravity
					o.x = o.x + o.particleXSpeed
					o.y = o.y + o.particleYSpeed						
				end								
				o.life = o.life -5
				if o.life < -60 then
					o.alpha = o.alpha - .03
				end
				if o.life < -90 then		
					oldGroup = o.particleGroup					
				end
			elseif o.particleType == "bubbles" then				
				o.particleYSpeed = o.particleYSpeed - .3 --bouyancy
				o.x = o.x + o.particleXSpeed
				o.y = o.y + o.particleYSpeed
				-- o.alpha = .25
				-- o.rotation = o.rotation + 3 -- rotation rate
				--clean items if one falls way off screen
				if o.y < -1000 then		
					oldGroup = o.particleGroup					
				end
			elseif o.particleType == "snow" then				
				o.particleYSpeed = o.particleYSpeed + .15 --bouyancy
				o.x = o.x + o.particleXSpeed
				o.y = o.y + o.particleYSpeed
				-- o.alpha = .25
				-- o.rotation = o.rotation + 3 -- rotation rate
				--clean items if one falls way off screen
				if o.y < -1000 then		
					oldGroup = o.particleGroup					
				end
			elseif o.particleType == "kiteClouds" then				
				o.particleYSpeed = o.particleYSpeed + .015 --bouyancy
				o.particleXSpeed = o.particleXSpeed + .15 --bouyancy
				o.x = o.x + o.particleXSpeed
				o.y = o.y + o.particleYSpeed
				-- o.alpha = .25
				o.rotation = 0
				--clean items if one falls way off screen
				if o.x > 1000 then		
					oldGroup = o.particleGroup					
				end	
			elseif o.particleType == "windClouds" then				
				o.particleYSpeed = o.particleYSpeed + .015 --bouyancy
				o.particleXSpeed = o.particleXSpeed + .15 --bouyancy
				o.x = o.x + o.particleXSpeed
				o.y = o.y + o.particleYSpeed
				-- o.alpha = .25
				o.rotation = 0
				--clean items if one falls way off screen
				if o.x > 1000 then		
					oldGroup = o.particleGroup					
				end	
			elseif o.particleType == "windLeaves" then				
				o.particleYSpeed = o.particleYSpeed + .015 --bouyancy
				o.particleXSpeed = o.particleXSpeed + .15 --bouyancy
				o.x = o.x + o.particleXSpeed
				o.y = o.y + o.particleYSpeed
				-- o.alpha = .25
				o.rotation = o.rotation + o.y/20
				--clean items if one falls way off screen
				if o.x > 1000 then		
					oldGroup = o.particleGroup					
				end	
			elseif o.particleType == "windLines" then				
				-- o.particleYSpeed = o.particleYSpeed + .015 --bouyancy
				o.particleXSpeed = o.particleXSpeed + .15 --bouyancy
				o.x = o.x + o.particleXSpeed
				o.y = o.y + o.particleYSpeed
				o.alpha = .75
				o.rotation = 0
				--clean items if one falls way off screen
				if o.x > 1000 then		
					oldGroup = o.particleGroup					
				end	
			elseif o.particleType == "teethBrush" then				
				o.particleYSpeed = o.particleYSpeed - .005 --bouyancy
				o.x = o.x + o.particleXSpeed
				o.y = o.y + o.particleYSpeed
				-- o.alpha = .25
				randomAlphaReduction = math.random(10,30)/2000
				if o.alpha - randomAlphaReduction >= 0 then
					o.alpha = o.alpha - randomAlphaReduction
				else
					oldGroup = o.particleGroup	
				end
				--clean items if one falls way off screen
				if o.y < -1000 then		
					oldGroup = o.particleGroup					
				end
			elseif o.particleType == "dust" then					
				--o.x = o.x + o.particleXSpeed
				o.y = o.y + o.particleYSpeed - .75
				o.xScale = o.xScale + math.random(2,7)/100
				o.yScale = o.yScale + math.random(2,7)/100
				randomAlphaReduction = math.random(10,30)/1000
				if o.alpha - randomAlphaReduction >= 0 then
					o.alpha = o.alpha - randomAlphaReduction
				else
					oldGroup = o.particleGroup	
				end
				o.rotation = o.rotation + math.random(1,3) -- rotation rate
			elseif o.particleType == "nestDust" then					
				o.x = o.x - o.particleYSpeed
				o.y = o.y + o.particleYSpeed - .75
				o.xScale = o.xScale + math.random(2,7)/100
				o.yScale = o.yScale + math.random(2,7)/100
				randomAlphaReduction = math.random(10,30)/1000
				if o.alpha - randomAlphaReduction >= 0 then
					o.alpha = o.alpha - randomAlphaReduction
				else
					oldGroup = o.particleGroup	
				end
				o.rotation = o.rotation + math.random(1,3) -- rotation rate
			elseif o.particleType == "trainSmoke" then					
				--o.x = o.x + o.particleXSpeed
				o.y = o.y + o.particleYSpeed - 4
				o.xScale = o.xScale + math.random(2,7)/100
				o.yScale = o.yScale + math.random(2,7)/100
				randomAlphaReduction = math.random(10,30)/1000
				if o.alpha - randomAlphaReduction >= 0 then
					o.alpha = o.alpha - randomAlphaReduction
				else
					oldGroup = o.particleGroup	
				end
				o.rotation = o.rotation + math.random(1,3) -- rotation rate
			elseif o.particleType == "helicopterdust" then					
				o.x = o.x + o.particleXSpeed
				o.y = o.y + o.particleYSpeed - .75
				o.xScale = o.xScale + math.random(1,10)/100
				o.yScale = o.yScale + math.random(1,10)/100
				randomAlphaReduction = math.random(10,30)/1000
				if o.alpha - randomAlphaReduction >= 0 then
					o.alpha = o.alpha - randomAlphaReduction
				else
					oldGroup = o.particleGroup	
				end
				o.rotation = o.rotation + math.random(-8,8) -- rotation rate
			elseif o.particleType == "rocketSmoke" then					
				--o.x = o.x + o.particleXSpeed
				o.y = o.y + o.particleYSpeed + .75
				o.xScale = o.xScale + math.random(1,10)/100
				o.yScale = o.yScale + math.random(1,10)/100
				randomAlphaReduction = math.random(10,30)/1000
				if o.alpha - randomAlphaReduction >= 0 then
					o.alpha = o.alpha - randomAlphaReduction
				else
					oldGroup = o.particleGroup	
				end
				o.rotation = o.rotation + math.random(-8,8) -- rotation rate	
			elseif o.particleType == "giftDust" then					
				-- o.x = o.x + math.random(-10, 10)
				o.xScale = o.xScale + .1
				o.yScale = o.yScale + .1
				o.y = o.y + o.particleYSpeed - 1
				-- o.xScale = o.xScale + math.random(2,7)/100
				-- o.yScale = o.yScale + math.random(2,7)/100
				-- randomAlphaReduction = math.random(15,30)/1000
				if o.alpha - .05 >= 0 then
					o.alpha = o.alpha - .05
				else
					oldGroup = o.particleGroup	
				end
				o.rotation = o.rotation + math.random(1,6) -- rotation rate
			elseif o.particleType == "starMagic" then					
				--o.x = o.x + o.particleXSpeed
				o.y = o.y + o.particleYSpeed + 1
				o.xScale = o.xScale + math.random(2,7)/100
				o.yScale = o.yScale + math.random(2,7)/100
				randomAlphaReduction = math.random(10,30)/1000
				if o.alpha - randomAlphaReduction >= 0 then
					o.alpha = o.alpha - randomAlphaReduction
				else
					oldGroup = o.particleGroup	
				end
				o.rotation = o.rotation + math.random(1,3) -- rotation rate
			elseif o.particleType == "bounce" then				
				o.particleYSpeed = o.particleYSpeed + .5 --gravity
				if o.particleXSpeed >= 0 and o.particleXSpeed < .4 then o.particleXSpeed = .4 end --ensures no object stays on screen too long
				if o.particleXSpeed < 0 and o.particleXSpeed > -.4 then o.particleXSpeed = -.4 end  --ensures no object stays on screen too long
				o.x = o.x + o.particleXSpeed
				o.y = o.y + o.particleYSpeed
				o.rotation = o.rotation + 3 -- rotation rate
								if o.y > 320 and o.particleYSpeed > 0 then --bounce
								   o.particleYSpeed = -.8*o.particleYSpeed
								   if o.particleYSpeed > -6 then 
									   o.particleYSpeed = -4 -math.random()*6
								   end                                
										
								end
								--clean items if one falls way off screen
				if o.x < -1000 or o.x > 1600 then		
					oldGroup = o.particleGroup					
				end
			elseif o.particleType == "objectBounce" then				
				o.particleYSpeed = o.particleYSpeed + .5 --gravity
				if o.particleXSpeed >= 0 and o.particleXSpeed < 0.2 then o.particleXSpeed = 0.2 end --ensures no object stays on screen too long
				if o.particleXSpeed < 0 and o.particleXSpeed > -0.2 then o.particleXSpeed = -0.2 end  --ensures no object stays on screen too long
				o.x = o.x + o.particleXSpeed
				o.y = o.y + o.particleYSpeed
				o.rotation = o.rotation + 3 -- rotation rate
								if o.y > (o.initY + o.distanceToGround) and o.particleYSpeed > 0 then --bounce
								   o.particleYSpeed = -.8*o.particleYSpeed
								   if o.particleYSpeed > -6 then 
									   o.particleYSpeed = -4 -math.random()*6
								   end                                
										
								end
								--clean items if one falls way off screen
				if o.x < -1000 or o.x > 1600 then		
					oldGroup = o.particleGroup					
				end
				o.life = o.life -1
				if o.life < 1 then		
					oldGroup = o.particleGroup					
				end
				if o.life < 10 then 
					if o.alpha - 0.1 >= 0 then
						o.alpha = o.alpha -0.1
					end 
				end 
			elseif o.particleType == "spray" then				
				o.x = o.x + o.particleXSpeed
				o.y = o.y + o.particleYSpeed				
				--clean items if one falls way off screen
				if o.y < -500 or o.x < -1000 or o.x > 1600 or o.y > 1000 then		
					oldGroup = o.particleGroup					
				end
				
			elseif o.particleType == "delayedFade" then	
				o.life = o.life -1  
				o.y = o.y + o.particleYSpeed
				o.particleYSpeed = o.particleYSpeed + 0.01
				--o.yScale = o.yScale * (1+o.particleYSpeed/10)
				--clean items if one falls way off screen
				if o.life < -120 then
					o.alpha = o.alpha - .03
				end
				if o.life < -150 then		
					oldGroup = o.particleGroup					
				end
			elseif o.particleType == "fade" then				
				o.x = o.x + o.particleXSpeed
				o.y = o.y + o.particleYSpeed
								o.alpha = o.alpha * .98
								o.life = o.life -1
							   
				--clean items if one falls way off screen
				if o.life < 1 then		
					oldGroup = o.particleGroup					
				end
			elseif o.particleType == "pepperSmoke" then				
				o.particleXSpeed = o.particleXSpeed *.96
				o.particleYSpeed = o.particleYSpeed *.96
				-- floatUp = floatUp + .1
				o.rotation = o.rotation + o.particleYSpeed
				o.x = o.x + o.particleXSpeed 
				o.y = o.y + o.particleYSpeed -1.25
								o.alpha = o.alpha * .965
								o.life = o.life -.1
							   
				--clean items if one falls way off screen
				if o.alpha < .001 then		
					oldGroup = o.particleGroup					
				end
			elseif o.particleType == "flutter2" then
				if o.y >= o.initY + o.distanceToGround then 
					o.y = o.initY + o.distanceToGround + 0.1
					o.alpha = o.alpha - .01
					
				else
					if o.y < o.initY + o.distanceToGround then
					
					o.rotation = o.rotation + 2 -- rotation rate
					o.particleYSpeed = o.particleYSpeed + .25 --gravity
					o.x = o.x + o.particleXSpeed
					o.y = o.y + o.particleYSpeed
						if o.particleYSpeed >= 2.5 then
						o.particleYSpeed = 2.5
						if o.particleXSpeed > 3 then o.particleXSpeed = o.particleXSpeed + .06 end
						if o.particleXSpeed < 3 then o.particleXSpeed = o.particleXSpeed - .06 end
						end
						
					end
				end
								
				--clean items if one falls way off screen
				if o.alpha <= 0 then		
					oldGroup = o.particleGroup					
				end	
			elseif o.particleType == "flutterHop" then
				if o.y >= o.initY + o.distanceToGround then 
					o.y = o.initY + o.distanceToGround + 0.1
					o.alpha = o.alpha - .02
					
				else
					if o.y < o.initY + o.distanceToGround then
					
					o.rotation = o.rotation + 2 -- rotation rate
					o.particleYSpeed = o.particleYSpeed + .25 --gravity
					o.x = o.x + o.particleXSpeed
					o.y = o.y + o.particleYSpeed
						if o.particleYSpeed >= 2.5 then
						o.particleYSpeed = 2.5
						if o.particleXSpeed > 3 then o.particleXSpeed = o.particleXSpeed + .06 end
						if o.particleXSpeed < 3 then o.particleXSpeed = o.particleXSpeed - .06 end
						end
						
					end
				end
				
				
			end
				
		end
		
		--clean up a group if flagged 
		--currently only one group per frame
		if oldGroup > -1 then
			for i=particleNum,1,-1 do
					local child = items[i]
					if child.particleGroup == oldGroup then 
						-- child.parent.remove( child )
						child:removeSelf()
						table.remove(items,i)
						particleNum = particleNum - 1
					end
			end
			particleNum = table.maxn(items)
			if particleNum == 0 then 
				hasStarted = false
				Runtime:removeEventListener("enterFrame", particleUpdate)
			end
		end
		
	end


	function Particles:removeParticles(particleType)
		for i=particleNum,1,-1 do
					local child = items[i]
					if child.particleGroup == particleType or particleType==-1 then 
						-- child.parent.remove( child )
						child:removeSelf()
						table.remove(items,i)
						particleNum = particleNum - 1
					end
			end
			particleNum = table.maxn(items)
			if particleNum == 0 then 
				hasStarted = false
				Runtime:removeEventListener("enterFrame", particleUpdate)
			end
	end
	
	function Particles:newEmitter(group,particleType, image, imageWidth, imageHeight, numOfParts, xLoc, yLoc, minXSpeed, maxXSpeed, minYSpeed, maxYSpeed, r, g, b, distanceToGround)	
		local startPoint = particleNum + 1
		particleNum = particleNum + numOfParts
		local i
		particleGroup = particleGroup + 1
		
		--print("create particles :" .. particleType .. " num:" .. numOfParts.."pnum:" .. particleNum.." sp:"..startPoint)
		for i=startPoint,particleNum do			
			local particle1 = display.newImageRect(image, imageWidth, imageHeight ) --display particle
			particle1.x = xLoc -- set particle at piece location
			particle1.y = yLoc -- set particle at piece location
			particle1.rotation = math.random()*360
			particle1.particleXSpeed = ((maxXSpeed-minXSpeed) * math.random()) + minXSpeed --randomize x direction and speed
			particle1.particleYSpeed = ((maxYSpeed-minYSpeed) * math.random()) + minYSpeed --randomize y speed			
			particle1.particleType = particleType
			particle1.initX = xLoc
			particle1.initY = yLoc
			particle1.particleGroup = particleGroup
			if distanceToGround then
				particle1.distanceToGround = distanceToGround
			end
			particle1.life = 30
			particle1:setFillColor(r/255, g/255, b/255)
			items[i] = particle1
			group:insert(particle1)
			-- group:toFront()
		end
		
		if not hasStarted then 
			Runtime:removeEventListener("enterFrame", particleUpdate)
			Runtime:addEventListener("enterFrame", particleUpdate)
			hasStarted = true
		end
	end

	

return Particles