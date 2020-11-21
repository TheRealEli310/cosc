updatepkg = ({...})[1]
function screen()
while true do
shell.run("/system/uisc \"Updating COSC\" \"Don't turn off your pc\"")
sleep(0.2)
end
end
function installer()
shell.run(updatepkg.." silent")
end
parallel.waitForAny(screen,installer)

