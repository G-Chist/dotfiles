# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Aliases
alias clanker="ollama run gemma3"
alias ls="ls --color=auto"
alias gemini="npx https://github.com/google-gemini/gemini-cli"
alias binaryninja="~/binaryninja_free_linux/binaryninja/binaryninja"
alias empty_trash="rm -rf ~/.local/share/Trash/*"
alias nvim="/usr/bin/./nvim-linux-x86_64.appimage"
alias iaito="flatpak run org.radare.iaito"
alias studio="/usr/local/android-studio/bin/studio"
alias dot='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

cowsay -W 120 -f stegosaurus "In a large sauté pan or skillet at medium-high heat, add vegetable oil, then sauté the onions and peppers with salt and pepper, until the onions start to brown. Stir in the garlic, ginger, curry powder, turmeric, and cumin until fragrant, around one or two minutes. Reduce to low heat. Stir in the coconut milk, crushed tomatoes, and tomato paste until uniform. Add the tofu and toss to coat with the sauce. Bring the curry to a boil before reducing to a simmer. Cook uncovered for 5 minutes. Then stir in the spinach, lime zest, and lime juice, until the spinach wilts. Taste for additional salt and pepper and top with fresh cilantro.

Right now, it is $(date +"%Y-%m-%d %H:%M:%S")"

export PATH="$PATH:/home/matvei/JohnTheRipper/run"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# opencode
export PATH=/home/matvei/.opencode/bin:$PATH
