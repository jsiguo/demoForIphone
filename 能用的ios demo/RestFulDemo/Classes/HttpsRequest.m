//
//  HttpsRequest.m
//  RestFulDemo
//
//  Created by gsm on 11-11-23.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "HttpsRequest.h"
#import "ASIHTTPRequest.h"

@implementation HttpsRequest

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
@end
