//
//  NativeView.m
//  reading
//
//  Created by Devin on 2021/1/6.
//

#import "NativeView.h"

#import <React/RCTViewManager.h>

@interface NativeView ()

@property(nonatomic, strong) NSString * title;
@property(nonatomic, strong) UITextView *contentTextView;
@property(nonatomic, strong) UIButton *button;
@property(nonatomic, strong) RCTBubblingEventBlock onClick;

@end

@implementation NativeView

- (instancetype)init {
  self = [super init];
  if (self) {
    self.backgroundColor = UIColor.blueColor;
  }
  [self initSubView];
  [self initLayout];
  return self;
}

-(void)initSubView{
  [self addSubview:self.contentTextView];
  [self addSubview:self.button];
}

-(void)initLayout{
  self.contentTextView.frame = CGRectMake(20, 20, 200, 200);
  self.button.frame = CGRectMake(20, 240, 80, 40);
}

- (void)nativeMethod:(NSDictionary *)object {
  NSLog(@"调用了原生模块 %@", object);
}

- (void)onClick: (id)sender{
  if (!self.onClick) {
    return;
  }
  self.onClick(@{@"msg":@"我点击了这个按钮"});
}

- (UIButton *)button{
  if (!_button) {
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    [_button setTitle:@"点我" forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
  }
  return _button;
}

- (UITextView *)contentTextView
{
  if (!_contentTextView) {
    _contentTextView =  [[UITextView alloc] init];
    [_contentTextView setFont:[UIFont systemFontOfSize:20]];
  }
  return _contentTextView;
}
- (void)setTitle:(NSString *)title
{
  _title = title;
  [_contentTextView setText:_title];
}
@end
