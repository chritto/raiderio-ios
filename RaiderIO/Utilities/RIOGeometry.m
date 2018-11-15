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
