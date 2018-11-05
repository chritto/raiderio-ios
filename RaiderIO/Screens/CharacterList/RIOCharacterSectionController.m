//
//  RIOCharacterSectionController.m
//  RaiderIO
//
//  Created by Chris McGrath on 10/31/18.
//  Copyright © 2018 Chris McGrath. All rights reserved.
//

#import "RIOCharacterSectionController.h"

#import "RIOCharacterCell.h"
#import "RIOCharacterViewModel+Layout.h"
#import "RIOCharacterService.h"
#import "RIOCharacter.h"
#import "RIOGuild.h"
#import "RIOCharacterViewController.h"

@implementation RIOCharacterSectionController {
    RIOCharacterService *_characterService;
}

- (instancetype)init {
    if (self = [super init]) {
        _characterService = [RIOCharacterService new];
    }
    return self;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return [self.object sizeForConstrainingSize:self.collectionContext.containerSize];
}

- (__kindof UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    RIOCharacterCell * const cell = [self.collectionContext dequeueReusableCellOfClass:[RIOCharacterCell class]
                                                                  forSectionController:self
                                                                               atIndex:index];
    [cell configureWithViewModel:self.object];
    return cell;
}

- (void)didSelectItemAtIndex:(NSInteger)index {
    [_characterService fetchCharacterWithRegion:self.object.region realm:self.object.realm name:self.object.name completion:^(RIOCharacter * _Nullable character) {
        RIOCharacterViewController * const characterViewController = [[RIOCharacterViewController alloc] initWithCharacter:character];
        [self.viewController.navigationController pushViewController:characterViewController animated:YES];
    }];
}

@end
