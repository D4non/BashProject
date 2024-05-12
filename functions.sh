function coding {
    IFS=:
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
                    printf "$color_open$word$red_close "
                    continue
                fi
            done
            IFS=:
            printf "\n"
        done
        ending
    done
}

function style_select {
    color_close='\033[0m'

    printf 'Добрый день! Вас приветствует программа для взлома Пентагона \033[92mDanyaHacker.com\033[0m \n'
    PS3='Выберите стиль оформления: '

    select color in Red_blood Green_hacker Orange_mango Blue_sea Purple_hui Blue_sky White_standart
    do
        case $color in
        Red_blood)
            color_open='\033[91m'
            ;;
        Green_hacker) 
            color_open='\033[92m'
            ;;
        Orange_mango)
            color_open='\033[93m'
            ;;
        Blue_sea)
            color_open='\033[94m'
            ;;
        Purple_hui)
            color_open='\033[95m'
            ;;
        Blue_sky)
            color_open='\033[96m'
            ;;
        White_standart)
            color_open='\033[97m'
            ;;
        quit)
            break
            ;;
        *) 
            printf "\033[91mНедопустимая опция $REPLY\033[0m"
            ;;
        esac
        break
    done
    language_select
}

function language_select {
    echo 'Замечательно, со стилем мы определились, теперь выберите язык программирования, на котором хотите взломать Пентагон'
    PS3="Мой выбор: "

    select language in Python C# 
    do
        case $language in
        Python)
            file=$(cat ./scripts/Python.txt)
            ;;
        C#)
            file=$(cat ./scripts/C#.txt)
            ;;
        quit)
            break
            ;;
        *) 
            printf "\033[91mНедопустимая опция $REPLY\033[0m"
            ;;
        esac
        break
    done

    echo "Супер, пора приступать!"
    loading_icon 15 "Начинаем взлом!!!"
    coding
}

function loading_icon {
    local load_interval="${1}"
    local loading_message="${2}"
    local elapsed=0
    local loading_animation=( '—' "\\" '|' '/' )

    echo -n "${loading_message} "

    # This part is to make the cursor not blink
    # on top of the animation while it lasts
    tput civis
    trap "tput cnorm" EXIT
    while [ "${load_interval}" -ne "${elapsed}" ]; do
        for frame in "${loading_animation[@]}" ; do
            printf "%s\b" "${frame}"
            sleep 0.25
        done
        elapsed=$(( elapsed + 1 ))
    done
    printf " \b\n"
}

function ending {
    loading_icon 15 "Взлом Пентагона!!!"
    echo "Пентагон успешно взломан, поздравляю!!!!"
    exit
}