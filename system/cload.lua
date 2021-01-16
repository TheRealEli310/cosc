os.loadAPI("/system/drivers/global/json")
_G.reg = {}
function os.loadReg(f)
    fh = fs.open(f,"r")
    _G.reg[fs.getName(f)] = textutils.unserialise(fh.readAll())
    fh.close()
end
os.loadReg("/system/config/users")
os.loadReg("/system/config/software")
os.loadReg("/system/config/system")
if reg.software.Goldcore.COSC.ui.AllowTermination == 0 then
os.pullEvent = os.pullEventRaw
end
--_G.reg.users = regtemp
_G.udb = reg.users
if fs.exists("/updater/updqueue") then
    upd = fs.list("/updater/updqueue")
    for k,v in pairs(upd) do
        shell.run("/updater/update /updater/updqueue/"..v)
    end
    term.setBackgroundColor(colors.black)
end
if mounter then
    --print("Running on CraftOS-PC. Loading CraftOS-PC drivers...")
    drvpc = fs.list("/system/drivers/cspc")
    --shell.setDir("/system/drivers/cspc")
    for k,v in pairs(drvpc) do
        --print("/system/drivers/cspc/"..v)
        os.loadAPI("/system/drivers/cspc/"..v)
    end
end
drv = fs.list("/system/drivers/global")
for k,v in pairs(drv) do
    --print("/system/drivers/global/"..v)
    os.loadAPI("/system/drivers/global/"..v)
end
shell.run("/system/startup.lua")
os.ov = os.version
function os.version()
    return os.ov().." (COSC)"
end
shell.run("clear")
