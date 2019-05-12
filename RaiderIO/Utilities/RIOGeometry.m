//
//  RIOGeometry.m
//  RaiderIO
//
//  Created by Chris McGrath on 11/15/18.
//  Copyright © 2018 Chris McGrath. All rights reserved.
//

#import "RIOGeometry.h"

CGRect CGRectMakeWithOrigin(CGPoint origin, CGSize size) {
    return CGRectMake(origin.x, origin.y, size.width, size.height);
}

CGPoint CGRectGetCLPoint(CGRect rect) {
    return CGPointMake(rect.origin.x,
                       rect.origin.y + rect.size.height/2);
}

CGPoint CGRectGetCRPoint(CGRect rect) {
    return CGPointMake(rect.origin.x + rect.size.width,
                       rect.origin.y + rect.size.height/2);
}

CGPoint CGRectGetTLPoint(CGRect rect) {
    return rect.origin;
}

CGPoint CGRectGetTCPoint(CGRect rect) {
    return CGPointMake(rect.origin.x + rect.size.width/2,
                       rect.origin.y);
}

CGPoint CGRectGetTRPoint(CGRect rect) {
    return CGPointMake(rect.origin.x + rect.size.width,
                       rect.origin.y);
}

CGPoint CGRectGetBLPoint(CGRect rect) {
    return CGPointMake(rect.origin.x,
                       rect.origin.y + rect.size.height);
}

CGPoint CGRectGetBCPoint(CGRect rect) {
    return CGPointMake(rect.origin.x + rect.size.width/2,
                       rect.origin.y + rect.size.height);
}

CGPoint CGRectGetBRPoint(CGRect rect) {
    return CGPointMake(rect.origin.x + rect.size.width,
                       rect.origin.y + rect.size.height);
}

CGPoint CGPointTranslate(CGPoint point, CGPoint translation) {
    return CGPointMake(point.x + translation.x, point.y + translation.y);
}

