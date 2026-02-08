local utilities = {}

---@param color string|number
local function color_to_rgb(color)
    local function byte(value, offset)
        return bit.band(bit.rshift(value, offset), 0xFF)
    end

    local new_color

    if type(color) == "number" then
        new_color = bit.band(color, 0xFFFFFF)
    elseif type(color) == "string" then
        if color:upper() == "NONE" then
            return nil
        end

        local hex = color:match("^#(%x%x%x%x%x%x)$")
        if hex ~= nil then
            new_color = tonumber(hex, 16)
        else
            new_color = vim.api.nvim_get_color_by_name(color)
        end
    else
        return nil
    end

    if new_color == -1 then
        new_color = vim.opt.background:get() == "dark" and 0x000000 or 0xFFFFFF
    end

    return { byte(new_color, 16), byte(new_color, 8), byte(new_color, 0) }
end

local color_cache = {}

---@param color string Palette key or hex value
function utilities.parse_color(color)
    if color == nil then
        return nil
    end

    if color_cache[color] then
        return color_cache[color]
    end

    if type(color) == "number" then
        local parsed = string.format("#%06X", bit.band(color, 0xFFFFFF))
        color_cache[color] = parsed
        return parsed
    end

    if type(color) ~= "string" then
        return nil
    end

    if color:upper() == "NONE" then
        color_cache[color] = "NONE"
        return "NONE"
    end

    color = color:lower()

    if not color:find("#") then
        color = require("yara.palette")[color] or color

        if type(color) == "string" and not color:find("#") then
            local parsed = vim.api.nvim_get_color_by_name(color)
            if parsed ~= -1 then
                color = string.format("#%06X", bit.band(parsed, 0xFFFFFF))
            end
        end
    end

    color_cache[color] = color
    return color
end

local blend_cache = {}

---@param fg string Foreground color
---@param bg string Background color
---@param alpha number Between 0 (background) and 1 (foreground)
function utilities.blend(fg, bg, alpha)
    local cache_key = tostring(fg) .. tostring(bg) .. tostring(alpha)
    if blend_cache[cache_key] then
        return blend_cache[cache_key]
    end

    local fg_rgb = color_to_rgb(fg)
    local bg_rgb = color_to_rgb(bg)

    if fg_rgb == nil or bg_rgb == nil then
        return fg
    end

    local function blend_channel(i)
        local ret = (alpha * fg_rgb[i] + ((1 - alpha) * bg_rgb[i]))
        return math.floor(math.min(math.max(0, ret), 255) + 0.5)
    end

    local result = string.format("#%02X%02X%02X", blend_channel(1), blend_channel(2), blend_channel(3))

    blend_cache[cache_key] = result
    return result
end

return utilities
