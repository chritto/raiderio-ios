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
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
}

@end
