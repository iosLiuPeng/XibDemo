//
//  MenuView.h
//  ExtremeVPN
//
//  Created by 刘鹏 on 2017/12/28.
//  Copyright © 2017年 Musjoy. All rights reserved.
//  支持长按弹出菜单的View

#import <UIKit/UIKit.h>
@class MenuView;

//菜单栏要显示的操作类型
typedef NS_ENUM(NSUInteger, MenuViewItemType) {
    MenuViewItemType_Copy = 1 << 0,   //复制
    MenuViewItemType_Save = 1 << 1,   //存储
};

@protocol MenuViewDelegate <NSObject>
@required
/// 返回要显示的操作选项
- (MenuViewItemType)itemTypesForDisplay:(MenuView *)imageView;
@optional
/// 点击了复制
- (void)menuViewClickedCopy:(MenuView *)imageView;
/// 点击了存储
- (void)menuViewClickedSave:(MenuView *)imageView;
@end

@interface MenuView : UIView
@property (nonatomic, weak) id<MenuViewDelegate> delegate; ///< 代理
@end
