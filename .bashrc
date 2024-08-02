# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
export PATH=/usr/local/cuda/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#Bizon aliases

alias bizonhelp='
echo Bizonhelp_3.0
echo -e "\033[0;34m---------------Troubleshooting-commands--------------\033[0m"
echo -e cpu-test ----------"\033[31;1mStress test for your CPU\033[0m"
echo -e gpu-test ----------"\033[31;1mWill run luxmark benchmark to test your GPUs\033[0m"
echo -e nvme-test ---------"\033[31;1mApp to check nvme performance and health\033[0m"
echo -e Nvlink ------------"\033[31;1mWill check the status of Nvlinks\033[0m"
echo -e Nvidia-full -------"\033[31;1mWill provide full info list about Nvidia GPUs\033[0m"
echo -e jupyter-local -----"\033[31;1mStart a local jupyter notebook\033[0m"
echo -e jupyter-remote ----"\033[31;1mStart a remote notebook server\033[0m"
echo -e jupyter-help ------"\033[31;1mUsefull commands and remote client config to access the notebook\033[0m"
echo
echo -e "\033[0;34m---------------VM-Auto-Creation---------------\033[0m"
echo -e vm-win11 ----------"\033[31;1mWill download and install a windows 11 vm with all drivers installed\033[0m"
echo
echo -e "\033[0;34m-----------------Tools--------------------------------\033[0m"
echo -e anydesk-restore ---"\033[31;1mIt will restore a new anydesk ID\033[0m"
echo -e ipmiview ----------"\033[31;1mLaunch SuperMicros IPMIView\033[0m"
echo
echo -e "\033[31;1m-----------------Beta-features---------------------------\033[0m"
echo'




#How to start jupyter notebook inside a container (Nvidia conatiner, tensorflow)

#Link: https://devtalk.nvidia.com/default/topic/1032202/using-a-jupyter-notebook-within-a-docker-container/?offset=11

#Example of running a tensorflow container with the notebook
#sudo nvidia-docker run -p "8888:8888" -v ~/docker_workspace:/workspace/work -it --shm-size=1g --ulimit memlock=-1  --ulimit stack=67108864 --rm 621fd859db33
#Once inside the container
#jupyter lab --port=8888 --ip=0.0.0.0 --allow-root --no-browser
#Open a webbrowser on the client machine
#http://(hostip):8888/tree
#Replace (hostip) for your hist machine IP

#Insert the token on the host and enjoy your notebook



alias cpu-test='s-tui'

alias gpu-test='
cd /home/ale/Downloads
sudo git clone https://github.com/wilicc/gpu-burn.git
cd gpu-burn/
sudo make 
./gpu_burn -tc 3600
'
alias nvme-test='
echo check folder /home/ale/.tools to launch the tool 
echo Commands to launch the test on command line, you can lunch the GUI tool as well
echo ./nvmecmd self-test.cmd.json -n 1  Use 1,2,3 to target the Nvme we want to test 
echo ./nvmecmd self-test.cmd.json --extended -n 1 
'
alias Nvlink='nvidia-smi nvlink --status'

alias Nvidia-full='nvidia-smi -i 0 -q'

alias jupyter-local='jupyter notebook'

alias jupyter-remote='jupyter notebook --no-browser --port=8889'

alias jupyter-help='
echo For remote config follow the steps:
echo 1- run the command Jupyter-remote
echo 2- on the client need to run this command on a terminal:
echo ssh -N -f -L localhost:8888:localhost:8889 user@domain
echo The host will give you a token, then when opening a webrowser and typing
echo http://localhost:8888/tree on the client machine, insert your token
echo Enjoy your notebook from any location
echo To get access out of your local network need to configure router porforwarding'

