//
//  ViewController.m
//  JSONDemoByOC
//
//  Created by Benson on 2019/8/10.
//  Copyright © 2019年 Benson. All rights reserved.
//
  
#import "ViewController.h"
#import "Request.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"已进行");
    [Request searchParameters:@{@"ip":@"111.41.177.229"} andCallback:^(NSDictionary *categorySearchDic)
    {
        //utf8转中文
        NSString *city = [categorySearchDic[@"City"] stringByRemovingPercentEncoding];
        NSString *country = [categorySearchDic[@"Country"] stringByRemovingPercentEncoding];
        NSString *isp = [categorySearchDic[@"Isp"] stringByRemovingPercentEncoding];
        NSString *province = [categorySearchDic[@"Province"] stringByRemovingPercentEncoding];
        
        NSString *allString = [NSString stringWithFormat:@"请求数据的城市为:%@,国家为%@,Isp为%@,省为%@",city,country,isp,province];
        NSLog(@"%@",allString);
    }];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
