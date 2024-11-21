local File = require("spec-utils.file")

describe("spec-utils.path", function()
	describe("#copy_current_relative_path", function()
		it("save the current relative path to the clipboard", function()
			local current_path = "src/components/example.js"
			---@diagnostic disable-next-line: duplicate-set-field
			vim.api.nvim_buf_get_name = function()
				return current_path
			end
			File.copy_current_relative_path()
			local copied_path = vim.fn.getreg("+")
			assert.equals(copied_path, current_path)
		end)
	end)

	describe("#copy_test_file", function()
		it("save the test file path to the clipboard", function()
			local test_path = "src/components/example.js"
			local expected_test_path = "src/components/example.spec.js"
			File.copy_test_file(test_path)
			local copied_path = vim.fn.getreg("+")
			assert.equals(copied_path, expected_test_path)
		end)
	end)

	describe("#copy_implementation_file", function()
		it("save the implementation file path to the clipboard", function()
			local implementation_path = "src/components/example.spec.js"
			local expected_implementation_path = "src/components/example.js"
			File.copy_implementation_file(implementation_path)
			local copied_path = vim.fn.getreg("+")
			assert.equals(copied_path, expected_implementation_path)
		end)
	end)

	describe("#test_file_path", function()
		it("return the test file path", function()
			local path = "src/components/example.js"
			local expected_test_path = "src/components/example.spec.js"
			local test_path = File.test_file_path(path)
			assert.equals(test_path, expected_test_path)
		end)
	end)

	describe("#implementation_file_path", function()
		it("return the implementation file path", function()
			local path = "src/components/example.spec.js"
			local expected_implementation_path = "src/components/example.js"
			local implementation_path = File.implementation_file_path(path)
			assert.equals(implementation_path, expected_implementation_path)
		end)
	end)

	describe("#rails_implementaion_file", function()
		it("return the rails implementation file path", function()
			local path = "spec/models/user_spec.rb"
			local expected_implementation_path = "app/models/user.rb"
			local implementation_path = File.rails_implementaion_file(path)
			assert.equals(implementation_path, expected_implementation_path)
		end)
	end)

	describe("#rails_test_file", function()
		it("return the rails test file path", function()
			local path = "app/models/user.rb"
			local expected_test_path = "spec/models/user_spec.rb"
			local test_path = File.rails_test_file(path)
			assert.equals(test_path, expected_test_path)
		end)
	end)

	describe("#generic_implementaion_file", function()
		it("return the generic implementation file path", function()
			local path = "src/components/example.spec.js"
			local expected_implementation_path = "src/components/example.js"
			local implementation_path = File.generic_implementaion_file(path, "js")
			assert.equals(implementation_path, expected_implementation_path)
		end)
	end)

	describe("#generic_test_file", function()
		it("return the generic test file path", function()
			local path = "src/components/example.js"
			local expected_test_path = "src/components/example.spec.js"
			local test_path = File.generic_test_file(path, "js")
			assert.equals(test_path, expected_test_path)
		end)
	end)
end)
