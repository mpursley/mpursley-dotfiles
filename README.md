# How to setup in a new `bash` shell env

### Clone the repo dotfiles repo:
```
$ cd ~/git
$ git clone https://github.com/mpursley/mpursley-dotfiles.git
$ rsync . ~/. --exclude .git -anv
## verify you want all those new files in that list...
$ rsync . ~/. --exclude .git -av
```

### Clone the vim plugins:
```
$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
$ vim
:PluginInstall
:NERDtree ... or ,f ## this should open nerdtree and make sure that plugins are working
:q
```

### Run `ymdt` to test you have `~/bin` in your path:
```
$ ymdt
2025-02-14_08-43
## Worked, should be good. Add any other scripts you want to be able to run easily into ~/bin/.  
```
