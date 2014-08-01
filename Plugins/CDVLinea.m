//
//  CDVLinea.m
//  Northware
//
//  Created by Roger Pereira on 10/2/13.
//
//

#import "CDVLinea.h"
@interface CDVLinea()
@property (nonatomic,strong) Linea *linea;
@property (nonatomic,strong) CDVInvokedUrlCommand *command;
@property (nonatomic) int connectionState;
@end

@implementation CDVLinea

-(CDVPlugin*)initWithWebView:(UIWebView *)theWebView
{
    self = [super initWithWebView:theWebView];
    if(self)
    {
        self.linea = [Linea sharedDevice];
        [self.linea addDelegate:self];
        [self.linea connect];
    }
    return self;
}
-(void)registerCallback:(CDVInvokedUrlCommand *)command
{
   self.command = command;
    
    
}
-(void)getConnectionState:(CDVInvokedUrlCommand *)command
{
    NSString* connectionState = nil;
    switch (self.connectionState) {
		case CONN_DISCONNECTED:
		case CONN_CONNECTING:
            connectionState = @NOTCONNECTED;
            break;
        case CONN_CONNECTED:
            connectionState = @CONNECTED;
            break;
    }
    CDVPluginResult *result;
    result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK
                               messageAsString:connectionState];
    
    [self.commandDelegate sendPluginResult:result
                                callbackId:command.callbackId];

}
-(void)getBatteryCapacity:(CDVInvokedUrlCommand *)command
{
    NSError *error;
    int percent;
    float voltage;
    CDVPluginResult *result;
    if([self.linea getBatteryCapacity:&percent voltage:&voltage error:&error])
    {
        result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK
                               messageAsDictionary:[[NSDictionary alloc] initWithObjectsAndKeys:
                                                   [NSNumber numberWithInt:percent], @"Capacity",
                                                    [NSNumber numberWithFloat: voltage], @"Voltage", nil]];
        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
    }
    
}
-(void)unregisterCallback
{
    self.command = nil;
}
-(void)connectionState:(int)state
{
    self.connectionState = state;
}
-(void)barcodeData:(NSString *)barcode type:(int)type
{
    if(self.command)
    {
        CDVPluginResult *result =  [CDVPluginResult resultWithStatus:CDVCommandStatus_OK
                                                 messageAsString:barcode];
        [result setKeepCallbackAsBool:true];
        [self.commandDelegate sendPluginResult:result
                                callbackId: self.command.callbackId];
    }
}

@end
