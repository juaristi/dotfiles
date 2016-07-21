# [fresh](https://github.com/freshshell/fresh) dotfiles

My dotfiles, managed with `fresh`.
Destination path: `~/code/dotfiles`

## Installation
```
FRESH_LOCAL="~/code/dotfiles" FRESH_LOCAL_SOURCE=juaristi/dotfiles bash -c "`wget -O- get.freshshell.com`"
```

## TODO list

[ ] My `.bashrc` should have `PATH="$PATH:~/code/exvim"` for the `exvim` executable to work. Ideally, this should be automatically added by fresh.
[ ] Ideally, also add `export EDITOR=vim` and all the other handy tweaks I have to my `.bashrc`.
