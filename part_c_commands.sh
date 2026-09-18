#!bin/bash

# Add the following line to the ~/.bashrc file to set colored text
export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "

# Bash aliases in ~/.bash_aliases
# General Shortcuts
alias lsort="ls -lrt"
alias la="ls -a"
alias c="clear"

# Navigation Aliases
alias go_desktop="cd ~/Desktop"
alias go_downloads="cd ~/Downloads"
alias go_documents="cd ~/Documents"

# Ensuring bashrc loads bash_aliases

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Applying the changes

source ~/.bashrc

# a. Create ~/bin directory and move scripts
mkdir -p ~/bin
mv create_user.sh delete_user.sh ~/bin/

# b. Add ~/bin to PATH inside ~/.bashrc
echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc

# c. Apply changes and execute from a different directory (e.g., /tmp)
source ~/.bashrc
cd /tmp
create_user.sh