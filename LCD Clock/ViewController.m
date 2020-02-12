//
//  ViewController.m
//  LCD Clock
//
//  Created by Aditya Narayan on 7/7/16.
//  Copyright (c) 2016 Marc. All rights reserved.
//

#import "ViewController.h"
#import "SettingsViewController.h"


@implementation ViewController

int hour1value;
int hour2value;
int min1value;
int min2value;
int sec1value;
int sec2value;



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(changeDigits) userInfo:nil repeats:YES];
    
    self.segmentViewArray = [[NSMutableArray alloc] initWithArray:@[self.hour1, self.hour2, self.minute1, self.minute2,  self.second1, self.second2]];
    
    
//    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
//    CGFloat red = [prefs floatForKey:@"red"];
//    CGFloat green = [prefs floatForKey:@"green"];
//    CGFloat blue = [prefs floatForKey:@"blue"];
//    CGFloat alpha = [prefs floatForKey:@"alpha"];
    
    NSNumber *red  = [PListArchiver getPListDictionaryObjectForKey:@"red"];
    NSNumber *green  = [PListArchiver getPListDictionaryObjectForKey:@"green"];
    NSNumber *blue  = [PListArchiver getPListDictionaryObjectForKey:@"blue"];
    NSNumber *alpha  = [PListArchiver getPListDictionaryObjectForKey:@"alpha"];
    

    
    _colorSetting = [[ColorSetting alloc] initWithRed:red green:green blue:blue alpha:alpha];

    /*
    if([PListArchiver getPListDictionaryObjectForKey:@"alpha"] == 0){
         _colorSetting.color = [UIColor redColor];
    } else {
        _colorSetting.color = [UIColor colorWithRed:[red floatValue] green:[green floatValue] blue:[blue floatValue] alpha:[alpha floatValue]];
    }
     */
     
    self.amLabel.hidden = YES;
    self.pmLabel.hidden = YES;
    
}

-(void)viewDidAppear:(BOOL)animated {
    
    [self setColorOfDigits:self.colorSetting.color];
    for (SegmentView * segmentView in self.segmentViewArray) {
        segmentView.colorSetting = self.colorSetting;
    }
    [self setColorOfDigits:self.colorSetting.color];
}

-(void)setColorOfDigits:(UIColor*)color
{
    for (int x = 0;  x < self.segmentViewArray.count ; x++) {
        SegmentView *segmentView =  self.segmentViewArray[x];
        segmentView.colorSetting = self.colorSetting;
        segmentView.backgroundColor = segmentView.colorSetting.color;
        [self.segmentViewArray[x] setColor];
        self.colon1.backgroundColor = segmentView.colorSetting.color;
        self.colon2.backgroundColor = segmentView.colorSetting.color;
        self.amLabel.textColor = segmentView.colorSetting.color;
        self.pmLabel.textColor = segmentView.colorSetting.color;
    }
}


//getting time values

-(void)changeDigits {
    
    
        NSDate *date = [NSDate date];
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSString *tz = [PListArchiver getPListDictionaryObjectForKey:@"timezone"];
        [calendar setTimeZone:[NSTimeZone timeZoneWithAbbreviation:tz]];
        NSDateComponents *components = [calendar components:(NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond) fromDate:date];
        int hr = (int)[components hour];
        int min = (int)[components minute];
        int sec = (int)[components second];
    
    NSLog(@"Hour: %d Minutes: %d Seconds: %d", hr, min, sec);
 
    NSString *isMilitary = [PListArchiver getPListDictionaryObjectForKey:@"24hourclock"];
    
    [self.hour1 setHidden:NO];
    
    if ([isMilitary isEqualToString:@"NO"])
        {
            //THIS IS FOR PM
            if (hr >= 12)
            {
                self.pmLabel.hidden = NO;
                self.amLabel.hidden = YES;
                if (hr != 12) hr = hr - 12;  //FOR PM DISPLAY, SUBTRACT 12 FROM 24 HOUR VALUE EXCEPT WHEN HOUR VALUE IS 12PM THEN SHOW THE 12
                    if (hr < 10)  //IF HOUR IS LESS THAN 10, HIDE THE HOUR1 VIEW FOR AM/PM DISPLAY INSTEAD OF SHOWING A "0"
                    {
                    [self.hour1 setHidden:YES];
                    }
            }
            
            //THIS IS FOR AM
            else
                {
                    self.amLabel.hidden = NO;
                    self.pmLabel.hidden = YES;
                    
                    if (hr == 0) hr = 12;  // IF HOUR TIME IS 12AM IT SHOULD DISPLAY 12 AND NOT "00"
                    if (hr < 10)  //IF HOUR IS LESS THAN 10, HIDE THE HOUR1 VIEW FOR AM/PM DISPLAY INSTEAD OF SHOWING A "0"
                    {
                    [self.hour1 setHidden:YES];
                    }
                }
        }
            //THIS RESETS TO 24 HOUR MILITARY TIME
                else
                {
                    [self.hour1 setHidden:NO];
                    self.amLabel.hidden = YES;
                    self.pmLabel.hidden = YES;
                }
    
//  THE CODE BELOW FIGURES OUT WHAT SINGLE DIGIT VALUE BELONGS IN EACH OF THE 6 TIME VIEWS
//  SINGLE DIGIT VALUES ARE NAMED - hour1value, hour2value, min1value, min2value, sec1value, sec2value
//  VIEWS ARE NAMED - hour1, hour2, minute1, minute2, second1, second2
    
    if (hr >= 10 && hr <=20)
    {
        hour1value = 1;
    }
    
    else if (hr >20)
    {
        hour1value = 2;
    }
    else hour1value = 0;
    

    hour2value = hr % 10;
    
    if (min <10) min1value = 0;
    if (min >=10 && min <20) min1value = 1;
    if (min >=20 && min <30) min1value = 2;
    if (min >=30 && min <40) min1value = 3;
    if (min >=40 && min <50) min1value = 4;
    if (min >=50 && min <60) min1value = 5;
    
    min2value = min % 10;
    
    if (sec <10) sec1value = 0;
    if (sec >=10 && sec <20) sec1value = 1;
    if (sec >=20 && sec <30) sec1value = 2;
    if (sec >=30 && sec <40) sec1value = 3;
    if (sec >=40 && sec <50) sec1value = 4;
    if (sec >=50 && sec <60) sec1value = 5;
    
    sec2value = sec % 10;
    
    [self.hour1 showSegments:hour1value];
    [self.hour2 showSegments:hour2value];
    [self.minute1 showSegments:min1value];
    [self.minute2 showSegments:min2value];
    [self.second1 showSegments:sec1value];
    [self.second2 showSegments:sec2value];
    
    NSLog(@"every second");
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    SettingsViewController * settingsVC = [segue destinationViewController];
    settingsVC.clockViewController = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
