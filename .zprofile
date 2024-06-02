#!/bin/sh

# Set PATH
export PATH="${HOME}/.local/bin:${PATH}"
export PATH="$PATH:$HOME/.dotfiles/scripts"
export PATH="$PATH:$HOME/.dotfiles/statusbar"

# Default Programs
export VISUAL="nvim"
export EDITOR="${VISUAL}"

# XDG Patchs
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_DIRS="$XDG_DATA_HOME:/usr/local/share:/usr/share"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
# export XDG_MENU_PREFIX="lxde-"
# export DE=LXDE

# Android
export ANDROID_HOME="$HOME/Android/Sdk"
export ANDROID_SDK_ROOT=$ANDROID_HOME
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
# Java
export JAVA_HOME=/usr/lib/jvm/java-22-openjdk
export PATH=$JAVA_HOME/bin:$PATH

export GTK2_RC_FILES="${XDG_CONFIG_HOME}/gtk-2.0/gtkrc"
export JUPYTER_CONFIG_DIR="${XDG_CONFIG_HOME}/jupyter"
export DOCKER_CONFIG="${XDG_CONFIG_HOME}/docker"
export IPYTHONDIR="${XDG_CONFIG_HOME}/ipython"

export SSB_HOME="${XDG_DATA_HOME}"
export NVM_DIR="${XDG_DATA_HOME}/nvm"
export WINEPREFIX="${XDG_DATA_HOME}/wineprefixes/default"
export SDL_VIDEODRIVER="x11"

# export BAT_THEME="Catppuccin-mocha"
export _JAVA_AWT_WM_NONREPARENTING=1 # Fix for Java applications in dwm

export WALLPAPERS="$HOME/.dotfiles/assets/wallpapers"

# Bus address used by dbus-broker user service on Arch
# export DBUS_SESSION_BUS_ADDRESS="unix:path=$XDG_RUNTIME_DIR/bus"

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi
