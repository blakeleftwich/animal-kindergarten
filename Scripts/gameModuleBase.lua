local base = {}

local myData = require("Scripts.myData")

-- Display constants shared by all game modules
base._W      = display.contentWidth
base._H      = display.contentHeight
base._CX     = display.contentCenterX
base._CY     = display.contentCenterY
base._TOP    = display.screenOriginY
base._BTM    = display.contentHeight - display.screenOriginY
base._RHT    = display.contentWidth - display.screenOriginX
base._LFT    = display.screenOriginX
base._WIDTH  = base._RHT - base._LFT
base._HEIGHT = base._BTM - base._TOP

-- Shared back button transition used by all game modules.
-- Returns the timer handle (if any) so callers can cancel it.
function base.backButtonTransition()
    if (myData.isTV) then
        return timer.performWithDelay( 700, makeButtonsActive )
    else
        makeButtonsActive()
    end
end

return base
