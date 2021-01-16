-- Start load API --
_G.ndenv = {}
function ndenv.gowin(w)
    ndenv.cwinb.setBackgroundColor(colors.cyan)
    ndenv.cwinb.clear()
    ndenv.cwinb.setCursorPos(1,1)
    ndenv.cwinb.write(ndenv.wtitle)
    ndenv.cwinb.setCursorPos(w,1)
    ndenv.cwinb.setBackgroundColor(colors.red)
    ndenv.cwinb.write("X")
    term.redirect(ndenv.cwin)
end
function ndenv.run(title,prg)
    local w,h = term.getSize()
    ndenv.cwinb = window.create(term.native(),1,1,w,h,true)
    ndenv.cwin = window.create(term.native(),2,2,w-2,h-2,true)
    ndenv.wtitle = title
    ndenv.gowin(w)
    term.redirect(ndenv.cwin)
    term.clear()
    term.setCursorPos(1,1)
    shell.run(prg)
end
function ndenv.exit()
    term.redirect(term.native())
    term.clear()
    term.setCursorPos(1,1)
end
-- End load API --

-- Start UI --
while true do
    cmd = utils.uiRead("Command:")
    ndenv.run(cmd,cmd)
    ndenv.exit()
    if cmd == "logoff" then
        break
    end
end
