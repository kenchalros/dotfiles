source ~/.bash_profile

#$PATH $B$N=EJ#$r$J$/$9(B
typeset -U path cdpath fpath manpath

# git completion
fpath=(~/.zsh/completion $fpath)

#$BJd405!G=$r;HMQ$9$k(B
autoload -U compinit
compinit
zstyle ':completion::complete:*' use-cache true
#zstyle ':completion:*:default' menu select true
zstyle ':completion:*:default' menu select=1

#$BBgJ8;z!">.J8;z$r6hJL$;$:Jd40$9$k(B
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

#$BJd40$G%+%i!<$r;HMQ$9$k(B
autoload colors
zstyle ':completion:*' list-colors "${LS_COLORS}"

#kill $B$N8uJd$K$b?'IU$-I=<((B
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([%0-9]#)*=0=01;31'

#$B%3%^%s%I$K(Bsudo$B$rIU$1$F$bJd40(B
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

#$B2?$bF~NO$5$l$F$$$J$$$H$-$N(BTAB$B$G(BTAB$B$,A^F~$5$l$k$N$rM^@)(B
zstyle ':completion:*' insert-tab false

# tab$B$r2!$5$:$K<+F0Jd40(B
source $HOME/.zsh/auto-fu.zsh/auto-fu.zsh
function zle-line-init(){
    auto-fu-init
}
zle -N zle-line-init
# $B!V(B-azfu-$B!W$rI=<($5$;$J$$$?$a$N5-=R(B
zstyle ':auto-fu:var' postdisplay $''

# Color setting
PROMPT='
[%B%F{red}%n@%m%f%b:%F{yellow}%~%f]%F
%# '

eval "$(starship init zsh)"

