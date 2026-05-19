hl.config({
    general = {
        gaps_in  = 4,
        gaps_out = 8,

        border_size = 2,

        col = {
            active_border   = { colors = {"rgba(cba6f7ee)", "rgba(89b4faee)"}, angle = 45 },
            inactive_border = "rgba(31324488)",
        },

        resize_on_border = true,
    },

    decoration = {
        rounding       = 10,
        rounding_power = 2,

        active_opacity   = 1.0,
        inactive_opacity = 0.9,

        shadow = {
            enabled      = true,
            range        = 12,
            render_power = 2,
            color        = 0xbb1e1e2e,
        },

        blur = {
            enabled          = true,
            size             = 6,
            passes           = 2,
            new_optimizations = true,
            xray             = false,
        },
    },

    animations = {
        enabled = true,
    },
})

hl.curve("smoothOut", { type = "bezier", points = { {0.05, 0.9}, {0.1, 1.05} } })
hl.curve("smoothIn",  { type = "bezier", points = { {0.5,  -0.5}, {0.5, 1.5} } })
hl.curve("snap",      { type = "bezier", points = { {0.15, 0},   {0.1, 1}   } })

hl.animation({ leaf = "global",        enabled = true,  speed = 8,    bezier = "default"   })
hl.animation({ leaf = "windows",       enabled = true,  speed = 5,    bezier = "smoothOut", style = "slide" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4,    bezier = "smoothOut", style = "slide" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 3,    bezier = "smoothIn",  style = "popin 80%" })
hl.animation({ leaf = "border",        enabled = true,  speed = 8,    bezier = "smoothOut" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 5,    bezier = "snap"      })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 5,    bezier = "smoothOut", style = "slide" })
