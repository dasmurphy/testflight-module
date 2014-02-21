// This is a test harness for your module
// You should do something interesting in this harness
// to test out the module and to provide instructions
// to users on how to use it by example.

// open a single window
var window = Ti.UI.createWindow({
	backgroundColor:'white'
});
var label = Ti.UI.createLabel();
window.add(label);
window.open();

// TODO: write your module tests here
var testflight = require('ti.testflight');
Ti.API.info("module is => " + testflight);

testflight.takeOff("[TEAM TOKEN]");

Ti.API.debug("Start Logging");

Ti.API.info("passCheckPoint");
testflight.passCheckPoint("checkpoint1");

Ti.API.debug("addCustomEnvironmentInformation");
testflight.addCustomEnvironmentInformation("key", "value");

testflight.passCheckPoint("checkpoint2");

Ti.API.debug("submitFeedback");
testflight.submitFeedback('test feedback');

Ti.API.debug("log");
testflight.log("INFO","Log entry");

Ti.API.debug("sdkVersion: "+testflight.sdkVersion());

Ti.API.debug("End");
