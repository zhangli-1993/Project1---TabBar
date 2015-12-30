//
//  TwoNetworkEngine.m
//  ProjectOne
//
//  Created by SCJY on 15/12/29.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import "TwoNetworkEngine.h"

@interface TwoNetworkEngine()
//请求网址
@property(nonatomic, copy) NSString *urlString;
//请求参数
@property(nonatomic, retain) NSDictionary *parameters;
//代理对象
@property(nonatomic, assign) id<NetworkEngineDelegate>delegate;
//请求方式
@property(nonatomic, assign) NetworkEngineType networkType;
@end


@implementation TwoNetworkEngine
- (instancetype)initWithURLString:(NSString *)urlString parameters:(NSDictionary *)parameters requestDelegate:(id<NetworkEngineDelegate>)delegate httpMethodType:(NetworkEngineType)networkType{
    self = [super init];
    if (self) {
        self.urlString = urlString;
        self.parameters = parameters;
        self.delegate = delegate;
        self.networkType = networkType;
    }
    return self;
}
+ (instancetype)networkEngineWithURLString:(NSString *)urlString parameters:(NSDictionary *)parameters requestDelegate:(id<NetworkEngineDelegate>)delegate httpMethodType:(NetworkEngineType)networkType{
    TwoNetworkEngine *networkEngine = [[TwoNetworkEngine alloc]initWithURLString:urlString parameters:parameters requestDelegate:delegate httpMethodType:networkType];
    return networkEngine;
}

//7.开始网络请求
- (void)startRequestNetwork{
    //7.1把请求网址字符串转化成NSURL
    NSURL *url = [NSURL URLWithString:self.urlString];
    //7.2创建一个网络请求对象,赋初值nil
    NSMutableURLRequest *request = nil;
    //7.3判断网络类型
    if (self.networkType == NetworkEngineTypeGET) {
        //GET请求
        //添加请求网址
        request = [NSMutableURLRequest requestWithURL:url];
        //设置请求类型
        [request setHTTPMethod:@"GET"];
        
    }else if (self.networkType == NetworkEngineTypePOST){
        //10.POST请求
        request = [NSMutableURLRequest requestWithURL:url];
        //设置请求方式
        [request setHTTPMethod:@"POST"];
        //配置POST请求参数
        if (self.parameters) {
            [request setHTTPBody:[self parametersTransfromToHttpBody]];
        }
        
    }
    //12.设置请求超时时间,时间超过15s则返回请求失败
    [request setTimeoutInterval:15.0];
    
    //9.在网络请求开始的时候把网络请求开始方法传给代理对象
    if (self.delegate && [self.delegate respondsToSelector:@selector(networkDidStartLoading:)]) {
        [self.delegate networkDidStartLoading:self];
    }
    
    
    
    //8.异步链接实现网络请求（block）
    __block TwoNetworkEngine *weakEngine = self;
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        //8.1如果error存在说明请求出错
        if (connectionError != nil) {
            NSLog(@"%@", connectionError);
        }else{
            //8.2判断代理是否存在且执行
            if (self.delegate && [self.delegate respondsToSelector:@selector(networkDidFinishLoading:withResponseObject:)]) {
                //8.3 JSON解析
                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                //8.4把数据传给代理对象
                [self.delegate networkDidFinishLoading:weakEngine withResponseObject:dic];
            }
        }
    }];
    
}

//11.把用户传递的POST请求参数转化为NSData类型
- (NSData *)parametersTransfromToHttpBody{
    //11.1 获取字典中所有的键值
    NSArray *keyArray = self.parameters.allKeys;
    //11.2 创建一个可变数组存放所有的键值
    NSMutableArray *keyValueArray = [NSMutableArray new];
    for (NSString *key in keyArray) {
        NSString *param = [NSString stringWithFormat:@"%@=%@", key, self.parameters[key]];
        [keyValueArray addObject:param];
    }
    //11.3 将数组的元素之间拼接上&符号
    NSString *parameter = [keyValueArray componentsJoinedByString:@"&"];
    //11.4 字符串类型转化为data
    NSData *data = [parameter dataUsingEncoding:NSUTF8StringEncoding];
    return data;
}

@end
