" I use this configuration in exvim.
" This should go in:
"     vimfiles/bundle/ex-config/after/plugin/config.vim
" after config. If you have plugin settings wants to config after plugin loaded, do it here.
set nobackup
set mouse=a

unmap s
unmap S
unmap R

map <F3> <C-]>
map <F8> :TlistToggle<CR>
