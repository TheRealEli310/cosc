coroutine.yield()
shell.run("clear")
_G.userloggedin = true
while _G.userloggedin do
shell.run(reg.system.Goldcore.COSC.Userinit.CMDLine)
end
