#!/bin/bash

BROWSER="brave-browser"

alias vim='/usr/local/bin/nvim'
alias vi='vim .'
alias nvim='nvim --clean'
alias todo="vim $TODO"

alias tx="tmuxinator"
alias dpip="~/.local/share/nvim/mason/packages/debugpy/venv/bin/pip"

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
    
alias fds="fd -H | sed 's/ /\\ /g'" # remove whitespaces in file paths

alias fzfx='fzf --multi --prompt "$FZF_PROMPT file -> " --preview "bat {1} --color always --theme=Nord" | xargs -r -d "\n"'
alias v='FZF_PROMPT=Open; fds | fzfx nvim'
alias c='FZF_PROMPT=Cat; fds | fzfx bat'

alias gcm='git commit'
alias d='git-diff'
alias a='git-add'
alias s='git status'
alias r='git-restore'
alias gs='git status'

alias psm="ps aux --sort=-rss | awk '{print \$6/1024 \" MB\t\t\" substr(\$0, index(\$0,\$11))}'"

alias commit='commit.sh'
alias nord="nordvpn"

alias nerd="$BROWSER --new-window https://www.nerdfonts.com/cheat-sheet"
alias emoji="$BROWSER --new-window https://www.freetool.dev/emoji-picker"
alias gpt="$BROWSER --new-window https://chat.openai.com"

alias cat='bat'
alias ll='exa --git -I=".git|node_modules" -a'
alias l='exa --icons --git -I=".git|node_modules" -a -l'
alias lt='exa -T --level=2 --icons -I=".git|node_modules" --git -a'
alias dust="dust -c"
alias clip="xclip -sel clip"

alias yac="httpyac"

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

alias tz='gotz --timezones "CST:America/New_York,Pacific:America/Los_Angeles"'
alias z="zoxide"
alias ze="zk edit -i"
alias today="date +%Y-%m-%d"


alias src='source ~/.zshrc'
#alias fdfind='fd'
alias mornin='morning'

deadlinks(){
    find "$1" -xtype l -delete
}
