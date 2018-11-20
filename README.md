# vimconf

Chaoya Li's vim configurations

## Assumptions

- Leader key is `,`
- Vim folder is `~/.vimconf`
  - Plugin folder is `~/.vimconf/vimplug`
  - Undo folder is `~/.vimconf/vimundo`

## Install

- Clone this repo as `~/.vimconf` and make symbolic link `~/.vimrc` to `~/.vimconf/vimrc`
- Install plugins using `vim +PlugInstall +qa 2> /dev/null`

### Offline Usage

Uncompress `vimplug.tar.xz` for offline usage. But the following plugins will be missing.

- YouCompleteMe

### Dependencies

The following dependencies should be installed externally:

- `ack`/`the_silver_searcher`
- `ctags`
- `eslint`
- `prettier`
- `autopep8`
- `clang`
  - `clang-format`
  - `libclang`

Make symbolic links as follows to configure some of these dependencies

```
ln -s ~/.vimconf/.eslintrc.js ~/.eslintrc.js
ln -s ~/.vimconf/.prettierrc.js ~/.prettierrc.js
```

### YCM configuration

YouCompleteMe needs to be compiled after installation. Go to `.vimconf/vimplug/YouCompleteMe` and execute the following command to compile completion support for Go, Javascript, Rust and C/C++.
```
./install.py --go-completer --js-completer  --rust-completer --clang-completer
```

## Usage

- Quick save file: `<leader>w`
- Save file with sudo right: `<leader>W`
- Turn off search highlight: `<leader>Enter`
- Navigation within windows: `<Ctrl>-<h/j/k/l>`
- Maximize current window: `<leader>m`
- Close current window: `<leader>c`
- Toggle paste mode: `<leader>P`
- Toggle spell check: `<leader>S`
- Toggle NETDTree: `<leader>f`
- Find current file in NETDTree: `<leader>F`
- Search pattern in files: `<leader>g`
- Search current pattern under cursor in files: `<leader>G`
- Show git diff: `<leader>gd`
- Show git blame: `<leader>gb`
- Toggle quickfix window: `<leader>q`
- Toggle location window: `<leader>l`
- Go to definition under cursor: `<leader>d`
- Format code with prettier: `<leader>p`
- Toggle tagbar window: `<leader>t`
- Refresh YCM diagnostics: `<leader>r`
- Go to forward word: `<leader><leader>w`
- Go to backward word: `<leader><leader>b`
- Open list for buffers: `<leader>b`
- Open list for MRU files: `<Ctrl>-p`
  - Choose with `<Ctrl>-j/k`
  - Open with `<Ctrl>-t/v/x/o`

## Tips for tmux

If you encounter color problems with tmux, add the following to `.tmux.conf`
```
set-option -g default-terminal "screen-256color"
set-option -sa terminal-overrides ",xterm*:Tc"
```

