//
//  BaseChatCell.m
//  XibInherit
//
//  Created by 刘鹏i on 2019/3/13.
//  Copyright © 2019 wuhan.musjoy. All rights reserved.
//

#import "BaseChatCell.h"

@interface BaseChatCell ()
@property (strong, nonatomic) IBOutlet UIImageView *imgViewHeaderLeft;  ///< 左侧头像
@property (strong, nonatomic) IBOutlet UIImageView *imgViewHeaderRight; ///< 右侧头像
@property (strong, nonatomic) IBOutlet UIImageView *imgViewBubble;      ///< 气泡图片

// 气泡向左的约束 (优先级：940)
@property (nonatomic, strong) NSArray *arrLeftLyt;   ///< 向左约束数组
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *lytLeft_L;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *lytLeft_R;

// 气泡向右的约束 (优先级：950)
@property (nonatomic, strong) NSArray *arrRightLyt;  ///< 向右约束数组
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *lytRight_L;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *lytRight_R;
@end

@implementation BaseChatCell
#pragma mark - Life Circle
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self loadViewFromXib];
        
        // 页面配置
        [self configSuperView];
    }
    return self;
}

/// 加载父类xib
- (void)loadViewFromXib
{
    UINib *nib = [UINib nibWithNibName:NSStringFromClass([BaseChatCell class]) bundle:[NSBundle mainBundle]];
    UIView *contentView = [nib instantiateWithOwner:self options:nil].firstObject;
    [self.contentView addSubview:contentView];
    
    // 添加约束，让内容充满cell
    contentView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[contentView]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(contentView)]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[contentView]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(contentView)]];
}

/// 加载子类xib
- (void)loadChildViewFromXib
{
    // 加载子类xib，将差异化的视图元素，加载到父视图指定区域内
    UINib *nib = [UINib nibWithNibName:NSStringFromClass([self class]) bundle:[NSBundle mainBundle]];
    UIView *contentView = [nib instantiateWithOwner:self options:nil].firstObject;
    [self.viewContent addSubview:contentView];
    
    // 添加约束，让内容充满cell
    contentView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[contentView]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(contentView)]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[contentView]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(contentView)]];
    
    // 做一些处理，其实这些也可以在xib直接设置好
    contentView.backgroundColor = [UIColor clearColor];
    self.viewContent.backgroundColor = [UIColor clearColor];
}

#pragma mark - Subjoin
/// 页面配置
- (void)configSuperView
{    
    // 向左约束数组
    _arrLeftLyt = @[_lytLeft_L, _lytLeft_R];
    // 向右约束数组
    _arrRightLyt = @[_lytRight_L, _lytRight_R];
    
    _viewContent.delegate = self;
}

#pragma mark - Set
/// 气泡左右方向 YES:向左 NO:向右
- (void)setIsLeft:(BOOL)isLeft
{
    _isLeft = isLeft;
    
    _imgViewHeaderLeft.hidden = !isLeft;
    _imgViewHeaderRight.hidden = isLeft;
    
    if (isLeft) {
        // 向左
        _imgViewBubble.image = [UIImage imageNamed:@"chat_bubble_left"];
        [NSLayoutConstraint activateConstraints:_arrLeftLyt];
        [NSLayoutConstraint deactivateConstraints:_arrRightLyt];
    } else {
        // 向右
        _imgViewBubble.image = [UIImage imageNamed:@"chat_bubble_right"];
        [NSLayoutConstraint activateConstraints:_arrRightLyt];
        [NSLayoutConstraint deactivateConstraints:_arrLeftLyt];
    }
}

#pragma mark - MenuViewDelegate
/// 返回要显示的操作选项
- (MenuViewItemType)itemTypesForDisplay:(MenuView *)imageView
{
    //待子类实现
    return 0;
}
@end

