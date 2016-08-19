if [ "$USER" = "root" ]; then
  pr="#"
else
  pr="\$"
fi

if [ -n "$TAGGED_NAME" ]; then
  export PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\](\[\e[1m\]$TAGGED_NAME\[\e[m\]):\[\033[01;34m\]\w\[\033[00m\]$pr "
else
  export PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\](\[\e[1m\]$INSTANCE_ID\[\e[m\]):\[\033[01;34m\]\w\[\033[00m\]$pr "
fi
