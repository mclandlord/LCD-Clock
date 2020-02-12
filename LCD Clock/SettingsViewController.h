//
//  SettingsViewController.h
//  LCD Clock
//
//  Created by Aditya Narayan on 7/22/16.
//  Copyright © 2016 Marc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "ColorSetting.h"
#import "PListArchiver.h"

@interface SettingsViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate, NSCoding>

@property (strong, nonatomic) ViewController * clockViewController;

@property (strong, nonatomic) NSUserDefaults *prefs;

@property (strong, nonatomic) NSString *tz;

- (IBAction)hour24Clock:(id)sender;

- (IBAction)colorButtonPressed:(UIButton *)sender;

- (IBAction)doneButtonPressed:(id)sender;

@property (strong, nonatomic) IBOutlet UISwitch *milTimeSwitch;

@property (strong, nonatomic) IBOutlet UIPickerView *picker;



@end