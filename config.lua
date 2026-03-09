
if ( display.pixelHeight / display.pixelWidth > 1.5 ) then
    
    application = {
            launchPad = false,
            antialias = true,
            content = {
                fps = 60,
                --width = 355, height = 512,                 
               -- width = 300, height = 512,                 
                scale = "letterBox",
              width = 384, height = 512,
                 -- width = 330, height = 512,
              --scale = "zoomEven",
                imageSuffix = 
                {
                        ["@2x"] = 1.5,
                        ["@4x"] = 3,
                }
            },
    } 
    
    
else

    application = {
            launchPad = false,
            antialias = true,
            content = {
                fps = 60,
                --width = 384, height = 512,
                --width = 360, height = 480,          
                --scale = "letterBox",
                  width = 384, height = 512,
               scale = "zoomEven",
                imageSuffix = 
                {
                        ["@2x"] = 1.5,
                        ["@4x"] = 3,
                }
            },
    } 
end
