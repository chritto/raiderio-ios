//
//  RIOCharacterCell.h
//  RaiderIO
//
//  Created by Chris McGrath on 10/31/18.
//  Copyright © 2018 Chris McGrath. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RIOCharacterPreviewViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface RIOCharacterPreviewCell : UICollectionViewCell

- (void)configureWithViewModel:(RIOCharacterPreviewViewModel *)viewModel;

@end

NS_ASSUME_NONNULL_END
