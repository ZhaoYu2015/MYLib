//
//  ReachabilityManager.m
//  FineexFQXD2.0
//
//  Created by 赵宇 on 13/07/2017.
//  Copyright © 2017 FineEx. All rights reserved.
//

#import "ReachabilityManager.h"
#import "Reachability.h"

@implementation ReachabilityManager
+ (instancetype)manager {
    static ReachabilityManager *manager;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        manager = [[ReachabilityManager alloc] init];
        [manager startListenReachabilityToInternentConeection];
    });
    return manager;
}

#pragma mark —— start check reachability
// 开启网络状态的通知
- (void)startListenReachabilityToInternentConeection {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
}

#pragma mark —— receiveNotification
// 接收网络状态更改的通知
- (void)reachabilityChanged:(NSNotification *)noti {
    Reachability *reach = noti.object;
    if ([reach isKindOfClass:[Reachability class]]) {
        NetworkStatus status = [reach currentReachabilityStatus];
        if (_reachabilityBlock) {
            if (status ==0) {
                _reachabilityBlock(NO);
            }else {
                _reachabilityBlock(YES);
            }
        }
    }
}

- (void)reachabilityToInternetConnection:(void (^)(BOOL))reachabilityBlock {
    Reachability *reach = [Reachability reachabilityForInternetConnection];
    NetworkStatus status = [reach currentReachabilityStatus];
    if (status ==0) {
        reachabilityBlock(NO);
    }else {
        reachabilityBlock(YES);
    }
}

@end
