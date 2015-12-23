" This was for exvim, but if the exvim developers accept my changes upstream,
" maybe this won't be needed anymore.
" Source this into my .vimrc for the function to work
"     source ~/my-function.vim
function! g:exvim_post_init()
    let mysw = str2nr(vimentry#get('shiftwidth'))
    let mysm = vimentry#get('smartindent')
    let myet = vimentry#get('expandtab')

    echo "Setting shiftwidth to " . mysw . "from " . &sw
    let &sw = mysw

    echo "Setting smartindent to " . mysm
    if mysm == "true"
        set smartindent
    else
        set nosmartindent
    endif

    echo "Setting expandtab to " . myet
    if myet == "true"
        set expandtab
    else
        set noexpandtab
    endif
endfunction
