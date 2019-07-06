#!/bin/sh

usage() {
    cat <<EOF
Usage: start.sh <command>

Commands:

    docs  Show the gramps manual (man page)

    gramps  Start gramps GUI application

    report <OPTION STRING>
        Generate a report specified and configured by the options string. See
        the "docs" command for more info. This command sets --action=report and
        ends with --options (all actions require options).

    shell  Start a shell in the docker environment (for development)

EOF
}

run_docker="docker run --rm"

# Mount data directory and make it gramp's default database path
local_data=$(realpath "$(dirname "$0")")/data
run_docker="$run_docker --volume $local_data:/data"
run_docker="$run_docker --env GRAMPSHOME=/data"

# Run as current user to keep ownership of any output files
as_user="--user $(id -u):$(id -g)"

# Flags for gui support
with_gui="--volume /tmp/.X11-unix:/tmp/.X11-unix --env DISPLAY=$DISPLAY"

case "$1" in
    docs)
        set -x
        $run_docker $with_gui $as_user gramps --help
        ;;
    gramps)
        set -x
        $run_docker $with_gui $as_user gramps
        ;;
    help)
        usage
        ;;
    report)
        shift
        set -x
        $run_docker $with_gui $as_user gramps --action=report --options "$@"
        ;;
    shell)
        set -x
        $run_docker $with_gui \
            --interactive --tty \
            --entrypoint=/bin/bash \
            gramps
        ;;
    *)
        echo "Unrecognized command. Try $0 help"
        ;;
esac
