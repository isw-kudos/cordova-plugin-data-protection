#import "CDVDataProtection.h"
#import <Cordova/CDVPlugin.h>

@implementation CDVDataProtection

- (void)isEnabled:(CDVInvokedUrlCommand*)command
{
  //If Apple's security whitepaper is to be believed then it is satisfactory to simply check for a passcode
  //to confirm Data Protection is enabled on the device. Page 12 https://www.apple.com/business/docs/iOS_Security_Guide.pdf
  //Your app must however enable use of Data Protection:
  //See "Data Protection" https://developer.apple.com/library/content/documentation/IDEs/Conceptual/AppDistributionGuide/AddingCapabilities/AddingCapabilities.html
  //and "Protecting Data Using On-Disk Encryption" https://developer.apple.com/library/content/documentation/iPhone/Conceptual/iPhoneOSProgrammingGuide/StrategiesforImplementingYourApp/StrategiesforImplementingYourApp.html#//apple_ref/doc/uid/TP40007072-CH5-SW21


  CDVPluginResult* pluginResult = nil;

  //https://github.com/liamnichols/UIDevice-PasscodeStatus/issues/3#issuecomment-190294010
  LAContext *context = [LAContext new];
  NSError *error;
  BOOL passcodeEnabled = [context canEvaluatePolicy:LAPolicyDeviceOwnerAuthentication error:&error];

  if (error != nil) {
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]]];
  } else if (passcodeEnabled != nil) {
    //send passcode status
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:passcodeEnabled];
  }

  [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
