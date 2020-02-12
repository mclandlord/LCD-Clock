//
//  SettingsViewController.m
//  LCD Clock
//
//  Created by Aditya Narayan on 7/22/16.
//  Copyright © 2016 Marc. All rights reserved.
//

#import "SettingsViewController.h"


@interface SettingsViewController ()
{
    NSArray *timeZoneArray;
}

@end

@implementation SettingsViewController
@synthesize picker;


- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.prefs = [NSUserDefaults standardUserDefaults];
  
    NSString *isMilitary = [PListArchiver getPListDictionaryObjectForKey:@"24hourclock"];
    
    if ([isMilitary isEqualToString:@"NO"])
    {
        [self.milTimeSwitch setOn:NO];
    }
    else{
        [self.milTimeSwitch setOn:YES];
    }
    
    timeZoneArray = [[NSArray alloc]initWithObjects:@"EST", @"CST", @"MST", @"PST", nil];

    NSString *rowStr = [PListArchiver getPListDictionaryObjectForKey:@"timezoneRow"];
    int row = [rowStr intValue];
    [picker selectRow:row inComponent:0 animated:YES];
    

  
    // Do any additional setup after loading the view.
}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
{
    
    switch (component) {
        case 0:
            return timeZoneArray.count;
            break;
            
        default:
            break;
    }
    return 0;
}


-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;
{
    
    switch (component) {
        case 0:
            return [timeZoneArray objectAtIndex:row];
            break;
            
        default:
            break;
    }
    return 0;
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component;
{
    NSString *tz = [[NSString alloc]init];
    tz = [timeZoneArray objectAtIndex:row];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    [calendar setTimeZone:[NSTimeZone timeZoneWithAbbreviation:tz]];
    
    [PListArchiver writeToPListDictionary:tz forKey:@"timezone"];
    [PListArchiver writeToPListDictionary:[NSNumber numberWithLong:row] forKey:@"timezoneRow"];

    
//    [self.prefs setValue:tz forKey:@"timezone"];
//    [self.prefs setInteger:row forKey:@"timezoneRow"];
//    [self.prefs synchronize];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)hour24Clock:(id)sender {
    UISwitch *switchObject = (UISwitch *)sender;
    if (switchObject.isOn)
    {
        [PListArchiver writeToPListDictionary:@"YES" forKey:@"24hourclock"];
    }
    else{
        [PListArchiver writeToPListDictionary:@"NO" forKey:@"24hourclock"];
    }
}

- (IBAction)colorButtonPressed:(UIButton *)sender {
    UIColor * myColor = sender.backgroundColor;
    self.clockViewController.colorSetting.color = myColor;
    [self.clockViewController setColorOfDigits:sender.backgroundColor];
    
//    NSNumber *red;
//    NSNumber *green;
//    NSNumber *blue;
//    NSNumber *alpha;
    
    
    CGFloat red;
    CGFloat green;
    CGFloat blue;
    CGFloat alpha;
   
    [sender.backgroundColor getRed:&red green:&green blue:&blue alpha:&alpha];
    
//    [self.prefs setFloat:red forKey:@"red"];
//    [self.prefs setFloat:green forKey:@"green"];
//    [self.prefs setFloat:blue forKey:@"blue"];
//    [self.prefs setFloat:alpha forKey:@"alpha"];
    
    [PListArchiver writeToPListDictionary:[NSNumber numberWithFloat: red] forKey:@"red"];
    [PListArchiver writeToPListDictionary:[NSNumber numberWithFloat: green] forKey:@"green"];
    [PListArchiver writeToPListDictionary:[NSNumber numberWithFloat: blue] forKey:@"blue"];
    [PListArchiver writeToPListDictionary:[NSNumber numberWithFloat: alpha] forKey:@"alpha"];
  }

- (IBAction)doneButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end
