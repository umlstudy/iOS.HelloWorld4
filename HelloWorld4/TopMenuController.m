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
        self.title =@"최상위메뉴";
        
        // 표시할 데이터 작성
        items = [[NSMutableArray alloc] initWithObjects:@"ViewController1", @"ViewController2",nil];
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
