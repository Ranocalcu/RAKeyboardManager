//
//  TwoViewController.m
//  RAKeyBoard
//
//  Created by rano on 16/1/13.
//  Copyright © 2016年 rano. All rights reserved.
//

#import "TwoViewController.h"
#import "RAKeyboardManager.h"

@interface TwoViewController ()

@property (nonatomic, strong) UITextField *textField;

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 200, 20)];
    self.textField.center = CGPointMake(CGRectGetMidX(self.view.bounds), self.view.bounds.size.height - 200);
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    self.textField.text = @"TextField";
    [self.view addSubview:self.textField];
    
    [[RAKeyboardManager shareManager] addObserveredView:self.textField];
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
