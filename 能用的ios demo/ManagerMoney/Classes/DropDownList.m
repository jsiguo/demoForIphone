//
//  DropDownList.m
//  ManagerMoney
//
//  Created by wangting on 11-11-3.
//  Copyright 2011 ultrawise. All rights reserved.
//

#import "DropDownList.h"


@implementation DropDownList

@synthesize textField,list,listView,lineColor,listBgColor,borderStyle;


- (id)initWithFrame:(CGRect)frame {
    
	if(self=[super initWithFrame:frame]){
		
		//默认的下拉列表中的数据
		
		//list=[[NSArray alloc]initWithObjects:@"1",@"2",@"3",@"4",nil];
		
		
		borderStyle=UITextBorderStyleBezel;
		
		
		showList=NO; //默认不显示下拉框
		
		oldFrame=frame; //未下拉时控件初始大小
		
		//当下拉框显示时，计算出控件的大小。
		
		newFrame=CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height*5);
		
		
		lineColor=[UIColor lightGrayColor];//默认列表边框线为灰色
		
		listBgColor=[UIColor whiteColor];//默认列表框背景色为白色
		
		lineWidth=1;     //默认列表边框粗细为1
		
		
		//把背景色设置为透明色，否则会有一个黑色的边
		
		self.backgroundColor=[UIColor clearColor];
		
		[self drawView];//调用方法，绘制控件
		
		
	}
	
	return self;
}

- (id)initWithFrame:(CGRect)frame Data:(NSArray *) dataList{
	self.list = dataList;
	
	return [self initWithFrame:frame];
}

-(void)drawView{
	
	//文本框
	
	textField=[[UITextField alloc]
			   
			   initWithFrame:CGRectMake(0, 0,
										
										oldFrame.size.width, 
										
										oldFrame.size.height)];
	
	textField.borderStyle=borderStyle;//设置文本框的边框风格
	textField.textAlignment=UITextAlignmentCenter;
	textField.background=[UIImage imageNamed:@"selection.png"];
	[self addSubview:textField];
	
    [textField addTarget:self action:@selector(dropdown) forControlEvents:UIControlEventAllTouchEvents]; 
	
	
	//下拉列表
	
	listView=[[UITableView alloc]initWithFrame:
			  
			  CGRectMake(lineWidth,oldFrame.size.height+lineWidth, 
						 
						 oldFrame.size.width-lineWidth*2,
						 
						 oldFrame.size.height*[list count]-lineWidth*2)];
	
	listView.dataSource=self;
	
	listView.delegate=self;
	
	listView.backgroundColor=listBgColor;
	
	listView.separatorColor=lineColor;
	
	listView.hidden=!showList;//一开始listView是隐藏的，此后根据showList的值显示或隐藏
	
	[[listView layer] setBorderWidth:1.0];
	[[listView layer]setBorderColor:[UIColor grayColor].CGColor];
	listView.layer.cornerRadius=10.0;
	listView.layer.masksToBounds=YES;
	listView.backgroundColor=[UIColor whiteColor];
	
	[self addSubview:listView]; 
	
	[listView release];
	
}

-(void)dropdown{
	
	[textField resignFirstResponder];
	
	if (showList) {//如果下拉框已显示，什么都不做
		
		return;
		
	}else {//如果下拉框尚未显示，则进行显示
		
		//把dropdownList放到前面，防止下拉框被别的控件遮住
		
		
		[self.superview bringSubviewToFront:self];
		
		[self setShowList:YES];//显示下拉框
		
	}
	
}

-(NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section{
	
	return list.count;
	
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	
	static NSString *cellid=@"listviewid";
	
	UITableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:cellid];
	
	if(cell==nil){
		
		cell=[[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
			   
									reuseIdentifier:cellid]autorelease];
		
	}
	
	//文本标签
	
	cell.textLabel.text=(NSString*)[list objectAtIndex:indexPath.row];
	
	cell.textLabel.font=textField.font;
	cell.textLabel.textAlignment=UITextAlignmentCenter;
	
	cell.selectionStyle=UITableViewCellSelectionStyleGray;
	
	return cell;
	
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	
	return oldFrame.size.height;
	
}

//当选择下拉列表中的一行时，设置文本框中的值，隐藏下拉列表

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	
	NSLog(@"select");
	
	textField.text=(NSString*)[list objectAtIndex:indexPath.row];
	
	//NSLog(@"textField.text=%@",textField.text);
	
	[self setShowList:NO];
	
}

-(BOOL)showList{//setShowList:No为隐藏，setShowList:Yes为显示
	
	return showList;
	
}

-(void)setShowList:(BOOL)b{
	
	showList=b;
	
	NSLog(@"showlist is set ");
	
	if(showList){
		
		self.frame=newFrame;
		
	}else {
		
		self.frame=oldFrame;
		
	}
	
	listView.hidden=!b;
	
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code.
 }
 */

- (void)dealloc {
    [super dealloc];
}


@end
