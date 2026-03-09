--////////////////////////////////////////////////////////////////////////
--BEGIN path player
--////////////////////////////////////////////////////////////////////////
pathPlayer = {}
    local justStarted = false
    local characters = {}
    local isStarted = false
    
    local function playPaths(event)
            
       local charNum = #characters
       if charNum > 0 then
            local i
            
             for i = 1,charNum do
                            
                local character = characters[i]
                local displayCharacter = character.displayCharacter
                local path = character.animInfo.path           
                local pathLength = #path
                local pathNode = character.frame

                if pathLength > 0 then
                    if pathNode > pathLength then
                        character.loopCount = character.loopCount + 1
                    
                        if character.animInfo.repeats == -1 or (character.loopCount < character.animInfo.repeats) then
                            character.frame = 1
                        elseif character.playing then
                            character.playing = false
                            character.release = true
                            --do callback
                            character.callback(character.displayCharacter)
                        end
                    else
                        local x,y,r,preFrameTimer,anim

                        x = path[pathNode].x
                        y = path[pathNode].y

                        anim = character.animInfo.charAnim               
                        if  anim.animType == "wobble" then 
                            displayCharacter.rotation = anim.degrees * math.sin(pathNode*anim.frequency/60)
                        elseif  anim.animType == "hop" then 
                            y = y + anim.height * math.sin(pathNode*anim.frequency/60)
                        elseif  anim.animType == "follow" then
                            i = pathNode
                            if i == 1 then 
                                i = 2
                            end    
                            r = math.deg(math.atan2(path[i].y-path[i-1].y, path[i].x-path[i-1].x))
                            pr = displayCharacter.rotation % 360
                            if r < 0 then
                                r = r + 360
                            end                    
                            if math.abs(r-pr) > 180 then
                                pr = 360-pr
                            end
                            displayCharacter.rotation = (r-pr)*(2/(1+anim.smoothing))+pr
                        end                
                        displayCharacter.x = x
                        displayCharacter.y = y
                        character.frame = character.frame + 1
                   end
               end               
           end           
           
           for i=charNum,1,-1 do
                local child = characters[i]                
                if child.displayCharacter == nil then
                    child.parent.remove( child )
                    child:removeSelf()
                    table.remove(characters,i)
                elseif child.displayCharacter.release then 
                    child.parent.remove( child )
                    child:removeSelf()
                    table.remove(characters,i)
                end
            end
       end
    end    
    
    
    
    local function modifyPath(action,factor,character)
        local path = {}        
        local opath = table.copy(character.animInfo.path)       
        local pathLength = #opath
        local i,j
        local p = {}  
       
        if action == "smooth" then    --smooth            
            path[1] = {x = opath[1].x,y = opath[1].y }
            for i=2, pathLength do
                path[i] = {x = ((opath[i].x-path[i-1].x)*(2/(factor+1)))+path[i-1].x,y = ((opath[i].y-path[i-1].y)*(2/(factor+1)))+path[i-1].y }           
            end          
        elseif action =="settime" then  --adjust timing                       
            path[1] = {x = opath[1].x,y = opath[1].y }
            local scale = pathLength/(factor*60)            
            local r,a,b,smoothing,newLength
            if (factor*60)>pathLength then    
                newLength = factor*60
                smoothing = math.ceil(3 /scale)
                for i=2, newLength do --skip first
                    j = 1+((i-1)*scale)
                    a = math.floor(j)
                    b = math.ceil(j)
                    if b < pathLength then
                        r = j- a                        
                        path[i] = {x = math.round(((1-r) * opath[a].x) + (r * opath[b].x)),y = math.round(((1-r) * opath[a].y) + (r * opath[b].y))}
                        --smooth to stretch factor
                        path[i] = {x=((path[i].x-path[i-1].x)*(2/(smoothing+1)))+path[i-1].x ,y = ((path[i].y-path[i-1].y)*(2/(smoothing+1)))+path[i-1].y}
                    end
                end
            else                                 
                for i=2, pathLength do --skip first
                    j = math.floor((i-1)*scale)
                    if j<=pathLength then 
                        path[i] = {}
                        path[i].x = opath[j].x
                        path[i].y = opath[j].y
                        path[i].x = ((path[i].x-path[i-1].x)*(2/(3+1)))+path[i-1].x --smooth slightly
                        path[i].y = ((path[i].y-path[i-1].y)*(2/(3+1)))+path[i-1].y 
                    end                          
                end
            end
        elseif action =="snapto" then                       
            local wp1 = pathInfo.start
            local wp2 = pathInfo.finish           
            local xDelta = (wp2.x-wp1.x)/(opath[pathLength].x-opath[1].x)
            local yDelta = (wp2.y-wp1.y)/(opath[pathLength].y-opath[1].y)            
            for i=1, pathLength do --update all path elements after first                
                path[i] = {x=wp1.x + xDelta*(opath[i].x-opath[1].x),y = wp1.y + yDelta*(opath[i].y-opath[1].y)}

            end
        end
        character.animInfo.path = path
    end    
    
    local function applyFilters(character)
        character.animInfo.path = table.copy(character.animInfo.origpath)
        
        if character.animInfo.snapto then 
            if character.animInfo.snapto == 1 then 
                modifyPath("snapto",0,character)                
            end
        end 
        
        if character.animInfo.smoothing then
            if character.animInfo.smoothing > 0 then 
                modifyPath("smooth",character.animInfo.smoothing,character)                
            end
        end
        
        
        if character.animInfo.time then
            if character.animInfo.time > 0 then 
                modifyPath("settime",character.animInfo.time,character)                
            end
        end
    end
        
    
    pathPlayer.animateCharacter = function(character,callback)
      
      --prepare for animation
        local characterNode = {}
        characterNode.callback = callback
        characterNode.frame = 1
        characterNode.loopCount = 0
        character.release = false
        characterNode.playing = true
        characterNode.displayCharacter = character
        local animInfo = character.animInfo
        
        
        if animInfo.start then 
        else
            animInfo.start = animInfo.origPath[1]
        end
        if animInfo.finish  then
        else
            local p = animInfo.origPath
            animInfo.finish = animInfo.origPath[#p]
        end
        if animInfo.repeats  then
        else
            animInfo.repeats = 0
        end
        if animInfo.charAnim ~= nil then
        else
            animInfo.charAnim = {animType="none"}
        end
        characterNode.animInfo = animInfo
        applyFilters(characterNode)
        
        
      
      --add to collection
       local i = #characters
       i = i + 1
       characters[i] = characterNode
       
       if not isStarted then
            isStarted = true
            Runtime:addEventListener( "enterFrame", playPaths )
       end
    end

return pathPlayer

--[[
////////////////////////////////////////////////////////////////////////
  DESCRIPTION
////////////////////////////////////////////////////////////////////////
This is just a simple demo of the pathPlayer object.

just add an animInfo object to your display object e.g.
    animInfo = {start={x=157,y=34},finish={x=157,y=34},charAnim={animType="follow",smoothing=12},time=5,snapto=0,smoothing=3,repeats=3,
                        origpath= {{y=157,x=34},...,{y=156,x=45}}
                        }

    then call pathPlayer.animateCharacter(display object,callback function)



////////////////////////////////////////////////////////////////////////
  OPTIONS
////////////////////////////////////////////////////////////////////////
    animType 
        1. none
        2. wobble 
                Description: character will rotate back and forth                                
                Params:
                   degrees - number of degrees to wobble side to side
                   frequency - speed of wobbling
        3. hop  
                Description: character will hop up and down                                
                Params:
                   height - height in pixels to hop
                   frequency - speed of wobbling
        4. follow  
                Description: character will change rotation follow the path                                
                Params:
                   smoothing - an exponential smoothing factor applied to rotation to reduce shakiness
        
    start  (*required for snapto)
        Description: x and y location for character to start animation e.g. at a waypoint
        
    finish  (*required for snap to)
        Description: x and y location for character to finish animation e.g. at a waypoint
        Note: use the snapto feature to make sure that the path end exactly at the animation
        
    repeats  
        Description: number of times to repeat
                -1 = forever
                0 = none
                n = number of times
        
    time  
        Description: overrides original time for path, expressed in seconds e.g. time=3.5
        Note: a smoothing filter of factor 3 is automatically applied as well since the time stretching can cause choppiness
   
   smoothing  
        Description: applies exponential smoothing to the path. the value is an integer > 1
        Note: best to keep values low
   
    snapto  
        Description: snaps a path precisely to the start and finish points using a simple remapping, pass a value of 1 to the factor to turn it on
        Note: If the original path was substantially distant from the waypoints, this can cause distortion. So it is best to draw the path with starting and finishing points as close to the waypoints as possible
    


--]]

