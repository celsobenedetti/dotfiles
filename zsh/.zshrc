#!/bin/bash
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${%:-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${%:-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)


eval "$(direnv hook zsh)"

source $ZSH/oh-my-zsh.sh

unalias ll
unalias gcm

source ~/.zsh/options.zsh
source ~/.zsh/path.zsh
source ~/.zsh/aliases.zsh

source ~/.dotfiles/zsh/.zsh/functions/git.zsh
source ~/.dotfiles/zsh/.zsh/functions/fzf.zsh
source ~/.dotfiles/zsh/.zsh/functions/good-morning.zsh
source ~/.dotfiles/zsh/.zsh/functions/toggle-command-prefix.zsh
source ~/.dotfiles/zsh/.zsh/functions/tmux.zsh
source ~/.dotfiles/zsh/.zsh/functions/vim.zsh
source ~/.dotfiles/zsh/.zsh/functions/stopwatch.zsh

# Enable emacs mode by default
# bindkey -v

alias flush="echo 2>/dev/null"
bindkey -s ^f "workspace.sh\n"

#### functions ######################################

# if ! nordvpn status | rg -q "Status: Connected"; then
#     nordvpn connect
# fi

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

#bob
export PATH="/home/celso/.local/share/bob/nvim-bin:$PATH"

# #pyenv
# export PYENV_ROOT="$HOME/.pyenv"
# command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"

# Load Angular CLI autocompletion.
# source <(ng completion script)

# bun completions
[ -s "/home/celso/.bun/_bun" ] && source "/home/celso/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export NODE_EXTRA_CA_CERTS="$(mkcert -CAROOT)/rootCA.pem"

export PATH="$PATH:/home/celso/.bin"
