//
//  MAINCONTROLVIEW.m
//  ManagerMoney
//
//  Created by 杨勇 on 11-11-3.
//  Copyright 2011 ultrawise. All rights reserved.
//

#import "MAINCONTROLVIEW.h"

@implementation MAINCONTROLVIEW
@synthesize center_view;
@synthesize curr_view;

UIView *cent_view;

-(void)set_View:(UIView *)curr_view{

	cent_view=curr_view;


}
-(UIView *)get_View{




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
-(void)viewWillAppear:(BOOL)animated{
	[self.center_view addSubview:cent_view];


}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
//	PersonallyAccountView *hoe=[[PersonallyAccountView alloc] initWithNibName:@"PersonallyAccountView" bundle:nil];
//	

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
	[center_view release];
	[cent_view release];
	[curr_view release];
    [super dealloc];
}


@end
