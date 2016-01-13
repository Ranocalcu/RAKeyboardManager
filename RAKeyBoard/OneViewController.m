//
//  NextViewController.m
//  RAKeyBoard
//
//  Created by rano on 15/11/26.
//  Copyright © 2015年 rano. All rights reserved.
//

#import "OneViewController.h"
#import "RAKeyboardManager.h"

@interface OneViewController ()

@property (strong, nonatomic) UITextField *upTextField;
@property (strong, nonatomic) UITextField *downTextField;

@end

@implementation OneViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.upTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 200, 20)];
    self.upTextField.center = CGPointMake(CGRectGetMidX(self.view.bounds), self.view.bounds.size.height - 200);
    self.upTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.upTextField.text = @"upTextField";
    [self.view addSubview:self.upTextField];
    
    self.downTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 200, 20)];
    self.downTextField.center = CGPointMake(CGRectGetMidX(self.view.bounds), self.view.bounds.size.height - 100);
    self.downTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.downTextField.text = @"downTextField";
    [self.view addSubview:self.downTextField];
    
    [[RAKeyboardManager shareManager] addObserveredView:self.upTextField forCoveredView:self.downTextField];
    [[RAKeyboardManager shareManager] addObserveredView:self.downTextField];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
