#!/bin/bash

set -euo pipefail

SCHEME="$(xcodebuild -list -json | jq -r '.project.schemes[0]')"
PRODUCT_NAME="$(xcodebuild -scheme "$SCHEME" -showBuildSettings | grep " PRODUCT_NAME " | sed "s/[ ]*PRODUCT_NAME = //")"
PROJECT="/Users/runner/work/ios-buidtest-ionic5/ios-buidtest-ionic5/platforms/ios/ios-test.xcodeproj"
WORKSPACE="/Users/runner/work/ios-buidtest-ionic5/ios-buidtest-ionic5/platforms/ios/ios-test.xcworkspace"
OUTPUT_DIRECTORY="/Users/runner/work/ios-buidtest-ionic5/ios-buidtest-ionic5/platforms/ios/outputs/"
OUTPUT_NAME="$PRODUCT_NAME.ipa"
CONFIGURATION="Debug"
EXPORT_METHOD="development"
echo "::set-env name=PRODUCT_NAME::$PRODUCT_NAME"