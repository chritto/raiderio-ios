/**
 * This file is generated using the remodel generation script.
 * The name of the input file is RIOCharacterPreviewViewModel.value
 */

#import <Foundation/Foundation.h>
#import "RIOCharacterID.h"

@interface RIOCharacterPreviewViewModel : NSObject <NSCopying>

@property (nonatomic, readonly, copy) RIOCharacterID *characterID;
@property (nonatomic, readonly) BOOL loading;
@property (nonatomic, readonly, copy, nullable) NSString *guild;
@property (nonatomic, readonly, copy, nullable) NSURL *thumbnailURL;
@property (nonatomic, readonly, copy, nullable) NSString *score;

- (instancetype)initWithCharacterID:(RIOCharacterID *)characterID loading:(BOOL)loading guild:(nullable NSString *)guild thumbnailURL:(nullable NSURL *)thumbnailURL score:(nullable NSString *)score;

@end

