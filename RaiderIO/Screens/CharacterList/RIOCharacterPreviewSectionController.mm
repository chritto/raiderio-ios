//
//  RIOCharacterSectionController.m
//  RaiderIO
//
//  Created by Chris McGrath on 10/31/18.
//  Copyright © 2018 Chris McGrath. All rights reserved.
//

#import "RIOCharacterPreviewSectionController.h"

#import <ComponentKit/ComponentKit.h>

#import "RIOCharacterCache.h"
#import "RIOComponentCell.h"
#import "RIOCharacter.h"
#import "RIOGuild.h"
#import "RIOCharacterViewController.h"
#import "RIOCharacterPreviewComponent.h"
#import "RIOUserSession.h"

@implementation RIOCharacterPreviewSectionController {
    RIOCharacterCache *_characterCache;
    RIOCharacterPreviewComponent *_component;
    RIOUserSession *_userSession;
}

- (instancetype)initWithCharacterCache:(RIOCharacterCache *)characterCache
                           userSession:(RIOUserSession *)userSession {
    if (self = [super init]) {
        _characterCache = characterCache;
        _userSession = userSession;
    }
    return self;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    // TODO: Use the component...
    const CGSize componentSize = CKComputeRootComponentLayout(_component, CKSizeRange(CGSizeZero, self.collectionContext.containerSize)).size();
    return CGSizeMake(self.collectionContext.containerSize.width, componentSize.height);
}

- (__kindof UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    RIOComponentCell * const cell = [self.collectionContext dequeueReusableCellOfClass:[RIOComponentCell class]
                                                                  forSectionController:self
                                                                               atIndex:index];
    [cell configureWithComponent:_component];
    return cell;
}

- (void)didUpdateToObject:(id)object {
    [super didUpdateToObject:object];
    _component = [RIOCharacterPreviewComponent newWithViewModel:object
                                                    userSession:_userSession];
}

- (void)didSelectItemAtIndex:(NSInteger)index {
    RIOCharacter * const character = [_characterCache characterWithID:self.object.characterID];
    if (character != nil) {
        RIOCharacterViewController * const characterViewController = [[RIOCharacterViewController alloc] initWithCharacter:character];
        [self.viewController.navigationController pushViewController:characterViewController animated:YES];
    }
}

@end
