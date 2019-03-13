//
//  TextChatCell.m
//  XibInherit
//
//  Created by 刘鹏i on 2019/3/13.
//  Copyright © 2019 wuhan.musjoy. All rights reserved.
//

#import "TextChatCell.h"

@interface TextChatCell ()
@property (strong, nonatomic) IBOutlet UILabel *lblMessage;       
@end

@implementation TextChatCell
#pragma mark - Life Circle
- (void)loadViewFromXib
{
    // 加载父类xib中内容
    [super loadViewFromXib];
    
    // 加载当前类xib中内容
    [super loadChildViewFromXib];
    
    // 页面配置
    [self viewConfig];
}

#pragma mark - Subjoin
/// 页面配置
- (void)viewConfig
{
    
}

- (void)setMessage:(NSString *)message
{
    _message = message;
    
    _lblMessage.text = message;
}

#pragma mark - MenuViewDelegate
/// 返回要显示的操作选项
- (MenuViewItemType)itemTypesForDisplay:(MenuView *)imageView
{
    return MenuViewItemType_Copy;
}

/// 点击了复制
- (void)menuViewClickedCopy:(MenuView *)imageView
{
    
}

@end
