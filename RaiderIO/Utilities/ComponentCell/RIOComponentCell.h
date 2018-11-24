//
//  RIOComponentCell.h
//  RaiderIO
//
//  Created by Chris McGrath on 10/31/18.
//  Copyright © 2018 Chris McGrath. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class CKComponent;

@interface RIOComponentCell : UICollectionViewCell

- (void)configureWithComponent:(CKComponent *)component;

@end

NS_ASSUME_NONNULL_END
