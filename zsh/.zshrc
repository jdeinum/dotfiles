if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
startx
fi


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

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
	git
    zsh-autosuggestions
    zsh-syntax-highlighting
	vi-mode)

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
#
#

# some abbreviations
alias -g gy='git add *; git commit -m "auto-merged"; git push'
alias -g yr='cal -y'
alias -g m='make'
alias -g gc='git checkout'
alias -g ga='git add -p'
alias -g vimdiff='nvim -d'
alias -g ct='cargo t'
alias -g gah='git stash; and git pull --rebase; and git stash pop'
alias -g hopper='/opt/hopper-v4/bin/Hopper 2>/dev/null &'
alias cdp='cd ~/Documents/projects/'
alias cdw='cd ~/Work/'
alias cdl='cd ~/Documents/leetcode/'
alias sn='sbt new scala/scala3.g8'
alias nf='n $(fzf)'

alias -g p='yay'
alias -g up='yay -Syu'
alias -g p='yay'
alias -g l='exa'
alias -g ls='exa'
alias -g ll='exa -l'
alias -g lll='exa -la'
alias -g cat='bat'
alias -g dig='dog'
alias -g diff='difft'
alias -g traceroute='mtr'
alias -g locate='plocate'
alias -g hexdump='hexyl'
alias -g curl='xh'
alias -g find='fd'
alias -g top='htop'
alias -g df='duf'

# ntfy -> send particular notification 
# speedtest-cli -> internet speed test
# ascii-image-converter -> convert image to ascii
# asciiquairum -> cool terminal wait screen
# toipe -> type speed test
# entr -> execute command when particular file changes
# bc -> math in terminal (use lua / py instead)
# neofetch -> info about system
# vd -> excel in terminal
# imagemagick -> image stuff
# jq -> json stuff
# xsv -> handle csv / excel if vd is not needed
# mosh -> better ssh
# brightnessctl -> handle brightness for devices
# pulseaudio-ctl -> handles volumes
# task -> very nice task manager
# pgcli -> nice cli for anything postgres
# xh / httpie -> anything http related
# pandoc -> any kind of document conversion
# nmon -> monitor anything
# ss -> socket statistcs
# ctop -> docker info
# terijira -> jira intigration for terminal
# gitui -> git tool 
# timew -> time management tool
# hyperfine -> benchmarking tool
# cowsay -> have a cow say
# figlet -> have things in nice big letters!
# loadtest -> stresstest websites
# cgasm -> terminal documentation for x86
# iredis -> redis client
# lazydocker
# ticker -> keep track of stocks
# up -> live pipe view
# ots -> secret message urls
# yq -> jq but for yaml
# stegcloak -> hide secrets in text
# pastel -> manipulate colors


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd'
zstyle ':completion:*' list-colors
eval "$(lua ~/.lua/z.lua --init zsh)"
