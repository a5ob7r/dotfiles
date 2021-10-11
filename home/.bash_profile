#
# ~/.bash_profile
#

# NOTE: Bash doesn't read ~/.profile if ~/.bash_profile or ~/.bash_login
# exists.
if [[ -f ~/.profile ]]; then
  source ~/.profile
fi

source ~/.bashrc 2>/dev/null
