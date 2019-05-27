//
//  RIOCharacterHeaderCell.h
//  RaiderIO
//
//  Created by Chris McGrath on 5/12/19.
//  Copyright © 2019 Chris McGrath. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RIOCharacterHeaderViewModel;

NS_ASSUME_NONNULL_BEGIN

@interface RIOCharacterHeaderCell : UICollectionViewCell

- (void)configureWithViewModel:(RIOCharacterHeaderViewModel *)viewModel;

@end

NS_ASSUME_NONNULL_END
