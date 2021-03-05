//
//  UIColor+Ex.h
//  reading
//
//  Created by Devin on 2021/3/4.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Ex)

+ (UIColor *)HexColor:(NSString *)hexValue;

+ (NSArray *)Colors:(NSArray <NSString *> *)colors;

@end

NS_ASSUME_NONNULL_END
