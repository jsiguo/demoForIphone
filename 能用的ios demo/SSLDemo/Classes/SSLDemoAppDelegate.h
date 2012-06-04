//
//  SSLDemoAppDelegate.h
//  SSLDemo
//
//  Created by gsm on 11-11-24.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SSLDemoViewController;

@interface SSLDemoAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    SSLDemoViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet SSLDemoViewController *viewController;

@end

