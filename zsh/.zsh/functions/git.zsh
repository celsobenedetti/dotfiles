# !/bin/bash
_gitLogLineToHash="echo {} | grep -o '[a-f0-9]\{7\}' | head -1"
_viewGitLogLine="$_gitLogLineToHash | xargs -I % sh -c 'git show --color=always % | delta'"

flog(){ 
    git log \
        --color=always \
        --format="%C(cyan)%h %C(blue)%ar%C(auto)%d \
                %C(yellow)%s^%+b %C(black)%ae" "$@" |
        rg ago | # drop all lines which dont contain "X days ago (hack to trim multiline commit)"
        fzf -i -e +s \
        --reverse \
        --tiebreak=index \
        --no-multi \
        --ansi \
        --preview="echo {} |
                grep -o '[a-f0-9]\{7\}' |
                head -1 |
                xargs -I % sh -c 'git show --color=always % |
                delta'" \
        --header "Enter: view | <C-y>: copy commit hash" \
        --bind "enter:execute:$_viewGitLogLine | less -R" \
        --bind "ctrl-y:execute:$_gitLogLineToHash |
                xsel -ib"
}

git-diff(){
    git diff \
        $@ --name-only |
    fzf \
        --ansi \
        --preview "git diff $@ --color=always -- {-1}" \
        --prompt "Run Git Diff -> " \
        --preview-window=top:75% |
    xargs -r git diff
}


git-restore(){
    git diff \
        $@ --name-only |
    fzf \
        --ansi \
        --preview "git diff $@ --color=always -- {-1}" \
        --prompt "Git Restore File -> " \
        --preview-window=top:75% |
    xargs -r git restore
}


git-add(){
    git status -s |
    awk '{print $2}' |
    fzf \
        --ansi \
        --preview "git diff $@ --color=always -- {-1}" \
        --prompt "Git Add File -> " \
        --preview-window=top:75% |
    xargs -r git add
}


