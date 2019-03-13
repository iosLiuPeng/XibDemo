//
//  MenuView.m
//  ExtremeVPN
//
//  Created by 刘鹏 on 2017/12/28.
//  Copyright © 2017年 Musjoy. All rights reserved.
//

#import "MenuView.h"

@interface MenuView ()
@property (nonatomic, assign) MenuViewItemType itemTypes;  ///< 菜单栏选项枚举
@property (nonatomic, strong) NSMutableArray <UIMenuItem *> *arrItems;//操作选项
@end

@implementation MenuView
#pragma mark - Life Circle
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self viewConfig];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self viewConfig];
}

#pragma mark - Subjoin
- (void)viewConfig
{
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    longPress.cancelsTouchesInView = YES;
    [self addGestureRecognizer:longPress];
}

#pragma mark - get & set
- (void)setItemTypes:(MenuViewItemType)itemTypes
{
    _itemTypes = itemTypes;
    
    _arrItems = [[NSMutableArray alloc] init];
    
    //是否包含复制
    BOOL containCopy = NO;
    
    if (itemTypes & MenuViewItemType_Copy) {
        //这里不知道为什么，当数组不为空时，会自动包含一个copy进去，所以这里就不需要添加copy
        containCopy = YES;
    }
    if (itemTypes & MenuViewItemType_Save) {
        //添加存储操作
        UIMenuItem *save = [[UIMenuItem alloc] initWithTitle:@"Save" action:@selector(save:)];
        [_arrItems addObject:save];
    }
    
    //如果没有任何选项，则置为nil
    if (_arrItems.count == 0 && containCopy == NO) {
        _arrItems = nil;
    }
}

#pragma mark - Action
- (void)longPress:(UILongPressGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateBegan) {
        // 让label成为第一响应者
        [self becomeFirstResponder];
        
        // 获得菜单
        UIMenuController *menu = [UIMenuController sharedMenuController];
        
        if ([_delegate respondsToSelector:@selector(itemTypesForDisplay:)]) {
            self.itemTypes = [_delegate itemTypesForDisplay:self];
        }
        
        // 设置菜单内容
        menu.menuItems = _arrItems;
        
        // 菜单最终显示的位置
        [menu setTargetRect:self.bounds inView:self];
        
        // 显示菜单
        [menu setMenuVisible:YES animated:YES];
    }
}

#pragma mark - UIMenuController相关
/**
 * 让Label具备成为第一响应者的资格
 */
- (BOOL)canBecomeFirstResponder
{
    return YES;
}

/**
 * 通过第一响应者的这个方法告诉UIMenuController可以显示什么内容
 */
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    if (action == @selector(copy:) ||
        action == @selector(save:)) {
        // 支持的操作
        return YES;
    } else {
        return NO;
    }
}

#pragma mark - 监听MenuItem的点击事件
/// 复制
- (void)copy:(UIMenuController *)menu
{
    if ([_delegate respondsToSelector:@selector(menuViewClickedCopy:)]) {
        [_delegate menuViewClickedCopy:self];
    }
}

/// 存储
- (void)save:(UIMenuController *)menu
{
    if ([_delegate respondsToSelector:@selector(menuViewClickedSave:)]) {
        [_delegate menuViewClickedSave:self];
    }
}

@end


