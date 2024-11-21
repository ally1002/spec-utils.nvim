local M = {}

function M._debug_reload()
	require("lazy.core.loader").reload("spec-utils.nvim")
end

return M
