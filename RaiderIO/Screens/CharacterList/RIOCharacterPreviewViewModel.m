/**
 * This file is generated using the remodel generation script.
 * The name of the input file is RIOCharacterPreviewViewModel.value
 */

#if  ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Use -fobjc-arc flag (or convert project to ARC).
#endif

#import "RIOCharacterPreviewViewModel.h"

@implementation RIOCharacterPreviewViewModel

- (instancetype)initWithCharacterID:(RIOCharacterID *)characterID loading:(BOOL)loading guild:(nullable NSString *)guild thumbnailURL:(nullable NSURL *)thumbnailURL score:(nullable NSString *)score
{
  if ((self = [super init])) {
    _characterID = [characterID copy];
    _loading = loading;
    _guild = [guild copy];
    _thumbnailURL = [thumbnailURL copy];
    _score = [score copy];
  }

  return self;
}

- (id)copyWithZone:(nullable NSZone *)zone
{
  return self;
}

- (NSString *)description
{
  return [NSString stringWithFormat:@"%@ - \n\t characterID: %@; \n\t loading: %@; \n\t guild: %@; \n\t thumbnailURL: %@; \n\t score: %@; \n", [super description], _characterID, _loading ? @"YES" : @"NO", _guild, _thumbnailURL, _score];
}

- (id<NSObject>)diffIdentifier
{
  return self;
}

- (NSUInteger)hash
{
  NSUInteger subhashes[] = {[_characterID hash], (NSUInteger)_loading, [_guild hash], [_thumbnailURL hash], [_score hash]};
  NSUInteger result = subhashes[0];
  for (int ii = 1; ii < 5; ++ii) {
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

- (BOOL)isEqual:(RIOCharacterPreviewViewModel *)object
{
  if (self == object) {
    return YES;
  } else if (object == nil || ![object isKindOfClass:[self class]]) {
    return NO;
  }
  return
    _loading == object->_loading &&
    (_characterID == object->_characterID ? YES : [_characterID isEqual:object->_characterID]) &&
    (_guild == object->_guild ? YES : [_guild isEqual:object->_guild]) &&
    (_thumbnailURL == object->_thumbnailURL ? YES : [_thumbnailURL isEqual:object->_thumbnailURL]) &&
    (_score == object->_score ? YES : [_score isEqual:object->_score]);
}

- (BOOL)isEqualToDiffableObject:(nullable id)object
{
  return [self isEqual:object];
}

@end

