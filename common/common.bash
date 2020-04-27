set -e

. "$(dirname "${BASH_SOURCE[0]}")/../config.sh"

latest () {
    local paths=("$1"*) IFS=$'\n'
    echo "${paths[*]}" | sort -V | tail -n1
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

export INCLUDE="$msvc/include;$kits_net/include/um;$kits_include/ucrt;$kits_include/shared;$kits_include/um;$kits_include/winrt;$kits_include/cppwinrt"
export LIB="$msvc/lib/$arch;$kits_net/lib/um/$arch;$kits_lib/ucrt/$arch;$kits_lib/um/$arch"
WSLENV=INCLUDE:LIB

args=("$@")

execute () {
    [[ -x "$1" ]] || chmod +x "$1"
    exec "$1" "${args[@]}"
}

exec_in () {
    execute "$1/$arch/$(basename "$0").exe"
}

exec_msvc () {
    exec_in "$msvc_real/bin/Hostx64"
}

exec_kits () {
    exec_in "$kits_bin_real"
}
