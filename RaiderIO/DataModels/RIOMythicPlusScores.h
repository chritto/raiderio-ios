/**
 * This file is generated using the remodel generation script.
 * The name of the input file is RIOMythicPlusScores.value
 */

#import <Foundation/Foundation.h>

@interface RIOMythicPlusScores : NSObject <NSCopying>

@property (nonatomic, readonly) NSInteger all;
@property (nonatomic, readonly) NSInteger dps;
@property (nonatomic, readonly) NSInteger healer;
@property (nonatomic, readonly) NSInteger tank;

- (instancetype)initWithAll:(NSInteger)all dps:(NSInteger)dps healer:(NSInteger)healer tank:(NSInteger)tank;

@end

