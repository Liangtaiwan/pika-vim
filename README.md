# pika-vim

Version: 3.3.2

My Pika vim configuration

Use [vim-plug](https://github.com/junegunn/vim-plug) to manage plugins.

This configuration is only tested on Archlinux.

## How to use

### Dependencies

- vim 7.4+ (or [neovim][neovim])
- g++
- ctags
- xelatex compiler (for latex usage)

### Optional Dependencies

For fzf:
- tmux
- [ag (the\_silver\_searcher)](https://github.com/ggreer/the_silver_searcher)

### Deploy
To use this configuration, run following commands:
```bash
$ git clone https://github.com/leomao/pika-vim.git
$ cd pika-vim
$ ./deploy.py -h # check help (need python3)
$ ./deploy.py # deploy the configuration
```

### Update Plugins
- use `:PlugClean` to clean old plugins.
- use `:PlugUpdate` and `:PlugUpgrade` to update the plugins.

# Included Plugins:
- [Buffer Explorer](https://github.com/jlanzarotta/bufexplorer)
- [Emmet](https://github.com/mattn/emmet-vim)
- [FZF](https://github.com/junegunn/fzf)
- [NERD Commenter](https://github.com/scrooloose/nerdcommenter)
- [OmnicppComplete](https://github.com/vim-scripts/OmniCppComplete)
- [Python pep8 indent](https://github.com/hynek/vim-python-pep8-indent)
- [Surround](https://github.com/tpope/vim-surround)
- [TagBar](https://github.com/majutsushi/tagbar)
- [fugitive.vim](https://github.com/tpope/vim-fugitive)
- [html5.vim](https://github.com/othree/html5.vim)
- [lightline-pika](https://github.com/leomao/lightline-pika)
- [lightline.vim](https://github.com/itchyny/lightline.vim)
- [python syntax](https://github.com/hdima/python-syntax)
- [scss-syntax.vim](https://github.com/cakebaker/scss-syntax.vim)
- [undotree](https://github.com/mbbill/undotree)
- [vim-coffee-script](https://github.com/kchmck/vim-coffee-script)
- [vim-jade](https://github.com/digitaltoad/vim-jade)
- [vim-vinegar](https://github.com/tpope/vim-vinegar)
- [vimtex](https://github.com/lervag/vimtex)
- [yajs.vim](https://github.com/leomao/yajs.vim)

# Common Shortcut
## General
- Save file `<leader>w`
- next buffer `<leader>bj`
- previous buffer `<leader>bk`
- close buffer `<leader>bd`
- make `<F9>`
- Toggle QuickFix `<F8>`
- Quit `<C-\>` (or give built-in mapping `ZQ` a try!)

## Programming Language
### C/C++
- SingleCompile (let "make" compile single cpp file) `<C-F9>`
- astyle formatting `<F3>` (need astyle installed)
- customization: (see [Customization](#customization))
```vim
" cpp ftplugin settings
let g:cpp_astyle_mapping = '<F3>'
let g:cpp_astyle_options = '-A8KpHUyk1qs2 -xG'
let g:cpp_ctags_mapping = '<F12>'
let g:cpp_ctags_options = '-R --c++-kinds=+pl --fields=+iaS --extra=+q'
let g:cpp_compile_options = '-O2 -std=c++11 -Wall -Wshadow'
```

### Python
- make python script executable `<C-F9>`

## Plugin:
### nerdcommenter
- Toggle line Comment `<leader>c<space>`
- add line Comment `<leader>cc`
- remove line Comment `<leader>cu`

### bufexpl
- open bufexpl `<leader>be`

### vim-latex
- Compile `<leader>ll`
- View `<leader>lv`
- set main file: add `%! TEX root=MAINFILE_RELATIVEPATH` at the top of your file
- you may want to add
```
$pdflatex = 'xelatex -synctex=1 -interaction=nonstopmode --shell-escape %O %S';
```
in  `~/.latexmkrc`.

### TagBar
- Generate tags (ctags) `<F12>` (default: for C++ and python only)
- toggle TagBar `<leader>tb`

### Emmet
- Emmet Prefix `<C-y>`

### lightline pika
- To disable it:  
  add `let g:disable_lightline_pika = 1` to `.vimrc_custom`
- To disable the patch font:  
  add `unlet g:lightline_pika_patchfont` to
  `.vimrc_custom`
- To change the patch font:  
  change the unicode add the following to `.vimrc_custom`:
```vim
let g:lightline_pika_patchfont = {
      \ 'leftsep': "\ue0b0",
      \ 'leftsubsep': "\ue0b1",
      \ 'rightsep': "\ue0b2",
      \ 'rightsubsep': "\ue0b3",
      \ 'branch': "\ue0a0",
      \ 'linecolumn': "\ue0a1",
      \ 'readonly': "\ue0a2",
      \ }
```

# Customization:
To change the leader key `<leader>`, create a file named `.vimrc_leader`
in the directory of this repo and add following in the file:
```vim
" change your leader to ","
let mapleader = ","
let maplocalleader = ","
let g:mapleader = ","
let g:maplocalleader = ","
```
Use your favorite key to substitute `,`.  

To add more plugin via vim-plug, , create a file named `.vimrc_plugin`
in the directory of this repo and add something like following:
```vim
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
```
Please refer to [vim-plug](https://github.com/junegunn/vim-plug)
documentation.

To change settings of some plugins or other things, create a file named
`.vimrc_custom` in the directory of this repo and add what you need in
that file.

For the detail settings, please refer to docs of each plugin and the `.vimrc`.

[neovim]: https://github.com/neovim/neovim
