#!/bin/bash

BROWSER="brave-browser"

# the backbone of my shell workflow (on top of tmux):
alias vim='nvim'
alias fzf='fzf --reverse' # prompt from top down

# daily utility escripts
alias workspace="workspace.sh"
alias chatbot='chatbot.sh'
alias commit='commit.sh'
alias switch='git-switch.sh'

# note taking
alias note='note.sh'
alias notes="notes.sh"
alias para="para.sh"
alias inbox="inbox.sh"
alias day="day.sh"
alias project="project.sh"

alias tags="tags.sh"
alias work="zk edit --sort modified -i \$NOTES/work"
alias ocelot="zk edit --sort modified -i \$NOTES/work/ocelot/"
alias thoughts="zk edit -i --tag=thoughts --sort modified"
alias seeds="zk edit -i --tag=seed --sort modified"
alias projects="zk edit -i --tag=project --sort modified"
alias quotes="zk edit -i --tag=quote --sort modified"

alias p="projects"
alias t="tags"

alias zz="zz.sh"
alias ww="work-week.sh"
alias todo="vim \$TODO"
alias tmp="tmp.sh"

alias today="date +%Y-%m-%d"
alias books="books.sh"
alias quote="quote.sh"

alias v='FZF_PROMPT=Open; fds | preview nvim'
alias nc='FZF_PROMPT=Open; fds | preview nvim --clean'
alias c='fd --type=d . | fzf --prompt "cd into: " --preview "exa -aT {1}" | while read -r result; do cd "$result" || exit; done'
alias r='FZF_PROMPT=Remove file; fds | preview rm'
alias d="day"
alias dot="fd . ~/.dotfiles -H | fzf | xargs -r nvim"
alias sw='switch'

alias rg="rg \
    --glob \"!.git\" \
    --glob \"!*min.{js,css}\" \
    --glob \"!init.sql\" \
    --glob \"!dev-mocks\" \
    --glob \"!python\" \
    --glob \"!fatvai-*\""

alias fd="fd --no-ignore-vcs \
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
    -E hugo \
    -E .foliate \
    -E \"fatvai-*\" \
    -E coverage"

alias venv="nvim ~/.zshenv"
    
# remove whitespaces in file paths
alias fds="fd --type=file -H | sed 's/ /\\ /g'" 

# xargs result of fzf
alias preview='fzf --multi --prompt "$FZF_PROMPT file -> " --preview "bat {1} --color always --theme=Nord" --height=40% | xargs -r -d "\n"'

# run interactive docker container -> "dev $IMAGE $COMMAND"
alias dev='docker run --rm -it -v $(pwd):/home/app -w /home/app -v ~/.docker_bash_history:/root/.bash_history -u $(id -u):$(id -g)'

alias gcm='git commit'
alias gdiff='git-diff'
alias gr='git-restore'

alias cal="\$BROWSER --new-window https://calendar.google.com/calendar/u/2/r"
alias nerd="\$BROWSER --new-window https://www.nerdfonts.com/cheat-sheet"
alias emoji="\$BROWSER --new-window https://www.freetool.dev/emoji-picker"
alias gpt="\$BROWSER --new-window https://chat.openai.com"

alias cat='bat'
alias ll='exa --git -I=".git|node_modules" -a'
alias l='exa --icons --git -I=".git|node_modules" -a -l'
alias lt='exa -T --level=2 --icons -I=".git|node_modules|dist|coverage" --git -a'
alias dust="dust -c"
alias clip="xclip -sel clip"

alias tz='gotz --timezones "CST:America/New_York,Pacific:America/Los_Angeles"'

alias py='python3'
alias dc='docker compose'
alias lg='lazygit'
alias ldo="lazydocker"
alias tf='terraform'
alias nf='neofetch'
alias tx="tmuxinator"
alias yac="httpyac"
alias nord="nordvpn"
alias nx="npx nx"

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
