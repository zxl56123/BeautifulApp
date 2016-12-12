//
//  ViewController.m
//  BeautifulApp
//
//  Created by 郑晓龙 on 16/8/12.
//  Copyright © 2016年 郑晓龙. All rights reserved.
//

#import "ViewController.h"
#import "NewsTableViewCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *ar_title;
@property (nonatomic, strong) NSArray *ar_Content;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"GitHub Learn");
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    //假数据
    self.ar_title = @[
                      @"<font size=\"4.7\" color=\"red\">习近平出席G20领导人峰会活动纪实</font>",
                      @"习近平谈一带一路这三年",
                      @"上网"];
    self.ar_Content = @[
                        @"初秋九月，钱江潮起。世界的目光聚焦“G20杭州时间",
                        @"3年前的2013年9月7日 ，习近平在哈萨克斯坦纳扎尔巴耶夫大学发表演讲，提出了共同建设“丝绸之路经济带”的畅想。",
                        @"lailailai"];

    [_tableView reloadData];
}


#pragma mark --TableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_ar_title count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsTableViewCell *cell = [NewsTableViewCell cellWithTableView:tableView];
    
    NSAttributedString * attrStr = [[NSAttributedString alloc] initWithData:[_ar_title[indexPath.row] dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
    
    [cell setTitle:attrStr newsContent:_ar_Content[indexPath.row]];
    
    return cell;
}

-(CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}
-(CGFloat )tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.001;
}
-(CGFloat )tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.001;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [[UIView alloc]init];
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [[UIView alloc]init];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

//    解决tableView分割线左边不到边的情况2⃣️
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPat
{
    if([cell respondsToSelector:@selector(setLayoutMargins:)])
    {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    if([cell respondsToSelector:@selector(setSeparatorInset:)]){
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
}

#pragma mark - 懒加载
-(NSArray *)ar_title
{
    if (!_ar_title) {
        _ar_title = [[NSArray alloc] init];
    }

    return _ar_title;
}

-(NSArray *)ar_Content
{
    if (!_ar_Content) {
        _ar_Content = [[NSArray alloc] init];
    }
    
    return _ar_Content;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
