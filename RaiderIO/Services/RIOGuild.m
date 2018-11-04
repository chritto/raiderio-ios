/**
 * This file is generated using the remodel generation script.
 * The name of the input file is RIOGuild.value
 */

#if  ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Use -fobjc-arc flag (or convert project to ARC).
#endif

#import "RIOGuild.h"

@implementation RIOGuild

- (instancetype)initWithName:(NSString *)name realm:(NSString *)realm
{
  if ((self = [super init])) {
    _name = [name copy];
    _realm = [realm copy];
  }

  return self;
}

- (id)copyWithZone:(nullable NSZone *)zone
{
  return self;
}

- (NSString *)description
{
  return [NSString stringWithFormat:@"%@ - \n\t name: %@; \n\t realm: %@; \n", [super description], _name, _realm];
}

- (NSUInteger)hash
{
  NSUInteger subhashes[] = {[_name hash], [_realm hash]};
  NSUInteger result = subhashes[0];
  for (int ii = 1; ii < 2; ++ii) {
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

- (BOOL)isEqual:(RIOGuild *)object
{
  if (self == object) {
    return YES;
  } else if (object == nil || ![object isKindOfClass:[self class]]) {
    return NO;
  }
  return
    (_name == object->_name ? YES : [_name isEqual:object->_name]) &&
    (_realm == object->_realm ? YES : [_realm isEqual:object->_realm]);
}

@end

