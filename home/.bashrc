export PS1='\n\[\e[0;36m\]\w\[\e[m\] (jobs: \j)\n\[\e[$([[ $? -eq 0 ]] && echo "0;32" || echo "0;31")m\]$\[\e[m\] '

if [[ -t 0 ]]; then
  stty stop undef
  stty start undef
fi
