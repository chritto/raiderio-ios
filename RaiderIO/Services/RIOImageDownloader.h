//
//  RIOImageDownloader.h
//  RaiderIO
//
//  Created by Chris McGrath on 11/21/18.
//  Copyright © 2018 Chris McGrath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ComponentKit/CKNetworkImageDownloading.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^RIOImageDownloaderCompletionBlock)(UIImage * _Nullable image);

@interface RIOImageDownloader : NSObject <CKNetworkImageDownloading>

/**
 * @return An opaque identifier for the image download.
 */
- (id)fetchImageWithURL:(NSURL *)url
             completion:(RIOImageDownloaderCompletionBlock)completion;

@end

NS_ASSUME_NONNULL_END
