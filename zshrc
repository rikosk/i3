# zsh configuration file

#Extended tab completion
autoload -U compinit
compinit

#Tab completion from both ends
setopt completeinword

#Tab completion case-insensitive
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

#Better completion for killall
zstyle ':completion:*:killall:*' command 'ps -u $USER -o cmd'

#Change the definition of "word", e.g. with ^W
##autoload select-word-style
##select-word-style shell
#Colors for "ls"
if [[ -x "`whence -p dircolors`" ]]; then
  eval `dircolors`
  alias ls='ls -F --color=auto'
else
  alias ls='ls -F'
fi

# Git stuff
autoload -Uz vcs_info
precmd () { 
	vcs_info 
}
setopt prompt_subst

#zstyle ':vcs_info:*' actionformats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats '%F{5}[%F{5}%b%F{5}]%F{2}'
#zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'

#Use current input when searching through history
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

#One history for all open shells; store 10,000 entires. Use Alt-P (find command that starts like this) and ^R (search in history) liberally.
HISTFILE=~/.zhistory
HISTSIZE=SAVEHIST=10000
setopt incappendhistory 
setopt sharehistory
setopt extendedhistory

#Enable all sorts of extended globbing, such as ls */.txt (find all text files), ls -d *(D) (show all files including those starting with "."). To find out more, go to man zshexpn, section "FILENAME GENERATION"
setopt extendedglob
unsetopt caseglob

#Killall autocomplete
zstyle ':completion:*:killall:*' command 'ps -u $USER -o cmd'

#Pound sign in interactive prompt
setopt interactivecomments

#Implicitly accept "cd"
setopt auto_cd

#Prompt display style
autoload -U colors && colors
PS1="[%T] %{$fg[cyan]%}%n@%m%{$fg[green]%}:%~\$vcs_info_msg_0_#%{$reset_color%} "
#PS1="[%T] %{$fg[cyan]%}%n@%m\$vcs_info_msg_0_%{$fg[green]%}:%~#%{$reset_color%} "
#PS1='%F{5}[%F{2}%n%F{5}] %F{3}%3~ ${vcs_info_msg_0_}%f%# '

#Display CPU usage stats for commands taking more than 10 seconds
REPORTTIME=10

#Command alliases
alias ll='ls -l'
alias l='ls -alh'
alias as='apt-cache search'

#Alias for overwrite prompt
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# ssh-agent
ssh-add -l >/dev/null || alias ssh='ssh-add -l >/dev/null || ssh-add && unalias ssh; ssh'

# start x windows
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
