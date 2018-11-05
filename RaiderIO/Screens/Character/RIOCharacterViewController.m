//
//  RIOCharacterViewController.m
//  RaiderIO
//
//  Created by Chris McGrath on 11/4/18.
//  Copyright © 2018 Chris McGrath. All rights reserved.
//

#import "RIOCharacterViewController.h"

#import "RIOCharacterService.h"

@implementation RIOCharacterViewController {
    RIOCharacter *_character;
    RIOCharacterService *_characterService;

    UIView *_nameView;
    UIView *_guildView;
    UIView *_realmView;
    UIView *_thumbnailView;
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
    self.view.backgroundColor = [UIColor redColor];

    _nameView = makeNameView(_character);
    [self.view addSubview:_nameView];

    _guildView = makeGuildView(_character);
    [self.view addSubview:_guildView];

    _realmView = makeRealmView(_character);
    [self.view addSubview:_realmView];

    _thumbnailView = makeThumbnail(_characterService, _character);
    [self.view addSubview:_thumbnailView];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

    CGFloat const contentWidth = CGRectGetWidth(self.view.frame);

    [_nameView sizeToFit];
    [_guildView sizeToFit];
    [_realmView sizeToFit];

    CGFloat const thumbnailHeight = (CGRectGetHeight(_nameView.frame)
                                     + CGRectGetHeight(_nameView.frame)
                                     + CGRectGetHeight(_nameView.frame));
    CGFloat yPos = (CGRectGetHeight([UIApplication sharedApplication].statusBarFrame)
                    + CGRectGetHeight(self.navigationController.navigationBar.frame));
    CGRect const thumbnailFrame = CGRectIntegral(CGRectMake(0,
                                                            yPos,
                                                            thumbnailHeight,
                                                            thumbnailHeight));
    CGFloat const xPos = CGRectGetMaxX(thumbnailFrame);
    _nameView.frame = CGRectMake(xPos,
                                 yPos,
                                 contentWidth - xPos,
                                 CGRectGetHeight(_nameView.frame));
    yPos += CGRectGetHeight(_nameView.frame);
    _guildView.frame = CGRectMake(xPos,
                                  yPos,
                                  contentWidth - xPos,
                                  CGRectGetHeight(_guildView.frame));
    yPos += CGRectGetHeight(_guildView.frame);
    _realmView.frame = CGRectMake(xPos,
                                  yPos,
                                  contentWidth - xPos,
                                  CGRectGetHeight(_realmView.frame));
    _thumbnailView.frame = thumbnailFrame;
}

#pragma mark - Private

UIView *makeNameView(RIOCharacter *character) {
    UILabel *label = [UILabel new];
    label.text = character.name;
    return label;
}

UIView *makeGuildView(RIOCharacter *character) {
    UILabel *label = [UILabel new];
    label.text = [NSString stringWithFormat:@"<%@>", character.guild.name];
    return label;
}

UIView *makeRealmView(RIOCharacter *character) {
    UILabel *label = [UILabel new];
    label.text = [NSString stringWithFormat:@"(%@) %@", character.region, character.realm];
    return label;
}

UIView *makeThumbnail(RIOCharacterService *service, RIOCharacter *character) {
    UIImageView *imageView = [UIImageView new];
    [service fetchThumbnailForCharacter:character completion:^(UIImage * _Nullable image) {
        imageView.image = image;
    }];
    return imageView;
}

@end
