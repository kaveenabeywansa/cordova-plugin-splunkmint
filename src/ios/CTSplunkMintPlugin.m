

#import "CTSplunkMintPlugin.h"

#import <SplunkMint/SplunkMint.h>

@implementation CTSplunkMintPlugin

- (void) pluginInitialize
{
  [super pluginInitialize];

  if ([self.viewController isKindOfClass: [CDVViewController class]])
  {
    NSDictionary* settings = ((CDVViewController*) self.viewController).settings;
    NSString* apiKey = [settings objectForKey: @"splunk_ios_api_key"];
    NSString* extraDataString = [settings objectForKey: @"splunk_extra_data"];
    
    if (extraDataString.length > 0)
    {
      extraDataString = [extraDataString stringByReplacingOccurrencesOfString: @"'" withString: @"\""];
      
      NSData* data = [extraDataString dataUsingEncoding: NSUTF8StringEncoding];
      NSError* error = nil;
      id JSONObject = [NSJSONSerialization JSONObjectWithData: data options: 0 error: &error];
      
      if (JSONObject && [JSONObject isKindOfClass: [NSDictionary class]])
      {
        MintLimitedExtraData* extraData = [[MintLimitedExtraData alloc] init];
        
        for (id key in [JSONObject allKeys])
        {
          if ([key isKindOfClass: [NSString class]])
          {
            id value = [JSONObject objectForKey: key];
            
            if ([value isKindOfClass: [NSString class]])
            {
              [extraData setValue: value forKey: key];
            }
          }
        }
        
        [[Mint sharedInstance] addExtraData: extraData];
      }
    }
    
    if (apiKey.length > 0)
    {
      [Mint sharedInstance].applicationEnvironment = SPLAppEnvRelease;
      [[Mint sharedInstance] initAndStartSessionWithAPIKey: apiKey];
    }
  }
}

- (void) crash: (CDVInvokedUrlCommand*) command
{
 // Note, calling this command will deliberately crash the shell
  void* dummy = (void*) 0x12345678;
  
  NSLog(@"%d", *((int*) dummy));
}

- (void) logEvent: (CDVInvokedUrlCommand*) command
{
  @try
  {
    if (command.arguments.count > 0 && [command.arguments[0] isKindOfClass: [NSString class]])
    {
            NSError *error = nil;
            NSString *eventName = command.arguments[0];
            NSString* jsonString = command.arguments[1];
            NSDictionary *splunkErrorObject = [NSJSONSerialization JSONObjectWithData:[jsonString dataUsingEncoding:NSUTF8StringEncoding]
                                                                          options:NSJSONReadingAllowFragments error:&error];
        
            
            MintLimitedExtraData *limitedExtraData = [[MintLimitedExtraData alloc] init];
            NSEnumerator *enumerator = [splunkErrorObject keyEnumerator];
            NSString *key;

        
            while((key = [enumerator nextObject])) {
                [limitedExtraData setValue:[splunkErrorObject objectForKey:key] forKey:key];
            }
            
            [[Mint sharedInstance] logEventWithName: eventName logLevel:ErrorLogLevel extraData:limitedExtraData ];

            CDVPluginResult* result = [CDVPluginResult resultWithStatus: CDVCommandStatus_OK];
      
      [self.commandDelegate sendPluginResult: result callbackId: command.callbackId];
    }
    else
    {
      CDVPluginResult* result = [CDVPluginResult resultWithStatus: CDVCommandStatus_ERROR
                                                  messageAsString: @"missing event"];
      
      [self.commandDelegate sendPluginResult: result callbackId: command.callbackId];
    }
  }
  @catch (NSException *exception)
  {
    CDVPluginResult* result = [CDVPluginResult resultWithStatus: CDVCommandStatus_ERROR
                                                messageAsString: [exception reason]];
    
    [self.commandDelegate sendPluginResult: result callbackId: command.callbackId];
  }
}

