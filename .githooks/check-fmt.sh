HAS_ISSUES=0
FIRST_FILE=1
FILE_LIST=""

for file in $(git diff --name-only --staged); do
    FMT_RESULT="$(rustfmt +nightly --skip-children --unstable-features --check $file 2>/dev/null || true)"
    if [ "$FMT_RESULT" != "" ]; then
        if [ $FIRST_FILE -eq 0 ]; then
            FILE_LIST="$FILE_LIST "
        fi
        FILE_LIST="$FILE_LIST$file"
        HAS_ISSUES=1
        FIRST_FILE=0

        rustfmt +nightly --skip-children --unstable-features $file 2>/dev/null
    fi
done

if [ $HAS_ISSUES -eq 0 ]; then
    exit 0
fi

echo "There were formatting issues in some files. Re-stage the changes before committing."
echo "---"
echo $FILE_LIST

exit 1
