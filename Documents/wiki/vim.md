# Vim

After having used [Spacevim](https://spacevim.org/) for quite a while,
I've decided to switch back to classic Neovim and keep configuration as tight and minimal as possible.

I keep my configuration in casual `~/.vimrc` which is sourced by Neovim in `init.vim`.

## Vim-plug
Some functionality still requires me to install a few plugins, and `vim-plug` is my plugin manager of choice.
Intsallation (note that command is custom):
```bash
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

All plugins are listed in [`.config/nvim/vim-plug/plugins.vim`](../../.config/nvim/vim-plug/plugins.vim) and sourced from `init.vim` directly (before `~/.vimrc`).

## Featured plugins

### [Defx](https://github.com/Shougo/defx.nvim)
I like to always keep a tree-view of my project at hand. This is the best option out there - dark-powered file explorer.

### [Startify](https://github.com/mhinz/vim-startify)
Provides a cool startup screen. Also allows to manage sessions more easily, but I haven't got used to them yet.
Not essential, I might get rid of it in future.

### [VimWiki](https://github.com/vimwiki/vimwiki)
VimWiki made this documentation possible.

Custom mapping: `<Leader>c` - toggle conceal level (to comfortably edit links)

