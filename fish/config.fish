# git
abbr -a gst  git status -sb
abbr -a ga  git add
abbr -a gc  git commit
abbr -a gcm git commit -m
abbr -a gco git checkout
abbr -a gcb git checkout -b
abbr -a gp  git push
abbr -a gd  git diff
abbr -a gds git diff --staged
abbr -a gf  git fetch
abbr -a gb  git branch


set -g fish_color_autosuggestion '555'  'brblack'
set -g fish_color_cancel -r
set -g fish_color_command --bold
set -g fish_color_comment red
set -g fish_color_cwd green
set -g fish_color_cwd_root red
set -g fish_color_end brmagenta
set -g fish_color_error brred
set -g fish_color_escape 'bryellow'  '--bold'
set -g fish_color_history_current --bold
set -g fish_color_host normal
set -g fish_color_match --background=brblue
set -g fish_color_normal normal
set -g fish_color_operator bryellow
set -g fish_color_param cyan
set -g fish_color_quote yellow
set -g fish_color_redirection brblue
set -g fish_color_search_match 'bryellow'  '--background=brblack'
set -g fish_color_selection 'white'  '--bold'  '--background=brblack'
set -g fish_color_user brgreen
set -g fish_color_valid_path --underline

# export LANG=zh_CN.UTF-8

# n install location
export N_PREFIX="$HOME/.n"
# preserve npm version when switching node
# export N_PRESERVE_NPM=1

# pyenv install location
export PYENV_ROOT="$HOME/.pyenv"

# adding new homebrew bin folder and keep the old one
export PATH="~/.emacs.d/bin:$PYENV_ROOT/shims:$N_PREFIX/bin:/opt/homebrew/bin/:/usr/local/bin:$PATH"

starship init fish | source

