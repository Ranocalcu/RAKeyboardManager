//
//  NextViewController.m
//  RAKeyBoard
//
//  Created by rano on 15/11/26.
//  Copyright © 2015年 rano. All rights reserved.
//

#import "OneViewController.h"
#import "RAKeyboardManager.h"
#import "TwoViewController.h"

@interface OneViewController ()

@property (strong, nonatomic) UITextField *upTextField;
@property (strong, nonatomic) UITextField *downTextField;

@end

@implementation OneViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(0, 0, 100, 50);
    btn.center = CGPointMake(CGRectGetMidX(self.view.bounds), 300);
    [btn setTitle:@"Push" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(pushAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    self.upTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 200, 20)];
    self.upTextField.center = CGPointMake(CGRectGetMidX(self.view.bounds), self.view.bounds.size.height - 200);
    self.upTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.upTextField.text = @"upTextField";
    self.upTextField.returnKeyType = UIReturnKeyNext;
    [self.upTextField addTarget:self action:@selector(next) forControlEvents:UIControlEventEditingDidEndOnExit];
    [self.view addSubview:self.upTextField];
    
    self.downTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 200, 20)];
    self.downTextField.center = CGPointMake(CGRectGetMidX(self.view.bounds), self.view.bounds.size.height - 150);
    self.downTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.downTextField.text = @"downTextField";
    [self.view addSubview:self.downTextField];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 20)];
    label.center = CGPointMake(CGRectGetMidX(self.view.bounds), self.view.bounds.size.height - 100);
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"标识";
    [self.view addSubview:label];
    
    [[RAKeyboardManager shareManager] addObserveredView:self.upTextField];
    [[RAKeyboardManager shareManager] addObserveredView:self.downTextField forCoveredView:label];
}

- (void)next
{
    [self.downTextField becomeFirstResponder];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)pushAction
{
    TwoViewController *vc = [[TwoViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
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
