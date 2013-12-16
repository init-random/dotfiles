export JAVA_HOME=/opt/java
export PATH=$PATH:$JAVA_HOME/bin

export M2_HOME=/opt/maven
export M2=$M2_HOME/bin
export PATH=$PATH:$M2



# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle :compinstall filename '/home/scum/.zshrc'



env-vars() {
        export K=V
}
autoload env-vars

# mouse/clipboard support
if [ -f ~/.zsh/mouse.zsh ]; then
  . ~/.zsh/mouse.zsh
fi

if [ -f ~/.xmodmap ]; then
    /usr/bin/xmodmap ~/.xmodmap
fi


export GITUSER=init-random
# export PATH=.:/opt/java/jdk1.6.0_24/bin:/opt/bin:$HOME/bin:$PATH
export MONO_PATH=/usr/lib/cli/mono-addins-0.2
export ESHELL=/usr/bin/zsh
export R_HOME=/usr/bin/R

autoload -Uz compinit
autoload colors; colors
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd hist_ignore_all_dups hist_ignore_space
bindkey -e
# End of lines configured by zsh-newuser-install


export PS1="%{$fg[cyan]%}%B%n%b%{$reset_color%}:%~>> "
# color ls
export LS_COLORS="no=00:fi=00:di=92;1:ln=00;36:pi=40;33:so=00;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:ex=00;32:*.cmd=00;32:*.exe=00;32:*.com=00;32:*.btm=00;32:*.bat=00;32:*.sh=00;32:*.csh=00;32:*.tar=00;31:*.tgz=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.zip=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.bz2=00;31:*.bz=00;31:*.tz=00;31:*.rpm=00;31:*.cpio=00;31:*.jpg=00;35:*.gif=00;35:*.bmp=00;35:*.xbm=00;35:*.xpm=00;35:*.png=00;35:*.tif=00;35:"

# ant
export ANT_HOME=/usr/local/ant


# redefine word boundaries
WORDCHARS="${WORDCHARS:s#/#}"
WORDCHARS="${WORDCHARS:s#.#}"

# don't duplicate log entries
setopt hist_save_no_dups

# spelling correction
setopt correct

# more extensive globbing patterns
setopt extended_glob

# make cd pushd too
setopt auto_pushd
setopt pushd_ignore_dups

# when using !, confirm first
setopt hist_verify

## Prevent CVS files/directories from being completed
zstyle ':completion:*:(all-|)files' ignored-patterns '(|*/)CVS'
zstyle ':completion:*:cd:*' ignored-patterns '(*/)#CVS'

# command line calculator
autoload -U zcalc

autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line
export EDITOR=/usr/bin/vi
export VISUAL=/usr/bin/vi

# automagic history completion
autoload -U predict-on
zle -N predict-on
zle -N predict-off
bindkey "^Z" predict-on
bindkey "^X^Z" predict-off


# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi

bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward
bindkey "M-k" backward-kill-line

# this is a test
export TZ='US/Eastern'

