//
//  ThreeViewController.m
//  ProjectOne
//
//  Created by wanghongxiao on 15/12/29.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import "ThreeViewController.h"
#import "ThreeTableViewCell.h"
#import "ThreeModel.h"

@interface ThreeViewController ()
@property(nonatomic, retain) UITableView *tableView;
@property(nonatomic, retain) NSMutableArray *allContent;
@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];
    //解析
    [self config];
}
- (void)config{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"file" ofType:@".plist"];
    NSDictionary *dic1 = [NSDictionary dictionaryWithContentsOfFile:path];
    NSDictionary *dic2 = dic1[@"root"];
    NSArray *array = dic2[@"list"];
    self.allContent = [NSMutableArray new];
    for (NSDictionary *dic in array) {
        ThreeModel *model = [ThreeModel getDictionary:dic];
        [self.allContent addObject:model];
    }
    NSLog(@"%@", self.allContent);
}
- (UITableView *)tableView{
    if (_tableView == nil) {
        self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        self.tableView.separatorColor = [UIColor redColor];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
    }
    return _tableView;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cellIdentifier";
    ThreeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[ThreeTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    cell.model = self.allContent[indexPath.row];
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
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
