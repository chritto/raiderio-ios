//
//  RIODungeonSectionController.h
//  RaiderIO
//
//  Created by Chris McGrath on 5/26/19.
//  Copyright © 2019 Chris McGrath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <IGListKit/IGListKit.h>

@class RIODungeonViewModel;

NS_ASSUME_NONNULL_BEGIN

@interface RIODungeonSectionController : IGListGenericSectionController<RIODungeonViewModel *>

@end

NS_ASSUME_NONNULL_END
