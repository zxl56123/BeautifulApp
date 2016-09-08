//
//  NewsTableViewCell.h
//  BeautifulApp
//
//  Created by 郑晓龙 on 16/9/7.
//  Copyright © 2016年 郑晓龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsTableViewCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

-(void)setTitle:(NSString *)title newsContent:(NSString *)newsContent;

@end
