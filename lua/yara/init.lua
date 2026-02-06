local M = {}
local config = require("yara.config")

function M.setup(options)
    config.extend_options(options or {})
end

function M.colorscheme()
    require("yara.theme").colorscheme()
end

return M
