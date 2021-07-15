#!/usr/bin/env bash

# Post installation configuration script for kimsufi dedicated server
# Some functions are inspired Matthieu Michon's post installation scripts:
# https://github.com/MatthieuMichon/post-config

GITHUB_USER=MFreeze
GITHUB_REPO=kimsufi-postinstall
GITHUB_BRANCH=main

# Remote scripts URI root
URI_ROOT="https://raw.githubusercontent.com/"\
    "${GITHUB_USER}/"\
    "${GITHUB_REPO}/"\
    "${GITHUB_BRANCH}/"

# Output log file
LOG_FILE="/root/post-install.log"

# Error codes
ERR_OK=0



# From Matthieu Michon repo
exec_remote () {
    # 'raw.githubusercontent.com' domain may not clear HTTPS CA checks
    bash <(wget --no-check-certificate -O - $URI_ROOT$1) > "${LOG_FILE}"
    return $?
}


main () {
    exec_remote "scrips/update_os"
    exit 0
}


# From Matthieu Michon repo
err() { cat <<< "${0##*/}: $@" 1>&2; }


main
