//
//  RIOCharacterListViewController.m
//  RaiderIO
//
//  Created by Chris McGrath on 10/31/18.
//  Copyright © 2018 Chris McGrath. All rights reserved.
//

#import "RIOCharacterListViewController.h"

#import <IGListKit/IGListKit.h>

#import "RIOCharacterSectionController.h"
#import "RIOCharacterViewModel.h"

@interface RIOCharacterListViewController () <IGListAdapterDataSource>

@end

@implementation RIOCharacterListViewController {
    UICollectionView *_collectionView;
    IGListAdapter *_listAdapter;
}

- (instancetype)init {
    if (self = [super init]) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor purpleColor];

    UICollectionView * const collectionView = makeCollectionView();
    [self.view addSubview:collectionView];

    IGListAdapterUpdater *updater = [IGListAdapterUpdater new];
    IGListAdapter *listAdapter = [[IGListAdapter alloc] initWithUpdater:updater viewController:self];
    listAdapter.dataSource = self;
    listAdapter.collectionView = collectionView;

    _collectionView = collectionView;
    _listAdapter = listAdapter;
}

- (void)viewDidLayoutSubviews {
    _collectionView.frame = self.view.bounds;
}

#pragma mark - IGListAdapterDataSource

- (NSArray<id <IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    return @[ [[RIOCharacterViewModel alloc] initWithName:@"Sevv" realm:@"Ner'zhul"] ];
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    if ([object isKindOfClass:[RIOCharacterViewModel class]]) {
        return [RIOCharacterSectionController new];
    } else {
        NSAssert(false, @"Unable to find a matching section controller for %@", object);
        return nil;
    }
}

- (nullable UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}

#pragma mark - Helpers

static UICollectionView *makeCollectionView() {
    UICollectionViewLayout * const layout = [UICollectionViewFlowLayout new];
    UICollectionView * const collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    collectionView.alwaysBounceVertical = YES;
    collectionView.backgroundColor = [UIColor whiteColor];
    return collectionView;
}

@end
