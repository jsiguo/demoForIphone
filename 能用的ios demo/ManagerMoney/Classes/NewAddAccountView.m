//
//  NewAddAccountView.m
//  ManagerMoney
//
//  Created by 杨勇 on 11-11-3.
//  Copyright 2011 ultrawise. All rights reserved.
//

#import "NewAddAccountView.h"
#import "DropDownList.h"


@implementation NewAddAccountView

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


-(IBAction)back_btnClick:(id)sender{

[self.view.superview.superview removeFromSuperview];


}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
	NSArray *bank = [[NSArray alloc] initWithObjects:@"中国工商银行",@"中国发展银行",@"中国交通银行",@"中国建设银行",@"中国农业银行",@"广东浦发银行",nil];
	DropDownList *acc = [[DropDownList alloc] initWithFrame:CGRectMake(129, 85, 171, 31) Data:bank];
	
	NSArray *card = [[NSArray alloc] initWithObjects:@"借记卡",@"信用卡",@"存折",nil];
	DropDownList *type = [[DropDownList alloc] initWithFrame:CGRectMake(129, 130, 171, 31) Data:card];

	
	[self.view addSubview:acc];
	[self.view addSubview:type];
	
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
    [super dealloc];
}


@end
