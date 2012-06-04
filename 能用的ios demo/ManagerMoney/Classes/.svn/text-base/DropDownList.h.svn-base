//
//  DropDownList.h
//  ManagerMoney
//
//  Created by wangting on 11-11-3.
//  Copyright 2011 ultrawise. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>


@interface DropDownList : UIView<UITableViewDelegate,UITableViewDataSource> {
	
	UITextField* textField;   //文本输入框
	
	NSArray* list;            //下拉列表数据
	
	BOOL showList;             //是否弹出下拉列表
	
	UITableView* listView;    //下拉列表
	
	CGRect oldFrame,newFrame;   //整个控件（包括下拉前和下拉后）的矩形
	
	UIColor *lineColor,*listBgColor;//下拉框的边框色、背景色
	
	CGFloat lineWidth;               //下拉框边框粗细
	
	UITextBorderStyle borderStyle;   //文本框边框style
}

@property (nonatomic,retain)UITextField *textField;

@property (nonatomic,retain)NSArray* list;

@property (nonatomic,retain)UITableView* listView;

@property (nonatomic,retain)UIColor *lineColor,*listBgColor;

@property (nonatomic,assign)UITextBorderStyle borderStyle;

-(void)drawView;

-(void)setShowList:(BOOL)b;

- (id)initWithFrame:(CGRect)frame Data:(NSArray *) dataList;

@end
