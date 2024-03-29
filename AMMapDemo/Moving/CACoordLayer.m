//
//  CACoordLayer.m
//  AMMapDemo
//
//  Created by Alan on 2016/12/22.
//  Copyright © 2016年 Alan. All rights reserved.
//

#import "CACoordLayer.h"

@implementation CACoordLayer

@dynamic mapx;
@dynamic mapy;

- (id)initWithLayer:(id)layer
{
    if ((self = [super initWithLayer:layer]))
    {
        if ([layer isKindOfClass:[CACoordLayer class]])
        {
            CACoordLayer * input = layer;
            self.mapx = input.mapx;
            self.mapy = input.mapy;
            [self setNeedsDisplay];
        }
    }
    return self;
}

+ (BOOL)needsDisplayForKey:(NSString *)key
{
    if ([@"mapx" isEqualToString:key])
    {
        return YES;
    }
    if ([@"mapy" isEqualToString:key])
    {
        return YES;
    }
    
    return [super needsDisplayForKey:key];

}

- (void)display
{
    CACoordLayer *layer = [self presentationLayer];
    MAMapPoint mapPoint = MAMapPointMake(layer.mapx, layer.mapy);
    
    CGPoint center = [self.mapView pointForMapPoint:mapPoint];
    center.x += self.centerOffset.x;
    center.y += self.centerOffset.y;
    
    self.position = center;
}


@end
