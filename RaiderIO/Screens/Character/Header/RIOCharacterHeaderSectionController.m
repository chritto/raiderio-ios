//
//  RIOCharacterHeaderSectionController.m
//  RaiderIO
//
//  Created by Chris McGrath on 5/12/19.
//  Copyright © 2019 Chris McGrath. All rights reserved.
//

#import "RIOCharacterHeaderSectionController.h"

#import "RIOCharacterHeaderCell.h"

@implementation RIOCharacterHeaderSectionController

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(self.collectionContext.containerSize.width, 120);
}

- (__kindof UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    RIOCharacterHeaderCell * const cell = [self.collectionContext dequeueReusableCellOfClass:[RIOCharacterHeaderCell class]
                                                                         forSectionController:self
                                                                                      atIndex:index];
    [cell configureWithViewModel:self.object];
    return cell;
}

@end
