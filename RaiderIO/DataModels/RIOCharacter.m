/**
 * This file is generated using the remodel generation script.
 * The name of the input file is RIOCharacter.value
 */

#if  ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Use -fobjc-arc flag (or convert project to ARC).
#endif

#import "RIOCharacter.h"

@implementation RIOCharacter

- (instancetype)initWithName:(NSString *)name race:(NSString *)race characterClass:(NSString *)characterClass activeSpecName:(NSString *)activeSpecName activeSpecRole:(NSString *)activeSpecRole gender:(NSString *)gender faction:(NSString *)faction achievementPoints:(NSInteger)achievementPoints honorableKills:(NSInteger)honorableKills thumbnailURL:(NSURL *)thumbnailURL region:(NSString *)region realm:(NSString *)realm profileURL:(NSURL *)profileURL guild:(RIOGuild *)guild mythicPlusScores:(RIOMythicPlusScores *)mythicPlusScores mythicPlusBestRuns:(NSArray<RIOMythicPlusBestRun *> *)mythicPlusBestRuns
{
  if ((self = [super init])) {
    _name = [name copy];
    _race = [race copy];
    _characterClass = [characterClass copy];
    _activeSpecName = [activeSpecName copy];
    _activeSpecRole = [activeSpecRole copy];
    _gender = [gender copy];
    _faction = [faction copy];
    _achievementPoints = achievementPoints;
    _honorableKills = honorableKills;
    _thumbnailURL = [thumbnailURL copy];
    _region = [region copy];
    _realm = [realm copy];
    _profileURL = [profileURL copy];
    _guild = [guild copy];
    _mythicPlusScores = [mythicPlusScores copy];
    _mythicPlusBestRuns = [mythicPlusBestRuns copy];
  }

  return self;
}

- (id)copyWithZone:(nullable NSZone *)zone
{
  return self;
}

- (NSString *)description
{
  return [NSString stringWithFormat:@"%@ - \n\t name: %@; \n\t race: %@; \n\t characterClass: %@; \n\t activeSpecName: %@; \n\t activeSpecRole: %@; \n\t gender: %@; \n\t faction: %@; \n\t achievementPoints: %lld; \n\t honorableKills: %lld; \n\t thumbnailURL: %@; \n\t region: %@; \n\t realm: %@; \n\t profileURL: %@; \n\t guild: %@; \n\t mythicPlusScores: %@; \n\t mythicPlusBestRuns: %@; \n", [super description], _name, _race, _characterClass, _activeSpecName, _activeSpecRole, _gender, _faction, (long long)_achievementPoints, (long long)_honorableKills, _thumbnailURL, _region, _realm, _profileURL, _guild, _mythicPlusScores, _mythicPlusBestRuns];
}

- (NSUInteger)hash
{
  NSUInteger subhashes[] = {[_name hash], [_race hash], [_characterClass hash], [_activeSpecName hash], [_activeSpecRole hash], [_gender hash], [_faction hash], ABS(_achievementPoints), ABS(_honorableKills), [_thumbnailURL hash], [_region hash], [_realm hash], [_profileURL hash], [_guild hash], [_mythicPlusScores hash], [_mythicPlusBestRuns hash]};
  NSUInteger result = subhashes[0];
  for (int ii = 1; ii < 16; ++ii) {
    unsigned long long base = (((unsigned long long)result) << 32 | subhashes[ii]);
    base = (~base) + (base << 18);
    base ^= (base >> 31);
    base *=  21;
    base ^= (base >> 11);
    base += (base << 6);
    base ^= (base >> 22);
    result = base;
  }
  return result;
}

- (BOOL)isEqual:(RIOCharacter *)object
{
  if (self == object) {
    return YES;
  } else if (object == nil || ![object isKindOfClass:[self class]]) {
    return NO;
  }
  return
    _honorableKills == object->_honorableKills &&
    _achievementPoints == object->_achievementPoints &&
    (_characterClass == object->_characterClass ? YES : [_characterClass isEqual:object->_characterClass]) &&
    (_activeSpecName == object->_activeSpecName ? YES : [_activeSpecName isEqual:object->_activeSpecName]) &&
    (_activeSpecRole == object->_activeSpecRole ? YES : [_activeSpecRole isEqual:object->_activeSpecRole]) &&
    (_gender == object->_gender ? YES : [_gender isEqual:object->_gender]) &&
    (_faction == object->_faction ? YES : [_faction isEqual:object->_faction]) &&
    (_name == object->_name ? YES : [_name isEqual:object->_name]) &&
    (_race == object->_race ? YES : [_race isEqual:object->_race]) &&
    (_thumbnailURL == object->_thumbnailURL ? YES : [_thumbnailURL isEqual:object->_thumbnailURL]) &&
    (_region == object->_region ? YES : [_region isEqual:object->_region]) &&
    (_realm == object->_realm ? YES : [_realm isEqual:object->_realm]) &&
    (_profileURL == object->_profileURL ? YES : [_profileURL isEqual:object->_profileURL]) &&
    (_guild == object->_guild ? YES : [_guild isEqual:object->_guild]) &&
    (_mythicPlusScores == object->_mythicPlusScores ? YES : [_mythicPlusScores isEqual:object->_mythicPlusScores]) &&
    (_mythicPlusBestRuns == object->_mythicPlusBestRuns ? YES : [_mythicPlusBestRuns isEqual:object->_mythicPlusBestRuns]);
}

@end

