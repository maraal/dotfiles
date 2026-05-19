hl.monitor({
    output   = "HDMI-A-2",
    mode     = "1920x1080@60",
    position = "0x0",
    scale    = 1,
})

hl.monitor({
    output   = "eDP-1",
    mode     = "1920x1080@165",
    position = "320x1080",
    scale    = 1.5,
})

for i = 1, 5 do
    hl.workspace_rule({ workspace = tostring(i), monitor = "HDMI-A-2" })
end
for i = 6, 10 do
    hl.workspace_rule({ workspace = tostring(i), monitor = "eDP-1" })
end
