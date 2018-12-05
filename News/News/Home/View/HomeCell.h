//
//  HomeCell.h
//  News
//
//  Created by tupservice on 2018/12/3.
//  Copyright © 2018年 huawei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"
#import "HomeCell.h"
#import "UIView+FrameHelper.h"

@protocol HomeCellDelegate <NSObject>

- (void)clickCell:(UITableViewCell *)cell WithType:(int)type;

@end

@interface HomeCell : UITableViewCell

@property (nonatomic,strong)Person *p;

@property (weak,nonatomic)id<HomeCellDelegate> delegate;


@end

