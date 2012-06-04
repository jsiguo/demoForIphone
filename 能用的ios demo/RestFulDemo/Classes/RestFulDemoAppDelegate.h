//
//  RestFulDemoAppDelegate.h
//  RestFulDemo
//
//  Created by gsm on 11-11-22.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RestFulDemoViewController;

@interface RestFulDemoAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    RestFulDemoViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet RestFulDemoViewController *viewController;

@end

