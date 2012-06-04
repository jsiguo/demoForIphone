//
//  HomeView.m
//  ManagerMoney
//
//  Created by 杨勇 on 11-11-3.
//  Copyright 2011 ultrawise. All rights reserved.
//

#import "HomeView.h"

#import "IncomeAndPayoutView.h"
#import "PersonallyAccountView.h"
#import "AlwaysPropertyView.h"
@implementation HomeView

@synthesize ma_view;

@synthesize income_btn;
@synthesize user_acc_btn;
@synthesize always_btn;


-(IBAction)btnclicked:(id)sengder{
	
	


}

-(IBAction)many_btn_clicked:(id)btn{
	
	if(income_btn.state==YES){
		
		IncomeAndPayoutView *income=[[IncomeAndPayoutView alloc] initWithNibName:@"IncomeAndPayoutView" bundle:nil];
		[ma_view set_View:income.view];
		
		[[self.view superview] addSubview:ma_view.view];
	}
	if(user_acc_btn.state==YES){
		PersonallyAccountView *user_acc=[[PersonallyAccountView alloc] initWithNibName:@"PersonallyAccountView" bundle:nil];
		[ma_view set_View:user_acc.view];
	[[self.view superview] addSubview:ma_view.view];
	
	}
	
	if(always_btn.state==YES){
		AlwaysPropertyView *always=[[AlwaysPropertyView alloc] initWithNibName:@"AlwaysPropertyView" bundle:nil];
		[ma_view set_View:always.view];
		[[self.view superview] addSubview:ma_view.view];
	
	}
	
	
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

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

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
//
//- (void)viewDidUnload {
//    [super viewDidUnload];
//    // Release any retained subviews of the main view.
//    // e.g. self.myOutlet = nil;
//}


- (void)dealloc {
	[ma_view release];
	[income_btn release];
	[user_acc_btn release];
    [super dealloc];
}


@end
