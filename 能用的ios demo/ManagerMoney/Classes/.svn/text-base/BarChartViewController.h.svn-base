//
//  BarChartViewController.h
//  CorePlotDemo
//
//  Created by Terry on 7/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CorePlot-CocoaTouch.h"


@interface BarChartViewController : UIViewController <CPPieChartDelegate, CPPlotDataSource>{
	@private
	CPXYGraph      *pieChart;
	NSMutableArray *dataForChart;
	NSMutableArray *nameArray;
	NSTimer        *timer;
}

@property (readwrite, retain, nonatomic) NSMutableArray *dataForChart;
@property (readwrite, retain, nonatomic) NSTimer        *timer;
@property (readwrite, retain, nonatomic) NSMutableArray *nameArray;

- (void)timerFired;

@end
