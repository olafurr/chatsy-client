//
//  ViewController.m
//  Chatsy
//
//  Created by Ólafur Garðarsson on 06/09/16.
//  Copyright © 2016 Ólafur Garðarsson. All rights reserved.
//

#import "ViewController.h"
#import <SocketRocket/SocketRocket.h>

@interface ViewController () <SRWebSocketDelegate>

@property (nonatomic, retain) SRWebSocket *webSocket;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _webSocket = [[SRWebSocket alloc] initWithURL:[NSURL URLWithString:@"ws://192.168.1.10:3030"]];
    self.webSocket.delegate = self;
    
    [self.webSocket open];
}

#pragma mark - SRWebSocketDelegate

- (void)webSocketDidOpen:(SRWebSocket *)webSocket {
    NSLog(@"WebSocket did open");
}

- (void)webSocket:(SRWebSocket *)webSocket didReceiveMessage:(id)message {
    NSLog(@"Web socket did recieve message: %@", message);
}

- (void)webSocket:(SRWebSocket *)webSocket didFailWithError:(NSError *)error {
    NSLog(@"Did fail with error: %@", error);
}

@end
