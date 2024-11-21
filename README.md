# spec-utils.nvim

**spec-utils.nvim** is a Neovim plugin providing utilities to simplify the creation and execution of tests in Lua.  

## Project Structure

```plaintext
.
├── lua
│   └── spec-utils
│       ├── file.lua
│       ├── init.lua
│       ├── tests
│       │   ├── file_spec.lua
│       │   └── utils_spec.lua
│       └── utils.lua
└── plugin
    └── spec-utils.lua
```

## Features

- **Utils**: General-purpose utility functions.  
- **File**: General-purpose to handle the path functions.  
- **Test Support**: Compatible with [plenary.nvim](https://github.com/nvim-lua/plenary.nvim).  

## Installation

Using [Lazy.nvim](https://github.com/folke/lazy.nvim):  

```lua
{
  'ally1002/spec-utils.nvim',
  dependencies = {
    { 'nvim-lua/plenary.nvim', name = 'plenary' },
  },
}
```

## Usage

### Example

Add the following configuration to your `init.lua` or `init.vim`:  

```lua
{
  'ally1002/spec-utils.nvim',
  dependencies = {
    { 'nvim-lua/plenary.nvim', name = 'plenary' },
  },
  config = function()
    local Utils = require 'spec-utils.utils'
    local File = require 'spec-utils.file'

    vim.keymap.set('n', '<leader><C-t>', function()
      Utils.switch_between_test_and_implementation(vim.api.nvim_buf_get_name(0))
    end)

    vim.keymap.set('n', '<leader><C-y>', function()
      File.copy_test_file(vim.api.nvim_buf_get_name(0))
    end)
  end,
}
```

### Writing Tests

Refer to the examples in the [`lua/spec-utils/tests`](lua/spec-utils/tests) directory to understand how to use each module.

### Dynamic Reloading

During development, you can reload the plugin using a key mapping:  

```lua
vim.keymap.set('n', '<leader><C-r>', function()
  spec_utils:_debug_reload()
end)
```

## Development

### Running Tests

Tests are executed using the [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) framework. Run the tests with:  

```bash
:lua require('plenary.test_harness').test_directory('lua/spec-utils/tests')
```

### Test Organization

Tests are organized by module for easy expansion and maintenance:  

- **Utils tests**: `utils_spec.lua`  
- **File tests**: `file_spec.lua`  

## Contributing

Contributions are welcome! Follow these steps:  

1. Fork this repository.  
2. Create a new branch: `git checkout -b my-feature`.  
3. Commit your changes: `git commit -m 'Add my feature'`.  
4. Push to the branch: `git push origin my-feature`.  
5. Open a pull request.  

## License

This project is licensed under the GNU General Public License v3.0. See the [LICENSE](./LICENSE) file for details.  
