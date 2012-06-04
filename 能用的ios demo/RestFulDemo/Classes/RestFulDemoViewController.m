//
//  RestFulDemoViewController.m
//  RestFulDemo
//
//  Created by gsm on 11-11-22.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RestFulDemoViewController.h"
#import "ASIHTTPRequest.h"
#import "MD5HexDigest.h"
#import "HttpsRequest.h"
@implementation RestFulDemoViewController
@synthesize txt_User;//用户名
@synthesize txt_Psw;  //密码


/*
 // The designated initializer. Override to perform setup that is required before the view is loaded.
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
 if (self) {
 // Custom initialization
 }
 return self;
 }
 */

/*
 // Implement loadView to create a view hierarchy programmatically, without using a nib.
 - (void)loadView {
 }
 */


/*
 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad {
 [super viewDidLoad];
 }
 */


/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

//登录按钮监听
-(IBAction) btn_Login:(id) sender{
	
	NSString *str=txt_Psw.text;
	MD5HexDigest *md5HexDigest=[[MD5HexDigest alloc]init];
	NSString *strMi=[md5HexDigest md5:str];
	txt_Psw.text=strMi;
	NSLog(@"MD散列码==%@",strMi);
    
	//访问http
	//NSURL *url = [NSURL URLWithString:@"https://192.168.5.137:8443/DDFx_for_Mobile/services/AccSystemOperate/getExtraCode"];
//	ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
//	[request setDelegate:self];
//	[request startAsynchronous];
	
	//访问https
	NSURL *httpsUrl = [NSURL URLWithString:@"https://192.168.5.113:8443/DDFx_for_Mobile/services/AccSystemOperate/getExtraCode"];
	HttpsRequest *httpsResquest=[[HttpsRequest alloc]init];
	NSString *strresponse=[httpsResquest testClientCertificate:httpsUrl];
	NSLog(@"后台返回的数据==%@",strresponse);
	
	UIAlertView *alert=[[UIAlertView alloc]
						initWithTitle:@"警告提示框"
						message:strresponse
						delegate:self
						cancelButtonTitle:@"OK"
						otherButtonTitles:nil];
	[alert show];
	[alert release];
}

//请求成功获取数据
- (void)requestFinished:(ASIHTTPRequest *)request {
	// Use when fetching text data
	NSString *responseString = [request responseString];
	NSLog(@"str=======%@",responseString);
	// Use when fetching binary data
	NSData *responseData = [request responseData];
	//NSLog(@"responseData==%@",responseData);
}
//请求失败
- (void)requestFailed:(ASIHTTPRequest *)request
{
	NSError *error = [request error];
	NSLog(@"error==%@",error);
}






//键盘退出
- (IBAction) btn_Tach:(id) sender{
	
	if(([txt_User isEditing]==1 )||([txt_Psw isEditing]==1)){
        [txt_User resignFirstResponder];
        [txt_Psw resignFirstResponder];
    }
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[txt_User release];
	[txt_Psw  release];
    [super dealloc];
}

@end
