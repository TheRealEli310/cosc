--[[>   COSC UTILS <> Copyright ©2020 eli310 & QuickMuffin8782   <]]--
--[[> Main driver for utilities for COSC. Use at will with code. <]]--

--local expect = require("cc.expect").expect -- Grab the built-in expect function

local function notMadeErr(name)
    error("attempt to call a unsupported function" .. (name and " (" .. name .. ")" or ""), 0)
end

function crash(errCode)
    shr.run("/system/crashMsg.lua \"" .. errCode .. "\"") -- used for executing the crash message
end

function uiRead(string_prompt, string_charReplace, table_history, function_complete, string_startWith)
    --expect(1, string_prompt, "string")
    --expect(2, string_charReplace, "nil", "string")
    --expect(3, table_history, "nil", "table")
    --expect(4, table_history, "nil", "function")
    --expect(5, string_startWith, "nil", "string")
    local w, h = term.getSize()
    local wm, hm = (w/2), (h/2)
    term.setBackgroundColor(colors.cyan)
    term.setTextColor(colors.white)
    term.clear()
    term.setCursorPos(1,1)
    term.setCursorPos(1, h - 2)
    term.write(string_prompt)
    term.setBackgroundColor(colors.gray)
    term.setTextColor(colors.white)
    term.setCursorPos(1, h - 1)
    term.clearLine()
    local o = read(string_charReplace, table_history, function_complete, string_startWith)
    term.setBackgroundColor(colors.black)
    term.setTextColor(colors.white)
    term.clear()
    term.setCursorPos(1,1)
    return o
end

function system()
    return {
        utilVer = "1.0.0",
        osCodename = "Neptune",
        osVersionRange = "1.x --> Present",
        ui = {
            read = uiRead,
            shell = shell,
            reg = reg,
        },
    }
end
