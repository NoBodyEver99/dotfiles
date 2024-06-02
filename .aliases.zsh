alias \
    ls="exa --icons" \
    grep="grep --color=auto" \
    v="$EDITOR" \
    vim="nvim" \
    sv="sudo -E $EDITOR" \
    m="neomutt" \
    copy="xclip -sel c" \
    diff="diff --color" \
    cpr="rsync -avh --progress" \
    mvr="rsync -avh --progress --remove-source-files"

# pacman abbreviations
alias \
    pacs="sudo pacman -S" \
    pacss="pacman -Ss" \
    pacqs="pacman -Qs" \
    pacsyu="sudo pacman -Syu" \
    pacrs="sudo pacman -Rs" \
    pacsc="sudo pacman -Sc"

# pacar() {
#     orphan_packages="$(pacman -Qdtq)"
#     if [ -z "$orphan_packages" ]; then
#         printf "error: no orphan packages found\n\n"
#     else
#         sudo pacman -Rs $orphan_packages
#     fi
# }

alias clear-disk="sudo pacman -Scc &&
  yay -Scc &&
  yarn cache clean &&
  npm cache clean --force &&
  rm -rf ~/.gradle/caches/"

# tmux abbreviations
alias \
    t="tmux" \
    ta="tmux attach-session" \
    tl="tmux list-sessions" \
    tk="tmux kill-session"

alias ssh='TERM=xterm-256color ssh'

# Compiles and executes C file and removes binary
# $1 path to the C file
crun() {
    gcc "$1" && ./a.out "${@:2}" && rm a.out
}

# lf with ueberzug image preview
lf() {
    if [ ! -d "${XDG_CACHE_HOME}/lf" ] && mkdir -p "${XDG_CACHE_HOME}/lf"
    export FIFO_UEBERZUG="${XDG_CACHE_HOME}/lf/ueberzug-$$"
    rm -f "$FIFO_UEBERZUG"
    mkfifo "$FIFO_UEBERZUG"
    target="${XDG_CACHE_HOME}/lf/lfdir"
    lf-ueberzug -last-dir-path $target

    [ -p "$FIFO_UEBERZUG" ] && rm "$FIFO_UEBERZUG"
    cd "$(cat $target)"
}
