# .profile for Linux remote machines for Rob Jenson
#
# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

##### Default Umask #####
###
# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#
# You can make it less permissive here, but not more so.
umask 022
##### End Default Umask #####

##### Load .bashrc if running Bash #####
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "${HOME}/.bashrc" ]; then
	. "${HOME}/.bashrc"
    fi
fi
##### Load .bashrc if running Bash #####

##### Set Up History Processing #####
### Some useful hints from: http://blog.sanctum.geek.nz/better-bash-history/
###
# Append history instead of over-writing it
shopt -s histappend
# Verify the history command you're about to execute first!
shopt -s histverify
# Keep a much larger history file
HISTFILESIZE=1000000
HISTSIZE=1000000
# Don't store commands in history if they begin with a space
HISTCONTROL=ignorespace
# Don't store duplicate commands in history
HISTCONTROL=ignoredups
# Some commands don't need to be stored in history
HISTIGNORE='bg:env:fg:history:set'
# History can record timestamps
HISTTIMEFORMAT='%F %T '

# Record each line of history as you issue it:
PROMPT_COMMAND='history -a'
##### End Set Up History Processing #####

##### Set Up the Prompt #####
### Some useful hits from http://blog.sanctum.geek.nz/bash-prompts/
PS1="\h:\W \u [\t:\!]\$ "
##### End Set Up the Prompt #####

export MANPATH="/usr/share/man"

if [ -d /usr/local/share/man ]; then
  export MANPATH="/usr/local/share/man:${MANPATH}"
fi

##### Set up Local Executables #####
if [ -d "${HOME}/bin" ]; then
    export PATH="${PATH}:${HOME}/bin"
fi

if [ -d "${HOME}/man" ]; then
    export MANPATH="${MANPATH}:${HOME}/man"
fi    
##### End Set up Local Executables #####

##### Set up JAVA_HOME #####

# JAVA_HOME="Full_Path_To_JAVA"

# Set PATH to include our JAVA_HOME chosen above
if [ -d ${JAVA_HOME} ]; then
    export PATH="${JAVA_HOME}/bin:${PATH}"
fi    

##### End Set up JAVA_HOME #####

##### Shell Functions #####

### Function ngfind: Run find but don't show all the git stuff in results ###
function ngfind ()
{
    find $* | egrep -v './.git/'
}
### End Function ngfind ###

### Function test_network : Ping continuously to see if ###
### the Internet is accessible to this host ###
# Whom to ping to see if the Internet is available:
PINGTARGET="8.8.8.8"
# How many packets to send before summarizing
PINGCOUNT="10"
# How many seconds between packets to send
PINGINTERVAL="5"
function test_mynetwork ()
{
    while [ 1 ]
    do
	date
	uptime
	echo
	ping -c${PINGCOUNT} -i${PINGINTERVAL} ${PINGTARGET}
	sleep ${PINGINTERVAL}
    done
}
### End Function test_network ###

##### End Shell Functions #####

##### Aliases #####
alias delbackups="find . -type f -name '*~' -exec /bin/rm -v '{}' \;"

alias emacs="emacs -nw "

alias ssh_hosts="egrep '^Host' ${HOME}/.ssh/config"

alias rms="rm -frvP"

alias functions='declare -F | egrep -v "^declare -f _"'

alias whois="whois -h whois.gandi.net "

##### End Aliases #####
