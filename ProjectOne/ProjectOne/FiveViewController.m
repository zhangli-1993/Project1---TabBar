//
//  FiveViewController.m
//  ProjectOne
//
//  Created by scjy on 15/12/29.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import "FiveViewController.h"
#import "FiveTableViewCell.h"
#import "FiveModel.h"
@interface FiveViewController ()
@property(nonatomic, retain) UITableView *tableView;
@property(nonatomic, retain) NSMutableArray *allNewsArray;
@end

@implementation FiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    self.title = @"FiveView";
    [self.view addSubview:self.tableView];
    self.view.backgroundColor = [UIColor greenColor];
    [self configTableData];
}
- (void)configTableData{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"file" ofType:@"plist"];
    NSDictionary *Root = [NSDictionary dictionaryWithContentsOfFile:path];
    
    NSDictionary *root = Root[@"root"];
    NSMutableArray *allArray = [NSMutableArray new];
    allArray = root[@"list"];
    self.allNewsArray = [NSMutableArray new];
    for (NSDictionary *dic in allArray) {
        FiveModel *model = [[FiveModel alloc]initWithDictory:dic];
        [self.allNewsArray addObject:model];
    }
    
}

- (UITableView *)tableView{
    if (_tableView == nil) {
        self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        self.tableView.rowHeight = 100;
        self.tableView.separatorColor = [UIColor redColor];
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        self.tableView.backgroundColor = [UIColor redColor];
    }
    return _tableView;

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.allNewsArray.count;
   
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
static NSString *cellIndentifier = @"cellIndentifier";
    FiveTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (cell == nil) {
        cell = [[FiveTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIndentifier];
    }
    FiveModel *model = self.allNewsArray[indexPath.row];
    cell.model = model;
//    cell.backgroundColor = [UIColor brownColor];
    return cell;
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
