//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Admin
// On: 29.07.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SettingsViewController : UIViewController
@property (nonatomic, copy, nullable) void (^colorSetter)(UIColor*);
@property (nonatomic, copy, nullable) void (^shouldAnimateSetter)(BOOL);
@end

NS_ASSUME_NONNULL_END
