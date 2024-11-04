# Basic zsh configuration
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000

# Load version control information
autoload -Uz add-zsh-hook vcs_info
setopt prompt_subst
add-zsh-hook precmd vcs_info

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '⎇ %b %m%u%c'
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '*'
zstyle ':vcs_info:*' stagedstr '+'

RPROMPT='%F{8}$vcs_info_msg_0_%f'

# Basic completion system
autoload -Uz compinit
compinit

# Cache completion for better performance
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# Menu selection for completion
zstyle ':completion:*' menu select

# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Colorful completion menu
zstyle ':completion:*:*:*:*:descriptions' format '%F{green}-- %d --%f'
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'

# Group matches and describe groups
zstyle ':completion:*' group-name ''
zstyle ':completion:*:*:-command-:*:*' group-order alias builtins functions commands

# Better directory stack navigation
setopt AUTO_PUSHD        # Push directories to stack automatically
setopt PUSHD_IGNORE_DUPS # Don't push duplicates
setopt PUSHD_SILENT      # Don't print directory stack

# Better history
setopt EXTENDED_HISTORY       # Write timestamp to history
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicate entries first
setopt HIST_IGNORE_DUPS       # Don't record duplicates
setopt HIST_IGNORE_SPACE      # Don't record entries starting with space
setopt HIST_VERIFY            # Show command before executing from history
setopt SHARE_HISTORY          # Share history between sessions

# Basic autosuggestions (requires zsh-autosuggestions package)
[[ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]] &&
    source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Basic syntax highlighting (requires zsh-syntax-highlighting package)
[[ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] &&
    source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Load aliases
[[ -f ~/.zsh_aliases ]] && source ~/.zsh_aliases

# Prompt customisation
PROMPT='%F{cyan}%~%f %# '
