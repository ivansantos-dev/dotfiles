# install dotfiles
`stow /path-to-dotfiles/dots -t ~ --dotfiles`

# Start timer
`/opt/homebrew/bin/sketchybar --add item timer left --set timer update_freq=1 icon=􁖫 label="25:00" script="~/.config/sketchybar/plugins/timer.sh" click_script="~/.config/sketchybar/plugins/timer_end.sh"`


# for work
`.gitconfig`
```
[includeIf "gitdir:~/personal/"]
    path = ~/.gitconfig-personal
```

`~/.gitconfig-personal`
```
[user]
        email = email@email.com
        name = Ivan Santos

```
