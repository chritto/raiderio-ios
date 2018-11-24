//
//  RIOUserSession.m
//  RaiderIO
//
//  Created by Chris McGrath on 11/21/18.
//  Copyright © 2018 Chris McGrath. All rights reserved.
//

#import "RIOUserSession.h"

#import "RIOCharacterService.h"
#import "RIOImageDownloader.h"

@implementation RIOUserSession {
    RIOCharacterService *_characterService;
    RIOImageDownloader *_imageDownloader;
}

- (RIOCharacterService *)characterService {
    if (_characterService == nil) {
        _characterService = [RIOCharacterService new];
    }
    return _characterService;
}

- (RIOImageDownloader *)imageDownloader {
    if (_imageDownloader == nil) {
        _imageDownloader = [RIOImageDownloader new];
    }
    return _imageDownloader;
}

@end
