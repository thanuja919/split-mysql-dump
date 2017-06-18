#!/usr/bin/env bash

#When executing the script keep the main db dump in another folder.
 
AWK=awk
REGEX_NAME="Current Database: \`(.*)\`"
 
# Checks argument and prints usage if needed
if [ "$#" -lt "1" ]
then
    echo "Usage: $0 <dump.sql>"
    exit 1
fi
 
# Splits dump into temporary files
$AWK '/Current Database\: .*/{g++} { print $0 > g".tmpsql" }' $1
 
# Renames files or appends to existing one (to handle views)
for f in *.tmpsql
do
    DATABASE_LINE=`head -n1 $f`
    [[ $DATABASE_LINE =~ $REGEX_NAME ]]
    TARGET_FILE="${BASH_REMATCH[1]}.sql"
    if [ -f $TARGET_FILE ]; then
        cat $f >> $TARGET_FILE
        rm $f
    else
        mv $f ${BASH_REMATCH[1]}.sql
    fi
done
