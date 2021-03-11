//
//  RCTCircle.h
//  reading
//
//  Created by Devin on 2021/3/10.
//

#import "RCTOverlay.h"

NS_ASSUME_NONNULL_BEGIN

@interface RCTCircle : RCTOverlay

@property (nonatomic, assign) CLLocationCoordinate2D circleCenter;
@property (nonatomic, assign) double radius;
@property (nonatomic, assign) CGFloat strokeWidth;
@property (nonatomic, strong) UIColor *strokeColor;
@property (nonatomic, strong) UIColor *fillColor;

@end

NS_ASSUME_NONNULL_END
