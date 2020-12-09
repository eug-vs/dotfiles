call plug#begin('~/.config/nvim/autoload/plugged')
    Plug 'mhinz/vim-startify', {'branch': 'center'}
    Plug 'vimwiki/vimwiki'
    " Dark-powered file explorer
    Plug 'shougo/defx.nvim',
    Plug 'kristijanhusak/defx-icons'
    Plug 't9md/vim-choosewin'
    " Tmux navigator
    Plug 'christoomey/vim-tmux-navigator'
    " Color scheme
    Plug 'morhetz/gruvbox'
call plug#end()
