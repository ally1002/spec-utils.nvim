local Path = require("plenary.path")
local Utils = require("spec-utils.utils")

describe("spec-utils.utils", function()
	it("converts spec path to app path for .rb file", function()
		local test_path = "spec/models/user_spec.rb"
		Utils.switch_between_test_and_implementation(test_path)
		local expected_path = "app/models/user.rb"
		local current_path = Path:new(vim.fn.expand("%:p")):make_relative()
		assert.equals(current_path, expected_path)
	end)

	it("converts app path to spec path for .rb file", function()
		local test_path = "app/models/user.rb"
		Utils.switch_between_test_and_implementation(test_path)
		local expected_path = "spec/models/user_spec.rb"
		local current_path = Path:new(vim.fn.expand("%:p")):make_relative()
		assert.equals(current_path, expected_path)
	end)

	it("converts spec path to app path for .js file", function()
		local test_path = "src/components/example.spec.js"
		Utils.switch_between_test_and_implementation(test_path)
		local expected_path = "src/components/example.js"
		local current_path = Path:new(vim.fn.expand("%:p")):make_relative()
		assert.equals(current_path, expected_path)
	end)

	it("converts app path to spec path for .js file", function()
		local test_path = "src/components/example.js"
		Utils.switch_between_test_and_implementation(test_path)
		local expected_path = "src/components/example.spec.js"
		local current_path = Path:new(vim.fn.expand("%:p")):make_relative()
		assert.equals(current_path, expected_path)
	end)
end)
