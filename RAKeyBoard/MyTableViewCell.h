//
//  MyTableViewCell.h
//  RAKeyBoard
//
//  Created by rano on 16/1/12.
//  Copyright © 2016年 rano. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTableViewCell : UITableViewCell

@property (nonatomic, strong) UITextField *tf;

- (void)configWithIndexPath:(NSIndexPath *)indexPath;

@end
