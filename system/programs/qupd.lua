local qf = fs.open("/updater/updqueue/qupdg.lua","w")
qf.write("fs.delete(\"/system\")\nshell.run(\"/updater/github TheRealEli310 cosc /system\")\nfs.delete(\"/updater/updqueue/qupdg.lua\")")
qf.close()
shell.run("reboot")
