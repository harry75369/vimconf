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

In order for YouCompleteMe to work in C/C++ projects, please copy its configuration file `~/.vimconf/vimplug/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py` to your home folder or project root.

## Usage

- Save file with sudo right: `<leader>w`
- Turn off search highlight: `<leader>Enter`
- Navigation within windows: `<Ctrl>-<h/j/k/l>`
- Maximize current window: `<leader>m`
- Toggle paste mode: `<leader>P`
- Toggle spell check: `<leader>S`
- Toggle NETDTree: `<leader>f`
- Find current file in NETDTree: `<leader>F`
- Search pattern in files: `<leader>g`
- Show git diff: `<leader>gd`
- Show git blame: `<leader>gb`
- Toggle quickfix window: `<leader>q`
- Toggle location window: `<leader>l`
- Go to definition under cursor: `<leader>d`
- Format code with prettier: `<leader>p`
- Toggle tagbar window: `<leader>t`
