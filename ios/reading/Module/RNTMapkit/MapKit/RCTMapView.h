//
//  RCTMapView.h
//  reading
//
//  Created by Devin on 2021/2/6.
//

#import <React/RCTUIManager.h>
#import <BaiduMapAPI_Map/BMKMapView.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCTMapView : BMKMapView <BMKMapViewDelegate>

@property (nonatomic, copy) RCTBubblingEventBlock onClick;

@end

NS_ASSUME_NONNULL_END
