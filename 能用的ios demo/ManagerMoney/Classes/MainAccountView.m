//
//  MainAccountView.m
//  ManagerMoney
//
//  Created by 杨勇 on 11-11-3.
//  Copyright 2011 ultrawise. All rights reserved.
//

#import "MainAccountView.h"
#import "CustomCell.h"
#import <QuartzCore/QuartzCore.h>
@implementation MainAccountView
@synthesize tab_view;
@synthesize num_label;
@synthesize fenxi_btn;
@synthesize main_fenxi_view;
@synthesize cell;

UIImage *dd1[6];
UIImage *dd2[6];
NSString *ss2[6]={@"银行帐户",@"基金帐户",@"股票帐户",@"黄金帐户",@"外汇帐户",@"期货帐户",nil};
int ss1[6]={1000,2000,1500,3200,1000,1300,nil};

-(IBAction)back_btnClick:(id)sender{

	[self.view.superview.superview removeFromSuperview];
		
	
}


-(IBAction)fenxi_btnclick:(id)sender{

self.view=main_fenxi_view.view;


}




// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
	int sum=0;
	for (int i=1; i<=6; i++) {
		if (ss1[i-1]>=2000) {
			dd1[i-1]=[UIImage imageNamed:@"up.png"];
		}else {
			dd1[i-1]=[UIImage imageNamed:@"down.png"];
		}

		dd2[i-1]=[UIImage imageNamed:@"yinhangzhanghu.png"];
		sum+=ss1[i-1];
	}
	
	[[tab_view layer] setBorderWidth:1.0];
	[[tab_view layer] setBorderColor:[UIColor lightGrayColor].CGColor];
	[[tab_view layer] setCornerRadius:10.0];
	[[tab_view layer] setMasksToBounds:YES];
	
	//NSString *dd[]={@"",@""};

	[num_label setText:[[NSString alloc]initWithFormat:@"¥%d.00元",sum]];
	
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
    return 6;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	
	static NSString  *CellIdentifier=@"CustomCell";
	cell = (CustomCell *)[tab_view dequeueReusableCellWithIdentifier:CellIdentifier];   
	if (cell == nil) {   
		NSArray *array_1 = [[NSBundle mainBundle] loadNibNamed:@"CustomCell" owner:self options:nil];   
		cell = [array_1 objectAtIndex:0];   
		[cell setDelegate:self];
	}   
	[[cell label] setText:[[NSString alloc] initWithFormat:@"¥%d.00元",ss1[indexPath.row]]];  
	[[cell left_label] setText:ss2[indexPath.row]];
	[[cell label]setTextAlignment:UITextAlignmentLeft];
	//	[[cell bank_img] setImage:dd2[indexPath.row]];
    [[cell right_img] setImage:dd1[indexPath.row]];
	return cell;   
	
}




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
	[cell release];
	[fenxi_btn release];
	[tab_view release];
	[num_label release];
	[main_fenxi_view release];
    [super dealloc];
}


@end
