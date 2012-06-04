//
//  MD5HexDigest.h
//  RestFulDemo
//
//  Created by gsm on 11-11-23.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>

@interface MD5HexDigest : NSObject {
}
//MD5散列
-(NSString *) md5:(NSString *)str;
@end