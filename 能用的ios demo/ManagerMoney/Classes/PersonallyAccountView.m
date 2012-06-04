//
//  PersonallyAccountView.m
//  ManagerMoney
//
//  Created by 杨勇 on 11-11-3.
//  Copyright 2011 ultrawise. All rights reserved.
//

#import "PersonallyAccountView.h"

#import "CustomCell.h"

#import <QuartzCore/QuartzCore.h>

@implementation PersonallyAccountView


@synthesize tab_view;
@synthesize main_view;
@synthesize main_btn;
@synthesize add_acc_view;

@synthesize cell;



UIImage *dd[3];
//,@"中国银行",@"中国工商银行"
NSString *ss[3]={@"中国人民银行",@"交通银行",@"中国建设银行",nil};
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


-(IBAction)main_btnClick:(id)sender{
//	[self.view removeFromSuperview];
	self.view=main_view.view;
	

	
}

-(IBAction)back_btnClick:(id)sender{
	
	
	
	[self.view.superview.superview removeFromSuperview];

	
	
}


-(IBAction)add_btnClick:(id)sender{

self.view=add_acc_view.view;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
	
	for (int i=2; i<=4; i++) {
		dd[i-2]=[UIImage imageNamed:[[NSString alloc] initWithFormat:@"yinhang%d.png",i]];
		
	}
	
	//NSString *dd[]={@"",@""};
	
	[[tab_view layer] setBorderWidth:1.0];
	[[tab_view layer] setBorderColor:[UIColor lightGrayColor].CGColor];
	[[tab_view layer] setCornerRadius:10.0];
	[[tab_view layer] setMasksToBounds:YES];
	//[[tab_view setFrame:c]]	
	
    [super viewDidLoad];
}


-(void)tableview:(UITableView *)tableView didSelectRowIndexPath:(NSIndexPath *)indexpath{

	NSLog(indexpath.row);
	
}

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	
	static NSString  *CellIdentifier=@"CustomCell";
	cell = (CustomCell *)[tab_view dequeueReusableCellWithIdentifier:CellIdentifier];   
	if (cell == nil) {   
		NSArray *array_1 = [[NSBundle mainBundle] loadNibNamed:@"CustomCell" owner:self options:nil];   
		cell = [array_1 objectAtIndex:0];   
		[cell setDelegate:self];
	}   
	[[cell label] setText:ss[indexPath.row]];  
	[[cell bank_img] setImage:dd[indexPath.row]];
	return cell;   
	
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
	[main_view release];
	[main_btn release];
	[tab_view release];
	[add_acc_view release];
    [super dealloc];
}


@end
