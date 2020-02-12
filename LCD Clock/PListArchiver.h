//
//  PListArchiver.h
//  LCD Clock
//
//  Created by Aditya Narayan on 8/2/16.
//  Copyright © 2016 Marc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ViewController.h"


@interface PListArchiver : NSObject


+ (id)getPListDictionaryObjectForKey:(NSString*) key;
+ (void)writeToPListDictionary: (id) object forKey: (NSString*) key;


@end
