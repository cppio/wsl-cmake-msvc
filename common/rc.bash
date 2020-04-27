manifest="$(<"$3")"
path="${manifest%\"*}"
path="${path#*\"}"
case "$path" in /*)
    path="$(wslpath -w "$path")"
    echo "${manifest%%\"*}\"${path//\\/\\\\}\"${manifest##*\"}" >"$3"
esac

exec_kits
