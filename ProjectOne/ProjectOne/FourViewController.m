//
//  FourViewController.m
//  ProjectOne
//
//  Created by scjy on 15/12/29.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import "FourViewController.h"
#import "FourTableViewCell.h"
#import "FourModel.h"

@interface FourViewController ()<UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, retain) UITableView *tableView;
@property(nonatomic, retain) NSMutableArray *allArray;

@end

@implementation FourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];
    
    //解析plist
    [self configPlist];
}

- (UITableView *)tableView{
    if (!_tableView) {
        self.tableView = [[UITableView alloc] initWithFrame:self.view.frame];
        self.tableView.separatorColor = [UIColor redColor];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
    }
    return _tableView;
}

- (void)configPlist{
     NSString *path = [[NSBundle mainBundle]pathForResource:@"file" ofType:@".plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    NSDictionary *rootDic = dic[@"root"];
    NSArray *array = rootDic[@"list"];
    self.allArray = [NSMutableArray new];
    for (NSDictionary *obj in array) {
        FourModel *model = [[FourModel alloc] initWithDictionary:obj];
        [self.allArray addObject:model];
    }
    
}

#pragma mark --------UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.allArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
 static NSString *cellIdentifier = @"cellIdentifier";
    FourTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[FourTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    cell.model = self.allArray[indexPath.row];
    return cell;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [UIScreen mainScreen].bounds.size.width / 4;
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
