//
//  MD5Encrypt.h
//  MD5Test
//
//  Created by  on 11-11-23.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
@interface MD5Encrypt : NSObject
//MD5散列
-(NSString *) md5:(NSString *)str;
@end
