//
//  NSObject+GetRequest.h
//  JSONDemoByOC
//
//  Created by Benson on 2019/8/10.
//  Copyright © 2019年 Benson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

@interface NSObject (GetRequest)

+ (void)postParameters:(NSDictionary *)parameters andURL:(NSString *)url withCallback:(void(^)(NSDictionary *post_dic,NSError *error))callback;




@end
