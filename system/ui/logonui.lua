at = os.pullEvent
os.pullEvent = os.pullEventRaw
--shell.run("clear")
--local n = os.getComputerLabel() or os.getComputerID()
while true do
coroutine.yield()
users = cosc.getUsernames()
if (users == {}) or (users == nil) then
	users = {"No users!","Please create one!"}
end
sel = zipmenu.drawMenu("Login",users)
user = cosc.getUser(users[sel])
--print(user)
shell.run("clear")
--print("Password for "..usrn)
psk = utils.uiRead("Password:",string.char(7))
if psk == user[2] then
    break
else
    
end
end
--shell.run("/system/uisc Welcome")
shell.run("clear")
os.pullEvent = at
