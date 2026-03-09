module(..., package.seeall)

splash = {}

local items = {}
local particleNum = 0
local particleGroup = 1
local hasStarted = false
local stage
local titleSound
local cameraY = 300
local frame = 1

	local function particleUpdate(event)
		local i
		local oldGroup = -1
                frame = frame + 1
                
                cameraY = cameraY + .02*(-50-cameraY)
                
		--move items
		for i=1,particleNum do
			local o = items[i]
			
			if o.particleType == "cloud" then 
				o.px = o.px + o.xv
				o.py = o.py + o.yv
				o.rotation = o.rotation + 0.25 -- rotation rate
				--clean items if one falls way off screen
				if o.py > o.initY + 10 or o.py < o.initY - 10 then
					o.yv = o.yv * -1
				end
				if o.px > o.initX + 15 or o.px < o.initX - 15 then
					o.xv = o.xv * -1
				end
			elseif o.particleType == "fireworks" then				
				o.yv = o.yv + .5 --gravity
				o.px = o.px + o.xv
				o.py = o.py + o.yv
				o.rotation = o.rotation + 3 -- rotation rate
				--clean items if one falls way off screen
				if o.py > 1000 then		
					oldGroup = o.particleGroup					
				end
                        elseif o.particleType == "float" then	
				o.py = o.ty + 5*math.sin(frame/20)
				o.rotation = o.tr + .5*math.sin(frame/20) -- rotation rate			
			end 
                        
                        o.x = 256 + o.px*10/o.pz
                        o.y = 192 + (o.py-cameraY)*10/o.pz
                        
		end
		
		--clean up a group if flagged 
		--currently only one group per frame
		if oldGroup > -1 then
			for i=particleNum,1,-1 do
					local child = items[i]
					if child.particleGroup == oldGroup then 
						child.parent.remove( child )
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


	local function removeParticles(particleType)
		for i=particleNum,1,-1 do
					local child = items[i]
					if child.particleGroup == particleType or particleType==-1 then 
						child.parent.remove( child )
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
        
        local function newParticle(group,particleType, image, imageWidth, imageHeight, xLoc, yLoc,zLoc,rot, xv,yv)	
		
		particleNum = particleNum + 1
		local i = particleNum
		
                local particle1 = display.newImageRect(image, imageWidth, imageHeight ) --display particle

                particle1.px = xLoc -- set particle at piece location
                particle1.py = yLoc -- set particle at piece location
                particle1.pz = zLoc
                particle1.tx = xLoc --for targeted motion
                particle1.ty = yLoc 
                particle1.tz = zLoc
                particle1.rotation = rot--math.random()*360
                particle1.tr = rot
                particle1.xv = xv
                particle1.yv = yv	
                particle1.particleType = particleType
                particle1.initX = xLoc
                particle1.initY = yLoc
                particle1.particleGroup = particleGroup
                items[i] = particle1
                group:insert(particle1)
                
                print(image.." "..xLoc.." "..yLoc)
		
	end
        
	local function newEmitter(group,particleType, image, imageWidth, imageHeight, numOfParts, xLoc, yLoc, minXSpeed, maxXSpeed, minYSpeed, maxYSpeed)	
		local i
                local xv
                local yv
                local rot 
                for i=1,numOfParts do
                   xv = ((maxXSpeed-minXSpeed) * math.random()) + minXSpeed --randomize x direction and speed
                   yv = ((maxYSpeed-minYSpeed) * math.random()) + minYSpeed --randomize y speed	
                   rot = math.random()*360
                    newParticle(group,particleType, image, imageWidth, imageHeight, xLoc, yLoc,20,rot, xv,yv)	
                end	
		if not hasStarted then 
			Runtime:removeEventListener("enterFrame", particleUpdate)
			Runtime:addEventListener("enterFrame", particleUpdate)
			hasStarted = true
		end
	end

	function splash:initSplash()
            stage = display.newGroup()
            
            stage:toFront()
            local i = 1
           local backdrop = display.newRect( -100, 0, 700, 400 )
              backdrop:setFillColor(0, 171, 235  ) 
             stage:insert(backdrop)
            
            local g = graphics.newGradient(
                { 0, 0, 0 },
                { 0, 171, 235 },
                "down" )

              -- sets gradient 'g' on rect
              local rect = display.newRect( -100, 0, 700, 400 )
              rect:setFillColor( g ) 
              rect.y = -200
             stage:insert(rect)
             
             for i=1,20 do
                  newParticle(stage,"fixed", "Splash/Images/star.png", 50, 50, math.random(-600,600), -math.random(-50,600),math.random(20,40),math.random()*360, 0,0)
              end
           
           for i=1,3 do
               newParticle(stage,"fixed", "Splash/Images/cloud1.png", 264, 200, math.random(-600,600), math.random(300,850),math.random(20,40),0, 0,0)
            end
             

             newParticle(stage,"float", "Splash/Images/eggrollLogo2.png", 334, 127, 0, 0,20,0, 0,-20)	
             for i=1,20 do
                  newParticle(stage,"fixed", "Splash/Images/star.png", 50, 50, math.random(-600,600), -math.random(-50,500),math.random(11,20),math.random()*360, 0,0)
             end	
            for i=1,3 do
               newParticle(stage,"fixed", "Splash/Images/cloud1.png", 264, 200, math.random(-600,600), math.random(300,750),math.random(11,20),0, 0,0)
            end
        
            titleSound = audio.loadSound("Splash/Audio/Eggroll Games_bip.mp3")               
            timer.performWithDelay( 4500, completeSplash )
            timer.performWithDelay( 800, playTitleSound )
            
            if not hasStarted then 
			Runtime:removeEventListener("enterFrame", particleUpdate)
			Runtime:addEventListener("enterFrame", particleUpdate)
			hasStarted = true
		end
            
        end
        
        function playTitleSound(e)
            audio.play(titleSound)
        end
        
        function completeSplash(e)
            
            print("splash complete function")
            removeParticles("fireworks")
            transition.to(stage, {time=1000, alpha=0,onComplete=finalSplash } )
        end
        
        function finalSplash()
            audio.dispose(titleSound)
            print("splash final function")
            stage:removeSelf()
            stage = nil
            init()
        end
        

return splash