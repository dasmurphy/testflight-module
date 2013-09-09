![TestFlight](https://raw.github.com/dasmurphy/testflight-module/master/documentation/TestFlight.png)

### Appcelerator Titanium TestFlight Module for iOS 

This is a TestFlight module for iOS actively developed by Torsten Stelling and formally
developed by Rick Blalock and Matt Apperson. Also needing to be thanked is the core
TestFlight development team who assisted in the making of this module. Without their help
this wouldn't have been possible.

[TestFlight](http://www.testflightapp.com/) makes it easy to upload and distribute iOS builds over-the-air to your 
teams of testers and developers.

The original repository url is [https://github.com/dasmurphy/testflight-module](https://github.com/dasmurphy/testflight-module).

- - -

* <a href="#features">Features</a>
* <a href="#download">Downloads</a>
* <a href="#supported">Supported/Tested Platforms</a>
* <a href="#usage">Basic Usage</a>
* <a href="#faq">FAQ</a>
* <a href="#update">How To Update from DamageStudios module</a>
* <a href="#help">How to Help</a>
* <a href="#license">License</a>
* <a href="#changelog">Changelog</a>
* <a href="#history">History of the module</a>
* <a href="#copyright">Copyright</a>

- - -

### <a name="features">Features</a>

* Sessions - Discover how testers are using your application. Watch as they progress and take unexpected turns.
* In-App Questions - The most effective way to get tester feedback. Get the answers you need by asking questions the moment a checkpoint is passed.
* Remote Logging - NSLog(@"All your logs are belong to us"); //No extra work: NSLogs are instantly attached to your session and crash reports.
* Crash Reports - Reported in realtime, with environment snapshots and full session activity.
* Checkpoints - Place checkpoints throughout your app to see how far testers are getting, confirm which areas are popular and reveal ones that need more testing.
* In-App Updates - Prompt testers to install the latest version of your app. This is the easiest way for your testers to take advantage of installing on the fly.

- - -

### <a name="download">Downloads</a>

All binary releases are included also in this module. See the [releases](https://github.com/dasmurphy/testflight-module/tree/master/releases) folder.

* [ti.testflight-iphone-1.0.zip](https://github.com/dasmurphy/testflight-module/blob/master/releases/ti.testflight-iphone-1.0.zip?raw=true)
* [ti.testflight-iphone-1.1.zip](https://github.com/dasmurphy/testflight-module/blob/master/releases/ti.testflight-iphone-1.1.zip?raw=true)
* [ti.testflight-iphone-1.2.zip](https://github.com/dasmurphy/testflight-module/blob/master/releases/ti.testflight-iphone-1.2.zip?raw=true)
* [ti.testflight-iphone-2.0.zip](https://github.com/dasmurphy/testflight-module/blob/master/releases/ti.testflight-iphone-2.0.zip?raw=true)

- - -

### <a name="supported">Supported/Tested Platforms</a>

This module is only tested against the **latest** Titanium Mobile SDK's. It is not, nor will it ever be tested against the
Titanium Mobile SDK's from the Continuous Integration server (aka CI Builds).

|TestFlight Module Version|TestFlight SDK Version|Titanium Mobile SDK Version|
|:---------|:----------|:----------|
|1.0|1.0|1.8.0+|
|1.1|1.0|1.8.0+|
|1.2|1.2|2.1.4+|
|2.0|2.0|2.1.4+|

- - - 

### <a name="usage">Basic Usage</a>

```javascript
Titanium.UI.setBackgroundColor('#eee');

// Pull in the Module
var testflight = require('ti.testflight');
Ti.API.info("module is => " + testflight);

// Set the app token here (REQUIRED)
testflight.takeOff('YourAppTokenHere',true); // for demo code

var tabGroup = Titanium.UI.createTabGroup();

var win = Titanium.UI.createWindow({  
    title: 'TestFlight Module',
    backgroundColor:'#fff'
});
var tab1 = Titanium.UI.createTab({  
    icon: 'KS_nav_views.png',
    title: 'TestFlight',
    window: win
});

var data = [
	{ title: 'Checkpoint 1', uid: 1 },
	{ title: 'Checkpoint 2', uid: 2 },
	{ title: 'Checkpoint 3', uid: 3 },
	{ title: 'Checkpoint 4', uid: 4 }
];

var table = Ti.UI.createTableView({ data: data });

table.addEventListener('click', function(_event) {
	// Set a checkpoint up here
	testflight.passCheckPoint('Checkpoint' + _event.rowData.uid);

	var newwin = Ti.UI.createWindow({ title: _event.row.title });

	var label = Ti.UI.createLabel({ text: 'Checkpoint ' + _event.rowData.uid, textAlign: 'center' });
	var btn = Ti.UI.createButton({ title: 'Feedback' });

	btn.addEventListener('click', function() {
		// Submit some feedback
		testflight.submitFeedback('Text from your own custom form');
	});

	newwin.add(label);
	newwin.rightNavButton = btn;
	tab1.open(newwin, { animated: true });
});

win.add(table);

tabGroup.addTab(tab1);  
tabGroup.open();
```

- - - 

### <a name="faq">FAQ</a>

**Q:** I see a warning dialog, that my App Token was not detected, but the library is correct implemented. Is this normal?

**A:** Yes, when you see this dialog, please click on **Ignore and Continue**.

![ErrorMessage](https://raw.github.com/dasmurphy/testflight-module/master/documentation/ErrorMessage.png)

- - - 

### <a name="update">How to Update from DamageStudios module</a>

Replace the functions with new function names.

|old function|new function|
|:---------|:----------|
|token|takeOff|
|checkpoint|passCheckPoint|
|feedback|openFeedbackView|
|customInfo|addCustomEnvironmentInformation|
|remoteLog|log|

`log` uses 2 parameters and you need to put `"INFO",` in front of the first parameter to
replicate the old behaviour.

- - - 

### <a name="help">How to Help</a>
1. Go to github and click the “fork” button.
1. git clone git@github.com:dasmurphy/testflight-module.git
1. cd testflight-module
1. Make your changes/edits
1. git status
1. git commit -a
1. git push
1. go back to github and click the “pull request” button.

- - - 

### <a name="license">License</a>

See [LICENSE](https://github.com/dasmurphy/testflight-module/blob/master/LICENSE) file.

- - -

### <a name="changelog">Changelog</a>

v1.0 - 2012/4/30
* uses TestFlight 1.0
* renamed most functions to the function names of the TestFlight SDK
* added sdkVersion
* added setDeviceIdentifier as independent call
* fixed some small things like parameters
* updated documentation

v1.1 - 2012/5/22
* removed setDeviceIdentifier
* removed remoteLog
* added second parameter to takeOff for udid function
* added log function with category and value parameter

v1.2 - 2013/2/11
* updated Testflight SDK to v1.2
* fixed small compiling error in sdkVersion

v2.0 - 2013/8/30
* updated Testflight SDK to v2.0
* remove SubmitFeedbackView, since it is not existent any more
* added first faq item

- - -

### <a name="history">History of the module</a>

The [original module](https://github.com/fusion94/testflight-module) was created in 2011
by Damage Studios. I started to update it with my own code and changed the function calls
to names i was used to from the co.saiten.ti.testflight module. At last i changed the
GUID to my own.

Since i changed really much in here, i wanted to share my works with you here. I try to
update this module as often as TestFlight updates it's SDK.

- - -

### <a name="copyright">Copyright</a>

Copyright (c) 2011 by Damage Studios LLC. All Rights Reserved.

Copyright (c) 2012-2013 by Torsten Stelling. All Rights Reserved.

Appcelerator is a registered trademark of Appcelerator, Inc. Appcelerator Titanium is a trademark of Appcelerator, Inc.

TestFlight is a registered trademark of TestFlight
