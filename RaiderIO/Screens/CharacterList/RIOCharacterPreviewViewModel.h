/**
 * This file is generated using the remodel generation script.
 * The name of the input file is RIOCharacterPreviewViewModel.value
 */

#import <Foundation/Foundation.h>
#import "RIOCharacterID.h"
#import <IGListKit/IGListDiffable.h>

@interface RIOCharacterPreviewViewModel : NSObject <IGListDiffable, NSCopying>

@property (nonatomic, readonly, copy) RIOCharacterID *characterID;
@property (nonatomic, readonly, copy) NSString *realmDescription;
@property (nonatomic, readonly) BOOL loading;
@property (nonatomic, readonly, copy, nullable) NSString *guild;
@property (nonatomic, readonly, copy, nullable) NSURL *thumbnailURL;
@property (nonatomic, readonly, copy, nullable) NSString *score;

+ (instancetype)new NS_UNAVAILABLE;

- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithCharacterID:(RIOCharacterID *)characterID realmDescription:(NSString *)realmDescription loading:(BOOL)loading guild:(nullable NSString *)guild thumbnailURL:(nullable NSURL *)thumbnailURL score:(nullable NSString *)score NS_DESIGNATED_INITIALIZER;

@end

