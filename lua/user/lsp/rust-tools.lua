 -- vim.list_extend(vim.lsp.automatic_configuration.skipped_servers, { "rust_analyzer" })

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
      on_attach = require("vim.lsp").common_on_attach,
      on_init = require("vim.lsp").common_on_init,
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

-- rt.setup{
--     tools = {
--       executor = require("rust-tools/executors").termopen, -- can be quickfix or termopen
--       reload_workspace_from_cargo_toml = true,
--       inlay_hints = {
--         auto = true,
--         only_current_line = false,
--         show_parameter_hints = true,
--         parameter_hints_prefix = "<-",
--         other_hints_prefix = "=>",
--         max_len_align = false,
--         max_len_align_padding = 1,
--         right_align = false,
--         right_align_padding = 7,
--         highlight = "Comment",
--       },
--       hover_actions = {
--         --border = {
--         --        { "╭", "FloatBorder" },
--         --        { "─", "FloatBorder" },
--         --        { "╮", "FloatBorder" },
--         --        { "│", "FloatBorder" },
--         --        { "╯", "FloatBorder" },
--         --        { "─", "FloatBorder" },
--         --        { "╰", "FloatBorder" },
--         --        { "│", "FloatBorder" },
--         --},
--         auto_focus = true,
--       },
--     },
--     server = {
--       on_attach = require("vim.lsp").common_on_attach,
--       on_init = require("vim.lsp").common_on_init,
--       settings = {
--         ["rust-analyzer"] = {
--           checkOnSave = {
--             command = "clippy"
--           }
--         }
--       },
--     },
-- }
--

