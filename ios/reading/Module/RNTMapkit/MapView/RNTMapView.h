//
//  RNTMapView.h
//  reading
//
//  Created by Devin on 2021/1/25.
//

#import <React/RCTComponent.h>
#import <BaiduMapAPI_Map/BMKMapView.h>

NS_ASSUME_NONNULL_BEGIN

@interface RNTMapView : BMKMapView<BMKMapViewDelegate>

@property(nonatomic, copy) RCTBubblingEventBlock onBaiduMapLoad;
@property(nonatomic, copy) RCTBubblingEventBlock onBaiduMapClick;
@property(nonatomic, copy) RCTBubblingEventBlock onBaiduMapLongClick;
@property(nonatomic, copy) RCTBubblingEventBlock onBaiduMapDoubleClick;
@property(nonatomic, copy) RCTBubblingEventBlock onBaiduMapStatusChange;

@end

NS_ASSUME_NONNULL_END
