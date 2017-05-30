#import "CDVDataProtection.h"
#import <Cordova/CDVPlugin.h>
#import <LocalAuthentication/LAContext.h>

@implementation CDVDataProtection

- (void)isEnabled:(CDVInvokedUrlCommand*)command
{
  //If Apple's security whitepaper is to be believed then it is satisfactory to simply check for a passcode
  //to confirm Data Protection is enabled on the device. Page 12 https://www.apple.com/business/docs/iOS_Security_Guide.pdf
  //Your app must however enable use of Data Protection:
  //See "Data Protection" https://developer.apple.com/library/content/documentation/IDEs/Conceptual/AppDistributionGuide/AddingCapabilities/AddingCapabilities.html
  //and "Protecting Data Using On-Disk Encryption" https://developer.apple.com/library/content/documentation/iPhone/Conceptual/iPhoneOSProgrammingGuide/StrategiesforImplementingYourApp/StrategiesforImplementingYourApp.html#//apple_ref/doc/uid/TP40007072-CH5-SW21

  NSLog(@"CDVDataProtection isEnabled start");
  CDVPluginResult* pluginResult = nil;

  LAContext *context = [LAContext new];
  NSError *error;
  BOOL passcodeEnabled = [context canEvaluatePolicy:LAPolicyDeviceOwnerAuthentication error:&error];
  NSLog(@"CDVDataProtection isEnabled passcodeEnabled: %s", passcodeEnabled ? "YES" : "NO");
  if ((passcodeEnabled && error == nil) || [error code] == kLAErrorPasscodeNotSet) {
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:passcodeEnabled];
  } else {
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
  }

  [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
