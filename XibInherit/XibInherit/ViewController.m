//
//  ViewController.m
//  XibInherit
//
//  Created by 刘鹏i on 2019/3/13.
//  Copyright © 2019 wuhan.musjoy. All rights reserved.
//

#import "ViewController.h"
#import "TextChatCell.h"
#import "ImageChatCell.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *arrData;///< 数据源
@end

@implementation ViewController
#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self viewConfig];
    
    [self dataConfig];
}

#pragma mark - Subjoin
- (void)viewConfig
{
    [_tableView registerClass:[TextChatCell class] forCellReuseIdentifier:NSStringFromClass([TextChatCell class])];
    [_tableView registerClass:[ImageChatCell class] forCellReuseIdentifier:NSStringFromClass([ImageChatCell class])];
}

- (void)dataConfig
{
    _arrData = @[@{@"isSender":@"0",
                   @"type":@"text",
                   @"content":@"打算"},
                 @{@"isSender":@"1",
                   @"type":@"text",
                   @"content":@"..."},
                 @{@"isSender":@"0",
                   @"type":@"image",
                   @"content":@"chat_img1"},
                 @{@"isSender":@"1",
                   @"type":@"image",
                   @"content":@"chat_img5"},
                 @{@"isSender":@"1",
                   @"type":@"text",
                   @"content":@"以聊天页面为例（如QQ），里面的每条消息都是一行cell，大致有这几种cell：文字消息行、图片消息行、视频消息行、红包消息行。这些cell都有共同的部分，就是左右的人物头像，以及气泡背景"},
                 @{@"isSender":@"0",
                   @"type":@"text",
                   @"content":@"以聊天页面为例（如QQ），里面的每条消息都是一行cell\n\n大致有这几种cell：文字消息行、图片消息行、视频消息行、红包消息行。"},
                 @{@"isSender":@"0",
                   @"type":@"image",
                   @"content":@"chat_img3"},
                 @{@"isSender":@"1",
                   @"type":@"image",
                   @"content":@"chat_img2"},
                 @{@"isSender":@"1",
                   @"type":@"image",
                   @"content":@"chat_img6"},
                 @{@"isSender":@"0",
                   @"type":@"text",
                   @"content":@"以聊天页面为例（如QQ），里面的每条消息都是一行cell\n\n大致有这几种cell：文字消息行、图片消息行、视频消息行、红包消息行。\n\n以聊天页面为例（如QQ），里面的每条消息都是一行cell\n\n大致有这几种cell：文字消息行、图片消息行、视频消息行、红包消息行。\n\n以聊天页面为例（如QQ），里面的每条消息都是一行cell\n\n大致有这几种cell：文字消息行、图片消息行、视频消息行、红包消息行。"},
                 @{@"isSender":@"1",
                   @"type":@"text",
                   @"content":@" "}];
    
    [_tableView reloadData];
}

#pragma mark - UITableViewDelegate

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _arrData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dict = _arrData[indexPath.row];
    
    NSString *type = dict[@"type"];
    if ([type isEqualToString:@"text"]) {
        // text
        TextChatCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([TextChatCell class]) forIndexPath:indexPath];
        cell.isLeft = [dict[@"isSender"] isEqualToString:@"0"];
        cell.message = dict[@"content"];
        
        cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else {
        // image
        ImageChatCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ImageChatCell class]) forIndexPath:indexPath];
        cell.isLeft = [dict[@"isSender"] isEqualToString:@"0"];
        cell.image = [UIImage imageNamed:dict[@"content"]];
        
        cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}

@end
