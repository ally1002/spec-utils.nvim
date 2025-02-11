local Path = require "plenary.path"

local M = {}

function M.copy_current_relative_path()
  local path = Path:new(vim.api.nvim_buf_get_name(0)):make_relative()

  vim.fn.setreg("+", path)
end

---@param path string
function M.copy_test_file(path)
  local test_path = M.test_file_path(path)

  vim.fn.setreg("+", test_path)
end

---@param path string
function M.copy_implementation_file(path)
  local implementation_path = M.implementation_file_path(path)

  vim.fn.setreg("+", implementation_path)
end

---@param path string
function M.test_file_path(path)
  local spec_path = Path:new(path):make_relative()
  local filetype = path:gsub(".*%.", "")

  if filetype == "rb" then
    spec_path = M.rails_test_file(spec_path)
  else
    spec_path = M.generic_test_file(spec_path, filetype)
  end

  return spec_path
end

---@param path string
function M.implementation_file_path(path)
  local app_path = Path:new(path):make_relative()
  local filetype = path:gsub(".*%.", "")

  if filetype == "rb" then
    app_path = M.rails_implementaion_file(app_path)
  else
    app_path = M.generic_implementaion_file(app_path, filetype)
  end

  return app_path
end

---@param path string
function M.rails_implementaion_file(path)
  return path:gsub("^spec/", "app/"):gsub("_spec.rb$", ".rb")
end

---@param path string
function M.rails_test_file(path)
  if path:match "spec" then
    return path
  else
    return path:gsub("^app/", "spec/"):gsub("%.rb$", "_spec.rb")
  end
end

---@param path string
---@param filetype string
function M.generic_implementaion_file(path, filetype)
  return path:gsub(".spec." .. filetype .. "$", "." .. filetype)
end

---@param path string
---@param filetype string
function M.generic_test_file(path, filetype)
  if path:match "spec" then
    return path
  else
    return path:gsub("%." .. filetype .. "$", ".spec." .. filetype)
  end
end

return M
