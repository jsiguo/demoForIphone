//
//  LoginView.m
//  ManagerMoney
//
//  Created by 杨勇 on 11-11-3.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LoginView.h"


@implementation LoginView

@synthesize home_view;

@synthesize user_and_num_txtview;
@synthesize pass_txtview;
@synthesize verify_txtview;
@synthesize remember_img;

BOOL rem_flag=NO;

-(IBAction)btnclick:(id)snender{
	//有固定的判断
	NSString *username=@"admin";
	NSString *usernum=@"88168";
	NSString *pass=@"123456";
	NSString *vir_txt=@"5612";
	
	
	NSString *txt_user=user_and_num_txtview.text;
	NSString *txt_pass=pass_txtview.text;
	NSString *txt_verify=verify_txtview.text;
	
	if(([txt_user isEqual:username]||[txt_user isEqual:usernum])&&[pass isEqual:txt_pass]){
		if ([vir_txt isEqual:txt_verify]) {
			[[self.view superview] addSubview:home_view.view];
		}
		else {
			UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"信息提示"
														 message:@"验证码错误"
														delegate:self 
											   cancelButtonTitle:@"OK"  
											   otherButtonTitles:nil];
			[alert show];
			[alert release];
		}
		
	}else {
		UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"信息提示"
													 message:@"帐号或者密码错误"
													delegate:self 
										   cancelButtonTitle:@"OK"  
										   otherButtonTitles:nil];
		[alert show];
		[alert release];
		
	}


}

//记住登录名的
-(IBAction)remember_btnClick:(id)sender{
	if(rem_flag){
		rem_flag=!rem_flag;
		[remember_img setImage:[UIImage imageNamed:@"dui2.png"]];
		
	}else {
		rem_flag=!rem_flag;
		[remember_img setImage:[UIImage imageNamed:@"dui1.png"]];
		
	}
	
	

}


//键盘收起
-(IBAction)keyhidden:(id)sender{

	[user_and_num_txtview resignFirstResponder];
	[pass_txtview resignFirstResponder];
	[verify_txtview resignFirstResponder];


}
// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/
//
//-(IBAction)textFieldDoneEditing:(id)sender
//{
//	[sender resignFirstResponder];
//	}
//

-(BOOL)textFieldShouldReturn:(UITextField *)textFieldView{
	
	//if(textFieldView==user_and_num_txtview){

	[user_and_num_txtview resignFirstResponder];
	[pass_txtview resignFirstResponder];
	[verify_txtview resignFirstResponder];
	//}
	return NO;
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}



- (void)dealloc {
	[home_view release];
	
	 [user_and_num_txtview release];
	 [pass_txtview release];
	 [verify_txtview release];
	
    [super dealloc];
}


@end
