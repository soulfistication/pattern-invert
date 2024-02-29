//
//  NetworkClient.m
//  pattern-invert
//
//  Created by Iván Almada on 2/28/24.
//

#import "NetworkClient.h"

@interface NetworkClient ()

@property (nonatomic, strong) NSString *ipAddress;
@property (nonatomic, assign) uint16_t port;

@property (nonatomic, strong) GCDAsyncSocket *tcpSocket;

@end

@implementation NetworkClient

- (instancetype)init {

    NSLog(@"%@", @"init");

    self = [super init];

    if (self) {
        _ipAddress = @"127.0.0.1";
        _port = 8002;

        _tcpSocket = [[GCDAsyncSocket alloc] initWithDelegate:self
                                                delegateQueue:dispatch_get_main_queue()];

        NSError *error;

        [_tcpSocket connectToHost:_ipAddress onPort:_port error:&error];

        if (error) {
            NSLog(@"%@", [error debugDescription]);
        }
    }

    return self;
}

#pragma mark - CGDAsyncSocketDelegate

- (void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(uint16_t)port {
    NSLog(@"%@", @"Did connect to Host");
    NSDate *date = [NSDate now];
    NSString *timeStamp = [date description];
    [timeStamp stringByAppendingString:@" "];
    NSLog(@"Send initial time - %@", timeStamp);
    NSMutableData *timeStampData = [[timeStamp dataUsingEncoding:NSUTF8StringEncoding] mutableCopy];
    [timeStampData appendData:[GCDAsyncSocket CRLFData]];
    [self.tcpSocket writeData:timeStampData withTimeout:30.0 tag:0];
}

- (void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag {
    NSLog(@"%@", @"Did read Data");
    NSString *serverMessage = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"%@", serverMessage);
}

- (void)socket:(GCDAsyncSocket *)sock didWriteDataWithTag:(long)tag {
    NSLog(@"%@", @"Did write data");
}

- (void)socketDidDisconnect:(GCDAsyncSocket *)sock withError:(NSError *)err {
    NSLog(@"%@", @"Socket did disconnect");
    NSLog(@"Error: %@", [err debugDescription]);
}

- (void)send {
    //NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //formatter.timeZone = [NSTimeZone timeZoneWithName:@"America/Mexico_City"];;
    NSDate *date = [NSDate now];
    NSString *timeStamp = [date description];
    NSLog(@"Send event - %@", timeStamp);
    NSMutableData *timeStampData = [[timeStamp dataUsingEncoding:NSUTF8StringEncoding] mutableCopy];
    [timeStampData appendData:[GCDAsyncSocket CRLFData]];
    [self.tcpSocket writeData:timeStampData withTimeout:30.0 tag:0];
}

- (void)disconnect {
    [self.tcpSocket disconnect];
}

@end
