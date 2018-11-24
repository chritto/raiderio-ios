//
//  RIOCharacterService.h
//  RaiderIO
//
//  Created by Chris McGrath on 11/3/18.
//  Copyright © 2018 Chris McGrath. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RIOCharacter;
@class RIOCharacterID;

NS_ASSUME_NONNULL_BEGIN

typedef void (^RIOCharacterServiceFetchCompletionBlock)(RIOCharacter * _Nullable character);

@interface RIOCharacterService : NSObject

- (void)fetchCharacterWithID:(RIOCharacterID *)characterID
                  completion:(RIOCharacterServiceFetchCompletionBlock)completion;

@end

NS_ASSUME_NONNULL_END
