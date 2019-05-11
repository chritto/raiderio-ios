/**
 * This file is generated using the remodel generation script.
 * The name of the input file is RIOTextStackViewModel.value
 */

#import <Foundation/Foundation.h>
#import "RIOTextStackView.h"

@interface RIOTextStackViewModel : NSObject <NSCopying>

@property (nonatomic, readonly, copy) NSArray<NSAttributedString *> *texts;
@property (nonatomic, readonly) RIOTextStackViewDirection direction;

+ (instancetype)new NS_UNAVAILABLE;

- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithTexts:(NSArray<NSAttributedString *> *)texts direction:(RIOTextStackViewDirection)direction NS_DESIGNATED_INITIALIZER;

@end

