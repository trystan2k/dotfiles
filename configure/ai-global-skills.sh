#!/usr/bin/env bash

# dotfiles folder
DOTFILES_FOLDER="$(pwd | grep -o '.*dotfiles')"

# Load helper functions
#shellcheck source=/dev/null
source "$DOTFILES_FOLDER/lib/functions"

# ---------------------------------------------
# AI Global Skills list
# ---------------------------------------------

global_skills=(
    basic-memory
    brainstorming
    gh-cli
    git
    husky
    lint-staged
    skill-development
)

agents=(
    opencode
)

installGlobalSkills() {
    info "Installing global skills"

    local agents_to_install
    agents_to_install="${agents[*]}"

    for aux in "${global_skills[@]}"; 
    do 
        info "Installing global skill $aux."
        
        npx skills@latest add trystan2k/skills/"$aux" -g -y -a "$agents_to_install"

        success "Global skill $aux installed."
    done

    if ask_question 'Do you want to install engram plugin?'; then
        info "Install engram plugin"
        engram setup opencode
    fi

    success "Global skills installed."
}

execute() {
    installGlobalSkills
}

execute  2>&1 | tee -a "$DOTFILE_LOG_FILE"