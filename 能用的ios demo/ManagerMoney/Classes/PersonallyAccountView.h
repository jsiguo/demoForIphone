//
//  PersonallyAccountView.h
//  ManagerMoney
//
//  Created by 杨勇 on 11-11-3.
//  Copyright 2011 ultrawise. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomCell.h"
#import "MainAccountView.h"
#import "NewAddAccountView.h"


//个人账户页
@interface PersonallyAccountView : UIViewController<UITableViewDataSource,UITableViewDelegate> {
	
	UITableView *tab_view;
	UIButton *main_btn;
	MainAccountView *main_view;
	NewAddAccountView *add_acc_view;
	
	
	CustomCell *cell;
	
}
@property (nonatomic,retain)IBOutlet UITableView *tab_view;
@property (nonatomic,retain)IBOutlet MainAccountView *main_view;
@property (nonatomic,retain)IBOutlet UIButton *main_btn;
@property (nonatomic,retain)IBOutlet NewAddAccountView *add_acc_view;


@property (nonatomic,retain)CustomCell *cell;

-(IBAction)main_btnClick:(id)sender;

-(IBAction)back_btnClick:(id)sender;

-(IBAction)add_btnClick:(id)sender;
@end
