#
# ~/.bash_profile
#

# NOTE: Bash doesn't read ~/.profile if ~/.bash_profile or ~/.bash_login
# exists.
if [[ -r ~/.profile ]]; then
  . ~/.profile
fi

if [[ $- == *i* && -r ~/.bashrc ]]; then
  . ~/.bashrc
fi
