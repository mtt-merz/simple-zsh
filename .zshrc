#------------------------------------------------------------------------------
# ZSH Configuration File
# Last updated: 2024
#------------------------------------------------------------------------------

#------------------------------------------------------------------------------
# History Configuration
#------------------------------------------------------------------------------
HISTFILE=~/.zsh_history
HISTSIZE=100000                # Increased from 50000 for longer history
SAVEHIST=100000                # Match HISTSIZE for consistency
setopt EXTENDED_HISTORY        # Save timestamp and duration
setopt HIST_EXPIRE_DUPS_FIRST  # Expire duplicate entries first
setopt HIST_IGNORE_DUPS        # Don't record duplicates
setopt HIST_IGNORE_SPACE       # Don't record entries starting with space
setopt HIST_VERIFY             # Show command before executing from history
setopt SHARE_HISTORY           # Share history between sessions
setopt HIST_REDUCE_BLANKS      # Remove unnecessary blanks

#------------------------------------------------------------------------------
# Directory Navigation
#------------------------------------------------------------------------------
setopt AUTO_PUSHD          # Push directories to stack automatically
setopt PUSHD_IGNORE_DUPS   # Don't push duplicates
setopt PUSHD_SILENT        # Don't print directory stack
setopt AUTO_CD             # Allow changing directories without cd
setopt MULTIOS             # Allow multiple redirections

#------------------------------------------------------------------------------
# Completion System
#------------------------------------------------------------------------------
autoload -Uz compinit
compinit

# Performance optimization
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# Completion styling
zstyle ':completion:*' menu select                          # Interactive menu
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'   # Case-insensitive
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}       # Colored completion
zstyle ':completion:*' group-name ''                        # Group matches
zstyle ':completion:*:*:-command-:*:*' group-order alias builtins functions commands

# Completion messages formatting
zstyle ':completion:*:*:*:*:descriptions' format '%F{green}-- %d --%f'
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'

#------------------------------------------------------------------------------
# Version Control Integration
#------------------------------------------------------------------------------
autoload -Uz add-zsh-hook vcs_info
setopt prompt_subst
add-zsh-hook precmd vcs_info

# VCS styling
zstyle ':vcs_info:git:*' formats '⎇ %b %m%u%c'
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '*'
zstyle ':vcs_info:*' stagedstr '+'

#------------------------------------------------------------------------------
# Key Bindings
#------------------------------------------------------------------------------
# History search
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search    # Up arrow
bindkey "^[[B" down-line-or-beginning-search  # Down arrow
bindkey "^[[1;5C" forward-word                # Ctrl + Right
bindkey "^[[1;5D" backward-word               # Ctrl + Left
bindkey "^k" clear-screen                     # Ctrl + K
bindkey "^[[D" clear-screen                   # Cmd + K (Mac)

#------------------------------------------------------------------------------
# Plugin Management
#------------------------------------------------------------------------------
# Auto-suggestions
if [[ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
    source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
    # Customize auto-suggestion color
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
    ZSH_AUTOSUGGEST_STRATEGY=(history completion)  # Use both history and completion for suggestions
    ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20             # Don't suggest for commands longer than 20 chars
fi

# Syntax highlighting
if [[ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
    source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    # Customize syntax highlighting
    ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)  # Enable additional highlighters
fi

#------------------------------------------------------------------------------
# Prompt Configuration
#------------------------------------------------------------------------------
RPROMPT='%F{8}$vcs_info_msg_0_%f'                         # Right prompt shows git status
PROMPT=$'\n''%F{cyan}[%D{%Y-%m-%d} %T] %~/%f'$'\n''> '    # Left prompt shows directory

# Enable command correction
setopt CORRECT
setopt CORRECT_ALL