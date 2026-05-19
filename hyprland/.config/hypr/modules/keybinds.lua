local terminal = "foot"

local mainMod = "SUPER"

local closeWindowBind = hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))

hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))

for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("cliphist list | fuzzel --dmenu | cliphist decode | wl-copy"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("foot bluetuith"))
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd("fuzzel"))

-- Screenshots
hl.bind("Print", hl.dsp.exec_cmd("hyprcap shot region -c -w"))
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd("hyprcap shot monitor:active -c -w"))
hl.bind(mainMod .. " + SHIFT + Print", hl.dsp.exec_cmd("hyprcap shot window:active -c -w"))

--Lockscreen

hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))

