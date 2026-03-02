local M = {}
local config = require("yara.config")

function M.setup(options)
    config.extend_options(options or {})
end

---@param name? string
function M.colorscheme(name)
    require("yara.theme").colorscheme(name)
end

return M
