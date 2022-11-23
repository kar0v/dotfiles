### ALIASES ###
# dnf package manager
alias dnfupd='sudo dnf update'
alias dnfupg='sudo dnf upgrade'
alias dnfin='sudo dnf install'
alias dnfrm='sudo dnf remove'

# sudo commands
alias systemctl='sudo systemctl'
alias journalctl='sudo journalctl'
alias please="sudo !!"
# get error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# ls with all the flags if exa is not installed
if ! [ -x "$(command -v exa)" ]; then
  alias ls='ls -A --color=auto'
  alias ll='ls -Alh --color=auto'
else 
  # Changing "ls" to "exa"
  alias ls='exa -al --color=always --group-directories-first' # my preferred listing
  alias la='exa -a --color=always --group-directories-first'  # all files and dirs
  alias ll='exa -l --color=always --group-directories-first'  # long format
  alias lt='exa -aT --color=always --group-directories-first' # tree listing
  alias l.='exa -a | egrep "^\."'
fi

# cd up the direcories
alias ..='cd ..'
alias .l='cd -'

# mkdir recursive
alias mkdir='mkdir -p'

# confirmations
# alias mv='mv -i'
# alias cp='cp -i'
# alias ln='ln -i'
# alias rm='rm -i'

# audio
alias playwav='vlc *.wav >/dev/null &'
alias playmp3='vlc *.mp3 >/dev/null &'
alias playogg='vlc *.ogg >/dev/null &'

# video
alias playavi='vlc *.avi &>/dev/null &'
alias playmp4='vlc *.mp4 &>/dev/null &'
alias playmkv='vlc *.mkv &>/dev/null &'
alias playavi='vlc *.avi &>/dev/null &'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# ps
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"
alias psmem='ps auxf | sort -nr -k 4'
alias pscpu='ps auxf | sort -nr -k 3'

# yt-dlp
alias ytaac="yt-dlp --extract-audio --audio-format aac "
alias ytbest="yt-dlp --extract-audio --audio-format best "
alias ytflac="yt-dlp --extract-audio --audio-format flac "
alias ytm4a="yt-dlp --extract-audio --audio-format m4a "
alias ytmp3="yt-dlp --extract-audio --audio-format mp3 "
alias ytopus="yt-dlp --extract-audio --audio-format opus "
alias ytvorbis="yt-dlp --extract-audio --audio-format vorbis "
alias ytwav="yt-dlp --extract-audio --audio-format wav "
alias ytbest="yt-dlp -f bestvideo+bestaudio "

# bare git repo alias for dotfiles
alias conf="/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME"

alias tf="terraform"
