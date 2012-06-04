//
//  SSLDemoViewController.m
//  SSLDemo
//
//  Created by gsm on 11-11-24.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SSLDemoViewController.h"
#import <Security/Security.h> 
#import "ASIHTTPRequest.h"
#import <CoreFoundation/CoreFoundation.h>


@implementation SSLDemoViewController
@synthesize txt;
//按钮监听
-(IBAction) btn_SSL:(id) sender{
	
	//Resources文件夹中的资源
	NSBundle *bundle = [NSBundle mainBundle];    
	NSString *p12 = [bundle pathForResource:@"client" ofType:@"p12"];
	NSLog(@"Resources文件夹中的证书=%@",p12);
	//访问https
	NSURL *httpsUrl = [NSURL URLWithString:@"https://192.168.5.113:8443/DDFx_for_Mobile/services/AccSystemOperate/getExtraCode"];
	NSString *strresponse=[self testClientCertificate:httpsUrl];
	
	UIAlertView *alert=[[UIAlertView alloc]
						initWithTitle:@"警告提示框"
						message:strresponse
						delegate:self
						cancelButtonTitle:@"OK"
						otherButtonTitles:nil];
	[alert show];
	[alert release];
}



- (NSString*)testClientCertificate:(NSString *)httpsUrl{   
   	
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:httpsUrl];   
	
    SecIdentityRef identity = NULL;   
    SecTrustRef trust = NULL;   
	
	//绑定证书，证书放在Resources文件夹中   
    NSData *PKCS12Data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"client" ofType:@"p12"]]; 
	
    
	[self extractIdentity:&identity andTrust:&trust fromPKCS12Data:PKCS12Data];   
	
    //request = [ASIHTTPRequest requestWithURL:httpsUrl];   
	
    [request setClientCertificateIdentity:identity];   
    [request setValidatesSecureCertificate:NO];   
    [request startSynchronous];   
	
    NSError *error = [request error];   
	NSString *response=nil;
    if (!error) {   
		response= [request responseString];   
        NSLog(@"response is : %@",response);   
    } else {   
        NSLog(@"Failed to save to data store: %@", [error localizedDescription]);   
        NSLog(@"%@",[error userInfo]);   
    }  
	
	return response;
}   

- (BOOL)extractIdentity:(SecIdentityRef *)outIdentity andTrust:(SecTrustRef*)outTrust fromPKCS12Data:(NSData *)inPKCS12Data {   
    OSStatus securityError = errSecSuccess;   
	
    CFStringRef password = CFSTR("123456"); //证书密码   
    const void *keys[] =   { kSecImportExportPassphrase };   
	const void *values[] = { password };   
	
    CFDictionaryRef optionsDictionary = CFDictionaryCreate(NULL, keys,values, 1,NULL, NULL);    
	
	//服务端证书创建
    CFArrayRef items = CFArrayCreate(NULL, 0, 0, NULL);   
    //securityError = SecPKCS12Import((CFDataRef)inPKCS12Data,(CFDictionaryRef)optionsDictionary,&items);   
    securityError = SecPKCS12Import((CFDataRef)inPKCS12Data,optionsDictionary,&items);    
	
    if (securityError == 0) {    
        CFDictionaryRef myIdentityAndTrust = CFArrayGetValueAtIndex (items, 0);   
        const void *tempIdentity = NULL;   
        tempIdentity = CFDictionaryGetValue (myIdentityAndTrust, kSecImportItemIdentity);   
        *outIdentity = (SecIdentityRef)tempIdentity;   
		
		
		const void *tempTrust = NULL;  
        tempTrust = CFDictionaryGetValue (myIdentityAndTrust, kSecImportItemTrust);   
        *outTrust = (SecTrustRef)tempTrust;   
    } else {   
        NSLog(@"Failed with error code %d",(int)securityError);   
        return NO;   
    }   
    return YES;   
} 

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[txt release];
    [super dealloc];
}

@end
