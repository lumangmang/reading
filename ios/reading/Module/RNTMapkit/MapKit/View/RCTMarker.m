//
//  RCTMarker.m
//  reading
//
//  Created by Devin on 2021/3/4.
//

#import "RCTMarker.h"

#import <React/RCTConvert+CoreLocation.h>

@implementation RCTMarker {
  BMKAnnotationView *_annotationView;
}

- (BMKAnnotationView *)annotationView {
  return _annotationView;
}

- (instancetype)init {
  if (self = [super init]) {
    _annotationView = [[BMKAnnotationView alloc] initWithAnnotation:self reuseIdentifier:nil];
    _annotationView.frame = CGRectMake(0, 0, 45, 60);
  }
  return self;
}

- (void)setPoint:(NSDictionary *)point {
  _coordinate = [RCTConvert CLLocationCoordinate2D:point];
  self.markerId = [point[@"id"] intValue];
}

- (void)didAddSubview:(UIView *)subview {
  [_annotationView addSubview:subview];
}

- (void)setImageURLString:(NSString *)imageURLString {
  _annotationView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageURLString]]];
}
@synthesize coordinate = _coordinate;

@end
