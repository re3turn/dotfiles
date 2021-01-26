judge_machine () {
    local MACHINE=$(uname -m)
    case "${MACHINE}" in
        "x86_64" ) echo "amd64" ;;
        "aarch64" ) echo "arm64" ;;
        "armv7l" ) echo "armhf" ;;
        * ) echo "i386" ;;
    esac
}

github_release_install () {
    if [ $# = 0 ]; then
        echo "usage: github_release_install <github_release_url>"
        return 1
    fi
    MACHINE=$(judge_machine)
    GITHUB_RELEASE_URL=$1
    DEB_URL=$(curl -s ${GITHUB_RELEASE_URL} | jq -r ".[0].assets[] | select(.name | test(\"${MACHINE}.deb\")) | .browser_download_url" | head -n 1)
    local TEMPDIR=$(mktemp -d)
    wget -qO ${TEMPDIR}/install.deb $DEB_URL
    sudo dpkg -i ${TEMPDIR}/install.deb
    rm -rf ${TEMPDIR}

    return 0
}

