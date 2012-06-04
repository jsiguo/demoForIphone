//
//  ViewController.h
//  MD5Test
//
//  Created by  on 11-11-21.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface ViewController : UIViewController {
    UITextField *txt_yuan;
    UITextField *txt_mi;
}


@property (strong, nonatomic) IBOutlet UITextField *txt_mi;

- (IBAction)btn_Tach:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *txt_yuan;
- (IBAction)md5Btn:(id)sender;
@end
