//
//  PListArchiver.m
//  LCD Clock
//
//  Created by Aditya Narayan on 8/2/16.
//  Copyright © 2016 Marc. All rights reserved.
//

#import "PListArchiver.h"

@implementation PListArchiver

+ (id)getPListDictionaryObjectForKey:(NSString*) key {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *stringsPlistPath = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"preferences.plist"];
    NSMutableDictionary *defaultsDictionary = [[NSMutableDictionary alloc]initWithContentsOfFile:stringsPlistPath];
    return [defaultsDictionary objectForKey: key];
}

+ (void)writeToPListDictionary: (id) object forKey: (NSString*) key {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *stringsPlistPath = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"preferences.plist"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if([fileManager fileExistsAtPath:stringsPlistPath]){
        NSMutableDictionary *defaultsDictionary = [[NSMutableDictionary alloc]initWithContentsOfFile:stringsPlistPath];
        [defaultsDictionary setObject:object forKey:key];
        [defaultsDictionary writeToFile:stringsPlistPath atomically:YES];
    }else{
        NSMutableDictionary *defaultsDictionary = [[NSMutableDictionary alloc]init];
        [defaultsDictionary setObject:object forKey:key];
        [defaultsDictionary writeToFile:stringsPlistPath atomically:YES];
        
    }
}


@end
