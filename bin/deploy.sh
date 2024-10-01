#!/usr/bin/env bash
# vim: set filetype=sh :
#
# Author: Cody Hiar
# Date: 2024-10-08
#
# Description: Compile and deploy the application
#
# Set options:
#   e: Stop script if command fails
#   u: Stop script if unset variable is referenced
#   x: Debug, print commands as they are executed
#   o pipeline:  If any command in a pipeline fails it all fails
#
# IFS: Internal Field Separator
set -euo pipefail
IFS=$'\n\t'

# Remove the public folder and compile the site
rm -rf thelinklist/public
cd thelinklist && hugo --gc --minify && cd -

# Rsync to the webhost
rsync --verbose --progress --human-readable --delete --recursive thelinklist/public/ webhost:/var/www/thelinklist.dev
