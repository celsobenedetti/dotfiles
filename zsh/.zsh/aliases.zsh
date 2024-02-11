#!/bin/bash

BROWSER="brave-browser"

alias vim='nvim'

alias workspace="workspace.sh"
alias commit='commit.sh'

alias note='note.sh'
alias para="para.sh"
alias notes="notes.sh"
alias inbox="inbox.sh"

alias ww="work-week.sh"
alias todo="vim \$TODO"

alias today="date +%Y-%m-%d"
alias books="books.sh"

alias v='FZF_PROMPT=Open; fds | fzfx nvim'
alias c='FZF_PROMPT=Cat; fds | fzfx bat'

alias rg="rg \
    --glob \"!.git\" \
    --glob \"!*min.{js,css}\" \
    --glob \"!init.sql\" \
    --glob \"!dev-mocks\" \
    --glob \"!python\" \
    --glob \"!fatvai-*\""

alias fd="fd -t f --no-ignore-vcs \
    -E .git \
    -E .next/ \
    -E .angular/ \
    -E .nx/ \
    -E .obsidian/ \
    -E node_modules/ \
    -E dist/ \
    -E build/ \
    -E target/ \
    -E temp/ \
    -E .DS_Store \
    -E .lock$ \
    -E .eslintcache \
    -E python/ \
    -E vendor/ \
    -E drupal/ \
    -E db-data/ \
    -E \"fatvai-*\""

alias venv="nvim ~/.zshenv"
alias al="nvim ~/.zsh/aliases.zsh"
    
# remove whitespaces in file paths
alias fds="fd -H | sed 's/ /\\ /g'" 

# xargs result of fzf
alias fzfx='fzf --multi --prompt "$FZF_PROMPT file -> " --preview "bat {1} --color always --theme=Nord" | xargs -r -d "\n"'

# run interactive docker container -> "dev $IMAGE $COMMAND"
alias dev='docker run --rm -it -v $(pwd):/home/app -w /home/app -v ~/.docker_bash_history:/root/.bash_history -u $(id -u):$(id -g)'

alias gcm='git commit'
alias d='git-diff'
alias r='git-restore'

alias cal="\$BROWSER --new-window https://calendar.google.com/calendar/u/2/r"
alias nerd="\$BROWSER --new-window https://www.nerdfonts.com/cheat-sheet"
alias emoji="\$BROWSER --new-window https://www.freetool.dev/emoji-picker"
alias gpt="\$BROWSER --new-window https://chat.openai.com"

alias cat='bat'
alias ll='exa --git -I=".git|node_modules" -a'
alias l='exa --icons --git -I=".git|node_modules" -a -l'
alias lt='exa -T --level=2 --icons -I=".git|node_modules" --git -a'
alias dust="dust -c"
alias clip="xclip -sel clip"

alias yac="httpyac"


alias py='python3'
alias dc='docker compose'
alias lg='lazygit'
alias ldo="lazydocker"
alias tf='terraform'
alias nf='neofetch'
alias tx="tmuxinator"
alias nord="nordvpn"
alias tz='gotz --timezones "CST:America/New_York,Pacific:America/Los_Angeles"'

# alias k='kubectl'
alias k='k3s kubectl'
alias k3='k3s'
alias mnctl='minikube kubectl --'

alias whalehunt='docker rm -f \$(docker ps -aq)'
alias doclean='rm ~/.docker/config.json'
alias rmvolumes='rm-docker-volumes'

alias src='source ~/.zshrc'
alias dpip="~/.local/share/nvim/mason/packages/debugpy/venv/bin/pip"

psm() {
    ps aux --sort=-rss | awk '{print $6/1024 " MB\t\t" substr($0, index($0,$11))}'
}

deadlinks(){
    find "$1" -xtype l -delete
}
