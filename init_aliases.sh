alias relogin="exec $SHELL -l"
alias reshell="exec $SHELL"
alias inodecheck='echo "==== `pwd` ====" ; for i in `ls -A1` ; do echo -n "## $i ### " ; echo "(`find ./$i -type f | wc -l`)" ; done | sort -nr'
alias gogh='bash -c  "$(wget -qO- https://git.io/vQgMr)"'
