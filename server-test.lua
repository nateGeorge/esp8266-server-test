wifi.sta.disconnect()
wifi.setmode(wifi.STATIONAP)
local cfg = {}
cfg.ssid = "mysticalNetwork"
cfg.pwd = "mystical5000"
wifi.ap.config(cfg)
local srv=net.createServer(net.TCP, 300)
srv:listen(80,function(conn)
    conn:on("receive", function(client,request)
        print("recieve")
        print(request)
    end)
    conn:on("connection", function(client)
        print("connection")
    end)
    conn:on("reconnection", function(client)
        print("reconnection")
    end)
    conn:on("disconnection", function(client)
        print("disconnection")
    end)
    conn:on("sent", function(client)
        print("sent")
    end)
end)