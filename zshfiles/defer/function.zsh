###########################################
# command

### gcd
if [ -x "$(whence ghq)" ]; then
    gcd() {
        if ! command -v ghq &> /dev/null; then
            echo "ghq command is not installed" >&2
            return 1
        fi

        if [ ${#} -ne 1 ]; then
            if [ $(ghq list | wc -l) -eq 0 ]; then
                echo "ghq no repository" >&2
                return 2
            fi
            GDIR=$(ghq list --full-path | fzf)
            if [ -n "${GDIR}" ]; then
                cd "${GDIR}"
            fi
            return 0
        fi

        GHQ=$(ghq root)/github.com
        ME=$(git config --get user.name)

        ghq get -p "${1}"
        if [ "$(dirname "${1}")" = "." ]; then
            cd "${GHQ}/${ME}/${1}"
        else
            cd "${GHQ}/${1}"
        fi
    }
fi

fbr() {
    if [ ${#} -ne 0 ]; then
        git checkout ${1}
        return $?
    fi
    branch=$(git branch --all | grep -v HEAD | sed "s/.* //" | fzf --preview "git log -20 --color=always {}") &&
    git checkout $(echo "$branch")
}
