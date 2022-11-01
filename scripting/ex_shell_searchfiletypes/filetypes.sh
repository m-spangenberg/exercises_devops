#!/bin/bash

: '
We make the file executable with chmod +x filename.sh
We run the file with ./filename.sh
'

: '
Ask the user for a directory and a file extension
'
echo -e "Search directory: "
read DIRECTORY
echo -e "Search extension: (jpg/png/pdf/txt)"
read EXTENSION

: '
Ask the user for comfirmation
'
echo -e "Are you sure? Yy/Nn"
read RESPONSE

: '
Use the confirmation to trigger the code inside an IF statement
'
if [[ $RESPONSE =~ ^[Yy]$ ]]
then
    echo "Searching for: $EXTENSION at $DIRECTORY"
    find "$DIRECTORY" -type f -name "*.$EXTENSION"
fi
