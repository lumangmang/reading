//
//  RNTMarker.m
//  reading
//
//  Created by Devin on 2021/1/28.
//

#import "RNTMarker.h"

#import <React/RCTConvert.h>

@implementation RNTMarker {
  BMKAnnotationView *_annotationView;
  BMKActionPaopaoView *_calloutView;
  UITapGestureRecognizer *_calloutPressHandler;
  BOOL _selected;
  UIImage *_image;
}

@synthesize coordinate = _coordinate;

- (BMKAnnotationView *)annotationView {
  self.selected = _selected;
  return _annotationView;
}
- (instancetype)init {
  if (self = [super init]) {
    _image = [UIImage imageNamed:@"marker"];
    _annotationView = [[BMKAnnotationView alloc] initWithAnnotation:self reuseIdentifier:nil];
    [self setColor:[RCTConvert UIColor:@(0xfff5533d)]];
    [_annotationView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_onPress:)]];
    _calloutPressHandler = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_onCalloutPress:)];
  }
  return self;
}

- (void)bindCalloutPressHandler {
    [_annotationView.paopaoView addGestureRecognizer:_calloutPressHandler];
}

- (void)updateCenterOffset {
    CGSize size = _annotationView.image.size;
    _annotationView.centerOffset = CGPointMake(0, -size.height / 2);
}

- (void)didAddSubview:(UIView *)subview {
  [_annotationView addSubview:subview];
  _annotationView.image = nil;
  _annotationView.bounds = subview.bounds;
}

- (void)setImage:(NSString *)image {
  _annotationView.image = [UIImage imageNamed:image];
  [self updateCenterOffset];
}

- (void)setColor:(UIColor *)color {
  _annotationView.image = [self tintWithColor:color];
  [self updateCenterOffset];
}

- (void)setCoordinate:(CLLocationCoordinate2D)coordinate {
  _coordinate = coordinate;
  _mapView.centerCoordinate = _mapView.centerCoordinate;
}

- (void)setCenterOffset:(CGPoint)centerOffset {
  _annotationView.centerOffset = centerOffset;
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

- (UIImage *)tintWithColor:(UIColor *)color {
    CGFloat r, g, b, a;
    [color getRed:&r green:&g blue:&b alpha:&a];
    unsigned char red = r * 255;
    unsigned char green = g * 255;
    unsigned char blue = b * 255;
    unsigned char alpha = a * 255;
    
    UIGraphicsBeginImageContextWithOptions(_image.size, NO, _image.scale);
    [_image drawInRect:CGRectMake(0, 0, _image.size.width, _image.size.height)];
    CGContextRef context = UIGraphicsGetCurrentContext();
    unsigned char* data = CGBitmapContextGetData(context);
    unsigned long length = CGBitmapContextGetWidth(context) * CGBitmapContextGetHeight(context) * 4;
    for (int i = 0; i < length; i += 4) {
        if (data[i] > 127 && data[i + 1] > 127 && data[i + 2] > 127) {
            data[i] = blue;
            data[i + 1] = green;
            data[i + 2] = red;
            data[i + 3] = alpha;
        }
    }
    UIImage *output = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return output;
}
@end
