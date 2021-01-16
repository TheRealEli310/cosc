--local expect = require("cc.expect").expect -- Init ComputerCraft built-in expect function.
--^^^ Not available in os.loadAPI() ^^^
--local function expectColor(var)
--
--end

function drawpixel(x,y,c)
    --expect(1, x, "number")
    --expect(2, y, "number")
    term.setPixel(x,y,c)
end
function drawRect(x,y,x2,y2,c)
    --expect(1, x, "number")
    --expect(2, y, "number")
    --expect(3, x2, "number")
    --expect(4, y2, "number")
    local oldColor = term.getTextColor()
    local cOk, cErr = pcall(term.setTextColor, c)
    if cOk then
        term.setTextColor(oldColor)
    else
        error(cErr, 2)
    end
    for i = x,x2,1 do
        for o = y,y2,1 do
            graphics.drawpixel(i,o,c)
        end
    end
end
function getSize()
    local w, h = term.getSize()
    return w * 6, h * 9
end
function enableGraphicsMode(cn)
    --expect(1, cn, "number")
    if cn == 16 then
        term.setGraphicsMode(1)
    elseif cn == 256 then
        term.setGraphicsMode(2)
    else
        error("Graphics mode not supported")
    end
end
function disableGraphicsMode()
    term.setGraphicsMode(0)
end
function screenshot()
    term.screenshot()
end

