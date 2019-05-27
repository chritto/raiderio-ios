/**
 * This file is generated using the remodel generation script.
 * The name of the input file is RIODungeonViewModel.value
 */

#if  ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Use -fobjc-arc flag (or convert project to ARC).
#endif

#import "RIODungeonViewModel.h"

@implementation RIODungeonViewModel

- (instancetype)initWithBestRun:(RIOMythicPlusBestRun *)bestRun
{
  if ((self = [super init])) {
    _bestRun = [bestRun copy];
  }

  return self;
}

- (id)copyWithZone:(NSZone *)zone
{
  return self;
}

- (NSString *)description
{
  return [NSString stringWithFormat:@"%@ - \n\t bestRun: %@; \n", [super description], _bestRun];
}

- (NSUInteger)hash
{
  NSUInteger subhashes[] = {[_bestRun hash]};
  NSUInteger result = subhashes[0];
  for (int ii = 1; ii < 1; ++ii) {
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

- (BOOL)isEqual:(RIODungeonViewModel *)object
{
  if (self == object) {
    return YES;
  } else if (self == nil || object == nil || ![object isKindOfClass:[self class]]) {
    return NO;
  }
  return
    (_bestRun == object->_bestRun ? YES : [_bestRun isEqual:object->_bestRun]);
}

@end

