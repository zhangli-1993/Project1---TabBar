//
//  TwoViewController.m
//  ProjectOne
//
//  Created by SCJY on 15/12/29.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import "TwoViewController.h"
#import "TwoTableViewCell.h"
#import "TwoModel.h"
@interface TwoViewController ()
@property(nonatomic, retain) UITableView *tableView;
@property(nonatomic, retain) NSMutableArray *allArray;

@end

@implementation TwoViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"军迷在线";
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.separatorColor = [UIColor cyanColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = self.view.frame.size.width / 5 + 20;
    [self.view addSubview:self.tableView];
    
     [self configData];
}




- (void)configData{
   // NSLog(@"%@", self.dictionary);
    NSDictionary *diction =self.dictionary[@"root"];
    NSArray *listArray = diction[@"list"];
    self.allArray = [NSMutableArray new];
    for (NSDictionary *dic in listArray) {
        NSLog(@"%@", dic);
        TwoModel *model = [[TwoModel alloc]initWithDictionary:dic];
        [self.allArray addObject:model];
    }
    NSLog(@"%@", self.allArray);
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  
    return self.allArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *str = @"123";
    TwoTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        cell = [[TwoTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:str];
    }
    cell.model = self.allArray[indexPath.row];
    return cell;
}
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return [TwoTableViewCell getHeightWithModel:self.allArray[indexPath.row]];
//}
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return 1;
//}
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
