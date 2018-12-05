//
//  HomeCell.m
//  News
//
//  Created by tupservice on 2018/11/30.
//  Copyright © 2018年 huawei. All rights reserved.
//

#import "HomeCell.h"
@interface HomeCell ()

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *age;
@property (weak, nonatomic) IBOutlet UILabel *favorite;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;
@property (weak, nonatomic) IBOutlet UIButton *deleteBtn;
@property (weak, nonatomic) IBOutlet UIButton *changeBtn;
@property (weak, nonatomic) IBOutlet UIButton *findBtn;

@end
@implementation HomeCell
- (IBAction)add:(id)sender {
    
    
    if (self.delegate) {
        [self.delegate clickCell:self WithType:1];
    }
}
- (IBAction)delete:(id)sender {
    if (self.delegate) {
        [self.delegate clickCell:self WithType:2];
        
    }
}
- (IBAction)change:(id)sender {
    if (self.delegate) {
        [self.delegate clickCell:self WithType:3];    }
}
- (IBAction)find:(id)sender {
    if (self.delegate) {
        [self.delegate clickCell:self WithType:4];    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(@15);
        make.top.equalTo(@5);
        make.width.equalTo(@150);
        make.height.equalTo(@30);
    }];
    
    [self.age mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(@15);
        make.width.equalTo(@150);
        make.height.lessThanOrEqualTo(@30);
        make.height.equalTo(@30).priorityLow();
    }];
    
    [self.favorite mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(@15);
        make.width.equalTo(@150);
        make.height.lessThanOrEqualTo(@30);
        make.height.equalTo(@30).priorityLow();
    }];
    
    [self.addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(30, 30));
        make.right.equalTo(self.deleteBtn.mas_left).offset(-20);
        make.centerY.equalTo(self.mas_centerY).offset(-20);
    }];
    
    [self.deleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(30, 30));
        make.right.equalTo(self.mas_right).offset(-50);
         make.centerY.equalTo(self.mas_centerY).offset(-20);
    }];
    
    [self.changeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(30, 30));
        make.right.equalTo(self.findBtn.mas_left).offset(-20);
         make.centerY.equalTo(self.mas_centerY).offset(20);
    }];
    
    [self.findBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(30, 30));
        make.right.equalTo(self.mas_right).offset(-50);
         make.centerY.equalTo(self.mas_centerY).offset(20);
    }];
    
    self.name.textAlignment = NSTextAlignmentCenter;
    self.age.textAlignment = NSTextAlignmentCenter;
    self.favorite.textAlignment = NSTextAlignmentCenter;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    
    int ageHeight = [self.age.text boundingRectWithSize:CGSizeMake(100, 30) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17.0]} context:nil].size.height;
    if (ageHeight >0) {
        
        [self.age mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.name.mas_bottom).offset(5);
            make.height.equalTo(@30);
        }];
    }else{
        [self.age mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.name.mas_bottom);
            make.height.equalTo(@0);
        }];
        
    }
    
    
    int favoriteHeight = [self.favorite.text boundingRectWithSize:CGSizeMake(100, 30) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17.0]} context:nil].size.height;
    if (favoriteHeight >0) {
        [self.favorite mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.age.mas_bottom).offset(5);
            make.height.equalTo(@30);
            
        }];
    }else{
        [self.favorite mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.age.mas_bottom);
            make.height.equalTo(@0);
        }];
    }
    
    
}

- (void)setP:(Person *)p
{
    self.name.text = p.name;
    self.age.text = p.age;
    self.favorite.text = p.favorite;
}

- (CGSize)sizeThatFits:(CGSize)size {
    CGFloat totalHeight = 5;
    
    int nameHeight = [self.name.text boundingRectWithSize:CGSizeMake(100, 30) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17.0]} context:nil].size.height;
   
    if (nameHeight>0) {
        totalHeight += 30;
    }else{
        totalHeight += 0;
    }
    
     int ageHeight = [self.age.text boundingRectWithSize:CGSizeMake(100, 30) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17.0]} context:nil].size.height;
    if (ageHeight>0) {
        totalHeight += 30+5;
    }else{
        totalHeight += 0;
    }
    
     int favoriteHeight = [self.favorite.text boundingRectWithSize:CGSizeMake(100, 30) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17.0]} context:nil].size.height;
    
    if (favoriteHeight>0) {
        totalHeight += 30+5;
    }else{
        totalHeight += 0;
    }// margins
    totalHeight +=5;
    return CGSizeMake(size.width, totalHeight);
}

@end

