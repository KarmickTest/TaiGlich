//
//  AppDelegate.h
//  Taiglich
//
//  Created by SAYAN MAC MINI on 1/31/17.
//  Copyright © 2017 Karmick. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;
@property(strong,nonatomic)NSString *devicetokenstring;
- (void)saveContext;


@end

