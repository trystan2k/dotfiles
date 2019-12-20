#!/usr/bin/env bash

LOG_FOLDER="$(realpath ../)/logs"
LOG_FILE="$LOG_FOLDER/dotfiles.log"

startLogRedirect() {

    if [[ ! -f $LOG_FILE ]] ; then
        mkdir -p $LOG_FOLDER 
        touch $LOG_FILE
    fi

    # file descriptor 4 prints to STDOUT and to TARGET
    exec 4> >(while read a; do echo $a; echo $a >>$LOG_FILE; done)
    # file descriptor 5 remembers STDOUT
    exec 5>&1

    # now STDOUT is redirected
    exec >&4
}

stopLogRedirect() {
    # wer're done
    exec >&5
}

info () {
    printf "\r  [ `date "+%Y-%m-%d %H:%M:%S"` ] [ \033[36mINFO\033[0m ] $1\n"
}

user () {
    printf "\r [ `date "+%Y-%m-%d %H:%M:%S"` ] [ \033[34m????\033[0m ] $1\n"
}

success () {
    printf "\r [ `date "+%Y-%m-%d %H:%M:%S"` ] [ \033[32mSUCC\033[0m ] $1\n"
}

warn () {
    printf "\r [ `date "+%Y-%m-%d %H:%M:%S"` ] [ \033[31mWARN\033[0m ] $1\n"
}

fail () {
    printf "\r [ `date "+%Y-%m-%d %H:%M:%S"` ] [ \033[31mFAIL\033[0m ] $1\n"
    exit
}

install() {
    installTypeByOS=$1
    otherArguments="${@:2}"

    for i in $installTypeByOS
    do
        os_type=${i%:*};
        install_type=${i#*:};

        if [[ $OSTYPE == "$os_type"* ]] ; then
            case "$install_type" in
                brew*)  
                    brewInstall $otherArguments
                    ;;
                apt*)   
                    aptInstall $otherArguments
                    ;;
                cask*)
                    brewCaskInstall $otherArguments
                    ;;
                debFile*)
                    debFileInstall $otherArguments
                    ;;
                sh*)
                    shInstall $otherArguments
                    ;;
                appImage*)
                    appImageInstall $otherArguments
                    ;;
                *)        
                    warn "Unknow Installatin type: '$install_type'"
                    _errorInstall $otherArguments ;;
            esac   

            _checkInstallStatus $?
        fi
    done

}

_errorInstall() {
    warn "'$1' installation failed"
}

_checkInstallStatus() {
    if [ "$1" -gt 0 ] ; then
        _errorInstall $otherArguments
    fi
}

brewInstall() {

    if [ -z "$1" ]; then
        warn "The name of the tool to install must be informed."
        return 1
    fi

    info "Installing '$1' via Homebrew"
    #brew install $1

    return 0
}

brewCaskInstall() {

    if [ -z "$1" ]; then
        warn "The name of the tool to install must be informed."
        return 1
    fi

    info "Installing '$1' via Homebrew/cask"

    #brew cask install $1

    return 0
}

aptInstalll() {

    if [ -z "$1" ]; then
        warn "The name of the tool to install must be informed."
        return 1
    fi

    info "Installing '$1' via APT"

    #sudo apt install -y $1

    return 0
}

debFileInstall() {

    if [ -z "$1" ]; then
        warn "The name of the tool to install must be informed."
        return 1
    fi

    if [ -z "$2" ]; then
        warn "To install .deb files, a URL must be informed, to obtain the .deb file from"
        return 2
    fi    

    info "Installing '$1' via .deb file, from $2"

    #wget -O $PATH_TO_DOWNLOAD/$1.deb $2
    #sudo apt install $PATH_TO_DOWNLOAD/$1.deb -y
    #rm $PATH_TO_DOWNLOAD/$1.deb

    return 0
}

shInstall() {

    if [ -z "$1" ]; then
        warn "The name of the tool to install must be informed."
        return 1
    fi

    if [ -z "$2" ]; then
        warn "To install via sh script, a URL must be informed, to obtain the sh file from"
        return 2
    fi       

    info "Installing $1 via sh script, from $2"

    #sh -c "$(curl -fsSL $1)"

    return 0
}

appImageInstal() {

    if [ -z "$1" ]; then
        warn "The name of the tool to install must be informed."
        return 1
    fi

    if [ -z "$2" ]; then
        warn "To install .appImage files, a URL must be informed, to obtain the .appImage file from"
        return 2
    fi       

    info "Installing '$1' via AppImage, from $2"

    wget -O $PATH_TO_CUSTOM_APPS/$1.AppImage $2
    chmod u+x $PATH_TO_CUSTOM_APPS/$1.AppImage

    wget -O $PATH_TO_CUSTOM_APPS/$1.png $3   

    sudo sh -c "echo '[Desktop Entry]' > /usr/share/applications/$1.desktop"
    sudo sh -c "echo 'Encoding=UTF-8' >> /usr/share/applications/$1.desktop"
    sudo sh -c "echo 'Name=$1' >> /usr/share/applications/$1.desktop"
    sudo sh -c "echo 'Comment=$1' >> /usr/share/applications/$1.desktop"
    sudo sh -c "echo 'Exec=${PATH_TO_CUSTOM_APPS}/${1}.AppImage' >> /usr/share/applications/$1.desktop"
    sudo sh -c "echo 'Icon=${PATH_TO_CUSTOM_APPS}/${1}.png' >> /usr/share/applications/$1.desktop"
    sudo sh -c "echo 'Terminal=false' >> /usr/share/applications/$1.desktop"
    sudo sh -c "echo 'Type=Application' >> /usr/share/applications/$1.desktop"
    sudo sh -c "echo 'Categories=Application;' >> /usr/share/applications/$1.desktop"
    sudo sh -c "echo 'StartupNotify=true' >> /usr/share/applications/$1.desktop"

    return 0
}