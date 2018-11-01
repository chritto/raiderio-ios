//
//  RIORootViewController.m
//  RaiderIO
//
//  Created by Chris McGrath on 10/29/18.
//  Copyright © 2018 Chris McGrath. All rights reserved.
//

#import "RIORootViewController.h"

#import "RIOCharacterListViewController.h"

@implementation RIORootViewController {
    RIOCharacterListViewController *_characterListViewController;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    _characterListViewController = [[RIOCharacterListViewController alloc] init];
    [self addChildViewController:_characterListViewController];
    [self.view addSubview:_characterListViewController.view];
    [_characterListViewController didMoveToParentViewController:self];
}

- (void)viewDidLayoutSubviews {
    _characterListViewController.view.frame = self.view.bounds;
}

@end
