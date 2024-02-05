#!/bin/zsh

export WORK=$NOTES/areas/work
export QUARTER=$WORK/fy24-Q1/
alias wn="echo $QUARTER | xargs zk new -t $1"
alias workmd="code $QUARTER"

get_curr_work_week() {
    # search all work-week files and sort dates by latest
    ordered_work_weeks=$(
        fd . $WORK --type f |
            rg "work-week"|
            awk -F 'work-week-' '{print $2}' |
            cut -d '.' -f 1 |
            sort -r 
        )

    # get latest work-week date
    curr_work_date=$(echo $ordered_work_weeks | awk 'NR==1' )

    # get curr work-week file
    echo $(fd . $WORK | rg $curr_work_date)
}

export CURR_WORK_WEEK=$(get_curr_work_week)

alias ww="nvim $CURR_WORK_WEEK"
