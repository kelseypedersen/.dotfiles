# .dotfiles

- Use of [RCM](http://thoughtbot.github.io/rcm/rcm.7.html) to symlink my dotfiles.
- Use of `git init` in the newly created `.dotfiles` folder.
- Go to the `.dotfiles` directly and push changes to master.

## How to add a new dotfile to the .dotfiles/ directory

- If creating a new file, create it in the home directory, e.g. `/Users/kelseypedersen/`.
- Create the file with the `.` beforehand to rep a dotfile. See `~/.vimrc` for reference.
- `mkrc ~/.vimrc`
- This creates a symlink to the `.dotfiles` directory
- The symlink files are represented WITHOUT a dot before the name
- E.g. `/Users/kelseypedersen1/.vimrc` -> `/Users/kelseypedersen1/.dotfiles/vimrc`

## How to Push Changes to Github
- Sym link between .vimrc --> .dotfiles/vimrc
- To update, go to ~/.dotfiles
- Add changes to git, commit and push to repo
