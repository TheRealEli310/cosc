-- Setup paths
local sPath = ".:/system/programs:/rom/programs"
if term.isColor() then
    sPath = sPath..":/rom/programs/advanced"
end
if turtle then
    sPath = sPath..":/rom/programs/turtle"
else
    sPath = sPath..":/rom/programs/rednet:/rom/programs/fun"
    if term.isColor() then
        sPath = sPath..":/rom/programs/fun/advanced"
    end
end
if http then
    sPath = sPath..":/rom/programs/http"
end
shell.setPath( sPath )