//
//  ReachabilityManager.h
//  FineexFQXD2.0
//
//  Created by 赵宇 on 13/07/2017.
//  Copyright © 2017 FineEx. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ReachabilityBlock)(BOOL isReachability);

@interface ReachabilityManager : NSObject

/** block **/
@property (copy, nonatomic) ReachabilityBlock reachabilityBlock;

/**
 factory method
 */
+ (instancetype)manager;

/**
 check network
 */
- (void)reachabilityToInternetConnection:(ReachabilityBlock)reachabilityBlock;


@end
