#!/bin/bash
D=$1
C=$2
DOINK=$1/$2
touch $DOINK.cpp $DOINK.h
var=$(echo $C | sed 's/[a-z]/\U&/g')
echo "#ifndef "$var"_H" >$DOINK.h
echo "#define "$var"_H" >>$DOINK.h
echo >>$DOINK.h
echo class" "$C "{" >>$DOINK.h
echo >>$DOINK.h
echo >>$DOINK.h
echo "};" >>$DOINK.h
echo >>$DOINK.h
echo "#endif" >>$DOINK.h
echo class $C created in $D
