args=()

for arg; do
    case "$arg" in
        -c|-E|/c)
            args+=("$1")
            shift
            break
            ;;
        -I/*)
            args+=("-I$(wslpath -m "${arg#-I}")")
            ;;
        *)
            args+=("$arg")
    esac

    shift
done

for arg; do
    args+=("$(wslpath -w "$arg")")
done

exec_msvc
