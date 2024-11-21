local Path = require("plenary.path")
local File = require("spec-utils.file")

local M = {}

---@param current_buf string
function M.switch_between_test_and_implementation(current_buf)
	local path = Path:new(current_buf):make_relative()
	local dir

	if path:match("spec") then
		dir = File.implementation_file_path(path)
	end

	if not path:match("spec") then
		dir = File.test_file_path(path)
	end

	vim.cmd("edit " .. dir)
end

return M
