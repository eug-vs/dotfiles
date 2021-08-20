" Startify configuration
let g:startify_session_delete_buffers = 1
let g:startify_session_persistence = 1
let g:startify_change_to_vcs_root = 1
let g:startify_padding_left = 4

let g:startify_custom_header = startify#pad(startify#fortune#cowsay('', '═','║','╔','╗','╝','╚'))

let g:startify_bookmarks = [
  \ { 'r': '~/.vimrc' },
  \ { 'z': '~/.zshrc' },
\ ]

let g:startify_lists = [
  \ { 'type': 'bookmarks', 'header': ['   Bookmarks:'] },
  \ { 'type': 'dir', 'header': ['   Recently edited files:'] },
  \ { 'type': 'sessions', 'header': ['   Sessions:'] },
\]

autocmd VimEnter *
  \   if !argc()
  \ |   Startify
  \ |   Defx
  \ |   wincmd w
  \ | endif
