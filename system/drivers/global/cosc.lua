function getUser(usrname)
    return _G.udb[usrname]
end
function getUsers()
    return _G.udb
end
function getUsernames()
    r = {}
    for n,v in pairs(_G.udb) do
        r[#r+1] = n
    end
    return r
end
function createUser(n,p)
    _G.udb[n] = {n,p}
    cosc.commitUDB()
end
function commitUDB()
    reg.users = _G.udb
    cosc.saveReg("users")
end
function saveReg(n)
    rf = fs.open("/system/config/"..n,"w")
    rf.write(textutils.serialise(reg[n]))
    rf.close()
end
function deleteUser(n)
    _G.udb[n] = nil
    cosc.commitUDB()
end
