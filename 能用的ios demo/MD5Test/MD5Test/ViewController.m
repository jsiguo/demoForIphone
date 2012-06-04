//
//  ViewController.m
//  MD5Test
//
//  Created by  on 11-11-21.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "MD5Encrypt.h"
@implementation ViewController
@synthesize txt_mi;
@synthesize txt_yuan;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setTxt_yuan:nil];
    [self setTxt_mi:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)md5Btn:(id)sender {
    
//    UIAlertView *alert=[[UIAlertView alloc]
//                        initWithTitle:@"信息提示!"
//                        message:@"加密"
//                        delegate:self
//                        cancelButtonTitle:@"OK"
//                        otherButtonTitles:nil];
//    [alert show];
    MD5Encrypt *md5Encrypt=[[MD5Encrypt alloc]init];
    NSString  *strYuan=txt_yuan.text;
    NSString *strMi= [md5Encrypt md5:strYuan];
    txt_mi.text=[[NSString alloc]initWithFormat:strMi];
    NSLog(@"密文＝%@",strMi);
    
}
- (IBAction)btn_Tach:(id)sender {
    if(([txt_yuan isEditing]==1 )||([txt_mi isEditing]==1)){
        [txt_yuan resignFirstResponder];
        [txt_mi resignFirstResponder];
    }
}

@end
