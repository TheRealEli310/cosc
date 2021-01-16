updatepkg = ({...})[1]
function screen()
--while true do --< To make sure that the updater displays properly
shell.run("/updater/uisc \"Updating COSC\" \"Don't turn off your pc\"")
sleep(0.5)
--end
end
function installer()
shell.run(updatepkg.." silent")
end
parallel.waitForAll(screen,installer)

