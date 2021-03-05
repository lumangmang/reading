//
//  RCTOverlay.h
//  reading
//
//  Created by Devin on 2021/3/3.
//

#import <BaiduMapAPI_Map/BMKOverlayView.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCTOverlay : UIView

- (id <BMKOverlay>)overlay;
- (BMKOverlayView *)overlayView;

@end

NS_ASSUME_NONNULL_END
