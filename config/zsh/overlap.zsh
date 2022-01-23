# battery catimg
# history-substring-search
plugins=(
    git
    npm
    node
    colored-man-pages
    man
    sudo
    zsh-syntax-highlighting
    zsh-autosuggestions
    colorize
    zsh-autocomplete
    command-not-found
    geeknote
    pip
    python
)

source $ZSH/oh-my-zsh.sh

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
  source /etc/profile.d/vte.sh
fi

if [ -x "$(command -v exa)" ]; then
    alias li="exa --long --all --group --icons"
    alias cs="exa"
    alias ca="exa --long --all --group"
fi

if [ -x "$(command -v logo-ls)" ]; then
    alias lls="logo-ls"
    alias lla="logo-ls -l --all"
fi

if [ -x "$(command -v neofetch)" ]; then
    LAUNCHER="$XDG_CONFIG_HOME/neofetch/launch.bash"
    alias fetch="$LAUNCHER"

    alias coldarch="$LAUNCHER --coldarch"
    alias verycold="$LAUNCHER --verycoldarch"
    alias foodfetch="$LAUNCHER --food"

    alias floskull="$LAUNCHER --flowerskull"
    alias fspolar="$LAUNCHER --flowerskull polar"
    alias fswarm="$LAUNCHER --flowerskull warm"
    alias fsauro="$LAUNCHER --flowerskull aurorae"
    alias fswaifu="$LAUNCHER --waifu"
    alias fsrip="neofetch --config .config/neofetch/configs/rip.conf --source .config/neofetch/images/riparch.png"
    alias fscat="neofetch --config $XDG_CONFIG_HOME/neofetch/configs/asciisq-very-minimal-v2.conf --ascii $XDG_CONFIG_HOME/neofetch/asciis/cat"
    unset LAUNCHER
fi

if [ -x "$(command -v ripgrep)" ]; then
    alias grep="ripgrep"
fi

if [ -x "$(command -v go-mtpfs)" ]; then
    alias mount-phone="go-mtpfs $HOME/Phone &>/dev/null & disown"
fi

if [ -x "$(command -v fusermount)" ]; then
    alias unmount-phone="fusermount -u $HOME/Phone"
fi

if [ -x "$(command -v udisksctl)" ]; then
    alias mount-ssd="udisksctl mount -b /dev/nvme0n1p1"
fi

if [ -x "$(command -v udisksctl)" ]; then
    alias unmount-ssd="udisksctl unmount -b /dev/nvme0n1p1"
fi

if [ -x "$(command -v betterlockscreen)" ]; then
    alias lock="betterlockscreen -l"
fi

if [ -x "$(command -v nvim)" ]; then
    alias nv="nvim"
fi

if [ -x "$(command -v ranger)" ]; then
    alias fm="ranger"
fi

alias logout="bspc quit"
alias suspend="systemctl suspend; locklauncher"
alias cls="clear"
alias la="ls -la"

alias zedit="nv $HOME/.zshrc"
alias bedit="nv $HOME/.bashrc"
alias fedit="nv $XDG_CONFIG_HOME/fish/config.fish"
alias p10kedit="nv $HOME/.p10k.zsh"
alias kev="xev -event keyboard"
alias zshalias="nv $XDG_CONFIG_HOME/zsh/overlap.zsh"

alias pipes1="lam -e pipes1"
alias pipes2="lam -e pipes2"
alias pipes2-slim="lam -e pipes2-slim"
alias rain="lam -e rain"

alias cclock="watch -t -n1 'date +%T | figlet' | lolcat"
alias tty-clock="tty-clock -S -c -C4 -D -s -n"
alias ccbonsai="cbonsai -ilt 0.02 -c '  ,  ,  ,  ,  ' -L 5"
alias fzf="fzf --prompt ' ' --pointer '->'"

alias yts="ytfzf -t"
alias ani720="ani-cli -q 720"
alias ani480="ani-cli -q 480"
alias pisend="$XDG_CONFIG_HOME/picom/launch.bash"
alias tintsend="$XDG_CONFIG_HOME/tint2/launch.bash"
alias startx='startx -- -keeptty >~/.xorg.log 2>&1'

