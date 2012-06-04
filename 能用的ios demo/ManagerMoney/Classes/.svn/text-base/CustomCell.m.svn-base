    //
//  CustomCell.m
//  ManagerMoney
//
//  Created by 杨勇 on 11-11-4.
//  Copyright 2011 ultrawise. All rights reserved.
//

#import "CustomCell.h"


@implementation CustomCell

@synthesize delegate;
@synthesize label,bank_img,right_img;  
@synthesize left_label;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//	if(selected){
//		[[self delegate] performSelector:@selector(showMenu:) withObject:self afterDelay:0.18f];
//		
//	}
	
	[super setSelected:selected animated:animated];
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
	
    [super setHighlighted:highlighted animated:animated];
	
}

//- (BOOL)canBecomeFirstResponder 
//{
//    return YES;
//}
//
//- (BOOL)canPerformAction:(SEL)action withSender:(id)sender{
//	
//	return [super canPerformAction:action withSender:sender];
//	
//}
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
 // Implement loadView to create a view hierarchy programmatically, without using a nib.
 - (void)loadView {
 }
 */

- (void)dealloc {
	[label release];   
	[bank_img release];
	[delegate release];
	[right_img release];
	[left_label release];
    [super dealloc];
}


@end

