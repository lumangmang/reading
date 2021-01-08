//
//  RNTMapView.h
//  reading
//
//  Created by Devin on 2021/1/8.
//

#import <React/RCTViewManager.h>
#import <BaiduMapAPI_Map/BMKMapView.h>

NS_ASSUME_NONNULL_BEGIN

@interface RNTMapView : BMKMapView<BMKMapViewDelegate>

// RCTBubblingEventBlock 是要导出的事件属性
// 或者RCTDirectEventBlock
// 用于将输入事件处理程序从JS映射到视图属性
// 以on开头，类似JS的事件命名规范
// onBaiduMapStatusChange地图状态改变的回调
@property (nonatomic, copy) RCTBubblingEventBlock onBaiduMapStatusChange;
@property (nonatomic, copy) RCTBubblingEventBlock onBaiduMapLoad;
@property (nonatomic, copy) RCTBubblingEventBlock onBaiduMapClick;
@property (nonatomic, copy) RCTBubblingEventBlock onBaiduMapLongClick;
@property (nonatomic, copy) RCTBubblingEventBlock onBaiduMapDoubleClick;

@end

NS_ASSUME_NONNULL_END
