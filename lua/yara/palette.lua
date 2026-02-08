local options = require("yara.config").options

local palettes = {
    dark = {
        bg = "#000000",
        nc = "#000000",
        base = "#101010",
        surface = "#181818",
        overlay = "#282828",
        muted = "#484848",
        subtle = "#484848",
        text = "#ffffff",
        red = "#f43841",
        gold = "#ffdd33",
        rose = "#f43841",
        orange = "#B17F3D",
        blue = "#96a6c8",
        greyblue = "#929B98",
        lavender = "#9e95c7",
        purple = "#565f73",
        green = "#73d936",

        highlight_low = "#101010",
        highlight_med = "#282828",
        highlight_high = "#52494e",
    },
    light = {
        bg = "#ffffff",
        nc = "#ffffff",
        base = "#f5f5f5",
        surface = "#f4f4ff",
        overlay = "#e4e4e4",
        muted = "#95a99f",
        subtle = "#565f73",
        text = "#101010",
        red = "#c73c3f",
        gold = "#cc8c3c",
        rose = "#f43841",
        blue = "#303540",
        lavender = "#9e95c7",
        purple = "#96a6c8",
        green = "#73d936",

        highlight_low = "#f4f4ff",
        highlight_med = "#e4e4e4",
        highlight_high = "#52494e",
    },
}

local function resolve_variant()
    local variant = options.variant or "auto"
    if variant == "dark" or variant == "light" then
        return variant
    end

    return vim.o.background == "light" and "light" or "dark"
end

local palette = vim.deepcopy(palettes[resolve_variant()])

if options.palette ~= nil and next(options.palette) then
    palette = vim.tbl_extend("force", palette, options.palette)
end

return palette
