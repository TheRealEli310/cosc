local qf = fs.open("/system/updqueue/qupdg.lua","w")
qf.write("fs.delete(\"/system\")\nshell.run(\"/updater/github TheRealEli310 cosc /system\")\nfs.delete(\"/updater/updqueue/qupdg.lua\")")
qf.close()
