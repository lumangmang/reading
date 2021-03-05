//
//  RCTSportAnnotationView.h
//  reading
//
//  Created by Devin on 2021/2/25.
//

#import <BaiduMapAPI_Map/BMKMapComponent.h>

typedef void (^Completion)(void);
@class RCTSportNode;

NS_ASSUME_NONNULL_BEGIN

@interface RCTSportAnnotationView : BMKAnnotationView

@property (nonatomic, strong) NSArray<RCTSportNode *> *sportNodes;
@property (nonatomic, copy) Completion completion;

- (void)startAnimation;
- (void)pauseAnimation;
- (void)stopAnimation;

@end

NS_ASSUME_NONNULL_END
