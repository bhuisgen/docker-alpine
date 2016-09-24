#!/usr/bin/with-contenv bash

function usage {
    echo "Usage: $(basename "$0") [-u <URL>] [-r <COMMIT>] [-p <DIR>]"
    echo "Build a project."
    echo "Options:"
    echo -e "  -u, --git-url <URL>\t\tthe git repository URL of the project"
    echo -e "  -r, --git-ref <COMMIT>\tthe git reference to build"
    echo -e "  -p, --project <DIR>\t\tthe project directory"
    echo -e ""
    echo -e "  -s, --script <FILE>\t\tthe build script"
    echo -e "  -t, --timeout <SEC>\t\tthe build timeout"
    echo -e ""
    echo -e "  --help\t\t\tdisplay this help and exit"
}

while [[ $# -gt 0 ]]
do
    key="$1"
    case $key in
        -u|--git-url)
        if [ -z "$2" ]; then
            usage
            exit 2
        fi

        BUILD_GITURL=$2
        shift 2
        ;;

        -r|--git-ref)
        if [ -z "$2" ]; then
            usage
            exit 2
        fi

        BUILD_GITREF=$2
        shift 2
        ;;

        -p|--project)
        if [ -z "$2" ]; then
            usage
            exit 2
        fi

        BUILD_PROJECT=$2
        shift 2
        ;;

        -s|--script)
        if [ -z "$2" ]; then
            usage
            exit 2
        fi

        BUILD_SCRIPT=$2
        shift 2
        ;;

        -t|--timeout)
        if [ -z "$2" ]; then
            usage
            exit 2
        fi

        BUILD_TIMEOUT=$2
        shift 2
        ;;

        --help)
        usage
        exit 0
        ;;

        *)
        usage
        exit 2
        ;;
    esac
done

if [ -z "${BUILD_GITURL}" ]; then
    echo "BUILD_GITURL is not set, aborting"
    exit 1
fi

if [ -z "${BUILD_GITREF}" ]; then
    echo "BUILD_GITREF is not set, aborting"
    exit 1
fi

trap 'exit 2' ERR INT TERM

if [ ! -d project ]; then
    git clone ${BUILD_GITURL} project

    cd project

    git checkout ${BUILD_GITREF}
else
    cd project

    git reset --hard
    git clean -fdx
    git remote set-url origin ${BUILD_GITURL}
    git fetch origin

    git checkout ${BUILD_GITREF}
fi

if [ ! -z "${BUILD_PROJECT}" ]; then
    cd ${BUILD_PROJECT}
fi

timeout -t ${BUILD_TIMEOUT} bash ${BUILD_SCRIPT}
