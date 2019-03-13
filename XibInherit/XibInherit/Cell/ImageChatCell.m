//
//  ImageChatCell.m
//  XibInherit
//
//  Created by 刘鹏i on 2019/3/13.
//  Copyright © 2019 wuhan.musjoy. All rights reserved.
//

#import "ImageChatCell.h"

@interface ImageChatCell ()
@property (strong, nonatomic) IBOutlet UIImageView *viewImage;            ///< 聊天图片
@property (nonatomic, strong) NSLayoutConstraint *lytImageViewMultiplier; ///< 图片比例约束
@end

@implementation ImageChatCell
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
    _viewImage.layer.cornerRadius = 10;
    _viewImage.clipsToBounds = YES;
}

#pragma mark - Set
- (void)setImage:(UIImage *)image
{
    _image = image;
    
    _viewImage.image = image;
    
    if (image) {
        if (_lytImageViewMultiplier) {
            // 移除之前的约束
            [_viewImage removeConstraint:_lytImageViewMultiplier];
            _lytImageViewMultiplier = nil;
        }
        // 创建约束
        CGFloat multiplier = _image.size.width / _image.size.height;
        
        _lytImageViewMultiplier = [NSLayoutConstraint constraintWithItem:_viewImage attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:_viewImage attribute:NSLayoutAttributeHeight multiplier:multiplier constant:0];
        _lytImageViewMultiplier.priority = 751.0;
        // 添加约束
        [_viewImage addConstraint:_lytImageViewMultiplier];
    }
}

#pragma mark - MenuViewDelegate
/// 返回要显示的操作选项
- (MenuViewItemType)itemTypesForDisplay:(MenuView *)imageView
{
    return  MenuViewItemType_Copy | MenuViewItemType_Save;
}

/// 点击了复制
- (void)menuViewClickedCopy:(MenuView *)imageView
{
    
}

/// 点击了存储
- (void)menuViewClickedSave:(MenuView *)imageView
{
    
}
@end
