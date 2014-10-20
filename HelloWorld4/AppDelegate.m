//
//  AppDelegate.m
//  HelloWorld4
//
//  Created by jomakson on 2014. 10. 14..
//  Copyright (c) 2014년 jomakson. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController1.h"
#import "ViewController2.h"


@implementation AppDelegate

@synthesize window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    CGRect bounds = [[UIScreen mainScreen] bounds ];
    window = [[UIWindow alloc] initWithFrame:bounds];
    window.backgroundColor = [UIColor redColor];
    
    rootController = [[UITabBarController alloc] init];
    
    ViewController1* tab1 = [[[ViewController1 alloc ] init] autorelease];
    ViewController2* tab2 = [[[ViewController2 alloc ] init] autorelease];
    
    NSArray* controllers = [NSArray arrayWithObjects:tab1, tab2, nil] ;
    [(UITabBarController*)rootController setViewControllers:controllers animated:NO];
    
    [window addSubview:rootController.view];
    
    [window makeKeyAndVisible];
    
    return YES;
}

-(void)dealloc {
    [rootController release];
    [window release];
    [super dealloc];
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
