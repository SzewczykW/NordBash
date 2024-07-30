#! /bin/bash oh-my-bash.module
# NordBash theme for Oh-My-Bash

# Define colors
FG_BOLD_WHITE='\[\e[1;97m\]'
FG_BOLD_YELLOW='\[\e[1;33m\]'
FG_BOLD_RED='\[\e[1;31m\]'
FG_BOLD_BLUE='\[\e[1;34m\]'
FG_BOLD_CYAN='\[\e[1;36m\]'
FG_BOLD_GREEN='\[\e[1;32m\]'
RESET_COLOR='\[\e[0m\]'

# Git prompt settings
GIT_PROMPT_PREFIX="${FG_BOLD_WHITE} on ${FG_BOLD_YELLOW} "
GIT_PROMPT_SUFFIX="${FG_BOLD_YELLOW}"
GIT_PROMPT_DIRTY=" ${RESET_COLOR}${FG_BOLD_RED}*${RESET_COLOR}"
GIT_PROMPT_CLEAN=""

# Git prompt function
function git_prompt_info() {
    local branch
    branch=$(git symbolic-ref --short -q HEAD 2>/dev/null)
    if [ -n "$branch" ]; then
        local status
	status=$(git status --porcelain 2>/dev/null)
        if [ -n "$status" ]; then
            echo -n "${GIT_PROMPT_PREFIX}${branch}${GIT_PROMPT_DIRTY}${GIT_PROMPT_SUFFIX}"
        else
            echo -n "${GIT_PROMPT_PREFIX}${branch}${GIT_PROMPT_CLEAN}${GIT_PROMPT_SUFFIX}"
        fi
    fi
}

# PS1 prompt setting

function _omb_theme_PROMPT_COMMAND() {
	PS1="${FG_BOLD_BLUE}\u ${FG_BOLD_WHITE}at ${FG_BOLD_CYAN}\h ${FG_BOLD_WHITE}in ${FG_BOLD_GREEN}\w${RESET_COLOR}$(git_prompt_info)\n${FG_BOLD_WHITE}› ${RESET_COLOR}"
}

_omb_util_add_prompt_command _omb_theme_PROMPT_COMMAND

