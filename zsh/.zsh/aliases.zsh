#!/bin/bash

BROWSER="brave-browser"

alias t="npm run test"
alias workspace="tmux-sessionizer"
alias vim="nvim"
alias vi='nvim .'
# alias lazy='echo "lazy.nvim: Updating and syncing neovim plugins...";nvim --headless "+Lazy! sync" +qa; echo "lazy.nvim: Sync done!"'
alias venv='nvim ~/.zshenv'
alias vmux=' ~/.dotfiles/tmux/.tmux.conf'
alias tx="tmuxinator"
alias dpip="~/.local/share/nvim/mason/packages/debugpy/venv/bin/pip"

# https://github.com/bogem/dotfiles/blob/main/.aliases
alias fdfind='fd'
alias fd="fd -E=node_modules -E=temp -E=.DS_Store -E=.lock$ --no-ignore-vcs"

alias chad-fd="fd -t f -E .git -E build/ -E target/ -E .next/ -E .angular/ -E dist/ -H | sed 's/ /\\ /g'"
alias fzfx='fzf --multi --prompt "$FZF_PROMPT file -> " --preview "bat {1} --color always --theme=Nord" | xargs -r -d "\n"'
alias v='FZF_PROMPT=Open; chad-fd | fzfx nvim'
alias c='FZF_PROMPT=Cat; chad-fd | fzfx bat'

alias gcm='git commit'
alias d='git-diff'
alias a='git-add'
alias s='git status'
alias r='git-restore'
alias gs='git status'

alias commit='commit.sh'

alias nerd="$BROWSER --new-window https://www.nerdfonts.com/cheat-sheet"
alias emoji="$BROWSER --new-window https://www.freetool.dev/emoji-picker"
alias gpt="$BROWSER --new-window https://chat.openai.com"

alias cat='bat'
alias ll='exa --git -I=".git|node_modules" -a'
alias l='exa --icons --git -I=".git|node_modules" -a -l'
alias lt='exa -T --level=2 --icons -I=".git|node_modules" --git -a'
alias dust="dust -c"
alias clip="xclip -sel clip"

#
alias lg='lazygit'
alias lad="lazydocker"
alias dc='docker compose'
alias dstart='sudo service docker start'
alias nf='neofetch'
alias tf='terraform'

# alias k='kubectl'
alias k='k3s kubectl'
alias k3='k3s'
alias mnctl='minikube kubectl --'

alias whalehunt='docker rm -f \$(docker ps -aq)'
alias doclean='rm ~/.docker/config.json'
alias dev='docker run --rm -it -v $(pwd):/home/app -w /home/app -v ~/.docker_bash_history:/root/.bash_history -u $(id -u):$(id -g)'
alias rmvolumes='rm-docker-volumes'

alias py='python3'

alias tz='gotz --timezones "India:Asia/Calcutta,CST:America/Rio_Branco,Europe/Rome"'
alias zo="zoxide"
alias ze="zk edit -i"
alias today="date +%Y-%m-%d"

export NAP_HOME="~/.nap"
export NOTES=~/Documents/notes
export TODO=$NOTES/TODO.md

alias src='source ~/.zshrc'
alias zn="zk new -t"
alias todo="nvim $TODO"
alias mornin='morning'
