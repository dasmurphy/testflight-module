/**
 * Your Copyright Here
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "TiTestflightModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"
#import "TestFlight.h"

@implementation TiTestflightModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"397c89fb-9d51-4c88-becd-9710a1bc7e97";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"ti.testflight";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];

    /*[TestFlight setOptions:[NSDictionary dictionaryWithObject:[NSNumber numberWithBool:NO] forKey:@"sendLogOnlyOnCrash"]];*/
	NSLog(@"[INFO] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably
	
	// you *must* call the superclass
	[super shutdown:sender];
}

#pragma mark Cleanup 

-(void)dealloc
{
	// release any resources that have been retained by the module
	[super dealloc];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

#pragma Public APIs

-(void)takeOff:(id)args
{
//    ENSURE_UI_THREAD_1_ARG(args);
    ENSURE_UI_THREAD(takeOff, args);
    ENSURE_ARG_COUNT(args, ([args count]>1?2:1));

    //NSLog(@"[INFO] %@ takeOff",self);

    NSString *value = [TiUtils stringValue:[args objectAtIndex:0]];
    BOOL testing = ([args count]>1?[TiUtils boolValue: [args objectAtIndex:1]]:FALSE);
    if (testing == TRUE) {
        [TestFlight setDeviceIdentifier: [[UIDevice currentDevice] uniqueIdentifier]];
    }

    [TestFlight takeOff:value];
}

/*-(void)setDeviceIdentifier:(id)args
{
    //ENSURE_UI_THREAD_1_ARG(args);
    ENSURE_UI_THREAD_0_ARGS;

    [TestFlight setDeviceIdentifier: [[UIDevice currentDevice] uniqueIdentifier]];
}*/

-(void)passCheckpoint:(id)args
{    
    ENSURE_UI_THREAD_1_ARG(args);

    NSString *value = [TiUtils stringValue:[args objectAtIndex:0]];
    [TestFlight passCheckpoint:value];
}

-(void)submitFeedback:(id)args
{
    ENSURE_UI_THREAD_1_ARG(args);

    NSString *value = [TiUtils stringValue:[args objectAtIndex:0]];
    [TestFlight submitFeedback:value];
}

-(void)addCustomEnvironmentInformation:(id)args
{
    ENSURE_ARG_COUNT(args, 2)

    NSString *key = [TiUtils stringValue:[args objectAtIndex:0]];
    NSString *value = [TiUtils stringValue:[args objectAtIndex:1]];
    [TestFlight addCustomEnvironmentInformation: value forKey:key];
}

-(void)log:(id)args
{
    ENSURE_UI_THREAD(log, args);
    ENSURE_ARG_COUNT(args, 2)

    //NSLog(@"[INFO] %@ log",self);

    NSString *key = [TiUtils stringValue:[args objectAtIndex:0]];
    NSString *value = [TiUtils stringValue:[args objectAtIndex:1]];
    TFLog(@"[%@] %@",key,value);

    //NSLog(@"[%@] %@",key,value);
}

-(id)sdkVersion:(id)args
{
    //ENSURE_UI_THREAD_0_ARGS;

    NSString *value = TESTFLIGHT_SDK_VERSION;
    return value;
}

/*- (id)setOptions:(id)args
{
    ENSURE_UI_THREAD(setOptions, args);
    
    ENSURE_ARG_COUNT(args, 1);
    id options = [args objectAtIndex:0];
    ENSURE_DICT(options);
    [TestFlight setOptions:options];
    return nil;
}*/

@end
