local p = require("yara.palette")
local config = require("yara.config")

local bg_base = p.overlay
if config.options.styles.transparency then
    bg_base = "NONE"
end

return {
    normal = {
        a = { bg = p.rose, fg = p.base, gui = "bold" },
        b = { bg = p.surface, fg = p.text },
        c = { bg = bg_base, fg = p.text },
    },
    insert = {
        a = { bg = p.lavender, fg = p.base, gui = "bold" },
        b = { bg = p.surface, fg = p.text },
        c = { bg = bg_base, fg = p.text },
    },
    visual = {
        a = { bg = p.purple, fg = p.base, gui = "bold" },
        b = { bg = p.surface, fg = p.text },
        c = { bg = bg_base, fg = p.text },
    },
    replace = {
        a = { bg = p.blue, fg = p.base, gui = "bold" },
        b = { bg = p.surface, fg = p.text },
        c = { bg = bg_base, fg = p.text },
    },
    command = {
        a = { bg = p.red, fg = p.base, gui = "bold" },
        b = { bg = p.surface, fg = p.text },
        c = { bg = bg_base, fg = p.text },
    },
    inactive = {
        a = { bg = bg_base, fg = p.lavender, gui = "bold" },
        b = { bg = bg_base, fg = p.subtle },
        c = { bg = bg_base, fg = p.subtle },
    },
}
