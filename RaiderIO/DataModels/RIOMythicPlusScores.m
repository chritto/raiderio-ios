/**
 * This file is generated using the remodel generation script.
 * The name of the input file is RIOMythicPlusScores.value
 */

#if  ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Use -fobjc-arc flag (or convert project to ARC).
#endif

#import "RIOMythicPlusScores.h"

@implementation RIOMythicPlusScores

- (instancetype)initWithAll:(NSInteger)all dps:(NSInteger)dps healer:(NSInteger)healer tank:(NSInteger)tank
{
  if ((self = [super init])) {
    _all = all;
    _dps = dps;
    _healer = healer;
    _tank = tank;
  }

  return self;
}

- (id)copyWithZone:(nullable NSZone *)zone
{
  return self;
}

- (NSString *)description
{
  return [NSString stringWithFormat:@"%@ - \n\t all: %lld; \n\t dps: %lld; \n\t healer: %lld; \n\t tank: %lld; \n", [super description], (long long)_all, (long long)_dps, (long long)_healer, (long long)_tank];
}

- (NSUInteger)hash
{
  NSUInteger subhashes[] = {ABS(_all), ABS(_dps), ABS(_healer), ABS(_tank)};
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

- (BOOL)isEqual:(RIOMythicPlusScores *)object
{
  if (self == object) {
    return YES;
  } else if (object == nil || ![object isKindOfClass:[self class]]) {
    return NO;
  }
  return
    _all == object->_all &&
    _dps == object->_dps &&
    _healer == object->_healer &&
    _tank == object->_tank;
}

@end

