NEWLINE=$'\n'

get_git_dirty() {
  git diff --quiet || echo '*'
}

autoload -Uz vcs_info
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '%F{red}*%f'   # display this when there are unstaged changes
zstyle ':vcs_info:*' stagedstr '+'  # display this when there are staged changes
zstyle ':vcs_info:*' actionformats \
    'on %F{69}%b|%a%c%u'
zstyle ':vcs_info:*' formats       \
    'on %F{69}%b %c%u'
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'
zstyle ':vcs_info:*' enable git cvs svn

theme_precmd () {
    vcs_info
}

setopt prompt_subst
PROMPT='%F{166}%n%f in %F{green}%1~ %f${vcs_info_msg_0_}%{$reset_color%}'
PROMPT+=' ${NEWLINE}%# '

autoload -U add-zsh-hook
add-zsh-hook precmd theme_precmd