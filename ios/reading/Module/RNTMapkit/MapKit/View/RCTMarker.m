//
//  RCTMarker.m
//  reading
//
//  Created by Devin on 2021/3/4.
//

#import "RCTMarker.h"

#import <React/RCTConvert.h>

@implementation RCTMarker {
  BMKAnnotationView *_annotationView;
}
@synthesize coordinate = _coordinate;

- (BMKAnnotationView *)annotationView {
  return _annotationView;
}

- (instancetype)init {
  if (self = [super init]) {
    _annotationView = [[BMKAnnotationView alloc] initWithAnnotation:self reuseIdentifier:nil];
  }
  return self;
}

- (void)didAddSubview:(UIView *)subview {
  [_annotationView addSubview:subview];
  _annotationView.bounds = subview.bounds;
}

- (void)setIcon:(id)icon {
  UIImage *image = [RCTConvert UIImage:icon];
  _annotationView.image = image;
}

- (void)setShowCallout:(BOOL)showCallout {
  _annotationView.canShowCallout = showCallout;
}
@end
