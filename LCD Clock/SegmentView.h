//
//  SegmentView.h
//  LCD Clock
//
//  Created by Aditya Narayan on 7/13/16.
//  Copyright (c) 2016 Marc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ColorSetting.h"



@interface SegmentView : UIView

@property (strong, nonatomic) IBOutlet UIView *segment1;

@property (strong, nonatomic) IBOutlet UIView *segment2;

@property (strong, nonatomic) IBOutlet UIView *segment3;

@property (strong, nonatomic) IBOutlet UIView *segment4;

@property (strong, nonatomic) IBOutlet UIView *segment5;

@property (strong, nonatomic) IBOutlet UIView *segment6;

@property (strong, nonatomic) IBOutlet UIView *segment7;

@property (strong, nonatomic) NSMutableArray *segmentArray;

@property (strong, nonatomic) UIColor* backgroundColor;

@property (strong, nonatomic) ColorSetting* colorSetting;


-(void) showSegments:  (int) value;

-(void) setColor;

@end


