-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    {
      "habamax/vim-habamax",
      lazy = false,
    },
    {
      "folke/tokyonight.nvim",
      lazy = false,
      priority = 1000,
    },
    {
      "dstein64/vim-startuptime",
      -- lazy-load on a command
      cmd = "StartupTime",
      -- init is called during startup. Configuration for vim plugins typically should be set in an init function
      init = function()
        vim.g.startuptime_tries = 10
      end
    },
    {
      "preservim/nerdtree",
      init = function()
        vim.cmd([[nmap <C-n> :NERDTreeToggle<CR>]])
      end,
    },
    {
      "bling/vim-bufferline",
      -- Prevent vim-bufferline from displaying the list of buffers in the command bar.
      -- The buffers are also shown in vim-airline, and there's no point in showing them twice.
      -- vim-bufferline needs to be installed, or vim-airline will not show the buffers.
      -- See: filename-modifiers for all possible options in g:bufferline_fname_mod.
      init = function()
        vim.cmd([[
          let g:bufferline_echo = 0
          let g:bufferline_show_bufnr = 0
          let g:bufferline_fname_mod = ':.'
        ]])
      end,
    },
    {
      "ojroques/nvim-bufdel",
      -- An alternative: famiu/bufdelete.nvim
      -- But it doesn't support cycling through buffers
      init = function()
        -- Map Ctrl-D (in normal mode) to delete the current buffer
        vim.cmd([[nmap <C-D> :BufDel<CR>]])
      end,
      lazy = false
    },
    {
      "vim-airline/vim-airline",
      init = function()
        -- Register mappings to toggle buffers
        vim.cmd(
          [[
            nmap <Tab> :bn<CR>
            nmap <S-Tab> :bp<CR>
            let g:airline#extensions#tabline#enabled = 1
            let g:airline_section_c = ""
          ]]
        )
      end,
    },
    {
      "tpope/vim-commentary"
    },
    {
      "davidhalter/jedi-vim",
    },
    {
      "hashivim/vim-terraform",
    },
    {
      "preservim/tagbar",
      init = function()
        -- Toggle tagbar with F8
        vim.cmd([[nmap <F8> :TagbarToggle<CR>]])
      end,
    },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  -- install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

-- Prevent nvim-bufdel from closing nvim when the last buffer is closed
require("bufdel").setup {
  quit = false
}
