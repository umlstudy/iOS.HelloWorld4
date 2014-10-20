//
//  AppDelegate.m
//  HelloWorld4
//
//  Created by jomakson on 2014. 10. 14..
//  Copyright (c) 2014년 jomakson. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
            

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    CGRect bounds = [[UIScreen mainScreen] bounds ];
    self.window = [[UIWindow alloc] initWithFrame:bounds];
    
    //    CGRect rect = [self.window frame];
    //    UILabel* label = [[UILabel alloc] initWithFrame:rect];
    //    label.text = @"Hello, world";
    //    self.window.backgroundColor = [UIColor redColor];
    //    NSLog(@"x = %f", label.frame.origin.x);
    //    [self.window addSubview:label];
    //    [label release];
    
    //    UILabel* label = [[[UILabel alloc] initWithFrame:CGRectZero] autorelease];
    //    label.frame = CGRectMake(0, 0, 200, 50);
    //    label.center = CGPointMake(160, 240);
    //    label.backgroundColor = [UIColor whiteColor];
    //    label.textColor = [UIColor greenColor];
    //    label.text = @"Hello, world";
    //    label.contentMode = UIViewContentModeScaleToFill;
    //    self.window.backgroundColor = [UIColor redColor];
    //    [self.window addSubview:label];
    //    [label release];

    self.window.backgroundColor = [UIColor redColor];

    UILabel* label1 = [[[UILabel alloc] initWithFrame:CGRectZero] autorelease];
    
    label1.backgroundColor = [UIColor blueColor];
    label1.textColor = [UIColor whiteColor];
    label1.text = @"짧은 문자열";
    [label1 sizeToFit];
    CGPoint newPoint = label1.center;
    newPoint.y = 50;
    label1.center = newPoint;
    [self.window addSubview:label1];
    
    UILabel* label2 = [[[UILabel alloc] initWithFrame:CGRectZero] autorelease];
    label2.backgroundColor = [UIColor blueColor];
    label2.textColor = [UIColor whiteColor];
    label2.text = @"긴............... 문자열";
    [label2 sizeToFit];
    newPoint = label1.center;
    newPoint.y += 20;
    label2.center = newPoint;
    [self.window addSubview:label2];
    
    [self.window makeKeyAndVisible  ];
    
    //    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    //    // Override point for customization after application launch.
    //    self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    //    self.window.rootViewController = self.viewController;
    //    [self.window makeKeyAndVisible];
    
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
