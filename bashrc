cd ~/stitchfix/minx                     # Open terminal to Minx

alias branch="git for-each-ref --sort=committerdate refs/heads/ --format='%(color:blue)%(authordate:short) %(color:white)%(objectname:short) %(color:yellow)%(refname:short)%(color:reset) (%(color:green)%(committerdate:relative)%(color:reset))'"
alias test='yarn run test'     # Run JS specs locally
alias server='bundle install && ./bin/start_web'  # Start Minx locally
alias test='bundle exec rspec'  # Run Ruby specs locally
alias vim='vim -n'

# export PATH="$HOME/.rbenv/bin:$PATH"
export PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/~}\007"'

eval "$(rbenv init -)"          # Initialize rbenv

# Set the colors
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\[\033[33m\][\W]\[\033[32m\]\$(parse_git_branch)\[\033[00m\] :> "

[ -f ~/.fzf.bash ] && source ~/.fzf.bash  # Setup for fuzzy search in vim

# Set up NPM_TOKEN if .npmrc exists
if [ -f ~/.npmrc ]; then
  export NPM_TOKEN=`sed -n -e '/_authToken/ s/.*\= *//p' ~/.npmrc`
fi
