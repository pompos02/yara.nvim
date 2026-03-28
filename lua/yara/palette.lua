local options = require("yara.config").options

local palettes = {
    grey = {
        bg = "#181818",
        nc = "#181818",
        base = "#202020",
        surface = "#282828",
        overlay = "#383838",
        muted = "#585858",
        subtle = "#676666",
        text = "#e4e4ef",
        red = "#f43841",
        gold = "#ffdd33",
        rose = "#f43841",
        orange = "#B17F3D",
        blue = "#96a6c8",
        greyblue = "#94B0A6",
        lavender = "#9e95c7",
        purple = "#565f73",
        green = "#73d936",

        highlight_low = "#101010",
        highlight_med = "#282828",
        highlight_high = "#52494e",
    },

    low = {
        bg = "#181818",
        nc = "#181818",
        base = "#1a1a1a",
        surface = "#222222",
        overlay = "#2f2f2f",
        muted = "#4d4d4d",
        subtle = "#5b5a5a",
        text = "#9d9da1",
        red = "#b3575c",
        gold = "#b5a76b",
        rose = "#b3575c",
        orange = "#756049",
        blue = "#676f80",
        greyblue = "#5e6b67",
        lavender = "#656273",
        purple = "#454954",
        green = "#5c784d",

        highlight_low = "#0c0c0c",
        highlight_med = "#222222",
        highlight_high = "#464045",
    },

    dark = {
        bg = "#000000",
        nc = "#000000",
        base = "#101010",
        surface = "#181818",
        overlay = "#282828",
        muted = "#484848",
        subtle = "#575656",
        text = "#ffffff",
        red = "#f43841",
        gold = "#ffdd33",
        rose = "#f43841",
        orange = "#B17F3D",
        blue = "#96a6c8",
        greyblue = "#94B0A6",
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
        greyblue = "#008c99",
        subtle = "#565f73",
        text = "#000000",
        red = "#d11500",
        orange = "#634b2f",
        gold = "#ff8c00",
        rose = "#f40064",
        blue = "#0057d1",
        lavender = "#d100bf",
        purple = "#c486f0",
        green = "#008b0c",

        highlight_low = "#f4f4ff",
        highlight_med = "#e4e4e4",
        highlight_high = "#52494e",
    },
}

local function resolve_variant()
    if vim.o.background == "light" then
        return "light"
    end

    if vim.g.colors_name == "yara-grey" then
        return "grey"
    end

    if vim.g.colors_name == "yara-low" then
        return "low"
    end

    local variant = options.variant or "auto"
    if variant == "dark" or variant == "light" or variant == "grey" or variant == "low" then
        return variant
    end

    return vim.o.background == "light" and "light" or "dark"
end

local palette = vim.deepcopy(palettes[resolve_variant()])

if options.palette ~= nil and next(options.palette) then
    palette = vim.tbl_extend("force", palette, options.palette)
end

return palette
