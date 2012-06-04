//
//  SSLDemoViewController.h
//  SSLDemo
//
//  Created by gsm on 11-11-24.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSLDemoViewController : UIViewController {

	IBOutlet UITextField *txt;//
}
@property (nonatomic,retain) UITextField *txt;
-(IBAction) btn_SSL:(id) sender;
@end
