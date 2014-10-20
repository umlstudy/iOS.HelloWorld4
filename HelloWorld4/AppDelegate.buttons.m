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
    self.window.backgroundColor = [UIColor redColor];

    // 1-1
    UIButton* button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect ];
    button1.frame = CGRectMake(10, 10, 300, 300);
    [button1 setTitle:@"1-1" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(buttonDidPush:) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:button1];

    // 1-1-1
    UIButton* button111 = [UIButton buttonWithType:UIButtonTypeRoundedRect ] ;
    button111.frame = CGRectMake(20, 20, 260, 100);
    [button111 setTitle:@"1-1-1" forState:UIControlStateNormal];
    [button111 addTarget:self action:@selector(buttonDidPush:) forControlEvents:UIControlEventTouchUpInside];
    [button1 addSubview:button111];

    // 1-1-2
    UIButton* button112 = [UIButton buttonWithType:UIButtonTypeRoundedRect ] ;
    button112.frame = CGRectMake(20, 180, 260, 100);
    [button112 setTitle:@"1-1-2" forState:UIControlStateNormal];
    [button112 addTarget:self action:@selector(buttonDidPush:) forControlEvents:UIControlEventTouchUpInside];
    [button1 addSubview:button112];

    // 1-1-2-1
    UIButton* button1121 = [UIButton buttonWithType:UIButtonTypeRoundedRect ] ;
    button1121.frame = CGRectMake(10, 10, 95, 80);
    [button1121 setTitle:@"1-1-2" forState:UIControlStateNormal];
    [button1121 addTarget:self action:@selector(buttonDidPush:) forControlEvents:UIControlEventTouchUpInside];
    [button112 addSubview:button1121];
    
    // 1-1-2-2
    UIButton* button1122 = [UIButton buttonWithType:UIButtonTypeRoundedRect ];
    button1122.frame = CGRectMake(155, 10, 95, 80);
    [button1122 setTitle:@"1-1-2" forState:UIControlStateNormal];
    [button1122 addTarget:self action:@selector(buttonDidPush:) forControlEvents:UIControlEventTouchUpInside];
    [button112 addSubview:button1122];
    
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


//    UILabel* label1 = [[[UILabel alloc] initWithFrame:CGRectZero] autorelease];
//    
//    label1.backgroundColor = [UIColor blueColor];
//    label1.textColor = [UIColor whiteColor];
//    label1.text = @"짧은 문자열";
//    [label1 sizeToFit];
//    CGPoint newPoint = label1.center;
//    newPoint.y = 50;
//    label1.center = newPoint;
//    [self.window addSubview:label1];
//    
//    UILabel* label2 = [[[UILabel alloc] initWithFrame:CGRectZero] autorelease];
//    label2.backgroundColor = [UIColor blueColor];
//    label2.textColor = [UIColor whiteColor];
//    label2.text = @"긴............... 문자열";
//    [label2 sizeToFit];
//    newPoint = label1.center;
//    newPoint.y += 20;
//    label2.center = newPoint;
//    [self.window addSubview:label2];
    
    [self.window makeKeyAndVisible  ];
    
    //    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    //    // Override point for customization after application launch.
    //    self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    //    self.window.rootViewController = self.viewController;
    //    [self.window makeKeyAndVisible];
    
    // Override point for customization after application launch.
    return YES;
}

- (void)alertMessage:(UIButton*)button {

    NSString* title = [NSString stringWithFormat:@"self = %@", button.titleLabel.text  ];
    NSString* superViewName;
    if ([button.superview isKindOfClass:[UIButton class]]) {
        superViewName = ((UIButton*)button.superview).titleLabel.text;
    } else {
        superViewName = @"UIViewController";
    }
    
    NSMutableString* subviews = [[[NSMutableString alloc] initWithCapacity:64] autorelease];
    [subviews setString:@""];
    
    for ( id view in button.subviews )  {
        NSString* addString;
        if ( [view isKindOfClass:[UIButton class]]) {
            addString = ((UIButton*)view).titleLabel.text;
        } else if ( [view isKindOfClass:[UILabel class]]) {
            addString = ((UILabel*)view).text;
        } else {
            addString = [view description];
        }
        
        if ( [subviews length] > 0 ) {
            [subviews appendString:@","];
        }
        [subviews appendString:addString];
    }
    
    NSString* message = [NSString stringWithFormat:@"superview = %@\r\nsubviews = %@", superViewName, subviews];
    UIAlertView* alert = [[[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil] autorelease];
    [alert show];
}

- (void)buttonDidPush:(id)sender {
    [self alertMessage:sender];
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
