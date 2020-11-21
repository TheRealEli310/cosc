function drawpixel(x,y,c)
    term.setPixel(x,y,c)
end
function drawRect(x,y,x2,y2,c)
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

