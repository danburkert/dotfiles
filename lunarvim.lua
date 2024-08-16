-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny


lvim.format_on_save = true
lvim.colorscheme = "gruvbox"
vim.opt.background = 'dark'

lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.insert_mode["jk"] = "<ESC>"

vim.o.guifont = "Fira Code:h12"

lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "json",
  "lua",
  "python",
  "rust",
  "scss",
  "sql",
  "toml",
  "typescript",
  "yaml",
}

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "rust_analyzer" })

vim.api.nvim_set_keymap("n", "<m-d>", "<cmd>RustOpenExternalDocs<Cr>", { noremap = true, silent = true })

lvim.builtin.which_key.mappings["C"] = {
  name = "Rust",
  r = { "<cmd>RustLsp runnables<Cr>", "Runnables" },
  t = { "<cmd>RustLsp testables<Cr>", "Testables" },
  e = { "<cmd>RustLsp expandMacro<Cr>", "Macro Expand" },
  h = { "<cmd>RustLsp hover actions<Cr>", "Hover" },
  M = { "<cmd>RustLsp rebuildProcMacros<Cr>", "Rebuild Macros" },
  g = { "<cmd>RustLsp codeAction<Cr>", "Code Action" },
  x = { "<cmd>RustLsp explainError<Cr>", "Explain Error" },
  d = { "<cmd>RustLsp renderDiagnostic<Cr>", "Diagnostic" },
  c = { "<cmd>RustLsp flyCheck<Cr>", "Check" },
  y = { "<cmd>lua require'crates'.open_repository()<cr>", "[crates] open repository" },
  P = { "<cmd>lua require'crates'.show_popup()<cr>", "[crates] show popup" },
  i = { "<cmd>lua require'crates'.show_crate_popup()<cr>", "[crates] show info" },
  f = { "<cmd>lua require'crates'.show_features_popup()<cr>", "[crates] show features" },
  D = { "<cmd>lua require'crates'.show_dependencies_popup()<cr>", "[crates] show dependencies" },
}

lvim.builtin.telescope.defaults = ({
  path_display = { "absolute" },
})

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "black",    filetypes = { "python" } },
  { command = "isort",    filetypes = { "python" } },
  { command = "prettier", filetypes = { "html", "scss", "typescript", "typescriptreact" } },
}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "eslint_d", filetypes = { "typescriptreact" } },
}

lvim.plugins = {
  {
    'mrcjkb/rustaceanvim',
    version = '^4',
    lazy = false,
    ft = { "rust" },
    config = function()
      vim.g.rustaceanvim = {
        server = {
          on_attach = require("lvim.lsp").common_on_attach,
          settings = {
            -- rust-analyzer language server configuration
            ['rust-analyzer'] = {
              ['files'] = {
                ['excludeDirs'] = {
                  'node_modules',
                  'static',
                  'venv',
                }
              }
            },
          },
        },
      }
    end,
  },
  {
    "saecki/crates.nvim",
    version = "v0.4",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup()
    end,
  },
  { "ellisonleao/gruvbox.nvim" },
  { "tpope/vim-surround" },
  { "tpope/vim-repeat" },
}
