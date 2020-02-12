//
//  SegmentView.m
//  LCD Clock
//
//  Created by Aditya Narayan on 7/13/16.
//  Copyright (c) 2016 Marc. All rights reserved.
//

#import "SegmentView.h"

@implementation SegmentView

int *value;

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    UIView *view = [[[NSBundle mainBundle] loadNibNamed:@"SegmentView" owner:self options:nil] firstObject];
    view.frame = self.bounds;
    
    [self addSubview:view];

    self.segmentArray = [[NSMutableArray alloc] initWithArray:@[self.segment1, self.segment2, self.segment3, self.segment4, self.segment5, self.segment6, self.segment7]];
    
    [self setColor];
    
    return self;
}

-(void) setColor
{
    for (int i = 0; i < self.segmentArray.count; i++) {
        [self.segmentArray[i] setBackgroundColor:self.colorSetting.color];
    }
}

-(void) setVals:(int[])vals
{
    for (int i = 0; i < self.segmentArray.count; i++) {
        [self.segmentArray[i] setHidden: vals[i]];
    }
}


-(void) showSegments: (int) value {
    
    int data[10][7] = {
        {0,0,0,1,0,0,0},
        {1,1,0,1,1,0,1},
        {0,1,0,0,0,1,0},
        {0,1,0,0,1,0,0},
        {1,0,0,0,1,0,1},
        {0,0,1,0,1,0,0},
        {0,0,1,0,0,0,0},
        {0,1,0,1,1,0,1},
        {0,0,0,0,0,0,0},
        {0,0,0,0,1,0,0},
    };
    
    [self setVals: data[value]];
}

@end
