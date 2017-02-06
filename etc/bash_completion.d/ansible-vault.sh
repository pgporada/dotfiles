#!/bin/env bash

# Credits:
# https://blog.heckel.xyz/2015/03/24/bash-completion-with-sub-commands-and-dynamic-options/
# https://raw.githubusercontent.com/syncany/syncany/develop/gradle/bash/syncany.bash-completion
# https://github.com/metacloud/molecule/blob/master/asset/bash_completion/molecule.bash-completion.sh

shopt -s progcomp

_ansible-vault() {
  local cur prev firstword lastword complete_words complete_options
  cur=${COMP_WORDS[COMP_CWORD]}
  prev=${COMP_WORDS[COMP_CWORD-1]}
  firstword=$(_get_firstword)

  GLOBAL_COMMANDS="create decrypt edit encrypt rekey view"
  GLOBAL_OPTIONS="-h -v --verbose --version --ask-vault-password --new-vault-password-file --output --vault-password-file --help"
  CREATE_OPTIONS=${GLOBAL_OPTIONS}
  DECRYPT_OPTIONS=${GLOBAL_OPTIONS}
  EDIT_OPTIONS=${GLOBAL_OPTIONS}
  ENCRYPT_OPTIONS=${GLOBAL_OPTIONS}
  REKEY_OPTIONS=${GLOBAL_OPTIONS}
  VIEW_OPTIONS=${GLOBAL_OPTIONS}

  # Un-comment this for debug purposes:
  # echo -e "\nprev = $prev, cur = $cur, firstword = $firstword.\n"

  case "${firstword}" in
    check)
      complete_options="${CHECK_OPTIONS}"
      ;;
    create)
      case "${prev}" in
        *)
          complete_options="${CREATE_OPTIONS}"
          ;;
      esac
      ;;
    decrypt)
      case "${prev}" in
        *)
          complete_options="${DECRYPT_OPTIONS}"
          ;;
      esac
      ;;
    edit)
      case "${prev}" in
        *)
          complete_options="${EDIT_OPTIONS}"
          ;;
      esac
      ;;
    encrypt)
      case "${prev}" in
        *)
          complete_options="${ENCRYPT_OPTIONS}"
          ;;
      esac
      ;;
    rekey)
      case "${prev}" in
        *)
          complete_options="${REKEY_OPTIONS}"
          ;;
      esac
      ;;
    view)
      case "${prev}" in
        *)
          complete_options="${VIEW_OPTIONS}"
          ;;
      esac
      ;;
    *)
  		complete_words="${GLOBAL_COMMANDS}"
  		complete_options="${GLOBAL_OPTIONS}"
  		;;
esac

  # Either display words or options, depending on the user input
	if [[ ${cur} == -* ]]; then
		COMPREPLY=( $(compgen -W "${complete_options}" -- ${cur}) )
	else
		COMPREPLY=( $(compgen -W "${complete_words}" -- ${cur}) )
	fi

    return 0
}

# Determines the first non-option word of the command line. This is usually the command.
_get_firstword() {
	local firstword i

	firstword=
	for ((i = 1; i < ${#COMP_WORDS[@]}; ++i)); do
		if [[ ${COMP_WORDS[i]} != -* ]]; then
			firstword=${COMP_WORDS[i]}
			break
		fi
	done

	echo $firstword
}

complete -F _ansible-vault ansible-vault
