#!/bin/bash
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

# catppuccin mocha
export FZF_DEFAULT_OPTS=" \
--color=bg+:-1,bg:-1,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

export EDITOR='nvim'

eval "$(direnv hook zsh)"

source $ZSH/oh-my-zsh.sh

unalias ll
unalias gcm

source ~/.zsh/path.zsh
source ~/.zsh/aliases.zsh

source ~/.dotfiles/zsh/.zsh/functions/git.zsh
source ~/.dotfiles/zsh/.zsh/functions/fzf.zsh
source ~/.dotfiles/zsh/.zsh/functions/good-morning.zsh
source ~/.dotfiles/zsh/.zsh/functions/toggle-command-prefix.zsh
source ~/.dotfiles/zsh/.zsh/functions/work.zsh
source ~/.dotfiles/zsh/.zsh/functions/tmux.zsh
source ~/.dotfiles/zsh/.zsh/functions/vim.zsh
source ~/.dotfiles/zsh/.zsh/functions/zk.zsh
source ~/.dotfiles/zsh/.zsh/functions/stopwatch.zsh


# Enable emacs mode by default
# bindkey -v

alias flush="echo 2>/dev/null"
bindkey -s ^f "workspace\n"

alias launchchrome="\"/mnt/c/Program Files/Google/Chrome/Application/chrome.exe\""
export CHROME_BIN=launchchrome

export NEOVIM_WIN_DIR=/mnt/c/Users/celso_benedetti/Local/nvim-win64
export PATH=$NEOVIM_WIN_DIR/bin:$PATH

export GH=github.com/celsobenedetti
export RAW=https://raw.githubusercontent.com
export W="/mnt/c/Users/celso_benedetti/"
export BROWSER=wslview

# IF ON WSL
if uname -r | grep -qi "microsoft"; then
    alias code="~/.local/bin//code.sh"
else
fi

#### functions ######################################
#
source ~/.fzf/shell/key-bindings.zsh
source ~/.fzf/shell/completion.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH=~/.fzf/bin/:$PATH

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# pnpm
export PNPM_HOME="/home/celso/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# fnm
export PATH="/home/celso/.local/share/fnm:$PATH"
eval "`fnm env`"
eval "$(fnm env --use-on-cd)"

#pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# protobuf
export PATH="/usr/local/protobuf/bin:$PATH"

# Golang GOPATH
export PATH="/home/celso/go/bin/:$PATH"


# Load Angular CLI autocompletion.
# source <(ng completion script)

# bun completions
[ -s "/home/celso/.bun/_bun" ] && source "/home/celso/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export NODE_EXTRA_CA_CERTS="$(mkcert -CAROOT)/rootCA.pem"
