//
//  CustomCell.h
//  ManagerMoney
//
//  Created by 杨勇 on 11-11-4.
//  Copyright 2011 ultrawise. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CustomCell : UITableViewCell {
    id delegate;
	IBOutlet UIImageView *bank_img;   
	IBOutlet UILabel *label;   
	IBOutlet UILabel *left_label;   
	IBOutlet UIImageView *right_img;  
}
@property (nonatomic, retain) id delegate;
@property(nonatomic,retain) UIImageView *bank_img;
@property(nonatomic,retain) UIImageView *right_img;    
@property(nonatomic,retain) UILabel *label;  
@property(nonatomic,retain) UILabel *left_label;  
@end
