//
//  RIOCharacterViewController.h
//  RaiderIO
//
//  Created by Chris McGrath on 11/4/18.
//  Copyright © 2018 Chris McGrath. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RIOMacros.h"
#import "RIOCharacter.h"

NS_ASSUME_NONNULL_BEGIN

@interface RIOCharacterViewController : UIViewController

- (instancetype)initWithCharacter:(RIOCharacter *)character;

RIO_VIEWCONTROLLER_INIT_UNAVAILABLE

@end

NS_ASSUME_NONNULL_END
