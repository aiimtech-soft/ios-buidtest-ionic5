#!/bin/bash

set -euo pipefail

SCHEME="$(xcodebuild -list -json | jq -r '.project.schemes[0]')"
PRODUCT_NAME="$(xcodebuild -scheme "$SCHEME" -showBuildSettings | grep " PRODUCT_NAME " | sed "s/[ ]*PRODUCT_NAME = //")"
PROJECT="${{ env.PROJECT_PATH }}/ios-test.xcodeproj"
WORKSPACE="${{ env.PROJECT_PATH }}/ios-test.xcworkspace"
OUTPUT_DIRECTORY="${{ env.PROJECT_PATH }}/outputs/"
OUTPUT_NAME="${{ env.PRODUCT_NAME }}.ipa"
EXPORT_METHOD="development"
echo "::set-env name=PRODUCT_NAME::$PRODUCT_NAME"