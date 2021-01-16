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
    " Editorconfig
    Plug 'editorconfig/editorconfig-vim'
    " Languages
    Plug 'pangloss/vim-javascript'
    Plug 'leafgarland/typescript-vim' "typescript syntax
    Plug 'peitalin/vim-jsx-typescript' "react jsx typescript syntax
    " Git gutter
    Plug 'airblade/vim-gitgutter'
     " Matching brackets
    Plug 'Raimondi/delimitMate'
call plug#end()
