shell.run("clear")
--shell.run("bootmgr")
--print("Loading files...")
--print("startup.lua")
--print("/system/cload.lua")
--shell.run("/system/crashMsg CRITICAL_PROCESS_DIED")
shell.run("/bootAnim.lua")
shell.run("clear")
if reg == nil then
print("The system could not start cload. You must reinstall COSC.")
while true do
sleep(2)
end
end
if reg.software.Goldcore.Setup.RestartSetup == 1 then
reg.software.Goldcore.Setup.OOBEComplete = 0
reg.software.Goldcore.Setup.OOBEInProgress = 0
end
if (reg.software.Goldcore.Setup.OOBEComplete == 0) and (reg.software.Goldcore.Setup.OOBEInProgress == 0) then
shell.run(reg.software.Goldcore.Setup.CMDLine)
elseif reg.software.Goldcore.Setup.OOBEInProgress == 1 then
printError("The system rebooted while OOBE was in progress. You must reinstall COSC.")
sleep(2)
os.reboot()
end
term.redirect(term.native())
function userenv()
--print("/system/programs/shell.lua")
shell.run("/system/ui/logonui")
--shell.run("/system/crashMsg SHELL_DIED")
shell.run("/system/userinit")
end
function servicenetname()
netname.init()
while true do
netname.run()
--coroutine.yield()
end
end
--parallel.waitForAny(userenv,servicenetname)
userenv()