#export PATH=$PATH:$HOME/bin:/cygdrive/c/Java/jdk1.6.0_27/bin:$HOME/emr
#export JAVA_OPTS=-Xmx768m

alias tig='/c/cygwin/bin/tig'
alias mc='/c/cygwin/bin/mc'
alias node='/c/Program\ Files/nodejs/node.exe'


export JAVA_HOME=/c/Progra~1/Java/jdk1.7.0_03/
export PROJ_DIR=/c/data/ps/svn/src-root
export MSPEC=$PROJ_DIR/packages/Machine.Specifications.0.5.6.0/tools/mspec-clr4.exe
export NUNIT=$PROJ_DIR/buildTools/nunit/NUnit-2.5.7.10213/bin/net-2.0/nunit-console.exe

export PATH=$PATH:$HOME/tools/bin:$HOME/bin:$HOME/tools/ruby/bin:$HOME/tools/vim/vim73
export PATH=$JAVA_HOME/bin:$PATH:$CLOJURESCRIPT_HOME/bin
export PATH=$PATH:$HOME/tools/mdbg/bin
export PATH=$PATH:$HOME/tools/Winsdk/8.0/Debuggers/x64
export PATH=$PATH:/c/Python27:/c/Python27/Scripts

alias java='$JAVA_HOME/bin/java.exe'

# project aliases
alias proj='cd $PROJ_DIR'
alias pre-commit='./buildTools/nant/bin/nant.exe  automated'
alias pre-commit-release='./buildTools/nant/bin/nant.exe continuousIntegration'
alias release-clean='./buildTools/nant/bin/nant.exe releaseClean'
alias pre-commit-automated='./buildTools/nant/bin/nant.exe automated'

alias scss='cd $PROJ_DIR/webs/public/PS.Web/PS.Web.Marketing/content && bundle exec compass compile && proj'
alias zurb='$PROJ_DIR/apps/ZurbScssUpdater/bin/Debug/ZurbScssUpdater.exe'
alias web.main='cd $PROJ_DIR/webs/public/main/src/PS.Web.Main'
alias dashboards='cd $PROJ_DIR/webs/internal/dashboards/src/PS.Web.Dashboards'
alias db='cd /c/data/ps/databases'
alias infra='cd $PROJ_DIR/libraries/PS.Core/src/PS.Core'
alias ct='cd $PROJ_DIR/libraries/PS.Core/specs/ConsoleTester'
alias domain='cd $PROJ_DIR/libraries/PS.Domain/PS.Domain'
alias infra_specs='cd $PROJ_DIR/libraries/PS.Core/specs/PS.Core.Specs && $MSPEC ./bin/debug/PS.Infrastructure.Specs.dll'
alias domain_specs='cd $PROJ_DIR/libraries/PS.Domain/PS.Domain.Specs && $MSPEC ./bin/debug/PS.Domain.Specs.dll'
alias sapphire='cd /c/data/ps/databases/sapphire-local'
alias apps='cd /c/apps'
alias nant='./buildTools/nant/bin/nant.exe'
alias mspec=$MSPEC
alias nunit=$NUNIT
alias consoletester='./libraries/PS.Core/specs/ConsoleTester/bin/Debug/ConsoleApplication.exe'
alias versionmainweb='apps/PsCdnDeploy/PsCdnDeploy/bin/debug/PsCdnDeploy.exe -site MainWeb -autoheal'
alias versionstatic='apps/PsCdnDeploy/PsCdnDeploy/bin/debug/PsCdnDeploy.exe -site Static -autoheal'
alias edit-profile='sub ~/.bashrc'
alias utcnow='TZ=UTC date'
alias curlget='curl -C - -O $*'
alias hosts='sub c:/windows/system32/drivers/etc/hosts'
alias warmup='apps/pswarmup/bin/Debug/pswarmup.exe'
alias warm='java -jar ~/src/pshttp/target/pshttp-all.jar'
alias clj='java -cp ~/src/clojure/clojure-1.4.0.jar clojure.main $*'
alias installutil='/c/windows/Microsoft.NET/Framework64/v4.0.30319/InstallUtil.exe "$*"'
alias ssh-server='putty -load "ssh-server"'
alias prune_backups='node ~/src/js/prune.js'
alias events='start /c/data/ps/databases/logs/UserEvents/'
alias ipython='/c/Python27/Scripts/ipython'
alias ff='git ls-files | grep -i'
alias ant='/c/tools/apache-ant-1.8.4/bin/ant'
alias lga='git log --graph --oneline --all --decorate -n 25 "$@"'
alias recycle=' /c/windows/system32/inetsrv/appcmd.exe recycle apppool /apppool.name:Pluralsight'

#alias ntsd='/C/Program\ Files/Debugging\ Tools\ for\ Windows\ \(x64\)/ntsd.exe'
#alias cdb='/C/Program\ Files/Debugging\ Tools\ for\ Windows\ \(x64\)/cdb.exe'
#alias windbg='/C/Program\ Files/Debugging\ Tools\ for\ Windows\ \(x64\)/windbg.exe'

# functions
ed() {
    e "$*" &
}

reload() {
	source ~/.bashrc
}

k() {
	gitk "$*" &
}

pathadd() {
	if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
		PATH="$PATH:$1"
	fi
}

# git aliases
alias master='git checkout master'
alias st='git status'
alias ga='git add -A'
alias pull-master='git pull --rebase github master'
alias push-master='git push github master'
alias new='git log $1@{1}..$1@{0} "$@"'
alias whatis='git show -s --pretty="tformat:%h (%s, %ad)" --date=short'
alias gg='git gui'
alias logdiff='git log -p' "$@"
alias logdiff2='git log -p -2' "$@"
alias lga='git log --graph --oneline --all --decorate -n 25 "$@"'
alias lg='git log --graph --oneline --decorate -n 25 "$@"'
alias make-patch='git format-patch -1 "$@"'
alias ff='git ls-files | grep -i'


# see http://www.opinionatedprogrammer.com/2011/01/colorful-bash-prompt-reflecting-git-status/
#. /etc/git-completion.bash
#PS1='[\W$(__git_ps1 " (%s)")]\$ '

#PS1='\[\033]0;$MSYSTEM:\w\007\033[32m\]\[\033[33m\W$(__git_ps1)\033[0m\] $ '

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

