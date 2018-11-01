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

@implementation RIOCharacterSectionController

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

@end
