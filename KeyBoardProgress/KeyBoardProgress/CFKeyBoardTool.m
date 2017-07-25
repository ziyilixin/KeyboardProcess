//
//  CFKeyBoardTool.m
//  KeyBoardProgress
//
//  Created by WCF on 2017/7/25.
//  Copyright © 2017年 WCF. All rights reserved.
//

#import "CFKeyBoardTool.h"

@implementation CFKeyBoardTool
+ (instancetype)toolBar
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] firstObject];
}

- (IBAction)previousItem:(id)sender {
    if ([self.toolBarDelegate respondsToSelector:@selector(keyBoardTool:didClickItem:)]) {
        [self.toolBarDelegate keyBoardTool:self didClickItem:CFKeyBoardToolItemPrevious];
    }
}

- (IBAction)nextItem:(id)sender {
    if ([self.toolBarDelegate respondsToSelector:@selector(keyBoardTool:didClickItem:)]) {
        [self.toolBarDelegate keyBoardTool:self didClickItem:CFKeyBoardToolItemNext];
    }
}

- (IBAction)doneItem:(id)sender {
    if ([self.toolBarDelegate respondsToSelector:@selector(keyBoardTool:didClickItem:)]) {
        [self.toolBarDelegate keyBoardTool:self didClickItem:CFKeyBoardToolItemDone];
    }
}

@end