alias -='cd -' 2> /dev/null
alias ...='../..'
alias ....='../../..'
alias .....='../../../..'
alias ......='../../../../..'
alias 1='cd -1'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'
alias _='sudo '
alias afind='ack -il'

alias rd='rmdir'
alias run-help='man'

alias history="omz_history"

alias pac="sudo pacman"
alias pacupg='sudo pacman -Syu'
alias pacin='sudo pacman -S'
alias pacins='sudo pacman -U'
alias pacre='sudo pacman -R'
alias pacrem='sudo pacman -Rns'
alias pacrep='pacman -Si'
alias pacreps='pacman -Ss'
alias pacloc='pacman -Qi'
alias paclocs='pacman -Qs'
alias pacinsd='sudo pacman -S --asdeps'
alias pacmir='sudo pacman -Syy'
alias paclsorphans='sudo pacman -Qdt'
alias pacrmorphans='sudo pacman -Rs $(pacman -Qtdq)'
alias pacfileupg='sudo pacman -Fy'
alias pacfiles='pacman -F'
alias pacls='pacman -Ql'
alias pacown='pacman -Qo'
alias pacupd="sudo pacman -Sy"
alias upgrade='sudo pacman -Syu'

alias yaconf='yay -Pg'
alias yaupg='yay -Syu'
alias yas='yay -Syu --noconfirm'
alias yain='yay -S'
alias yains='yay -U'
alias yare='yay -R'
alias yarem='yay -Rns'
alias yarep='yay -Si'
alias yareps='yay -Ss'
alias yaloc='yay -Qi'
alias yalocs='yay -Qs'
alias yalst='yay -Qe'
alias yaorph='yay -Qtd'
alias yainsd='yay -S --asdeps'
alias yamir='yay -Syy'
alias yaupd="yay -Sy"
alias upgrade='yay -Syu'

alias commit="git add . && git commit -m"
alias clone="git clone"
alias push="git push"
alias pull="git pull"

