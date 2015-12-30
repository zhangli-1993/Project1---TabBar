//
//  ViewController.m
//  ProjectOne
//
//  Created by SCJY on 15/12/29.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import "ViewController.h"
#import "TwoNetworkEngine.h"
#import "TwoViewController.h"

@interface ViewController ()<NetworkEngineDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    TwoNetworkEngine *networkEngine = [TwoNetworkEngine networkEngineWithURLString:@"http://api.milltary.app887.com/api/Articles.action?opc=10&npc=0&type=%E6%9C%80%E6%96%B0%E9%B2%9C" parameters:nil requestDelegate:self httpMethodType:NetworkEngineTypeGET];
    [networkEngine startRequestNetwork];
    
}
- (void)networkDidStartLoading:(TwoNetworkEngine *)networkEngine{
    NSLog(@"网络请求开始");
}
- (void)networkDidFinishLoading:(TwoNetworkEngine *)networkEngine withResponseObject:(id)responseObject{
    TwoViewController *two = [[TwoViewController alloc]init];
    two.dictionary = responseObject;
    [self.navigationController pushViewController:two animated:YES];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
