# vimconf

Chaoya Li's vim configurations

## Assumptions

- Leader key is `,`
- Vim folder is `~/.vimconf`
  - Plugin folder is `~/.vimconf/vimplug`
  - Undo folder is `~/.vimconf/vimundo`

## Install

- Clone this repo as `~/.vimconf` and make symbolic link `~/.vimrc` to `~/.vimconf/vimrc`
- Install plugins using `vim -c :PlugInstall`

### Dependencies

The following dependencies should be installed externally:

- `ack`/`the_silver_searcher`
- `eslint`
- `prettier`

Make symbolic links as follows to configure these dependencies

```
ln -s ~/.vimconf/.eslintrc.js ~/.eslintrc.js
ln -s ~/.vimconf/.prettierrc.js ~/.prettierrc.js
```

## Usage

- Save file with sudo right: `<leader>w`
- Turn off search highlight: `<leader>Enter`
- Navigation within windows: `<Ctrl>-<h/j/k/l>`
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
