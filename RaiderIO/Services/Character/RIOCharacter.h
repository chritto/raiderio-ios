/**
 * This file is generated using the remodel generation script.
 * The name of the input file is RIOCharacter.value
 */

#import <Foundation/Foundation.h>
#import "RIOGuild.h"

@interface RIOCharacter : NSObject <NSCopying>

@property (nonatomic, readonly, copy) NSString *name;
@property (nonatomic, readonly, copy) NSString *race;
@property (nonatomic, readonly, copy) NSString *characterClass;
@property (nonatomic, readonly, copy) NSString *activeSpecName;
@property (nonatomic, readonly, copy) NSString *activeSpecRole;
@property (nonatomic, readonly, copy) NSString *gender;
@property (nonatomic, readonly, copy) NSString *faction;
@property (nonatomic, readonly) NSInteger achievementPoints;
@property (nonatomic, readonly) NSInteger honorableKills;
@property (nonatomic, readonly, copy) NSURL *thumbnailURL;
@property (nonatomic, readonly, copy) NSString *region;
@property (nonatomic, readonly, copy) NSString *realm;
@property (nonatomic, readonly, copy) NSURL *profileURL;
@property (nonatomic, readonly, copy) RIOGuild *guild;

+ (instancetype)new NS_UNAVAILABLE;

- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithName:(NSString *)name race:(NSString *)race characterClass:(NSString *)characterClass activeSpecName:(NSString *)activeSpecName activeSpecRole:(NSString *)activeSpecRole gender:(NSString *)gender faction:(NSString *)faction achievementPoints:(NSInteger)achievementPoints honorableKills:(NSInteger)honorableKills thumbnailURL:(NSURL *)thumbnailURL region:(NSString *)region realm:(NSString *)realm profileURL:(NSURL *)profileURL guild:(RIOGuild *)guild NS_DESIGNATED_INITIALIZER;

@end

