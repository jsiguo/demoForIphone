//
//  AlwaysPropertyView.m
//  ManagerMoney
//
//  Created by 杨勇 on 11-11-3.
//  Copyright 2011 ultrawise. All rights reserved.
//

#import "AlwaysPropertyView.h"
#import <QuartzCore/QuartzCore.h>
#import "BarChartViewController.h"
@implementation AlwaysPropertyView

@synthesize  lay_view;
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
	

	
	[[lay_view layer] setBorderWidth:1.0];
	[[lay_view layer] setBorderColor:[UIColor blackColor].CGColor];
	[[lay_view layer] setCornerRadius:10.0];
	[[lay_view layer] setMasksToBounds:YES];
	
	BarChartViewController *bar = [[BarChartViewController alloc] init];
	//[bar.view setAutoresizesSubviews:YES];
	[bar.view setFrame:CGRectMake(0,80, 320, 300)];
	
	[self.view addSubview:bar.view];
	
	
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
	
	[lay_view release];
    [super dealloc];
}


@end
