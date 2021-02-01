//
//  RNTMarker.m
//  reading
//
//  Created by Devin on 2021/1/28.
//

#import "RNTMarker.h"
#import "RNTCallout.h"

#import <React/RCTConvert.h>

@implementation RNTMarker {
  BMKAnnotationView *_annotationView;
  BMKActionPaopaoView *_calloutView;
  UITapGestureRecognizer *_calloutPressHandler;
  BOOL _selected;
}

@synthesize coordinate = _coordinate;

- (BMKAnnotationView *)annotationView {
  self.selected = _selected;
  return _annotationView;
}
- (instancetype)init {
  if (self = [super init]) {
    _annotationView = [[BMKAnnotationView alloc] initWithAnnotation:self reuseIdentifier:nil];
    [_annotationView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_onPress:)]];
    _calloutPressHandler = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_onCalloutPress:)];
  }
  return self;
}

- (void)bindCalloutPressHandler {
    [_annotationView.paopaoView addGestureRecognizer:_calloutPressHandler];
}

- (void)didAddSubview:(UIView *)subview {
  if ([subview isKindOfClass:[RNTCallout class]]) {
    _calloutView = [[BMKActionPaopaoView alloc] initWithCustomView:subview];
    _annotationView.paopaoView = _calloutView;
  } else {
    [_annotationView addSubview:subview];
    _annotationView.image = nil;
    _annotationView.bounds = subview.bounds;
  }
}

- (void)setImage:(NSString *)image {
  _annotationView.image = [UIImage imageNamed:image];
}

- (void)setCoordinate:(CLLocationCoordinate2D)coordinate {
  _coordinate = coordinate;
  _mapView.centerCoordinate = _mapView.centerCoordinate;
}

- (void)setSelected:(BOOL)selected {
    _selected = selected;
    dispatch_async(dispatch_get_main_queue(), ^{
        if (selected) {
            [self.mapView selectAnnotation:self animated:YES];
        } else {
            [self.mapView deselectAnnotation:self animated:YES];
        }
    });
}

- (void)setDraggable:(BOOL)draggable {
    _annotationView.draggable = draggable;
}

- (void)_onPress:(UITapGestureRecognizer *)recognizer {
  [self.mapView selectAnnotation:self animated:YES];
  if (self.onBaiduMapPress) {
      self.onBaiduMapPress(nil);
  }
}

- (void)_onCalloutPress:(UITapGestureRecognizer *)recognizer {
  if (self.onBaiduMapCalloutPress) {
      self.onBaiduMapCalloutPress(nil);
  }
}
@end
