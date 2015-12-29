//
//  OneViewController.m
//  ProjectOne
//
//  Created by scjy on 15/12/29.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import "OneViewController.h"
#import "OneTableViewCell.h"
@interface OneViewController ()
@property(nonatomic, retain) UITableView *tableView;
@property(nonatomic, retain) NSMutableArray *array;
@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"张莉";
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    [self config];
    
    
    
    // Do any additional setup after loading the view.
}

//解析数据
- (void)config{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"file" ofType:@".plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    self.array = [NSMutableArray new];
    NSDictionary *dic1 = dic[@"root"];
    NSArray *arr = dic1[@"list"];
    for (NSDictionary *dic3 in arr) {
        OneModel *model = [[OneModel alloc] initWithDictory:dic3];
        [self.array addObject:model];
    }
}

//行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *str = @"123";
    OneTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        cell = [[OneTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:str];
    }
     cell.model = self.array[indexPath.row];
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [OneTableViewCell getCellHeight];
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
