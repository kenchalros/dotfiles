# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# Load the shell dotfiles, and then some:
# ~/.path can be used to extend `$PATH`.
# ~/.extra can be used for other settings you don't want to commit.
for file in ${HOME}/.{path,exports,aliases,extra}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;


#---------------------------------------------------
# Git completion setting
#---------------------------------------------------
. /usr/local/etc/bash_completion.d/git-completion.bash


#---------------------------------------------------
# Prompt setting
#---------------------------------------------------
# Color Setting
COLOR_OFF="\033[0m"
WHITE="\033[38;05;231m"
BDIR="\033[48;05;37m"
BON="\033[48;05;8m"
BGIT="\033[48;05;70m"

# Git prompt
. /usr/local/etc/bash_completion.d/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true # ステージ済みの場合は+, 未ステージの場合は*.
GIT_PS1_SHOWSTASHSTATE=true # stashが存在する場合は$.
GIT_PS1_SHOWUNTRACKEDFILES=true # 追跡されていないファイルが存在する場合は%.
GIT_PS1_SHOWUPSTREAM="auto" # 上流からの進み,戻り,分岐(<,>,<>).

export PROMPT_DIRTRIM=2
export PS1="\n${BDIR}${WHITE} \w ${COLOR_OFF}${BON} on ${COLOR_OFF}${BGIT}${WHITE} \$(__git_ps1 "%s") ${COLOR_OFF}\n"


#---------------------------------------------------
# Pyenv setting
#---------------------------------------------------
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi
