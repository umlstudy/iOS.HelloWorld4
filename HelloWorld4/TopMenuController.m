//
//  TopMenuController.m
//  HelloWorld4
//
//  Created by jomakson on 2014. 10. 22..
//  Copyright (c) 2014년 jomakson. All rights reserved.
//

#import "TopMenuController.h"

@implementation TopMenuController

-(void)dealloc {
    [items release];
    [super dealloc];
}

-(id)init {
    if ( ( self = [super initWithStyle:UITableViewStylePlain])) {
        self.navigationItem.prompt = @"1행메시지";
        self.navigationItem.title =@"타이틀";
        
        // 버튼을오른쪽에 추가
        UIBarButtonItem* rightItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:nil action:nil] autorelease];
        self.navigationItem.rightBarButtonItem = rightItem;
        
        // UIImageView 를 왼쪽에 추가
        UIImage *image = [UIImage imageNamed:@"face.jpg"];
        UIImageView* imageView = [[[UIImageView alloc] initWithImage:image] autorelease];
        UIBarButtonItem* icon = [[[UIBarButtonItem alloc] initWithCustomView:imageView] autorelease];
        self.navigationItem.leftBarButtonItem = icon;
        // ** 되돌아가기 버튼 표시
        //self.navigationItem.leftBarButtonItem = nil;
        
        
        // 표시할 데이터 작성
        items = [[NSMutableArray alloc] initWithObjects:@"ViewController1", @"ViewController2",@"SampleForTitleView", nil];
    }
    
    return self;
}

// ios 4.2 부터
-(NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section {
    return [items count];
}

-(UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 이미 셀이 등록되었는지 아닌지를 확인한다.
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"simple-cell"];
    if ( !cell ) {
        // 셀이 등록이 안됬으면 새롭게 등록한다.
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero
                                        reuseIdentifier:@"simple-cell"] autorelease];
        
    }
    
    // 셀의 라벨에 표시할 텍스트를 설정
    cell.textLabel.text = [items objectAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark ---- UITableViewDelegate Method ----
- (void) tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Class class = NSClassFromString([items objectAtIndex:indexPath.row]);
    id viewController = [[[class alloc] init] autorelease];
    if ( viewController ) {
        [self.navigationController pushViewController:viewController animated:YES  ];
    }
}
@end
