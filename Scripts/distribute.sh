#!/bin/bash

if [ ! -d Syndication.xcodeproj ]; then
	echo "This script must be run in the root of the Syndication project that contains"
	echo "'Syndication.xcodeproj'"
	exit 1
fi

if [ ! -f CHANGELOG ]; then
	echo "CHANGELOG not found.  This script must be run in the root of the Syndication"
	echo "project that contains 'Syndication.xcodeproj'"
	exit 1
fi
ZIP=`which zip`

if [ ! -x $ZIP ]; then
	echo "zip binary not found.  Please install the zip package."
	exit 1
fi

VERSION=`grep Current: CHANGELOG | awk '{ print $2 }'`
OUTFILE=SyndicationSDK-$VERSION.zip

echo "This will build version $VERSION of the Syndication SDK .zip file that will"
echo "contain the Syndication.framework bundle as well as the end-user class"
echo "documentation."
echo ""
echo "It will destroy all the contents of the 'build' subdirectory in the"
echo "process."
echo ""
echo "Be sure to update the CHANGELOG file to reflect the version before running this"
echo "script."
echo ""
echo "Hit [ENTER] to continue or ^C to exit."
echo ""
read

echo "Building 'Framework' target (log in build/framework.log)..."
mkdir -p build
xcrun xcodebuild -target Framework > build/framework.log

echo "Building 'Documentation' target (log in build/documentation.log)..."
xcrun xcodebuild -target Documentation > build/documentation.log

echo "Packaging up $OUTFILE (log in build/packaging.log)..."

rm -f $OUTFILE
rm -rf build/tmp
mkdir -p build/tmp
cd build/tmp
cp -a ../Release-iphoneos/Syndication.framework .
cp -a ../../Documentation .
cp -a ../../README.md .
cp -a ../../CHANGELOG .
cp -a ../../Example .
rm -rf Example/SyndicationExampleApp.xcodeproj/project.xcworkspace/xcuserdata
rm -rf Example/SyndicationExampleApp.xcodeproj/xcuserdata
$ZIP ../../$OUTFILE -r . > ../../build/packaging.log
cd ../..

echo ""
echo "... done!  $OUTFILE has been built.  It can now be uploaded to the"
echo "bitbucket project Downloads area.  In order to tag this release in git,"
echo "issue the following commands:"
echo ""
echo "git tag -a $VERSION"
echo "git push remote $VERSION"
echo ""

# Clean up some junk.
rm -rf Headers build
