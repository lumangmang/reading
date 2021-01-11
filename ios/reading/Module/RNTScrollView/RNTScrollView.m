//
//  RNTScrollView.m
//  reading
//
//  Created by Devin on 2021/1/11.
//

#import "RNTScrollView.h"

#import <SDCycleScrollView/SDCycleScrollView.h>

@interface RNTScrollView ()<SDCycleScrollViewDelegate>

@property (nonatomic, strong) SDCycleScrollView *scrollView;

@end

@implementation RNTScrollView

- (instancetype)initWithFrame:(CGRect)frame {
  if (self = [super initWithFrame:frame]) {
    [self addSubview:self.scrollView];
  }
  return self;
}

- (void)layoutSubviews {
  [super layoutSubviews];
  self.scrollView.frame = self.bounds;
}

- (SDCycleScrollView *)scrollView {
  if (!_scrollView) {
    _scrollView = [[SDCycleScrollView alloc] init];
    _scrollView.showPageControl = YES;
    _scrollView.autoScroll = YES;
    _scrollView.delegate = self;
  }
  return _scrollView;
}

- (void)setAutoScrollTimeInterval:(CGFloat)autoScrollTimeInterval {
  _autoScrollTimeInterval = autoScrollTimeInterval;
  self.scrollView.autoScrollTimeInterval = autoScrollTimeInterval;
}

- (void)setAutoScroll:(BOOL)autoScroll {
  _autoScroll = autoScroll;
  self.scrollView.autoScroll = autoScroll;
}

- (void)setImageURLStringsGroup:(NSArray *)imageURLStringsGroup {
  _imageURLStringsGroup = imageURLStringsGroup;
  self.scrollView.imageURLStringsGroup = imageURLStringsGroup;
}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
  if (self.onClick) {
    self.onClick(@{
      @"index": @(index)
                 });
  }
}

@end
