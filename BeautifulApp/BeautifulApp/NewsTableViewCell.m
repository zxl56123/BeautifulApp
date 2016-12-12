//
//  NewsTableViewCell.m
//  BeautifulApp
//
//  Created by 郑晓龙 on 16/9/7.
//  Copyright © 2016年 郑晓龙. All rights reserved.
//

#import "NewsTableViewCell.h"

@interface NewsTableViewCell()
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UILabel *newsContent;


@end

@implementation NewsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"NewsTableViewCell";
    NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        // 从xib中加载cell
        cell = [[[NSBundle mainBundle] loadNibNamed:ID owner:nil options:nil] lastObject];
    }
    //cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}


-(void)setTitle:(NSAttributedString *)title newsContent:(NSString *)newsContent
{
    _title.attributedText = title;
    _title.font = [UIFont systemFontOfSize:11];
    _newsContent.text = newsContent;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
