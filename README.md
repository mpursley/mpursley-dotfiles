# mpursley-dotfiles

Shell, vim and tmux config for a new machine. `zsh` is the default shell on
macOS; `bash` config is kept alongside it so both shells behave the same.

## Install

### Clone the repo:
```
$ cd ~/git
$ git clone https://github.com/mpursley/mpursley-dotfiles.git
$ cd mpursley-dotfiles
$ rsync . ~/. --exclude .git -anv
## verify you want all those new files in that list...
$ rsync . ~/. --exclude .git -av
```

### Start a new shell:
```
$ exec zsh     ## or: exec bash
```

You should get a two-line prompt: `user@host cwd (git branch) (kubectx)`
on the first line, `$` on the second.

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

## What's here

| File | Notes |
|---|---|
| `.zshrc` | zsh config -- prompt, history, aliases, `$PATH` |
| `.bashrc` | bash equivalent of `.zshrc`, kept in sync |
| `.bash_profile` | login shell; just sources `.bashrc` |
| `.vimrc`, `.vim/` | vim config and plugins |
| `.tmux.conf` | tmux config |
| `bin/` | small helper scripts, added to `$PATH` |

The two shells are deliberately kept equivalent:

| Behavior | bash | zsh |
|---|---|---|
| Shared history across shells | `HISTCONTROL`, `histappend`, `PROMPT_COMMAND` | `SHARE_HISTORY`, `INC_APPEND_HISTORY`, `HIST_IGNORE_ALL_DUPS` |
| Prompt substitution | inline `$(...)` in `PS1` | `setopt PROMPT_SUBST` |
| Unique `$PATH` entries | -- | `typeset -U path` |
| Tab completion | default | `compinit` |

### Per-host overrides

Both `.bashrc` and `.zshrc` source a per-host file at the end, if one exists:

```
~/.bashrc_$(hostname)      ## sourced by .bashrc
~/.zshrc_$(hostname)       ## sourced by .zshrc
```

Put machine-specific settings there and leave them out of this repo.

## This repo is public

Do not commit anything with credentials, private keys, internal hostnames or
IPs. `.gitignore` blocks the usual suspects (`.ssh`, `.aws`, `.netrc`,
`*.pem`, shell history files), but it only catches what it knows about --
check `git diff --cached` before you commit.
