# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

export PATH=/home/ale/.local/bin:/opt/Apps:$PATH

#zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

autoload -Uz compinit && compinit

bindkey -e
bindkey '^[OA' history-search-backward
bindkey '^[OB' history-search-forward
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_expire_dups_first
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
#setopt hist_verify

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

#DISABLE_AUTO_TITLE="true"

# Stop Zsh from sending terminal title escape sequences that fight tmux
function precmd() {}
function preexec() {}

#Aliases

alias cp='cp -iv'
alias mkdir='mkdir -pv'
alias mv='mv -iv'
alias rm='rm -v'
alias ls='ls --color'
alias ll='ls -al'
alias vim='nvim.appimage'

#Extra aliases 
if [ -f ~/.zsh_aliases ]; then
  . ~/.zsh_aliases
fi

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

#Source function
if [ -f ~/.local/share/shell/.functions ]; then
  source ~/.local/share/shell/.functions
fi


export EDITOR='nvim.appimage'
export SUDO_EDITOR="$EDITOR"
export VISUAL="$EDITOR"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/ale/miniconda3/bin/conda' 'shell.bash' 'hook' 2>/dev/null)"
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

#autojump
[[ -s /home/ale/.autojump/etc/profile.d/autojump.sh ]] && source /home/ale/.autojump/etc/profile.d/autojump.sh

#ohmyposh prompt
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/ale_zsh.toml)"


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#add npm-global to PATH
export PATH=/opt/npm-global/bin:$PATH

figlet KONG
fastfetch --load-config ~/.config/fastfetch/presets/examples/21.jsonc

