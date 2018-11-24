//
//  RIOImageDownloader.m
//  RaiderIO
//
//  Created by Chris McGrath on 11/21/18.
//  Copyright © 2018 Chris McGrath. All rights reserved.
//

#import "RIOImageDownloader.h"

@implementation RIOImageDownloader {
    NSURLSession *_urlSession;
}

- (instancetype)init {
    if (self = [super init]) {
        _urlSession = [NSURLSession sharedSession];
    }
    return self;
}

- (id)fetchImageWithURL:(NSURL *)url
               completion:(RIOImageDownloaderCompletionBlock)completion {
    NSURLSessionDataTask * const task = [_urlSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        UIImage * const image = (data
                                 ? [UIImage imageWithData:data]
                                 : nil);
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(image);
        });
    }];
    [task resume];
    return task;
}

#pragma mark - CKImageDownloader

- (NSURLSessionDataTask *)downloadImageWithURL:(NSURL *)URL
                    caller:(id)caller
             callbackQueue:(dispatch_queue_t)callbackQueue
     downloadProgressBlock:(void (^)(CGFloat progress))downloadProgressBlock
                completion:(void (^)(CGImageRef image, NSError *error))completion {
    return [self fetchImageWithURL:URL completion:^(UIImage * _Nullable image) {
        completion(image.CGImage, nil);
    }];
}

- (void)cancelImageDownload:(NSURLSessionDataTask *)download {
    [download cancel];
}

@end
