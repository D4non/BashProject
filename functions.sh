#!/bin/bash

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
                if [[ $k ]]
                then
                    printf "$color_open$word$red_close "
                    continue
                else
                    printf "\n"
                    ending  
                fi
            done
            IFS=:
            printf "\n"
        done
    done

    
}

function style_select {
    clear
    color_close='\033[0m'

    printf 'Добрый день! Вас приветствует программа для взлома Пентагона \033[92mDanyaHacker.com\033[0m \n'
    PS3='Выберите стиль оформления: '

    select color in Red_blood Green_hacker Orange_mango Blue_sea Purple_haze Blue_sky White_standart
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
        Purple_haze)
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
    loading_icon 8 "Начинаем взлом!!!"
    coding
}

function loading_icon {
    load_interval="${1}"
    loading_message="${2}"
    elapsed=0
    loading_animation=( '—' "\\" '|' '/' )

    echo -n "${loading_message} "

    tput civis
    trap "tput cnorm" EXIT
    while [ "${load_interval}" -ne "${elapsed}" ] 
    do
        for frame in "${loading_animation[@]}" 
        do
            printf "%s\b" "${frame}"
            sleep 0.25
        done
        elapsed=$(( elapsed + 1 ))
    done
    printf " \b\n"
}

function ending {
    loading_icon 8 "Взлом Пентагона!!!"
    # number=$(( $RANDOM % 2))
    number=1
    if [[ $number -eq 1 ]]
    then
        echo "Пентагон успешно взломан, поздравляю!!!!"
        mining_choise
    else 
        echo "Увы, Пентагон не взломан!"
        echo "Вас обнаружили, все данные будут стёрты через 5 секунд!!!!"
        sleep 5
        poweroff
    fi
}

function mining {

    total=0

    echo "Чтобы майнить биткоины, нажимайте любые клавиши, для выхода нажмите <q>: "

    while true
    do
        read -s -n 1 k <&1
        if [ $k != 'q' ]
        then
            bitcoin=$(( $RANDOM % 5 ))
            printf "$color_open + $bitcoin Bitcoin $red_close \n"
            total=$(( $total + $bitcoin ))
            continue
        else
            printf " Вы намайнили $total Биткоинов \n"
            break
        fi
    done

    echo "Отлично, мы обанкротили ещё одного толстосумма, теперь уходим!"
    exit
}

function mining_choise {
    read -p "Хотите взломать счёт одного из сотрудников Пентагона и украсть его Биткоины? [y/n]: " choice

    if [[ $choice == 'y' ]]
    then
        echo "Отлично!"
        mining
    else
        echo "Правильно, лучше не рисковать, скрываемся!!!!"
        exit
    fi
}

style_select