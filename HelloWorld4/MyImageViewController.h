//
//  MyImageViewController.h
//  HelloWorld4
//
//  Created by jomakson on 2014. 10. 28..
//  Copyright (c) 2014년 jomakson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyImageViewController : UIViewController {
    @private
    UILabel* label;
    BOOL fullScreen;
}

- (void) toFullScreen;
@end
