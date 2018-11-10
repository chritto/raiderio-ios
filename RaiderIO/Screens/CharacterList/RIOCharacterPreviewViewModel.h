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

+ (instancetype)new NS_UNAVAILABLE;

- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithRegion:(NSString *)region name:(NSString *)name realm:(NSString *)realm NS_DESIGNATED_INITIALIZER;

@end

