args=()

for arg; do
    args+=("$arg")
    shift

    case "$arg" in -c|-E|/c)
        break
    esac
done

for arg; do
    args+=("$(wslpath -w "$arg")")
done

exec_msvc