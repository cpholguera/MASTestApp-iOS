#!/bin/bash

xcodebuild -project MASTestApp.xcodeproj -scheme MASTestApp -destination 'generic/platform=iOS' -archivePath ./MASTestApp.xcarchive archive
xcodebuild -exportArchive -archivePath ./MASTestApp.xcarchive -exportPath ./ -exportOptionsPlist ExportOptions.plist
mkdir -p output

cp MASTestApp.xcarchive/Products/Applications/MASTestApp.app/Info.plist ./output
plutil -convert xml1 ./output/Info.plist
cp MASTestApp.xcarchive/Products/Applications/MASTestApp.app/MASTestApp ./output

mv MASTestApp.ipa ./output

rm -fr MASTestApp.xcarchive
rm DistributionSummary.plist Packaging.log