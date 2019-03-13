//
//  BaseChatCell.h
//  XibInherit
//
//  Created by 刘鹏i on 2019/3/13.
//  Copyright © 2019 wuhan.musjoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuView.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseChatCell : UITableViewCell <MenuViewDelegate>
@property (nonatomic, assign) BOOL isLeft;                              ///< 气泡左右方向 YES:向左 NO:向右
@property (weak, nonatomic) IBOutlet MenuView *viewContent;             ///< 内容视图

/// 加载父类xib
- (void)loadViewFromXib;

/// 加载子类xib
- (void)loadChildViewFromXib;

@end

NS_ASSUME_NONNULL_END
