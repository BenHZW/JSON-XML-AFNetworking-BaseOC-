//
//  ViewController.m
//  GDataXML
//
//  Created by Benson on 2019/8/12.
//  Copyright © 2019年 Benson. All rights reserved.
//

#import "ViewController.h"
#import <GDataXMLNode.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //获取工程目录的xml文件
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"xmlDemo" ofType:@"xml"];
    NSData *xmlData = [[NSData alloc] initWithContentsOfFile:filePath];
    
    //使用NSData对象初始化
    GDataXMLDocument *doc = [[GDataXMLDocument alloc]initWithData:xmlData error:nil];
    
    //获取根节点（Users）
    GDataXMLElement *rootElement = [doc rootElement];
    
    //获取根节点下的节点（User）
    NSArray *users = [rootElement elementsForName:@"User"];
    
    for (GDataXMLElement *user in users) {
        //User节点的id属性
        NSString *userId = [[user attributeForName:@"id"] stringValue];
        NSLog(@"User id is:%@",userId);
        
        //获取name节点的值
        GDataXMLElement *nameElement = [[user elementsForName:@"name"] objectAtIndex:0];
        NSString *name = [nameElement stringValue];
        NSLog(@"User name is:%@",name);
        
        //获取age节点的值
        GDataXMLElement *ageElement = [[user elementsForName:@"age"] objectAtIndex:0];
        NSString *age = [ageElement stringValue];
        NSLog(@"User age is:%@",age);
        NSLog(@"-------------------");
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
