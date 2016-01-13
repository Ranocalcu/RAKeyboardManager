//
//  RAKeyboardManager.h
//  RAKeyBoard
//
//  Created by rano on 16/1/12.
//  Copyright © 2016年 rano. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface RAKeyboardManager : NSObject
/**
 * 创建单例
 */
+ (instancetype)shareManager;
/**
 * 开始键盘监听（一般写在application:didFinishLaunchingWithOptions:里）
 */
- (void)startObserver;
/**
 * 取消键盘监听，取消后键盘弹出不做任何处理
 */
- (void)cancelObserver;
/**
 * 监听某个视图
 * prama view         view为触发键盘的第一响应者（UITextField或UITextView）
 */
- (void)addObserveredView:(UIView *)view;
/**
 * 取消某个视图的键盘监听
 * prama view         view为触发键盘的第一响应者（UITextField或UITextView）
 */
- (void)removeObserveredView:(UIView *)view;
/**
 * 监听某个视图
 * prama view         view为触发键盘的第一响应者（UITextField或UITextView）
 * prama coverView    view成为第一响应者后，不希望被遮盖的视图
 */
- (void)addObserveredView:(UIView *)view forCoveredView:(UIView *)coverView;


@end
