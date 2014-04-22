# Syndication SDK

The Syndication SDK can be used to request content from the REST-based Syndication API for your app.  The SDK creates a layer between the underlying REST API and Objective C.

The SDK contains a example iOS app (See "Example App" below) that can be used to demonstrate how to create and handle Syndication SDK requests.

---
[TOC]

---
## Checking Out Source

To checkout this tree and all vendor branches:

`git clone --recursive https://bitbucket.org/ctacdevteam/syndicationsdk_objectivec.git`

---
## Installation

* Drag **Syndication.framework** into your project under the **Frameworks** folder.

    Select **Copy items into destination group's folder** if you would like the **Syndication.framework** to be copied into your project rather than simply referenced.  

* Under your app's target **Build Phases** tab, add the following libraries to **Link Binary With Libraries**

    SystemConfiguration  
    Security  
    CoreData  
    CFNetwork  
    MobileCoreServices 

* Under your app's target **Build Settings** tab, add the following two linker flags to **Other Linker Flags**:

    -ObjC  
    -all_load

* Simply `#import <Syndication/SyndicationSDK.h>` and you are off and running.  You can now create your base [Syndication](http://ctacdevteam.bitbucket.org/syndicationsdk_objectivec/Classes/Syndication.html) object which is used to handle all the requests to the Syndication API.

---
## Documentation

Documentation is `appledoc` style and can be found [here](http://ctacdevteam.bitbucket.org/syndicationsdk_objectivec/index.html).

See the [Syndication](http://ctacdevteam.bitbucket.org/syndicationsdk_objectivec/Classes/Syndication.html) class documentation for information on the various request methods available.

---
## Example App

An Example app which shows a basic application using the Syndication SDK can be found in the `Example/SyndicationExampleApp.xcodeproj` project.

This app has 3 tabs which contain:

1. A simple UIWebView that is populated with a distinct HTML Media block of content.

2. A simple UITableView that pulls all Media block related to the keyword "smoking".

3. A simple search that searches the Media content of the Syndication API for a user-input search query.

---
## Running Unit Tests

The `Syndication.xcodeproj` project contains several Unit Tests which can be run to test the functionality of the Syndication SDK.

To run the Unit Tests, load the Syndication project into XCode and execute `Product->Test`.

---
## Building The Syndication.framework bundle

To build the `Syndication.framework` bundle (which includes i386, armv7, armv7s architectures for Universal apps and the iOS Simulator), load the project into XCode and select one of the iOS Simulator targets underneath the `Framework` aggregate target to build.

After you have selected this target, run `Product->Build`.  This will output the `Syndication.framework` in your local DerivedData directory.  To find where this file is, in the Project Navigator, expand the `Products` group, right click on `libSyndication.` and choose **Show in Finder**.  The `Syndication.framework` bundle will be there.

---
## Releasing a New Version of the Syndication SDK

There is a helper script in the `Scripts` subdirectory of this project.  

First, modify the `CHANGELOG` file in the root of the project to reflect the current version number you wish to release as well as the updated history of changes of this release.

In a shell window, change into the root of the Syndication SDK project and run `Scripts/distribute.sh`.

This will grab the latest version number from the `./CHANGELOG` file and build the `Syndication.framework` along with the Documentation and package it into a file named `SyndicationSDK-<version>.zip` which you can then post to the bitbucket releases page.
