## installing brew @ 42 

`brew bundle dump` to create a file with packages already installed with brew

uninstall Homebrew if already installed =

create a dir under sgoinfre

add these lines in .zshrc on .bshrc:
```
HPREFIX="${HOME}/sgoinfre/hbrew"
export HOMEBREW_PREFIX="$HPREFIX"
export HOMEBREW_CELLAR="$HPREFIX/Cellar"
export HOMEBREW_CACHE="$HPREFIX/Cache"
export HOMEBREW_TEMP="$HPREFIX/Temp"
export HOMEBREW_REPOSITORY="$HPREFIX/Homebrew"
export HOMEBREW_CASK_OPTS='${HOME}/Applications'
export PATH="$HPREFIX/bin:$HPREFIX/sbin${PATH+:$PATH}"
export MANPATH="$HPREFIX/share/man${MANPATH+:$MANPATH}:"
export INFOPATH="$HPREFIX/share/info:${INFOPATH:-}"
# export HOMEBREW_NO_ANALYTICS=1
# export HOMEBREW_NO_ENV_HINTS=1
```

install brew as per this guide: https://docs.brew.sh/Installation#alternative-installs

create dirs for cache and temp called *Cache* & *Temp*

`brew bundle dump --file=./Brewfile` to install packages from previous installation of Homebrew
