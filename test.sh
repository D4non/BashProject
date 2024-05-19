
function coding {
    IFS=:
    red_close="\033[0m"
    file=$(cat ./scripts/C#.txt)

    while true
    do
        for line in $file
        do
            IFS=' '
            for word in $line
            do
                read -s -n 1 k <&1
                if [[ $k ]]; then
                  printf "$color_open$word$red_close "
                else
                  ending
                fi
            done
            IFS=:
            printf "\n"
        done
    done

    
}

function ending {
  exit
}

coding