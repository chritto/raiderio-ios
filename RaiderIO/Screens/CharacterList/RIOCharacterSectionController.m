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

@implementation RIOCharacterSectionController {
    RIOCharacterService *_characterService;
}

- (instancetype)init {
    if (self = [super init]) {
        _characterService = [RIOCharacterService new];
        [self _loadUpCharacter];
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

#pragma mark - Private

- (void)_loadUpCharacter {
    [_characterService fetchCharacterWithRegion:@"us" realm:@"Ner'zhul" name:@"Sevv" completion:^(RIOCharacter * _Nullable character) {
        NSLog(@"Fetched my character:");
        NSLog(@"%@", [character description]);
    }];
}

@end

// https://raider.io/api/v1/characters/profile?region=us&realm=Ner'zhul&name=Sevv&fields=mythic_plus_best_runs%3Aall
// https://raider.io/api/v1/characters/profile?region=us?name=Sevv?realm=Ner'zhul?fields=mythic_plus_best_runs:all
