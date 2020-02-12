//
//  ViewController.h
//  LCD Clock
//
//  Created by Aditya Narayan on 7/7/16.
//  Copyright (c) 2016 Marc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SegmentView.h"
#import "ColorSetting.h"
#import "PListArchiver.h"

@interface ViewController : UIViewController<NSCoding>;

@property (strong, nonatomic) IBOutlet SegmentView *hour1;

@property (strong, nonatomic) IBOutlet SegmentView *hour2;

@property (strong, nonatomic) IBOutlet SegmentView *minute1;

@property (strong, nonatomic) IBOutlet SegmentView *minute2;

@property (weak, nonatomic) IBOutlet SegmentView *second1;

@property (weak, nonatomic) IBOutlet SegmentView *second2;

@property (strong, nonatomic) IBOutlet UIButton *colon1;

@property (strong, nonatomic) IBOutlet UIButton *colon2;

@property (strong, nonatomic) IBOutlet UILabel *amLabel;

@property (strong, nonatomic) IBOutlet UILabel *pmLabel;

@property (strong, nonatomic) NSMutableArray *segmentViewArray;

@property (strong, nonatomic) ColorSetting* colorSetting;

-(void)setColorOfDigits:(UIColor*)color;

@end

