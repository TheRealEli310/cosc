local tArgs = {...}
term.setCursorPos(1,1)
term.setBackgroundColor(colors.green)
shell.run("clear")
local cPrint = function(text,yoff)
		if not yoff then
			yoff = 0
		end
        local x2,y2 = term.getCursorPos()
        local x,y = term.getSize()
        term.setCursorPos(math.ceil((x / 2) - (text:len() / 2)), (math.ceil(y / 2) + yoff))
        
        print(text)
end
if tArgs[2] and tArgs[3] then
	cPrint(tArgs[1],-1)
	cPrint(tArgs[2],0)
	cPrint(tArgs[3],1)
elseif tArgs[2] then
	cPrint(tArgs[1],-1)
	cPrint(tArgs[2],1)
else
	cPrint(tArgs[1],0)
end