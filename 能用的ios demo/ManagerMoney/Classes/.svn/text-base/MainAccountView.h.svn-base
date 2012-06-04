//
//  MainAccountView.h
//  ManagerMoney
//
//  Created by 杨勇 on 11-11-3.
//  Copyright 2011 ultrawise. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainAccountAnalyseView.h"
#import "CustomCell.h"
//主账户页
@interface MainAccountView : UIViewController<UITableViewDataSource,UITableViewDelegate> {

	IBOutlet UITableView *tab_view;   
	IBOutlet UILabel *num_label;  
	IBOutlet UIButton *fenxi_btn;
	
	
	MainAccountAnalyseView *main_fenxi_view;
	
	CustomCell *cell;
}

@property(nonatomic,retain) UITableView *tab_view;     
@property(nonatomic,retain) UILabel *num_label; 
@property(nonatomic,retain) UIButton *fenxi_btn;
@property(nonatomic,retain)	IBOutlet MainAccountAnalyseView *main_fenxi_view;

@property (nonatomic,retain) CustomCell *cell;


-(IBAction)fenxi_btnclick:(id)sender;
-(IBAction)back_btnClick:(id)sender;
@end
