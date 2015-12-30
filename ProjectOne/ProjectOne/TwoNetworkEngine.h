//
//  TwoNetworkEngine.h
//  ProjectOne
//
//  Created by SCJY on 15/12/29.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum{
    NetworkEngineTypeGET,  //GET网络请求
    NetworkEngineTypePOST,  //POST网络请求
    NetworkEngineTypePUT,   //PUT网络请求
    NetworkEngineTypeDELETE   //DELETE网络请求
}NetworkEngineType;


//只需要让代理协议知道有NetworkEngine这个类，而不需要编译NetworkEngine里边的内容
@class TwoNetworkEngine;
//1.创建网络请求的代理
@protocol NetworkEngineDelegate <NSObject>
//网络请求开始
- (void)networkDidStartLoading:(TwoNetworkEngine *)networkEngine;
- (void)networkDidFinishLoading:(TwoNetworkEngine *)networkEngine withResponseObject:(id)responseObject;
@end


@interface TwoNetworkEngine : NSObject
+ (instancetype)networkEngineWithURLString:(NSString *)urlString parameters:(NSDictionary *)parameters requestDelegate:(id<NetworkEngineDelegate>)delegate httpMethodType:(NetworkEngineType)networkType;

- (void)startRequestNetwork;


@end
