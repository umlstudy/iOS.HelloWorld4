//
//  MyImageViewController.m
//  HelloWorld4
//
//  Created by jomakson on 2014. 10. 28..
//  Copyright (c) 2014년 jomakson. All rights reserved.
//

#import "MyImageViewController.h"

@interface MyImageViewController ()

@end

@implementation MyImageViewController

// finalize
-(void) dealloc {
    [label release];
    [super dealloc];
}

-(void)viewDidLoad {
    [super viewDidLoad];
    
    // 1행메시지
    self.navigationItem.prompt = @"바 보이고 숨기기 테스트";
    // UISlider 를 작성해서 슬라이더가 변경되면 sliderDidChange 메소드가 불리도록 한다.
    
    // 슬라이더의 값에 맞춰 색을 바꾸기 위한 라벨 추가
    label = [[UILabel alloc] init];
    label.frame = CGRectInset(self.view.bounds, 10, 10);
    label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    label.backgroundColor = [UIColor blackColor];
    [self.view addSubview:label];
    
}

// 네이비이션 바와 툴바가 확실히 표시되도록 한다.
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
   
    // 인스턴스 변수에 전체 화면인지를 저장한다.
    // 이변수는, @interface 안에 정의한 것
    fullScreen = NO;
    
    // 네비게이션 바와 툴바를 표시한다.
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    [self.navigationController setToolbarHidden:NO animated:NO];
    
    // 상태를 반투명하게
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleBlackTranslucent;
    // 내비게이션 바를 반투명하게
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationController.navigationBar.translucent = YES;
    
    // 툴바를 반투명하게
    self.navigationController.toolbar.barStyle = UIBarStyleBlack;
    self.navigationController.toolbar.translucent = YES;
    
    // 상태바 아래도 표현가능 영역으로 설정한다.
    self.wantsFullScreenLayout = YES;
   
}

// 돌아가는 버튼이 숨어 있으므로 화면을 탭하면 돌아가는 버튼을 표시한다.
- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent*) event {
    
    [self toFullScreen];
    /*
    if ( !fullScreen ) {
        [self toFullScreen];
    } else {
        [self restoreFromFullScreen];
    }
    */
    
    /*
    // 상태바를 숨긴다.
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:YES];
    
    // 내비게이션바를 숨긴다.
    [self.navigationController setNavigationBarHidden:YES animated:YES];
   
    // 툴바를 숨긴다.
    [self.navigationController setToolbarHidden:YES animated:YES];
    */
}

- (void) toFullScreen {
    fullScreen = !fullScreen;
    
    // 애니메이션 정의를 시작한다.
    [UIView beginAnimations:nil context:NULL];
    
    // 에니메이션의 스피드를 상태바가 사라질 때의 스피드와 같게 한다.
    [UIView setAnimationDuration:0.3];
    // 상태바를 표시 않음으로 한다(상태바는 좀더 서서히 사라지게 하기 위해)
    [[UIApplication sharedApplication] setStatusBarHidden:fullScreen withAnimation:YES];
    // 내비게이션 바/툴바의 alpha 값을 0.0 <-> 1.0으로 전환한다.
    self.navigationController.navigationBar.alpha = fullScreen ? 0.0 : 1.0;
    self.navigationController.toolbar.alpha = fullScreen ? 0.0 : 1.0;
    
    // 에니메이션 정의를 종료한다.
    [UIView commitAnimations];
    
}

@end
