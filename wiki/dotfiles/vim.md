# Vim

After having used [Spacevim](https://spacevim.org/) for quite a while,
I've decided to switch back to classic Neovim and keep configuration as tight and minimal as possible.

I keep my configuration in casual `~/.vimrc` which is sourced by Neovim in `init.vim`.

## Vim-plug
Some functionality still requires me to install a few plugins, and `vim-plug` is my plugin manager of choice.
Intsallation (note that command differs from default):
```bash
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

All plugins are listed in [`config/nvim/vim-plug/plugins.vim`](vfile:../config/nvim/vim-plug/plugins.vim) and sourced from `init.vim` directly (before `~/.vimrc`).
Current list of plugins:
 - Defx - I like to always keep a tree-view of my project at hand. This is the best option out there
 - Startify - Cool startup screen and session manager
 - Vimwiki - Manage my markdown docs

## NerdFonts
Download from [AUR](https://aur.archlinux.org/packages/nerd-fonts-dejavu-complete/)

## VimWiki
`VimWiki` can be accessed by `<Leader>ww` from any `Vim` instance (requires `env` repo to be in `~/Documents/Projects/`).

To toggle conceal level (to comfortably edit links) use `<Leader>c`.

## Vifm

### Inactive pane displays ugly
Remove line containing `OtherWin` in [`$VIFM/colors/Default.vifm`](vfile:~/.config/vifm/colors/Default.vifm)

### Remove borders
Replace all occurences of `ctermbg=white` with `ctermbg=black` in [the same file](vfile:~/.config/vifm/colors/Default.vifm).

### Icons
Support icons - extend [`vifmrc`](vfile:~/.config/vifm/vifmrc):
```
" file types
set classify=' :dir:/, :exe:, :reg:, :link:'
" various file names
set classify+=' ::../::, ::*.sh::, ::/^copying|license$/::, ::.git/,,*.git/::, ::*.epub,,*.fb2,,*.djvu::, ::*.pdf::, ::*.htm,,*.html,,**.[sx]html,,*.xml::'
" archives
set classify+=' ::*.7z,,*.ace,,*.arj,,*.bz2,,*.cpio,,*.deb,,*.dz,,*.gz,,*.jar,,*.lzh,,*.lzma,,*.rar,,*.rpm,,*.rz,,*.tar,,*.taz,,*.tb2,,*.tbz,,*.tbz2,,*.tgz,,*.tlz,,*.trz,,*.txz,,*.tz,,*.tz2,,*.xz,,*.z,,*.zip,,*.zoo::'
" images
set classify+=' ::*.bmp,,*.gif,,*.jpeg,,*.jpg,,*.ico,,*.png,,*.ppm,,*.svg,,*.svgz,,*.tga,,*.tif,,*.tiff,,*.xbm,,*.xcf,,*.xpm,,*.xspf,,*.xwd::'
" audio
set classify+=' ::*.aac,,*.anx,,*.asf,,*.au,,*.axa,,*.flac,,*.m2a,,*.m4a,,*.mid,,*.midi,,*.mp3,,*.mpc,,*.oga,,*.ogg,,*.ogx,,*.ra,,*.ram,,*.rm,,*.spx,,*.wav,,*.wma,,*.ac3::'
" media
set classify+=' ::*.avi,,*.axv,,*.divx,,*.m2v,,*.m4p,,*.m4v,,.mka,,*.mkv,,*.mov,,*.mp4,,*.flv,,*.mp4v,,*.mpeg,,*.mpg,,*.nuv,,*.ogv,,*.pbm,,*.pgm,,*.qt,,*.vob,,*.wmv,,*.xvid::'
" office files
set classify+=' ::*.doc,,*.docx::, ::*.xls,,*.xls[mx]::, ::*.pptx,,*.ppt::'
" development
set classify+=' ::*.js,,*.jsx::, ::*.ts,,*.tsx::, ::*.md::, ::*.json::, ::*.c,,*.cc,,*.h,,*.cpp::, ::*.vim::'
```


### Open dir as i3 workspace
To use [workspace generator script](xorg.md) in `vifm`, add this line to [`vifmrc`](vfile:~/.config/vifm/vifmrc), preferably where all `!command` lines are (around line ~140):
```
command! w :!i3-workspace.sh %d/%c
```

