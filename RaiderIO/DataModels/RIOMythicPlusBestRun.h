/**
 * This file is generated using the remodel generation script.
 * The name of the input file is RIOMythicPlusBestRun.value
 */

#import <Foundation/Foundation.h>

@interface RIOMythicPlusBestRun : NSObject <NSCopying>

@property (nonatomic, readonly, copy) NSString *dungeon;
@property (nonatomic, readonly) NSInteger level;
@property (nonatomic, readonly) NSInteger score;
@property (nonatomic, readonly) NSInteger upgrades;

- (instancetype)initWithDungeon:(NSString *)dungeon level:(NSInteger)level score:(NSInteger)score upgrades:(NSInteger)upgrades;

@end

