# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"
HOMEBREW_NO_ENV_HINTS=
HOMEBREW_NO_AUTO_UPDATE=1
# LOAD 
eval $(keychain --eval karov > /dev/null 2>&1)

# Add functions

[[ -f "${HOME}"/.zsh_functions ]] && . ~/.zsh_functions

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export HISTTIMEFORMAT="%F %T "
export HIST_STAMPS="yyyy/mm/dd"
export AWS_REGION=eu-central-1
export AWS_PAGER=""
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="cobalt2"
#ZSH_THEME="amuse"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  zsh-syntax-highlighting
  zsh-autosuggestions
  git
  )

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'
bindkey '^ ' autosuggest-accept
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
complete -C $(which aws_completer) aws
  if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
  fi

source ~/.zsh_aliases


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true
#
# Git Flow
if [ -f /Users/kkarov/Code/lecturio/workflows/gitflow-completion.sh ]; then
		. /Users/kkarov/Code/lecturio/workflows/gitflow-completion.sh 
	fi


# Warpify shells
#printf '\eP$f{"hook": "SourcedRcFileForWarp", "value": { "shell": "zsh" }}\x9c'

# CodeWhisperer post block. Keep at the bottom of this file.


#### READMES
# brew install lazygit zoxide bpytop tmux fzf entr just jq task tldr knqyf263/pet/pet gh
# gh auth login
# gh extension install github/gh-copilot --force
# gh repo create my-new-repo --public --description "My new repository"
# gh gist create my_script.sh --public --desc "A simple bash script"
# gh copilot suggest "Install git"
# gh copilot explain "traceroute github.com"
#


# Created by `pipx` on 2024-11-23 13:00:36
export PATH="$PATH:/Users/karov/.local/bin"

export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
