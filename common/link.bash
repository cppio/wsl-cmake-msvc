args=()

for arg; do
    case "$arg" in
        *:/*)
            args+=("${arg%%:*}:$(wslpath -m "${arg#*:}")")
            ;;
        *)
            args+=("$arg")
    esac
done

exec_msvc
