judge_machine () {
    local MACHINE=$(uname -m)
    case "${MACHINE}" in
        "x86_64" ) echo "amd64" ;;
        "aarch64" ) echo "arm64" ;;
        "armv7l" ) echo "armhf" ;;
        * ) echo "i386" ;;
    esac
}

judge_os_distribution () {
    if   [ -e /etc/debian_version ] ||
         [ -e /etc/debian_release ]; then
        # Check Ubuntu or Debian
        if [ -e /etc/lsb-release ]; then
            # Ubuntu
            distri_name="ubuntu"
        else
            # Debian
            distri_name="debian"
        fi
    elif [ -e /etc/fedora-release ]; then
        # Fedra
        distri_name="fedora"
    elif [ -e /etc/redhat-release ]; then
        if [ -e /etc/oracle-release ]; then
            # Oracle Linux
            distri_name="oracle"
        else
            # Red Hat Enterprise Linux
            distri_name="redhat"
        fi
    elif [ -e /etc/arch-release ]; then
        # Arch Linux
        distri_name="arch"
    elif [ -e /etc/turbolinux-release ]; then
        # Turbolinux
        distri_name="turbol"
    elif [ -e /etc/SuSE-release ]; then
        # SuSE Linux
        distri_name="suse"
    elif [ -e /etc/mandriva-release ]; then
        # Mandriva Linux
        distri_name="mandriva"
    elif [ -e /etc/vine-release ]; then
        # Vine Linux
        distri_name="vine"
    elif [ -e /etc/gentoo-release ]; then
        # Gentoo Linux
        distri_name="gentoo"
    else
        # Other
        distri_name="unkown"
    fi

    echo ${distri_name}
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

