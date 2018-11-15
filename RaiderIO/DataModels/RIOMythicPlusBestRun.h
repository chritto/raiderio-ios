/**
 * This file is generated using the remodel generation script.
 * The name of the input file is RIOMythicPlusBestRun.value
 */

#import <Foundation/Foundation.h>
#import <CoreGraphics/CGBase.h>

@interface RIOMythicPlusBestRun : NSObject <NSCopying>

@property (nonatomic, readonly, copy) NSString *dungeon;
@property (nonatomic, readonly) NSUInteger level;
@property (nonatomic, readonly) CGFloat score;

+ (instancetype)new NS_UNAVAILABLE;

- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithDungeon:(NSString *)dungeon level:(NSUInteger)level score:(CGFloat)score NS_DESIGNATED_INITIALIZER;

@end

