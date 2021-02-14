Vim Syntax Highlighting for YARA Rules
======================================

A Vim syntax-highlighting file for [YARA](https://virustotal.github.io/yara/)
rules. Covers YARA 4.0.

![Screenshot](screenshot.png "Syntax highlighting in action.")

Installation
============

The installation has two steps.

(1) If you use [pathogen](https://github.com/tpope/vim-pathogen), simply go
into the `bundle` directory and clone the repository in there:
```
cd ~/.vim/bundle
git clone https://github.com/s3rvac/vim-syntax-yara.git
```
You can also install the plugin manually by copying the
[`syntax/yara.vim`](https://raw.githubusercontent.com/s3rvac/vim-syntax-yara/master/syntax/yara.vim)
file to your `~/.vim/syntax` directory. If that directory does not exist,
create it.

(2) Put the following autocommand to your `.vimrc`:
```
" Consider all .yar/.yara files to be YARA files.
autocmd BufNewFile,BufRead *.yar,*.yara setlocal filetype=yara
```

License
-------

Copyright (c) 2017 Petr Zemek (s3rvac@gmail.com) and contributors.

Distributed under the MIT license. See the
[`LICENSE`](https://github.com/s3rvac/vim-syntax-yara/blob/master/LICENSE)
file for more details.
