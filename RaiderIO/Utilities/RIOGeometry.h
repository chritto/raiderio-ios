//
//  RIOGeometry.h
//  RaiderIO
//
//  Created by Chris McGrath on 11/15/18.
//  Copyright © 2018 Chris McGrath. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

CGRect CGRectMakeWithOrigin(CGPoint origin, CGSize size);

CGPoint CGRectGetCLPoint(CGRect rect);

CGPoint CGRectGetCRPoint(CGRect rect);

CGPoint CGRectGetTLPoint(CGRect rect);

CGPoint CGRectGetTCPoint(CGRect rect);

CGPoint CGRectGetTRPoint(CGRect rect);

CGPoint CGRectGetBLPoint(CGRect rect);

CGPoint CGRectGetBCPoint(CGRect rect);

CGPoint CGRectGetBRPoint(CGRect rect);

CGPoint CGPointTranslate(CGPoint point, CGPoint translation);

NS_ASSUME_NONNULL_END
