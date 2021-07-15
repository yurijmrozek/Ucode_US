if [[ $1 = "-r" && $# = 2 ]]; then
    for (( i = 0; i <= $2; i++ ))
    do
        if [[ ${i} -lt 10 ]]; then
            mkdir "t0${i}"
        else
            mkdir "t${i}"
        fi
    done
elif [[ $1 = "-g" && $# = 1 ]]; then
    echo ".DS_Store\n._.DS_Store\n*.o\n*.out" > .gitignore
elif [[ $1 = "-c" && $# = 1 ]]; then
    read -p "Вводи номер таски [00 - 100]: " tnum
    read -p "Список submit файлов через пробел [strlen printchar]: " fname

    mkdir "t${tnum}"
    cd "t${tnum}"

    IFS=' ' read -r -a array <<< "${fname}"
    for element in "${array[@]}"
    do
        echo "void mx_${element}() {\n\t\n}" > "mx_${element}.c"
    done
else
    echo "Ну кароче: si.sh\n\t[-r] [количество тасок] - Ну я просто создам все директории)\n\t[-g] - gitignore для сишников ^_^\n\t[-c] - Подробное создание таски"
fi
