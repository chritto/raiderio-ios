/**
 * This file is generated using the remodel generation script.
 * The name of the input file is RIOCharacter.value
 */

#import <Foundation/Foundation.h>

@interface RIOCharacter : NSObject <NSCopying>

@property (nonatomic, readonly, copy) NSString *name;
@property (nonatomic, readonly, copy) NSString *realm;

+ (instancetype)new NS_UNAVAILABLE;

- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithName:(NSString *)name realm:(NSString *)realm NS_DESIGNATED_INITIALIZER;

@end

