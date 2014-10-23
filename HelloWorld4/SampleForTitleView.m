//
//  SampleForTitleView.m
//  HelloWorld4
//
//  Created by jomakson on 2014. 10. 23..
//  Copyright (c) 2014년 jomakson. All rights reserved.
//

#import "SampleForTitleView.h"
//private 메소드 선언
@interface SampleForTitleView()
    
-(void) sliderDidChange;
@end

@implementation SampleForTitleView

// finalize
-(void) dealloc {
    [slider release];
    [label release];
    [super release];
}

-(void)viewDidLoad {
    [super viewDidLoad];
    
    // 1행메시지
    self.navigationItem.prompt = @"슬라이드를 움직이면 화면의 색이 바뀝니다.";
    // UISlider 를 작성해서 슬라이더가 변경되면 sliderDidChange 메소드가 불리도록 한다.
   
    // UISlider 를 작성해서 슬라이더가 변경되면  sliderDidChange 메소드를 불리도록 한다.
    slider = [[UISlider alloc] init];
    slider.frame = self.navigationController.navigationBar.bounds;
    slider.minimumValue = 0.0;
    slider.maximumValue = 1.0;
    slider.value = slider.maximumValue /2.0;
    [slider addTarget:self action:@selector(sliderDidChange) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.titleView = slider;
    
    // 슬라이더의 값에 맞춰 색을 바꾸기 위한 라벨 추가
    label = [[UILabel alloc] init];
    label.frame = CGRectInset(self.view.bounds, 10, 10);
    label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    label.backgroundColor = [UIColor blackColor];
    [self.view addSubview:label];
    
    // 슬라이더의 초기값을 라벨의 색에 반영시킨다.
    [self sliderDidChange];
}

// 네이비이션 바와 툴바가 확실히 표시되도록 한다.
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    [self.navigationController setToolbarHidden:NO animated:NO];
    // 단 돌아가는 버튼은 숨겨둔다.
    [self.navigationItem setHidesBackButton:YES animated:NO];
}

// 돌아가는 버튼이 숨어 있으므로 화면을 탭하면 돌아가는 버튼을 표시한다.
- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent*) event {
    [self.navigationItem setHidesBackButton:NO animated:YES];
}

// 슬라이더가 움직이면 이 메소드가 불려 라벨의 색을 변경한다.
-(void) sliderDidChange {
    UIColor* color = [[[UIColor alloc ] initWithRed:slider.value green:slider.value blue:slider.value alpha:1.0] autorelease];
    label.backgroundColor = color;
}
@end
