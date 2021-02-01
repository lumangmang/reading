//
//  RNTHeatMap.h
//  reading
//
//  Created by Devin on 2021/2/1.
//

#import <React/RCTView.h>
#import <BaiduMapAPI_Map/BMKHeatMap.h>

NS_ASSUME_NONNULL_BEGIN

@interface RNTHeatMap : RCTView

- (BMKHeatMap *)heatMap;

@end

NS_ASSUME_NONNULL_END
