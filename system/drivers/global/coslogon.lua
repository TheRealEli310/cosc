function logonUser(user)
    _G.curruser = user
    _G.userloggedin = true
end
function logoffUser()
    _G.curruser = "SYSTEM"
    _G.userloggedin = false
end
