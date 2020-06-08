source ~/.bash_profile

#$PATH の重複をなくす
typeset -U path cdpath fpath manpath

# git completion
fpath=(~/.zsh/completion $fpath)

#補完機能を使用する
autoload -U compinit
compinit
zstyle ':completion::complete:*' use-cache true
#zstyle ':completion:*:default' menu select true
zstyle ':completion:*:default' menu select=1

#大文字、小文字を区別せず補完する
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

#補完でカラーを使用する
autoload colors
zstyle ':completion:*' list-colors "${LS_COLORS}"

#kill の候補にも色付き表示
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([%0-9]#)*=0=01;31'

#コマンドにsudoを付けても補完
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

#何も入力されていないときのTABでTABが挿入されるのを抑制
zstyle ':completion:*' insert-tab false

# tabを押さずに自動補完
source $HOME/.zsh/auto-fu.zsh/auto-fu.zsh
function zle-line-init(){
    auto-fu-init
}
zle -N zle-line-init
# 「-azfu-」を表示させないための記述
zstyle ':auto-fu:var' postdisplay $''

# Color setting
PROMPT='
[%B%F{red}%n@%m%f%b:%F{yellow}%~%f]%F
%# '

eval "$(starship init zsh)"

