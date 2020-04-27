set -e
shopt -s nullglob

arch="${0%/*}"
. "$arch/../config.sh"
common="$arch/../common"
arch="${arch##*/}"
exe="${0##*/}"

args=("$@")

execute () {
    [[ -x $1 ]] || chmod +x "$1"
    exec "$1" "${args[@]}"
}

exec_in () {
    execute "$1/$arch/$exe.exe"
}

latest () {
    printf '%s\0' "$1"* | sort -rVz | { read -d '' path; echo $path; }
}

msvc_real="$(latest "$(wslpath "$msvc")/")"
msvc="$(wslpath -m "$msvc_real")"

kits_bin_real="$(latest "$(wslpath "$kits")/10/bin/10.")"
kits_bin="$(wslpath -m "$kits_bin_real")"

kits_include_real="$(latest "$(wslpath "$kits")/10/include/")"
kits_include="$(wslpath -m "$kits_include_real")"

kits_lib_real="$(latest "$(wslpath "$kits")/10/lib/")"
kits_lib="$(wslpath -m "$kits_lib_real")"

kits_net_real="$(latest "$(wslpath "$kits")/NETFXSDK/")"
kits_net="$(wslpath -m "$kits_net_real")"

include=(
    "$msvc/include"
    "$kits_net/include/um"
    "$kits_include/ucrt"
    "$kits_include/shared"
    "$kits_include/um"
    "$kits_include/winrt"
    "$kits_include/cppwinrt"
)

lib=(
    "$msvc/lib"
    "$kits_net/lib/um"
    "$kits_lib/ucrt"
    "$kits_lib/um"
)

export INCLUDE="$(printf '%s;' "${include[@]}")"
export LIB="$(printf "%s/$arch;" "${lib[@]}")"

WSLENV=INCLUDE:LIB

exec_msvc () {
    exec_in "$msvc_real/bin/Hostx64"
}

exec_kits () {
    exec_in "$kits_bin_real"
}

. "$common/$exe.bash"
