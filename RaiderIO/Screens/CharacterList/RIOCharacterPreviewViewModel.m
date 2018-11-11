/**
 * This file is generated using the remodel generation script.
 * The name of the input file is RIOCharacterPreviewViewModel.value
 */

#if  ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Use -fobjc-arc flag (or convert project to ARC).
#endif

#import "RIOCharacterPreviewViewModel.h"

@implementation RIOCharacterPreviewViewModel

- (instancetype)initWithRegion:(NSString *)region name:(NSString *)name realm:(NSString *)realm guild:(nullable NSString *)guild thumbnailURL:(nullable NSURL *)thumbnailURL
{
  if ((self = [super init])) {
    _region = [region copy];
    _name = [name copy];
    _realm = [realm copy];
    _guild = [guild copy];
    _thumbnailURL = [thumbnailURL copy];
  }

  return self;
}

- (id)copyWithZone:(nullable NSZone *)zone
{
  return self;
}

- (NSString *)description
{
  return [NSString stringWithFormat:@"%@ - \n\t region: %@; \n\t name: %@; \n\t realm: %@; \n\t guild: %@; \n\t thumbnailURL: %@; \n", [super description], _region, _name, _realm, _guild, _thumbnailURL];
}

- (id<NSObject>)diffIdentifier
{
  return self;
}

- (NSUInteger)hash
{
  NSUInteger subhashes[] = {[_region hash], [_name hash], [_realm hash], [_guild hash], [_thumbnailURL hash]};
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
    (_region == object->_region ? YES : [_region isEqual:object->_region]) &&
    (_name == object->_name ? YES : [_name isEqual:object->_name]) &&
    (_realm == object->_realm ? YES : [_realm isEqual:object->_realm]) &&
    (_guild == object->_guild ? YES : [_guild isEqual:object->_guild]) &&
    (_thumbnailURL == object->_thumbnailURL ? YES : [_thumbnailURL isEqual:object->_thumbnailURL]);
}

- (BOOL)isEqualToDiffableObject:(nullable id)object
{
  return [self isEqual:object];
}

@end

