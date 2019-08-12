//
//  Request.m
//  JSONDemoByOC
//
//  Created by Benson on 2019/8/10.
//  Copyright © 2019年 Benson. All rights reserved.
//

#import "Request.h"

#define CATEGORYSEARCH @"ipNew"

@implementation Request
+ (void)searchParameters:(NSDictionary *)parameters andCallback:(void (^)(NSDictionary *))callbackToDataSource
{
    [self postParameters:parameters andURL:CATEGORYSEARCH withCallback:^(NSDictionary *post_dic, NSError *error)
     {
         //原生解析
         NSLog(@"------%@-------",post_dic);
         NSDictionary *dic = post_dic;
       if([dic[@"resultcode"] isEqualToString:@"200"])
       {
           printf("开始解析数据/n");
           if ([dic[@"result"] isKindOfClass:[NSDictionary class]])
           {
               NSDictionary *resultDic = dic[@"result"];
               NSLog(@"%@", resultDic);
               NSMutableDictionary *sendDic = [[NSMutableDictionary alloc]init];
               [sendDic setObject:resultDic[@"City"] forKey: @"City"];
               [sendDic setObject:resultDic[@"Country"] forKey:@"Country"];
               [sendDic setObject:resultDic[@"Isp"] forKey:@"Isp"];
               [sendDic setObject:resultDic[@"Province"] forKey:@"Province"];
               callbackToDataSource(sendDic);
           }
           else
           {
               NSLog(@"解析失败");
           }
       }
       else
       {
           printf("请求失败");
       }
     }];
    
}




@end