- (void) logView: (CDVInvokedUrlCommand*) command;
{
  @try
  {
    if (command.arguments.count > 0 && [command.arguments[0] isKindOfClass: [NSString class]])
    {
      NSString* name = command.arguments[0];
      
      [[Mint sharedInstance] logViewWithCurrentViewName: name];
      
      CDVPluginResult* result = [CDVPluginResult resultWithStatus: CDVCommandStatus_OK];
      
      [self.commandDelegate sendPluginResult: result callbackId: command.callbackId];
    }
    else
    {
      CDVPluginResult* result = [CDVPluginResult resultWithStatus: CDVCommandStatus_ERROR
                                                  messageAsString: @"missing event"];
      
      [self.commandDelegate sendPluginResult: result callbackId: command.callbackId];
    }
  }
  @catch (NSException *exception)
  {
    CDVPluginResult* result = [CDVPluginResult resultWithStatus: CDVCommandStatus_ERROR
                                                messageAsString: [exception reason]];
    
    [self.commandDelegate sendPluginResult: result callbackId: command.callbackId];
  }
}

- (void) transactionStart: (CDVInvokedUrlCommand*) command
{
  @try
  {
    if (command.arguments.count > 0 && [command.arguments[0] isKindOfClass: [NSString class]])
    {
      NSString* name = command.arguments[0];
      
      [[Mint sharedInstance] transactionStart: name];
      
      CDVPluginResult* result = [CDVPluginResult resultWithStatus: CDVCommandStatus_OK];
      
      [self.commandDelegate sendPluginResult: result callbackId: command.callbackId];
    }
    else
    {
      CDVPluginResult* result = [CDVPluginResult resultWithStatus: CDVCommandStatus_ERROR
                                                  messageAsString: @"missing event"];
      
      [self.commandDelegate sendPluginResult: result callbackId: command.callbackId];
    }
  }
  @catch (NSException *exception)
  {
    CDVPluginResult* result = [CDVPluginResult resultWithStatus: CDVCommandStatus_ERROR
                                                messageAsString: [exception reason]];
    
    [self.commandDelegate sendPluginResult: result callbackId: command.callbackId];
  }
}

- (void) transactionStop: (CDVInvokedUrlCommand*) command;
{
  @try
  {
    if (command.arguments.count > 0 && [command.arguments[0] isKindOfClass: [NSString class]])
    {
      NSString* name = command.arguments[0];
      
      [[Mint sharedInstance] transactionStop: name];
      
      CDVPluginResult* result = [CDVPluginResult resultWithStatus: CDVCommandStatus_OK];
      
      [self.commandDelegate sendPluginResult: result callbackId: command.callbackId];
    }
    else
    {
      CDVPluginResult* result = [CDVPluginResult resultWithStatus: CDVCommandStatus_ERROR
                                                  messageAsString: @"missing event"];
      
      [self.commandDelegate sendPluginResult: result callbackId: command.callbackId];
    }
  }
  @catch (NSException *exception)
  {
    CDVPluginResult* result = [CDVPluginResult resultWithStatus: CDVCommandStatus_ERROR
                                                messageAsString: [exception reason]];
    
    [self.commandDelegate sendPluginResult: result callbackId: command.callbackId];
  }
}

- (void) transactionCancel: (CDVInvokedUrlCommand*) command
{
  @try
  {
    if (command.arguments.count > 1 && [command.arguments[0] isKindOfClass: [NSString class]] && [command.arguments[1] isKindOfClass: [NSString class]])
    {
      NSString* name = command.arguments[0];
      NSString* reason = command.arguments[0];
      
      [[Mint sharedInstance] transactionCancel: name reason: reason];
      
      CDVPluginResult* result = [CDVPluginResult resultWithStatus: CDVCommandStatus_OK];
      
      [self.commandDelegate sendPluginResult: result callbackId: command.callbackId];
    }
    else
    {
      CDVPluginResult* result = [CDVPluginResult resultWithStatus: CDVCommandStatus_ERROR
                                                  messageAsString: @"missing event"];
      
      [self.commandDelegate sendPluginResult: result callbackId: command.callbackId];
    }
  }
  @catch (NSException *exception)
  {
    CDVPluginResult* result = [CDVPluginResult resultWithStatus: CDVCommandStatus_ERROR
                                                messageAsString: [exception reason]];
    
    [self.commandDelegate sendPluginResult: result callbackId: command.callbackId];
  }
}

