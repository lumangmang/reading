//
//  RCTSportNode.h
//  reading
//
//  Created by Devin on 2021/2/25.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCTSportNode : NSObject

/// 经纬度
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
/// 方向
@property (nonatomic, assign) CGFloat direction;
/// 距离
@property (nonatomic, assign) CGFloat distance;
/// 动画时间
@property (nonatomic, assign) CGFloat duration;

@end

NS_ASSUME_NONNULL_END
