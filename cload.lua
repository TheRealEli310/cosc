os.loadAPI("/system/drivers/global/json")
if fs.exists("/system/updqueue") then
    upd = fs.list("/system/updqueue")
    for k,v in pairs(upd) do
        shell.run("/system/update /system/updqueue/"..v)
    end
    term.setBackgroundColor(colors.black)
    shell.run("clear")
end
if mounter then
    --print("Running on CraftOS-PC. Loading CraftOS-PC drivers...")
    drvpc = fs.list("/system/drivers/cspc")
    --shell.setDir("/system/drivers/cspc")
    for k,v in pairs(drvpc) do
        print("/system/drivers/cspc/"..v)
        os.loadAPI("/system/drivers/cspc/"..v)
    end
end
drv = fs.list("/system/drivers/global")
for k,v in pairs(drv) do
    print("/system/drivers/global/"..v)
    os.loadAPI("/system/drivers/global/"..v)
end
shell.run("/system/startup.lua")
os.ov = os.version
function os.version()
    return os.ov().." (COSC)"
end
shell.run("shell")
shell.run("/system/crashMsg SHELL_DIED")
