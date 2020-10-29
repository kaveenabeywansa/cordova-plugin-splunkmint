//
//  CTSplunkMint.h
//
//  Created by Gary Meehan on 30/06/2016.
//
//

#import <Foundation/Foundation.h>
#import <Cordova/CDV.h>

@interface CTSplunkMintPlugin : CDVPlugin

- (void)crash:(CDVInvokedUrlCommand *)command;

- (void)logEvent:(CDVInvokedUrlCommand *)command;

- (void)logView:(CDVInvokedUrlCommand *)command;

- (void)transactionStart:(CDVInvokedUrlCommand *)command;

- (void)transactionStop:(CDVInvokedUrlCommand *)command;

- (void)transactionCancel:(CDVInvokedUrlCommand *)command;

- (void)flush:(CDVInvokedUrlCommand *)command;

- (void)enableDebugLog:(CDVInvokedUrlCommand *)command;

- (void)setFlushOnlyOverWiFi:(CDVInvokedUrlCommand *)command;

- (void)setUserOptOut:(CDVInvokedUrlCommand *)command;

- (void)log:(CDVInvokedUrlCommand *)command;

@end