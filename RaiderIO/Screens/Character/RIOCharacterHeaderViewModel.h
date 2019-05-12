/**
 * This file is generated using the remodel generation script.
 * The name of the input file is RIOCharacterHeaderViewModel.value
 */

#import <Foundation/Foundation.h>

@interface RIOCharacterHeaderViewModel : NSObject <NSCopying>

@property (nonatomic, readonly, copy) NSString *name;
@property (nonatomic, readonly, copy) NSURL *thumbnailURL;
@property (nonatomic, readonly, copy) NSURL *bannerURL;

- (instancetype)initWithName:(NSString *)name thumbnailURL:(NSURL *)thumbnailURL bannerURL:(NSURL *)bannerURL;

@end

