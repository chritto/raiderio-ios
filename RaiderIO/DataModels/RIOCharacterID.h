/**
 * This file is generated using the remodel generation script.
 * The name of the input file is RIOCharacterID.value
 */

#import <Foundation/Foundation.h>

@interface RIOCharacterID : NSObject <NSCopying>

@property (nonatomic, readonly, copy) NSString *name;
@property (nonatomic, readonly, copy) NSString *realm;
@property (nonatomic, readonly, copy) NSString *region;

- (instancetype)initWithName:(NSString *)name realm:(NSString *)realm region:(NSString *)region;

@end

