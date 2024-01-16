###########################################
# command

### gcd
if [ -x "$(type -p ghq)" ]; then
    GHQ=$(ghq root)/github.com
    ME=$(git config --get user.name)

    gcd() {
        command ghq get -p ${1}
        if [ $(command dirname "${1}") = "." ]; then
            cd ${GHQ}/${ME}/${1}
        else
            cd ${GHQ}/${1}
        fi
    }
fi

fbr() {
    local branches branch
    branches=$(git branch -vv) &&
    branch=$(echo "$branches" | fzf +m) &&
    git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}
