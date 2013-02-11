# TestFlight Module

## Description

Testflightapp.com SDK integration

Note: TestFlight requires that your device be registered with TestFlight. This means that the module will not work in the iOS simulator.

## Accessing the testflight Module

To access this module from JavaScript, you would do the following:

	var testflight = require("ti.testflight");

The testflight variable is a reference to the Module object.	

## Reference

### testflight.takeOff(teamToken[,true])

#### Arguments

Takes one argument, a string which is the Team token that will be used for your builds (the team token is NOT the API token)
The second argument is a boolean. If added then the DeviceIdentifier is set for
TestFlight or not. Use this only during tests and not in production environment.

### testflight.addCustomEnvironmentInformation(key, value)

#### Arguments

Takes two arguments, the first being a string for the key, the second a string for the value.
These are environment based details, so it won't track changes in the data.
For example you might use this for a username of the tester within your app.

### testflight.passCheckpoint(checkpointName)

#### Arguments

Takes one argument, a string which is the name for your checkpoint

### testflight.openFeedbackView()

Show the feedback dialog

### testflight.submitFeedback(feedbackString)

#### Arguments

Takes one argument, a string you want recorded as feedback. Use this if you want to make a custom feedback form.

### testflight.log(category,string)

#### Arguments

Adds a logging entry in the LOG.

### testflight.sdkVersion()

Returns the current TestFlight SDK Version which is used in the module

## Usage

      var testflight = require('ti.testflight');
   
      testflight.takeOff('YourTeamTokenHere');
   
      testflight.passCheckpoint('SomeCheckpoint');
   
      testflight.openFeedbackView();
   
      testflight.submitFeedback('Text from your own custom form');

## Authors

Torsten Stelling
Twitter: dasmurphy

Rick Blalock
Twitter: rblalock

Matt Apperson
Twitter: mattapperson

## License

Apache Public License 2.0