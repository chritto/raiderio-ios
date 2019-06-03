//
//  RIOCharacterSectionController.m
//  RaiderIO
//
//  Created by Chris McGrath on 10/31/18.
//  Copyright © 2018 Chris McGrath. All rights reserved.
//

#import "RIOCharacterPreviewSectionController.h"

#import "RIOCharacterCache.h"
#import "RIOCharacterPreviewCell.h"
#import "RIOCharacterPreviewViewModel+Layout.h"
#import "RIOCharacter.h"
#import "RIOGuild.h"
#import "RIOCharacterViewController.h"

@implementation RIOCharacterPreviewSectionController {
    RIOCharacterCache *_characterCache;
}

- (instancetype)initWithCharacterCache:(RIOCharacterCache *)characterCache {
    if (self = [super init]) {
        _characterCache = characterCache;
    }
    return self;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return [self.object sizeForConstrainingSize:self.collectionContext.containerSize];
}

- (__kindof UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    RIOCharacterPreviewCell * const cell = [self.collectionContext dequeueReusableCellOfClass:[RIOCharacterPreviewCell class]
                                                                         forSectionController:self
                                                                                      atIndex:index];
    [cell configureWithViewModel:self.object];
    return cell;
}

- (void)didSelectItemAtIndex:(NSInteger)index {
    RIOCharacterViewController * const characterViewController = [[RIOCharacterViewController alloc] initWithCharacterID:self.object.characterID
                                                                                                          characterCache:_characterCache];
    [self.viewController.navigationController pushViewController:characterViewController animated:YES];
    [self.collectionContext deselectItemAtIndex:index sectionController:self animated:YES];
}

@end
