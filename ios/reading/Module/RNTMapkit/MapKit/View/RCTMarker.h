//
//  RCTMarker.h
//  reading
//
//  Created by Devin on 2021/3/4.
//

#import "RCTMapView.h"

NS_ASSUME_NONNULL_BEGIN

@interface RCTMarker : BMKAnnotationView<BMKAnnotation>

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *imageURLString;
@property (nonatomic, assign) int markerId;

- (BMKAnnotationView *)annotationView;

@end

NS_ASSUME_NONNULL_END
