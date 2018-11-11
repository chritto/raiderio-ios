/**
 * This file is generated using the remodel generation script.
 * The name of the input file is RIOCharacterPreviewViewModel.value
 */

#import <Foundation/Foundation.h>
#import <IGListKit/IGListDiffable.h>

@interface RIOCharacterPreviewViewModel : NSObject <IGListDiffable, NSCopying>

@property (nonatomic, readonly, copy) NSString *region;
@property (nonatomic, readonly, copy) NSString *name;
@property (nonatomic, readonly, copy) NSString *realm;
@property (nonatomic, readonly, copy, nullable) NSString *guild;
@property (nonatomic, readonly, copy, nullable) NSURL *thumbnailURL;

+ (instancetype)new NS_UNAVAILABLE;

- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithRegion:(NSString *)region name:(NSString *)name realm:(NSString *)realm guild:(nullable NSString *)guild thumbnailURL:(nullable NSURL *)thumbnailURL NS_DESIGNATED_INITIALIZER;

@end

