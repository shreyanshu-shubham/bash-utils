progress-bar(){    
    local current_count=$1
    local total_count=$2

    local percent_done=$(( current_count * 100 / total_count ))

    local terminal_width=$(tput cols)
    terminal_width=$((terminal_width-8))
    local scaled_current=$((  terminal_width * percent_done / 100 )) 

    local progress_bar='['

    local i
    for ((i=0;i<scaled_current;i++)); do
        progress_bar+='#'
    done
    for ((i=scaled_current;i<terminal_width;i++)); do
        progress_bar+='.'
    done
    progress_bar+=']'

    echo -n -e "${progress_bar} ${percent_done} % \r"
}

progress-bar "$@"
echo