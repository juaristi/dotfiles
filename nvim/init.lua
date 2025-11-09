require("config.lazy")

vim.g.mapleader = ","

vim.cmd([[set number]])

-- Set up default colorscheme
vim.cmd([[colorscheme tokyonight]])

-- Set up indentation rules
vim.cmd([[
  function! SetInd(ts, sw, sts, spaces)
      execute "set ts=" . a:ts . " sw=" . a:sw . " sts=" . a:sts
      if a:spaces
          execute "set si et"
      else
          execute "set nosi noet"
      endif
  endfunction

  " Rudimentary folding for Python - works well in most cases
  au FileType python :set foldmethod=indent

  au FileType lua :call SetInd(2,2,2,1)
  au FileType yml :call SetInd(2,2,2,1)
  au FileType dockerfile :call SetInd(4,4,4,1)
  au FileType sh :call SetInd(4,4,4,1)
]])

-- Other mappings
vim.cmd([[nmap <F4> :syntax sync fromstart<CR>]])

-- When editing Terraform files, apply terraform fmt on saving
vim.cmd([[au BufWritePre *.tf :TerraformFmt]])
