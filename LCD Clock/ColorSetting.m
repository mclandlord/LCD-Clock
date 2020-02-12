//
//  ColorSetting.m
//  LCD Clock
//
//  Created by Aditya Narayan on 7/22/16.
//  Copyright © 2016 Marc. All rights reserved.
//

#import "ColorSetting.h"

@implementation ColorSetting

-(instancetype)initWithRed: (NSNumber*)red green:(NSNumber*)green blue:(NSNumber*)blue alpha:(NSNumber*)alpha{
    self = [super init];
    if(self){
        if(!alpha) _color = [UIColor redColor];
        else _color = [UIColor colorWithRed:[red floatValue] green:[green floatValue] blue:[blue floatValue] alpha:[alpha floatValue]];
    }
    return self;
}

@end
