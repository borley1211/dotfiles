for month in $(seq -f%02g 2 12); do
    dname="$month-"
    mname="$(LC_ALL=C date -d${month}/1 +%B)"
    dname=$dname$mname
    echo $dname
    mkdir "${dname}"
done
    
