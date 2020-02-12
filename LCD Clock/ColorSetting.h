//
//  ColorSetting.h
//  LCD Clock
//
//  Created by Aditya Narayan on 7/22/16.
//  Copyright © 2016 Marc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ColorSetting : NSObject

@property (nonatomic, strong) UIColor * color;

-(instancetype)initWithRed: (NSNumber*)red green:(NSNumber*)green blue:(NSNumber*)blue alpha:(NSNumber*)alpha;

@end
