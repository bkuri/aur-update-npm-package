#!/bin/bash

if [ ! -f PKGBUILD ]; then
  echo "Error: PKGBUILD file not found."
  exit 1
fi

source PKGBUILD

# Build and package the software
makepkg -si || { echo "Error: Failed to build and install the package."; exit 1; }

# Create a release
curl -X POST \
  -H "Authorization: token ${GITHUB_TOKEN}" \
  -H "Accept: application/vnd.github.v3+json" \
  https://api.github.com/repos/${GITHUB_REPOSITORY_OWNER}/${pkgname}/releases \
  -d '{"tag_name": "'"${pkgver}"'","name": "'"${pkgver}"'"}'
