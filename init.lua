vim.opt.guicursor = ""
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.autoindent = true
vim.opt.smartindent = true       

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "   
require("lazy").setup({
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
    },  
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
          require("telescope").setup({
            defaults = {
                preview = {
                    treesitter = false,
                }
            }
          })
          local builtin = require("telescope.builtin")
          vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Find Files" })
          vim.keymap.set("n", "<leader>sif", builtin.live_grep,  { desc = "Live Grep" })
          vim.keymap.set("n", "<leader><leader>", builtin.buffers,    { desc = "Buffers" })
        end,
    },
    {
      "nvim-tree/nvim-tree.lua",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      config = function()
        require("nvim-tree").setup({})
        vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "File Explorer" })
      end,
    },
    {
      "folke/tokyonight.nvim",
      config = function()
        require("tokyonight").setup({
          style = "night", 
        })
        vim.cmd("colorscheme tokyonight")
      end,
    },
})

vim.cmd([[
  highlight Normal guibg=NONE ctermbg=NONE
]])
vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })
vim.api.nvim_set_hl(0, "NvimTreeEndOfBuffer", { bg = "none" })
vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
