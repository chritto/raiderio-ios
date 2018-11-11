//
//  RIOCharacterListViewController.m
//  RaiderIO
//
//  Created by Chris McGrath on 10/31/18.
//  Copyright © 2018 Chris McGrath. All rights reserved.
//

#import "RIOCharacterListViewController.h"

#import <IGListKit/IGListKit.h>

#import "RIOCharacterCache.h"
#import "RIOCharacterID.h"
#import "RIOCharacter.h"
#import "RIOCharacterPreviewSectionController.h"
#import "RIOCharacterPreviewViewModel.h"
#import "RIOCollections.h"

@interface RIOCharacterListViewController () <IGListAdapterDataSource, RIOCharacterCacheListener>

@end

@implementation RIOCharacterListViewController {
    UICollectionView *_collectionView;
    IGListAdapter *_listAdapter;
    RIOCharacterCache *_characterCache;
}

- (instancetype)init {
    if (self = [super init]) {
        _characterCache = [RIOCharacterCache new];
        [_characterCache addListener:self];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"Characters";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(_didTapAdd)];

    UICollectionViewLayout * const layout = [UICollectionViewFlowLayout new];
    UICollectionView * const collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    collectionView.alwaysBounceVertical = YES;
    collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:collectionView];
    _collectionView = collectionView;

    IGListAdapterUpdater *updater = [IGListAdapterUpdater new];
    IGListAdapter *listAdapter = [[IGListAdapter alloc] initWithUpdater:updater viewController:self];
    listAdapter.dataSource = self;
    listAdapter.collectionView = collectionView;
    _listAdapter = listAdapter;
}

- (void)viewDidLayoutSubviews {
    _collectionView.frame = self.view.bounds;
}

#pragma mark - Adding characters

- (void)_didTapAdd {
    UIAlertController * const alertController = [UIAlertController alertControllerWithTitle:@"Add character"
                                                                                    message:@"Select a region"
                                                                             preferredStyle:UIAlertControllerStyleActionSheet];
    for (UIAlertAction * const regionAction in [self _regionAlertActions]) {
        [alertController addAction:regionAction];
    }
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)_presentAddCharacterForRegion:(NSString *)region {
    UIAlertController * const alertController = [UIAlertController alertControllerWithTitle:@"Add character"
                                                                                    message:@"Enter your character name and realm name"
                                                                             preferredStyle:UIAlertControllerStyleAlert];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Name";
    }];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Realm";
    }];
    UIAlertAction * const addAction = [UIAlertAction actionWithTitle:@"Add" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"Tapped add");
    }];
    [alertController addAction:addAction];
    UIAlertAction * const cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"Cancelled");
    }];
    [alertController addAction:cancelAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (NSArray<UIAlertAction *> *)_regionAlertActions {
    UIAlertAction * const unitedStates = [UIAlertAction actionWithTitle:@"US" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self _presentAddCharacterForRegion:@"us"];
    }];
    UIAlertAction * const europe = [UIAlertAction actionWithTitle:@"EU" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self _presentAddCharacterForRegion:@"eu"];
    }];
    UIAlertAction * const korea = [UIAlertAction actionWithTitle:@"KR" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self _presentAddCharacterForRegion:@"kr"];
    }];
    UIAlertAction * const taiwan = [UIAlertAction actionWithTitle:@"TW" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self _presentAddCharacterForRegion:@"tw"];
    }];
    return @[unitedStates, europe, korea, taiwan];
}

#pragma mark - IGListAdapterDataSource

- (NSArray<id <IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    return [_characterCache.favoriteCharacterIdentifiers rio_map:^RIOCharacterPreviewViewModel *(RIOCharacterID *characterID) {
        RIOCharacter * const character = [self->_characterCache characterWithID:characterID];
        if (character != nil) {
            return [[RIOCharacterPreviewViewModel alloc] initWithRegion:character.region
                                                                   name:character.name
                                                                  realm:character.realm
                                                                  guild:character.guild.name
                                                           thumbnailURL:character.thumbnailURL];
        } else {
            return [[RIOCharacterPreviewViewModel alloc] initWithRegion:characterID.region
                                                                   name:characterID.name
                                                                  realm:characterID.realm
                                                                  guild:@"Loading..."
                                                           thumbnailURL:nil];
        }
    }];
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    if ([object isKindOfClass:[RIOCharacterPreviewViewModel class]]) {
        return [RIOCharacterPreviewSectionController new];
    } else {
        NSAssert(false, @"Unable to find a matching section controller for %@", object);
        return nil;
    }
}

- (nullable UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}

#pragma mark - RIOCharacterCacheListener

- (void)characterCacheDidUpdate {
    [_listAdapter performUpdatesAnimated:YES completion:nil];
}

@end
