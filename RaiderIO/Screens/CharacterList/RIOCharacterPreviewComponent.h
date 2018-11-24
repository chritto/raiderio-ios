//
//  RIOCharacterPreviewComponent.h
//  RaiderIO
//
//  Created by Chris McGrath on 11/19/18.
//  Copyright © 2018 Chris McGrath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ComponentKit/CKCompositeComponent.h>

@class RIOCharacterPreviewViewModel;
@class RIOUserSession;

NS_ASSUME_NONNULL_BEGIN

@interface RIOCharacterPreviewComponent : CKCompositeComponent

+ (instancetype)newWithViewModel:(RIOCharacterPreviewViewModel *)viewModel
                     userSession:(RIOUserSession *)session;

@end

NS_ASSUME_NONNULL_END
