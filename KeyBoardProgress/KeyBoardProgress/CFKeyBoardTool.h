//
//  CFKeyBoardTool.h
//  KeyBoardProgress
//
//  Created by WCF on 2017/7/25.
//  Copyright © 2017年 WCF. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    CFKeyBoardToolItemPrevious,
    CFKeyBoardToolItemNext,
    CFKeyBoardToolItemDone
} CFKeyBoardToolItem;

@class CFKeyBoardTool;
@protocol CFKeyBoardToolDelegate <NSObject>
- (void)keyBoardTool:(CFKeyBoardTool *)tool didClickItem:(CFKeyBoardToolItem)item;
@end

@interface CFKeyBoardTool : UIToolbar
@property (weak, nonatomic,readonly) IBOutlet UIBarButtonItem *PreviousItem;
@property (weak, nonatomic,readonly) IBOutlet UIBarButtonItem *nextItem;

+ (instancetype)toolBar;

@property (nonatomic,weak) id <CFKeyBoardToolDelegate> toolBarDelegate;
@end
