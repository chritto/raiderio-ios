//
//  RIODungeonSectionController.m
//  RaiderIO
//
//  Created by Chris McGrath on 5/26/19.
//  Copyright © 2019 Chris McGrath. All rights reserved.
//

#import "RIODungeonSectionController.h"

#import "RIODungeonViewModel.h"
#import "RIODungeonCell.h"

@implementation RIODungeonSectionController

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(self.collectionContext.containerSize.width, 50);
}

- (__kindof UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    RIODungeonCell * const cell = [self.collectionContext dequeueReusableCellOfClass:[RIODungeonCell class]
                                                                        forSectionController:self
                                                                                     atIndex:index];
    [cell configureWithViewModel:self.object];
    return cell;
}

@end
