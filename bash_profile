#  ---------------------------------------------------------------------------
#
#  Description:  This file holds all my BASH configurations and aliases
#
#  Sections:
#  1.   Environment Configuration
#  2.   Make Terminal Better (remapping defaults and adding functionality)
#  3.   File and Folder Management
#  4.   Searching
#  5.   Process Management
#  6.   Networking
#  7.   System Operations & Information
#  8.   Web Development
#  9.   Reminders & Notes


#
#  ---------------------------------------------------------------------------

#   -------------------------------
#   1.  ENVIRONMENT CONFIGURATION
#   -------------------------------


#  !/bin/bash
#  THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
   [[ -s "/Users/will/.gvm/bin/gvm-init.sh" ]] && source "/Users/will/.gvm/bin/gvm-init.sh"


#   -----------------------------
#   2.  MAKE TERMINAL BETTER
#   -----------------------------

alias l='clear && ls -alFG'
alias gs='printf "\033c" && git status'
alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation
cd() { builtin cd "$@"; ll; }               # Always list directory contents upon 'cd'
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
alias edit='subl'                           # edit:         Opens any file in sublime editor
alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
alias ~="cd ~"                              # ~:            Go Home
alias c='clear'                             # c:            Clear terminal display
alias which='type -all'                     # which:        Find executables
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias show_options='shopt'                  # Show_options: display bash options settings
alias fix_stty='stty sane'                  # fix_stty:     Restore terminal settings when screwed up
alias cic='set completion-ignore-case On'   # cic:          Make tab-completion case-insensitive
mcd () { mkdir -p "$1" && cd "$1"; }        # mcd:          Makes new Dir and jumps inside
trash () { command mv "$@" ~/.Trash ; }     # trash:        Moves a file to the MacOS trash
ql () { qlmanage -p "$*" >& /dev/null; }    # ql:           Opens any file in MacOS Quicklook Preview
alias DT='tee ~/Desktop/terminalOut.txt'    # DT:           Pipe content to file on MacOS Desktop

function willians() {
	cd ~/dev/workspace/pwms/williansmartins
}
function imobiliaria() {
	cd "/Users/will/dev/workspace/pwms/imobiliaria/projeto-java"
}
function erp() {
	cd "/Users/will/dev/workspace/waiso/workspace-erp-git/"
}
function contador() {
	cd "/Users/will/dev/workspace/waiso/workspace-contador-git/wavecontador/"
}
function nfe() {
	cd "/Users/will/dev/workspace/waiso/workspace-nfe-git/wavenfe/"
}
function rentasafe() {
	cd "/Users/will/dev/workspace/waiso/rentasafe/dev/"
}
function eclipse() {
	cd "/Users/will/dev/eclipse/"
	./eclipse &
}
function kidz() {
  cd "/Users/will/dev/workspace/waiso/kidz-web"
}
# git commit
cm() {
    git commit -m "echo $1" -a
}
 
# git add all & commit
cma() {
    git add .
    git commit -m "echo $1" -a
} 

gpom() {
    git push origin master
}

get_git_branch() {
  echo `git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
}

alias gpull='git pull origin `get_git_branch`'
alias gpush='git push origin `get_git_branch`'

function nfe-xml-backup(){
  cp webevolution/nfe/orm/src/main/resources/META-INF/persistence.xml /Users/will/dev/back/nfe;
  cp webevolution/nfe/orm/src/main/resources/META-INF/spring/datasource-test-context.xml /Users/will/dev/back/nfe;
  cp webevolution/nfe/viewria/src/main/webapp/WEB-INF/web.xml /Users/will/dev/back/nfe;
}

function nfe-xml-restore(){
  cp /Users/will/dev/back/nfe/erp-persistence.xml webevolution/nfe/orm/src/main/resources/META-INF;
  cp /Users/will/dev/back/nfe/datasource-test-context.xml webevolution/nfe/orm/src/main/resources/META-INF/spring/;
  cp /Users/will/dev/back/nfe/web.xml webevolution/nfe/viewria/src/main/webapp/WEB-INF;
}

function nfe-xml-checkout(){
  git checkout webevolution/nfe/orm/src/main/resources/META-INF/persistence.xml;
  git checkout webevolution/nfe/orm/src/main/resources/META-INF/spring/datasource-test-context.xml;
  git checkout webevolution/nfe/viewria/src/main/webapp/WEB-INF/web.xml;
}
## ============================================================================================

function erp-xml-backup(){
  cp webevolution/erp/erp-orm/src/main/resources/META-INF/erp-persistence.xml /Users/will/dev/back/;
  cp webevolution/erp/erp-orm/src/main/resources/META-INF/spring/datasource-test-context.xml /Users/will/dev/back/;
  cp webevolution/erp/erp-viewria/src/main/webapp/WEB-INF/web.xml /Users/will/dev/back/;
}

function erp-xml-restore(){
  cp /Users/will/dev/back/erp-persistence.xml webevolution/erp/erp-orm/src/main/resources/META-INF/;
  cp /Users/will/dev/back/datasource-test-context.xml webevolution/erp/erp-orm/src/main/resources/META-INF/spring/;
  cp /Users/will/dev/back/web.xml webevolution/erp/erp-viewria/src/main/webapp/WEB-INF/;
}

function erp-xml-checkout(){
  git checkout webevolution/erp/erp-orm/src/main/resources/META-INF/spring/datasource-test-context.xml;
  git checkout webevolution/erp/erp-orm/src/main/resources/META-INF/erp-persistence.xml;
  git checkout webevolution/erp/erp-viewria/src/main/webapp/WEB-INF/web.xml;
}


function erp-xml-ignorar(){
  git update-index --assume-unchanged webevolution/erp/erp-orm/src/main/resources/META-INF/erp-persistence.xml;
  git update-index --assume-unchanged webevolution/erp/erp-orm/src/main/resources/META-INF/spring/datasource-test-context.xml;
  git update-index --assume-unchanged webevolution/erp/erp-viewria/src/main/webapp/WEB-INF/web.xml;
}

function editarBash(){
	s ~/.bash_profile	
}

function compilarBash(){
  source ~/.bash_profile  
}

function williansmartins-deploy(){
	git add . && git commit -m "teste - integracao com jenkins" && gpush
}

gco(){
  git commit -m "`get_git_branch` $@"
}

developer(){
  git checkout developer_150615
}

