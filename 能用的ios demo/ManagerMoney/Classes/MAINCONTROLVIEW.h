//
//  MAINCONTROLVIEW.h
//  ManagerMoney
//
//  Created by 杨勇 on 11-11-3.
//  Copyright 2011 ultrawise. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "HomeView.h"
//#import "PersonallyAccountView.h"


@interface MAINCONTROLVIEW : UIViewController {

	UIView *center_view;
	//UIView *curr_view;
	
	
}

@property (nonatomic,retain)IBOutlet UIView *center_view;
//@property (nonatomic,retain)IBOutlet PersonallyAccountView *login_view;
@property (nonatomic,retain)IBOutlet UIView *curr_view;

-(IBAction)set_View:(UIView *)curr_view;
-(UIView *)get_View;
@end
