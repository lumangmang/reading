//
//  RNTScrollView.h
//  reading
//
//  Created by Devin on 2021/1/11.
//

#import <React/RCTViewManager.h>

NS_ASSUME_NONNULL_BEGIN

@interface RNTScrollView : UIView

@property (nonatomic, assign) CGFloat autoScrollTimeInterval;
@property (nonatomic, strong) NSArray *imageURLStringsGroup;
@property (nonatomic, assign) BOOL autoScroll;

@property (copy, nonatomic) RCTBubblingEventBlock onClick;

@end

NS_ASSUME_NONNULL_END
