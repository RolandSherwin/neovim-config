local status_ok, rt = pcall(require, "rust-tools")
if not status_ok then
	return
end

-- get keybindings from `handler.lua` and pass it to rust-tools;
-- rust-tools overrides those settings I guess
local lsp_keymaps = require("user.lsp.handlers").lsp_keymaps
rt.setup {
  tools = {
    runnables = {
      use_telescope = true,
    },
    inlay_hints = {
      auto = true,  -- automatically set inlay hints (type hints), def: true
      show_parameter_hints = true, -- def: true
      parameter_hints_prefix = "<-",
      other_hints_prefix = "=>",
    },
  },

  -- all the opts to send to nvim-lspconfig
  -- these override the defaults set by rust-tools.nvim
  -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
  server = {
    -- on_attach is a callback called when the language server attachs to the buffer
    on_attach = function(_, bufnr)
        lsp_keymaps(bufnr)
    end,
    settings = {
      -- to enable rust-analyzer settings visit:
      -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
      ["rust-analyzer"] = {
        -- enable clippy on save
        checkOnSave = {
          command = "clippy",
        },
      },
    },
  },
}
