#import <Cordova/CDVPlugin.h>

@interface CDVDataProtection : CDVPlugin

- (void)isEnabled:(CDVInvokedUrlCommand*)command;

@end
