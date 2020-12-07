# Xorg

## i3wm

### Workspace generator
Script `/bin/i3-workspace.sh` provides an easy-to-use layout generator:
```bash
./i3-workspace.sh ~/path/to/my/working/directory
```
It will open `nvim` + `alacritty` in a new workspace. It is prefered to move it to bin and alias to some command in [vifm](vim.md).

### Bassboost mode
While key combination `win+b` is pressed, **crazy bassboost mic mode** is active. Basically it's just the toggle between two mic volumes - default and very high (up to the point when it starts distorting).
This is just for fun and probably should not be here, but I decided to leave it anyway.

**Note**: using this is dangerous since it might hurt someone's ears or damage the microphone.

