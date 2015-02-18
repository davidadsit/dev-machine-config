export JAVA_HOME="/c/Program Files/Java/jre7/"
export PROJ_DIR=/c/data/ps/svn
export NUNIT=$PROJ_DIR/buildTools/nunit/NUnit-2.5.7.10213/bin/net-2.0/nunit-console.exe

# project aliases
alias proj='cd $PROJ_DIR'
alias pre-commit='./buildTools/nant/bin/nant.exe  automated'
alias pre-commit-release='./buildTools/nant/bin/nant.exe continuousIntegration'
alias release-clean='./buildTools/nant/bin/nant.exe releaseClean'
alias pre-commit-automated='./buildTools/nant/bin/nant.exe automated'

# see http://www.opinionatedprogrammer.com/2011/01/colorful-bash-prompt-reflecting-git-status/
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

function proml {
  local       BLACK="\[\033[0;30m\]"
  local        BLUE="\[\033[0;34m\]"
  local         RED="\[\033[0;31m\]"
  local   LIGHT_RED="\[\033[1;31m\]"
  local       GREEN="\[\033[0;32m\]"
  local LIGHT_GREEN="\[\033[1;32m\]"
  local       WHITE="\[\033[1;37m\]"
  local  LIGHT_GRAY="\[\033[0;37m\]"
  case $TERM in
    xterm*)
    TITLEBAR='\[\033]0;\w\007\]'
    ;;
    *)
    TITLEBAR=""
    ;;
  esac

PS1="${TITLEBAR}\
$LIGHT_GRAY\w$GREEN\$(parse_git_branch)\
$WHITE\$ "
PS2='> '
PS4='+ '
}
#proml
