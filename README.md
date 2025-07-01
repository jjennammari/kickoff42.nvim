# kickoff42.nvim

## Introduction

This is a NeoVim template I created based on the work I did to my own NeoVim configuration, with the intent of being used in the 42School environment.

You can of course use it outside of the 42 school environment (or even if you are not a 42 student), just ignore the 42 part of the installation and configuration.

This is supposed to be a NeoVim template that is:

- minimal
- modular and easy to edit
- begginer friendly

## The inspo - kickstart.nvim

This is very much inspired by [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) which was the starting point for my configurarion.

**This is in no way associated with kickstart.nvim or it's creators.**
I just used their work as a foundation for my own configuration and as inspiration for this project.

I added inside `kickstart_docs/` 2 files from kickstart.nvim (the original README and init.lua) because everything is REALLY well documented and it might help you debug your config just like it helped me many times. When in doubt, try searching there.

# GUIDE - Installation and Set-up

**DISCLAIMER**: 
During this guide I will always use Homebrew as a package manager (explanation below). If you're not using it then replace everytime I use `brew` with whatever package manager you want.

## Installation @ 42 

> **NOTE**
> This installation was done for the 42Porto campus environment. You might have a different set of rules and regulations if you're in a different campus so take this into account.

### Homebrew
**Homebrew** is the package manager we will use to install NeoVim and it's dependencies. Because we are not allowed to use `sudo` inside the 42 school environment, **Homebrew** is a good work-around to install and manage packages.

Homebrew will take quite a big chunk of the available space in our user's home directory, so we will install it on `sgoinfre/`. Mine is using ~2.8GB atm so not a lot for `sgoinfre`, but more than half of the available space in my user's home dir.

### If you have Homebrew installed already - skip if this doesn't apply

Run:
```
brew bundle dump
``` 
This will create `Brewfile`, which is a log of the packages you installed through Hombrew. Save the path to this file, we will use it to recover these packages later.

Uninstall Homebrew:
- use Homebrew's [unninstall script](https://github.com/homebrew/install#uninstall-homebrew) (safer)
OR
- delete it manually:
```
which brew
/path/to/Homebrew/bin/brew
rm -rf /path/to/Homebrew/
```

Now we'll move the installation to `sgoinfre/`

---

Go to the `/sgoinfre/` directory:
```
cd ~/sgoinfre
``` 
Then we'll create a folder for Homebrew and install it like so:
```
mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/main | tar xz --strip-components 1 -C homebrew
```
We also have to create a `Cache` and `Temp` directories inside the homebrew folder:
```
cd ~/sgoinfre/homebrew
mkdir Cache && mkdir Temp
```
Then, add these lines in your `.zshrc` or `.bashrc` (for `fish` it might `~/.config/fish/config.fish` but I'm not sure):
```
HPREFIX="${HOME}/sgoinfre/homebrew"
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

**If you unnistalled homebrew previously** (replace `[path]/[to]/`):
```
brew bundle dump --file=[path]/[to]/Brewfile
```
to install packages from previous installation of Homebrew.

## Installing NeoVim

To install NeoVim just run:
```
brew install neovim
```

## External Dependencies

These are additional dependencies that NeoVim will need:
- ripgrep: `brew install ripgrep`
- a Nerd Font: optional, provides various icons
    - choose one from the [website](https://www.nerdfonts.com/)
    - install it with `brew`
    - set `vim.g.have_nerd_font` in `init.lua` to true;
- if you lack additional dependencies refer to the `kickstart_files/kickstart_README.md` file

## Installing this 
