//
//  RNTOverlayView.h
//  reading
//
//  Created by Devin on 2021/1/8.
//

#import <BaiduMapAPI_Map/BMKMapView.h>

NS_ASSUME_NONNULL_BEGIN

@interface RNTOverlayView : UIView

- (BOOL)ownOverlay:(id<BMKOverlay>)overlay;
- (void)update;

@end

NS_ASSUME_NONNULL_END
