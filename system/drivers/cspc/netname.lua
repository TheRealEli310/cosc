function run()
    e,p,req,resp = os.pullEvent("http_request")
    n = os.getComputerLabel() or os.getComputerID()
    resp.write(n)
    resp.close()
end
function init()
    http.addListener(9654)
end
