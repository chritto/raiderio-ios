//
//  RIOCharacterViewController.m
//  RaiderIO
//
//  Created by Chris McGrath on 11/4/18.
//  Copyright © 2018 Chris McGrath. All rights reserved.
//

#import "RIOCharacterViewController.h"

#import <IGListKit/IGListKit.h>

#import "RIOCharacter.h"
#import "RIOCharacterCache.h"
#import "RIOCharacterHeaderSectionController.h"
#import "RIOCharacterHeaderViewModel.h"
#import "RIOCharacterHeaderViewModel+IGListDiffable.h"
#import "RIOCharacterID.h"
#import "RIODungeonViewModel.h"
#import "RIODungeonSectionController.h"

@interface RIOCharacterViewController ()
<
IGListAdapterDataSource,
RIOCharacterCacheListener
>

@end

@implementation RIOCharacterViewController {
    RIOCharacterID *_characterID;
    RIOCharacterCache *_characterCache;
    RIOCharacter *_character;

    UICollectionView *_collectionView;
    IGListAdapter *_listAdapter;
}

- (instancetype)initWithCharacterID:(RIOCharacterID *)characterID
                     characterCache:(RIOCharacterCache *)characterCache {
    if (self = [super init]) {
        _characterID = characterID;
        _characterCache = characterCache;
        [_characterCache addCharacterListener:characterID listener:self];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = _characterID.name;

    UICollectionViewFlowLayout * const layout = [UICollectionViewFlowLayout new];
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero
                                         collectionViewLayout:layout];
    _collectionView.alwaysBounceVertical = YES;
    _collectionView.backgroundColor = [UIColor whiteColor];
    UIRefreshControl * const refreshControl = [UIRefreshControl new];
    [refreshControl beginRefreshing];
    [refreshControl addTarget:self action:@selector(_needsRefresh:) forControlEvents:UIControlEventValueChanged];
    _collectionView.refreshControl = refreshControl;
    [self.view addSubview:_collectionView];
    
    IGListAdapterUpdater *updater = [IGListAdapterUpdater new];
    IGListAdapter *listAdapter = [[IGListAdapter alloc] initWithUpdater:updater viewController:self];
    listAdapter.dataSource = self;
    listAdapter.collectionView = _collectionView;
    _listAdapter = listAdapter;

    [self _loadCharacter];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    _collectionView.frame = self.view.bounds;
}

#pragma mark - RIOCharacterCacheListener

- (void)characterCacheDidUpdate {
    [self _loadCharacter];
}

#pragma mark - IGListAdapterDataSource

- (NSArray<id <IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    if (_character == nil) {
        return @[];
    }
    RIOCharacterHeaderViewModel * const header =
    [[RIOCharacterHeaderViewModel alloc] initWithName:_character.name
                                         thumbnailURL:_character.thumbnailURL
                                            bannerURL:bannerURLForFaction(_character.faction)
                                                score:_character.mythicPlusScores.all];
    
    NSMutableArray<RIODungeonViewModel *> * const dungeons = [NSMutableArray array];
    for (RIOMythicPlusBestRun * const bestRun in _character.mythicPlusBestRuns) {
        RIODungeonViewModel * const dungeonViewModel = [[RIODungeonViewModel alloc] initWithBestRun:bestRun];
        [dungeons addObject:dungeonViewModel];
    }
    
    return [[@[] arrayByAddingObject:header] arrayByAddingObjectsFromArray:dungeons];
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter
              sectionControllerForObject:(id)object {
    if ([object isKindOfClass:RIOCharacterHeaderViewModel.class]) {
        return [RIOCharacterHeaderSectionController new];
    } else if ([object isKindOfClass:RIODungeonViewModel.class]) {
        return [RIODungeonSectionController new];
    }
    NSAssert(NO, @"Unexpected view model");
    return nil;
}

- (nullable UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    UILabel * const label = [UILabel new];
    label.backgroundColor = [UIColor whiteColor];
    label.text = @"Character not found.";
    label.textAlignment = NSTextAlignmentCenter;
    return label;
}

#pragma mark - Private

- (void)_loadCharacter {
    _character = [_characterCache characterWithID:_characterID];
    if (_character != nil) {
        [_collectionView.refreshControl endRefreshing];
        [_listAdapter performUpdatesAnimated:YES completion:nil];
    }
}

- (void)_needsRefresh:(UIRefreshControl *)refreshControl {
    [_characterCache clearCache];
    [self _loadCharacter];
}

#pragma mark - Helpers

// FIXME: Migrate faction to an enum
static NSURL *bannerURLForFaction(NSString *faction) {
    if ([faction isEqualToString:@"horde"]) {
        return [NSURL URLWithString:@"https://cdnassets.raider.io/images/profile/masthead_backdrops/v2/hordebanner1.jpg"];
    } else if ([faction isEqualToString:@"alliance"]) {
        return [NSURL URLWithString:@"https://cdnassets.raider.io/images/profile/masthead_backdrops/v2/alliancebanner1.jpg"];
    } else {
        NSCAssert(NO, @"Unexpected faction");
        return nil;
    }
}

@end
