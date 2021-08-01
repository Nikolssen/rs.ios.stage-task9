//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Ivan Budovich
// On: 7/29/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ColorsViewController : UIViewController
@property (nonatomic, copy, nullable) void (^colorSetter)(UIColor*, NSString*);
- (void)setColor:(NSString*) color;
@end

NS_ASSUME_NONNULL_END
