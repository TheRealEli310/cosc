function table.contains(table, element)
  for _, value in pairs(table) do
    if value == element then
      return true
    end
  end
  return false
end
--coroutine.yield()
while true do 
  flist = fs.list(shell.dir())
  luas = fs.find("*.lua")
  flist[#flist+1] = "+"
  flist[#flist+1] = ".."
  sel = zipmenu.drawMenu("File Explorer",flist)
  if sel == (#flist - 1) then
    shell.run("edit",utils.uiRead("Filename:"))
  elseif not fs.isDir(shell.resolve(flist[sel])) then
    --if table.contains(luas,shell.resolveProgram(flist[sel])) then
    --  shell.run(flist[sel])
    --else
      shell.run("edit",flist[sel])
    --
    --end
  elseif fs.isDir(shell.resolve(flist[sel])) then
    shell.run("cd "..flist[sel])
  end
  coroutine.yield()
end

