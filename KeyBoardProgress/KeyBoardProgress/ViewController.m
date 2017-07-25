//
//  ViewController.m
//  KeyBoardProgress
//
//  Created by WCF on 2017/7/25.
//  Copyright © 2017年 WCF. All rights reserved.
//

#import "ViewController.h"
#import "CFKeyBoardTool.h"

@interface ViewController ()<UITextFieldDelegate,CFKeyBoardToolDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *addressTextField;

@property (nonatomic,strong) NSArray *textFieldArr;
@property (nonatomic,strong) CFKeyBoardTool *toolBar;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.textFieldArr = @[self.nameTextField,self.emailTextField,self.addressTextField];

    // 加载工具条控件
    CFKeyBoardTool *toolBar = [CFKeyBoardTool toolBar];
    toolBar.toolBarDelegate = self;
    self.toolBar = toolBar;

    //设置工具条
    self.nameTextField.inputAccessoryView = self.toolBar;
    self.emailTextField.inputAccessoryView = self.toolBar;
    self.addressTextField.inputAccessoryView = self.toolBar;
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

#pragma mark - CFKeyBoardToolDelegate

- (void)keyBoardTool:(CFKeyBoardTool *)tool didClickItem:(CFKeyBoardToolItem)item
{
    if (item == CFKeyBoardToolItemPrevious) {
        NSUInteger currentIndex = 0;
        for (UIView *view in self.view.subviews) {
            if ([view isFirstResponder]) {
                currentIndex = [self.textFieldArr indexOfObject:view];
            }
        }
        currentIndex--;

        [self.textFieldArr[currentIndex] becomeFirstResponder];

        self.toolBar.PreviousItem.enabled = (currentIndex != 0);
        self.toolBar.nextItem.enabled = YES;

    }
    else if (item == CFKeyBoardToolItemNext) {
        NSUInteger currentIndex = 0;
        for (UIView *view in self.view.subviews) {
            if ([view isFirstResponder]) {
                currentIndex = [self.textFieldArr indexOfObject:view];
            }
        }
        currentIndex++;

        [self.textFieldArr[currentIndex] becomeFirstResponder];

        self.toolBar.PreviousItem.enabled = YES;
        self.toolBar.nextItem.enabled = (currentIndex != (self.textFieldArr.count -1));
    }
    else if (item == CFKeyBoardToolItemDone){
        [self.view endEditing:YES];
    }
}

#pragma mark - <UITextFieldDelegate>
/**
 * 当点击键盘右下角的return key时,就会调用这个方法
 */
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.nameTextField) {
        [self.emailTextField becomeFirstResponder];
    }
    else if (textField == self.emailTextField) {
        [self.addressTextField becomeFirstResponder];
    }
    else if (textField == self.addressTextField) {
        [self.view endEditing:YES];
    }

    return YES;
}

/**
 * 键盘弹出就会调用这个方法
 */
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSUInteger currentIdex = [self.textFieldArr indexOfObject:textField];

    self.toolBar.PreviousItem.enabled = (currentIdex != 0);
    self.toolBar.nextItem.enabled = (currentIdex != (self.textFieldArr.count -1));

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
