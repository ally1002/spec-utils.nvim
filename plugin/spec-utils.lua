if vim.fn.has "nvim-0.7.0" ~= 1 then
  vim.api.nvim_err_writeln "Example.nvim requires at least nvim-0.7.0."
end

vim.api.nvim_create_user_command("SpecUtils", function(opts)
  local File = require "spec-utils.file"

  local command = opts.args

  if command == "copy_current_relative_path" then
    File.copy_current_relative_path()
  elseif command == "copy_test_file" then
    File.copy_test_file(vim.api.nvim_buf_get_name(0))
  elseif command == "copy_implementation_file" then
    File.copy_implementation_file(vim.api.nvim_buf_get_name(0))
  end
end, {
  nargs = 1,
  complete = function()
    return {
      "copy_current_relative_path",
      "copy_test_file",
      "copy_implementation_file",
    }
  end,
})
