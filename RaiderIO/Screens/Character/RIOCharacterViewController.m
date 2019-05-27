//
//  RIOCharacterViewController.m
//  RaiderIO
//
//  Created by Chris McGrath on 11/4/18.
//  Copyright © 2018 Chris McGrath. All rights reserved.
//

#import "RIOCharacterViewController.h"

#import <IGListKit/IGListKit.h>

#import "RIOCharacterService.h"
#import "RIOCharacterHeaderSectionController.h"
#import "RIOCharacterHeaderViewModel.h"
#import "RIOCharacterHeaderViewModel+IGListDiffable.h"
#import "RIODungeonViewModel.h"
#import "RIODungeonSectionController.h"

@interface RIOCharacterViewController ()
<
IGListAdapterDataSource
>

@end

@implementation RIOCharacterViewController {
    RIOCharacter *_character;
    RIOCharacterService *_characterService;

    UICollectionView *_collectionView;
    IGListAdapter *_listAdapter;
}

- (instancetype)initWithCharacter:(RIOCharacter *)character {
    if (self = [super init]) {
        _character = character;
        _characterService = [RIOCharacterService new];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = _character.name;

    UICollectionViewFlowLayout * const layout = [UICollectionViewFlowLayout new];
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero
                                         collectionViewLayout:layout];
    _collectionView.alwaysBounceVertical = YES;
    _collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_collectionView];
    
    IGListAdapterUpdater *updater = [IGListAdapterUpdater new];
    IGListAdapter *listAdapter = [[IGListAdapter alloc] initWithUpdater:updater viewController:self];
    listAdapter.dataSource = self;
    listAdapter.collectionView = _collectionView;
    _listAdapter = listAdapter;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    _collectionView.frame = self.view.bounds;
}

#pragma mark - IGListAdapterDataSource

- (NSArray<id <IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
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
