#! /bin/bash

my_dir=$(pwd)

exclusion_list=('husky.sh') 

scan_file(){
    file_path=$1
    file=$(basename -- "$file_path")
    first_line=$(head -n 1 "$file_path")
    if [[ "$first_line" == "#!"* ]]; then
        echo
        echo "###############################################"
        echo "         Scanning $file"
        echo "###############################################"
        shellcheck -x "$file_path"
        exit_code=$?
        if [ $exit_code -eq 0 ] ; then
            printf "%b" "Successfully scanned ${file_path} 🙌\n"
        else
            printf "\e[31m ERROR: ShellCheck detected issues in %s.\e[0m\n" "${file_path} 🐛"
            exit $exit_code
        fi
    else
        printf "\n\e[33m ⚠️  Warning: '%s' is not a valid shell script. Make sure shebang is on the first line.\e[0m\n" "$file_path"
    fi
}

scan_all(){
    echo "Scanning all the shell scripts at $1 🔎"
    while IFS= read -r script 
    do
        if [[ " ${exclusion_list[*]} " =~  $(basename "${script}") ]]; then
            echo "File ${script} is excluded from the scan."
            continue
        fi
        first_line=$(head -n 1 "$script")
        if [[ "$first_line" == "#!"* ]]; then
            scan_file "$script"
        else
            printf "\n\e[33m ⚠️  Warning: '%s' is not scanned. If it is a shell script, make sure shebang is on the first line.\e[0m\n" "$script"
        fi
    done < <(find "$1" -name '*.sh' -not -path "$1/node_modules/*")
}

scan_all "$my_dir"