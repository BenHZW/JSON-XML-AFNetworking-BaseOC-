//
//  Request.h
//  JSONDemoByOC
//
//  Created by Benson on 2019/8/10.
//  Copyright © 2019年 Benson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+GetRequest.h"



@interface Request : NSObject

+ (void)searchParameters:(NSDictionary *)parameters andCallback:(void (^)(NSDictionary *categorySearchDic))callbackToDataSource;


@end
