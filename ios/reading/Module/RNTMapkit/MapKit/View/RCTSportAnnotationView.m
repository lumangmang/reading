//
//  RCTSportAnnotationView.m
//  reading
//
//  Created by Devin on 2021/2/25.
//

#import "RCTSportNode.h"

#import "RCTSportAnnotationView.h"

@interface RCTSportAnnotationView () {
  // 当前结点索引值
  NSInteger _currentIndex;
  // 标识动画状态 (0:动画未开始 1:动画中 2:动画暂停 3:动画完成)
  NSInteger _animationState;
}

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation RCTSportAnnotationView

- (instancetype)initWithAnnotation:(id<BMKAnnotation>)annotation
                   reuseIdentifier:(NSString *)reuseIdentifier {
  if (self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier]) {
    self.bounds = CGRectMake(0.f, 0.f, 22.f, 22.f);
    self.draggable = NO;
    [self addSubview:self.imageView];
    _currentIndex = 1;
    _animationState = 0;
  }
  return self;
}

- (void)startAnimation {
  switch (_animationState) {
      case 0:
          [self running]; break;
      case 1: break;
      case 2: [self resume]; break;
      case 3:
          [self reset];
          [self running]; break;
  }
}

- (void)pauseAnimation {
  _animationState = 2;
  CFTimeInterval pauseTime = [self.layer convertTime:CACurrentMediaTime() fromLayer:nil];
  self.layer.timeOffset = pauseTime;
  self.paopaoView.layer.timeOffset = pauseTime;
  self.layer.speed = 0;
  self.paopaoView.layer.speed = 0;
}

- (void)stopAnimation {
  _animationState = 0;
  [self.layer removeAllAnimations];
  [self.paopaoView.layer removeAnimationForKey:@"position"];
  [self reset];
}

// MARK: - Private Method
- (void)resume
{
    CFTimeInterval pauseTime = self.layer.timeOffset;
    CFTimeInterval timeSincePause = CACurrentMediaTime() - pauseTime;
    self.layer.timeOffset = 0;
    self.paopaoView.layer.timeOffset = 0;
    self.layer.beginTime = timeSincePause;
    self.paopaoView.layer.beginTime = timeSincePause;
    self.layer.speed = 1;
    self.paopaoView.layer.speed = 1;
    
    _animationState = 1;
}

- (void)running {
  _animationState = 1;
  if (_currentIndex == _sportNodes.count) {
    _animationState = 3;
    if (self.completion) self.completion(); return;
  }
  
  RCTSportNode *next = _sportNodes[_currentIndex];
  
  [UIView animateWithDuration:0.1
                        delay:0.0 options:UIViewAnimationOptionCurveLinear | UIViewAnimationOptionAllowUserInteraction animations:^(void) {
    self.annotation.coordinate = next.coordinate;
    
  } completion:^(BOOL finished) {
      if (self->_animationState == 1) {
          self->_currentIndex ++;
          __weak id weakSelf = self;
          [[NSOperationQueue mainQueue] addOperationWithBlock:^{
              [weakSelf running];
          }];
      }
  }];
}

- (void)reset {
  _currentIndex = 1;
  RCTSportNode *node = [_sportNodes firstObject];
  self.annotation.coordinate = node.coordinate;
  self.layer.timeOffset = 0;
  self.paopaoView.layer.timeOffset = 0;
  self.layer.beginTime = 0;
  self.paopaoView.layer.beginTime = 0;
  self.layer.speed = 1;
  self.paopaoView.layer.speed = 1;
  _animationState = 0;
}

// MARK: - Setter & Getter
- (void)setSportNodes:(NSArray<RCTSportNode *> *)sportNodes {
  _sportNodes = sportNodes;
}

- (UIImageView *)imageView {
  if (!_imageView) {
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.f, 0.f, 22.f, 22.f)];
    _imageView.image = [UIImage imageNamed:@"map_replay_play"];
  }
  return _imageView;
}

@end
