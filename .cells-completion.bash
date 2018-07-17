#!bash
#
# cells-completion
# ===================
#
# Bash completion support for [cells-cli]
#
# The contained completion routines provide support for completing:
#
#  *) app context folder: clean publish build cordova-build serve-app check-mock
#  *) component context folder: serve validate version component::lint component::unit-testing component::demo-tests component::check-theme
#  *) no-context folder: environment:setup app:create component:create cordova-plugin:create workspace:create
#
#
# Installation
# ------------
#
# To achieve cells-cli completion:
#
#    1) Copy this file to somewhere (e.g. ~/.cells-completion.bash).
#    2) Add the following line to your .bashrc/.zshrc:
#        source ~/.cells-completion.bash
#    3) You could also add the following lines in your .bash_profile instead:
#
#        if [ -f ~/.cells-completion.bash ]; then
#          . ~/.cells-completion.bash
#        fi
#


__cells_generate_completion()
{
  declare current_word
  current_word="${COMP_WORDS[COMP_CWORD]}"
  COMPREPLY=($(compgen -W "$1" -- "$current_word"))
  return 0
}

__cells_commands ()
{
  declare current_word
  declare command
  declare context

  current_word="${COMP_WORDS[COMP_CWORD]}"

  context="$(cells -c | awk -F '[][]' '{print $2}' | cut -d \, -f 1 | xargs)"

  case "${context}" in
  app) __cells_app_context "$context";;
  component) __cells_component_context "$context";;
  *) __cells_no_context ;;
  esac

}

# Complete commands for a app context folder
__cells_app_context () 
{
  
  COMMANDS='
    clean publish build cordova-build
	serve-app check-mocks'

  __cells_generate_completion "$COMMANDS"
}

# Complete commands for a component context folder
__cells_component_context () {
  
  COMMANDS='
    serve validate version component::lint component::unit-testing
	component::demo-tests component::check-theme'

  __cells_generate_completion "$COMMANDS"
}

# Complete commands for a no context folder
__cells_no_context () {
  
  COMMANDS='
    environment:setup app:create component:create cordova-plugin:create
	workspace:create'

  __cells_generate_completion "$COMMANDS"
}

# Setup function completion for cells-cli
__cells ()
{
  __cells_commands
  return 0
}

# Setup completion for cells-cli
complete -o default -F __cells cells
