-- wrapper for shell api so that other apis can use shell
_G.shr = {}
function shr.run(r)
    shell.run(r)
end
function shr.exit()
    shell.exit()
end
function shr.setPath(p)
    shell.setPath(p)
end
