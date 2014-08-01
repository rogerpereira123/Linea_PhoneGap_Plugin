//
//  CDVLinea.h
//  Northware
//
//  Created by Roger Pereira on 10/2/13.
//
//

#import <Cordova/CDV.h>
#import "LineaSDK.h"

@interface CDVLinea : CDVPlugin <LineaDelegate>
-(void)registerCallback:(CDVInvokedUrlCommand *)command;
-(void)unregisterCallback;
-(void)getConnectionState:(CDVInvokedUrlCommand*)command;
-(void)getBatteryCapacity:(CDVInvokedUrlCommand*)command;
@end
#define CONNECTED "Connected"
#define NOTCONNECTED "NotConnected"