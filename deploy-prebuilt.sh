#!/bin/bash
#
# Script to deploy to a prebuilt repo.

GIT_BRANCH=${1#*/}
WORKSPACE=$2
GIT_COMMIT=$3
BUILD_NUMBER=$4
GITHUB_API_KEY=$5

REPO_URL="https://hockeymikey:$GITHUB_API_KEY@github.com/hockeymikey/seedvault-prebuilt"
TAG=$(git tag -l --points-at HEAD)



BRANCH=$GIT_BRANCH

git config --global user.email "hockeymikey@hockeymikey.com"
git config --global user.name "hockeymikey"
git clone --quiet $REPO_URL

cd seedvault-prebuilt
git checkout $BRANCH || git checkout -b $BRANCH
rm -Rf ./*
cp $WORKSPACE/Android.mk.prebuilt ./Android.mk
cp $WORKSPACE/app/build/outputs/apk/release/app-release-unsigned.apk ./Seedvault.apk
cp $WORKSPACE/permissions_com.stevesoltys.seedvault.xml .
cp $WORKSPACE/whitelist_com.stevesoltys.seedvault.xml .

git add .
git commit -m "Jenkins build $BUILD_NUMBER" -m "https://github.com/hockeymikey/seedvault/commit/$GIT_COMMIT "
git push origin $BRANCH

if [ ! -z ${TAG} ]; then
	git tag ${TAG}
	git push origin --tags
fi