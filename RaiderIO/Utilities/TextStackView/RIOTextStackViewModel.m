/**
 * This file is generated using the remodel generation script.
 * The name of the input file is RIOTextStackViewModel.value
 */

#if  ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Use -fobjc-arc flag (or convert project to ARC).
#endif

#import "RIOTextStackViewModel.h"

@implementation RIOTextStackViewModel

- (instancetype)initWithTexts:(NSArray<NSAttributedString *> *)texts direction:(RIOTextStackViewDirection)direction
{
  if ((self = [super init])) {
    _texts = [texts copy];
    _direction = direction;
  }

  return self;
}

- (id)copyWithZone:(NSZone *)zone
{
  return self;
}

- (NSString *)description
{
  return [NSString stringWithFormat:@"%@ - \n\t texts: %@; \n\t direction: %tu; \n", [super description], _texts, _direction];
}

- (NSUInteger)hash
{
  NSUInteger subhashes[] = {[_texts hash], _direction};
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

- (BOOL)isEqual:(RIOTextStackViewModel *)object
{
  if (self == object) {
    return YES;
  } else if (self == nil || object == nil || ![object isKindOfClass:[self class]]) {
    return NO;
  }
  return
    _direction == object->_direction &&
    (_texts == object->_texts ? YES : [_texts isEqual:object->_texts]);
}

@end

