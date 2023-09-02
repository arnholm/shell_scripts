#!/bin/bash
#
#  Migrate an existing github repository to gitlab
#  ===============================================
#   from: https://github.com/<username>/<repository>   (must exist)
#   to  : https://gitlab.com/<username>/<repository>   (must exist, completely empty)
#
#   via : ./<repository>.git                           (must exist, local mirror)
#         ( $git clone --mirror https://github.com/<username>/<repository> )
#
#  Assumptions:
#     - current dir is one level up from the local mirror
#     - the user has set up credentials to write to gitlab, e.g. using 
#       gitlab personal access token: https://docs.gitlab.com/ee/user/profile/personal_access_tokens.html
#  
#  Author:
#     Carsten Arnholm, September 2023
#
username=$1
repository=$2
if [ "$username" == "" ]; then
    echo "Error: username not supplied"
    echo "Usage: ./github2gitlab.sh <username> <repository>"
    exit 1
fi
if [ "$repository" == "" ]; then
    echo "Error: repository name not supplied"
    echo "Usage: ./github2gitlab.sh <username> <repository>"
    exit 1
fi
local_mirror=./"$repository".git
if [ ! -d "$local_mirror" ]; then
	echo "Error: local $local_mirror directory does not exist."
    exit 1
fi

# Function to check if git remote URL is reachable
# Returns errlvl 0 if $1 is a reachable git remote url 
# https://superuser.com/questions/227509/git-ping-check-if-remote-repository-exists
git-remote-url-reachable() {
    git ls-remote "$1" CHECK_GIT_REMOTE_URL_REACHABILITY >/dev/null 2>&1
}
# Usage:
#   if git-remote-url-reachable "$url"; then
#      code
#   fi
#
# Construct the remote URLs and check that they are reachable
github_remote="https://github.com/${username}/${repository}"
gitlab_remote="https://gitlab.com/${username}/${repository}"
if git-remote-url-reachable "$github_remote"; then
   echo "OK github repo    reachable: $github_remote"
else 
   echo "ERROR: github repo not reachable: $github_remote"
   exit 1:
fi
if git-remote-url-reachable "$github_remote"; then
   echo "OK gitlab project reachable: $gitlab_remote"
else
   echo "ERROR: gitlab repo not reachable: $gitlab_remote"
   exit 1:
fi
#
# go to directory of local mirror 
pushd $local_mirror
#
# update local mirror: fetch from github
git fetch
#
# modify the git remote URLs
git remote add     github $github_remote
git remote set-url origin $gitlab_remote
#
# Now we can push to the new origin, this pushes all tags and branches
git push --set-upstream origin
#
# Show the new remotes and return to parent dir
echo "updated git remotes:"
git remote -v
popd
echo "repository $repository migrated!"
