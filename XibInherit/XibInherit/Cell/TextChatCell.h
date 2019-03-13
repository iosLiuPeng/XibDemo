//
//  TextChatCell.h
//  XibInherit
//
//  Created by 刘鹏i on 2019/3/13.
//  Copyright © 2019 wuhan.musjoy. All rights reserved.
//

#import "BaseChatCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface TextChatCell : BaseChatCell
@property (nonatomic, copy) NSString *message;  ///< 聊天信息
@end

NS_ASSUME_NONNULL_END
