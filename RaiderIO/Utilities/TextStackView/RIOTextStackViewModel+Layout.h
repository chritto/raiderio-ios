//
//  RIOTextStackViewModel+Layout.h
//  RaiderIO
//
//  Created by Chris McGrath on 11/14/18.
//  Copyright © 2018 Chris McGrath. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "RIOTextStackViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface RIOTextStackViewModel (Layout)

- (NSArray<NSValue *> *)textFramesWithConstrainingSize:(CGSize)constrainingSize;

- (CGSize)sizeWithConstrainingSize:(CGSize)constrainingSize;

@end

NS_ASSUME_NONNULL_END