alias bizonbench-deploy='/bin/bash -c "$(curl -fsSL https://bizonos.s3.amazonaws.com/bizonbench_linux_deployment.sh)"'
alias bizonbench-remove='
sudo rm -rf /home/ale/bizon_suit
sudo rm -rf /home/ale/bizonbench
sudo rm -rf /home/ale/Bizon_benchmark_Linux.zip
sudo rm -rf /home/ale/end.sh
sudo rm -rf /home/ale/start.sh
sudo rm -rf /home/ale/xorg_fix.py
sudo rm -rf /home/ale/__MACOSX
sudo rm -rf /home/ale/Downloads/*
sudo rm -f /usr/share/applications/bizon_suit.desktop
history -c && history -w'

alias anydesk-restore='
sudo rm -f /etc/anydesk/service.conf
sudo reboot'

alias vm-win11='/bin/bash -c "$(curl -fsSL https://bizon-vm.s3.amazonaws.com/win11_vm.sh)"'

fans-gpu0() {
	nvidia-settings --display :1.0 -a "[gpu:0]/GPUFanControlState=1" -a "[fan]/GPUTargetFanSpeed=$1"
	echo "Fan speeds set to $1 percent"
}    

fans-gpu1() {
	nvidia-settings --display :1.0 -a "[gpu:1]/GPUFanControlState=1" -a "[fan]/GPUTargetFanSpeed=$1"
	echo "Fan speeds set to $1 percent"
}


alias ipmiview='java -jar /bin/ipmiview/IPMIView20.jar'


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/ale/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/ale/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/ale/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/ale/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


#Oh my bash 


# Path to your oh-my-bash installation.
export OSH='/home/ale/.oh-my-bash'

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-bash is loaded.
#OSH_THEME="font"
OSH_THEME="powerline"
#OSH_THEME="agnoster"

# If you set OSH_THEME to "random", you can ignore themes you don't like.
# OMB_THEME_RANDOM_IGNORED=("powerbash10k" "wanelo")

# Uncomment the following line to use case-sensitive completion.
# OMB_CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# OMB_HYPHEN_SENSITIVE="false"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_OSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you don't want the repository to be considered dirty
# if there are untracked files.
# SCM_GIT_DISABLE_UNTRACKED_DIRTY="true"

# Uncomment the following line if you want to completely ignore the presence
# of untracked files in the repository.
# SCM_GIT_IGNORE_UNTRACKED="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.  One of the following values can
# be used to specify the timestamp format.
# * 'mm/dd/yyyy'     # mm/dd/yyyy + time
# * 'dd.mm.yyyy'     # dd.mm.yyyy + time
# * 'yyyy-mm-dd'     # yyyy-mm-dd + time
# * '[mm/dd/yyyy]'   # [mm/dd/yyyy] + [time] with colors
# * '[dd.mm.yyyy]'   # [dd.mm.yyyy] + [time] with colors
# * '[yyyy-mm-dd]'   # [yyyy-mm-dd] + [time] with colors
# If not set, the default value is 'yyyy-mm-dd'.
# HIST_STAMPS='yyyy-mm-dd'

# Uncomment the following line if you do not want OMB to overwrite the existing
# aliases by the default OMB aliases defined in lib/*.sh
# OMB_DEFAULT_ALIASES="check"

# Would you like to use another custom folder than $OSH/custom?
# OSH_CUSTOM=/path/to/new-custom-folder

# To disable the uses of "sudo" by oh-my-bash, please set "false" to
# this variable.  The default behavior for the empty value is "true".
OMB_USE_SUDO=true

# To enable/disable display of Python virtualenv and condaenv
# OMB_PROMPT_SHOW_PYTHON_VENV=true  # enable
# OMB_PROMPT_SHOW_PYTHON_VENV=false # disable

# Which completions would you like to load? (completions can be found in ~/.oh-my-bash/completions/*)
# Custom completions may be added to ~/.oh-my-bash/custom/completions/
# Example format: completions=(ssh git bundler gem pip pip3)
# Add wisely, as too many completions slow down shell startup.
completions=(
  git
  composer
  ssh
)

# Which aliases would you like to load? (aliases can be found in ~/.oh-my-bash/aliases/*)
# Custom aliases may be added to ~/.oh-my-bash/custom/aliases/
# Example format: aliases=(vagrant composer git-avh)
# Add wisely, as too many aliases slow down shell startup.
aliases=(
  general
)

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-bash/plugins/*)
# Custom plugins may be added to ~/.oh-my-bash/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  bashmarks
)

# Which plugins would you like to conditionally load? (plugins can be found in ~/.oh-my-bash/plugins/*)
# Custom plugins may be added to ~/.oh-my-bash/custom/plugins/
# Example format:
#  if [ "$DISPLAY" ] || [ "$SSH" ]; then
#      plugins+=(tmux-autoattach)
#  fi

source "$OSH"/oh-my-bash.sh

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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-bash libs,
# plugins, and themes. Aliases can be placed here, though oh-my-bash
# users are encouraged to define aliases within the OSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias bashconfig="mate ~/.bashrc"
# alias ohmybash="mate ~/.oh-my-bash"