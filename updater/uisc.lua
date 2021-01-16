local tArgs = {...}
local w, h = term.getSize()
local wm, hm = w/2, h/2
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
term.setTextColor(colors.lime)
cPrint(string.char(140):rep(w+1), -4)
cPrint(string.char(140):rep(w+1), 4)
term.setTextColor(colors.white)
if tArgs[2] and tArgs[3] and tArgs[4] and tArgs[5] then
  cPrint(tArgs[1],-2)
  cPrint(tArgs[2],-1)
  cPrint(tArgs[3],0)
  cPrint(tArgs[4],1)
  cPrint(tArgs[5],2)
elseif tArgs[2] and tArgs[3] and tArgs[4] then
  cPrint(tArgs[1],-2)
  cPrint(tArgs[2],-1)
  cPrint(tArgs[3],1)
  cPrint(tArgs[4],2)
elseif tArgs[2] and tArgs[3] then
	cPrint(tArgs[1],-1)
	cPrint(tArgs[2],0)
	cPrint(tArgs[3],1)
elseif tArgs[2] then
	cPrint(tArgs[1],-1)
	cPrint(tArgs[2],1)
else
	cPrint(tArgs[1],0)
end
term.setBackgroundColor(colors.black)
term.setCursorPos(1,1)
