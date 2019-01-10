#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "Reachability.h"
#import "ReachabilityManager.h"

FOUNDATION_EXPORT double MYLibVersionNumber;
FOUNDATION_EXPORT const unsigned char MYLibVersionString[];