alias g=git
alias ga='git add'
alias gaa='git add --all'
alias gam='git am'
alias gama='git am --abort'
alias gamc='git am --continue'
alias gams='git am --skip'
alias gamscp='git am --show-current-patch'
alias gap='git apply'
alias gapa='git add --patch'
alias gapt='git apply --3way'
alias gau='git add --update'
alias gav='git add --verbose'
alias gb='git branch'
alias gbD='git branch -D'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gbda='git branch --no-color --merged | command grep -vE "^([+*]|\s*($(git_main_branch)|$(git_develop_branch))\s*$)" | command xargs git branch -d 2>/dev/null'
alias gbl='git blame -b -w'
alias gbnm='git branch --no-merged'
alias gbr='git branch --remote'
alias gbs='git bisect'
alias gbsb='git bisect bad'
alias gbsg='git bisect good'
alias gbsr='git bisect reset'
alias gbss='git bisect start'
alias gc='git commit -v'
alias 'gc!'='git commit -v --amend'
alias gca='git commit -v -a'
alias 'gca!'='git commit -v -a --amend'
alias gcam='git commit -a -m'
alias 'gcan!'='git commit -v -a --no-edit --amend'
alias 'gcans!'='git commit -v -a -s --no-edit --amend'
alias gcas='git commit -a -s'
alias gcasm='git commit -a -s -m'
alias gcb='git checkout -b'
alias gcd='git checkout $(git_develop_branch)'
alias gcf='git config --list'
alias gcl='git clone --recurse-submodules'
alias gclean='git clean -id'
alias gcm='git checkout $(git_main_branch)'
alias gcmsg='git commit -m'
alias 'gcn!'='git commit -v --no-edit --amend'
alias gco='git checkout'
alias gcor='git checkout --recurse-submodules'
alias gcount='git shortlog -sn'
alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'
alias gcs='git commit -S'
alias gcsm='git commit -s -m'
alias gcss='git commit -S -s'
alias gcssm='git commit -S -s -m'
alias gd='git diff'
alias gdca='git diff --cached'
alias gdct='git describe --tags $(git rev-list --tags --max-count=1)'
alias gdcw='git diff --cached --word-diff'
alias gds='git diff --staged'
alias gdt='git diff-tree --no-commit-id --name-only -r'
alias gdup='git diff @{upstream}'
alias gdw='git diff --word-diff'
alias gf='git fetch'
alias gfa='git fetch --all --prune --jobs=10'
alias gfg='git ls-files | grep'
alias gfo='git fetch origin'
alias gg='git gui citool'
alias gga='git gui citool --amend'
alias ggpull='git pull origin "$(git_current_branch)"'
alias ggpur=ggu
alias ggpush='git push origin "$(git_current_branch)"'
alias ggsup='git branch --set-upstream-to=origin/$(git_current_branch)'
alias ghh='git help'
alias gignore='git update-index --assume-unchanged'
alias gignored='git ls-files -v | grep "^[[:lower:]]"'
alias git-svn-dcommit-push='git svn dcommit && git push github $(git_main_branch):svntrunk'
alias gk='\gitk --all --branches &!'
alias gke='\gitk --all $(git log -g --pretty=%h) &!'
alias gl='git pull'
alias glg='git log --stat'
alias glgg='git log --graph'
alias glgga='git log --graph --decorate --all'
alias glgm='git log --graph --max-count=10'
alias glgp='git log --stat -p'
alias glo='git log --oneline --decorate'
alias globurl='noglob urlglobber '
alias glod='git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset'\'
alias glods='git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset'\'' --date=short'
alias glog='git log --oneline --decorate --graph'
alias gloga='git log --oneline --decorate --graph --all'
alias glol='git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset'\'
alias glola='git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset'\'' --all'
alias glols='git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset'\'' --stat'
alias glp=_git_log_prettily
alias glum='git pull upstream $(git_main_branch)'
alias gm='git merge'
alias gma='git merge --abort'
alias gmom='git merge origin/$(git_main_branch)'
alias gmtl='git mergetool --no-prompt'
alias gmtlvim='git mergetool --no-prompt --tool=vimdiff'
alias gmum='git merge upstream/$(git_main_branch)'
alias gp='git push'
alias gpd='git push --dry-run'
alias gpf='git push --force-with-lease'
alias 'gpf!'='git push --force'
alias gpoat='git push origin --all && git push origin --tags'
alias gpr='git pull --rebase'
alias gpristine='git reset --hard && git clean -dffx'
alias gpsup='git push --set-upstream origin $(git_current_branch)'
alias gpu='git push upstream'
alias gpv='git push -v'
alias gr='git remote'
alias gra='git remote add'
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbd='git rebase $(git_develop_branch)'
alias grbi='git rebase -i'
alias grbm='git rebase $(git_main_branch)'
alias grbo='git rebase --onto'
alias grbom='git rebase origin/$(git_main_branch)'
alias grbs='git rebase --skip'
alias grep='grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}'
alias grev='git revert'
alias grh='git reset'
alias grhh='git reset --hard'
alias grm='git rm'
alias grmc='git rm --cached'
alias grmv='git remote rename'
alias groh='git reset origin/$(git_current_branch) --hard'
alias grrm='git remote remove'
alias grs='git restore'
alias grset='git remote set-url'
alias grss='git restore --source'
alias grst='git restore --staged'
alias grt='cd "$(git rev-parse --show-toplevel || echo .)"'
alias gru='git reset --'
alias grup='git remote update'
alias grv='git remote -v'
alias gsb='git status -sb'
alias gsd='git svn dcommit'
alias gsh='git show'
alias gsi='git submodule init'
alias gsps='git show --pretty=short --show-signature'
alias gsr='git svn rebase'
alias gss='git status -s'
alias gst='git status'
alias gsta='git stash push'
alias gstaa='git stash apply'
alias gstall='git stash --all'
alias gstc='git stash clear'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsts='git stash show --text'
alias gstu='gsta --include-untracked'
alias gsu='git submodule update'
alias gsw='git switch'
alias gswc='git switch -c'
alias gswd='git switch $(git_develop_branch)'
alias gswm='git switch $(git_main_branch)'
alias gtl='gtl(){ git tag --sort=-v:refname -n -l "${1}*" }; noglob gtl'
alias gts='git tag -s'
alias gtv='git tag | sort -V'
alias gunignore='git update-index --no-assume-unchanged'
alias gunwip='git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset HEAD~1'
alias gup='git pull --rebase'
alias gupa='git pull --rebase --autostash'
alias gupav='git pull --rebase --autostash -v'
alias gupv='git pull --rebase -v'
alias gwch='git whatchanged -p --abbrev-commit --pretty=medium'
alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign -m "--wip-- [skip ci]"'

