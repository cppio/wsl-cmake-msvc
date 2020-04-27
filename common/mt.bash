exec_kits & wait -n && exit || code=$?
[[ code -eq 1 ]] && exit 187
exit $code
