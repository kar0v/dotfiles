# .bashrc
### TODO: Work on PATH Variable, as it gets repeated. 

### EXPORT --------------------------------------- ###
export TERM="xterm-256color"                      # getting proper colors
export HISTCONTROL=ignoredups:erasedups           # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
export EDITOR=vim
### ---------------------------------------------- ###
### SOURCE --------------------------------------- ###
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

. ~/.packer.bc
### ---------------------------------------------- ###
### PATH ----------------------------------------- ###
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
export PATH
fi

if [ -d /opt/n/bin ]; then
	export PATH=$PATH':/opt/n/bin'
fi
### ---------------------------------------------- ###
### CHANGE TITLE OF TERMINALS -------------------- ###
case ${TERM} in
  xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|alacritty|st|konsole*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
        ;;
  screen*)
    PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
    ;;
esac
### ---------------------------------------------- ###
### UNNAMED -------------------------------------- ###
# Start Chef and enable bash completion
if [ -x "$(command -v chef)" ]; then
	eval "$(chef shell-init bash)"
fi

# load nvm & nvm bash-completion
if [ -d /home/$USER/.nvm ]; then
	export NVM_DIR="$HOME/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
	[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi
### ---------------------------------------------- ###
### COMPLETIONS ---------------------------------- ###
# aws cli bash completion
if [ -x "$(command -v aws_completer)" ]; then
	export PATH=$PATH':~/.local/bin/aws_completer'
	complete -C '/home/kkarov/.local/bin/aws_completer' aws
#	echo "bash completion for aws-cli loaded"
else
	echo "aws_completer is not installed"
fi 
### ---------------------------------------------- ###
### READLINE MACROS ------------------------------ ### 
# ignore case-sensitivity when auto-completing
bind -s 'set completion-ignore-case on'
bind 'set show-all-if-ambiguous on'
# bind 'TAB:menu-complete'
bind "set completion-map-case on"

# Resolve npm OOM.
if [ -x "$(command -v nvm)" ]; then
	export NODE_OPTIONS='--max_old_space_size=8192'
fi
### ---------------------------------------------- ###
### PROMPT --------------------------------------- ###
RESET='\[\033[0m\]'
YELLOW='\[\033[1;33m\]'
# Colofrul shell with git branch status
PS1='\n\[\033[1;31m\][\[\033[0m\]\[\033[1;32m\]\t\[\033[0m\]\[\033[1;31m\]]\[\033[0m\] \[\033[1;33m\]\u\[\033[0m\]\[\033[1;37m\]@\[\033[0m\]\[\033[1;33m\]\h:\[\033[0m\]\[\033[1;34m\]\w >\[\033[0m\]\n\[\033[1;31m\](\[\033[0m\] \[\033[1;32m\]$(git branch 2>/dev/null | grep "^*" | colrm 1 2)\[\033[0m\] \[\033[1;31m\])\[\033[0m\] \[\033[1;32m\]\$\[\033[0m\] '
# PS1="\n \[\033[0;34m\]┌─────(\[\033[1;35m\]\u\[\033[0;34m\])─────(\[\033[1;32m\]\w\[\033[0;34m\]) \n └> \[\033[1;36m\]\$ \[\033[0m\]"
PS2="\[${YELLOW}\]→ \[${RESET}\]";
unset RESET
unset YELLOW

# SETTING THE STARSHIP PROMPT
# eval "$(starship init bash)"
### ---------------------------------------------- ###
### SHOPT ---------------------------------------- ###
shopt -s autocd # change to named directory
shopt -s cdspell # autocorrects cd misspellings
shopt -s cmdhist # save multi-line commands in history as single line
shopt -s dotglob
shopt -s histappend # do not overwrite history
shopt -s expand_aliases # expand aliases
shopt -s checkwinsize # checks term size when bash regains control
### ---------------------------------------------- ###
### ALIASES -------------------------------------- ###
# Provided in the .bash_aliases file
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
### ---------------------------------------------- ###
### FUNCTIONS: MOVE TO .funcrc later ------------- ###

### ARCHIVE EXTRACTION
# usage: ex <file>
ex ()
{
  if [ -f "$1" ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

### navigation
up () {
  local d=""
  local limit="$1"

  # Default to limit of 1
  if [ -z "$limit" ] || [ "$limit" -le 0 ]; then
    limit=1
  fi

  for ((i=1;i<=limit;i++)); do
    d="../$d"
  done

  # perform cd. Show error if cd fails
  if ! cd "$d"; then
    echo "Couldn't go up $limit dirs.";
  fi
}

complete -C /usr/bin/terraform terraform

complete -C /usr/bin/packer packer
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"




