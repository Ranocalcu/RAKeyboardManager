//
//  RAKeyboardManager.m
//  RAKeyBoard
//
//  Created by rano on 16/1/12.
//  Copyright © 2016年 rano. All rights reserved.
//

#import "RAKeyboardManager.h"

@interface RAKeyboardManager ()

@property (nonatomic, strong) NSMapTable *weakTable;

@property (nonatomic, weak) UIViewController *vc;
@property (nonatomic, weak) UIView *frWeakView;

@end

@implementation RAKeyboardManager

+ (instancetype)shareManager
{
    static RAKeyboardManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[RAKeyboardManager alloc] init];
    });
    return manager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)dealloc
{
    [self removeObservers];
}

#pragma mark - 监听
- (void)addObservers
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(ra_keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(ra_keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)removeObservers
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

- (void)ra_keyboardWillShow:(NSNotification *)noti
{
    CGFloat duration = [[noti.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    CGRect rect = [[noti.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    UIView *frView = [self frViewFromTable];
    
    if (!frView) {
        return;
    }
    
    CGRect convertedRect = [frView.superview convertRect:frView.frame toView:frView.window];
    
    
    if (rect.origin.y > CGRectGetMaxY(convertedRect)) {
        return;
    }
    
    self.vc = [self viewControllerWithView:frView];
    if (!self.vc) {
        return;
    }
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.vc.view.bounds = CGRectMake(0,self.vc.view.bounds.origin.y + CGRectGetMaxY(convertedRect) - rect.origin.y + 5, self.vc.view.bounds.size.width, self.vc.view.bounds.size.height);
    } completion:^(BOOL finished) {
        
    }];
}

- (void)ra_keyboardWillHide:(NSNotification *)noti
{
    CGFloat duration = [[noti.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    if (!self.vc) {
        return;
    }
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.vc.view.bounds = CGRectMake(0, 0, self.vc.view.bounds.size.width, self.vc.view.bounds.size.height);
    } completion:^(BOOL finished) {
        
    }];
}

//根据某个view获取到这个view所在的视图控制器
- (UIViewController *)viewControllerWithView:(UIView *)view {
    for (UIView* next = [view superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}
//从mapTable中获取被遮盖的视图
- (UIView *)frViewFromTable
{
    UIView *frView = nil;
    NSEnumerator *enmu = [self.weakTable keyEnumerator];
    UIView *v = nil;
    while (v = [enmu nextObject]) {
        if (v.window && [v isFirstResponder]) {
            frView = v;
            self.frWeakView = frView;
            break;
        }
    }
    
    return frView == nil ? self.frWeakView ? [self.weakTable objectForKey:self.frWeakView] : nil : [self.weakTable objectForKey:frView];
}

#pragma mark - private
- (void)addObserveredView:(UIView *)view
{
    if (!view) {
        return;
    }
    [self addObserveredView:view forCoveredView:view];
}

- (void)removeObserveredView:(UIView *)view
{
    if (!view) {
        return;
    }
    [self.weakTable removeObjectForKey:view];
}

- (void)addObserveredView:(UIView *)view forCoveredView:(UIView *)coverView
{
    if (!view) {
        return;
    }
    if (!coverView) {
        coverView = view;
    }
    [self.weakTable setObject:coverView forKey:view];
}


- (void)startObserver
{
    self.weakTable = [NSMapTable mapTableWithKeyOptions:NSPointerFunctionsWeakMemory valueOptions:NSPointerFunctionsWeakMemory];
    [self addObservers];
}

- (void)cancelObserver
{
    self.weakTable = nil;
    [self removeObservers];
}

@end