alias ldot='ls -ld .*'
alias lS='ls -1FSsh'
alias lart='ls -1Fcart'
alias lrt='ls -1Fcrt'

alias grep='grep --color'
alias grepin='grep -i'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '

alias t='tail -f'

# Command line head / tail shortcuts
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L="| less"
alias -g M="| most"
alias -g LL="2>&1 | less"
alias -g CA="2>&1 | cat -A"
alias -g NE="2> /dev/null"
alias -g NUL="> /dev/null 2>&1"
alias -g P="2>&1| pygmentize -l pytb"

alias dud='du -d 1 -h'
alias duf='du -sh *'
(( $+commands[fd] )) || alias fd='find . -type d -name'
alias ff='find . -type f -name'

alias h='history'
alias hgrep="fc -El 0 | grep"
alias help='man'
alias p='ps -f'
alias sorter='sort -n -r'
alias unexport='unset'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias -s pdf=acroread
alias -s ps=gv
alias -s dvi=xdvi
alias -s chm=xchm
alias -s djvu=djview

alias -s zip="unzip -l"
alias -s rar="unrar l"
alias -s tar="tar tf"
alias -s tar.gz="echo "
alias -s ace="unace l"

alias jshell="$HOME/.jdks/jdk-16.0.1/bin/jshell"
alias visudo="nvim /etc/sudoers"

export VISUAL=nvim;
export EDITOR=nvim;
export PATH="$PATH:$XDG_DATA_HOME/gem/ruby/3.0.0/bin:$HOME/.jdks/jdk-16.0.1/bin:$HOME/.local/bin:$XDG_DATA_HOME/nvim/lsp_servers/jedi_language_server/venv/bin:$XDG_DATA_HOME/nvim/lsp_servers/pylsp/venv/bin:$XDG_DATA_HOME/nvim/lsp_servers/python/node_modules/.bin"
export PS2="%2F%3F "
# export LD_PRELOAD=/usr/lib/libwcwidth-icons.so

SILENT_JAVA_OPTIONS="$JDK_JAVA_OPTIONS"
unset JDK_JAVA_OPTIONS
alias java='java "$SILENT_JAVA_OPTIONS"'
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_NO_FUNCTIONS
# setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source "$HOME/.colors.sh"

function ccat() {
  if $2
  then
      pygmentize -g $1 | cat
  else
      pygmentize -g $2 | cat $1
  fi
}

function cless() {
  pygmentize -g $1 | less
}

function cmore() {
  pygmentize -g $1 | more
}

function nordbar() {
  killall polybar
  polybar -q -c "$XDG_CONFIG_HOME/polybar/configs/antartica/$1.ini" main & disown
}

alias cless="cless"
alias cmore="cmore"
alias ccat="ccat"
alias reconnect="nmcli d c wlp0s20f3"
alias rofisc="wmctrl -s 2; rofi -show & sleep 1 && maim lol.png"
alias nvconfig="fm ~/.config/nvim/lua/"

alias tping="ping -c5 google.com"
alias iping="ping google.com"

alias yta-mp3="youtube-dl --extract-audio --audio-format mp3"
alias ytv-best="youtube-dl -f bestvideo+bestaudio "
alias killconk="killall conky"

alias upgrub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias upfnt='sudo fc-cache -fv'

alias kittythemes="kitty +kitten themes"
alias nvupd="nv +PackerSync"

function killew() {
  EWWC_FRAGMENT="eww -c $XDG_CONFIG_HOME/eww/structs"
  eval "rm $XDG_CACHE_HOME/launch_main.eww &>/dev/null"
  eval "rm $XDG_CACHE_HOME/launch_wallpaper.eww &>/dev/null"
  eval "$EWWC_FRAGMENT/main-utils kill &>/dev/null"
  eval "$EWWC_FRAGMENT/wallpaper kill &>/dev/null"
  unset EWWC_FRAGMENT
}

# alias cat="ccat"
# alias less="cless"

# zmodload zsh/zle

# vim:ft=zsh:nowrap
