# Syndication SDK

The Syndication SDK can be used to request content from the REST-based Syndication API for your app.  The SDK creates a layer between the underlying REST API and Objective C.

The SDK contains a example iOS app (See "Example App" below) that can be used to demonstrate how to create and handle Syndication SDK requests.

## Installation

1. Drag **Syndication.framework** into your project under the **Frameworks** folder.

   Select **Copy items into destination group's folder** if you would like the **Syndication.framework** to be copied into your project rather than simply referenced.

2. Under your app's target **Build Phases** tab, add the following libraries to **Link Binary With Libraries**

   SystemConfiguration  
   Security  
   CoreData  
   CFNetwork  
   MobileCoreServices  

3. Under your app's target **Build Settings** tab, add the following two linker flags to **Other Linker Flags**:

   -ObjC  
   -all_load

4. Simple `#import <Syndication/SyndicationSDK.h>` and you are off and running.  You can now create your base object which is used to handle all the requests to the Syndication API.

## Documentation

Documentation is `appledoc` style and can be found at:

**XXX** link to hosted documentation somewhere.

## Example App

An Example app which shows a basic application using the Syndication SDK can be found in the `Example/SyndicationExampleApp.xcodeproj` project.

This app contains 3 tabs which contain:

1. A simple UIWebView that is populated with a distinct HTML Media block of content.

2. A simple UITableView that pulls all Media block related to the keyword "smoking".

3. A simple search that searches the Media content of the Syndication API for a user-input search query.

## Checking Out Source

To checkout this tree and all vendor branches:

`git clone --recursive https://bitbucket.org/ctacdevteam/syndicationsdk_objectivec.git`
