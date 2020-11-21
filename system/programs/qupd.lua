local qf = fs.open("/system/updqueue/qupdg.lua","w")
qf.write("shell.run(\"/system/github TheRealEli310 cosc /\")\nfs.delete(\"/system/updqueue/qupdg.lua\")")
qf.close()
