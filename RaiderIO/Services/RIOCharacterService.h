//
//  RIOCharacterService.h
//  RaiderIO
//
//  Created by Chris McGrath on 11/3/18.
//  Copyright © 2018 Chris McGrath. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RIOCharacter;

NS_ASSUME_NONNULL_BEGIN

typedef void (^RIOCharacterServiceFetchCompletionBlock)(RIOCharacter * _Nullable character);

@interface RIOCharacterService : NSObject

- (void)fetchCharacterWithRegion:(NSString *)region
                           realm:(NSString *)realm
                            name:(NSString *)name
                      completion:(RIOCharacterServiceFetchCompletionBlock)completion;

@end

NS_ASSUME_NONNULL_END
