#!/bin/bash

function coding {
    clear

    counter=0
    IFS=:
    red_close="\033[0m"
    echo "Пишите код, нажимая различные клавиши, а когда закончите, пафосно нажмите <enter>!"

    while [[ true ]]
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
                    counter=$(($counter + 1))
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

    while [[ true ]]; do
        select color in Red_blood Green_hacker Orange_mango Blue_sea Purple_haze Blue_sky White_standart
        do
            case $color in
            Red_blood)
                color_open='\033[91m'
                language_select
                break
                ;;
            Green_hacker) 
                color_open='\033[92m'
                language_select
                break
                ;;
            Orange_mango)
                color_open='\033[93m'
                language_select
                break
                ;;
            Blue_sea)
                color_open='\033[94m'
                language_select
                break
                ;;
            Purple_haze)
                color_open='\033[95m'
                language_select
                break
                ;;
            Blue_sky)
                color_open='\033[96m'
                language_select
                break
                ;;
            White_standart)
                color_open='\033[97m'
                language_select
                break
                ;;
            quit)
                break
                ;;
            *) 
                printf "\033[91mНедопустимая опция $REPLY\033[0m \n"
                ;;
            esac
            break
        done
    done
}

function language_select {
    echo 'Замечательно, со стилем мы определились, теперь выберите язык программирования, на котором хотите взломать Пентагон'
    PS3="Мой выбор: "

    while [[ true ]]; do
        select language in Python C# 
        do
            case $language in
            Python)
                file=$(cat ./scripts/Python.txt)
                echo "Супер, пора приступать!"
                loading_icon 8 "Начинаем взлом!!!"
                coding
                ;;
            C#)
                file=$(cat ./scripts/C#.txt)
                echo "Супер, пора приступать!"
                loading_icon 8 "Начинаем взлом!!!"
                coding
                ;;
            quit)
                break
                ;;
            *) 
                printf "\033[91mНедопустимая опция $REPLY\033[0m \n"
                ;;
            esac
            break
        done
    done
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
    clear

    if [[ $counter -lt 50 ]]; then
        echo "Увы, этого было неостаточно, Пентагон не взломан! :("
        exit
    else
        number=$(( $RANDOM % 2))
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
    fi
}

function mining {

    total=0

    echo "Чтобы майнить биткоины, нажимайте любые клавиши, для выхода нажмите <q>: "

    while true
    do
        read -s -n 1 k <&1
        if [[ $k != 'q' ]]
        then
            bitcoin=$(( $RANDOM % 5 ))
            printf "$color_open + $bitcoin Bitcoin $red_close \n"
            total=$(( $total + $bitcoin ))
            continue
        elif [[ $k == ' ' ]]; then
            printf "Вы намайнили $color_open$total Биткоинов!!!$red_close \n"
            printf "Это $color_open$(($total * 66773 )) долларов$red_close, или $color_open$(($total * 6069052 )) рублей!$red_close \n"
            break
        else
            printf "Вы намайнили $color_open$total Биткоинов!!!$red_close \n"
            printf "Это $color_open$(($total * 66773 )) долларов$red_close, или $color_open$(($total * 6069052 )) рублей!$red_close \n"
            break
        fi
    done

    echo "Отлично, мы обанкротили ещё одного толстосумма, теперь уходим!"
    exit
}

function mining_choise {
    read -p "Хотите взломать счёт одного из сотрудников Пентагона и украсть его Биткоины? [y/n]: " choice

    while [[ true ]]; do    
        if [[ $choice == 'y' ]]
        then
            echo "Отлично!"
            mining
            break
        elif [[ $choice == 'n' ]]
        then
            echo "Правильно, лучше не рисковать, скрываемся!!!!"
            exit
        else
            read -p "Нет такой команды, введите <y> если вы согласны, и <n> если нет: " choice
        fi
    done
}

style_select