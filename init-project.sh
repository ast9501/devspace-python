#
#    This script will squash all commits into one commit, 
#    with latest commit sha and template source repository url.
#

#!/bin/bash

TEMPLATE_REPOSITORY_URL=$(git remote get-url origin)
COMMIT_SHA=$(git rev-parse HEAD)
COMMIT_MESSAGE_TEMP_FILE=./release-commitmsg.txt


if test -f "$COMMIT_MESSAGE_TEMP_FILE"; then
    echo "[WARNING] Detect commit message temp file ($COMMIT_MESSAGE_TEMP_FILE), automatically remove it"
    rm $COMMIT_MESSAGE_TEMP_FILE
fi

echo "devspace template in used: ${TEMPLATE_REPOSITORY_URL}" >> ${COMMIT_MESSAGE_TEMP_FILE}
echo "commit-sha: ${COMMIT_SHA}" >> ${COMMIT_MESSAGE_TEMP_FILE}

read -p "[WARNING] Squash and record template info into commit message (RESET commit history), continue? (yes/no)" yn
case $yn in 
	yes ) echo squashed commits...;;
	no ) echo exiting...;
		exit;;
	* ) echo invalid response;
		exit 1;;
esac 
git reset $(git commit-tree HEAD^{tree} -F release-commitmsg.txt)