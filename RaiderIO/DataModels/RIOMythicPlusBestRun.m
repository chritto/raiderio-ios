/**
 * This file is generated using the remodel generation script.
 * The name of the input file is RIOMythicPlusBestRun.value
 */

#if  ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Use -fobjc-arc flag (or convert project to ARC).
#endif

#import "RIOMythicPlusBestRun.h"

@implementation RIOMythicPlusBestRun

- (instancetype)initWithDungeon:(NSString *)dungeon level:(NSInteger)level score:(NSInteger)score upgrades:(NSInteger)upgrades
{
  if ((self = [super init])) {
    _dungeon = [dungeon copy];
    _level = level;
    _score = score;
    _upgrades = upgrades;
  }

  return self;
}

- (id)copyWithZone:(NSZone *)zone
{
  return self;
}

- (NSString *)description
{
  return [NSString stringWithFormat:@"%@ - \n\t dungeon: %@; \n\t level: %zd; \n\t score: %zd; \n\t upgrades: %zd; \n", [super description], _dungeon, _level, _score, _upgrades];
}

- (NSUInteger)hash
{
  NSUInteger subhashes[] = {[_dungeon hash], ABS(_level), ABS(_score), ABS(_upgrades)};
  NSUInteger result = subhashes[0];
  for (int ii = 1; ii < 4; ++ii) {
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

- (BOOL)isEqual:(RIOMythicPlusBestRun *)object
{
  if (self == object) {
    return YES;
  } else if (self == nil || object == nil || ![object isKindOfClass:[self class]]) {
    return NO;
  }
  return
    _level == object->_level &&
    _score == object->_score &&
    _upgrades == object->_upgrades &&
    (_dungeon == object->_dungeon ? YES : [_dungeon isEqual:object->_dungeon]);
}

@end

