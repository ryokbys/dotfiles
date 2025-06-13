
function set_projdir() {
    d=$(pwd)
    current=${HOME}/work/current
    setopt BASH_REMATCH
    if [[ ${d} =~ ^(${current}/[0-9]{6}_[^/]+) ]]; then
        export PROJ=${BASH_REMATCH[1]}
    else
        export PROJ
    fi
}

function mycd() {
    cd $@
    set_projdir
}

#-----aliases
alias ..='cd ..'
alias ...='cd ../..'
# alias +='pushd .'
# alias -='popd'
# alias cat='bat'
#alias cd='mycd'
alias diff='colordiff'
alias ducks='du -cks * | sort -rn | head -11'
alias grep='grep --color'
alias emacs='emacsclient -nw -a ""'
alias Emacs='open -a Emacs.app'
alias javac='javac -J-Dfile.encoding=utf-8'
alias gitk='gitk 2>/dev/null'
#alias ls='eza'
#alias ll='eza -l --sort=modified --time-style relative'
#alias la='eza -al --sort=modified --time-style relative'
alias ymd='date +%y%m%d'
alias now='date +%y%m%d_%H%M%S'
alias blogentry='myblog.py entry --basedir="~/Sites/RKSweb/" -a "Ryo KOBAYASHI"'
alias blogmake='myblog.py make --basedir="~/Sites/RKSweb/"'
alias blogupload='myblog.py upload --basedir="~/Sites/RKSweb/"'
alias note2entry='myblog.py notebook --basedir="~/Sites/RKSweb/" -a "Ryo KOBAYASHI"'
alias jn='jupyter notebook'
alias jl='jupyter lab'
alias upsync='rsync_wrapper up'
alias downsync='rsync_wrapper down'
alias mkresdir='mkdir result_$(date "+%y%m%d_%H%M")'
alias clean='make clean'
alias veryclean='make veryclean'
alias run='make run'
alias sed='gsed'
alias findnb='find . -name "*ipynb_check*" -prune -o -name "*.ipynb" | grep -v "_checkpoints"'
alias gcc='gcc-14'
alias g++='g++-14'
alias c++='g++-14'
#alias python='python3'
#alias pip='pip3'
