//
//  RIOCharacterService.m
//  RaiderIO
//
//  Created by Chris McGrath on 11/3/18.
//  Copyright © 2018 Chris McGrath. All rights reserved.
//

#import "RIOCharacterService.h"

#import "RIOCharacter.h"
#import "RIOCharacterID.h"
#import "RIOGuild.h"
#import "RIOMythicPlusScores.h"

static NSString * const baseURLString = @"https://raider.io/api/v1/characters/profile";

@implementation RIOCharacterService {
    NSURLSession *_urlSession;
}

- (instancetype)init {
    if (self = [super init]) {
        _urlSession = [NSURLSession sharedSession];
    }
    return self;
}

- (void)fetchCharacterWithID:(RIOCharacterID *)characterID
                  completion:(RIOCharacterServiceFetchCompletionBlock)completion {
    NSURLRequest * const request = characterRequest(characterID);
    [[_urlSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        RIOCharacter * const character = (error
                                          ? nil
                                          : characterFromDictionary([NSJSONSerialization JSONObjectWithData:data
                                                                                                    options:NSJSONReadingAllowFragments
                                                                                                      error:nil]));
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"Loaded details for %@-%@", characterID.name, characterID.realm);
            completion(character);
        });
    }] resume];
}

- (void)fetchThumbnailWithURL:(NSURL *)url
                   completion:(RIOCharacterServiceThumbnailCompletionBlock)completion {
    [[_urlSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        UIImage * const image = (data
                                 ? [UIImage imageWithData:data]
                                 : nil);
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(image);
        });
    }] resume];
}

#pragma mark - Private

NSURLRequest *characterRequest(RIOCharacterID *characterID) {
    NSString * const urlString = [NSString stringWithFormat:@"%@?region=%@&realm=%@&name=%@&fields=mythic_plus_best_runs:all,guild,mythic_plus_scores", baseURLString, characterID.region, characterID.realm, characterID.name];
    return [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
}

RIOCharacter *characterFromDictionary(NSDictionary *response) {
    NSString * const name = response[@"name"];
    NSString * const race = response[@"race"];
    NSString * const class = response[@"class"];
    NSString * const activeSpecName = response[@"active_spec_name"];
    NSString * const activeSpecRole = response[@"active_spec_role"];
    NSString * const gender = response[@"gender"];
    NSString * const faction = response[@"faction"];
    NSInteger const  achievementPoints = [response[@"achievement_points"] integerValue];
    NSInteger const honorableKills = [response[@"honorable_kills"] integerValue];
    NSURL * const thumbnailURL = [NSURL URLWithString:response[@"thumbnail_url"]];
    NSString * const region = response[@"region"];
    NSString * const realm = response[@"realm"];
    NSURL * const profileURL = [NSURL URLWithString:response[@"profile_url"]];
    RIOGuild * const guild = guildFromDictionary(response[@"guild"]);
    RIOMythicPlusScores * const mythicPlusScores = mythicPlusScoresFromDictionary(response[@"mythic_plus_scores"]);
    return [[RIOCharacter alloc] initWithName:name
                                         race:race
                               characterClass:class
                               activeSpecName:activeSpecName
                               activeSpecRole:activeSpecRole
                                       gender:gender
                                      faction:faction
                            achievementPoints:achievementPoints
                               honorableKills:honorableKills
                                 thumbnailURL:thumbnailURL
                                       region:region
                                        realm:realm
                                   profileURL:profileURL
                                        guild:guild
                             mythicPlusScores:mythicPlusScores];
}

RIOGuild *guildFromDictionary(NSDictionary *response) {
    NSString * const name = response[@"name"];
    NSString * const realm = response[@"realm"];
    return [[RIOGuild alloc] initWithName:name
                                    realm:realm];
}

RIOMythicPlusScores *mythicPlusScoresFromDictionary(NSDictionary *response) {
    const NSInteger all = [response[@"all"] integerValue];
    const NSInteger dps = [response[@"dps"] integerValue];
    const NSInteger healer = [response[@"healer"] integerValue];
    const NSInteger tank = [response[@"tank"] integerValue];
    return [[RIOMythicPlusScores alloc] initWithAll:all
                                                dps:dps
                                             healer:healer
                                               tank:tank];
}

@end
