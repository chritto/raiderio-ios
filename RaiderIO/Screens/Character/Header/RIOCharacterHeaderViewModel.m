/**
 * This file is generated using the remodel generation script.
 * The name of the input file is RIOCharacterHeaderViewModel.value
 */

#if  ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Use -fobjc-arc flag (or convert project to ARC).
#endif

#import "RIOCharacterHeaderViewModel.h"

@implementation RIOCharacterHeaderViewModel

- (instancetype)initWithName:(NSString *)name thumbnailURL:(NSURL *)thumbnailURL bannerURL:(NSURL *)bannerURL score:(NSInteger)score
{
  if ((self = [super init])) {
    _name = [name copy];
    _thumbnailURL = [thumbnailURL copy];
    _bannerURL = [bannerURL copy];
    _score = score;
  }

  return self;
}

- (id)copyWithZone:(NSZone *)zone
{
  return self;
}

- (NSString *)description
{
  return [NSString stringWithFormat:@"%@ - \n\t name: %@; \n\t thumbnailURL: %@; \n\t bannerURL: %@; \n\t score: %zd; \n", [super description], _name, _thumbnailURL, _bannerURL, _score];
}

- (NSUInteger)hash
{
  NSUInteger subhashes[] = {[_name hash], [_thumbnailURL hash], [_bannerURL hash], ABS(_score)};
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

- (BOOL)isEqual:(RIOCharacterHeaderViewModel *)object
{
  if (self == object) {
    return YES;
  } else if (self == nil || object == nil || ![object isKindOfClass:[self class]]) {
    return NO;
  }
  return
    _score == object->_score &&
    (_name == object->_name ? YES : [_name isEqual:object->_name]) &&
    (_thumbnailURL == object->_thumbnailURL ? YES : [_thumbnailURL isEqual:object->_thumbnailURL]) &&
    (_bannerURL == object->_bannerURL ? YES : [_bannerURL isEqual:object->_bannerURL]);
}

@end

