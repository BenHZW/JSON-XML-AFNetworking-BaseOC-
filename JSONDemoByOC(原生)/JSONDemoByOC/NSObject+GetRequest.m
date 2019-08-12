//
//  NSObject+GetRequest.m
//  JSONDemoByOC
//
//  Created by Benson on 2019/8/10.
//  Copyright © 2019年 Benson. All rights reserved.
//

#import "NSObject+GetRequest.h"
#define HTTPSERVER @"http://apis.juhe.cn/ip/"

@implementation NSObject (GetRequest)

+ (void)postParameters:(NSDictionary *)parameters andURL:(NSString *)url withCallback:(void (^)(NSDictionary *, NSError *))callback
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //设置请求配置
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    //设置响应配置
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSString *URL = [NSString stringWithFormat:@"%@%@",HTTPSERVER,url];
    //设置参数字典
    NSMutableDictionary *parametersMutable = [[NSMutableDictionary alloc] init];
    [parametersMutable setObject:@"351c6328af5b0d966877f1773bd90832"forKey:@"key"];
    //拼接新的参数字典
    [parametersMutable addEntriesFromDictionary:parameters];
    
    //Get请求
    [manager GET:URL parameters:parametersMutable success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject)
     {
         //Json转字典
         NSDictionary *receiveDict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
         //回传
         callback(receiveDict,nil);
          
     }
         failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
         NSDictionary *errorDict = @{@"msg":@"网络似乎断开了哦"};
         if (callback)
         {
             callback(errorDict,[[NSError alloc] init]);
         }
     }];
    
}




@end