- (void) flush: (CDVInvokedUrlCommand*) command
{
  @try
  {
    [[Mint sharedInstance] flush];
    
    CDVPluginResult* result = [CDVPluginResult resultWithStatus: CDVCommandStatus_OK];
    
    [self.commandDelegate sendPluginResult: result callbackId: command.callbackId];
  }
  @catch (NSException *exception)
  {
    CDVPluginResult* result = [CDVPluginResult resultWithStatus: CDVCommandStatus_ERROR
                                                messageAsString: [exception reason]];
    
    [self.commandDelegate sendPluginResult: result callbackId: command.callbackId];
  }
}

- (void) enableDebugLog: (CDVInvokedUrlCommand*) command
{
  @try
  {
    [[Mint sharedInstance] enableDebugLog: YES];
    
    CDVPluginResult* result = [CDVPluginResult resultWithStatus: CDVCommandStatus_OK];
    
    [self.commandDelegate sendPluginResult: result callbackId: command.callbackId];
  }
  @catch (NSException *exception)
  {
    CDVPluginResult* result = [CDVPluginResult resultWithStatus: CDVCommandStatus_ERROR
                                                messageAsString: [exception reason]];
    
    [self.commandDelegate sendPluginResult: result callbackId: command.callbackId];
  }
}

- (void) setFlushOnlyOverWiFi: (CDVInvokedUrlCommand*) command
{
  @try
  {
    [[Mint sharedInstance] enableFlushOnlyOverWiFi: YES];
    
    CDVPluginResult* result = [CDVPluginResult resultWithStatus: CDVCommandStatus_OK];
    
    [self.commandDelegate sendPluginResult: result callbackId: command.callbackId];
  }
  @catch (NSException *exception)
  {
    CDVPluginResult* result = [CDVPluginResult resultWithStatus: CDVCommandStatus_ERROR
                                                messageAsString: [exception reason]];
    
    [self.commandDelegate sendPluginResult: result callbackId: command.callbackId];
  }
}

- (void) setUserOptOut: (CDVInvokedUrlCommand*) command
{
  @try
  {
    [[Mint sharedInstance] enableUserOptOut: YES];
    
    CDVPluginResult* result = [CDVPluginResult resultWithStatus: CDVCommandStatus_OK];
    
    [self.commandDelegate sendPluginResult: result callbackId: command.callbackId];
  }
  @catch (NSException *exception)
  {
    CDVPluginResult* result = [CDVPluginResult resultWithStatus: CDVCommandStatus_ERROR
                                                messageAsString: [exception reason]];
    
    [self.commandDelegate sendPluginResult: result callbackId: command.callbackId];
  }
}

- (void) log: (CDVInvokedUrlCommand*) command
{
  @try
  {
    if (command.arguments.count > 0 && [command.arguments[0] isKindOfClass: [NSDictionary class]])
    {
      NSDictionary* options = command.arguments[0];
      NSString* message = options[@"msg"];
      NSString* priority = options[@"priority"];
      MintLogLevel logLevel = DebugLogLevel;
      
      // Note, "d" and "v" are both treated as DebugLogLevel
      if ([priority isEqualToString: @"e"])
      {
        logLevel = ErrorLogLevel;
      }
      else if ([priority isEqualToString: @"i"])
      {
        logLevel = InfoLogLevel;
      }
      else if ([priority isEqualToString: @"w"])
      {
        logLevel = WarningLogLevel;
      }
    
      MintLog(logLevel, @"%@", message);
    
      CDVPluginResult* result = [CDVPluginResult resultWithStatus: CDVCommandStatus_OK];
      
      [self.commandDelegate sendPluginResult: result callbackId: command.callbackId];
    }
    else
    {
      CDVPluginResult* result = [CDVPluginResult resultWithStatus: CDVCommandStatus_ERROR
                                                  messageAsString: @"missing event"];
      
      [self.commandDelegate sendPluginResult: result callbackId: command.callbackId];
    }
  }
  @catch (NSException *exception)
  {
    CDVPluginResult* result = [CDVPluginResult resultWithStatus: CDVCommandStatus_ERROR
                                                messageAsString: [exception reason]];
    
    [self.commandDelegate sendPluginResult: result callbackId: command.callbackId];
  }
}


@end
