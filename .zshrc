# Enable Powerlevel10k instan. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit -d "${HOME}/.cache/zsh/zcompdump-${ZSH_VERSION}"
_comp_options+=(globdots) # Include hidden files.

# History in cache directory
HISTSIZE=100000
SAVEHIST=100000
HISTFILE="${XDG_CACHE_HOME}/zsh_history"
NODE_REPL_HISTORY="${XDG_CACHE_HOME}/node_repl_history"
SQLITE_HISTORY="${XDG_CACHE_HOME}/sqlite_history"

# Vim-like key-bindings
set -o vi
bindkey -v '^?' backward-delete-char
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

wal -w -q

# Plugins
[ -f "${HOME}/.dotfiles/.aliases.zsh" ] && source "${HOME}/.dotfiles/.aliases.zsh"
[ -f "${HOME}/.p10k.zsh" ] && source "${HOME}/.p10k.zsh"

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# bun completions
[ -s "/home/whoami/.bun/_bun" ] && source "/home/whoami/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH=$PATH:/usr/bin/ntlm_auth
export PATH="$PATH:/home/whoami/depot_tools"

autoload -Uz compinit
fpath+=~/.zfunc
