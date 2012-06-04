//
//  RestFulDemoViewController.h
//  RestFulDemo
//
//  Created by gsm on 11-11-22.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RestFulDemoViewController : UIViewController <UIApplicationDelegate>{

	
	IBOutlet UITextField *txt_User;//邮箱输入框
	IBOutlet UITextField *txt_Psw;  //密码输入框
}
@property (nonatomic,retain) UITextField *txt_User;
@property (nonatomic,retain) UITextField *txt_Psw; 


//登录按钮监听
-(IBAction) btn_Login:(id) sender;
//键盘退出
- (IBAction) btn_Tach:(id) sender;
@end


