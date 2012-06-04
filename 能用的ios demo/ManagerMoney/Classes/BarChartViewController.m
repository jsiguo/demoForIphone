    //
//  BarChartViewController.m
//  CorePlotDemo
//
//  Created by Terry on 7/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "BarChartViewController.h"



@implementation BarChartViewController

@synthesize dataForChart;
@synthesize timer;
@synthesize nameArray;



/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	//Add some initial data
//	NSMutableArray *contentArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithDouble:20.0],
//									[NSNumber numberWithDouble:30.0], 
//									[NSNumber numberWithDouble:60.0],
//									[NSNumber numberWithDouble:40.0],
//									[NSNumber numberWithDouble:10.0],
//									[NSNumber numberWithDouble:5.0],
//									nil];
	
	NSMutableArray *contentArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithDouble:15.0],
									[NSNumber numberWithDouble:12.0], 
									[NSNumber numberWithDouble:45.0],
									[NSNumber numberWithDouble:28.0],
									nil];
//	nameArray = [[NSMutableArray alloc] initWithObjects:@"银行帐户",@"基金帐户",@"股票账户",@"黄金账户",@"外汇账户",@"期贷账户",nil];
//	nil];
	nameArray = [[NSMutableArray alloc] initWithObjects:@"中国人民银行",@"中国建设银行",@"中国农业银行",@"交通银行",nil];
	self.dataForChart = contentArray;
	[self timerFired];
#ifdef MEMORY_TEST
	self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timerFired) userInfo:nil repeats:YES];
#endif
	
    [super viewDidLoad];
}

- (void)timerFired
{
#ifdef MEMORY_TEST
	static NSUInteger counter = 0;
	NSLog(@"\n------------\ntimerFired: %lu", counter++);
#endif
	[pieChart release];

	//Create pieChart from theme
	pieChart = [[CPXYGraph alloc] initWithFrame:CGRectZero];
	//CPTheme *theme = [CPTheme themeNamed:kCPStocksTheme];
	//CPTheme *theme = [[MyCPTheme alloc] init];
	//[pieChart applyTheme:theme];
	CPGraphHostingView *hostingView = [[CPGraphHostingView alloc] initWithFrame:self.view.bounds];
	hostingView.hostedGraph = pieChart;
	[self.view addSubview:hostingView];
	[hostingView release];
	
	pieChart.paddingLeft = 0.0;
	pieChart.paddingTop  = 0.0;
	pieChart.paddingRight = 0.0;
	pieChart.paddingBottom = 0.0;
	
	
	
	pieChart.axisSet = nil;
	pieChart.titleTextStyle.color = [CPColor whiteColor];
	//pieChart.title = @"Graph Title";
	
	//Add pie chart
	CPPieChart *piePlot = [[CPPieChart alloc] init];
	piePlot.dataSource = self;
	piePlot.pieRadius = 90.0;
	piePlot.identifier = @"Pie chart 1";
	piePlot.startAngle = M_PI_4;
	piePlot.sliceDirection = CPPieDirectionCounterClockwise;
	//piePlot.centerAnchor = CGPointMake(0.5, 0.38);
	piePlot.borderLineStyle = [CPLineStyle lineStyle];
	piePlot.delegate = self;
	[pieChart addPlot:piePlot];
	[piePlot release];
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return YES;
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
	CGFloat margin = pieChart.plotAreaFrame.borderLineStyle.lineWidth + 5.0;
	
	CPPlot *piePlot = [pieChart plotWithIdentifier:@"Pie chart 1"];
	CGRect plotBounds = pieChart.plotAreaFrame.bounds;
	CGFloat newRadius = MIN(plotBounds.size.width, plotBounds.size.height)/2.0 - margin;
	((CPPieChart *)piePlot).pieRadius = newRadius;
	
	CGFloat y = 0.0;
	if (plotBounds.size.width > plotBounds.size.height) {
		y = 0.5;
	}else {
		y = (newRadius + margin) / plotBounds.size.height;
	}
	((CPPieChart *)piePlot).centerAnchor = CGPointMake(0.5, y);
}
#pragma mark -
#pragma mark Plot Data Source Methods

- (NSUInteger)numberOfRecordsForPlot:(CPPlot *)plot
{
	return [self.dataForChart count];
}

//获取伞形的值
- (NSNumber *)numberForPlot:(CPPlot *)plot field:(NSUInteger)fieldEnum recordIndex:(NSUInteger)index
{
	if (index >= [self.dataForChart count]) {
		return nil;
	}
	if (fieldEnum == CPPieChartFieldSliceWidth) {
		return [self.dataForChart objectAtIndex:index];
	}
	else {
		return [NSNumber numberWithInt:index];
	}

}

//设置伞形的标题
-(CPLayer *)dataLabelForPlot:(CPPlot *)plot recordIndex:(NSUInteger)index 
{
	//NSLog(@"----------%d",index);
	NSString *str = [[NSString alloc] initWithFormat:@"%@",[nameArray objectAtIndex:index]];
	//NSLog(@"----------%@",str);
	
	
	CPTextLayer *label = [[CPTextLayer alloc] initWithText:[NSString stringWithFormat:@"%@", str]];
    CPMutableTextStyle *textStyle = [label.textStyle mutableCopy];
	textStyle.color = [CPColor blackColor];
    label.textStyle = textStyle;
    [textStyle release];
	return [label autorelease];
}

-(CGFloat)radialOffsetForPieChart:(CPPieChart *)pieChart recordIndex:(NSUInteger)index
{
    return /*( index == 0 ? 30.0f : 0.0f );*/0;
}

/*-(CPFill *)sliceFillForPieChart:(CPPieChart *)pieChart recordIndex:(NSUInteger)index; 
 {
 return nil;
 }*/

#pragma mark -
#pragma mark Delegate Methods

//单击伞形时触发的事件
-(void)pieChart:(CPPieChart *)plot sliceWasSelectedAtRecordIndex:(NSUInteger)index
{
	//pieChart.title = [NSString stringWithFormat:@"Selected index: %lu", index];
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
	[pieChart release];
	[dataForChart release];
	[timer release];
    [super dealloc];
}


@end
