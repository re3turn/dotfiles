judge_machine () {
    local MACHINE=$(uname -m)
    case "${MACHINE}" in
        "x86_64" ) echo "amd64" ;;
        "aarch64" ) echo "arm64" ;;
        "armv7l" ) echo "armhf" ;;
        * ) echo "i386" ;;
    esac
}

