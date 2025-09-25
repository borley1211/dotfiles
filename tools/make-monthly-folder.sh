# shellcheck disable=SC1091,SC2148

function _make_monthly_folder() {
    local dryrun=false
    if [[ "$1" == "-n" || "$1" == "--dry-run" ]]; then
        dryrun=true
    fi

    # Array is 0-indexed in bash. January is index 0.
    local months=(
        "January" "February" "March" "April" "May" "June" "July"
        "August" "September" "October" "November" "December"
    )

    local month
    for month in $(seq -f%02g 1 12); do
        # force base-10 and subtract 1 for 0-based index
        local index=$((10#$month - 1))
        local dname="${month}-${months[index]}"

        echo "${dname}"
        if ! $dryrun; then
            mkdir -p "${dname}"
        fi
    done
}

_make_monthly_folder "$@"
