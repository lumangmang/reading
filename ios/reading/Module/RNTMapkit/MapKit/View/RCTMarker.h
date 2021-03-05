//
//  RCTMarker.h
//  reading
//
//  Created by Devin on 2021/3/4.
//

#import "RCTMapView.h"
#import <React/RCTUIManager.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCTMarker : BMKAnnotationView<BMKAnnotation>

@property(nonatomic, copy) RCTBubblingEventBlock onClick;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

- (BMKAnnotationView *)annotationView;

@end

NS_ASSUME_NONNULL_END
