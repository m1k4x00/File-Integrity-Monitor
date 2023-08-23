#!/usr/bin/env bash

echo "Options:"
echo "  A) Update baseline to be monitored"
echo "  B) Start monitoring using baseline"

read -p "Please enter 'A' or 'B': " userOpt
if [[ $userOpt == "A" ]]; then
    
    if [ -f "./base.txt" ]; then
        rm "./base.txt" 
    fi

    for f in ./Files/*; do 
        hash=$(echo $hash | sha512sum $f | cut -d " " -f 1)
        path=$(echo $path | readlink -f $f)
        echo "$path|$hash" >> ./base.txt
    done

elif [[ $userOpt == "B" ]]; then
    declare -A fileHashDict

    while read -r line; do
        IFS="|"
        read -a Linearr <<< "$line"
        fileHashDict[${Linearr[0]}]=${Linearr[1]}
    done < "./base.txt"

    for key in "${fileHashDict[@]}"; do
        echo $key
    done

    while true; do
        sleep 1
        
        for f in ./Files/*; do
            hashLive=$(echo $hashlive | sha512sum $f | cut -d " " -f 1)
            pathLive=$(echo $pathLive | readlink -f $f)
    
            if [[ -z ${fileHashDict[$pathLive]} ]]; then
                echo "$pathLive has been created!"
            else
                if [[ ${fileHashDict[$pathLive]} == $hashLive ]]; then
                    :
                else
                    echo "$pathLive has changed!"    
                fi

            fi
        done
        for key in "${!fileHashDict[@]}"; do
            if [[ ! -e $key ]]; then
                echo "$key has been deleted!"
            fi
        done
    done  
else
    echo "Error"      
fi

