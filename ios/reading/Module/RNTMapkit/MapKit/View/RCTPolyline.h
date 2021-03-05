//
//  RCTPolyline.h
//  reading
//
//  Created by Devin on 2021/3/3.
//

#import "RCTOverlay.h"

NS_ASSUME_NONNULL_BEGIN

@interface RCTPolyline : RCTOverlay

/// 线段单色
@property (nonatomic, strong) UIColor *color;
/// 线段分颜色数组
@property (nonatomic, strong) NSArray *colors;
/// 点集合
@property (nonatomic, strong) NSArray *points;
/// 线宽
@property (nonatomic, assign) CGFloat width;
/// 纹理(颜色)索引
@property (nonatomic, strong) NSArray <NSNumber *> *textureIndex;

@end

NS_ASSUME_NONNULL_END
