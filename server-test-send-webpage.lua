wifi.sta.disconnect()
wifi.setmode(wifi.STATIONAP)
local cfg = {}
cfg.ssid = "mysticalNetwork"
cfg.pwd = "mystical5000"
wifi.ap.config(cfg)
local srv=net.createServer(net.TCP, 300)
srv:listen(80,function(conn)
    conn:on("receive", function(client, request)
        print("recieve")
        print(request)
        sendWebpage(client, 'mainpage.html')
    end)
end)

function sendWebpage(client, pageFile)
    line = file.readline()
    while (line~=nul) do
        file.open(pageFile)
        client:send(line)
        print(line)
    end
end
