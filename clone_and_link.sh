#!/usr/bin/env sh

REPOSITORY_URL="https://github.com/njdancer/dot-files.git"
INSTALL_PATH=dot-files

(cd &&
([ -d $INSTALL_PATH ] ||
git clone $REPOSITORY_URL $INSTALL_PATH) &&
find $INSTALL_PATH -maxdepth 1 -not -path "*.git" -not -path "*.gitignore" -not -name "README" -not -name "clone_and_link.sh" -not -name ".DS_Store" -not -name $INSTALL_PATH -exec ln -vsf {} \;)
#find . -maxdepth 1 -not -path "*.git*" -not -name "README" -not -name "clone_and_link.sh" -not -name ".DS_Store" -not -name '.' -exec bash -c 'mkdir -p ~/$(dirname {})' \; -exec ln -vsf $INSTALL_PATH/{} ~/{} \;
# find . -type f -not -path "*.git*" -not -name "README" -not -name "clone_and_link.sh" -exec mkdir -p $(dirname "{}") \; -exec ln -vsf {} ~/{} \;
# find ~/dot-files -type f -not -path "*.git*" -not -name "README" -not -name "clone_and_link.sh" | while read f; do
#   [ "$f" == '.' ] ||
#   [ "$f" == '..' ] ||
#   [ "$f" == '.git' ] ||
#   ln -vsf "$f" .
# done
