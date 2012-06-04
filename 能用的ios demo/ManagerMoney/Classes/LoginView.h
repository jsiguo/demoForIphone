//
//  LoginView.h
//  ManagerMoney
//
//  Created by 杨勇 on 11-11-3.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeView.h"

/*
 用户登录页
 */

@interface LoginView : UIViewController {

	HomeView *home_view;
	//用户名／密码／验证码
	UITextField *user_and_num_txtview;
	UITextField *pass_txtview;
	UITextField *verify_txtview;
	//记住登录名
	UIButton *remember_btn;
	UIImageView *remember_img;
	
	
}

@property(nonatomic,retain)IBOutlet HomeView *home_view;

@property(nonatomic,retain)IBOutlet UITextField *user_and_num_txtview;
@property(nonatomic,retain)IBOutlet UITextField *pass_txtview;
@property(nonatomic,retain)IBOutlet UITextField *verify_txtview;
@property(nonatomic,retain)IBOutlet UIImageView *remember_img;
@property(nonatomic,retain)IBOutlet UIButton *remember_btn;

-(IBAction)btnclick:(id)snender;

-(IBAction)keyhidden:(id)sender;

-(IBAction)remember_btnClick:(id)sender;

@end
