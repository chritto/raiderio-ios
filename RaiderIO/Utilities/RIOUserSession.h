//
//  RIOUserSession.h
//  RaiderIO
//
//  Created by Chris McGrath on 11/21/18.
//  Copyright © 2018 Chris McGrath. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RIOCharacterService;
@class RIOImageDownloader;

NS_ASSUME_NONNULL_BEGIN

@interface RIOUserSession : NSObject

- (RIOCharacterService *)characterService;

- (RIOImageDownloader *)imageDownloader;

@end

NS_ASSUME_NONNULL_END
