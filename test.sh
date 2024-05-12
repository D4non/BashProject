IFS=:
    file=$(cat ./scripts/C#.txt)
    red_open="\033[91m"
    red_close="\033[0m"

    while true
    do
        for line in $file
        do
            IFS=' '
            for word in $line
            do
                read -s -n 1 k <&1
                if [ $k ]
                then
                    printf "$red_open$word$red_close "
                    continue
                fi
            done
            IFS=:
            printf "\n"
        done
        exit
    done