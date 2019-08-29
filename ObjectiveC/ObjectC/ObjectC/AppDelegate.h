//
//  AppDelegate.h
//  ObjectC
//
//  Created by MCS on 8/26/19.
//  Copyright © 2019 MCS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
- (NSString*) theInstanceFunc;
+ (NSString*) theClassFunc;





@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

