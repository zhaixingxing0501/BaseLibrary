//
//  PathMacros.h
//  StandardProject-OC
//
//  Created by nucarf on 2020/9/9.
//  Copyright © 2020 zhaixingxing. All rights reserved.
//

#ifndef PathMacros_h
#define PathMacros_h

#define kPathTemp       NSTemporaryDirectory()
#define kPathDocument   [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#define kPathCache      [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#define kPathSearch     [kPathDocument stringByAppendingPathComponent:@"Search.plist"]

#pragma mark --  EG --

#define kPathDownloaded [kPathDocument stringByAppendingPathComponent:@"Downloaded.plist"]

#endif /* PathMacros_h */
