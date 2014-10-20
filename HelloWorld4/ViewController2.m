//
//  ViewController2.m
//  HelloWorld4
//
//  Created by jomakson on 2014. 10. 16..
//  Copyright (c) 2014년 jomakson. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()

@end

@implementation ViewController2

-(id)init{
    if ( (self = [super init])) {
        self.title = @"안녕";
        UIImage* icon = [UIImage imageNamed:@"home.png"];
        self.tabBarItem = [[[UITabBarItem alloc] initWithTitle:@"안녕"  image:icon tag:0] autorelease];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel* label = [[[UILabel alloc] initWithFrame:self.view.bounds] autorelease];
    label.text = @"안녕, 세계";
    label.textAlignment = UITextAlignmentCenter;
    label.backgroundColor = [UIColor blackColor];
    label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    label.textColor = [UIColor whiteColor];
    [self.view addSubview:label];
    
    
    // Do any additional setup after loading the view.
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

@end
