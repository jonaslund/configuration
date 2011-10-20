# Path to your oh-my-zsh configuration.
ZSH=$HOME/v/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="mgutz"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
 DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git deb debian history-substring-search)

source $ZSH/oh-my-zsh.sh

setopt nohup #don't kill jobs when logout
setopt nocheckjobs #and do it silently :)

#Home Path Bin // shell scripts and such
PATH=$PATH:$HOME/bin

# Customize to your needs...
#
# -font -*-fixed-medium-r-*-*-18-*-*-*-*-*-iso8859-* -geometry 70x24

#------------------------------------------////
# Basic Configuration:
#------------------------------------------////
#kill the beep alarm
#setopt no_beep

#enable auto-correct
#setopt correctall

#turn on tab completion and make it fancy
#autoload -U compinit && compinit
#zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
#zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

#fancy colors and prompts are set later
#add custom functions to path (important for prompt)
fpath=(~/.zsh/functions $fpath)

#remove right prompt after command is run (helpful if copying and pasting)
#setopt TRANSIENT_RPROMPT
#------------------------------------------////
# Colors:
#------------------------------------------////
black='\e[0;30m'
blue='\e[0;34m'
green='\e[0;32m'
cyan='\e[0;36m'
red='\e[0;31m'
purple='\e[0;35m'
brown='\e[0;33m'
lightgray='\e[0;37m'
darkgray='\e[1;30m'
lightblue='\e[1;34m'
lightgreen='\e[1;32m'
lightcyan='\e[1;36m'
lightred='\e[1;31m'
lightpurple='\e[1;35m'
yellow='\e[1;33m'
white='\e[1;37m'
nc='\e[0m'

#Colors for less pager (man pages)
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
#    alias ls='ls --color=auto'
#    alias dir='dir --color=auto'
#    alias vdir='vdir --color=auto'

#    alias grep='grep --color=auto'
#    alias fgrep='fgrep --color=auto'
#    alias egrep='egrep --color=auto'
fi

#------------------------------------------////
# Custom Prompt:
#------------------------------------------////
# Nice basic prompt
#export PS1="%n@%m:%~%# "
#export RPS1=" <%T"
#export PS2="%_> "

# Colorful basic prompt option 1
#autoload -U colors && colors
#export PS1="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~ %{$reset_color%}%% "
#export RPS1="%{$fg[cyan]%}<%T%{$reset_color%}"
#export PS2="%_> "

# Colorful basic prompt option 2 { Better than option 1 }
#export PS1=$'%{\e[1;32m%}%n%{\e[0m%}%{\e[1;34m%}@%{\e[1;31m%}%m %{\e[1;34m%}%~ %{\e[0m%}%% '
#export RPS1=$'%{\e[1;30m%}<%T%{\e[0m%}'
#export PS2=$'%{\e[0;37m%} %_>%{\e[0m%} '

# Fancy prompt system see /usr/share/zsh/functions/Prompts/ for files
# the "fhsm" configuration is loaded from ~/.zsh/functions, which is added to the path above.
# List options with: prompt -l
autoload -U promptinit && promptinit 
prompt fhsm


#------------------------------------------////
# Aliases:
#------------------------------------------////
# Useful aliases (building on the color enablers)
alias ll='ls -l'
alias la='ls -Al'
alias lb='ls -Al --block-size=1MB'
alias reload='source ~/.zshrc'
alias biggest='BLOCKSIZE=1048576; du -x | sort -nr | head -10'

# Shortcuts
alias home='cd ~/'
alias documents='cd ~/documents'
alias downloads='cd ~/Downloads'
alias images='cd ~/images'
alias videos='cd ~/videos'

## Sudo fixes
alias install='~/bin/install_and_log install'
alias remove='sudo apt-get remove'
alias update='sudo apt-get update'
alias upgrade='sudo apt-get update && sudo apt-get upgrade'
alias dist-upgrade='sudo apt-get update && sudo apt-get dist-upgrade'
alias orphand='sudo deborphan | xargs sudo apt-get -y remove --purge'
alias cleanup='sudo apt-get autoclean && sudo apt-get autoremove && sudo apt-get clean && sudo apt-get remove && orphand'
alias search="apt-cache search"

#git
alias gitconf='git config branch.master.remote origin;git config branch.master.merge refs/heads/master'

##Info
alias stamp='date "+%Y-%m-%d %a %H:%M"'
alias da='date "+%Y-%m-%d %A    %T %Z"'

#------------------------------------------////
# Custom Extract / Compress:
#------------------------------------------////
# Easy extract
extract () {
  if [ -f $1 ] ; then
      case $1 in
          *.tar.bz2)   tar xvjf $1    ;;
          *.tar.gz)    tar xvzf $1    ;;
          *.bz2)       bunzip2 $1     ;;
          *.rar)       rar x $1       ;;
          *.gz)        gunzip $1      ;;
          *.tar)       tar xvf $1     ;;
          *.tbz2)      tar xvjf $1    ;;
          *.tgz)       tar xvzf $1    ;;
          *.zip)       unzip $1       ;;
          *.Z)         uncompress $1  ;;
          *.7z)        7z x $1        ;;
          *)           echo "don't know how to extract '$1'..." ;;
      esac
  else
      echo "'$1' is not a valid file!"
  fi
}

# Creates an archive from given directory
mktar() { tar cvf  "${1%%/}.tar"     "${1%%/}/"; }
mktgz() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }
mktbz() { tar cvjf "${1%%/}.tar.bz2" "${1%%/}/"; }


#------------------------------------------////
# Other Custom Functions:
#------------------------------------------////
upinfo ()
{
echo -ne "\t ";uptime | awk /'up/ {print $3,$4,$5,$6,$7,$8,$9,$10}'
}


#------------------------------------------////
# Welcome Info:
#------------------------------------------////
clear
echo -e "${LIGHTGRAY}";toilet --gay " XEROX #!";
#echo -e "${BLUE}";figlet "HAVE GOOD TIME!";
echo -ne "${red}Today is:\t\t${cyan}" `date`; echo ""
echo -e "${red}Kernel Information: \t${cyan}" `uname -smr`
