//
//  RNTMarker.h
//  reading
//
//  Created by Devin on 2021/1/28.
//

#import "RNTMapView.h"
#import <BaiduMapAPI_Map/BMKAnnotationView.h>

NS_ASSUME_NONNULL_BEGIN

@interface RNTMarker : BMKAnnotationView<BMKAnnotation>

@property(nonatomic, copy) RCTBubblingEventBlock onBaiduMapPress;
@property(nonatomic, copy) RCTBubblingEventBlock onBaiduMapCalloutPress;
@property(nonatomic, copy) RCTBubblingEventBlock onBaiduMapDragStart;
@property(nonatomic, copy) RCTBubblingEventBlock onBaiduMapDrag;
@property(nonatomic, copy) RCTBubblingEventBlock onBaiduMapDragEnd;

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;

@property (nonatomic, weak) RNTMapView *mapView;
- (BMKAnnotationView *)annotationView;

- (void)bindCalloutPressHandler;
- (void)setSelected:(BOOL)selected;

@end

NS_ASSUME_NONNULL_END
