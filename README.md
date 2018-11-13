# KeyboardProcess
键盘处理

屏幕截图
![image](https://github.com/ziyilixin/KeyboardProcess/blob/master/KeyBoardProgress/KeyBoardProgress/1.gif?raw=true)

## 代码实现
```objc
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
```
