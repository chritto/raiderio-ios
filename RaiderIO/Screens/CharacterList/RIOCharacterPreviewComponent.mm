//
//  RIOCharacterPreviewComponent.m
//  RaiderIO
//
//  Created by Chris McGrath on 11/19/18.
//  Copyright © 2018 Chris McGrath. All rights reserved.
//

#import "RIOCharacterPreviewComponent.h"

#import <ComponentKit/ComponentKit.h>

#import "RIOCharacterPreviewViewModel.h"
#import "RIOUserSession.h"
#import "RIOImageDownloader.h"

@implementation RIOCharacterPreviewComponent

+ (instancetype)newWithViewModel:(RIOCharacterPreviewViewModel *)viewModel
                     userSession:(RIOUserSession *)session {
    return [super newWithComponent:
            [CKFlexboxComponent
             newWithView:{}
             size: {}
             style: {
                 .direction = CKFlexboxDirectionRow,
                 .alignItems = CKFlexboxAlignItemsCenter,
                 .justifyContent = CKFlexboxJustifyContentSpaceBetween,
                 .padding = {8, 0, 8, 8},
             }
             children: {
                 { .component = [CKFlexboxComponent
                                 newWithView:{}
                                 size:{}
                                 style:{
                                     .direction = CKFlexboxDirectionRow,
                                     .spacing = 8
                                 }
                                 children:{
                                     { .component = thumbnailComponent(viewModel.thumbnailURL, session.imageDownloader) },
                                     { .component = descriptionComponent(viewModel) }
                                 }]
                 },
                 { .component = [CKLabelComponent
                                 newWithLabelAttributes:{
                                     .string = viewModel.score,
                                     .font = [UIFont systemFontOfSize:17]
                                 }
                                 viewAttributes:{}
                                 size:{}]
                 }
             }]];
}

# pragma mark - Helpers

static CKComponent *descriptionComponent(RIOCharacterPreviewViewModel *viewModel) {
    return [CKFlexboxComponent
            newWithView:{}
            size:{}
            style:{
                .direction = CKFlexboxDirectionColumn,
                .justifyContent = CKFlexboxJustifyContentCenter
            }
            children:{
                { .component = basicLabelComponent(viewModel.characterID.name) },
                { .component = basicLabelComponent(viewModel.guild) },
                { .component = basicLabelComponent(viewModel.characterID.realm) }
            }];
}

static CKComponent *basicLabelComponent(NSString *text) {
    return [CKLabelComponent
                      newWithLabelAttributes:{
                          .string = text,
                          .font = [UIFont systemFontOfSize:17]
                      }
                      viewAttributes:{}
                      size:{}];
}

static CKComponent *thumbnailComponent(NSURL *url, id<CKNetworkImageDownloading> imageDownloader) {
    return [CKNetworkImageComponent
           newWithURL:url
           imageDownloader:imageDownloader
           size:{
               .width = 60,
               .height = 60
           }
           options:{}
           attributes:{ {@selector(setContentMode:), @(UIViewContentModeScaleAspectFit)} }];
}

@end
