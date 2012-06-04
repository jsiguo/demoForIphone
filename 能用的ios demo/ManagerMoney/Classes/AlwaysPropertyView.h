//
//  AlwaysPropertyView.h
//  ManagerMoney
//
//  Created by 杨勇 on 11-11-3.
//  Copyright 2011 ultrawise. All rights reserved.
//

#import <UIKit/UIKit.h>

//总资产分析页
@interface AlwaysPropertyView : UIViewController {

	
	UIView *lay_view;
}
@property (nonatomic,retain)IBOutlet UIView *lay_view;

-(IBAction)back_btnClick:(id)sender;
@end
