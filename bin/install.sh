#!/bin/bash
export BUILD_HARNESS_ORG=${1:-sape-devops-platform}
export BUILD_HARNESS_PROJECT=${2:-build-harness}
export BUILD_HARNESS_BRANCH=${3:-develop}
export GIT_USER=${4:-gitlab+deploy-token-18}
export GIT_TOKEN=${5:-xnn-rhz_zAjwwYMVhzoJ}
export GIT_REPO="https://$GIT_USER:$GIT_TOKEN@pscode.lioncloud.net/$BUILD_HARNESS_ORG/$BUILD_HARNESS_PROJECT.git"

if [ "$BUILD_HARNESS_PROJECT" ] && [ -d "$BUILD_HARNESS_PROJECT" ]; then
  echo "Removing existing $BUILD_HARNESS_PROJECT"
  rm -rf "$BUILD_HARNESS_PROJECT"
fi

echo "Cloning ${GIT_REPO}#${BUILD_HARNESS_BRANCH}..."
git clone -c advice.detachedHead=false --depth=1 -b $BUILD_HARNESS_BRANCH $GIT_REPO
